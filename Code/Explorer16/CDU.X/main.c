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
/*
 * 
 */
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


// Sensor array
Sensor sensorarray[NUMBEROFSENSORS];

// String arrays
unsigned char message[(2 * MESSAGELENGTH)] = {0};
unsigned char response[RESPONSELENGTH] = {0};

// alive array
unsigned char alive[NUMBEROFSENSORS] = {0};

// Flags
unsigned char comflag = 0;
unsigned char msgflag = 0;
unsigned char clk_flag = 0;
unsigned char recvflag = 0;

// Counters
unsigned int loopcounter = 0;
unsigned int outcounter = 0;
unsigned int recvcounter = 0;
unsigned char waitclock = 0;
unsigned int addresscounter = 0;

/*========================================================================
                        FUNCTION DEFINITIONS
========================================================================*/
void TimerInit(void);
void IntegerToBinary(unsigned char input, unsigned char size, unsigned char* outputbuffer);
void PatMessage(unsigned char addr, unsigned char functioncode, unsigned char* outputbuffer);
void ToManchester(unsigned char* inputbuffer, unsigned char* outputbuffer, unsigned char* msgflag);
void InitSensorArray(struct Sensor* sensorarray);
void CDUStartUpRoutine(struct Sensor* sensorarray, unsigned char* alive, unsigned char* Messagebuffer, unsigned char* receivebuffer, unsigned char* msgflag, unsigned char* comflag, unsigned char* receiveflag);
void CDUSendStartUp(unsigned char Address, unsigned char* Messagebuffer, unsigned char* msgflag, unsigned char* comflag);
void CDUSendRunning(struct Sensor* Sens, unsigned char* Messagebuffer, unsigned char* msgflag, unsigned char* comflag);
unsigned char CDUReceive(struct Sensor* Sens, unsigned char* receivebuffer);
void CDUPCCom(void);

/*========================================================================
                            MAIN
========================================================================*/
int main(int argc, char** argv) {
    // INIT
    OSCCON = 0x22C0; //select Primary Oscillator, External XL
    CLKDIV = 0x0000; //do not divide 

    RCONbits.SWDTEN = 0; // Disable watchdog 

    TRISA = 0x0010; //configure (RA4 = Inputs, Rest = output)
    TRISB = 0x0000; //configure all PortB as output
    TRISD = 0x0000; //configure all PortD
    TRISF = 0x0010; //configure F4 = Input, Rest = output


    AD1PCFG = 0xFFFF; //set to all digital I/O

    initLCD();
    TimerInit();
    InitMemory();
    UARTInit();

    InitSensorArray(sensorarray);
    CDUStartUpRoutine(sensorarray, alive, message, response, &msgflag, &comflag, &recvflag);
    alive[2];
    alive[3];
    
    //Main Program Loop, Loop forever
    while (1) {
        _RA7 = ~(_RA7);
    }
    return (EXIT_SUCCESS);
}

void TimerInit(void) {
    //set to (2^13), since 32.768kHz / 2^13 = 4, toggles at 2Hz
    PR1 = 0x00C8; // C8 = 200, 64 = 100, 190 = 400
    IPC0bits.T1IP = 5; //set interrupt priority
    T1CON = 0b1000000000000000; //turn on the timer
    IFS0bits.T1IF = 0; //reset interrupt flag
    IEC0bits.T1IE = 1; //turn on the timer1 interrupt
}

void IntegerToBinary(unsigned char input, unsigned char size, unsigned char* outputbuffer) {
    /*
     * outputbuffer is supposed to be defined big enough to store the value
     * following line of code may be an inspiration
     * "char mask[8*sizeof(unsigned int) + 1] = {0};"
     */
    unsigned int j;
    for (j = 0; j < (size); j++) {
        outputbuffer[j] = (input << j) & (1 << (size - 1)) ? '1' : '0';
    }

}

void PatMessage(unsigned char addr, unsigned char functioncode, unsigned char* outputbuffer) {
    unsigned char tempbuf[4];
    unsigned int j;
    IntegerToBinary(STARTCODE, 4, tempbuf);
    for (j = 0; j < 4; j++) {
        outputbuffer[j] = tempbuf[j];
    }
    IntegerToBinary(addr, 4, tempbuf);
    for (j = 0; j < 4; j++) {
        outputbuffer[j + 4] = tempbuf[j];
    }
    IntegerToBinary(functioncode, 4, tempbuf);
    for (j = 0; j < 4; j++) {
        outputbuffer[j + 8] = tempbuf[j];
    }
}

void ToManchester(unsigned char* inputbuffer, unsigned char* outputbuffer, unsigned char* msgflag) {
    unsigned int bitcount = 0;
    unsigned int counter = 0;
    unsigned int j;

    (*msgflag) = 0;

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
    (*msgflag) = 1;
}

