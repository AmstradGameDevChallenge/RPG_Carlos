;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (CYGWIN)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _juego
	.globl _pausaTecladoLibre
	.globl _mydrawStringM1
	.globl _cpct_restoreState_mxor_u8
	.globl _cpct_setSeed_mxor
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_setDrawCharM1
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_scanKeyboard_f
	.globl _cpct_memset
	.globl _cpct_disableFirmware
	.globl _sig_nivel
	.globl _cursorConsola
	.globl _nivel
	.globl _entidad
	.globl _paletaM1
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_entidad::
	.ds 60
_nivel::
	.ds 1
_cursorConsola::
	.ds 1
_sig_nivel::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:41: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:45: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:47: while (1) {
00107$:
;src/main.c:48: cpct_setVideoMode(1);
	ld	l, #0x01
	call	_cpct_setVideoMode
;src/main.c:49: cpct_clearScreen(0x00);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:50: cpct_setPalette(paletaM1,4);
	ld	hl, #0x0004
	push	hl
	ld	hl, #_paletaM1
	push	hl
	call	_cpct_setPalette
;src/main.c:51: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:54: cpct_setDrawCharM1(2, 0);
	ld	hl, #0x0002
	push	hl
	call	_cpct_setDrawCharM1
;src/main.c:55: mydrawStringM1("         Don Mendo and Lady Sol", cpctm_screenPtr(CPCT_VMEM_START, 0, 0));
	ld	hl, #0xc000
	push	hl
	ld	hl, #___str_0
	push	hl
	call	_mydrawStringM1
;src/main.c:56: mydrawStringM1("                   in", cpctm_screenPtr(CPCT_VMEM_START, 0, 8));
	ld	hl, #0xc050
	push	hl
	ld	hl, #___str_1
	push	hl
	call	_mydrawStringM1
;src/main.c:57: mydrawStringM1("           Castle Concepcion", cpctm_screenPtr(CPCT_VMEM_START, 0, 16));
	ld	hl, #0xc0a0
	push	hl
	ld	hl, #___str_2
	push	hl
	call	_mydrawStringM1
;src/main.c:58: mydrawStringM1("Mendo was in love with Lady Sol, a rich ", cpctm_screenPtr(CPCT_VMEM_START, 0, 40));
	ld	hl, #0xc190
	push	hl
	ld	hl, #___str_3
	push	hl
	call	_mydrawStringM1
;src/main.c:59: mydrawStringM1("and beautiful woman. He was so poor that", cpctm_screenPtr(CPCT_VMEM_START, 0, 48));
	ld	hl, #0xc1e0
	push	hl
	ld	hl, #___str_4
	push	hl
	call	_mydrawStringM1
;src/main.c:60: mydrawStringM1("he couldn't marry her. He decided to go ", cpctm_screenPtr(CPCT_VMEM_START, 0, 56));
	ld	hl, #0xc230
	push	hl
	ld	hl, #___str_5
	push	hl
	call	_mydrawStringM1
;src/main.c:61: mydrawStringM1("to the Crusades to get Fortune and Fame.", cpctm_screenPtr(CPCT_VMEM_START, 0, 64));
	ld	hl, #0xc280
	push	hl
	ld	hl, #___str_6
	push	hl
	call	_mydrawStringM1
;src/main.c:63: mydrawStringM1("When he became a brave hero, he heard", cpctm_screenPtr(CPCT_VMEM_START, 0, 80));
	ld	hl, #0xc320
	push	hl
	ld	hl, #___str_7
	push	hl
	call	_mydrawStringM1
;src/main.c:64: mydrawStringM1("Lady Sol was forced to marry don Ricardo", cpctm_screenPtr(CPCT_VMEM_START, 0, 88));
	ld	hl, #0xc370
	push	hl
	ld	hl, #___str_8
	push	hl
	call	_mydrawStringM1
;src/main.c:65: mydrawStringM1("a very important noble. ", cpctm_screenPtr(CPCT_VMEM_START, 0, 96));
	ld	hl, #0xc3c0
	push	hl
	ld	hl, #___str_9
	push	hl
	call	_mydrawStringM1
;src/main.c:67: mydrawStringM1("Bring to an end the bloody Crusades war,", cpctm_screenPtr(CPCT_VMEM_START, 0, 112));
	ld	hl, #0xc460
	push	hl
	ld	hl, #___str_10
	push	hl
	call	_mydrawStringM1
;src/main.c:68: mydrawStringM1("go through the underway passage and ", cpctm_screenPtr(CPCT_VMEM_START, 0, 120));
	ld	hl, #0xc4b0
	push	hl
	ld	hl, #___str_11
	push	hl
	call	_mydrawStringM1
;src/main.c:69: mydrawStringM1("finally assault the Castle to help Don ", cpctm_screenPtr(CPCT_VMEM_START, 0, 128));
	ld	hl, #0xc500
	push	hl
	ld	hl, #___str_12
	push	hl
	call	_mydrawStringM1
;src/main.c:70: mydrawStringM1("Mendo to go back to his love: Lady Sun.", cpctm_screenPtr(CPCT_VMEM_START, 0, 136));
	ld	hl, #0xc550
	push	hl
	ld	hl, #___str_13
	push	hl
	call	_mydrawStringM1
;src/main.c:71: mydrawStringM1("PRESS ANY KEY TO START", cpct_getScreenPtr(CPCT_VMEM_START, 0, 168));
	ld	hl, #0xa800
	push	hl
	ld	h, #0xc0
	push	hl
	call	_cpct_getScreenPtr
	ld	bc, #___str_14+0
	push	hl
	push	bc
	call	_mydrawStringM1
;src/main.c:74: pausaTecladoLibre();
	call	_pausaTecladoLibre
;src/main.c:78: do {
	ld	c, #0x00
00101$:
;src/main.c:79: cpct_scanKeyboard_f();
	push	bc
	call	_cpct_scanKeyboard_f
	pop	bc
;src/main.c:80: semilla++;
	inc	c
;src/main.c:82: while (!cpct_isAnyKeyPressed_f());
	push	bc
	call	_cpct_isAnyKeyPressed_f
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00101$
;src/main.c:85: if (!semilla)
	ld	a,c
	ld	l,a
	or	a, a
	jr	NZ,00105$
;src/main.c:86: semilla = 1;
	ld	l, #0x01
00105$:
;src/main.c:88: cpct_srand8(semilla);
	ld	h, #0x00
	ld	de,#0x0000
	call	_cpct_setSeed_mxor
	call	_cpct_restoreState_mxor_u8
;src/main.c:89: juego();
	call	_juego
	jp	00107$
_paletaM1:
	.db #0x54	; 84	'T'
	.db #0x40	; 64
	.db #0x4b	; 75	'K'
	.db #0x44	; 68	'D'
___str_0:
	.ascii "         Don Mendo and Lady Sol"
	.db 0x00
___str_1:
	.ascii "                   in"
	.db 0x00
___str_2:
	.ascii "           Castle Concepcion"
	.db 0x00
___str_3:
	.ascii "Mendo was in love with Lady Sol, a rich "
	.db 0x00
___str_4:
	.ascii "and beautiful woman. He was so poor that"
	.db 0x00
___str_5:
	.ascii "he couldn't marry her. He decided to go "
	.db 0x00
___str_6:
	.ascii "to the Crusades to get Fortune and Fame."
	.db 0x00
___str_7:
	.ascii "When he became a brave hero, he heard"
	.db 0x00
___str_8:
	.ascii "Lady Sol was forced to marry don Ricardo"
	.db 0x00
___str_9:
	.ascii "a very important noble. "
	.db 0x00
___str_10:
	.ascii "Bring to an end the bloody Crusades war,"
	.db 0x00
___str_11:
	.ascii "go through the underway passage and "
	.db 0x00
___str_12:
	.ascii "finally assault the Castle to help Don "
	.db 0x00
___str_13:
	.ascii "Mendo to go back to his love: Lady Sun."
	.db 0x00
___str_14:
	.ascii "PRESS ANY KEY TO START"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
