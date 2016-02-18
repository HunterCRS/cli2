;---------------------------------------
; CLi² (Command Line Interface) API Header
; 2013,2015 © breeze/fishbone crew
;---------------------------------------
cliKernel		equ	#8003			; Точка входа в API

initSystem		equ	#00			; Начальная инициализация системы
reInitSystem		equ	#01			; Переинициализация системы (вторичный «тёплый» пуск)

getCliVersion		equ	#02			; Получить текущую версию ядра системы
							; o: H - major, L - minor version

exitSystem		equ	#03			; Восстановление WildCommander и выход из системы

clearTxtMemory		equ	#04			; Очистить всю память выделенную для текстового режима

clearGfxMemory		equ	#05			; Очистить всю память выделенную для графического режима
							; i:B - номер графического экрана (1/2/3)
							;   C - номер цвета очистки

switchTxtMode		equ	#06			; Переключиться на текстовый экран (Screen 0)

switchGfxMode		equ	#07			; Переключиться на графический экран
							; i:B - номер графического экрана (1/2/3)

setGfxColorMode		equ	#08			; Установить цветовой режим (zx/16c/256c) для графического экрана
							; i:A' - цветовой режим:
							;	   %00 - ZX
							;          %01 - 16c
							;          %10 - 256c
							;          %11 - txt
							;   B - номер графического экрана (1/2/3)

setGfxResolution	equ	#09			; Установить разрешение для графического экрана
							; i:A' - разрешение экрана:
							;	   %00 - 256x192
							;          %01 - 320x200
							;          %10 - 320x240
							;          %11 - 360x288
							;   B - номер графического экрана (1/2/3)

setScreenOffsetX	equ	#0A			; Установить смещение для графического экрана по оси X
							; i:HL - смещение (0-511)
							;   B - номер графического экрана (1/2/3)
setScreenOffsetY	equ	#0B			; Установить смещение для графического экрана по оси Y
							; i:HL - смещение (0-287)
							;   B - номер графического экрана (1/2/3)

printInit		equ	#0C			; Ининциализация печати
editInit		equ	#0D			; Ининциализация печати (линия ввода данных 1>)

printString		equ	#0E			; Вывести обычную строку в консоль
printInputString	equ	#0F			; Вывести обычную строку в консоль (линия ввода данных 1>)
printOkString		equ	#10			; Вывести информационное сообщение (ok) в консоль
printErrorString	equ	#11			; Вывести сообщение об ошибке (error) в консоль
printAppNameString	equ	#12			; Вывести информационное сообщение (Название приложения/версия) в консоль
printCopyrightString	equ	#13			; Вывести информационное сообщение (Copyright) в консоль
printInfoString		equ	#14			; Вывести информационное сообщение в консоль
							;  i: HL - адрес строки, заканчивающейся #00
							; Управляющие коды в тексте:
							;	\x09 - переместить курсок у ближайшей позиции tab (кратной 8?)
							;	\x0c - удалить 1 символ слева и переместить курсор на -1 позицию
							;	\x0f - установить текущий цвет ink из системного цвета
							;	\x10\xNN - установить текущий цвет ink из палитры NN
							;	\x11\xNN - установить текущий цвет paper из палитры NN
							;	\x12 - установить текущий цвет paper из системного цвета
							;	\x14 - инверсия. поменять текущие ink и paper местами
							;	\x16\xXX\xYY - установить тукущую позицию печати на XX,YY
							;	\xNN - вывести символ кодом NN
							;	\x0d - код «enter». X устанавливается в 0, Y увеличивается на 1
							;	\x0a - перети на новую строку X без изменений(?), Y увеличивается на 1

printStatusString	equ	#15			; Вывести информационное сообщение (status) в консоль как в Linux (начинающиеся с " * ")
printStatusOk		equ	#16			; Дополнить сообщение (status) [  OK  ]
printStatusError	equ	#17			; Дополнить сообщение (status) [ERROR!]

printErrParams		equ	#18			; Вывести сообщение об ошибке (wrong parametrs) в консоль
printFileNotFound	equ	#19			; Вывести сообщение об ошибке (file not found) в консоль
printFileTooBig		equ	#1A			; Вывести сообщение об ошибке (file too big) в консоль
printRestore		equ	#1B			; Восстановить Ink & Paper по умолчанию и сделать перевод строки

printContinue		equ	#1C			; Вывести сообщение (press any key to contonue) в консоль

printInputYN		equ	#1D			; Вывести сообщение в консоль и ожидать нажатия (Y/N)
printInputRIA		equ	#1E			; Вывести сообщение в консоль и ожидать нажатия (R/I/A)
							;  i: HL - адрес строки, заканчивающейся #00

