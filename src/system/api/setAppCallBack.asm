;---------------------------------------
; CLi² (Command Line Interface) API
; 2013,2016 © breeze/fishbone crew
;---------------------------------------
; MODULE: #3F setAppCallBack
;---------------------------------------
; Установить адрес вызова подпрограммы при переключении Alt+F1/F2/F3/F4
; i: HL - адрес подпрограммы
;---------------------------------------
_setAppCallBack	ld	(callBackApp),hl
		ret
;---------------------------------------
