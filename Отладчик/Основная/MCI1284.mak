CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION=723 -D__BUILD=43 -D_EE_EXTIO -DATMega1284P  -l -g -MLongJump -MHasMul -MEnhanced -Wf-r20_23 -Wf-use_elpm -Wf-const_is_flash -DCONST="" 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -g -nb:43 -e:0x20000 -ucrtatmega.o -bfunc_lit:0x8c.0x10000 -dram_end:0x40ff -bdata:0x100.0x40ff -dhwstk_size:30 -beeprom:0.4096 -fihx_coff -S2
FILES = main.o Uart0.o tc1.o maintenance.o flashaps.o adc.o 

MCI1284:	$(FILES)
	$(CC) -o MCI1284 $(LFLAGS) @MCI1284.lk   -lcatm128gr
main.o: C:\iccv7avr\include\iom1284pv.h C:\iccv7avr\include\_iom164to644pv.h C:\iccv7avr\include\macros.h C:\iccv7avr\include\AVRdef.h .\maintenance.h .\tc1.h .\Uart0.h .\flashaps.h .\adc.h
main.o:	main.c
	$(CC) -c $(CFLAGS) main.c
Uart0.o: C:\iccv7avr\include\iom1284pv.h C:\iccv7avr\include\_iom164to644pv.h C:\iccv7avr\include\macros.h C:\iccv7avr\include\AVRdef.h .\sisdef.h
Uart0.o:	Uart0.c
	$(CC) -c $(CFLAGS) Uart0.c
tc1.o: C:\iccv7avr\include\iom1284pv.h C:\iccv7avr\include\_iom164to644pv.h C:\iccv7avr\include\macros.h C:\iccv7avr\include\AVRdef.h
tc1.o:	tc1.c
	$(CC) -c $(CFLAGS) tc1.c
maintenance.o: C:\iccv7avr\include\iom1284pv.h C:\iccv7avr\include\_iom164to644pv.h C:\iccv7avr\include\macros.h C:\iccv7avr\include\AVRdef.h .\tc1.h .\Uart0.h .\flashaps.h
maintenance.o:	maintenance.c
	$(CC) -c $(CFLAGS) maintenance.c
flashaps.o:
flashaps.o:	flashaps.c
	$(CC) -c $(CFLAGS) flashaps.c
adc.o: C:\iccv7avr\include\iom1284pv.h C:\iccv7avr\include\_iom164to644pv.h C:\iccv7avr\include\macros.h C:\iccv7avr\include\AVRdef.h
adc.o:	adc.c
	$(CC) -c $(CFLAGS) adc.c
