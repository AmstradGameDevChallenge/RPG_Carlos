;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (CYGWIN)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _m_sfx
	.globl _chardata
	.globl _main
	.globl _setInterruptAtVSYNCStart
	.globl _intHandler
	.globl _reproducirMusica
	.globl _juego
	.globl _pausaTecladoLibre
	.globl _efecto_pliegue
	.globl _mydrawStringM1
	.globl _cpct_restoreState_mxor_u8
	.globl _cpct_setSeed_mxor
	.globl _cpct_akp_SFXPlay
	.globl _cpct_akp_SFXInit
	.globl _cpct_akp_musicPlay
	.globl _cpct_akp_musicInit
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_setDrawCharM1
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_scanKeyboard_if
	.globl _cpct_memset
	.globl _cpct_setInterruptHandler
	.globl _cpct_disableFirmware
	.globl _musica_sonando
	.globl _contador_musica
	.globl _sig_nivel
	.globl _cursorConsola
	.globl _nivel
	.globl _entidad
	.globl _paletaM1
	.globl _playFX
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_entidad::
	.ds 63
_nivel::
	.ds 1
_cursorConsola::
	.ds 1
_sig_nivel::
	.ds 1
_contador_musica::
	.ds 1
_musica_sonando::
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
;src/main.c:43: void playFX (u8 instrumento, u8 nota) {
;	---------------------------------
; Function playFX
; ---------------------------------
_playFX::
;src/main.c:49: cpct_akp_SFXInit (m_sfx);
	ld	hl, #_m_sfx
	push	hl
	call	_cpct_akp_SFXInit
;src/main.c:50: cpct_akp_SFXPlay (instrumento, 15, nota, 0, 0, AY_CHANNEL_B);
	ld	h,#0x02
	ex	(sp),hl
	inc	sp
	ld	hl, #0x0000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	hl, #7+0
	add	hl, sp
	ld	d, (hl)
	ld	e,#0x0f
	push	de
	ld	hl, #8+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_cpct_akp_SFXPlay
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	ret
_paletaM1:
	.db #0x54	; 84	'T'
	.db #0x40	; 64
	.db #0x4b	; 75	'K'
	.db #0x44	; 68	'D'
;src/main.c:53: void reproducirMusica(){
;	---------------------------------
; Function reproducirMusica
; ---------------------------------
_reproducirMusica::
;src/main.c:64: __endasm;
	EXX
	PUSH	AF
	PUSH	BC
	PUSH	DE
	PUSH	HL
;src/main.c:65: cpct_akp_musicPlay();
	call	_cpct_akp_musicPlay
;src/main.c:72: __endasm;
	POP	HL
	POP	DE
	POP	BC
	POP	AF
	EXX
	ret
;src/main.c:75: void intHandler(){
;	---------------------------------
; Function intHandler
; ---------------------------------
_intHandler::
;src/main.c:76: cpct_scanKeyboard_if();  //Para capturar teclado para quitar música o salir durante el juego
	call	_cpct_scanKeyboard_if
;src/main.c:80: if (!contador_musica && musica_sonando) {   
	ld	a,(#_contador_musica + 0)
	or	a, a
	jr	NZ,00102$
	ld	a,(#_musica_sonando + 0)
	or	a, a
	jr	Z,00102$
;src/main.c:81: reproducirMusica();
	call	_reproducirMusica
;src/main.c:82: contador_musica = 6;
	ld	hl,#_contador_musica + 0
	ld	(hl), #0x06
00102$:
;src/main.c:85: contador_musica--;
	ld	hl, #_contador_musica+0
	dec	(hl)
	ret
;src/main.c:88: void setInterruptAtVSYNCStart(void *intHdl){
;	---------------------------------
; Function setInterruptAtVSYNCStart
; ---------------------------------
_setInterruptAtVSYNCStart::
;src/main.c:93: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:97: __endasm;
	halt
	halt
;src/main.c:99: cpct_waitVSYNC(); //Me aseguro que se espera al final del pintado de la pantalla para cambiar el código de la interrupción
	call	_cpct_waitVSYNC
;src/main.c:100: cpct_setInterruptHandler(intHdl);
	pop	bc
	pop	hl
	push	hl
	push	bc
	jp  _cpct_setInterruptHandler
;src/main.c:103: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:106: contador_musica = 5;
	ld	hl,#_contador_musica + 0
	ld	(hl), #0x05
;src/main.c:109: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:110: setInterruptAtVSYNCStart(intHandler);
	ld	bc, #_intHandler
	push	bc
	call	_setInterruptAtVSYNCStart
	pop	af
;src/main.c:114: efecto_pliegue(PLIEGUE);
	xor	a, a
	push	af
	inc	sp
	call	_efecto_pliegue
	inc	sp
;src/main.c:115: while (1) {
00107$:
;src/main.c:116: cpct_setVideoMode(1);
	ld	l, #0x01
	call	_cpct_setVideoMode
;src/main.c:117: cpct_clearScreen(0x00);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:118: cpct_setPalette(paletaM1,4);
	ld	hl, #0x0004
	push	hl
	ld	hl, #_paletaM1
	push	hl
	call	_cpct_setPalette
;src/main.c:119: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:122: cpct_setDrawCharM1(2, 0);
	ld	hl, #0x0002
	push	hl
	call	_cpct_setDrawCharM1
;src/main.c:123: mydrawStringM1("         Don Mendo and Lady Sol", cpctm_screenPtr(CPCT_VMEM_START, 0, 0));
	ld	hl, #0xc000
	push	hl
	ld	hl, #___str_0
	push	hl
	call	_mydrawStringM1
;src/main.c:124: mydrawStringM1("                   in", cpctm_screenPtr(CPCT_VMEM_START, 0, 8));
	ld	hl, #0xc050
	push	hl
	ld	hl, #___str_1
	push	hl
	call	_mydrawStringM1
;src/main.c:125: mydrawStringM1("           Castle Concepcion", cpctm_screenPtr(CPCT_VMEM_START, 0, 16));
	ld	hl, #0xc0a0
	push	hl
	ld	hl, #___str_2
	push	hl
	call	_mydrawStringM1
;src/main.c:126: mydrawStringM1("Mendo was in love with Lady Sol, a rich ", cpctm_screenPtr(CPCT_VMEM_START, 0, 40));
	ld	hl, #0xc190
	push	hl
	ld	hl, #___str_3
	push	hl
	call	_mydrawStringM1
;src/main.c:127: mydrawStringM1("and beautiful woman. He was so poor that", cpctm_screenPtr(CPCT_VMEM_START, 0, 48));
	ld	hl, #0xc1e0
	push	hl
	ld	hl, #___str_4
	push	hl
	call	_mydrawStringM1
;src/main.c:128: mydrawStringM1("he couldn't marry her. He decided to go ", cpctm_screenPtr(CPCT_VMEM_START, 0, 56));
	ld	hl, #0xc230
	push	hl
	ld	hl, #___str_5
	push	hl
	call	_mydrawStringM1
;src/main.c:129: mydrawStringM1("to the Crusades to get Fortune and Fame.", cpctm_screenPtr(CPCT_VMEM_START, 0, 64));
	ld	hl, #0xc280
	push	hl
	ld	hl, #___str_6
	push	hl
	call	_mydrawStringM1
;src/main.c:131: mydrawStringM1("When he became a brave hero, he heard", cpctm_screenPtr(CPCT_VMEM_START, 0, 80));
	ld	hl, #0xc320
	push	hl
	ld	hl, #___str_7
	push	hl
	call	_mydrawStringM1
;src/main.c:132: mydrawStringM1("Lady Sol was forced to marry don Ricardo", cpctm_screenPtr(CPCT_VMEM_START, 0, 88));
	ld	hl, #0xc370
	push	hl
	ld	hl, #___str_8
	push	hl
	call	_mydrawStringM1
;src/main.c:133: mydrawStringM1("a very important noble. ", cpctm_screenPtr(CPCT_VMEM_START, 0, 96));
	ld	hl, #0xc3c0
	push	hl
	ld	hl, #___str_9
	push	hl
	call	_mydrawStringM1
;src/main.c:135: mydrawStringM1("Bring to an end the bloody Crusades war,", cpctm_screenPtr(CPCT_VMEM_START, 0, 112));
	ld	hl, #0xc460
	push	hl
	ld	hl, #___str_10
	push	hl
	call	_mydrawStringM1
;src/main.c:136: mydrawStringM1("go through the underway passage and ", cpctm_screenPtr(CPCT_VMEM_START, 0, 120));
	ld	hl, #0xc4b0
	push	hl
	ld	hl, #___str_11
	push	hl
	call	_mydrawStringM1
;src/main.c:137: mydrawStringM1("finally assault the Castle to help Don ", cpctm_screenPtr(CPCT_VMEM_START, 0, 128));
	ld	hl, #0xc500
	push	hl
	ld	hl, #___str_12
	push	hl
	call	_mydrawStringM1
;src/main.c:138: mydrawStringM1("Mendo to go back to his love: Lady Sol.", cpctm_screenPtr(CPCT_VMEM_START, 0, 136));
	ld	hl, #0xc550
	push	hl
	ld	hl, #___str_13
	push	hl
	call	_mydrawStringM1
;src/main.c:139: mydrawStringM1("PRESS ANY KEY TO START", cpct_getScreenPtr(CPCT_VMEM_START, 0, 168));
	ld	hl, #0xa800
	push	hl
	ld	h, #0xc0
	push	hl
	call	_cpct_getScreenPtr
	ld	bc, #___str_14+0
	push	hl
	push	bc
	call	_mydrawStringM1
;src/main.c:140: cpct_akp_musicInit((u8*) m_intro);
	ld	bc, #_m_intro+0
	push	bc
	call	_cpct_akp_musicInit
	pop	af
;src/main.c:141: musica_sonando = 1;
	ld	hl,#_musica_sonando + 0
	ld	(hl), #0x01
;src/main.c:142: efecto_pliegue(DESPLIEGUE);
	ld	a, #0x01
	push	af
	inc	sp
	call	_efecto_pliegue
	inc	sp
;src/main.c:144: pausaTecladoLibre();
	call	_pausaTecladoLibre
;src/main.c:148: do {
	ld	c, #0x00
00101$:
;src/main.c:150: semilla++;
	inc	c
;src/main.c:152: while (!cpct_isAnyKeyPressed_f());
	push	bc
	call	_cpct_isAnyKeyPressed_f
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00101$
;src/main.c:155: if (!semilla)
	ld	a,c
	ld	l,a
	or	a, a
	jr	NZ,00105$
;src/main.c:156: semilla = 1;
	ld	l, #0x01
00105$:
;src/main.c:158: cpct_srand8(semilla);
	ld	h, #0x00
	ld	de,#0x0000
	call	_cpct_setSeed_mxor
	call	_cpct_restoreState_mxor_u8
;src/main.c:159: cpct_akp_musicInit((u8*) m_sfx);
	ld	hl, #_m_sfx
	push	hl
	call	_cpct_akp_musicInit
	pop	af
;src/main.c:162: juego();
	call	_juego
	jp	00107$
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
	.ascii "Mendo to go back to his love: Lady Sol."
	.db 0x00
___str_14:
	.ascii "PRESS ANY KEY TO START"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
	.org 0x0040
_chardata:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x66	; 102	'f'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x3e	; 62
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x7e	; 126
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x62	; 98	'b'
	.db #0x64	; 100	'd'
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x26	; 38
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x70	; 112	'p'
	.db #0x5e	; 94
	.db #0x6c	; 108	'l'
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5a	; 90	'Z'
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x48	; 72	'H'
	.db #0x7c	; 124
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x3c	; 60
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x38	; 56	'8'
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x1c	; 28
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x22	; 34
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x82	; 130
	.db #0xba	; 186
	.db #0xaa	; 170
	.db #0xbc	; 188
	.db #0x80	; 128
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0xcc	; 204
	.db #0x64	; 100	'd'
	.db #0xfc	; 252
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x6c	; 108	'l'
	.db #0x24	; 36
	.db #0x3e	; 62
	.db #0x62	; 98	'b'
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x33	; 51	'3'
	.db #0x62	; 98	'b'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc2	; 194
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x62	; 98	'b'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x38	; 56	'8'
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x26	; 38
	.db #0x20	; 32
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x63	; 99	'c'
	.db #0x62	; 98	'b'
	.db #0x40	; 64
	.db #0xce	; 206
	.db #0xc2	; 194
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x73	; 115	's'
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x3f	; 63
	.db #0x63	; 99	'c'
	.db #0x47	; 71	'G'
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x44	; 68	'D'
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x58	; 88	'X'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x4c	; 76	'L'
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x76	; 118	'v'
	.db #0x5e	; 94
	.db #0x5a	; 90	'Z'
	.db #0x42	; 66	'B'
	.db #0xc6	; 198
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x7e	; 126
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0xc2	; 194
	.db #0x82	; 130
	.db #0xc6	; 198
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x16	; 22
	.db #0x32	; 50	'2'
	.db #0x22	; 34
	.db #0x3c	; 60
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x7c	; 124
	.db #0x46	; 70	'F'
	.db #0xc2	; 194
	.db #0x8e	; 142
	.db #0x4c	; 76	'L'
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x26	; 38
	.db #0x22	; 34
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x58	; 88	'X'
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x36	; 54	'6'
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0xcc	; 204
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x62	; 98	'b'
	.db #0x42	; 66	'B'
	.db #0xc2	; 194
	.db #0xc6	; 198
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x46	; 70	'F'
	.db #0x46	; 70	'F'
	.db #0x44	; 68	'D'
	.db #0x48	; 72	'H'
	.db #0x68	; 104	'h'
	.db #0x78	; 120	'x'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x96	; 150
	.db #0xb4	; 180
	.db #0xac	; 172
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x6c	; 108	'l'
	.db #0xc4	; 196
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x46	; 70	'F'
	.db #0x26	; 38
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x7e	; 126
	.db #0x0c	; 12
	.db #0x1c	; 28
	.db #0x30	; 48	'0'
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x3c	; 60
	.db #0x4c	; 76	'L'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x4c	; 76	'L'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x36	; 54	'6'
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x3c	; 60
	.db #0x48	; 72	'H'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x62	; 98	'b'
	.db #0x7e	; 126
	.db #0x60	; 96
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x38	; 56	'8'
	.db #0x1c	; 28
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x04	; 4
	.db #0x48	; 72	'H'
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x7e	; 126
	.db #0x5a	; 90	'Z'
	.db #0xd6	; 214
	.db #0x84	; 132
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x38	; 56	'8'
	.db #0x68	; 104	'h'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x64	; 100	'd'
	.db #0x44	; 68	'D'
	.db #0x64	; 100	'd'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x1c	; 28
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x1c	; 28
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3c	; 60
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x38	; 56	'8'
	.db #0x16	; 22
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x4c	; 76	'L'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x26	; 38
	.db #0x48	; 72	'H'
	.db #0x58	; 88	'X'
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x53	; 83	'S'
	.db #0x56	; 86	'V'
	.db #0x7c	; 124
	.db #0x58	; 88	'X'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x34	; 52	'4'
	.db #0x34	; 52	'4'
	.db #0x1c	; 28
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x38	; 56	'8'
	.db #0x60	; 96
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x49	; 73	'I'
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.org 0x0340
_m_sfx:
	.db #0x41	; 65	'A'
	.db #0x54	; 84	'T'
	.db #0x31	; 49	'1'
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x56	; 86	'V'
	.db #0x03	; 3
	.db #0x5f	; 95
	.db #0x03	; 3
	.db #0x83	; 131
	.db #0x03	; 3
	.db #0xa9	; 169
	.db #0x03	; 3
	.db #0xb0	; 176
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x58	; 88	'X'
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3a	; 58
	.db #0x21	; 33
	.db #0x76	; 118	'v'
	.db #0x22	; 34
	.db #0x0c	; 12
	.db #0x76	; 118	'v'
	.db #0x23	; 35
	.db #0x18	; 24
	.db #0x72	; 114	'r'
	.db #0x24	; 36
	.db #0x0c	; 12
	.db #0x6e	; 110	'n'
	.db #0x26	; 38
	.db #0x18	; 24
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x26	; 38
	.db #0x2b	; 43
	.db #0x22	; 34
	.db #0x2c	; 44
	.db #0x1e	; 30
	.db #0x2e	; 46
	.db #0x1a	; 26
	.db #0x30	; 48	'0'
	.db #0x16	; 22
	.db #0x31	; 49	'1'
	.db #0x12	; 18
	.db #0x36	; 54	'6'
	.db #0x0e	; 14
	.db #0x3d	; 61
	.db #0x0d	; 13
	.db #0x58	; 88	'X'
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x21	; 33
	.db #0x0c	; 12
	.db #0x70	; 112	'p'
	.db #0x18	; 24
	.db #0x72	; 114	'r'
	.db #0x21	; 33
	.db #0x10	; 16
	.db #0x6c	; 108	'l'
	.db #0x1c	; 28
	.db #0x7a	; 122	'z'
	.db #0x21	; 33
	.db #0x13	; 19
	.db #0x74	; 116	't'
	.db #0x1f	; 31
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0xf4	; 244
	.db #0x89	; 137
	.db #0x08	; 8
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0xf4	; 244
	.db #0x89	; 137
	.db #0x08	; 8
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0xf4	; 244
	.db #0x89	; 137
	.db #0x08	; 8
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0xe8	; 232
	.db #0x0d	; 13
	.db #0x58	; 88	'X'
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x0d	; 13
	.db #0x58	; 88	'X'
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x20	; 32
	.db #0x0d	; 13
	.db #0x58	; 88	'X'
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc7	; 199
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xc8	; 200
	.db #0x03	; 3
	.db #0xc8	; 200
	.db #0x03	; 3
	.db #0xc8	; 200
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0xbd	; 189
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
