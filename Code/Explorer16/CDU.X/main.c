/* 
 * File:   main.c
 * Author: Nicolai
 *
 * Created on 2. april 2014, 11:11
 */
/*========================================================================
                                INCLUDES
========================================================================*/
#include <stdio.h>
#include <stdlib.h>
#include <p24Fxxxx.h>
#include "lcd.h"
#include "MemCtl.h"
#include "uart.h"

_CONFIG1(JTAGEN_OFF & GCP_OFF & GWRP_OFF & COE_OFF & FWDTEN_OFF & ICS_PGx2)
_CONFIG2(FCKSM_CSDCMD & OSCIOFNC_OFF & POSCMOD_XT & FNOSC_PRI)
/*========================================================================
                                DEFINES
========================================================================*/
// Pre defines for project
#define     MESSAGELENGTH   12
#define     STARTCODE       0b0110
#define     RESPONSELENGTH   24
#define     NUMBEROFSENSORS 15
// Function Codes:
#define     GETINFO         0b0001
#define     GETDATA         0b0010


typedef struct cduflags {
    unsigned char comflag;
    unsigned char msgflag;
    unsigned char clk_flag;
    unsigned char recvflag;
    unsigned char enableflag;
} Cduflags;

// Sensor array
Sensor sensorarray[NUMBEROFSENSORS];
// flag array
Cduflags CDUFlags;

// String arrays
unsigned char message[(2 * MESSAGELENGTH)] = {0};
unsigned char response[RESPONSELENGTH] = {0};
unsigned char testresponse[RESPONSELENGTH] = {1, 0, 1, 0, 0, 1, 0, 1, 0, 0,
0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0};
unsigned char display[16] = {0};
// alive array
unsigned char alive[NUMBEROFSENSORS] = {0};

// Counters
unsigned int loopcounter = 0;
unsigned int recvcounter = 0;
unsigned char waitclock = 0;
unsigned int addresscounter = 0;
unsigned int maincounter = 0;
unsigned int errorcount = 0;
unsigned int error = 0;
unsigned int startupcounter = 0;
unsigned int startupcounter2 = 0;

/*========================================================================
                        FUNCTION DEFINITIONS
========================================================================*/
void IntegerToBinary(unsigned char input, unsigned char size, unsigned char* outputbuffer);
void PatMessage(unsigned char addr, unsigned char functioncode, unsigned char* outputbuffer);
void ToManchester(unsigned char* inputbuffer, unsigned char* outputbuffer, Cduflags* CDUFlags);
void InitSensorArray(Sensor* sensorarray);
void InitCDUFlags(Cduflags* CDUFlags);
void CDUInit(void);
void CDUStartUpRoutine(Sensor* sensorarray, unsigned char* alive, unsigned char* Messagebuffer, unsigned char* receivebuffer, Cduflags* CDUFlags);
void CDUSend(Sensor* Sens, unsigned char functioncode, unsigned char* Messagebuffer, Cduflags* CDUFlags);
unsigned char CDUReceive(Sensor* Sens, unsigned char functioncode, unsigned char* receivebuffer, Cduflags* CDUFlags);
void CDUPCCom(void);

/*========================================================================
                            MAIN
========================================================================*/
int main(int argc, char** argv) {
    // INIT
    OSCCON = 0x2200; //select Primary Oscillator, External XL
    CLKDIV = 0x0000; //do not divide 

    RCONbits.SWDTEN = 0; // Disable watchdog

    TRISA = 0x0090; //configure (RA4 = Inputs, Rest = output)


    AD1PCFG = 0xFFFF; //set to all digital I/O
	
    
	
    initLCD();

    PR1 = 0x00C8; // C8 = 200, 64 = 100, 190 = 400
    IPC0bits.T1IP = 5; //set interrupt priority
    T1CONbits.TON = 1;; //turn on the timer
    IFS0bits.T1IF = 0; //reset interrupt flag
    IEC0bits.T1IE = 1; //turn on the timer1 interrupt
    
    InitCDUFlags(&CDUFlags);
    InitSensorArray(sensorarray);
    InitMemory();
    UARTInit();
	
	// INIT END (to be wrapped into function).

    while (startupcounter2 < 4) {
        startupcounter++;
        if (startupcounter == 50000)
            startupcounter2++;
    }

    writeString("STARTUP DONE");
    writeString("\r\n");
  
    //Main Program Loop, Loop forever
    while (1) {
        CDUSend(&(sensorarray[0]), GETINFO, message, &CDUFlags);
        error = CDUReceive(&(sensorarray[0]), GETINFO, response, &CDUFlags);
        if (error == 0) {
            errorcount += 1;
        }
//        CDUSend(&(sensorarray[1]), GETINFO, message, &CDUFlags);
//        error = CDUReceive(&(sensorarray[1]), GETINFO, response, &CDUFlags);
//        if (error == 0) {
//            errorcount += 1;
//        }
        //errorcount += sensorarray[0].Errors;
        IntegerToBinary(errorcount, 8, display);
        writeString(display);
        //putLCD(sensorarray[0].Errors + 0x30);
        writeString("\r\n");
        sensorarray[0].Data += 1;
        Save(&addresscounter,&(sensorarray[0]));
        UARTPutChar('C');
        CDUPCCom();
    }
    return (EXIT_SUCCESS);
}

