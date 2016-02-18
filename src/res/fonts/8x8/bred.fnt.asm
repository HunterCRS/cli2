;---------------------------------------
; CLi² (Command Line Interface) default fonts
; 2015 © breeze/fishbone crew
;---------------------------------------

		org	#C000

sFont4		db	#7f,"FNT"				; #7f+"FNT" - 4 байта сигнатура, что это формат файла FNT
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
		dw	bFont4-taFont4				; 2 байта смещение от текущего адреса до начала данных шрифта

taFont4	;	ds	256,0					; таблица ширины символов для пропорционального шрифта
								; если задан bit 7 в типе шрифта

								; Мета-данные:
		dw	neFont4-nFont4				; 2 байта длина название шрифта
nFont4		db	"Bred",#00				; * байт название шрифта, оканчивающихся кодом #00
neFont4		
		dw	aeFont4-aFont4				; 2 байта длина автора шрифта
aFont4		db	"Author unknown",#00				; * байт автор шрифта, оканчивающихся кодом #00
aeFont4		
		dw	deFont4-dFont4				; 2 байта длина описания шрифта
dFont4		db	#00 					; * байт описание шрифта, оканчивающихся кодом #00
deFont4

bFont4		incbin  "rc/fonts/8x8/bred.bin"			; Начало данных шрифта
eFont4

; 	DISPLAY "bFont4-taFont4",/A,bFont4-taFont4

	SAVEBIN "install/system/res/fonts/8x8/bred.fnt", sFont4, eFont4-sFont4