// Target : ATMega1284P
// Crystal: 24Mhz

#include <iom1284pv.h>
#include <macros.h>

//#include "FlashAbs.h"
#include "sisdef.h"


#define TransmitSize0 256
#define FIFO0Wrap (TransmitSize0-1)

char FIFO0[TransmitSize0];
unsigned char Read0, Write0;
unsigned char Count0;

#define EnableUDRE0()    UCSR0B|=0x20
#define DisableUDRE0()   UCSR0B&=~0x20 

#define SetTx0En()		PORTA|=0x02 
#define ClrTx0En()		PORTA&=~0x02
#define Tx0En			(PORTA&0x02) 

#define Udr0Empty		(UCSR0A&0x20)
#define Uart0TxC		(UCSR0A&0x40)

char TxCFlag;
#define SetTxC() TxCFlag |= 1
#define ClrTxC() TxCFlag &= ~1

#pragma interrupt_handler uart0_tx_isr:iv_USART0_TXC
void uart0_tx_isr(void)
{//ClrTx0En();	
	SetTxC();
}

#pragma interrupt_handler uart0_udre_isr:iv_USART0_UDRE
void uart0_udre_isr(void)
{//SetTx0En();
 	   UDR0=FIFO0[Read0++];
	   //Read0&=FIFO0Wrap;
	   if(--Count0==0) DisableUDRE0();
}

char SymbolToUart0(char s)
{if(Count0 == (TransmitSize0 - 1)) return 0; 
 CLI();
		 FIFO0[Write0++]=s;
		 Count0++;	
		 //Write0&=FIFO0Wrap;
 EnableUDRE0();
 SEI();	
	return 1;  }

void SymbolToUart0Gar(char s)
{while(!SymbolToUart0(s)); }

void StringToUart0(char *ptr)
{while(*ptr) SymbolToUart0Gar(*ptr++);
}

void FlashToUart0(const char *ptr)
{while(*ptr) SymbolToUart0Gar(*ptr++);
}

///////////////////////////
//Receiver Functions   ////
///////////////////////////

//Constant and variable block for UART receiver functions

#define Receive0Size 256
char Uart0ReceiveBuffer[Receive0Size];

int Receive0Write;
int Receive0Read;
int Receive0Counter;

//int Receive0BufferWrap= (Receive0Size-1);

#pragma interrupt_handler uart0_rx_isr:iv_USART0_RXC
void uart0_rx_isr(void)
{Receive0Counter++; 
 Uart0ReceiveBuffer[Receive0Write++]=UDR0;
 //Receive0Write&=Receive0BufferWrap;
}

//returns number of symbols in UART buffer 
int GetUart0Counter(void) //27 cycles
{int n;
 CLI(); n=Receive0Counter; SEI();
 return n;
}

//Returns one (earliest) symbol from UART buffer
void ReturnUart0Symbol(int n)
{ CLI();
 Receive0Read-=n;  
 //Receive0Read&=Receive0BufferWrap; 
  Receive0Counter+=n; 
  
  SEI();
} 
 
char GetUart0Symbol(void) //25 cycles
{char symbol;
 symbol=Uart0ReceiveBuffer[Receive0Read++];
 //Receive0Read&=Receive0BufferWrap; 
 CLI(); Receive0Counter--; SEI();
return symbol;
}

char GetNextUartSym(void)
{while(!Receive0Counter) ;
 return GetUart0Symbol();
}

/////////////////////////////////////
//UART0 initialize

// char size: 8 bit
// parity: Disabled
//ubrr=7 115200
//ubrr=1 460800
//ubrr=0 021600
void Uart0Init(void)
{UCSR0B = 0x00; //disable while setting baud rate
 UCSR0A = 0x00; //x2
 UCSR0C = 0x06;
 
 UBRR0 = BaudRate;
 /*if(PINB&0x40) UBRR0 = BaudRate;
 else		   UBRR0 = 7;  //115200*/
 UCSR0B = 0xD8; //RXC + TXC
}

