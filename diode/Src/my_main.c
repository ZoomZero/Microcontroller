#include "main.h"

#define abs(a, b) (a) > (b) ? (a) - (b) : (b) - (a)

void MyMain()
{
	int button = 0;
	int max_time = 0x270F;
	int napryaga = 0;
	TIM17->DIER |= 1;
	TIM17->CR1 |= 1;
	
	ADC1->CR |= 1;

  while (1)
  {	
		if (button != GPIOC->IDR)
		{
			TIM17->CNT = 0;
			button = GPIOC->IDR;
			if (GPIOC->IDR & 1<<13) 
			{
			TIM17->ARR = TIM17->ARR / 2;
			}
			else
			{
			TIM17->ARR = TIM17->ARR * 2;
			}	
		}
		
		if ((napryaga > 300 + ADC1->DR) || (ADC1->DR > 300 + napryaga))
		{
			napryaga = ADC1->DR;
			TIM17->CNT = 0;
			TIM17->ARR = ((ADC1->DR * max_time) / 0xFFF) + 0xF;
		}
  }
}