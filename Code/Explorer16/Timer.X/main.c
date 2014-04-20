/* 
 * File:   main.c
 * Author: Nicolai
 *
 * Created on 2. april 2014, 11:11
 */

#include <stdio.h>
#include <stdlib.h>
#include <p24Fxxxx.h>


_CONFIG1(JTAGEN_OFF & GCP_OFF & GWRP_OFF & COE_OFF & FWDTEN_OFF & ICS_PGx2)
_CONFIG2(FCKSM_CSDCMD & OSCIOFNC_OFF & POSCMOD_XT & FNOSC_PRI)
/*
 * 
 */

int message[24] = {0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1};
int message2[24] = {0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1};
int counter = 0;
int data = 0;
int hest = 0;

//prototypes
void TimerInit(void);

int main(int argc, char** argv) {
    OSCCON = 0x22C0; //select Primary Oscillator, External XL
    CLKDIV = 0x0000; //do not divide //Set up I/O Port
    AD1PCFG = 0xFFFF; //set to all digital I/O
    TRISB = 0x00; //configure all PortB as input, RB9 as output
    TimerInit();

    //Main Program Loop, Loop forever
    while (1) {
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

//_T1Interrupt() is the T1 interrupt service routine (ISR).
void __attribute__((__interrupt__)) _T1Interrupt(void);

void __attribute__((__interrupt__, auto_psv)) _T1Interrupt(void) {
    if (hest == 0) {
        
        if (data == 0) {
            LATBbits.LATB6 = message[counter]; //Toggle output to LED
            data++;
            counter++;
        } else {
            data = 0;
        }
        LATBbits.LATB7 = ~LATBbits.LATB7;
        if (counter == 23) {
            counter = 0;
            hest++;
        }
    }
    if(hest == 1) {
        
        if (data == 0) {
            LATBbits.LATB6 = message2[counter]; //Toggle output to LED
            data++;
            counter++;
        } else {
            data = 0;
        }
        LATBbits.LATB7 = ~LATBbits.LATB7;
        if (counter == 23) {
            counter = 0;
            hest = 0;
        }
    }
    IFS0bits.T1IF = 0;
}

