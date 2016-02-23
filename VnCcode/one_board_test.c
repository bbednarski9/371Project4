#include <stdio.h>
#include "sys/alt_stdio.h"
#include "system.h"
#include "altera_avalon_pio_reg.h"
#include <time.h>

// WRITE:	IOWR_ALTERA_AVALON_PIO_DATA(targetAddress, aValue); 
// READ: 	aValue = IORD_ALTERA_AVALON_PIO_DATA(sourceAddress);

//#define switches 	(volatile char *) 0x0003010
#define leds 			(volatile char *) 0x3080
#define parallelIn		(volatile char *) 0x3070
#define parallelOut		(volatile char *) 0x3060
#define transmitEnable 	(volatile char *) 0x3050
#define charSent 		(volatile char *) 0x3040
#define load 			(volatile char *) 0x3030
#define charReceived 	(volatile char *) 0x3020

void main()
{ 
	char input;
	char transmitChar;
	char recievedChar;
	char sourceAdd;
	char sendChar;
	char targetAdd;
	char demo[10] = "Hello 1234";

	alt_printf("This is a single-board test. Please press 'C' to continue:\n");
	input = alt_getchar();

	while (input != 'E') {
		if (input == 'C') {
			alt_printf("Press 'E' to exit.\n");
			alt_printf("To start character transmit, press 'T'.\n");
			// alt_printf("To start demo transmit (Hello 1234), press 'D'.\n");
			input = alt_getchar();
		} 
		if (input == 'T') {
			alt_printf("Type a character to be transmitted: \n");
			transmitChar = alt_getchar();

			*transmitEnable = 0;
			IOWR_ALTERA_AVALON_PIO_DATA(targetAdd, transmitChar);
			*transmitEnable = 1;
			*load = 1;
			usleep(10000);
			*load = 0;

			do { 
					if (*charSent == 1) {
						alt_printf("Character has been sent.\n");
						*transmitEnable = 0;
					}
			} while (*charSent == 0)

			if (*charReceived == 1) {
				receivedChar = IORD_ALTERA_AVALON_PIO_DATA(parallelIn);
				recievedChar = recievedChar + '0';
				alt_printf("The character received is: %d\n", recievedChar);
			}
	}
	return 0;
}