printCodeDisable	equ	#1F			; Запретить(1) / Разрешить(0) печать управляющих символов (кроме #0d/#0a)
							;  i: B - значение
printWithScroll		equ	#20			; Спрашивать(1) ли «Scroll?» при печати 30 строк за раз
							;  i: B - значение: Разрешить(1) / Запретить(0)

clearIBuffer		equ	#21			; Очистить буффер ввода

checkCallKeys		equ	#22			; Выполнить подпрограммы по таблице согласно заданным ключам
							;  i: HL - адрес строки с ключами
							;     DE - адрес таблицы ключей и подпрограмм
							;  o: A = #ff - неправильный (отсутсвующий в таблице) ключ

loadFile		equ	#23			; Загрузить файл по указанному адресу
							;  i: HL - адрес строки именем файла (или путём до него)
							;     DE - адрес загрузки файла
							;  o: A = #ff ошибка, A' = код ошибки

loadFileLimit		equ	#24			; Загрузить файл по указанному адресу, предварительно проверив его размер
							;  i: HL - адрес строки именем файла (или путём до него)
							;     DE - адрес загрузки файла
							;     BC - размер проверяемого файла
							;  o: A = #ff ошибка, A' = код ошибки

loadFileParts		equ	#25			; Загрузить часть файла по указанному адресу
							;  i: HL - адрес строки именем файла (или путём до него)
							;     DE - адрес загрузки файла
							;     BC - размер загружаемой части в блоках (по 512б)
							;  o: A = #ff ошибка, A' = код ошибки

loadNextPart		equ	#26			; Загрузить следующую часть файла по указанному адресу
							; o: A = #ff ошибка, A' = eFileEnd - конец файла

saveFile		equ	#27			; reserved
saveFileParts		equ	#28			; reserved
saveNextPart		equ	#29			; reserved

createFile		equ	#2A			; Создать файл в активной директории
							; i:HL - имя файла(1-12),#00
							;   BC,DE размер файла в байтах
							;         (bc - младшая часть, de - старшая часть)

createDir		equ	#2B			; Создать каталог в активной директории
							; i:HL - имя файла(1-12),#00
							; o:NZ - операция не удалась
							;    Z - директория создана

deleteFileDir		equ	#2C			; reserved
renameFileDir		equ	#2D			; reserved


checkFileExist		equ	#2E			; Проверить существует ли файл в активной директории
							; i:HL - имя файла(1-12),#00
							; o:NZ - файл существует
							;    Z - файл не найден

checkDirExist		equ	#2F			; Проверить существует ли катала в активной директории 
							; i:HL - имя каталога(1-12),#00
							; o:NZ - каталог существует
							;    Z - каталог не найден

getTxtPalette		equ	#30			; reserved
getGfxPalette		equ	#31			; reserved

setTxtPalette		equ	#32			; Установить палитру для текстового режима
							; i: HL - адрес начала данных палитры
							;    D - номер одиной из 16-ти палитр в которую начинать загрузку (0,1,2,3… 15)
							;	 Если палтира больше 16-ти цветов, то D должно быть = 0
							;    BC - размер палитры
							;    
setGfxPalette		equ	#33			; Установить палитру для графического режима
							; i: HL - адрес 512-ти байтов палитры
							;    B - номер графического экрана (1,2,3)

setFont			equ	#34			; Установить шрифт
							; i: HL - адрес 2048-ти байтов шрифта

str2int			equ	#35			; Преобразовать строку в число
							; i: HL - адрес начала строки
							; o: HL - число
							;    A = #ff - ошибка

int2str			equ	#36			; Преобразовать 16-битное число в строку с десятичным значением
							; i: HL - значение (16-бит), DE - адрес начала строки

char2str		equ	#37			; Преобразовать 8-битное число в строку с десятичным значением
							; i: H=0, L - значение (8-бит), DE - адрес начала строки

char2hex		equ	#38			; Преобразовать 8-битное число в строку с шестнадцатиричным значением
							; i: A' - значение (8-бит), DE - адрес начала строки

fourbit2str		equ	#39			; Преобразовать 4-битное число в строку с десятичным значением
							; i: H=0, L - значение (4-бит), DE - адрес начала строки

mult16x8		equ	#3A			; Умножение 16-битного числа на 8-битное
							; i: HL - 16-битное число, A' - 8-битное число
							; o: DE - старшая часть, HL - младшая часть

divide16_16		equ	#3B			; Деление 16-битного числа на 16-битное число
							; i: HL / DE
							; o: BC, HL - остаток

parseLine		equ	#3C			; Обработка ввёдённой строки с командой и параметрами
							; i: DE - адрес начала строки
							; o:  A - #ff - ошибка

