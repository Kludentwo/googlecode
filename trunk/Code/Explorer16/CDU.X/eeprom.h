/* 
 * File:   eeprom.h
 * Author: Nicolai
 * Code Originally from:
 * http://www.engscope.com/pic24-tutorial/12-2-spi-master-usage/
 * 20 april 2014.
 * Created on 20. april 2014, 13:40
 */

#ifndef EEPROM_H
#define	EEPROM_H

#include "spi.h"


//instruction set
#define EEPROM_CMD_READ     (unsigned)0b00000011
#define EEPROM_CMD_WRITE    (unsigned)0b00000010
#define EEPROM_CMD_WRDI     (unsigned)0b00000100
#define EEPROM_CMD_WREN     (unsigned)0b00000110
#define EEPROM_CMD_RDSR     (unsigned)0b00000101
#define EEPROM_CMD_WRSR     (unsigned)0b00000001

//struct for the status register
struct  STATREG{
	unsigned    WIP:1;
	unsigned    WEL:1;
	unsigned    BP0:1;
	unsigned    BP1:1;
	unsigned    RESERVED:3;
	unsigned    WPEN:1;
};

union _EEPROMStatus_{
	struct  STATREG Bits;
	unsigned char	Char;
};

//initiate a port for this eeprom
void MemoryInit( void );

//read the status regsiter
extern union _EEPROMStatus_ EEPROMReadStatus(void);

//set the macro for active SPI
#define CSLow()      CS = 0;

//set the macro for inactive SPI
#define CSHigh()     CS = 1;

//writes to the eeprom device
extern void MemoryByteWrite(unsigned int, unsigned char);

//reads from the eeprom device
extern unsigned char MemoryByteRead(unsigned int);

//enable write by changing status register
extern void MemoryWriteEnable(void);

//disable write by changing status register
extern void MemoryWriteDisable(void);

//polls to see if the SPI EEPROM is present
unsigned char MemoryPoll();

#endif	/* EEPROM_H */