void IntegerToBinary(unsigned char input, unsigned char size, unsigned char* outputbuffer) {
	unsigned char sizevar = 0;
	if(size > 8){
		sizevar = 8;
	}
	else
	{
		sizevar = size;
	}
    unsigned int j;
    for (j = 0; j < (sizevar); j++) {
        outputbuffer[j] = (input << j) & (1 << (sizevar - 1)) ? '1' : '0';
    }

}

void PatMessage(unsigned char addr, unsigned char functioncode, unsigned char* outputbuffer) {
    unsigned char tempbuf[4];
    unsigned int j;
	unsigned char addrvar = 0;
	unsigned char functioncodevar = 0;
    if( (addr > 15) || ( functioncode > 15 ) )
    {
		addrvar = 0; // this will lead to an error after receiving!
		functioncodevar = 0; //
    }
	else
	{
		addrvar = addr;
		functioncodevar = functioncode;
	}
    IntegerToBinary(STARTCODE, 4, tempbuf);
    for (j = 0; j < 4; j++) {
        outputbuffer[j] = tempbuf[j];
    }
    IntegerToBinary(addrvar, 4, tempbuf);
    for (j = 0; j < 4; j++) {
        outputbuffer[j + 4] = tempbuf[j];
    }
    IntegerToBinary(functioncodevar, 4, tempbuf);
    for (j = 0; j < 4; j++) {
        outputbuffer[j + 8] = tempbuf[j];
    }
}

void ToManchester(unsigned char* inputbuffer, unsigned char* outputbuffer, Cduflags* CDUFlags) {
    unsigned int bitcount = 0;
    unsigned int counter = 0;
    unsigned int j;

    CDUFlags->msgflag = 0;

    for (j = 0; j < (2 * MESSAGELENGTH); j++) {
        if (bitcount == 2) {
            counter++;
            bitcount = 0;
        }
        if (inputbuffer[counter] == '0') {
            if (bitcount == 1) {
                outputbuffer[j] = 1;
                bitcount = 2;
            }
            if (bitcount == 0) {
                outputbuffer[j] = 0;
                bitcount = 1;
            }
        }
        if (inputbuffer[counter] == '1') {
            if (bitcount == 1) {
                outputbuffer[j] = 0;
                bitcount = 2;
            }
            if (bitcount == 0) {
                outputbuffer[j] = 1;
                bitcount = 1;
            }
        }
        if (counter == MESSAGELENGTH) {
            counter = 0;
        }
    }
    CDUFlags->msgflag = 1;
}

void InitSensorArray(Sensor* sensorarray) {
    unsigned char addresscounter = 0;

    for (addresscounter = 0; addresscounter <= NUMBEROFSENSORS; addresscounter++) {
        InitSensorMem(&(sensorarray[addresscounter]));
        sensorarray[addresscounter].Address = (addresscounter + 1);
    }
}

void InitCDUFlags(Cduflags* CDUFlags) {
    CDUFlags->clk_flag = 0;
    CDUFlags->comflag = 0;
    CDUFlags->enableflag = 0;
    CDUFlags->msgflag = 0;
    CDUFlags->recvflag = 0;
}

void CDUStartUpRoutine(Sensor* sensorarray, unsigned char* alive, unsigned char* Messagebuffer, unsigned char* receivebuffer, Cduflags* CDUFlags) {
    unsigned char addresscounter = 0;
    for (addresscounter = 0; addresscounter <= NUMBEROFSENSORS; addresscounter++) {
       CDUSend(&(sensorarray[addresscounter]), GETINFO, Messagebuffer, CDUFlags);
        alive[addresscounter] = CDUReceive(&(sensorarray[addresscounter]), GETINFO, receivebuffer, CDUFlags);
    }
}

void CDUSend(Sensor* Sens, unsigned char functioncode, unsigned char* Messagebuffer, Cduflags* CDUFlags) {
    if (functioncode > 15)
    {
        return;
    }
    while (!CDUFlags->enableflag);
    CDUFlags->enableflag = 0;
    unsigned char string[MESSAGELENGTH] = {0};
    PatMessage(Sens->Address, functioncode, string);
    ToManchester(string, Messagebuffer, CDUFlags);
    CDUFlags->comflag = 1;
}

