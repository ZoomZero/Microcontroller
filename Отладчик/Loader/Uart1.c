// Target : ATMega1284P
// Crystal: 24Mhz

#include <iom1284pv.h>
#include <macros.h>

//#include "Data.h"
#include "sisdef.h"

#define TransmitSize1 256
#define FIFO1Wrap (TransmitSize1-1)

char FIFO1[TransmitSize1];
unsigned char Read1,Write1;
unsigned char Count1;

#define EnableUDRE1()    UCSR1B|=0x20
#define DisableUDRE1()   UCSR1B&=~0x20 

#define Udr0Empty		(UCSR1A&0x20)
#define Uart0TxC		(UCSR1A&0x40)


#pragma interrupt_handler uart1_tx_isr:iv_USART1_TXC
void uart1_tx_isr(void)
{//ClrTx0En();	
}

#pragma interrupt_handler uart1_udre_isr:iv_USART1_UDRE
void uart1_udre_isr(void)
{//SetTx0En();
 	   UDR1=FIFO1[Read1++];
	  // Read1&=FIFO1Wrap;
	   if(--Count1==0) DisableUDRE1();
}

char SymbolToUart1(char s)
{if(Count1==(TransmitSize1-1)) return 0; 
 CLI();
		 FIFO1[Write1++]=s;
		 Count1++;	
		 //Write1&=FIFO1Wrap;
 EnableUDRE1();
 SEI();	
	return 1;  }

void SymbolToUart1Gar(char s)
{while(!SymbolToUart1(s)); }

void StringToUart1(char *ptr)
{while(*ptr) SymbolToUart1Gar(*ptr++);
}

void FlashToUart1(const char *ptr)
{while(*ptr) SymbolToUart1Gar(*ptr++);
}

///////////////////////////
//Receiver Functions   ////
///////////////////////////

#define Receive1Size 256
char Uart1ReceiveBuffer[Receive1Size];

char Receive1Write;
char Receive1Read;
char Receive1Counter;

#define  Receive1BufferWrap (Receive1Size-1);

#pragma interrupt_handler uart1_rx_isr:iv_USART1_RXC
void uart1_rx_isr(void)
{Receive1Counter++; 
 Uart1ReceiveBuffer[Receive1Write++]=UDR1;
 //Receive1Write&=Receive1BufferWrap;
}

//returns number of symbols in UART buffer 
char GetUart1Counter(void) //27 cycles
{char n;
 CLI(); n=Receive1Counter; SEI();
 return n;
}

//Returns one (earliest) symbol from UART buffer
void ReturnUart1Symbol(char n)
{ CLI();
 Receive1Read-=n;  
 //Receive1Read&=Receive1BufferWrap; 
 Receive1Counter+=n;   
 SEI();
} 
 
char GetUart1Symbol(void) //25 cycles
{char symbol;
 symbol=Uart1ReceiveBuffer[Receive1Read++];
 //Receive1Read&=Receive1BufferWrap; 
 CLI(); Receive1Counter--; SEI();
return symbol;
}

/////////////////////////////////////
//UART1 initialize
void Uart1Init(void)
{UCSR1B = 0x00; //disable while setting baud rate
 UCSR1A = 0x00; //x2
 UCSR1C = 0x06;
 UBRR1 =  BaudRate; //230
 UCSR1B = 0xD8; //RXC + TXC
}
