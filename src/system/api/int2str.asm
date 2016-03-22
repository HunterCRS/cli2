;---------------------------------------
; CLi² (Command Line Interface) API
; 2013,2016 © breeze/fishbone crew
;---------------------------------------
; MODULE: #36 int2str
; MODULE: #37 char2str
; MODULE: #39 fourbit2str
;---------------------------------------
; int2str перевод int в текст (десятичное число)
; (C) BUDDER/MGN - 2011.12.26
; char2str перевод char(8bit) в текст (десятичное число)
; Added by breeze
;--------------------------------------------------------------
; Преобразовать 16-битное число в строку с десятичным значением
; i: HL - значение (16-бит), DE - адрес начала строки
;--------------------------------------------------------------
_int2str	ld	bc,10000
		call	delit
		ld	(de),a
		inc	de

		ld	bc,1000
		call	delit
		ld	(de),a
		inc	de

;--------------------------------------------------------------
; Преобразовать 8-битное число в строку с десятичным значением
; i: H=0, L - значение (8-бит), DE - адрес начала строки
;--------------------------------------------------------------
_char2str	ld	bc,100
		call	delit
		ld	(de),a
		inc	de
;--------------------------------------------------------------
; Преобразовать 4-битное число в строку с десятичным значением
; i: H=0, L - значение (4-бит), DE - адрес начала строки
;--------------------------------------------------------------
_fourbit2str	ld	bc,10
		call	delit
		ld	(de),a
		inc	de
		
		ld	bc,1
		call	delit
		ld	(de),a
		ret

delit		ld	a,#ff
		or	a
dlit		inc	a
		sbc	hl,bc
		jp	nc,dlit
		add	hl,bc
		add	a,#30
		ret
;---------------------------------------
