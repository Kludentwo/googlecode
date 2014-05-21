#include "CDU.h"

void InitSensorArray(Sensor* sensorarray) {
    unsigned char addresscounter = 0;

    for (addresscounter = 0; addresscounter <= NUMBEROFSENSORS; addresscounter++) {
        InitSensorMem(&(sensorarray[addresscounter]));
        sensorarray[addresscounter].Address = (addresscounter + 1);
    }
}

void CDUInit(void)
{
	// Ports
	TRISA = 0x0090; //configure (RA4 = Inputs, Rest = output)
    TRISB = 0x0000; //configure all PortB as output
    TRISD = 0x0000; //configure all PortD
    TRISF = 0x0010; //configure F4 = Input, Rest = output
	// I/O
    AD1PCFG = 0xFFFF; //set to all digital I/O
	// Timer
    PR1 = 0x00C8; // C8 = 200, 64 = 100, 190 = 400
    IPC0bits.T1IP = 5; //set interrupt priority
    T1CON = 0b1000000000000000; //turn on the timer
    IFS0bits.T1IF = 0; //reset interrupt flag
    IEC0bits.T1IE = 1; //turn on the timer1 interrupt
	// Mem and Uart
    InitMemory();
    UARTInit();
}

void CDUStartUpRoutine(Sensor* sensorarray, unsigned char* alive, unsigned char* Messagebuffer, unsigned char* receivebuffer, Cduflags* CDUFlags) {
    unsigned char addresscounter = 0;
    for (addresscounter = 0; addresscounter <= NUMBEROFSENSORS; addresscounter++) {
        CDUSend(&(sensorarray[addresscounter]), GETINFO, Messagebuffer, CDUFlags);
        alive[addresscounter] = CDUReceive(&(sensorarray[addresscounter]), GETINFO, receivebuffer, CDUFlags);
    }
}

void CDUSend(Sensor* Sens, unsigned char functioncode, unsigned char* Messagebuffer, Cduflags* CDUFlags) {
    if (functioncode <= 15) {
        while (!CDUFlags->enableflag);
        CDUFlags->enableflag = 0;
        unsigned char string[MESSAGELENGTH] = {0};
        PatMessage(Sens->Address, functioncode, string);
        ToManchester(string, Messagebuffer, CDUFlags);
        CDUFlags->comflag = 1;
    }
}

unsigned char CDUReceive(Sensor* Sens, unsigned char functioncode, unsigned char* receivebuffer, Cduflags* CDUFlags) {
    unsigned char datacnt = 0;
    unsigned char FunctioncodeHolder = 0;
    unsigned char AddressHolder = 0;
    unsigned char dummy = 0;
    unsigned char reset = 0;
    unsigned char retval = 255;
    if (functioncode > 15) {
        retval = 2;
    } else {
        while (!(CDUFlags->recvflag));
        CDUFlags->recvflag = 0;
        for (datacnt = 23; datacnt >= 0 && datacnt < 24; datacnt--) {
            if (datacnt > 19 && datacnt < 24) {
                AddressHolder |= (receivebuffer[datacnt] << (datacnt - 20));
            }
            if (datacnt > 15 && datacnt < 20) {
                FunctioncodeHolder |= (receivebuffer[datacnt] << (datacnt - 16));
            }
            if (((datacnt == 15) && ((FunctioncodeHolder != functioncode) || (AddressHolder != Sens->Address))) || retval == 0) {
                retval = 1;
            } else {
                if (AddressHolder == Sens->Address && FunctioncodeHolder == GETINFO) {
                    if (reset == 0) {
                        Sens->Data = 0;
                        Sens->Errors = 0;
                        reset = 1;
                    }
                    if (datacnt > 11 && datacnt < 16) {
                        Sens->Errors |= (receivebuffer[datacnt] << (datacnt - 12));
                    }
                    if (datacnt > 7 && datacnt < 12) {
                        Sens->Type |= (receivebuffer[datacnt] << (datacnt - 8));
                    }
                    if (datacnt < 8) {
                        dummy |= (receivebuffer[datacnt] << (datacnt));
                    }
                }
                else if (AddressHolder == Sens->Address && FunctioncodeHolder == GETDATA) {
                    if (reset == 0) {
                        Sens->Data = 0;
                        Sens->Errors = 0;
                        reset = 1;
                    }
                    if (datacnt > 11 && datacnt < 16) {
                        Sens->Errors |= (receivebuffer[datacnt] << (datacnt - 12));
                    }
                    if (datacnt < 12) {
                        Sens->Data |= (receivebuffer[datacnt] << (datacnt));
                    }
                }
                else
                {
                    if (reset == 0) {
                        Sens->Data = 0;
                        Sens->Errors = 0;
                        reset = 1;
                    }
                    if (datacnt > 11 && datacnt < 16) {
                        Sens->Errors |= (receivebuffer[datacnt] << (datacnt - 12));
                    }
                    retval = 3;
                }
            }
        }
        if (retval == 255 ) {
            retval = 0;
        }
    }
    return retval;
}

void CDUPCCom(void) {
    unsigned int memcnt = 0;
    unsigned char msg = 0;
    Sensor output;
    if (_RA7 != 0) {
        UARTPutChar('N');
    }
	else
	{	
    UARTPutChar('F');
    msg = UARTGetChar();
    if (msg == 'A') {
        T1CONbits.TON = 0;
        for (memcnt = 0; memcnt < 700; memcnt++) {
            //4681
            Load((memcnt * 7), &output);
            UARTPutChar(output.Address);
            UARTPutChar(output.Data >> 8);
            UARTPutChar(output.Data);
            UARTPutChar(output.Year);
            UARTPutChar(output.Month);
            UARTPutChar(output.Day);
            UARTPutChar(output.Hour);
            UARTPutChar(output.Minute);
            UARTPutChar(output.Type);
            UARTPutChar(output.Errors);
            UARTPutChar(',');
            // UARTPutChar('\n');
        }
        T1CONbits.TON = 1;

    } else {
        UARTSendString("unknown cmd");
    }
	}
}