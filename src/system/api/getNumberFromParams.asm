;---------------------------------------
; CLi² (Command Line Interface) API
; 2013,2016 © breeze/fishbone crew
;---------------------------------------
; MODULE: #47 getNumberFromParams
;---------------------------------------
; Получить число из строки параметров
; i: DE - адрес начала строки
; o: H=0,L - значение (число)
;    DE - адрес продолжения строки
;     A = #ff - ошибка (не число)
;---------------------------------------
_getNumberFromParams
		call	_eatSpaces
		ex	hl,de
		jp	_str2int
;---------------------------------------
