/* 
 * File:   spi.h
 * Author: Nicolai
 *
 * Created on 20. april 2014, 13:14
 */

#ifndef SPI_H
#define	SPI_H

#include <stdio.h>
#include <stdlib.h>
#include <p24Fxxxx.h>

#define CS _LATD12
#define SO _RG7
#define SCK _LATG6
#define SI _LATG8


unsigned char spiWrite( unsigned char i );
void spiInit( void );


#endif	/* SPI_H */

