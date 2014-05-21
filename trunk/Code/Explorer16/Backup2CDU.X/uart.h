/* 
 * File:   uart.h
 * Author: Nicolai
 *
 * Created on 17. april 2014, 10:37
 */

#ifndef UART_H
#define	UART_H
#include <stdio.h>
#include <stdlib.h>


//prototypes

//Initiation
extern void UARTInit( void );

//UART transmit function
extern void  UARTPutChar(char Ch);

//UART receive function
extern char UARTGetChar();

extern void UARTSendString(char* String);
extern void UARTSendInteger(int Number);

#endif	/* UART_H */

