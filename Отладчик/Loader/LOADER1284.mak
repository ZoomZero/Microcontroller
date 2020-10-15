CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION=723 -D__BUILD=43 -D_EE_EXTIO -DATMega1284P  -l -g -MLongJump -MHasMul -MEnhanced -Wf-r20_23 -Wf-use_elpm -Wf-const_is_flash -DCONST="" 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -g -nb:43 -e:0x20000 -ucrtboot128.o -bvector:0x1e000.0x20000 -bfunc_lit:0x1e08c.0x20000 -dram_end:0x40ff -bdata:0x100.0x40ff -dhwstk_size:30 -beeprom:0.4096 -fihx_coff -S2
FILES = Uart1.o main.o Uart0.o flash.o 

LOADER1284:	$(FILES)
	$(CC) -o LOADER1284 $(LFLAGS) @LOADER1284.lk   -lcatm128gr
Uart1.o: C:\iccv7avr\include\iom1284pv.h C:\iccv7avr\include\_iom164to644pv.h C:\iccv7avr\include\macros.h C:\iccv7avr\include\AVRdef.h .\sisdef.h
Uart1.o:	Uart1.c
	$(CC) -c $(CFLAGS) Uart1.c
main.o: C:\iccv7avr\include\iom1284pv.h C:\iccv7avr\include\_iom164to644pv.h C:\iccv7avr\include\macros.h C:\iccv7avr\include\AVRdef.h .\Uart0.h .\Uart1.h .\flash.h
main.o:	main.c
	$(CC) -c $(CFLAGS) main.c
Uart0.o: C:\iccv7avr\include\iom1284pv.h C:\iccv7avr\include\_iom164to644pv.h C:\iccv7avr\include\macros.h C:\iccv7avr\include\AVRdef.h .\sisdef.h
Uart0.o:	Uart0.c
	$(CC) -c $(CFLAGS) Uart0.c
flash.o:
flash.o:	flash.c
	$(CC) -c $(CFLAGS) flash.c
