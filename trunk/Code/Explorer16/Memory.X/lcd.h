/* 
 * File:   lcd.h
 * Author: Nicolai
 *
 * Created on 2. april 2014, 10:22
 */

#ifndef LCD_H
#define	LCD_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <p24fj128ga010.h>
#include <stdlib.h>

// define some useful constants

// access data register
#define LCDDATA 1
// access command register
#define LCDCMD  0
// PMP data buffer
#define PMDATA  PMDIN1

void initLCD();         // initialise the LCD
char readLCD(int addr); // read from the LCD

// define some macros that make life a bit easier

// check if LCD busy
#define busyLCD() readLCD( LCDCMD) & 0x80
// check address of LCD position
#define addrLCD() readLCD( LCDCMD) & 0x7F
// read what is on the LCD
#define getLCD()  readLCD( LCDDATA)
// set cursor position
#define setLCDC( a) writeLCD( LCDCMD, (a & 0x7F) | 0x80)

void writeLCD( int addr, char c);    // write to LCD at particular address

void putLCD(char d);    // send a character to be displayed on screen

void writeString( char *string );

void writeInteger(int Number);

void clearLCD( void );

#ifdef	__cplusplus
}
#endif

#endif	/* LCD_H */

