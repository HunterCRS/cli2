;---------------------------------------
; CLi² (Command Line Interface) main block
; 2013,2014 © breeze/fishbone crew
;---------------------------------------
		org	#be00
edit256		ds	128," "				; 128 bytes ascii
		ds	128,#0000			; 128 bytes colors
		
		org	#bf00

bufer256	ds	128," "				; 128 bytes ascii
		ds	128,#0000			; 128 bytes colors

		org	#8000
sCliKernel
		include "cli.asm"
		include "ps2.asm"
		include "api.asm"

		include "print.asm"
		include "printE.asm"
		include "budder.asm"
		
		include "commands.asm"
		include "dir.asm"
		include "run.asm"
		include "sh.asm"
		
		include "str2int.asm"
		include "int2str.asm"
		include "hex2int.asm"

		include "messages.asm"
		include "cliparams.asm"
		include "commands.h.asm"
		
		include "wc.h.asm"
		include "tsconf.h.asm"

eCliKernel	nop
	DISPLAY "kernel size",/A,eCliKernel-sCliKernel
	DISPLAY "kernel end",/A,eCliKernel
	SAVEBIN "install/system/kernel.sys", sCliKernel, eCliKernel-sCliKernel