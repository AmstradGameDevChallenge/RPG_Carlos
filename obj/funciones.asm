;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (CYGWIN)
;--------------------------------------------------------
	.module funciones
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _drawPotion
	.globl _IA
	.globl _defender
	.globl _moverDcha
	.globl _moverIzq
	.globl _comprobarPosicion
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
	.globl _mydrawStringM1
	.globl _playFX
	.globl _sprintf
	.globl _cpct_etm_setTileset2x4
	.globl _cpct_etm_drawTilemap2x4_f
	.globl _cpct_getRandom_mxor_u8
	.globl _cpct_setCRTCReg
	.globl _cpct_getScreenPtr
	.globl _cpct_setDrawCharM1
	.globl _cpct_drawSpriteMasked
	.globl _cpct_drawSprite
	.globl _cpct_drawSolidBox
	.globl _cpct_px2byteM1
	.globl _cpct_isAnyKeyPressed_f
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
;src/funciones.c:41: u8 abs (i8 valor){
;	---------------------------------
; Function abs
; ---------------------------------
_abs::
;src/funciones.c:42: return (valor > 0 ? valor : -valor);
	xor	a, a
	ld	iy, #2
	add	iy, sp
	sub	a, 0 (iy)
	jp	PO, 00109$
	xor	a, #0x80
00109$:
	jp	P, 00103$
	ld	iy, #2
	add	iy, sp
	ld	l, 0 (iy)
	ret
00103$:
	xor	a, a
	ld	iy, #2
	add	iy, sp
	sub	a, 0 (iy)
	ld	l, a
	ret
;src/funciones.c:45: void pausa(u16 ciclos) {
;	---------------------------------
; Function pausa
; ---------------------------------
_pausa::
;src/funciones.c:48: for (i = 0; i < ciclos; i++)
	ld	bc, #0x0000
00103$:
	ld	hl, #2
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	ret	NC
	inc	bc
	jr	00103$
;src/funciones.c:52: void efecto_pliegue(u8 modo) {
;	---------------------------------
; Function efecto_pliegue
; ---------------------------------
_efecto_pliegue::
;src/funciones.c:55: i = 80;
	ld	c, #0x50
;src/funciones.c:56: if (modo)
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	jr	Z,00108$
;src/funciones.c:57: i = 1;
	ld	c, #0x01
;src/funciones.c:59: do {
00108$:
;src/funciones.c:60: cpct_setCRTCReg (1, i/2);   //Cambiar nº columnas por pantalla (1-40)
	ld	b, c
	srl	b
	push	bc
	push	bc
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_cpct_setCRTCReg
	pop	bc
;src/funciones.c:62: for (j = 0; j < 255; j++)
	ld	b, #0xff
00113$:
	ld	e, b
	dec	e
	ld	a,e
	ld	b,a
	or	a, a
	jr	NZ,00113$
;src/funciones.c:65: if (modo) {
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	jr	Z,00105$
;src/funciones.c:66: i++;
	inc	c
	jr	00109$
00105$:
;src/funciones.c:68: i--; 
	dec	c
00109$:
;src/funciones.c:70: } while (i > 0 && i <= 80);
	ld	a, c
	or	a, a
	ret	Z
	ld	a, #0x50
	sub	a, c
	jr	NC,00108$
	ret
;src/funciones.c:74: void pausaTecladoLibre(){
;	---------------------------------
; Function pausaTecladoLibre
; ---------------------------------
_pausaTecladoLibre::
;src/funciones.c:75: while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
00101$:
	call	_cpct_isAnyKeyPressed_f
	ld	a, l
	or	a, a
	jr	NZ,00101$
	ret
;src/funciones.c:81: void dibujarMarcoExterior (){
;	---------------------------------
; Function dibujarMarcoExterior
; ---------------------------------
_dibujarMarcoExterior::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/funciones.c:86: tile = (u8*) &G_tile_cruzada[0];
	ld	bc, #_G_tile_cruzada+0
;src/funciones.c:87: if (nivel > 10)
	ld	a, #0x0a
	ld	iy, #_nivel
	sub	a, 0 (iy)
	jr	NC,00102$
;src/funciones.c:88: tile = (u8*) &G_tile_caverna[0];
	ld	bc, #_G_tile_caverna
00102$:
;src/funciones.c:89: if (nivel > 20)
	ld	a, #0x14
	ld	iy, #_nivel
	sub	a, 0 (iy)
	jr	NC,00115$
;src/funciones.c:90: tile = (u8*) &G_tile_castillo[0];
	ld	bc, #_G_tile_castillo
;src/funciones.c:94: for (i=0; i < 80; i += 4) {
00115$:
	ld	d, #0x00
00107$:
;src/funciones.c:95: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,   0), 4, 16);
	push	bc
	push	de
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
	push	hl
	pop	iy
	inc	sp
	inc	sp
	push	bc
	push	bc
	push	de
	ld	hl, #0x1004
	push	hl
	push	iy
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_cpct_drawSprite
	pop	de
	push	de
	ld	a, #0xb0
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
	push	hl
	pop	iy
	push	bc
	push	de
	ld	hl, #0x1004
	push	hl
	push	iy
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_cpct_drawSprite
	pop	de
	pop	bc
;src/funciones.c:94: for (i=0; i < 80; i += 4) {
	inc	d
	inc	d
	inc	d
	inc	d
	ld	a, d
	sub	a, #0x50
	jr	C,00107$
;src/funciones.c:99: for (i=16; i < 176; i += 16 ){
	ld	b, #0x10
00109$:
;src/funciones.c:100: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, 0, i), 4, 16);
	push	bc
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	de, #0x1004
	push	de
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_cpct_drawSprite
	pop	bc
;src/funciones.c:101: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,76, i), 4, 16);  
	push	bc
	push	bc
	inc	sp
	ld	a, #0x4c
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	de, #0x1004
	push	de
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_cpct_drawSprite
	pop	bc
;src/funciones.c:99: for (i=16; i < 176; i += 16 ){
	ld	a, b
	add	a, #0x10
	ld	b,a
	sub	a, #0xb0
	jr	C,00109$
	ld	sp, ix
	pop	ix
	ret
;src/funciones.c:106: void dibujarMarcoInterior (){
;	---------------------------------
; Function dibujarMarcoInterior
; ---------------------------------
_dibujarMarcoInterior::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/funciones.c:111: tile = (u8*) &G_tile_cruzada[0];
	ld	bc, #_G_tile_cruzada
;src/funciones.c:112: if (nivel > 10)
	ld	a, #0x0a
	ld	iy, #_nivel
	sub	a, 0 (iy)
	jr	NC,00102$
;src/funciones.c:113: tile = (u8*) &G_tile_caverna[0];
	ld	bc, #_G_tile_caverna
00102$:
;src/funciones.c:114: if (nivel > 20)
	ld	a, #0x14
	ld	iy, #_nivel
	sub	a, 0 (iy)
	jr	NC,00115$
;src/funciones.c:115: tile = (u8*) &G_tile_castillo[0];
	ld	bc, #_G_tile_castillo
;src/funciones.c:119: for (i=0; i < 80; i += 4) {
00115$:
	ld	e, #0x00
00107$:
;src/funciones.c:120: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,  48), 4, 16);
	push	bc
	push	de
	ld	d,#0x30
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
	push	hl
	pop	iy
	inc	sp
	inc	sp
	push	bc
	push	bc
	push	de
	ld	hl, #0x1004
	push	hl
	push	iy
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_cpct_drawSprite
	pop	de
	pop	bc
;src/funciones.c:119: for (i=0; i < 80; i += 4) {
	inc	e
	inc	e
	inc	e
	inc	e
	ld	a, e
	sub	a, #0x50
	jr	C,00107$
;src/funciones.c:123: for (i=64; i < 176; i += 16 ){
	ld	b, #0x40
00109$:
;src/funciones.c:124: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,40, i), 4, 16);
	push	bc
	push	bc
	inc	sp
	ld	a, #0x28
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	de, #0x1004
	push	de
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_cpct_drawSprite
	pop	bc
;src/funciones.c:123: for (i=64; i < 176; i += 16 ){
	ld	a, b
	add	a, #0x10
	ld	b,a
	sub	a, #0xb0
	jr	C,00109$
;src/funciones.c:128: cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
	ld	hl, #0x0000
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_px2byteM1
	pop	af
	pop	af
	ld	b, l
	ld	hl, #0x8022
	push	hl
	push	bc
	inc	sp
	ld	hl, #0xc25b
	push	hl
	call	_cpct_drawSolidBox
	ld	sp, ix
	pop	ix
	ret
;src/funciones.c:131: void dibujarEscenario(){
;	---------------------------------
; Function dibujarEscenario
; ---------------------------------
_dibujarEscenario::
;src/funciones.c:134: cpct_etm_setTileset2x4(tileset1);
	ld	hl, #_tileset1
	call	_cpct_etm_setTileset2x4
;src/funciones.c:135: if (nivel > 10)
	ld	a, #0x0a
	ld	iy, #_nivel
	sub	a, 0 (iy)
	jr	NC,00102$
;src/funciones.c:136: cpct_etm_setTileset2x4(tileset2);
	ld	hl, #_tileset2
	call	_cpct_etm_setTileset2x4
00102$:
;src/funciones.c:137: if (nivel > 20)
	ld	a, #0x14
	ld	iy, #_nivel
	sub	a, 0 (iy)
	jr	NC,00104$
;src/funciones.c:138: cpct_etm_setTileset2x4(tileset3);
	ld	hl, #_tileset3
	call	_cpct_etm_setTileset2x4
00104$:
;src/funciones.c:140: mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
	ld	bc, #_g_mapa01+0
	ld	iy, #_nivel
	ld	e, 0 (iy)
	ld	d, #0x00
	dec	de
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
;src/funciones.c:144: __endasm;
	di
;src/funciones.c:145: cpct_etm_drawTilemap2x4_f ( g_mapa01_W, g_mapa01_H , INICIO_AREA_JUEGO, mapa);
	push	hl
	ld	hl, #0xc284
	push	hl
	ld	hl, #0x1c12
	push	hl
	call	_cpct_etm_drawTilemap2x4_f
;src/funciones.c:148: __endasm;
	ei
	ret
;src/funciones.c:152: void printStats(TStats *a) {
;	---------------------------------
; Function printStats
; ---------------------------------
_printStats::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-44
	add	hl, sp
	ld	sp, hl
;src/funciones.c:155: cpct_setDrawCharM1(2, 0);
	ld	hl, #0x0002
	push	hl
	call	_cpct_setDrawCharM1
;src/funciones.c:156: sprintf(temp, "                                    ");
	ld	de, #___str_0+0
	ld	hl, #0x0000
	add	hl, sp
	ld	-2 (ix), l
	ld	-1 (ix), h
	push	de
	push	hl
	call	_sprintf
	pop	af
	pop	af
;src/funciones.c:157: if (a->energy)
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	e, 11 (iy)
	ld	a, e
	or	a, a
	jr	Z,00102$
;src/funciones.c:158: sprintf(temp, "%-9s=> HP:%02d. ATT: %02d. DEF: %02d",a->name, a->energy,a->attack,a->defense);
	push	bc
	pop	iy
	ld	l, 15 (iy)
	ld	-4 (ix), l
	ld	-3 (ix), #0x00
	push	bc
	pop	iy
	ld	l, 13 (iy)
	ld	-6 (ix), l
	ld	-5 (ix), #0x00
	ld	-8 (ix), e
	ld	-7 (ix), #0x00
	ld	e, c
	ld	d, b
	inc	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	pop	iy
	push	bc
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	push	de
	ld	hl, #___str_1
	push	hl
	push	iy
	call	_sprintf
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
	pop	bc
00102$:
;src/funciones.c:160: mydrawStringM1(temp, cpct_getScreenPtr(CPCT_VMEM_START, 4, a->pos_y));
	push	bc
	pop	iy
	ld	b, 18 (iy)
	push	bc
	inc	sp
	ld	a, #0x04
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	push	hl
	push	bc
	call	_mydrawStringM1
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.ascii "                                    "
	.db 0x00
___str_1:
	.ascii "%-9s=> HP:%02d. ATT: %02d. DEF: %02d"
	.db 0x00
;src/funciones.c:163: void printLevel() {
;	---------------------------------
; Function printLevel
; ---------------------------------
_printLevel::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-40
	add	hl, sp
	ld	sp, hl
;src/funciones.c:166: sprintf(temp, "LEVEL: %02d",nivel);
	ld	hl,#_nivel + 0
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #0x0000
	add	hl, sp
	ld	c, l
	ld	b, h
	push	hl
	push	de
	ld	de, #___str_2
	push	de
	push	bc
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	ld	bc, #0x0002
	push	bc
	call	_cpct_setDrawCharM1
	pop	hl
;src/funciones.c:168: mydrawStringM1(temp, cpctm_screenPtr(CPCT_VMEM_START, 4, 16));
	ld	bc, #0xc0a4
	push	bc
	push	hl
	call	_mydrawStringM1
	ld	sp, ix
	pop	ix
	ret
___str_2:
	.ascii "LEVEL: %02d"
	.db 0x00
;src/funciones.c:171: void printConsole  (void* string, u8 pen, u8 bground) {
;	---------------------------------
; Function printConsole
; ---------------------------------
_printConsole::
;src/funciones.c:172: if (cursorConsola > 175){
	ld	a, #0xaf
	ld	iy, #_cursorConsola
	sub	a, 0 (iy)
	jr	NC,00102$
;src/funciones.c:174: pausa(SEGUNDO);
	ld	hl, #0x8000
	push	hl
	call	_pausa
	pop	af
;src/funciones.c:175: cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
	ld	hl, #0x0000
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_px2byteM1
	pop	af
	pop	af
	ld	b, l
	ld	hl, #0x8022
	push	hl
	push	bc
	inc	sp
	ld	hl, #0xc25b
	push	hl
	call	_cpct_drawSolidBox
;src/funciones.c:176: cursorConsola = 64;
	ld	hl,#_cursorConsola + 0
	ld	(hl), #0x40
00102$:
;src/funciones.c:179: cpct_setDrawCharM1(pen, bground);
	ld	hl, #5+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #5+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_cpct_setDrawCharM1
;src/funciones.c:180: mydrawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 44, cursorConsola));
	ld	a, (_cursorConsola)
	ld	d,a
	ld	e,#0x2c
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_mydrawStringM1
;src/funciones.c:181: cursorConsola +=8;
	ld	hl, #_cursorConsola
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
	ret
;src/funciones.c:184: void atacar(TStats *a, TStats *b) {
;	---------------------------------
; Function atacar
; ---------------------------------
_atacar::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-35
	add	hl, sp
	ld	sp, hl
;src/funciones.c:188: pen = 0;
	ld	-13 (ix), #0x00
;src/funciones.c:189: bg = 2;
	ld	-14 (ix), #0x02
;src/funciones.c:190: nota = 33;
	ld	-15 (ix), #0x21
;src/funciones.c:191: if ((u16) a->sprite == (u16) G_mendo)  {
	ld	a, 4 (ix)
	ld	-7 (ix), a
	ld	a, 5 (ix)
	ld	-6 (ix), a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	de, #0x0013
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, #_G_mendo+0
	ld	a, c
	sub	a, e
	jr	NZ,00102$
	ld	a, b
	sub	a, d
	jr	NZ,00102$
;src/funciones.c:192: pen = 2;
	ld	-13 (ix), #0x02
;src/funciones.c:193: bg = 0;
	ld	-14 (ix), #0x00
;src/funciones.c:194: nota = 23;
	ld	-15 (ix), #0x17
00102$:
;src/funciones.c:197: if (b->energy) { //Asegurarnos que el atacado sigue vivo
	ld	a, 6 (ix)
	ld	-9 (ix), a
	ld	a, 7 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	add	a, #0x0b
	ld	-11 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a, (hl)
	or	a, a
	jp	Z, 00108$
;src/funciones.c:198: ataque = a->attack + (2*(cpct_rand()%a->force)) - a->force;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	de, #0x000d
	add	hl, de
	ld	c, (hl)
	push	bc
	call	_cpct_getRandom_mxor_u8
	ld	d, l
	pop	bc
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	push	bc
	ld	bc, #0x000e
	add	hl, bc
	pop	bc
	ld	b, (hl)
	push	bc
	ld	c, d
	push	bc
	call	__moduchar
	pop	af
	pop	bc
	sla	l
	add	hl, bc
	ld	a, l
	sub	a, b
;src/funciones.c:199: sprintf(temp, "%-9s ATT %02d",a->name, ataque);
	ld	-12 (ix), a
	ld	e, a
	ld	d, #0x00
	ld	c,-7 (ix)
	ld	b,-6 (ix)
	inc	bc
	ld	hl, #0x0000
	add	hl, sp
	ld	-7 (ix), l
	ld	-6 (ix), h
	push	de
	push	bc
	ld	bc, #___str_3
	push	bc
	push	hl
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;src/funciones.c:200: printConsole(temp, pen, bg);
	ld	c,-7 (ix)
	ld	b,-6 (ix)
	ld	h, -14 (ix)
	ld	l, -13 (ix)
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
;src/funciones.c:201: playFX (1, nota);
	ld	d, -15 (ix)
	ld	e,#0x01
	push	de
	call	_playFX
;src/funciones.c:202: pausa(SEGUNDO/2);
	ld	hl, #0x4000
	ex	(sp),hl
	call	_pausa
	pop	af
;src/funciones.c:204: if (ataque < b->energy) {
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
;src/funciones.c:206: sprintf(temp, "%-9s HP=>%02d",b->name, b->energy);
	ld	a, -9 (ix)
	add	a, #0x01
	ld	-3 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
;src/funciones.c:204: if (ataque < b->energy) {
	ld	a, -12 (ix)
	sub	a, -1 (ix)
	jr	NC,00104$
;src/funciones.c:205: b->energy = b->energy - ataque;
	ld	a, -1 (ix)
	sub	a, -12 (ix)
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl), a
;src/funciones.c:206: sprintf(temp, "%-9s HP=>%02d",b->name, b->energy);
	ld	l, a
	ld	h, #0x00
	ld	de, #___str_4+0
	ld	c,-7 (ix)
	ld	b,-6 (ix)
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	push	de
	push	bc
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	jr	00105$
00104$:
;src/funciones.c:208: b->energy = 0;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl), #0x00
;src/funciones.c:209: sprintf(temp, "%-9s DIED! ",b->name, b->energy);
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	ld	-11 (ix), a
	ld	-10 (ix), #0x00
	ld	a, -7 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	ld	-4 (ix), a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	ld	hl, #___str_5
	push	hl
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	hl
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;src/funciones.c:210: printStats(b);
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_printStats
	pop	af
;src/funciones.c:212: ataque = pen;
	ld	c, -13 (ix)
;src/funciones.c:213: pen = bg;
	ld	a, -14 (ix)
	ld	-13 (ix), a
;src/funciones.c:214: bg = ataque;
	ld	-14 (ix), c
00105$:
;src/funciones.c:217: printConsole(temp, pen, bg);
	ld	c,-7 (ix)
	ld	b,-6 (ix)
	ld	h, -14 (ix)
	ld	l, -13 (ix)
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
00108$:
	ld	sp, ix
	pop	ix
	ret
___str_3:
	.ascii "%-9s ATT %02d"
	.db 0x00
___str_4:
	.ascii "%-9s HP=>%02d"
	.db 0x00
___str_5:
	.ascii "%-9s DIED! "
	.db 0x00
;src/funciones.c:221: void comprobarPosicion (TStats *a, u8 nuevaPosicion){
;	---------------------------------
; Function comprobarPosicion
; ---------------------------------
_comprobarPosicion::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/funciones.c:224: nueva = nuevaPosicion;
	ld	a, 6 (ix)
	ld	-3 (ix), a
;src/funciones.c:227: for (j = 0; j < 3; j++) {
	ld	-1 (ix), #0x00
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	c, #0x00
00113$:
;src/funciones.c:228: if (a->id != j && entidad[j].energy) {
	ld	a, (de)
	ld	-2 (ix), a
	ld	a, c
	sub	a, -2 (ix)
	jr	Z,00114$
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	b, h
	ld	iy, #_entidad
	push	bc
	ld	c, l
	add	iy, bc
	pop	bc
	push	iy
	pop	hl
	push	bc
	ld	bc, #0x000b
	add	hl, bc
	pop	bc
	ld	a, (hl)
	or	a, a
	jr	Z,00114$
;src/funciones.c:229: if (entidad[j].pos_x == nueva) {
	push	iy
	pop	hl
	push	bc
	ld	bc, #0x0010
	add	hl, bc
	pop	bc
	ld	a,-3 (ix)
	sub	a,(hl)
	jr	NZ,00114$
;src/funciones.c:230: nueva = 0;
	ld	-3 (ix), #0x00
;src/funciones.c:231: if (a->id == 0 || j == 0) //ataque sólo si está involucrado el jugador. Para que no se ataquen los enemigos
	ld	a, -2 (ix)
	or	a, a
	jr	Z,00101$
	ld	a, -1 (ix)
	or	a, a
	jr	NZ,00109$
00101$:
;src/funciones.c:232: atacar(&entidad[a->id], &entidad[j]);
	push	iy
	pop	bc
	push	de
	ld	e,-2 (ix)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	pop	de
	ld	a, #<(_entidad)
	add	a, l
	ld	l, a
	ld	a, #>(_entidad)
	adc	a, h
	ld	h, a
	push	de
	push	bc
	push	hl
	call	_atacar
	pop	af
	pop	af
	pop	de
;src/funciones.c:233: break;
	jr	00109$
00114$:
;src/funciones.c:227: for (j = 0; j < 3; j++) {
	inc	c
	ld	-1 (ix), c
	ld	a, c
	sub	a, #0x03
	jr	C,00113$
00109$:
;src/funciones.c:239: if (nueva > 3 && nueva < 37)
	ld	a, #0x03
	sub	a, -3 (ix)
	jr	NC,00115$
	ld	a, -3 (ix)
	sub	a, #0x25
	jr	NC,00115$
;src/funciones.c:240: a->pos_x = nueva;
	ld	hl, #0x0010
	add	hl, de
	ld	a, -3 (ix)
	ld	(hl), a
00115$:
	ld	sp, ix
	pop	ix
	ret
;src/funciones.c:243: void moverIzq(TStats *a) {
;	---------------------------------
; Function moverIzq
; ---------------------------------
_moverIzq::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-24
	add	hl, sp
	ld	sp, hl
;src/funciones.c:246: pen = 0;
	ld	-23 (ix), #0x00
;src/funciones.c:247: bg = 2;
	ld	-24 (ix), #0x02
;src/funciones.c:248: if ((u16) a->sprite == (u16) G_mendo)  {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	ld	de, #0x0013
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	-2 (ix), #<(_G_mendo)
	ld	-1 (ix), #>(_G_mendo)
	ld	a, e
	sub	a, -2 (ix)
	jr	NZ,00102$
	ld	a, d
	sub	a, -1 (ix)
	jr	NZ,00102$
;src/funciones.c:249: pen = 2;
	ld	-23 (ix), #0x02
;src/funciones.c:250: bg = 0;
	ld	-24 (ix), #0x00
00102$:
;src/funciones.c:253: sprintf(temp, "%-9s GOES <",a->name);
	ld	e, c
	ld	d, b
	inc	de
	ld	hl, #0x0002
	add	hl, sp
	push	hl
	pop	iy
	push	hl
	push	bc
	push	de
	ld	de, #___str_6
	push	de
	push	iy
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
	pop	hl
;src/funciones.c:254: printConsole(temp, pen, bg);
	ex	de,hl
	push	bc
	ld	h, -24 (ix)
	ld	l, -23 (ix)
	push	hl
	push	de
	call	_printConsole
	pop	af
	pop	af
	pop	bc
;src/funciones.c:256: comprobarPosicion(a,a->pos_x - 4);
	push	bc
	pop	iy
	ld	a, 16 (iy)
	add	a, #0xfc
	ld	d, a
	push	de
	inc	sp
	push	bc
	call	_comprobarPosicion
	ld	sp,ix
	pop	ix
	ret
___str_6:
	.ascii "%-9s GOES <"
	.db 0x00
;src/funciones.c:259: void moverDcha(TStats *a) {
;	---------------------------------
; Function moverDcha
; ---------------------------------
_moverDcha::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-24
	add	hl, sp
	ld	sp, hl
;src/funciones.c:262: pen = 0;
	ld	-23 (ix), #0x00
;src/funciones.c:263: bg = 2;
	ld	-24 (ix), #0x02
;src/funciones.c:264: if ((u16) a->sprite == (u16) G_mendo)  {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	ld	de, #0x0013
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	-2 (ix), #<(_G_mendo)
	ld	-1 (ix), #>(_G_mendo)
	ld	a, e
	sub	a, -2 (ix)
	jr	NZ,00102$
	ld	a, d
	sub	a, -1 (ix)
	jr	NZ,00102$
;src/funciones.c:265: pen = 2;
	ld	-23 (ix), #0x02
;src/funciones.c:266: bg = 0;
	ld	-24 (ix), #0x00
00102$:
;src/funciones.c:269: sprintf(temp, "%-9s GOES >",a->name);
	ld	e, c
	ld	d, b
	inc	de
	ld	hl, #0x0002
	add	hl, sp
	push	hl
	pop	iy
	push	hl
	push	bc
	push	de
	ld	de, #___str_7
	push	de
	push	iy
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
	pop	hl
;src/funciones.c:270: printConsole(temp, pen, bg);
	ex	de,hl
	push	bc
	ld	h, -24 (ix)
	ld	l, -23 (ix)
	push	hl
	push	de
	call	_printConsole
	pop	af
	pop	af
	pop	bc
;src/funciones.c:272: comprobarPosicion(a,a->pos_x + 4);
	push	bc
	pop	iy
	ld	a, 16 (iy)
	add	a, #0x04
	push	af
	inc	sp
	push	bc
	call	_comprobarPosicion
	ld	sp,ix
	pop	ix
	ret
___str_7:
	.ascii "%-9s GOES >"
	.db 0x00
;src/funciones.c:275: void defender(TStats *a) {
;	---------------------------------
; Function defender
; ---------------------------------
_defender::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-28
	add	hl, sp
	ld	sp, hl
;src/funciones.c:278: pen = 0;
	ld	-26 (ix), #0x00
;src/funciones.c:279: bg = 2;
	ld	-27 (ix), #0x02
;src/funciones.c:280: nota = 33;
	ld	-28 (ix), #0x21
;src/funciones.c:281: if ((u16) a->sprite == (u16) G_mendo)  {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	ld	de, #0x0013
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	-2 (ix), #<(_G_mendo)
	ld	-1 (ix), #>(_G_mendo)
	ld	a, e
	sub	a, -2 (ix)
	jr	NZ,00102$
	ld	a, d
	sub	a, -1 (ix)
	jr	NZ,00102$
;src/funciones.c:282: pen = 2;
	ld	-26 (ix), #0x02
;src/funciones.c:283: bg = 0;
	ld	-27 (ix), #0x00
;src/funciones.c:284: nota = 23;
	ld	-28 (ix), #0x17
00102$:
;src/funciones.c:287: if (a->energy + a->defense < a->max_energy)
	ld	iy, #0x000b
	add	iy, bc
	ld	a, 0 (iy)
	ld	-2 (ix), a
	ld	e, a
	ld	d, #0x00
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x000f
	add	hl, bc
	pop	bc
	ld	a, (hl)
	ld	-3 (ix), a
	ld	l, a
	ld	h, #0x00
	add	hl,de
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	l, c
	ld	h, b
	ld	de, #0x000c
	add	hl, de
	ld	e, (hl)
	ld	l, e
	ld	d, #0x00
	ld	a, -5 (ix)
	sub	a, l
	ld	a, -4 (ix)
	sbc	a, d
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	P, 00104$
;src/funciones.c:288: healed = a->defense;
	ld	e, -3 (ix)
	jr	00105$
00104$:
;src/funciones.c:290: healed = a->max_energy - a->energy;
	ld	a, e
	sub	a, -2 (ix)
	ld	e, a
00105$:
;src/funciones.c:292: a->energy = a->energy + healed;
	ld	a, -2 (ix)
	add	a, e
	ld	0 (iy), a
;src/funciones.c:294: if (healed) {
	ld	a, e
	or	a, a
	jr	Z,00108$
;src/funciones.c:295: sprintf(temp, "%-9s ^ %02dHP",a->name, healed);
	ld	d, #0x00
	inc	bc
	ld	hl, #0x0003
	add	hl, sp
	ld	-5 (ix), l
	ld	-4 (ix), h
	push	hl
	push	de
	push	bc
	ld	bc, #___str_8
	push	bc
	ld	c,-5 (ix)
	ld	b,-4 (ix)
	push	bc
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	hl
;src/funciones.c:296: printConsole(temp, pen, bg);
	ld	c, l
	ld	b, h
	ld	h, -27 (ix)
	ld	l, -26 (ix)
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
;src/funciones.c:297: playFX (2, nota);
	ld	d, -28 (ix)
	ld	e,#0x02
	push	de
	call	_playFX
;src/funciones.c:298: pausa(SEGUNDO/2);
	ld	hl, #0x4000
	ex	(sp),hl
	call	_pausa
	pop	af
00108$:
	ld	sp, ix
	pop	ix
	ret
___str_8:
	.ascii "%-9s ^ %02dHP"
	.db 0x00
;src/funciones.c:302: void IA(TStats *a) {
;	---------------------------------
; Function IA
; ---------------------------------
_IA::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
;src/funciones.c:304: if ((u16) a->sprite == (u16) G_goblin) {
	ld	a, 4 (ix)
	ld	-2 (ix), a
	ld	a, 5 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	add	a, #0x13
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, #_G_goblin+0
	ld	a, c
	sub	a, e
	jr	NZ,00104$
	ld	a, b
	sub	a, d
	jr	NZ,00104$
;src/funciones.c:305: if (cpct_rand() % 2)
	call	_cpct_getRandom_mxor_u8
	bit	0, l
	jr	Z,00104$
;src/funciones.c:306: moverIzq(a);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_moverIzq
	pop	af
00104$:
;src/funciones.c:304: if ((u16) a->sprite == (u16) G_goblin) {
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
;src/funciones.c:309: if ( ((u16) a->sprite == (u16) G_arabe_1)
	pop	de
	pop	bc
	push	bc
	push	de
	ld	de, #_G_arabe_1+0
;src/funciones.c:319: if (abs(a->pos_x - entidad[0].pos_x) <= 8)  {
	ld	a, -2 (ix)
	add	a, #0x10
	ld	-8 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
;src/funciones.c:309: if ( ((u16) a->sprite == (u16) G_arabe_1)
	ld	a, c
	sub	a, e
	jr	NZ,00231$
	ld	a, b
	sub	a, d
	jr	Z,00114$
00231$:
;src/funciones.c:310: || ((u16) a->sprite == (u16) G_arabe_2)
	ld	de, #_G_arabe_2+0
	ld	a, c
	sub	a, e
	jr	NZ,00232$
	ld	a, b
	sub	a, d
	jr	Z,00114$
00232$:
;src/funciones.c:311: || ((u16) a->sprite == (u16) G_esqueleto)
	pop	de
	pop	bc
	push	bc
	push	de
	ld	de, #_G_esqueleto+0
	ld	a, e
	sub	a, c
	jr	NZ,00233$
	ld	a, d
	sub	a, b
	jr	Z,00114$
00233$:
;src/funciones.c:312: || ((u16) a->sprite == (u16) G_spider)
	pop	de
	pop	bc
	push	bc
	push	de
	ld	de, #_G_spider+0
	ld	a, c
	sub	a, e
	jr	NZ,00234$
	ld	a, b
	sub	a, d
	jr	Z,00114$
00234$:
;src/funciones.c:313: || ((u16) a->sprite == (u16) G_soldado_1)
	pop	de
	pop	bc
	push	bc
	push	de
	ld	de, #_G_soldado_1+0
	ld	a, c
	sub	a, e
	jr	NZ,00235$
	ld	a, b
	sub	a, d
	jr	Z,00114$
00235$:
;src/funciones.c:314: || ((u16) a->sprite == (u16) G_carcelero)
	pop	de
	pop	bc
	push	bc
	push	de
	ld	de, #_G_carcelero+0
	ld	a, c
	sub	a, e
	jr	NZ,00236$
	ld	a, b
	sub	a, d
	jr	Z,00114$
00236$:
;src/funciones.c:315: || ((u16) a->sprite == (u16) G_caballero)
	pop	de
	pop	bc
	push	bc
	push	de
	ld	de, #_G_caballero+0
	ld	a, c
	sub	a, e
	jr	NZ,00115$
	ld	a, b
	sub	a, d
	jr	NZ,00115$
00114$:
;src/funciones.c:319: if (abs(a->pos_x - entidad[0].pos_x) <= 8)  {
	pop	hl
	push	hl
	ld	c, (hl)
	ld	hl, #_entidad+16
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	b, a
	push	bc
	inc	sp
	call	_abs
	inc	sp
	ld	a, #0x08
	sub	a, l
	jr	C,00112$
;src/funciones.c:320: moverIzq(a);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_moverIzq
	pop	af
	jr	00115$
00112$:
;src/funciones.c:323: if (cpct_rand() % 2)
	call	_cpct_getRandom_mxor_u8
	bit	0, l
	jr	Z,00109$
;src/funciones.c:324: defender(a);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_defender
	pop	af
	jr	00115$
00109$:
;src/funciones.c:326: if (cpct_rand() % 2)
	call	_cpct_getRandom_mxor_u8
	bit	0, l
	jr	Z,00106$
;src/funciones.c:327: moverIzq(a);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_moverIzq
	pop	af
	jr	00115$
00106$:
;src/funciones.c:329: moverDcha(a);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_moverDcha
	pop	af
00115$:
;src/funciones.c:333: if ((u16) a->sprite == (u16) G_abeja 
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	-6 (ix), c
	ld	-5 (ix), b
;src/funciones.c:334: || (u16) a->sprite == (u16) G_murcielago
	ld	de, #_G_abeja+0
	ld	a, -6 (ix)
	sub	a, e
	jr	NZ,00241$
	ld	a, -5 (ix)
	sub	a, d
	jr	Z,00125$
00241$:
;src/funciones.c:335: || nivel == 10
	ld	de, #_G_murcielago+0
	ld	a, c
	sub	a, e
	jr	NZ,00242$
	ld	a, b
	sub	a, d
	jr	Z,00125$
00242$:
;src/funciones.c:336: || nivel == 20
	ld	iy, #_nivel
	ld	a, 0 (iy)
	sub	a, #0x0a
	jr	Z,00125$
;src/funciones.c:337: )  {  
	ld	a, 0 (iy)
	sub	a, #0x14
	jr	NZ,00126$
00125$:
;src/funciones.c:339: if (cpct_rand() % 2)
	call	_cpct_getRandom_mxor_u8
	bit	0, l
	jr	Z,00123$
;src/funciones.c:340: defender(a);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_defender
	pop	af
	jr	00126$
00123$:
;src/funciones.c:342: moverIzq(a);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_moverIzq
	pop	af
00126$:
;src/funciones.c:304: if ((u16) a->sprite == (u16) G_goblin) {
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;src/funciones.c:309: if ( ((u16) a->sprite == (u16) G_arabe_1)
	ld	-6 (ix), c
	ld	-5 (ix), b
;src/funciones.c:344: if (((u16) a->sprite == (u16) G_fakir)
	ld	de, #_G_fakir+0
	ld	a, -6 (ix)
	sub	a, e
	jr	NZ,00247$
	ld	a, -5 (ix)
	sub	a, d
	jr	Z,00132$
00247$:
;src/funciones.c:345: || ((u16) a->sprite == (u16) G_gusano)
	ld	de, #_G_gusano+0
	ld	a, -6 (ix)
	sub	a, e
	jr	NZ,00248$
	ld	a, -5 (ix)
	sub	a, d
	jr	Z,00132$
00248$:
;src/funciones.c:346: || ((u16) a->sprite == (u16) G_soldado_2)
	ld	de, #_G_soldado_2+0
	ld	a, e
	sub	a, c
	jr	NZ,00133$
	ld	a, d
	sub	a, b
	jr	NZ,00133$
00132$:
;src/funciones.c:349: if (abs(a->pos_x - entidad[0].pos_x) <= 4) 
	pop	hl
	push	hl
	ld	c, (hl)
	ld	hl, #_entidad+16
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	b, a
	push	bc
	inc	sp
	call	_abs
	inc	sp
	ld	a, #0x04
	sub	a, l
	jr	C,00133$
;src/funciones.c:350: moverIzq(a);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_moverIzq
	pop	af
00133$:
;src/funciones.c:352: if ((u16) a->sprite == (u16) G_arabe_3)  {  
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, #_G_arabe_3+0
	ld	a, c
	sub	a, e
	jr	NZ,00139$
	ld	a, b
	sub	a, d
	jr	NZ,00139$
;src/funciones.c:355: if (abs(a->pos_x - entidad[0].pos_x) <= 16) 
	pop	hl
	push	hl
	ld	c, (hl)
	ld	hl, #_entidad + 16
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	b, a
	push	bc
	inc	sp
	call	_abs
	inc	sp
	ld	a, #0x10
	sub	a, l
	jr	C,00139$
;src/funciones.c:356: atacar(a,&entidad[0]);
	ld	hl, #_entidad
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_atacar
	pop	af
	pop	af
00139$:
;src/funciones.c:358: if ((u16) a->sprite == (u16) G_mago)  {  
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, #_G_mago+0
	ld	a, c
	sub	a, e
	jr	NZ,00142$
	ld	a, b
	sub	a, d
	jr	NZ,00142$
;src/funciones.c:360: atacar(a,&entidad[0]);
	ld	hl, #_entidad
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_atacar
	pop	af
	pop	af
00142$:
	ld	sp, ix
	pop	ix
	ret
;src/funciones.c:366: void drawPotion(){
;	---------------------------------
; Function drawPotion
; ---------------------------------
_drawPotion::
;src/funciones.c:367: cpct_drawSpriteMasked (G_pocion, cpctm_screenPtr (CPCT_VMEM_START, 28, 144), 2,16);
	ld	hl, #0x1002
	push	hl
	ld	hl, #0xc5bc
	push	hl
	ld	hl, #_G_pocion
	push	hl
	call	_cpct_drawSpriteMasked
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
