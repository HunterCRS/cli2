;---------------------------------------
; CLi² (Command Line Interface) API
; 2013,2016 © breeze/fishbone crew
;---------------------------------------
; MODULE: #52 waitAnyKey
;---------------------------------------
; Ожидание нажатия любой клавиши
;---------------------------------------
_waitAnyKey	halt
		call	_getKeyWithShift			; Опрашиваем клавиатуру

		cp	#00					; Если ничего не нажали
		jp	z,_waitAnyKey
		ret
;---------------------------------------
