
#include <p24Fxxxx.h>	//see tutorial below!
#include "uart.h"


// timing and baud rate settings

#define U_BRG  25  //



//Initiation function
//parameter BAUDRATEREG1 determines baud speed

void UARTInit(void) {
    char dummy;
	TRISF = 0x0010; //configure F4 = Input, Rest = output
    //Set up registers
    U2BRG = U_BRG; //set baud speed
    dummy = U2RXREG;
    U2MODEbits.STSEL = 0; // 1-stop bit
    U2MODEbits.PDSEL = 0; // No Parity, 8-data bits
    U2MODEbits.ABAUD = 0; // Autobaud Disabled
    U2MODEbits.BRGH = 1;
    
    U2STAbits.UTXISEL0 = 0; // Interrupt after one Tx character is transmitted
    U2STAbits.UTXISEL1 = 0;
    U2STAbits.URXISEL = 0; // Interrupt after one RX character is received


    U2MODEbits.UARTEN = 1; // Enable UART
    U2STAbits.UTXEN = 1; // Enable UART Tx


    IFS1bits.U2RXIF = 0;

}

//UART transmit function, parameter Ch is the character to send

void UARTPutChar(char Ch) {
    //transmit ONLY if TX buffer is empty
    while (U2STAbits.UTXBF == 1);
    U2TXREG = Ch;
}

//UART receive function, returns the value received.

char UARTGetChar() {
    char Temp;
    //wait for buffer to fill up, wait for interrupt
    while (IFS1bits.U2RXIF == 0);
    Temp = U2RXREG;
    //reset interrupt
    IFS1bits.U2RXIF = 0;
    //return my received byte
    return Temp;
}

void UARTSendString(char* String) {
    while (*String != 0) {
        // Send the character pointed to by "String"
        UARTPutChar(*String);
        // Advance the pointer one step
        String++;
    }
}

void UARTSendInteger(int Number) {
    char array[7];
    // Convert the integer to an ASCII string (array), radix = 10
    itoa(array, Number, 10);
    // - then send the string
    UARTSendString(array);
}