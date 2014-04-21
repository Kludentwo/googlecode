/* 
 * File:   MemCtl.h
 * Author: Nicolai
 *
 * Created on 20. april 2014, 17:01
 */

#ifndef MEMCTL_H
#define	MEMCTL_H

#include "eeprom.h"

#define LASTADDR    0x7FFE
#define SIZE        7


/*
 * BYTE1 = 4 bit ADDR | 4 bit DATA (MSN)
 * BYTE2 = 8 bit DATA (LSB)
 * BYTE3 = 8 bit YEAR
 * BYTE4 = 5 bit MONTH | 3 bit DAY
 * BYTE5 = 3 bit DAY | 5 bit HOUR
 * BYTE6 = 1 bit HOUR | 7 bit minute
 * BYTE7 = 4 bit TYPE | 4 bit ERROR
 */


typedef struct Sensor {
    unsigned char Address;
    unsigned int Data;
    unsigned char Year;
    unsigned char Month;
    unsigned char Day;
    unsigned char Hour;
    unsigned char Minute;
    unsigned char Errors;
    unsigned char Type;
} Sensor;

void InitMemory( void );
void InitSensorMem( struct Sensor* Sens );
void Save( unsigned int* address, struct Sensor* Sens );
unsigned char Load( unsigned int address, struct Sensor* Sens );
#endif	/* MEMCTL_H */

