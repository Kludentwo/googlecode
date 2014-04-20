#include "MemCtl.h"

void InitMemory( void )
{
    MemoryInit();
}

void InitSensorMem( struct Sensor* Sens )
{
    Sens->Address = 0;
    Sens->Data = 0;
    Sens->Year = 0x70;
    Sens->Month = 0x12;
    Sens->Day = 0x21;
    Sens->Hour = 0x12;
    Sens->Minute = 0x00;
}

void Save( unsigned int* address, struct Sensor* Sens )
{
    unsigned char counter = 0;
    unsigned char bytes[SIZE] = {0};

    if( ((*address)+(SIZE-1)) >= LASTADDR )
    {
        (*address) = 0;
    }

    bytes[0] = ((Sens->Address) << 4) | ((Sens->Data >> 8));
    bytes[1] = (Sens->Data);
    bytes[2] = (Sens->Year);
    bytes[3] = ((Sens->Month) << 3) | ((Sens->Day) >> 3);
    bytes[4] = ((Sens->Day) << 5) | ((Sens->Hour) >> 1);
    bytes[5] = ((Sens->Hour) << 7) | ((Sens->Minute));

    for(counter = 0; counter < SIZE; counter++)
    {
        MemoryByteWrite((*address),bytes[counter]);
        (*address)++;
    }
}

unsigned char Load( unsigned int address, struct Sensor* Sens )
{
    unsigned char counter = 0;
    unsigned char bytes[SIZE] = {0};

    if( ((address)+(SIZE-1)) >= LASTADDR )
    {
        return 1; // Cannot load data properly
    }

    for(counter = 0; counter < SIZE; counter++)
    {
        bytes[counter] = MemoryByteRead( (address+counter) );
    }

    Sens->Address = 0x0F & (bytes[0] >> 4);
    Sens->Data =  0x0FFF & (( bytes[0] << 8 ) | ( bytes[1] ));
    Sens->Year = ( bytes[2] );
    Sens->Month = 0x1F & ( bytes[3] >> 3);
    Sens->Day = 0x3F & (( bytes[3] << 3) | bytes[4] >> 5 );
    Sens->Hour = 0x1F & ( ((bytes[4]) << 1) | (bytes[5] >> 7) );
    Sens->Minute = 0x7F & ( bytes[5] );

    return 0;
}
