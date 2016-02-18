;---------------------------------------
; CLi² (Command Line Interface) default cursor
; 2013,2014 © breeze/fishbone crew
;---------------------------------------

		org	#C000
sCursor
		db	#7f,"CUR"				; Cursor signature

		;	 01  23  45  67  89  AB  CD  EF
miceCursor	db	#be,#00,#00,#00,#00,#00,#00,#00		; 0
		db	#1b,#ee,#00,#00,#00,#00,#00,#00		; 1
		db	#01,#bb,#ee,#00,#00,#00,#00,#00		; 2
		db	#01,#bb,#bb,#ee,#00,#00,#00,#00		; 3
		db	#00,#1b,#bb,#bb,#ee,#00,#00,#00		; 4
		db	#00,#1b,#bb,#bb,#bb,#00,#00,#00		; 5
		db	#00,#01,#bb,#be,#00,#00,#00,#00		; 6
		db	#00,#01,#bb,#1b,#e0,#00,#00,#00		; 7
		db	#00,#00,#1b,#01,#be,#00,#00,#00		; 8
		db	#00,#00,#1b,#00,#1b,#e0,#00,#00		; 9
		db	#00,#00,#00,#00,#01,#b0,#00,#00		; A
		db	#00,#00,#00,#00,#00,#00,#00,#00		; B
 		db	#00,#00,#00,#00,#00,#00,#00,#00		; C
 		db	#00,#00,#00,#00,#00,#00,#00,#00		; D
 		db	#00,#00,#00,#00,#00,#00,#00,#00		; E
 		db	#00,#00,#00,#00,#00,#00,#00,#00		; F

eCursor	nop

	SAVEBIN "install/system/res/cursors/default.cur", sCursor, eCursor-sCursor