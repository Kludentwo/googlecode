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
#define     MESSAGELENGTH   4
#define     STARTCODE       0b0110
// Function Codes:
#define     GETINFO         0b0001
#define     GETDATA         0b0010

// Used by communication ISR
int counter = 0;
int com = 0;
int bitcount = 0;
int message[28] = {0,1,1,0, 0,0,0,1, 0,0,0,1, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,1};

//prototypes
void TimerInit(void);
void IntegerToBinary(int input, char* outputbuffer);

int main(int argc, char** argv) {
    OSCCON = 0x22C0; //select Primary Oscillator, External XL
    CLKDIV = 0x0000; //do not divide //Set up I/O Port
    AD1PCFG = 0xFFFF; //set to all digital I/O
    TRISB = 0x00; //configure all PortB as input, RB9 as output
    initLCD();
    writeString("Hello LCD");
    writeString("\r\n");
    char string[(8*sizeof(unsigned int) + 1)] = {0};
    IntegerToBinary(STARTCODE,string);
    writeString(string);
    TimerInit();
    
    //Main Program Loop, Loop forever
    while (1) {
        if(!(_RD7))
        {
            com = 1;
        }
    }
    return (EXIT_SUCCESS);
}

void TimerInit(void) {
    //set to (2^13), since 32.768kHz / 2^13 = 4, toggles at 2Hz
    PR1 = 0x0064;
    IPC0bits.T1IP = 5; //set interrupt priority
    T1CON = 0b1000000000000000; //turn on the timer
    IFS0bits.T1IF = 0; //reset interrupt flag
    IEC0bits.T1IE = 1; //turn on the timer1 interrupt
}

void IntegerToBinary(int input, char* outputbuffer)
{
  /*
   * outputbuffer is supposed to be defined big enough to store the value
   * following line of code may be an inspiration
   * "char mask[8*sizeof(unsigned int) + 1] = {0};"
  */
  int j;
  for(j = 0; j < (8*sizeof(unsigned int) + 1); j++)
  {
    outputbuffer[j] = (input << j) & (1 << (8*sizeof(unsigned int)-1)) ? '1' : '0';
  }
  
}

//_T1Interrupt() is the T1 interrupt service routine (ISR).
void __attribute__((__interrupt__)) _T1Interrupt(void);

void __attribute__((__interrupt__, auto_psv)) _T1Interrupt(void) {
    if (com == 0) {
        LATBbits.LATB7 = ~LATBbits.LATB7;
    }
    if (com == 1) {
        if (bitcount == 2)
        {
            counter++;
            bitcount = 0;
        }
        if (message[counter] == 0) {
            if (bitcount == 1) {
                LATBbits.LATB7 = 1;
                bitcount = 2;
            }
            if (bitcount == 0) {
                LATBbits.LATB7 = 0;
                bitcount = 1;
            }
        }
        if (message[counter] == 1) {
            if (bitcount == 1) {
                LATBbits.LATB7 = 0;
                bitcount = 2;
            }
            if (bitcount == 0) {
                LATBbits.LATB7 = 1;
                bitcount = 1;
            }
        }
        if (counter == MESSAGELENGTH) {
            counter = 0;
            com = 0;
        }
    }
    IFS0bits.T1IF = 0;
}