getPanelStatus		equ	#3D			; Получить состояние панелей Wild Commander
							; o: A - значение

eatSpaces		equ	#3E			; Удалить лишние пребелы перед словом
							; i: DE - адрес начала строки для проверки
							; o: DE - адрес начала строки

setAppCallBack		equ	#3F			; Установить адрес вызова подпрограммы при переключении Alt+F1/F2(F3)
							; i: HL - адрес подпрограммы

setRamPage0		equ	#40			; Включить указанную банку по адресу #0000
							; i: A' - номер банка

restoreWcBank		equ	#41			; Включить банку WildCommander'а по адресу #0000

moveScreenInit		equ	#42			; Инициализировать положение в 0,0
moveScreenUp		equ	#43			; Сдвинуть текущий графический экран вверх
moveScreenDown		equ	#44			; Сдвинуть текущий графический экран вниз
moveScreenLeft		equ	#45			; Сдвинуть текущий графический экран влево
moveScreenRight		equ	#46			; Сдвинуть текущий графический экран вправо
							; i: A' - количество пикселей

getNumberFromParams	equ	#47			; Получить число из строки параметров
getHexFromParams	equ	#48			; Получить число (шеснадцатиричное) (#AB) из строки параметров
							; i: DE - адрес начала строки
							; o: H=0,L - значение (число)
							;    DE - адрес продолжения строки
							;     A - #ff - ошибка (не число)

getHexPairFromParams	equ	#49			; Получить пару чисел (шеснадцатиричных) через запятую (#A1,#B2) из строки параметров
							; i: DE - адрес начала строки
							; o: H - первое значение (число), L - второе
							;    DE - адрес продолжения строки
							;     A - #ff - ошибка (не число)


nvRamOpen		equ	#4A			; Открыть доступ к ячейкам nvRam
nvRamClose		equ	#4B			; Закрыть доступ к ячейкам nvRam

nvRamGetData		equ	#4C			; Прочитать данные из ячейки nvRam
							; i: A' - номер ячейки
							; o: A - значение						

nvRamSetData		equ	#4D			; Записать данные в ячейки nvRam
							; i: A' - номер ячейки
							;    L - новые данные

							; Ячейки nvRam:
							; #00 – регистр секунд
							; #01 – регистр секунд (будильник) [реализовано?]
							; #02 – регистр минут
							; #03 – регистр минут (будильник) [реализовано?]
							; #04 – регистр часов
							; #05 – регистр часов (будильник) [реализовано?]
							; #06 – регистр дня недели
							; #07 – регистр дня месяца
							; #08 – регистр месяца
							; #09 – регистр года
							; #0A - статусная ячейка A. Чтение <- #00. [???]
							; #0B - статусная ячейка B. Чтение <- #02.
							;			    Запись -> установка бита data mode
							; #0C - статусная ячейка C. Чтение <- 2-й бит = 0/1 - статус Write Protect SD карты
							;				      3-й бит = 0/1 - статус нахождения SD карты в разъеме
							;			    Запись -> 0-ой бит = 1 — сброс буфера кодов PS/2 клавиатуры
							;				      1-й бит = 0/1 — управляет состоянием Caps Lock Led
							; #0D - статусная ячейка D. Чтение <- #80. [???]
							; ...
							; #F0…#FF — любая из ячеек этой группы!
							;	    запись -> #00 — подготовить данные о версии базовой конфигурации
							;	    запись -> #01 — подготовить данные о версии bootloader
							;	    запись -> #02 — подготовить данные с PS/2 клавиатуры
							;             чтение <- скан-код клавиатуры

ps2Init			equ	#4E			; Инициализация драйвера клавиатуры.

ps2ResetKeyboard	equ	#4F			; Переинициализировать клавиатуру (сброс при переполнении буфера)
ps2GetScanCode		equ	#50			; Получить Raw ScanCode согласно таблице сканкодов
							; o: HL,DE — четыре скан кода
							;    A - флаг статуса:
							;	#ff - данные не готовы (при этом HL,DE = #00 00 00 00)

getKeyWithShift		equ	#51			; Получить ASCII код нажатой клавиши:
							; o: A - ASCII код нажатой клавиши (включая спецклавиши из constants.asm)

waitAnyKey		equ	#52			; Ожидание нажатия любой клавиши

enableRes		equ	#53			; Разрешить вызов обработчика резидентов
disableRes		equ	#54			; Запретить вызов обработчика резидентов

enableNvram		equ	#55			; Разрешить работу с Nvram (использует опрос клавиатуры на прерывании)
disableNvram		equ	#56			; Запретить работу с Nvram (опрос клавиатуры не будет работать)
