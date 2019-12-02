;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (CYGWIN)
;--------------------------------------------------------
	.module juego
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _juego
	.globl _turno
	.globl _drawPotion
	.globl _IA
	.globl _defender
	.globl _moverDcha
	.globl _moverIzq
	.globl _printConsole
	.globl _printLevel
	.globl _printStats
	.globl _dibujarEscenario
	.globl _dibujarMarcoInterior
	.globl _dibujarMarcoExterior
	.globl _pausaTecladoLibre
	.globl _efecto_pliegue
	.globl _pausa
	.globl _initNivel
	.globl _initPlayer
	.globl _mydrawStringM1
	.globl _sprintf
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_getRandom_mxor_u8
	.globl _cpct_getScreenPtr
	.globl _cpct_waitVSYNC
	.globl _cpct_setDrawCharM1
	.globl _cpct_drawSpriteMasked
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_isKeyPressed
	.globl _cpct_memset
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;src/juego.c:11: u8 turno() { //devuelve valor 0 cuando muere personaje o se termina nivel
;	---------------------------------
; Function turno
; ---------------------------------
_turno::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-45
	add	hl, sp
	ld	sp, hl
;src/juego.c:16: for (i = 0; i < 3; i++) {
	ld	-9 (ix), #0x00
00163$:
;src/juego.c:17: mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
	ld	hl,#_nivel + 0
	ld	c, (hl)
	ld	b, #0x00
	dec	bc
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_g_mapa01
	add	hl, de
;src/juego.c:18: cpct_etm_drawTileBox2x4 ((entidad[i].pos_x_ant - 4)/2, 17, 2, 7, 18, INICIO_AREA_JUEGO, mapa );
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	-4 (ix), #0x84
	ld	-3 (ix), #0xc2
	ld	c,-9 (ix)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_entidad
	add	hl, de
	ld	de, #0x0011
	add	hl, de
	ld	c, (hl)
	ld	-6 (ix), c
	ld	-5 (ix), #0x00
	ld	a, -6 (ix)
	add	a, #0xfc
	ld	c, a
	ld	a, -5 (ix)
	adc	a, #0xff
	ld	b, a
	ld	-8 (ix), c
	ld	-7 (ix), b
	bit	7, b
	jr	Z,00171$
	ld	a, -6 (ix)
	add	a, #0xfd
	ld	-8 (ix), a
	ld	a, -5 (ix)
	adc	a, #0xff
	ld	-7 (ix), a
00171$:
	ld	b, -8 (ix)
	ld	c, -7 (ix)
	sra	c
	rr	b
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	hl, #0x1207
	push	hl
	ld	hl, #0x0211
	push	hl
	push	bc
	inc	sp
	call	_cpct_etm_drawTileBox2x4
;src/juego.c:16: for (i = 0; i < 3; i++) {
	inc	-9 (ix)
	ld	a, -9 (ix)
	sub	a, #0x03
	jp	C, 00163$
;src/juego.c:21: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/juego.c:23: for (i = 0; i < 3; i++) {
	ld	c, #0x00
00165$:
;src/juego.c:24: if (entidad[i].energy) {
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de,hl
	ld	hl, #_entidad
	add	hl,de
	ex	de,hl
	push	de
	pop	iy
	ld	b, 11 (iy)
	ld	a, b
	or	a, a
	jr	Z,00166$
;src/juego.c:25: printStats(&entidad[i]);
	ld	l, e
	ld	h, d
	push	bc
	push	de
	push	hl
	call	_printStats
	pop	af
	pop	de
	pop	bc
;src/juego.c:26: cpct_drawSpriteMasked (entidad[i].sprite, cpct_getScreenPtr (CPCT_VMEM_START, entidad[i].pos_x, 132), 4,28);
	ld	hl, #0x0010
	add	hl,de
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	b, (hl)
	push	bc
	push	de
	ld	a, #0x84
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
	ld	-6 (ix), l
	ld	-5 (ix), h
	push	de
	pop	iy
	ld	l, 19 (iy)
	ld	h, 20 (iy)
	push	hl
	pop	iy
	push	bc
	push	de
	ld	hl, #0x1c04
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	push	iy
	call	_cpct_drawSpriteMasked
	pop	de
	pop	bc
;src/juego.c:27: entidad[i].pos_x_ant = entidad[i].pos_x;
	ld	hl, #0x0011
	add	hl,de
	ex	de,hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a, (hl)
	ld	(de), a
00166$:
;src/juego.c:23: for (i = 0; i < 3; i++) {
	inc	c
	ld	a, c
	sub	a, #0x03
	jr	C,00165$
;src/juego.c:39: entidad[0].energy = 0;
;src/juego.c:32: if (nivel == 31) {
	ld	a,(#_nivel + 0)
	sub	a, #0x1f
	jr	NZ,00108$
;src/juego.c:33: printConsole("Don Mendo", 2, 0);
	ld	hl, #0x0002
	push	hl
	ld	hl, #___str_0
	push	hl
	call	_printConsole
	pop	af
;src/juego.c:34: printConsole("&", 2, 0);
	ld	hl, #0x0002
	ex	(sp),hl
	ld	hl, #___str_1
	push	hl
	call	_printConsole
	pop	af
;src/juego.c:35: printConsole("Lady Sol", 2, 0);
	ld	hl, #0x0002
	ex	(sp),hl
	ld	hl, #___str_2
	push	hl
	call	_printConsole
	pop	af
;src/juego.c:36: printConsole(" ", 2, 0);
	ld	hl, #0x0002
	ex	(sp),hl
	ld	hl, #___str_3
	push	hl
	call	_printConsole
	pop	af
;src/juego.c:37: printConsole("together at last", 2, 0);
	ld	hl, #0x0002
	ex	(sp),hl
	ld	hl, #___str_4
	push	hl
	call	_printConsole
	pop	af
;src/juego.c:38: printConsole("CONGRATULATIONS!", 0, 2);
	ld	hl, #0x0200
	ex	(sp),hl
	ld	hl, #___str_5
	push	hl
	call	_printConsole
	pop	af
	pop	af
;src/juego.c:39: entidad[0].energy = 0;
	ld	hl, #(_entidad + 0x000b)
	ld	(hl), #0x00
;src/juego.c:41: pausaTecladoLibre();
	call	_pausaTecladoLibre
;src/juego.c:42: do {
00105$:
;src/juego.c:44: } while (!cpct_isAnyKeyPressed_f());
	call	_cpct_isAnyKeyPressed_f
	ld	a, l
	or	a, a
	jr	Z,00105$
;src/juego.c:45: return 0;
	ld	l, #0x00
	jp	00169$
00108$:
;src/juego.c:49: if (nivel == 5 || nivel == 15 || nivel == 25) {
	ld	iy, #_nivel
	ld	a, 0 (iy)
	sub	a, #0x05
	jr	Z,00109$
	ld	a, 0 (iy)
	sub	a, #0x0f
	jr	Z,00109$
	ld	a, 0 (iy)
	sub	a, #0x19
	jr	NZ,00110$
00109$:
;src/juego.c:50: drawPotion();
	call	_drawPotion
00110$:
;src/juego.c:56: i = 0;
	ld	-9 (ix), #0x00
;src/juego.c:57: do  {
	ld	hl, #0x0000
	add	hl, sp
	ld	-8 (ix), l
	ld	-7 (ix), h
00125$:
;src/juego.c:59: sprintf(temp, "ACTION (</>/D) ?");
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
	ld	hl, #___str_6
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_sprintf
	pop	af
	pop	af
;src/juego.c:60: if (i < 25) {
	ld	a, -9 (ix)
	sub	a, #0x19
	jr	NC,00114$
;src/juego.c:61: printConsole(temp, 2, 0);
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
	ld	hl, #0x0002
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_printConsole
	pop	af
	pop	af
	jr	00115$
00114$:
;src/juego.c:63: printConsole(temp, 0, 2);
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
	ld	hl, #0x0200
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_printConsole
	pop	af
	pop	af
00115$:
;src/juego.c:65: i++;
	inc	-9 (ix)
;src/juego.c:66: cursorConsola -=8;
	ld	hl, #_cursorConsola
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
;src/juego.c:67: if (i == 50)
	ld	a, -9 (ix)
	sub	a, #0x32
	jr	NZ,00126$
;src/juego.c:68: i=0;
	ld	-9 (ix), #0x00
00126$:
;src/juego.c:70: while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_CursorLeft)  && !cpct_isKeyPressed(Joy0_Left) 
	ld	hl, #0x0404
	call	_cpct_isKeyPressed
	ld	-6 (ix), l
	ld	a, l
	or	a, a
	jr	NZ,00127$
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	-6 (ix), l
	ld	a, l
	or	a, a
	jr	NZ,00127$
	ld	hl, #0x0409
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00127$
;src/juego.c:71: && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_CursorRight) && !cpct_isKeyPressed(Joy0_Right) 
	ld	hl, #0x0803
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00127$
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00127$
	ld	hl, #0x0809
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00127$
;src/juego.c:72: && !cpct_isKeyPressed(Key_D) && !cpct_isKeyPressed(Joy0_Fire1));
	ld	hl, #0x2007
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00127$
	ld	hl, #0x1009
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jp	Z, 00125$
00127$:
;src/juego.c:75: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
	ld	hl, #0x0404
	call	_cpct_isKeyPressed
	ld	-6 (ix), l
	ld	a, l
	or	a, a
	jr	NZ,00128$
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	-6 (ix), l
	ld	a, l
	or	a, a
	jr	NZ,00128$
	ld	hl, #0x0409
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00129$
00128$:
;src/juego.c:76: moverIzq(&entidad[0]);
	ld	hl, #_entidad
	push	hl
	call	_moverIzq
	pop	af
00129$:
;src/juego.c:80: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
	ld	hl, #0x0803
	call	_cpct_isKeyPressed
	ld	-6 (ix), l
	ld	a, l
	or	a, a
	jr	NZ,00132$
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00132$
	ld	hl, #0x0809
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00133$
00132$:
;src/juego.c:81: moverDcha(&entidad[0]);
	ld	hl, #_entidad
	push	hl
	call	_moverDcha
	pop	af
00133$:
;src/juego.c:85: if (cpct_isKeyPressed(Key_D) || cpct_isKeyPressed(Joy0_Fire1)) {
	ld	hl, #0x2007
	call	_cpct_isKeyPressed
	ld	-6 (ix), l
	ld	a, l
	or	a, a
	jr	NZ,00136$
	ld	hl, #0x1009
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00199$
00136$:
;src/juego.c:86: defender(&entidad[0]);
	ld	hl, #_entidad
	push	hl
	call	_defender
	pop	af
;src/juego.c:91: for (i = 1; i < 3; i++) {
00199$:
	ld	-9 (ix), #0x01
00167$:
;src/juego.c:92: if (entidad[i].energy) {
	ld	c,-9 (ix)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	a, #<(_entidad)
	add	a, -6 (ix)
	ld	-6 (ix), a
	ld	a, #>(_entidad)
	adc	a, -5 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	ld	-3 (ix), a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	de, #0x000b
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z,00168$
;src/juego.c:93: IA (&entidad[i]);
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_IA
	pop	af
00168$:
;src/juego.c:91: for (i = 1; i < 3; i++) {
	inc	-9 (ix)
	ld	a, -9 (ix)
	sub	a, #0x03
	jr	C,00167$
;src/juego.c:97: pausa(SEGUNDO);
	ld	hl, #0x8000
	push	hl
	call	_pausa
	pop	af
;src/juego.c:98: pausaTecladoLibre();
	call	_pausaTecladoLibre
;src/juego.c:103: if (entidad[0].pos_x == 28) {
;src/juego.c:102: if (nivel == 5 || nivel == 15 || nivel == 25) {
	ld	iy, #_nivel
	ld	a, 0 (iy)
	sub	a, #0x05
	jr	Z,00153$
	ld	a, 0 (iy)
	sub	a, #0x0f
	jr	Z,00153$
	ld	a, 0 (iy)
	sub	a, #0x19
	jp	NZ,00154$
00153$:
;src/juego.c:103: if (entidad[0].pos_x == 28) {
	ld	a, (#(_entidad + 0x0010) + 0)
	sub	a, #0x1c
	jp	NZ,00155$
;src/juego.c:105: if (cpct_rand() % 2){
	call	_cpct_getRandom_mxor_u8
	ld	a, l
;src/juego.c:109: sprintf(temp, "%-9s ^ HP",entidad[0].name);
;src/juego.c:105: if (cpct_rand() % 2){
	and	a,#0x01
	jr	Z,00146$
;src/juego.c:107: entidad[0].max_energy +=10;
	ld	bc, #_entidad + 12
	ld	a, (bc)
	add	a, #0x0a
	ld	(bc), a
;src/juego.c:108: entidad[0].energy = entidad[0].max_energy;
	ld	(#(_entidad + 0x000b)),a
;src/juego.c:109: sprintf(temp, "%-9s ^ HP",entidad[0].name);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #(_entidad + 0x0001)
	push	hl
	ld	hl, #___str_7
	push	hl
	push	bc
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/juego.c:110: printConsole(temp, 2, 0);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x0002
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
	jr	00147$
00146$:
;src/juego.c:111: } else if (cpct_rand() % 2){
	call	_cpct_getRandom_mxor_u8
	bit	0, l
	jr	Z,00143$
;src/juego.c:113: entidad[0].attack += 5;
	ld	bc, #_entidad + 13
	ld	a, (bc)
	add	a, #0x05
	ld	(bc), a
;src/juego.c:114: sprintf(temp, "%-9s ^ ATT",entidad[0].name);
	ld	de, #___str_8+0
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #(_entidad + 0x0001)
	push	hl
	push	de
	push	bc
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/juego.c:115: printConsole(temp, 2, 0);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x0002
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
	jr	00147$
00143$:
;src/juego.c:118: entidad[0].defense += 5;
	ld	bc, #_entidad + 15
	ld	a, (bc)
	add	a, #0x05
	ld	(bc), a
;src/juego.c:119: sprintf(temp, "%-9s ^ DEF",entidad[0].name);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #(_entidad + 0x0001)
	push	hl
	ld	hl, #___str_9
	push	hl
	push	bc
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/juego.c:120: printConsole(temp, 2, 0);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x0002
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
00147$:
;src/juego.c:123: printStats(&entidad[0]);
	ld	hl, #_entidad
	push	hl
	call	_printStats
	pop	af
;src/juego.c:124: sig_nivel = 1;
	ld	hl,#_sig_nivel + 0
	ld	(hl), #0x01
	jr	00155$
00154$:
;src/juego.c:127: } else if (!(entidad[1].energy || entidad[2].energy)) {
	ld	a, (#_entidad + 32)
	or	a, a
	jr	NZ,00155$
	ld	a, (#_entidad + 53)
	or	a, a
	jr	NZ,00155$
;src/juego.c:128: sig_nivel = 1;
	ld	hl,#_sig_nivel + 0
	ld	(hl), #0x01
00155$:
;src/juego.c:132: if (sig_nivel) {
	ld	a,(#_sig_nivel + 0)
	or	a, a
	jr	Z,00159$
;src/juego.c:133: nivel++;
	ld	hl, #_nivel+0
	inc	(hl)
;src/juego.c:134: entidad[0].pos_x = 8;
	ld	hl, #(_entidad + 0x0010)
	ld	(hl), #0x08
;src/juego.c:135: sprintf(temp, "   NEXT LEVEL   ");
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #___str_10
	push	hl
	push	bc
	call	_sprintf
	pop	af
	pop	af
;src/juego.c:137: printConsole(temp, 0, 2);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x0200
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
;src/juego.c:138: sig_nivel = 0;
	ld	hl,#_sig_nivel + 0
	ld	(hl), #0x00
;src/juego.c:139: return 0;
	ld	l, #0x00
	jr	00169$
00159$:
;src/juego.c:143: if (!entidad[0].energy) {
	ld	a, (#(_entidad + 0x000b) + 0)
	or	a, a
	jr	NZ,00161$
;src/juego.c:144: sprintf(temp, "    GAME OVER   ");
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #___str_11
	push	hl
	push	bc
	call	_sprintf
	pop	af
	pop	af
;src/juego.c:145: printConsole(temp, 0, 2);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x0200
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
;src/juego.c:146: return 0;
	ld	l, #0x00
	jr	00169$
00161$:
;src/juego.c:149: return 1;
	ld	l, #0x01
00169$:
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.ascii "Don Mendo"
	.db 0x00
___str_1:
	.ascii "&"
	.db 0x00
___str_2:
	.ascii "Lady Sol"
	.db 0x00
___str_3:
	.ascii " "
	.db 0x00
___str_4:
	.ascii "together at last"
	.db 0x00
___str_5:
	.ascii "CONGRATULATIONS!"
	.db 0x00
___str_6:
	.ascii "ACTION (</>/D) ?"
	.db 0x00
___str_7:
	.ascii "%-9s ^ HP"
	.db 0x00
___str_8:
	.ascii "%-9s ^ ATT"
	.db 0x00
___str_9:
	.ascii "%-9s ^ DEF"
	.db 0x00
___str_10:
	.ascii "   NEXT LEVEL   "
	.db 0x00
___str_11:
	.ascii "    GAME OVER   "
	.db 0x00
;src/juego.c:152: void juego() {
;	---------------------------------
; Function juego
; ---------------------------------
_juego::
;src/juego.c:155: nivel = 1;
	ld	hl,#_nivel + 0
	ld	(hl), #0x01
;src/juego.c:156: sig_nivel = 0;
	ld	hl,#_sig_nivel + 0
	ld	(hl), #0x00
;src/juego.c:158: initPlayer();
	call	_initPlayer
;src/juego.c:159: efecto_pliegue(PLIEGUE);
	xor	a, a
	push	af
	inc	sp
	call	_efecto_pliegue
	inc	sp
;src/juego.c:160: while(entidad[0].energy) {
00115$:
	ld	a, (#(_entidad + 0x000b) + 0)
	or	a, a
	ret	Z
;src/juego.c:161: i = 0;
	ld	c, #0x00
;src/juego.c:162: cpct_clearScreen(0x00);
	push	bc
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
	call	_dibujarMarcoExterior
	ld	hl, #0x0002
	push	hl
	call	_cpct_setDrawCharM1
	pop	bc
;src/juego.c:166: if (nivel == 1) {
	ld	a,(#_nivel + 0)
	dec	a
	jr	NZ,00102$
;src/juego.c:167: mydrawStringM1("Chapter 1", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
	ld	hl, #0xc33e
	push	hl
	ld	hl, #___str_12
	push	hl
	call	_mydrawStringM1
;src/juego.c:168: mydrawStringM1("A faraway and foreign land ...", cpctm_screenPtr(CPCT_VMEM_START, 12, 96));
	ld	hl, #0xc3cc
	push	hl
	ld	hl, #___str_13
	push	hl
	call	_mydrawStringM1
;src/juego.c:169: i = 1;
	ld	c, #0x01
00102$:
;src/juego.c:171: if (nivel == 11) {
	ld	a,(#_nivel + 0)
	sub	a, #0x0b
	jr	NZ,00104$
;src/juego.c:172: mydrawStringM1("Chapter 2", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
	ld	hl, #0xc33e
	push	hl
	ld	hl, #___str_14
	push	hl
	call	_mydrawStringM1
;src/juego.c:173: mydrawStringM1("A hidden passage to the Castle ...", cpctm_screenPtr(CPCT_VMEM_START, 6, 96));
	ld	hl, #0xc3c6
	push	hl
	ld	hl, #___str_15
	push	hl
	call	_mydrawStringM1
;src/juego.c:174: i = 1;
	ld	c, #0x01
00104$:
;src/juego.c:176: if (nivel == 21) {
	ld	a,(#_nivel + 0)
	sub	a, #0x15
	jr	NZ,00106$
;src/juego.c:177: mydrawStringM1("Chapter 3", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
	ld	hl, #0xc33e
	push	hl
	ld	hl, #___str_16
	push	hl
	call	_mydrawStringM1
;src/juego.c:178: mydrawStringM1("don Ricardo's Castle ...", cpctm_screenPtr(CPCT_VMEM_START, 15, 96));
	ld	hl, #0xc3cf
	push	hl
	ld	hl, #___str_17
	push	hl
	call	_mydrawStringM1
;src/juego.c:179: i = 1;
	ld	c, #0x01
00106$:
;src/juego.c:182: if (i) {
	ld	a, c
	or	a, a
	jr	Z,00109$
;src/juego.c:183: efecto_pliegue(DESPLIEGUE);
	ld	a, #0x01
	push	af
	inc	sp
	call	_efecto_pliegue
	inc	sp
;src/juego.c:184: for (i=0; i< 5; i++)
	ld	c, #0x00
00118$:
;src/juego.c:185: pausa(SEGUNDO);
	push	bc
	ld	hl, #0x8000
	push	hl
	call	_pausa
	pop	af
	pop	bc
;src/juego.c:184: for (i=0; i< 5; i++)
	inc	c
	ld	a, c
	sub	a, #0x05
	jr	C,00118$
;src/juego.c:187: efecto_pliegue(PLIEGUE);
	xor	a, a
	push	af
	inc	sp
	call	_efecto_pliegue
	inc	sp
00109$:
;src/juego.c:190: cursorConsola = 64;
	ld	hl,#_cursorConsola + 0
	ld	(hl), #0x40
;src/juego.c:192: initNivel();
	call	_initNivel
;src/juego.c:193: dibujarMarcoInterior();
	call	_dibujarMarcoInterior
;src/juego.c:194: dibujarEscenario();
	call	_dibujarEscenario
;src/juego.c:195: printLevel();
	call	_printLevel
;src/juego.c:197: efecto_pliegue(DESPLIEGUE);
	ld	a, #0x01
	push	af
	inc	sp
	call	_efecto_pliegue
	inc	sp
;src/juego.c:198: while (turno())
00110$:
	call	_turno
	ld	a, l
	or	a, a
	jr	NZ,00110$
;src/juego.c:201: do {
00113$:
;src/juego.c:203: } while (!cpct_isAnyKeyPressed_f());
	call	_cpct_isAnyKeyPressed_f
	ld	a, l
	or	a, a
	jr	Z,00113$
;src/juego.c:204: efecto_pliegue(PLIEGUE);
	xor	a, a
	push	af
	inc	sp
	call	_efecto_pliegue
	inc	sp
	jp	00115$
___str_12:
	.ascii "Chapter 1"
	.db 0x00
___str_13:
	.ascii "A faraway and foreign land ..."
	.db 0x00
___str_14:
	.ascii "Chapter 2"
	.db 0x00
___str_15:
	.ascii "A hidden passage to the Castle ..."
	.db 0x00
___str_16:
	.ascii "Chapter 3"
	.db 0x00
___str_17:
	.ascii "don Ricardo's Castle ..."
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
