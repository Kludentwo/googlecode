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
#include "CDU.h"


_CONFIG1(JTAGEN_OFF & GCP_OFF & GWRP_OFF & COE_OFF & FWDTEN_OFF & ICS_PGx2)
_CONFIG2(FCKSM_CSDCMD & OSCIOFNC_OFF & POSCMOD_XT & FNOSC_PRI)
/*========================================================================
                                DEFINES
========================================================================*/
// Pre defines for project
#define     NUMBEROFSENSORS 15
#define     COUNTTOMSG      10000
// Function Codes:
#define     GETINFO         0b0001
#define     GETDATA         0b0010


// Sensor array
Sensor sensorarray[NUMBEROFSENSORS];
// flag array
Cduflags CDUFlags;

// String arrays
unsigned char message[(2 * MESSAGELENGTH)] = {0};
unsigned char response[RESPONSELENGTH] = {0};
// alive array
unsigned char alive[NUMBEROFSENSORS] = {0};
// Screen Display
unsigned char line1array[16] = {'0'};
unsigned char line2array[16] = {'0'};

// Counters
unsigned int loopcounter = 0;
unsigned int recvcounter = 0;
unsigned char waitclock = 0;
unsigned int addresscounter = 0;
unsigned int maincounter = 0;



/*========================================================================
                            MAIN
========================================================================*/
int main(int argc, char** argv) {
    // INIT
    OSCCON = 0x2200; //select Primary Oscillator, External XL
    CLKDIV = 0x0000; //do not divide 
	

    RCONbits.SWDTEN = 0; // Disable watchdog
	initLCD();
	CDUInit();
    InitCDUFlags(&CDUFlags);
    InitSensorArray(sensorarray);

	unsigned int errorcount = 0;
    unsigned int error = 0;
    unsigned int startupcounter = 0;
    unsigned int startupcounter2 = 0;
	
    while (startupcounter2 < 4) {
        startupcounter++;
        if (startupcounter == 50000)
            startupcounter2++;
    }

    //Main Program Loop, Loop forever
    while (1) {
        CDUSend(&(sensorarray[0]), GETDATA, message, &CDUFlags);
        error = CDUReceive(&(sensorarray[0]), GETDATA, response, &CDUFlags);
        if (error == 0) {
            errorcount += 1;
        }
        //        CDUSend(&(sensorarray[1]), GETINFO, message, &CDUFlags);
        //        error = CDUReceive(&(sensorarray[1]), GETINFO, response, &CDUFlags);
        //        if (error == 0) {
        //            errorcount += 1;
        //        }
        //errorcount += sensorarray[0].Errors;
        /*for(l2cnt = 0; l2cnt < LCD_DISPLAY_LEN; l2cnt++)
        {
            if( ((sensorarray[0].Data>>l2cnt) & 1) == 1 )
            {
                line2array[15-l2cnt] = '1';
            }
            else
            {
                line2array[15-l2cnt] = '0';
            }
        }*/
        //sensorarray[0].Data += 1;
        itoa(line2array, sensorarray[0].Data, 10);

        LCDwriteLine(LCD_LINE1, line1array);
        LCDwriteLine(LCD_LINE1, "temperature is: ");
        LCDwriteLine(LCD_LINE2, line2array);

        Save(&addresscounter, &(sensorarray[0]));
        UARTPutChar('C');
        CDUPCCom();
    }
    return (EXIT_SUCCESS);
}

/*========================================================================
                            INTERRUPT ROUTINE
========================================================================*/
//_T1Interrupt() is the T1 interrupt service routine (ISR).
void __attribute__((__interrupt__)) _T1Interrupt(void);

void __attribute__((__interrupt__, auto_psv)) _T1Interrupt(void) {
    maincounter++;
    if (maincounter == COUNTTOMSG) {
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

