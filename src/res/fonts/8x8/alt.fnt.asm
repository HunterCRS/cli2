;---------------------------------------
; CLi² (Command Line Interface) default fonts
; 2015 © breeze/fishbone crew
;---------------------------------------

		org	#C000

sFont2		db	#7f,"FNT"				; #7f+"FNT" - 4 байта сигнатура, что это формат файла FNT
		db	#01					; 1 байт версия формата
		db	#00					; 1 байт тип упаковки данных:
								;		#00 - данные не пакованы
		db	#00					; 1 байт тип шрифта:
								;		#x0 - обычный шрифт
								;		#x1 - наклонный шрифт (italic)
								;		#x2 - жирный шрифт (bold)
								;		#x3 - наклонный + жирный
								;		#8x - если bit 7 = 0, то шрифт моноширный
								;		      и ширина берётся одна для всех
								;		      если bit 7 = 1, то шрифт пропорциональный
								;		      и ширина берётся из таблицы
		db	#01					; 1 байт формат данных шрифта:
								;		#01 - 1 bit (обычный ч/б) шрифт
								;		#02 - 4 bit 16-ти цветный шрифт
								;		#03 - 8 bit 256-ти цветный шрифт
		dw	#0008					; 2 байта ширина шрифта
		dw	#0008					; 2 байта высота шрифта
		dw	bFont2-taFont2				; 2 байта смещение от текущего адреса до начала данных шрифта

taFont2	;	ds	256,0					; таблица ширины символов для пропорционального шрифта
								; если задан bit 7 в типе шрифта

								; Мета-данные:
		dw	neFont2-nFont2				; 2 байта длина название шрифта
nFont2		db	"Alternative",#00			; * байт название шрифта, оканчивающихся кодом #00
neFont2		
		dw	aeFont2-aFont2				; 2 байта длина автора шрифта
aFont2		db	"Author unknown",#00			; * байт автор шрифта, оканчивающихся кодом #00
aeFont2		
		dw	deFont2-dFont2				; 2 байта длина описания шрифта
dFont2		db	"Font with Alternative Codepage",#00 	; * байт описание шрифта, оканчивающихся кодом #00
deFont2

bFont2		incbin  "rc/fonts/8x8/alt.bin"			; Начало данных шрифта
eFont2

; 	DISPLAY "bFont2-taFont2",/A,bFont2-taFont2

	SAVEBIN "install/system/res/fonts/8x8/alt.fnt", sFont2, eFont2-sFont2