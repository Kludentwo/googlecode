#include <p24fj128ga010.h>
#include "lcd.h"

// initialise the LCD
void initLCD( void)
{
  // PMP initialization
  PMCON = 0x83BF;             // Enable the PMP
  PMMODE = 0x3FF;             // Master Mode 1
  PMAEN = 0x0001;             // PMA0 enabled

  // initialise TMR1
  T1CON = 0x8030;             // Fosc/2, prescaled 1:256, 16us/tick

  // wait for >30ms
  TMR1 = 0; while( TMR1<2000);// 2000 x 16us = 32ms

  //initiate the HD44780 display 8-bit init sequence
  PMADDR = LCDCMD;            // command register
  PMDATA = 0b00111000;        // 8-bit interface, 2 lines, 5x7
  TMR1 = 0; while( TMR1<3);   // 3 x 16us = 48us

  PMDATA = 0b00001100;        // display ON, cursor off, blink off
  TMR1 = 0; while( TMR1<3);   // 3 x 16us = 48us

  PMDATA = 0b00000001;        // clear display
  TMR1 = 0; while( TMR1<100); // 100 x 16us = 1.6ms

  PMDATA = 0b00000110;        // increment cursor, no shift
  TMR1 = 0; while( TMR1<100); // 100 x 16us = 1.6ms
}

void clearLCD( void )
{
  PMDATA = 0b00000001;        // clear display
  TMR1 = 0; while( TMR1<100); // 100 x 16us = 1.6ms
}

// read from the LCD
char readLCD( int addr)
{
  int dummy;
  while( PMMODEbits.BUSY);    // wait for PMP to be available
  PMADDR = addr;              // select the command address
  dummy = PMDATA;             // initiate a read cycle, dummy read
  while( PMMODEbits.BUSY);    // wait for PMP to be available
  return( PMDATA);            // read the status register
}

// write to LCD at particular address
void writeLCD( int addr, unsigned char c)
{
  while( busyLCD());
  while( PMMODEbits.BUSY);    // wait for PMP to be available
  PMADDR = addr;
  PMDATA = c;
}

// send a character to be displayed on screen
void putLCD( unsigned char d)
{
  int z,x;

  // section of code to include special characters such as new line
  switch (d)
  {
      case'\n':
          setLCDC(0x40);
          break;

      case'\r':
          z = addrLCD();
          z=(z+64);
          z=(z&0x40);
          setLCDC(z);
          break;

      case'\t':
          z = addrLCD();
          x= (5 - (z%5));
          setLCDC((z+x));
          break;

      default:
          writeLCD( LCDDATA, d);
          break;
  }
}

void writeString( unsigned char *string )
{
    while(*string)
    {
        putLCD(*string++);
    }
}

void writeInteger( int Number )
{
unsigned char array[7];
  // Convert the integer to an ASCII string (array), radix = 10
  itoa(array,Number, 10);
  // - then send the string
  writeString(array);
}

void LCDwriteLine(unsigned char lineNum, unsigned char * inputDisplay)
{
	unsigned char Local_8, Local_82;

	for (Local_82 = 0; Local_82 < 250; Local_82++);
	if (lineNum==LCD_LINE1)
		writeLCD(LCDCMD, LCD_DDRAM1(0));	// go to 1st char of line 1
	else if (lineNum==LCD_LINE2)
		writeLCD(LCDCMD, LCD_DDRAM2(0));	// go to 1st char of line 2

	for (Local_8 = 0; Local_8 < LCD_DISPLAY_LEN; Local_8++) {
		for (Local_82 = 0; Local_82 < 30; Local_82++);
		writeLCD(LCDDATA, *inputDisplay);
		inputDisplay++;
	}
}