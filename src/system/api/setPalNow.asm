;---------------------------------------
; CLi² (Command Line Interface) API
; 2013,2016 © breeze/fishbone crew
;---------------------------------------
; MODULE: #5C setPalNow
;---------------------------------------
; Изменить палитру для текущего активного графического (текстового)
; режима. В отличии от setTxtPalette и setGfxPalette палитра не сохраняется
; и при переключении ALT+F1…F4 будет восстановлена та, которая была задана
; для данного режима.
; i: HL - адрес начала данных палитры
;---------------------------------------
_setPalNow	call	storeRam0
		ld	a,#ff
		call	_setRamPage0

		ld	bc,tsFMAddr
		ld 	a,%00010000				; Разрешить приём данных для палитры (?) Bit 4 - FM_EN установлен
		out	(c),a

		ld 	de,#0000				; Память с палитрой замапливается на адрес #0000
		ld	bc,512
		ldir

		ld 	bc,tsFMAddr			
		xor	a					; Запретить, Bit 4 - FM_EN сброшен
		out	(c),a

		ld	bc,tsPalSel
		xor	a
		out	(c),a					; Выбрать 0ю группу и 16 палитр (если выбран режим 16ц)
		
		jp	reStoreRam0
;---------------------------------------
