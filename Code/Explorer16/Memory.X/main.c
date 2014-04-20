/* 
 * File:   main.c
 * Author: Nicolai
 *
 * Created on 20. april 2014, 13:13
 */

#include <stdio.h>
#include <stdlib.h>

#include "MemCtl.h"
#include "lcd.h"


_CONFIG1(JTAGEN_OFF & GCP_OFF & GWRP_OFF & COE_OFF & FWDTEN_OFF & ICS_PGx2)
_CONFIG2(FCKSM_CSDCMD & OSCIOFNC_OFF & POSCMOD_XT & FNOSC_PRI)

void delayfunc( unsigned int delays );

unsigned int AddressCounter = 0x0;
/*
 * 
 */
int main(int argc, char** argv) {
    initLCD();
    InitMemory();
    Sensor Sensor1;
    InitSensorMem(&Sensor1);
    Sensor1.Address = 0x01;
    Sensor ReadSensorBuffer;
    
    AD1PCFG = 0xffff;
    
    writeString("Proper init");
    writeString("\r\n");

    Save(&AddressCounter, &Sensor1 );

    Save(&AddressCounter, &Sensor1 );

    Save(&AddressCounter, &Sensor1 );

    Load(0,&ReadSensorBuffer);

    putLCD(ReadSensorBuffer.Year);

    while(1)
    {     
        delayfunc(20000);
    }
    return (EXIT_SUCCESS);
}

void delayfunc( unsigned int delays )
{
    unsigned int delay;
    delay = delays;
    while(delay > 0)
    {
        delay--;
    }
}