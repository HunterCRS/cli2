;---------------------------------------
; CLi² (Command Line Interface) API
; 2016 © breeze/fishbone crew
;---------------------------------------
; MODULE: #60 setCurrentPaper
;---------------------------------------
; Установить текущий цвет (Paper) печати
; i:A' - номер цвета из палитры (0-15)
;---------------------------------------
_setCurrentPaper
		ex	af,af'
		jp	setPaper
;---------------------------------------
