/* 
 * File:   CDU.h
 * Author: Nicolai
 *
 * Created on 24. april 2014, 12:01
 */
/*========================================================================
                                INCLUDES
========================================================================*/

#include "MemCtl.h"
#include "uart.h"
#include "LineCoding.h"
 

 
void InitSensorArray(Sensor* sensorarray);
void CDUInit(void);
void CDUStartUpRoutine(Sensor* sensorarray, unsigned char* alive, unsigned char* Messagebuffer, unsigned char* receivebuffer, Cduflags* CDUFlags);
void CDUSend(Sensor* Sens, unsigned char functioncode, unsigned char* Messagebuffer, Cduflags* CDUFlags);
unsigned char CDUReceive(Sensor* Sens, unsigned char functioncode, unsigned char* receivebuffer, Cduflags* CDUFlags);
void CDUPCCom(void);