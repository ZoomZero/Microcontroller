Project:      LOADER1284
Build Number: 43
Date:         Fri Aug 21 15:54:53 2020
Compiler:     ICCAVR
Version:      7.22C

NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   1E08C   0020 =     32. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       1E08C  __lit_start
       1E08C  _LdL
       1E094  _LdH
       1E09C  _Name
       1E0A7  _Vers
       1E0AC  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   1E0AC   0750 =   1872. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       F056  __start
       F056  __text_start
       F07C  _exit
       F07D  _uart1_tx_isr
       F07E  _uart1_udre_isr
       F0AC  _SymbolToUart1
       F0CE  _SymbolToUart1Gar
       F0D6  _StringToUart1
       F0E5  _FlashToUart1
       F0F7  _uart1_rx_isr
       F11D  _GetUart1Counter
       F122  _ReturnUart1Symbol
       F12F  _GetUart1Symbol
       F145  _Uart1Init
       F157  _LoaderL
       F15B  _LoaderH
       F15F  _WaitSpm
       F167  _PageToUart0
       F18A  _BufToFlash
       F1A7  _BufToUart0
       F1BE  _Load0
       F1F3  _MayBeLoad0
       F25F  _MayBeLoad1
       F2C7  _main
       F2E1  _uart0_tx_isr
       F2ED  _uart0_udre_isr
       F31B  _SymbolToUart0
       F33D  _SymbolToUart0Gar
       F345  _StringToUart0
       F354  _FlashToUart0
       F366  _uart0_rx_isr
       F392  _GetUart0Counter
       F399  _ReturnUart0Symbol
       F3B0  _GetUart0Symbol
       F3CC  _GetNextUartSym
       F3D5  _Uart0Init
       F3E7  pop_xgset003C
       F3EC  pop_xgset00FC
       F3F3  push_xgsetF0FC
       F3F5  push_xgset30FC
       F3F7  push_xgset00FC
       F3F9  push_xgset003C
       F3FE  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0100   0512 =   1298. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __bss_start
       0100  _Receive1Counter
       0101  _Receive1Read
       0102  _Receive1Write
       0103  _Uart1ReceiveBuffer
       0203  _Count1
       0204  _Write1
       0205  _Read1
       0206  _FIFO1
       0306  _ProgBuf
       0406  _SysNum
       0407  _ServZone
       0408  _Receive0Counter
       040A  _Receive0Read
       040C  _Receive0Write
       040E  _Uart0ReceiveBuffer
       050E  _TxCFlag
       050F  _Count0
       0510  _Write0
       0511  _Read0
       0512  _FIFO0
       0612  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   1E000   007C =    124. bytes (abs,ovr,rom)

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          memory   0068   006A =    106. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0068  _z

Files Linked      [ module(s) ]

C:\iccv7avr\lib\crtboot128.o	[ crtboot128.s ]
Uart1.o	[ Uart1.c ]
main.o	[ main.c ]
Uart0.o	[ Uart0.c ]
flash.o	[ flash.c ]
<library>	[ gpop2.s, gpop3.s, gpush.s ]

User Global Definitions

ram_end = 0x40ff
hwstk_size = 0x1e

Area Definitions

-bvector:0x1e000.0x20000
-bfunc_lit:0x1e08c.0x20000
-bdata:0x100.0x40ff