unsigned char CDUReceive(Sensor* Sens, unsigned char functioncode, unsigned char* receivebuffer, Cduflags* CDUFlags) {
    unsigned char datacnt = 0;
    unsigned char FunctioncodeHolder = 0;
    unsigned char AddressHolder = 0;
    unsigned char dummy = 0;
    unsigned char reset = 0;
    if (functioncode > 15)
    {
        return 2;
    }
    while (!(CDUFlags->recvflag));
    CDUFlags->recvflag = 0;
    for (datacnt = 23; datacnt >= 0 && datacnt < 24; datacnt--) {
        if (datacnt > 19 && datacnt < 24) {
            AddressHolder |= (receivebuffer[datacnt] << (datacnt - 20));
        }
        if (datacnt > 15 && datacnt < 20) {
            FunctioncodeHolder |= (receivebuffer[datacnt] << (datacnt - 16));
        }
        if ((datacnt == 15) && (FunctioncodeHolder != functioncode) && (AddressHolder != Sens->Address)) {
            return 0;
        }
        if (AddressHolder == Sens->Address && FunctioncodeHolder == GETINFO) {
            if (reset == 0) {
                Sens->Data = 0;
                Sens->Errors = 0;
                reset = 1;
            }
            if (datacnt > 11 && datacnt < 16) {
                Sens->Errors |= (receivebuffer[datacnt] << (datacnt - 12));
            }
            if (datacnt > 7 && datacnt < 12) {
                Sens->Type |= (receivebuffer[datacnt] << (datacnt - 8));
            }
            if (datacnt < 8) {
                dummy |= (receivebuffer[datacnt] << (datacnt));
            }
        }
        if (AddressHolder == Sens->Address && FunctioncodeHolder == GETDATA) {
            if (reset == 0) {
                Sens->Data = 0;
                Sens->Errors = 0;
                reset = 1;
            }
            if (datacnt > 11 && datacnt < 16) {
                Sens->Errors |= (receivebuffer[datacnt] << (datacnt - 12));
            }
            if (datacnt < 12) {
                Sens->Data |= (receivebuffer[datacnt] << (datacnt));
            }
        }
    }
    return 1;
}

void CDUPCCom(void)
{
    unsigned int memcnt = 0;
    unsigned char msg = 0;
    Sensor output;
    if(_RA7 != 0)
    {
        UARTPutChar('N');
        return;
    }
    UARTPutChar('F');
    msg = UARTGetChar();
    if(msg == 'A')
    {
        T1CONbits.TON = 0;
        for(memcnt = 0; memcnt < 700; memcnt++)
        {
            //4681
            Load( (memcnt*7), &output);
            UARTPutChar(output.Address);
            UARTPutChar(output.Data >> 8);
            UARTPutChar(output.Data);
            UARTPutChar(output.Year);
            UARTPutChar(output.Month);
            UARTPutChar(output.Day);
            UARTPutChar(output.Hour);
            UARTPutChar(output.Minute);
            UARTPutChar(output.Type);
            UARTPutChar(output.Errors);
            UARTPutChar(',');
           // UARTPutChar('\n');
        }
        T1CONbits.TON = 1;

    }
    else
    {
        UARTSendString("unknown cmd");
    }
}

/*========================================================================
                            INTERRUPT ROUTINE
========================================================================*/
//_T1Interrupt() is the T1 interrupt service routine (ISR).
void __attribute__((__interrupt__)) _T1Interrupt(void);

void __attribute__((__interrupt__, auto_psv)) _T1Interrupt(void) {
    maincounter++;
    if (maincounter == 2000) {
        maincounter = 0;
        CDUFlags.enableflag = 1;
    }
    /*
     * 10 kHz Clock Part
     */
    if (CDUFlags.clk_flag == 0) {
        CDUFlags.clk_flag = 1;
        if (CDUFlags.comflag == 0) {
            LATAbits.LATA5 = CDUFlags.clk_flag;
        }
    } else {
        CDUFlags.clk_flag = 0;
        if (CDUFlags.comflag == 0) {
            LATAbits.LATA5 = CDUFlags.clk_flag;
        }
    }
    /*
     * Receive part
     */
    if (recvcounter > 0 && waitclock == 0) {
        recvcounter--;
        response[recvcounter] = PORTAbits.RA4; // Recieve from BUS
        if (recvcounter == 0) {
            CDUFlags.recvflag = 1; // Recieve Complete
        }
    }
    if (waitclock != 0) {
        waitclock--; // Compensate for delay
    }
    /*
     * Communication Part
     */
    if (CDUFlags.comflag == 1 && CDUFlags.msgflag == 1) {
        if (message[loopcounter] == 0x01)
            LATAbits.LATA5 = 0;
        else
            LATAbits.LATA5 = 1;

        loopcounter++;
    }
    if (loopcounter == (2 * MESSAGELENGTH)) {
        loopcounter = 0;
        CDUFlags.comflag = 0;
        recvcounter = 24;
        waitclock = 1;
    }


    IFS0bits.T1IF = 0;
}

