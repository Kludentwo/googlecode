#include "LineCoding.h"

void InitCDUFlags(Cduflags* CDUFlags) {
    CDUFlags->clk_flag = 0;
    CDUFlags->comflag = 0;
    CDUFlags->enableflag = 0;
    CDUFlags->msgflag = 0;
    CDUFlags->recvflag = 0;
}

void IntegerToBinary(unsigned char input, unsigned char size, unsigned char* outputbuffer) {
    unsigned char sizevar = 0;
    if (size > 8) {
        sizevar = 8;
    } else {
        sizevar = size;
    }
    unsigned int j;
    for (j = 0; j < (sizevar); j++) {
        outputbuffer[j] = (input << j) & (1 << (sizevar - 1)) ? '1' : '0';
    }

}

void PatMessage(unsigned char addr, unsigned char functioncode, unsigned char* outputbuffer) {
    unsigned char tempbuf[4];
    unsigned int j;
    unsigned char addrvar = 0;
    unsigned char functioncodevar = 0;
    if ((addr > 15) || (functioncode > 15)) {
        addrvar = 0; // this will lead to an error after receiving!
        functioncodevar = 0; //
    } else {
        addrvar = addr;
        functioncodevar = functioncode;
    }
    IntegerToBinary(STARTCODE, 4, tempbuf);
    for (j = 0; j < 4; j++) {
        outputbuffer[j] = tempbuf[j];
    }
    IntegerToBinary(addrvar, 4, tempbuf);
    for (j = 0; j < 4; j++) {
        outputbuffer[j + 4] = tempbuf[j];
    }
    IntegerToBinary(functioncodevar, 4, tempbuf);
    for (j = 0; j < 4; j++) {
        outputbuffer[j + 8] = tempbuf[j];
    }
}

void ToManchester(unsigned char* inputbuffer, unsigned char* outputbuffer, Cduflags* CDUFlags) {
    unsigned int bitcount = 0;
    unsigned int counter = 0;
    unsigned int j;

    CDUFlags->msgflag = 0;

    for (j = 0; j < (2 * MESSAGELENGTH); j++) {
        if (bitcount == 2) {
            counter++;
            bitcount = 0;
        }
        if (inputbuffer[counter] == '0') {
            if (bitcount == 1) {
                outputbuffer[j] = 1;
                bitcount = 2;
            }
            if (bitcount == 0) {
                outputbuffer[j] = 0;
                bitcount = 1;
            }
        }
        if (inputbuffer[counter] == '1') {
            if (bitcount == 1) {
                outputbuffer[j] = 0;
                bitcount = 2;
            }
            if (bitcount == 0) {
                outputbuffer[j] = 1;
                bitcount = 1;
            }
        }
        if (counter == MESSAGELENGTH) {
            counter = 0;
        }
    }
    CDUFlags->msgflag = 1;
}
