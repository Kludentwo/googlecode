/* 
 * File:   main.c
 * Author: Nicolai
 *
 * Created on 2. april 2014, 11:11
 */

#include <stdio.h>
#include <stdlib.h>
#include <p24Fxxxx.h>
#include "lcd.h"


_CONFIG1(JTAGEN_OFF & GCP_OFF & GWRP_OFF & COE_OFF & FWDTEN_OFF & ICS_PGx2)
_CONFIG2(FCKSM_CSDCMD & OSCIOFNC_OFF & POSCMOD_XT & FNOSC_PRI)
/*
 * 
 */
// Pre defines for project
#define     MESSAGELENGTH   12
#define     STARTCODE       0b0110
#define     RESPONSELENGTH   24
// Function Codes:
#define     GETINFO         0b0001
#define     GETDATA         0b0010


// Used by communication ISR
int com = 0;
char message[(2 * MESSAGELENGTH)] = {0};
char string[MESSAGELENGTH] = {0};
char response[RESPONSELENGTH] = {0};
char dispchar[16] = {0};
int push = 0;
int loopcounter = 0;
int outcounter = 0;
int testcounter = 0;
int recv = 0;
int recvcounter = 0;
int datacnt = 0;
char outputtoscrn = 0;
char data[16] = {0};
char waitclock = 0;
int msgflag = 0;
unsigned int maincounter = 0;
unsigned int maincounter2 = 0;

int clk_flag = 0;

//prototypes
void TimerInit(void);
void IntegerToBinary(char input, char size, char* outputbuffer);
void PatMessage(char addr, char functioncode, char* outputbuffer);
void ToManchester(char* inputbuffer, char* outputbuffer);

int main(int argc, char** argv) {
    OSCCON = 0x22C0; //select Primary Oscillator, External XL
    CLKDIV = 0x0000; //do not divide //Set up I/O Port
    AD1PCFG = 0xFFFF; //set to all digital I/O
    TRISB = 0x0000; //configure all PortB as output, RB6 as input
    TRISA = 0x009F;
    TRISD = 0xFFFF;
    initLCD();
    PatMessage(1, GETINFO, string);
    ToManchester(string, message);
    msgflag = 1;
    writeString("init");
    writeString("\r\n");
    TimerInit();


    //Main Program Loop, Loop forever
    while (1) {
        /*
        if((!(_RD7)) && push == 0);
        {
            msgflag = 0;
            PatMessage(1,GETINFO,string);
            ToManchester(string,message);
            msgflag = 1;
            push = 1;
            _LATA0 = 1;
        }
        if((!(_RA7)) && push == 0);
        {
            msgflag = 0;
            PatMessage(1,GETDATA,string);
            ToManchester(string,message);
            msgflag = 1;
            push = 1;
            _LATA1 = 1;
        }
        if((!(_RD6)) && push == 1)
        {
            push = 0;
            _LATA2 = 1;
        }*/
        maincounter++;
        if (maincounter == 50000) {
            maincounter = 0;
            maincounter2++;
            if (maincounter2 == 3) {
                maincounter2 = 0;

                if (push == 0) {
                    PatMessage(1, GETDATA, string);
                    msgflag = 0;
                    ToManchester(string, message);
                    msgflag = 1;
                    push = 1;
                } else {
                    PatMessage(1, GETINFO, string);
                    msgflag = 0;
                    ToManchester(string, message);
                    msgflag = 1;
                    push = 0;
                }
            }

        }

        if (recv == 1) {
            for (datacnt = 0; datacnt < 16; datacnt++) {
                if (response[datacnt] == 1) {
                    data[15 - datacnt] = '1';
                }
                if (response[datacnt] == 0) {
                    data[15 - datacnt] = '0';
                }
            }
            writeString(data);
            writeString("\r\n");
            recv = 0;

            //            if (response[RESPONSELENGTH - 1] == 0 && response[RESPONSELENGTH - 2] == 0 && response[RESPONSELENGTH - 3] == 0 && response[RESPONSELENGTH - 4] == 1)
            //            {
            //                for(datacnt = 0; datacnt < 16; datacnt++)
            //                {
            //                    if(response[datacnt] == 1)
            //                    {
            //                        data[datacnt] = '1';
            //                    }
            //                    if(response[datacnt] == 0)
            //                    {
            //                        data[datacnt] = '0';
            //                    }
            //                    if(datacnt == 15)
            //                    {
            //                        writeString("1010");
            //                        //clearLCD();
            //                        recv = 0;
            //                    }
            //                }
            //            }
        }
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

void IntegerToBinary(char input, char size, char* outputbuffer) {
    /*
     * outputbuffer is supposed to be defined big enough to store the value
     * following line of code may be an inspiration
     * "char mask[8*sizeof(unsigned int) + 1] = {0};"
     */
    int j;
    for (j = 0; j < (size); j++) {
        outputbuffer[j] = (input << j) & (1 << (size - 1)) ? '1' : '0';
    }

}

void PatMessage(char addr, char functioncode, char* outputbuffer) {
    char tempbuf[4];
    int j;
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

void ToManchester(char* inputbuffer, char* outputbuffer) {
    int bitcount = 0;
    int counter = 0;
    int j;

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
            com = 1;
        }
    }
}

//_T1Interrupt() is the T1 interrupt service routine (ISR).
void __attribute__((__interrupt__)) _T1Interrupt(void);

void __attribute__((__interrupt__, auto_psv)) _T1Interrupt(void) {
    testcounter++;
    if (testcounter == 2000) {
        testcounter = 0;
        com = 1;
    }

    if (recvcounter > 0 && waitclock == 0) {
        response[recvcounter - 1] = PORTAbits.RA4;
        recvcounter--;
        if (recvcounter == 1) {
            recv = 1;
        }
    }
    if (waitclock != 0) {
        waitclock--;
    }
    if (clk_flag == 0) {
        clk_flag = 1;
        if (com == 0) {
            LATBbits.LATB7 = clk_flag;
        }
    } else {
        clk_flag = 0;
        if (com == 0) {
            LATBbits.LATB7 = clk_flag;
        }
    }
    if (com == 1 && msgflag == 1) {
        if (message[loopcounter] == 0x01)
            LATBbits.LATB7 = 1;
        else
            LATBbits.LATB7 = 0;

        loopcounter++;
    }
    if (loopcounter == (2 * MESSAGELENGTH)) {
        loopcounter = 0;
        com = 0;
        recvcounter = 24;
        waitclock = 1;
    }


    IFS0bits.T1IF = 0;
}

