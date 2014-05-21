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

 // number of characters displayed in a line
#define LCD_DISPLAY_LEN 	16

// number of lines displayed on the LCD
#define LCD_DISPLAY_LINE	2

// define some useful constants
#define LCD_LINE1			0		// first line
#define LCD_LINE2			1		// second line

// set 7-bit DDRAM address, line 1
#define LCD_DDRAM1(_ddramAddr)	(((_ddramAddr)&0x0f)|0x80)		
// set 7-bit DDRAM address, line 2
#define LCD_DDRAM2(_ddramAddr)	(((_ddramAddr)&0x0f)|0xc0)		

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

void writeLCD( int addr, unsigned char c);    // write to LCD at particular address

void putLCD( unsigned char d);    // send a character to be displayed on screen

void writeString( unsigned char *string );

void writeInteger(int Number);

void clearLCD( void );

void LCDwriteLine(unsigned char lineNum, unsigned char * inputDisplay);

#ifdef	__cplusplus
}
#endif

#endif	/* LCD_H */

