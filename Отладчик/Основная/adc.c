// Target : ATMega1284P
// Crystal: 24Mhz

#include <iom1284pv.h>
#include <macros.h>

#define Vcc 0x40
#define Ref11 0x80
#define Ref256 0xC0
#define StartConv() ADCSRA  |= 0x40

int AdcBuf[8];
char ChNum = 0;

//ADC initialize
// Conversion time: 138uS
void adc_init(void)
{
 ADCSRA = 0x00; //disable adc
 ADMUX  =  ChNum + Vcc; //select adc input 0
 ACSR   = 0x80;
 ADCSRA = 0x8F;
 StartConv();
}

#pragma interrupt_handler adc_isr:iv_ADC
void adc_isr(void)
{
 AdcBuf[ChNum++] = ADC;
 ChNum &= 7;
 ADMUX  =  ChNum + Vcc;
 StartConv();
}

