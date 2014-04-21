#include "spi.h"

void spiInit( void ){
    TRISDbits.TRISD12 = 0;
    TRISGbits.TRISG7 = 1;
    TRISGbits.TRISG6 = 0;
    TRISGbits.TRISG8 = 0;
    TRISGbits.TRISG9 = 0;

       
    // Settings
    SPI2CON1bits.SPRE2 = 1;
    SPI2CON1bits.SPRE1 = 1;
    SPI2CON1bits.SPRE0 = 1;
    // Secondary Prescaler = 2:1
    SPI2CON1bits.PPRE1 = 1;
    SPI2CON1bits.PPRE0 = 1;
    // Primary Prescaler = 1:1
    SPI2CON1bits.CKE = 1;
    SPI2CON1bits.MSTEN = 1;
    // Clear SPIROV bit
    SPI2STATbits.SPIROV = 0;
    SPI2STATbits.SPIEN = 1;
}

// send one byte of data and receive one back at the same time
unsigned char spiWrite( unsigned char i )
{
    // write to buffer for TX, wait for transfer, read
    SPI2BUF = i;
    while(!SPI2STATbits.SPIRBF);
    return SPI2BUF;
}//spiWrite2
