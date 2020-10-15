//ICC-AVR application builder : 10.08.2020 14:59:46
// Target : m1281
// Crystal: 12.000Mhz

#include <iom1284pv.h>
#include <macros.h>

char Tc1Flag;

//TIMER1 initialize - prescale:1024
// WGM: 0) Normal, TOP=0xFFFF
// desired value: 1Sec
// actual value:  1,000Sec (0,0%)
void InitTimer1(void)
{
 TCNT1 = 0;
 TCCR1B = 0x00; //stop
 OCR1A = 0x2DC6;
 TCCR1A = 0x00;
 TCCR1C = 0x00;
 TCCR1B = 0x05; //start Timer
 TIMSK1 = 0x02; //timer1 interrupt sources
}

#pragma interrupt_handler timer1_compa_isr:iv_TIM1_COMPA
void timer1_compa_isr(void)
{
 Tc1Flag = 1;
 //compare occured TCNT1=OCR1A
}


