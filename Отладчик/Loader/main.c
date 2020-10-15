// Target : ATMega1284P
// Crystal: 24Mhz

#include <iom1284pv.h>
#include <macros.h>

#include "Uart0.h"
#include "Uart1.h"
#include "flash.h"

#define Uart0TxC (UCSR0A&0x40)

//#pragma global_register BufAdr:20
//int BufAdr;

#pragma global_register BufAdr:20
int BufAdr;
#pragma global_register Counter:21
unsigned char Counter;
#pragma global_register FlashPointer:22
const char *FlashPointer;


#pragma abs_address:0x68
const int z = 0xC000;
#pragma end_abs_address

char ServZone;
char SysNum;

/*asm(".area vector (abs)");
asm(".org 4");
asm("jmp _LoaderL");
asm("jmp _LoaderH");
asm(".area text");*/

const char LdL[] = "LoaderL";
const char LdH[] = "LoaderH";

void LoaderL(void)
{
 FlashToUart0(LdL);
}

void LoaderH(void)
{
 FlashToUart0(LdH);
}

void WaitSpm(char Command)
{  
   while(SPMCSR&1) WDR();
   SPMCSR=Command;
   asm("spm");
}

char ProgBuf[256];

void PageToUart0(char page)
{
 char cnt = 0;
 const char *p;
 p = (const char*)(page<<8);
 SymbolToUart0('P');
 SymbolToUart0('g');
 SymbolToUart0(page);
 while(1)
 {
  SymbolToUart0Gar(*p++);
  if(++cnt == 0) break;
 }
}

void BufToFlash(char page)
{
 CLI();	 //!!!!!!!
 asm("mov	r31, r16"); 
 asm("ldi	r30, 0x00"); 
   
 WaitSpm(0x03);//������� ��������  
 WaitSpm(0x11); 
	    	 
 Counter = 128;  
    
 asm("ldi r26, <_ProgBuf");  
 asm("ldi r27, >_ProgBuf");  
 while(1)
 {
   asm("ld r0,x+");
   asm("ld r1,x+");
   WaitSpm(0x01);
   Counter--;
   if(Counter)  asm("adiw r30, 2");
   else break;
  }
 
  asm("ldi	r30, 0x00"); 
  WaitSpm(0x05);//������ 
  WaitSpm(0x11); 
  SEI();    
}


void BufToUart0(void)
{
 char k;
 k=0;
 while(1)
   {
   	SymbolToUart0(ProgBuf[k++]);
    if(!k) break;
   }
}

void Load0(void)
{
 const char *p;
 char r;
 p = (const char *)0xE000; //����� ������ ����������
 r = 0;
 RAMPZ = 1;
 while(1)
 {
  ProgBuf[r] = *p++;
  if (++r == 0) break;
 }
 ProgBuf[0x68] = 0;
 ProgBuf[0x69] = ServZone;
 ProgBuf[0x6A] = SysNum;
 RAMPZ = 0;
 BufToFlash(0);
 //BufToUart0();
 PageToUart0(0);
}

void MayBeLoad0(void)
{
 if (GetUart0Counter() < 4) return;
 if (GetUart0Symbol() != 'L') return;
 if (GetUart0Symbol() != 'O') return;
 if (GetUart0Symbol() != 'A') return;
 switch (GetUart0Symbol())
 {
  		case '0': Load0(); break;
		case 'I': FlashToUart0(Name); break;
		case 'V': FlashToUart0(Vers); SymbolToUart0(ServZone); break;
		case 'D': break;
		case 'd': break;
		case 'R': break;
		case 'r': break;
		case 's': asm("jmp 0x0000");
		default: return;
 }
}

void MayBeLoad1(void)
{
 if (GetUart1Counter() < 4) return;
 if (GetUart1Symbol() != 'L') return;
 if (GetUart1Symbol() != 'O') return;
 if (GetUart1Symbol() != 'A') return;
 switch (GetUart1Symbol())
 {
  		case '0': Load0(); break;
		case 'I': FlashToUart1(Name); break;
		case 'V': FlashToUart1(Vers); break;
		case 'D': break;
		case 'd': break;
		case 'R': break;
		case 'r': break;
		case 's': asm("jmp 0x0000");
		default: return;
 }
}

void main(void)
{
 MCUCR = 1;
 MCUCR = 2;
 RAMPZ = 0;
 ServZone = *((const char*)(0x69));
 SysNum = 3;
 RAMPZ = 1;
 Uart0Init();
 Uart1Init();
 //PageToUart0(0);
 //FlashToUart0(Name);
 //FlashToUart0(Vers);
 //LoaderL();
 //Load0();
 while(1)
 {
  MayBeLoad0();
  MayBeLoad1();
 }
 
 while(1)
 {

 }
 //asm("jmp 0x1E000");
 //StringToUart0("TxComplete");
}

