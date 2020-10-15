Project:      MCI1284
Build Number: 43
Date:         Mon Aug 17 14:12:36 2020
Compiler:     ICCAVR
Version:      7.22C

NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   008C   0015 =     21. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __lit_start
       008C  _MyName
       00A1  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   00A1   0005 =      5. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00A1  __idata_start
       00A6  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   00A6   0578 =   1400. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0053  __text_start
       0053  __start
       0075  _exit
       0076  _timer0_ovf_isr
       009B  _ana_comp_isr
       0100  _comparator_init
       0106  _timer0_init
       0111  _main
       0123  _uart0_tx_isr
       012F  _uart0_udre_isr
       015D  _SymbolToUart0
       017F  _SymbolToUart0Gar
       0187  _StringToUart0
       0196  _FlashToUart0
       01A8  _uart0_rx_isr
       01D4  _GetUart0Counter
       01DB  _ReturnUart0Symbol
       01F2  _GetUart0Symbol
       020E  _GetNextUartSym
       0217  _Uart0Init
       0229  _InitTimer1
       0242  _timer1_compa_isr
       024C  _CallLoaderL
       027C  _MayBeLoad
       0296  _CommandDc
       02B9  _adc_init
       02CC  _adc_isr
       02FF  pop_xgset003C
       0304  push_xgsetF0FC
       0306  push_xgset30FC
       0308  push_xgset00FC
       030A  push_xgset003C
       030F  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   0005 =      5. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0104  _ChNum
       0105  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0105   1627 =   5671. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0105  _Frez
       0105  __bss_start
       0109  _FreqOld
       010D  _Freq
       0111  _Receive0Counter
       0113  _Receive0Read
       0115  _Receive0Write
       0117  _Uart0ReceiveBuffer
       0217  _TxCFlag
       0218  _Count0
       0219  _Write0
       021A  _Read0
       021B  _FIFO0
       031B  _Tc1Flag
       031C  _ArBuf
       171C  _AdcBuf
       172C  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0064 =    100. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\iccv7avr\lib\crtatmega.o	[ crtatmega.s ]
main.o	[ main.c ]
Uart0.o	[ Uart0.c ]
tc1.o	[ tc1.c ]
maintenance.o	[ maintenance.c ]
flashaps.o	[ flashaps.c ]
adc.o	[ adc.c ]
<library>	[ gpop2.s, gpush.s ]

User Global Definitions

ram_end = 0x40ff
hwstk_size = 0x1e

Area Definitions

-bfunc_lit:0x8c.0x10000
-bdata:0x100.0x40ff

