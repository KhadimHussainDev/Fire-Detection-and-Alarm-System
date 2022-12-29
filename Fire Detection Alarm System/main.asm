/*
 *  Created: 12/20/2022 11:10:01 AM
 *   Author: Khadim Hussain
 */ 

.include "m328pdef.inc"
.include "myMacro.inc"
.cseg
.org 0x00
	CBI	DDRB,PB2 ; set bit for input of sensor 
	SBI DDRB,PB3 ; set bit for output of green light 
	SBI DDRB,PB4 ; set bit for output of red light 
	SBI DDRB,PB1 ; set bit for output of buzzer 

	loop:

		; check if fire is near or not
		SBIS PINB,PB2 ; if there is fire jump to L1
		rjmp L1

		;condition to turn off red led and buzzer
		;turn on green led

		SBI PORTB,PB3 ; turn on green led
		CBI PORTB,PB4 ; turn off red led
		CBI PORTB,PB1 ; turn off buzzer

		rjmp loop
	L1:

		;contion to turn on red led and buzzer and turn off green led
		CBI PORTB, PB3 ; turn off green led 
		SBI PORTB, PB4 ; turn on red led

		;loop for tik tik of buzzer
		SBI PORTB, PB1
		delay 50
		CBI PORTB, PB1
		delay 50

	rjmp loop
