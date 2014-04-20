/* 
 * File:   main.c
 * Author: Nicolai
 *
 * Created on 17. april 2014, 10:37
 */

#include <stdio.h>
#include <stdlib.h>
#include <p24Fxxxx.h>

#include "uart.h"

_CONFIG1(JTAGEN_OFF & GCP_OFF & GWRP_OFF & COE_OFF & FWDTEN_OFF & ICS_PGx2)
_CONFIG2(FCKSM_CSDCMD & OSCIOFNC_OFF & POSCMOD_XT & FNOSC_PRI)

/*
 * 
 */
int main(int argc, char** argv) {

    OSCCON = 0x2200;
    CLKDIV = 0x0000;
    RCONbits.SWDTEN = 0;
    AD1PCFG = 0xFFFF;

    _TRISF4 = 1;
    _TRISF5 = 0;
    char TestString[40] = "This string is stored in SRAM memory\r\n";
    char ch;
    UARTInit();

    //TRISF = 0xFFFF;

    while(1)
    {
        UARTPutChar('A');
        UARTPutChar('B');
        UARTPutChar('C');
        UARTPutChar('\r');
        UARTPutChar('\n');
        
        ch = UARTGetChar();
        UARTPutChar(ch);
        UARTPutChar('\r');
        UARTPutChar('\n');
        
        UARTSendString("This string is stored as a constant in flash memory\r\n");

        UARTSendString(TestString);

        UARTSendInteger(12345);
        UARTPutChar('\r');
        UARTPutChar('\n');
        UARTSendInteger(-1000);
        UARTPutChar('\r');
        UARTPutChar('\n');
    }
    return (EXIT_SUCCESS);
}

