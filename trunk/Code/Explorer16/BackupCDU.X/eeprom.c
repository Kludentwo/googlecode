#include "eeprom.h"
#include "spi.h"




//initiate a port for this eeprom
void MemoryInit( void )
{
    spiInit();
    // Set IOs directions for EEPROM SPI
    //disable SS signal
    CS = 1;
}

//writes to the eeprom device
void MemoryByteWrite(unsigned int Address, unsigned char Data)
{
    unsigned char var;
    MemoryWriteEnable();
    CSLow();

    var = spiWrite( EEPROM_CMD_WRITE );

    var = spiWrite( Address >> 8 );
    var = spiWrite( Address );

    var = spiWrite( Data);

    CSHigh();

    // wait for completion of previous write operation
    while(EEPROMReadStatus().Bits.WIP);

    MemoryWriteDisable();
}

//reads from the eeprom device
unsigned char MemoryByteRead(unsigned int Address)
{
    unsigned char var;

    CSLow();

    var = spiWrite( EEPROM_CMD_READ );

    var = spiWrite( Address >> 8 );
    var = spiWrite( Address );

    var = spiWrite( 0 );

    CSHigh();
    return var;
}

//enable write by changing status register
void MemoryWriteEnable()
{
    unsigned char var;
    CSLow();
    var = spiWrite( EEPROM_CMD_WREN );
    CSHigh();
}

//disable write by changing status register
void MemoryWriteDisable()
{
    unsigned char var;
    CSLow();
    var = spiWrite( EEPROM_CMD_WRDI );
    CSHigh();
}

//read the status regsiter
union _EEPROMStatus_ EEPROMReadStatus()
{
    unsigned char var;

    CSLow();
    var = spiWrite( EEPROM_CMD_RDSR );
    var = spiWrite( 0 );
    CSHigh();

    return (union _EEPROMStatus_)var;
}

//polls to see if the SPI EEPROM is present
unsigned char MemoryPoll()
{
    unsigned char temp = 0;
    MemoryWriteEnable();
    temp = EEPROMReadStatus().Bits.WEL;
    MemoryWriteDisable();
    return temp;
}
