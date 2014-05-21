/* 
 * File:   LineCoding.h
 * Author: Nicolai
 *
 * Created on 24. april 2014, 12:01
 */
 
#define     STARTCODE       0b0110
#define     MESSAGELENGTH   12
#define     RESPONSELENGTH  24
#define     COUNTTOMSG      10000
 
 typedef struct cduflags {
    unsigned char comflag;
    unsigned char msgflag;
    unsigned char clk_flag;
    unsigned char recvflag;
    unsigned char enableflag;
} Cduflags;

void IntegerToBinary(unsigned char input, unsigned char size, unsigned char* outputbuffer);
void PatMessage(unsigned char addr, unsigned char functioncode, unsigned char* outputbuffer);
void ToManchester(unsigned char* inputbuffer, unsigned char* outputbuffer, Cduflags* CDUFlags);
void InitCDUFlags(Cduflags* CDUFlags);