void InitSensorArray(struct Sensor* sensorarray) {
    unsigned char addresscounter = 0;

    for (addresscounter = 0; addresscounter <= NUMBEROFSENSORS; addresscounter++) {
        InitSensorMem(&(sensorarray[addresscounter]));
        sensorarray[addresscounter].Address = (addresscounter + 1);
    }
}

void CDUStartUpRoutine(struct Sensor* sensorarray, unsigned char* alive, unsigned char* Messagebuffer, unsigned char* receivebuffer, unsigned char* msgflag, unsigned char* comflag, unsigned char* receiveflag) {
    unsigned char addresscounter = 0;
    for (addresscounter = 0; addresscounter <= NUMBEROFSENSORS; addresscounter++) {
        CDUSendStartUp(addresscounter, Messagebuffer, msgflag, comflag);
        while ((*receiveflag) == 0);
        alive[addresscounter] = CDUReceive(&(sensorarray[addresscounter]), receivebuffer);
    }
}

void CDUSendStartUp(unsigned char Address, unsigned char* Messagebuffer, unsigned char* msgflag, unsigned char* comflag) {
    unsigned char string[MESSAGELENGTH] = {0};
    PatMessage(Address, GETINFO, string);
    ToManchester(string, Messagebuffer, msgflag);
    (*comflag) = 1;
}

void CDUSendRunning(struct Sensor* Sens, unsigned char* Messagebuffer, unsigned char* msgflag, unsigned char* comflag) {
    unsigned char string[MESSAGELENGTH] = {0};
    PatMessage(Sens->Address, GETDATA, string);
    ToManchester(string, Messagebuffer, msgflag);
    (*comflag) = 1;
}

unsigned char CDUReceive(struct Sensor* Sens, unsigned char* receivebuffer) {
    unsigned char datacnt = 0;
    unsigned char FunctioncodeHolder = 0;
    unsigned char AddressHolder = 0;
    unsigned char dummy = 0;

    for (datacnt = 23; datacnt >= 0; datacnt--) {
        if (datacnt > 19 && datacnt < 24) {
            AddressHolder |= receivebuffer[datacnt] << (23 - datacnt);
        }
        if (datacnt > 15 && datacnt < 20) {
            FunctioncodeHolder |= receivebuffer[datacnt] << (19 - datacnt);
        }
        if (AddressHolder == Sens->Address && FunctioncodeHolder == GETINFO) {
            if (datacnt > 11 && datacnt < 16) {
                Sens->Errors |= receivebuffer[datacnt] << (15 - datacnt);
            }
            if (datacnt > 7 && datacnt < 12) {
                Sens->Type |= receivebuffer[datacnt] << (11 - datacnt);
            }
            if (datacnt < 8) {
                dummy |= receivebuffer[datacnt] << (7 - datacnt);
            }
        }
        if (AddressHolder == Sens->Address && FunctioncodeHolder == GETDATA) {
            if (datacnt > 11 && datacnt < 16) {
                Sens->Errors |= receivebuffer[datacnt] << (15 - datacnt);
            }
            if (datacnt < 12) {
                Sens->Data |= receivebuffer[datacnt] << (11 - datacnt);
            }
        }
        if (FunctioncodeHolder == 0) {
            return 0;
        }
    }
    return 1;
}

/*========================================================================
                            INTERRUPT ROUTINE
========================================================================*/
//_T1Interrupt() is the T1 interrupt service routine (ISR).
void __attribute__((__interrupt__)) _T1Interrupt(void);

void __attribute__((__interrupt__, auto_psv)) _T1Interrupt(void) {
    /*
     * Receive part
     */
    if (recvcounter > 0 && waitclock == 0) {
        response[recvcounter - 1] = PORTAbits.RA4; // Recieve from BUS
        recvcounter--;
        if (recvcounter == 1) {
            recvflag = 1; // Recieve Complete
        }
    }
    if (waitclock != 0) {
        waitclock--; // Compensate for delay
    }
    /*
     * 10 kHz Clock Part
     */
    if (comflag == 0) {
        if (clk_flag == 0) {
            clk_flag = 1;
            LATBbits.LATB7 = clk_flag;
        } else {
            clk_flag = 0;
            LATBbits.LATB7 = clk_flag;
        }
    }
    /*
     * Communication Part
     */
    if (comflag == 1 && msgflag == 1) {
        if (message[loopcounter] == 0x01)
            LATBbits.LATB7 = 1;
        else
            LATBbits.LATB7 = 0;

        loopcounter++;
    }
    if (loopcounter == (2 * MESSAGELENGTH)) {
        loopcounter = 0;
        comflag = 0;
        recvcounter = 24;
        waitclock = 1;
    }


    IFS0bits.T1IF = 0;
}

