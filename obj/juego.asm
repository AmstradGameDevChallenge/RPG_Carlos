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
	.globl _defender
	.globl _atacar
	.globl _printConsole
	.globl _printLevel
	.globl _printStats
	.globl _dibujarEscenario
	.globl _dibujarMarcoInterior
	.globl _dibujarMarcoExterior
	.globl _pausaTecladoLibre
	.globl _efecto_pliegue
	.globl _pausa
	.globl _abs
	.globl _initNivel
	.globl _initPlayer
	.globl _mydrawStringM1
	.globl _sprintf
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_getRandom_mxor_u8
	.globl _cpct_getScreenPtr
	.globl _cpct_waitVSYNC
	.globl _cpct_drawSpriteMasked
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
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
	ld	hl, #-52
	add	hl, sp
	ld	sp, hl
;src/juego.c:16: for (i = 0; i < 3; i++) {
	ld	-13 (ix), #0x00
00192$:
;src/juego.c:17: mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
	ld	a,(#_nivel + 0)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	l, a
	ld	h, #0x00
	dec	hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	c,l
	ld	b,h
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
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	a, #<(_g_mapa01)
	add	a, -2 (ix)
	ld	-2 (ix), a
	ld	a, #>(_g_mapa01)
	adc	a, -1 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-52 (ix), a
	ld	a, -1 (ix)
	ld	-51 (ix), a
;src/juego.c:18: cpct_etm_drawTileBox2x4 ((entidad[i].pos_x_ant - 4)/2, 17, 2, 7, 18, INICIO_AREA_JUEGO, mapa );
	ld	a, -52 (ix)
	ld	-2 (ix), a
	ld	a, -51 (ix)
	ld	-1 (ix), a
	ld	-4 (ix), #0x84
	ld	-3 (ix), #0xc2
	ld	c,-13 (ix)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_entidad
	add	hl,bc
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	de, #0x0010
	add	hl, de
	ld	a, (hl)
	ld	-6 (ix), a
	ld	-6 (ix), a
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
	jr	Z,00202$
	ld	a, -6 (ix)
	add	a, #0xfd
	ld	-8 (ix), a
	ld	a, -5 (ix)
	adc	a, #0xff
	ld	-7 (ix), a
00202$:
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
	inc	-13 (ix)
	ld	a, -13 (ix)
	sub	a, #0x03
	jp	C, 00192$
;src/juego.c:21: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/juego.c:23: for (i = 0; i < 3; i++) {
	ld	-13 (ix), #0x00
00194$:
;src/juego.c:24: if (entidad[i].energy) {
	ld	c,-13 (ix)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	a, -8 (ix)
	add	a, #<(_entidad)
	ld	-8 (ix), a
	ld	a, -7 (ix)
	adc	a, #>(_entidad)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	a, (hl)
	ld	-6 (ix), a
	or	a, a
	jp	Z, 00195$
;src/juego.c:25: printStats(&entidad[i]);
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_printStats
	pop	af
;src/juego.c:26: cpct_drawSpriteMasked (entidad[i].sprite, cpct_getScreenPtr (CPCT_VMEM_START, entidad[i].pos_x, 132), 4,28);
	ld	a, -8 (ix)
	add	a, #0x0f
	ld	-6 (ix), a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	b, (hl)
	ld	a, #0x84
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	-3 (ix), h
	ld	-4 (ix), l
	ld	a, -8 (ix)
	ld	-2 (ix), a
	ld	a, -7 (ix)
	ld	-1 (ix), a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x0012
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	hl, #0x1c04
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_cpct_drawSpriteMasked
;src/juego.c:27: entidad[i].pos_x_ant = entidad[i].pos_x;
	ld	a, -8 (ix)
	add	a, #0x10
	ld	c, a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	b, a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a, (hl)
	ld	(bc), a
00195$:
;src/juego.c:23: for (i = 0; i < 3; i++) {
	inc	-13 (ix)
	ld	a, -13 (ix)
	sub	a, #0x03
	jp	C, 00194$
;src/juego.c:31: if (nivel == 5 || nivel == 15 || nivel == 25) {
	ld	iy, #_nivel
	ld	a, 0 (iy)
	sub	a, #0x05
	jr	Z,00105$
	ld	a, 0 (iy)
	sub	a, #0x0f
	jr	Z,00105$
	ld	a, 0 (iy)
	sub	a, #0x19
	jr	NZ,00106$
00105$:
;src/juego.c:32: drawPotion();
	call	_drawPotion
00106$:
;src/juego.c:39: i = 0;
	ld	-13 (ix), #0x00
;src/juego.c:40: do  {
	ld	hl, #0x0003
	add	hl, sp
	ld	-8 (ix), l
	ld	-7 (ix), h
00121$:
;src/juego.c:41: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/juego.c:42: sprintf(temp, "ACTION (</>/D) ?");
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
	ld	hl, #___str_0
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_sprintf
	pop	af
	pop	af
;src/juego.c:43: if (i < 25) {
	ld	a, -13 (ix)
	sub	a, #0x19
	jr	NC,00110$
;src/juego.c:44: printConsole(temp, 2, 0);
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
	jr	00111$
00110$:
;src/juego.c:46: printConsole(temp, 0, 2);
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
00111$:
;src/juego.c:48: i++;
	inc	-13 (ix)
;src/juego.c:49: cursorConsola -=8;
	ld	hl, #_cursorConsola
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
;src/juego.c:50: if (i == 50)
	ld	a, -13 (ix)
	sub	a, #0x32
	jr	NZ,00122$
;src/juego.c:51: i=0;
	ld	-13 (ix), #0x00
00122$:
;src/juego.c:53: while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_CursorLeft)  && !cpct_isKeyPressed(Joy0_Left) 
	ld	hl, #0x0404
	call	_cpct_isKeyPressed
	ld	-6 (ix), l
	ld	a, l
	or	a, a
	jr	NZ,00123$
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	-6 (ix), l
	ld	a, l
	or	a, a
	jr	NZ,00123$
	ld	hl, #0x0409
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00123$
;src/juego.c:54: && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_CursorRight) && !cpct_isKeyPressed(Joy0_Right) 
	ld	hl, #0x0803
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00123$
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00123$
	ld	hl, #0x0809
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00123$
;src/juego.c:55: && !cpct_isKeyPressed(Key_D) && !cpct_isKeyPressed(Joy0_Fire1));
	ld	hl, #0x2007
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00123$
	ld	hl, #0x1009
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jp	Z, 00121$
00123$:
;src/juego.c:57: nueva_pos = 0;
	ld	-50 (ix), #0x00
;src/juego.c:60: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
	ld	hl, #0x0404
	call	_cpct_isKeyPressed
;src/juego.c:64: nueva_pos = entidad[0].pos_x - 4;
;src/juego.c:60: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
	ld	a, l
	or	a, a
	jr	NZ,00124$
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00124$
	ld	hl, #0x0409
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00125$
00124$:
;src/juego.c:61: sprintf(temp, "%-9s GOES <",entidad[0].name);
	ld	de, #___str_1+0
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #_entidad
	push	hl
	push	de
	push	bc
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/juego.c:62: printConsole(temp, 2, 0);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x0002
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
;src/juego.c:64: nueva_pos = entidad[0].pos_x - 4;
	ld	a, (#(_entidad + 0x000f) + 0)
	add	a, #0xfc
	ld	-50 (ix), a
00125$:
;src/juego.c:68: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
	ld	hl, #0x0803
	call	_cpct_isKeyPressed
;src/juego.c:74: if (nueva_pos == entidad[1].pos_x && entidad[1].energy)
;src/juego.c:77: if (nueva_pos == entidad[2].pos_x && entidad[2].energy)
;src/juego.c:68: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
	ld	a, l
	or	a, a
	jr	NZ,00134$
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00134$
	ld	hl, #0x0809
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00135$
00134$:
;src/juego.c:69: sprintf(temp, "%-9s GOES >",entidad[0].name);
	ld	de, #___str_2+0
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #_entidad
	push	hl
	push	de
	push	bc
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/juego.c:70: printConsole(temp, 2 ,0);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x0002
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
;src/juego.c:72: nueva_pos = entidad[0].pos_x + 4;
	ld	a, (#(_entidad + 0x000f) + 0)
	add	a, #0x04
	ld	-50 (ix), a
;src/juego.c:74: if (nueva_pos == entidad[1].pos_x && entidad[1].energy)
	ld	hl, #(_entidad + 0x0023) + 0
	ld	a,-50 (ix)
	sub	a,(hl)
	jr	NZ,00129$
	ld	a,(#(_entidad + 0x001e) + 0)
	ld	-6 (ix), a
	or	a, a
	jr	Z,00129$
;src/juego.c:75: atacar(&entidad[0], &entidad[1]);
	ld	hl, #(_entidad + 0x0014)
	push	hl
	ld	hl, #_entidad
	push	hl
	call	_atacar
	pop	af
	pop	af
00129$:
;src/juego.c:77: if (nueva_pos == entidad[2].pos_x && entidad[2].energy)
	ld	hl, #(_entidad + 0x0037) + 0
	ld	a,-50 (ix)
	sub	a,(hl)
	jr	NZ,00135$
	ld	a, (#(_entidad + 0x0032) + 0)
	or	a, a
	jr	Z,00135$
;src/juego.c:78: atacar(&entidad[0], &entidad[2]);
	ld	hl, #(_entidad + 0x0028)
	push	hl
	ld	hl, #_entidad
	push	hl
	call	_atacar
	pop	af
	pop	af
00135$:
;src/juego.c:83: if (cpct_isKeyPressed(Key_D) || cpct_isKeyPressed(Joy0_Fire1)) {
	ld	hl, #0x2007
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00138$
	ld	hl, #0x1009
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00139$
00138$:
;src/juego.c:84: defender(&entidad[0]);
	ld	hl, #_entidad
	push	hl
	call	_defender
	pop	af
00139$:
;src/juego.c:90: && nueva_pos < 37 
	ld	a, #0x03
	sub	a, -50 (ix)
	jr	NC,00243$
;src/juego.c:91: && (!entidad[1].energy || nueva_pos != entidad[1].pos_x)
	ld	a, -50 (ix)
	sub	a, #0x25
	jr	NC,00243$
	ld	a, (#(_entidad + 0x001e) + 0)
	or	a, a
	jr	Z,00147$
	ld	hl, #(_entidad + 0x0023) + 0
	ld	a,-50 (ix)
	sub	a,(hl)
	jr	Z,00243$
00147$:
;src/juego.c:92: && (!entidad[2].energy || nueva_pos != entidad[2].pos_x)
	ld	a, (#(_entidad + 0x0032) + 0)
	or	a, a
	jr	Z,00141$
	ld	hl, #(_entidad + 0x0037) + 0
	ld	a,-50 (ix)
	sub	a,(hl)
	jr	Z,00243$
00141$:
;src/juego.c:94: entidad[0].pos_x = nueva_pos;
	ld	hl, #(_entidad + 0x000f)
	ld	a, -50 (ix)
	ld	(hl), a
;src/juego.c:98: for (i = 1; i < 3; i++) {
00243$:
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	ld	-3 (ix), a
	ld	a, -8 (ix)
	ld	-2 (ix), a
	ld	a, -7 (ix)
	ld	-1 (ix), a
	ld	a, -8 (ix)
	ld	-10 (ix), a
	ld	a, -7 (ix)
	ld	-9 (ix), a
	ld	-13 (ix), #0x01
00198$:
;src/juego.c:99: if (entidad[i].energy) {
	ld	c,-13 (ix)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-12 (ix), l
	ld	-11 (ix), h
	ld	a, -12 (ix)
	add	a, #<(_entidad)
	ld	-12 (ix), a
	ld	a, -11 (ix)
	adc	a, #>(_entidad)
	ld	-11 (ix), a
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	a, (hl)
	or	a, a
	jp	Z, 00199$
;src/juego.c:100: if (abs(entidad[i].pos_x - entidad[0].pos_x) == 4) //Si está en casilla contigua, atacar
	ld	a, -12 (ix)
	add	a, #0x0f
	ld	c, a
	ld	a, -11 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	e, a
	ld	hl, #(_entidad + 0x000f) + 0
	ld	d, (hl)
	ld	a, e
	sub	a, d
	ld	d, a
	push	bc
	push	de
	inc	sp
	call	_abs
	inc	sp
	pop	bc
	ld	a, l
	sub	a, #0x04
	jr	NZ,00155$
;src/juego.c:101: atacar(&entidad[i], &entidad[0]);
	ld	de, #_entidad
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	bc
	push	de
	push	hl
	call	_atacar
	pop	af
	pop	af
	pop	bc
	jp	00240$
00155$:
;src/juego.c:103: enemy_mov = cpct_rand()%3; //33% de moverse a izquierda, derecha o curarse
	push	bc
	call	_cpct_getRandom_mxor_u8
	ld	d, l
	ld	a, #0x03
	push	af
	inc	sp
	push	de
	inc	sp
	call	__moduchar
	pop	af
	ld	e, l
	pop	bc
;src/juego.c:104: if (enemy_mov == 1) {
	ld	a, e
	dec	a
	jr	NZ,00152$
;src/juego.c:105: sprintf(temp, "%-9s GOES <",entidad[i].name);
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	push	bc
	push	hl
	ld	hl, #___str_1
	push	hl
	push	de
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/juego.c:106: printConsole(temp, 0, 2);
	ld	e,-10 (ix)
	ld	d,-9 (ix)
	push	bc
	ld	hl, #0x0200
	push	hl
	push	de
	call	_printConsole
	pop	af
	pop	af
	pop	bc
;src/juego.c:108: nueva_pos = entidad[i].pos_x - 4;
	ld	a, (bc)
	add	a, #0xfc
	ld	-50 (ix), a
	jr	00240$
00152$:
;src/juego.c:109: } else if (enemy_mov == 2) {
	ld	a, e
	sub	a, #0x02
	jr	NZ,00149$
;src/juego.c:110: sprintf(temp, "%-9s GOES >",entidad[i].name);
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	bc
	push	de
	ld	de, #___str_2
	push	de
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/juego.c:111: printConsole(temp, 0, 2);
	ld	e,-4 (ix)
	ld	d,-3 (ix)
	push	bc
	ld	hl, #0x0200
	push	hl
	push	de
	call	_printConsole
	pop	af
	pop	af
	pop	bc
;src/juego.c:113: nueva_pos = entidad[i].pos_x + 4;
	ld	a, (bc)
	add	a, #0x04
	ld	-50 (ix), a
	jr	00240$
00149$:
;src/juego.c:115: defender(&entidad[i]);
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	push	bc
	push	de
	call	_defender
	pop	af
	pop	bc
;src/juego.c:119: for (j = 0; j < 3; j++) {
00240$:
	ld	e, #0x00
00196$:
;src/juego.c:120: if (i!=j) {
	ld	a, -13 (ix)
	sub	a, e
	jr	Z,00197$
;src/juego.c:121: if (entidad[j].pos_x == nueva_pos) {
	push	de
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	pop	de
	push	bc
	ld	bc, #_entidad
	add	hl, bc
	ld	bc, #0x000f
	add	hl, bc
	pop	bc
	ld	d, (hl)
	ld	a, -50 (ix)
	sub	a, d
	jr	NZ,00197$
;src/juego.c:122: nueva_pos = 0;
	ld	-50 (ix), #0x00
;src/juego.c:123: break;
	jr	00161$
00197$:
;src/juego.c:119: for (j = 0; j < 3; j++) {
	inc	e
	ld	a, e
	sub	a, #0x03
	jr	C,00196$
00161$:
;src/juego.c:129: if (nueva_pos > 3 && nueva_pos < 37)
	ld	a, #0x03
	sub	a, -50 (ix)
	jr	NC,00199$
	ld	a, -50 (ix)
	sub	a, #0x25
	jr	NC,00199$
;src/juego.c:130: entidad[i].pos_x = nueva_pos; 
	ld	a, -50 (ix)
	ld	(bc), a
00199$:
;src/juego.c:98: for (i = 1; i < 3; i++) {
	inc	-13 (ix)
	ld	a, -13 (ix)
	sub	a, #0x03
	jp	C, 00198$
;src/juego.c:134: pausa(SEGUNDO);
	ld	hl, #0x8000
	push	hl
	call	_pausa
	pop	af
;src/juego.c:135: pausaTecladoLibre();
	call	_pausaTecladoLibre
;src/juego.c:144: entidad[0].energy = entidad[0].max_energy;
;src/juego.c:139: if (nivel == 5 || nivel == 15 || nivel == 25) {
	ld	iy, #_nivel
	ld	a, 0 (iy)
	sub	a, #0x05
	jr	Z,00179$
	ld	a, 0 (iy)
	sub	a, #0x0f
	jr	Z,00179$
	ld	a, 0 (iy)
	sub	a, #0x19
	jp	NZ,00180$
00179$:
;src/juego.c:140: if (entidad[0].pos_x == 28) {
	ld	a, (#(_entidad + 0x000f) + 0)
	sub	a, #0x1c
	jp	NZ,00181$
;src/juego.c:142: if (cpct_rand() % 2){
	call	_cpct_getRandom_mxor_u8
	bit	0, l
	jr	Z,00172$
;src/juego.c:144: entidad[0].energy = entidad[0].max_energy;
	ld	a, (#_entidad + 11)
	ld	(#(_entidad + 0x000a)),a
;src/juego.c:145: sprintf(temp, "%-9s MAX HP",entidad[0].name);
	ld	a, -8 (ix)
	ld	-12 (ix), a
	ld	a, -7 (ix)
	ld	-11 (ix), a
	ld	hl, #_entidad
	push	hl
	ld	hl, #___str_3
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/juego.c:146: printConsole(temp, 2, 0);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x0002
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
	jp	00173$
00172$:
;src/juego.c:147: } else if (cpct_rand() % 2){
	call	_cpct_getRandom_mxor_u8
	bit	0, l
	jr	Z,00169$
;src/juego.c:149: entidad[0].attack += 5;
	ld	a, (#(_entidad + 0x000c) + 0)
	add	a, #0x05
	ld	-12 (ix), a
	ld	hl, #(_entidad + 0x000c)
	ld	a, -12 (ix)
	ld	(hl), a
;src/juego.c:150: sprintf(temp, "%-9s ^ ATT",entidad[0].name);
	ld	a, -8 (ix)
	ld	-12 (ix), a
	ld	a, -7 (ix)
	ld	-11 (ix), a
	ld	hl, #_entidad
	push	hl
	ld	hl, #___str_4
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/juego.c:151: printConsole(temp, 2, 0);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x0002
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
	jr	00173$
00169$:
;src/juego.c:154: entidad[0].defense += 5;
	ld	bc, #_entidad + 14
	ld	a, (bc)
	add	a, #0x05
	ld	(bc), a
;src/juego.c:155: sprintf(temp, "%-9s ^ DEF",entidad[0].name);
	ld	a, -8 (ix)
	ld	-12 (ix), a
	ld	a, -7 (ix)
	ld	-11 (ix), a
	ld	hl, #_entidad
	push	hl
	ld	hl, #___str_5
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/juego.c:156: printConsole(temp, 2, 0);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x0002
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
00173$:
;src/juego.c:159: printStats(&entidad[0]);
	ld	hl, #_entidad
	push	hl
	call	_printStats
	pop	af
;src/juego.c:160: sig_nivel = 1;
	ld	hl,#_sig_nivel + 0
	ld	(hl), #0x01
	jr	00181$
00180$:
;src/juego.c:163: } else if (!(entidad[1].energy || entidad[2].energy)) {
	ld	a, (#(_entidad + 0x001e) + 0)
	or	a, a
	jr	NZ,00181$
	ld	a,(#(_entidad + 0x0032) + 0)
	ld	-12 (ix), a
	or	a, a
	jr	NZ,00181$
;src/juego.c:164: sig_nivel = 1;
	ld	hl,#_sig_nivel + 0
	ld	(hl), #0x01
00181$:
;src/juego.c:168: if (sig_nivel) {
	ld	a,(#_sig_nivel + 0)
	or	a, a
	jr	Z,00188$
;src/juego.c:169: if (nivel == 10) {// Fin del Juego
	ld	a,(#_nivel + 0)
	sub	a, #0x0a
	jr	NZ,00185$
;src/juego.c:170: sprintf(temp, "CONGRATULATIONS!");
	ld	a, -8 (ix)
	ld	-12 (ix), a
	ld	a, -7 (ix)
	ld	-11 (ix), a
	ld	hl, #___str_6
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_sprintf
	pop	af
	pop	af
;src/juego.c:171: entidad[0].energy = 0;
	ld	hl, #(_entidad + 0x000a)
	ld	(hl), #0x00
	jr	00186$
00185$:
;src/juego.c:173: nivel++;
	ld	hl, #_nivel+0
	inc	(hl)
;src/juego.c:174: entidad[0].pos_x = 8;
	ld	hl, #(_entidad + 0x000f)
	ld	(hl), #0x08
;src/juego.c:175: sprintf(temp, "   NEXT LEVEL   ");
	ld	a, -8 (ix)
	ld	-12 (ix), a
	ld	a, -7 (ix)
	ld	-11 (ix), a
	ld	hl, #___str_7
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_sprintf
	pop	af
	pop	af
00186$:
;src/juego.c:177: printConsole(temp, 0, 2);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x0200
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
;src/juego.c:178: sig_nivel = 0;
	ld	hl,#_sig_nivel + 0
	ld	(hl), #0x00
;src/juego.c:179: return 0;
	ld	l, #0x00
	jr	00200$
00188$:
;src/juego.c:183: if (!entidad[0].energy) {
	ld	a, (#(_entidad + 0x000a) + 0)
	or	a, a
	jr	NZ,00190$
;src/juego.c:184: sprintf(temp, "    GAME OVER   ");
	ld	a, -8 (ix)
	ld	-12 (ix), a
	ld	a, -7 (ix)
	ld	-11 (ix), a
	ld	hl, #___str_8
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_sprintf
	pop	af
	pop	af
;src/juego.c:185: printConsole(temp, 0, 2);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x0200
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
;src/juego.c:186: return 0;
	ld	l, #0x00
	jr	00200$
00190$:
;src/juego.c:189: return 1;
	ld	l, #0x01
00200$:
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.ascii "ACTION (</>/D) ?"
	.db 0x00
___str_1:
	.ascii "%-9s GOES <"
	.db 0x00
___str_2:
	.ascii "%-9s GOES >"
	.db 0x00
___str_3:
	.ascii "%-9s MAX HP"
	.db 0x00
___str_4:
	.ascii "%-9s ^ ATT"
	.db 0x00
___str_5:
	.ascii "%-9s ^ DEF"
	.db 0x00
___str_6:
	.ascii "CONGRATULATIONS!"
	.db 0x00
___str_7:
	.ascii "   NEXT LEVEL   "
	.db 0x00
___str_8:
	.ascii "    GAME OVER   "
	.db 0x00
;src/juego.c:192: void juego() {
;	---------------------------------
; Function juego
; ---------------------------------
_juego::
;src/juego.c:195: nivel = 1;
	ld	hl,#_nivel + 0
	ld	(hl), #0x01
;src/juego.c:196: sig_nivel = 0;
	ld	hl,#_sig_nivel + 0
	ld	(hl), #0x00
;src/juego.c:198: initPlayer();
	call	_initPlayer
;src/juego.c:200: while(entidad[0].energy) {
00116$:
	ld	a, (#(_entidad + 0x000a) + 0)
	or	a, a
	ret	Z
;src/juego.c:201: i = 0;
	ld	c, #0x00
;src/juego.c:202: cpct_clearScreen(0x00);
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
	pop	bc
;src/juego.c:205: if (nivel == 1) {
	ld	a,(#_nivel + 0)
	dec	a
	jr	NZ,00102$
;src/juego.c:206: mydrawStringM1("Chapter 1", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
	ld	hl, #0xc33e
	push	hl
	ld	hl, #___str_9
	push	hl
	call	_mydrawStringM1
;src/juego.c:207: mydrawStringM1("A faraway and foreign land ...", cpctm_screenPtr(CPCT_VMEM_START, 12, 96));
	ld	hl, #0xc3cc
	push	hl
	ld	hl, #___str_10
	push	hl
	call	_mydrawStringM1
;src/juego.c:208: i = 1;
	ld	c, #0x01
00102$:
;src/juego.c:210: if (nivel == 11) {
	ld	a,(#_nivel + 0)
	sub	a, #0x0b
	jr	NZ,00104$
;src/juego.c:211: mydrawStringM1("Chapter 2", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
	ld	hl, #0xc33e
	push	hl
	ld	hl, #___str_11
	push	hl
	call	_mydrawStringM1
;src/juego.c:212: mydrawStringM1("A hidden passage to the Castle ...", cpctm_screenPtr(CPCT_VMEM_START, 10, 96));
	ld	hl, #0xc3ca
	push	hl
	ld	hl, #___str_12
	push	hl
	call	_mydrawStringM1
;src/juego.c:213: i = 1;
	ld	c, #0x01
00104$:
;src/juego.c:215: if (nivel == 21) {
	ld	a,(#_nivel + 0)
	sub	a, #0x15
	jr	NZ,00106$
;src/juego.c:216: mydrawStringM1("Chapter 3", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
	ld	hl, #0xc33e
	push	hl
	ld	hl, #___str_13
	push	hl
	call	_mydrawStringM1
;src/juego.c:217: mydrawStringM1("don Ricardo's Castle ...", cpctm_screenPtr(CPCT_VMEM_START, 15, 96));
	ld	hl, #0xc3cf
	push	hl
	ld	hl, #___str_14
	push	hl
	call	_mydrawStringM1
;src/juego.c:218: i = 1;
	ld	c, #0x01
00106$:
;src/juego.c:221: if (i) {
	ld	a, c
	or	a, a
	jr	Z,00109$
;src/juego.c:222: for (i=0; i< 5; i++)
	ld	c, #0x00
00119$:
;src/juego.c:223: pausa(SEGUNDO);
	push	bc
	ld	hl, #0x8000
	push	hl
	call	_pausa
	pop	af
	pop	bc
;src/juego.c:222: for (i=0; i< 5; i++)
	inc	c
	ld	a, c
	sub	a, #0x05
	jr	C,00119$
;src/juego.c:225: efecto_pliegue(PLIEGUE);
	xor	a, a
	push	af
	inc	sp
	call	_efecto_pliegue
	inc	sp
00109$:
;src/juego.c:228: cursorConsola = 64;
	ld	hl,#_cursorConsola + 0
	ld	(hl), #0x40
;src/juego.c:230: initNivel();
	call	_initNivel
;src/juego.c:231: dibujarMarcoInterior();
	call	_dibujarMarcoInterior
;src/juego.c:232: dibujarEscenario();
	call	_dibujarEscenario
;src/juego.c:233: printLevel();
	call	_printLevel
;src/juego.c:235: efecto_pliegue(DESPLIEGUE);
	ld	a, #0x01
	push	af
	inc	sp
	call	_efecto_pliegue
	inc	sp
;src/juego.c:236: while (turno())
00110$:
	call	_turno
	ld	a, l
	or	a, a
	jr	NZ,00110$
;src/juego.c:239: do {
00113$:
;src/juego.c:240: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/juego.c:241: } while (!cpct_isAnyKeyPressed_f());
	call	_cpct_isAnyKeyPressed_f
	ld	a, l
	or	a, a
	jr	Z,00113$
;src/juego.c:242: efecto_pliegue(PLIEGUE);
	xor	a, a
	push	af
	inc	sp
	call	_efecto_pliegue
	inc	sp
	jp	00116$
___str_9:
	.ascii "Chapter 1"
	.db 0x00
___str_10:
	.ascii "A faraway and foreign land ..."
	.db 0x00
___str_11:
	.ascii "Chapter 2"
	.db 0x00
___str_12:
	.ascii "A hidden passage to the Castle ..."
	.db 0x00
___str_13:
	.ascii "Chapter 3"
	.db 0x00
___str_14:
	.ascii "don Ricardo's Castle ..."
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
