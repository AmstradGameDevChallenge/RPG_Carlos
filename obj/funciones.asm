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
	.globl _mydrawStringM1
	.globl _sprintf
	.globl _cpct_etm_setTileset2x4
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_getRandom_mxor_u8
	.globl _cpct_setCRTCReg
	.globl _cpct_getScreenPtr
	.globl _cpct_setDrawCharM1
	.globl _cpct_drawSpriteMasked
	.globl _cpct_drawSprite
	.globl _cpct_drawSolidBox
	.globl _cpct_px2byteM1
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_scanKeyboard_f
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
;src/funciones.c:40: u8 abs (i8 valor){
;	---------------------------------
; Function abs
; ---------------------------------
_abs::
;src/funciones.c:41: return (valor > 0 ? valor : -valor);
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
;src/funciones.c:44: void pausa(u16 ciclos) {
;	---------------------------------
; Function pausa
; ---------------------------------
_pausa::
;src/funciones.c:47: for (i = 0; i < ciclos; i++)
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
;src/funciones.c:51: void efecto_pliegue(u8 modo) {
;	---------------------------------
; Function efecto_pliegue
; ---------------------------------
_efecto_pliegue::
;src/funciones.c:54: i = 200;
	ld	b, #0xc8
;src/funciones.c:55: if (modo)
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	jr	Z,00108$
;src/funciones.c:56: i = 1;
	ld	b, #0x01
;src/funciones.c:58: do {
00108$:
;src/funciones.c:59: cpct_setCRTCReg (1, i/5);   //Cambiar nº columnas por pantalla (1-40)
	push	bc
	ld	a, #0x05
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__divuchar
	pop	af
	ld	d, l
	ld	e, #0x01
	push	de
	call	_cpct_setCRTCReg
	pop	bc
;src/funciones.c:60: cpct_setCRTCReg (6, i/8);   //Cambiar nº de filas por pantallas (1-25)
	ld	d, b
	srl	d
	srl	d
	srl	d
	push	bc
	ld	e, #0x06
	push	de
	call	_cpct_setCRTCReg
	pop	bc
;src/funciones.c:62: for (j = 0; j < 255; j++)
	ld	c, #0xff
00113$:
	ld	e, c
	dec	e
	ld	a,e
	ld	c,a
	or	a, a
	jr	NZ,00113$
;src/funciones.c:65: if (modo) {
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	jr	Z,00105$
;src/funciones.c:66: i++;
	inc	b
	jr	00109$
00105$:
;src/funciones.c:68: i--; 
	dec	b
00109$:
;src/funciones.c:70: } while (i > 0 && i <= 200);
	ld	a, b
	or	a, a
	ret	Z
	ld	a, #0xc8
	sub	a, b
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
	ret	Z
;src/funciones.c:76: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
	jr	00101$
;src/funciones.c:80: void dibujarMarcoExterior (){
;	---------------------------------
; Function dibujarMarcoExterior
; ---------------------------------
_dibujarMarcoExterior::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/funciones.c:85: tile = (u8*) &G_tile_cruzada[0];
	ld	bc, #_G_tile_cruzada+0
;src/funciones.c:86: if ((nivel/10) == 1)
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	ld	a, (_nivel)
	push	af
	inc	sp
	call	__divuchar
	pop	af
	pop	bc
	ld	a, l
	dec	a
	jr	NZ,00102$
;src/funciones.c:87: tile = (u8*) &G_tile_caverna[0];
	ld	bc, #_G_tile_caverna+0
00102$:
;src/funciones.c:88: if ((nivel/10) == 2)
	ld	a, l
	sub	a, #0x02
	jr	NZ,00115$
;src/funciones.c:89: tile = (u8*) &G_tile_castillo[0];
	ld	bc, #_G_tile_castillo
;src/funciones.c:93: for (i=0; i < 80; i += 4) {
00115$:
	ld	d, #0x00
00107$:
;src/funciones.c:94: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,   0), 4, 16);
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
;src/funciones.c:93: for (i=0; i < 80; i += 4) {
	inc	d
	inc	d
	inc	d
	inc	d
	ld	a, d
	sub	a, #0x50
	jr	C,00107$
;src/funciones.c:98: for (i=16; i < 176; i += 16 ){
	ld	b, #0x10
00109$:
;src/funciones.c:99: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, 0, i), 4, 16);
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
;src/funciones.c:100: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,76, i), 4, 16);  
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
;src/funciones.c:98: for (i=16; i < 176; i += 16 ){
	ld	a, b
	add	a, #0x10
	ld	b,a
	sub	a, #0xb0
	jr	C,00109$
	ld	sp, ix
	pop	ix
	ret
;src/funciones.c:105: void dibujarMarcoInterior (){
;	---------------------------------
; Function dibujarMarcoInterior
; ---------------------------------
_dibujarMarcoInterior::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/funciones.c:110: tile = (u8*) &G_tile_cruzada[0];
	ld	bc, #_G_tile_cruzada
;src/funciones.c:111: if ((nivel/10) == 1)
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	ld	a, (_nivel)
	push	af
	inc	sp
	call	__divuchar
	pop	af
	pop	bc
	dec	l
	jr	NZ,00112$
;src/funciones.c:112: tile = (u8*) &G_tile_cruzada[0];
	ld	bc, #_G_tile_cruzada
;src/funciones.c:116: for (i=0; i < 80; i += 4) {
00112$:
	ld	e, #0x00
00105$:
;src/funciones.c:117: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,  48), 4, 16);
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
;src/funciones.c:116: for (i=0; i < 80; i += 4) {
	inc	e
	inc	e
	inc	e
	inc	e
	ld	a, e
	sub	a, #0x50
	jr	C,00105$
;src/funciones.c:120: for (i=64; i < 176; i += 16 ){
	ld	b, #0x40
00107$:
;src/funciones.c:121: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,40, i), 4, 16);
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
;src/funciones.c:120: for (i=64; i < 176; i += 16 ){
	ld	a, b
	add	a, #0x10
	ld	b,a
	sub	a, #0xb0
	jr	C,00107$
;src/funciones.c:125: cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
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
;src/funciones.c:128: void dibujarEscenario(){
;	---------------------------------
; Function dibujarEscenario
; ---------------------------------
_dibujarEscenario::
;src/funciones.c:131: cpct_etm_setTileset2x4(tileset1);
	ld	hl, #_tileset1
	call	_cpct_etm_setTileset2x4
;src/funciones.c:132: if (nivel > 10)
	ld	a, #0x0a
	ld	iy, #_nivel
	sub	a, 0 (iy)
	jr	NC,00102$
;src/funciones.c:133: cpct_etm_setTileset2x4(tileset2);
	ld	hl, #_tileset2
	call	_cpct_etm_setTileset2x4
00102$:
;src/funciones.c:137: mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
	ld	bc, #_g_mapa01+0
	ld	hl,#_nivel + 0
	ld	e, (hl)
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
;src/funciones.c:139: cpct_etm_drawTilemap2x4 ( g_mapa01_W, g_mapa01_H , INICIO_AREA_JUEGO, mapa);
	push	hl
	ld	hl, #0xc284
	push	hl
	ld	hl, #0x121c
	push	hl
	ld	l, #0x00
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_cpct_etm_drawTileBox2x4
	ret
;src/funciones.c:143: void printStats(TStats *a) {
;	---------------------------------
; Function printStats
; ---------------------------------
_printStats::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-42
	add	hl, sp
	ld	sp, hl
;src/funciones.c:146: cpct_setDrawCharM1(2, 0);
	ld	hl, #0x0002
	push	hl
	call	_cpct_setDrawCharM1
;src/funciones.c:147: sprintf(temp, "                                    ");
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
;src/funciones.c:148: if (a->energy)
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	e, 10 (iy)
	ld	a, e
	or	a, a
	jr	Z,00102$
;src/funciones.c:149: sprintf(temp, "%-9s=> HP:%02d. ATT: %02d. DEF: %02d",a->name, a->energy,a->attack,a->defense);
	push	bc
	pop	iy
	ld	l, 14 (iy)
	ld	-4 (ix), l
	ld	-3 (ix), #0x00
	push	bc
	pop	iy
	ld	l, 12 (iy)
	ld	-6 (ix), l
	ld	-5 (ix), #0x00
	ld	d, #0x00
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
	push	de
	push	bc
	ld	hl, #___str_1
	push	hl
	push	iy
	call	_sprintf
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
	pop	bc
00102$:
;src/funciones.c:151: mydrawStringM1(temp, cpct_getScreenPtr(CPCT_VMEM_START, 4, a->pos_y));
	push	bc
	pop	iy
	ld	b, 17 (iy)
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
;src/funciones.c:154: void printLevel() {
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
;src/funciones.c:157: sprintf(temp, "LEVEL: %02d",nivel);
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
;src/funciones.c:159: mydrawStringM1(temp, cpctm_screenPtr(CPCT_VMEM_START, 4, 16));
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
;src/funciones.c:162: void printConsole  (void* string, u8 pen, u8 bground) {
;	---------------------------------
; Function printConsole
; ---------------------------------
_printConsole::
;src/funciones.c:163: if (cursorConsola > 175){
	ld	a, #0xaf
	ld	iy, #_cursorConsola
	sub	a, 0 (iy)
	jr	NC,00102$
;src/funciones.c:165: pausa(SEGUNDO);
	ld	hl, #0x8000
	push	hl
	call	_pausa
	pop	af
;src/funciones.c:166: cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
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
;src/funciones.c:167: cursorConsola = 64;
	ld	hl,#_cursorConsola + 0
	ld	(hl), #0x40
00102$:
;src/funciones.c:170: cpct_setDrawCharM1(pen, bground);
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
;src/funciones.c:171: mydrawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 44, cursorConsola));
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
;src/funciones.c:172: cursorConsola +=8;
	ld	hl, #_cursorConsola
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
	ret
;src/funciones.c:175: void atacar(TStats *a, TStats *b) {
;	---------------------------------
; Function atacar
; ---------------------------------
_atacar::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-26
	add	hl, sp
	ld	sp, hl
;src/funciones.c:179: pen = 0;
	ld	-5 (ix), #0x00
;src/funciones.c:180: bg = 2;
	ld	-6 (ix), #0x02
;src/funciones.c:181: if ((u16) a->sprite == (u16) G_mendo)  {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	ld	de, #0x0012
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
;src/funciones.c:182: pen = 2;
	ld	-5 (ix), #0x02
;src/funciones.c:183: bg = 0;
	ld	-6 (ix), #0x00
00102$:
;src/funciones.c:187: ataque = a->attack + (2*(cpct_rand()%a->force)) - a->force;
	push	bc
	pop	iy
	ld	a, 12 (iy)
	ld	-2 (ix), a
	push	bc
	call	_cpct_getRandom_mxor_u8
	ld	e, l
	pop	bc
	push	bc
	pop	iy
	ld	d, 13 (iy)
	push	bc
	push	de
	push	de
	call	__moduchar
	pop	af
	pop	de
	pop	bc
	sla	l
	ld	a, -2 (ix)
	add	a, l
	sub	a, d
;src/funciones.c:188: sprintf(temp, "%-9s ATT %02d",a->name, ataque);
	ld	-2 (ix), a
	ld	e, a
	ld	d, #0x00
	ld	hl, #0x0000
	add	hl, sp
	ld	-4 (ix), l
	ld	-3 (ix), h
	push	de
	push	bc
	ld	bc, #___str_3
	push	bc
	push	hl
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;src/funciones.c:189: printConsole(temp, pen, bg);
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	ld	h, -6 (ix)
	ld	l, -5 (ix)
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
;src/funciones.c:191: if (ataque < b->energy) {
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	hl, #0x000a
	add	hl, bc
	ld	e, (hl)
	ld	a, -2 (ix)
	sub	a, e
	jr	NC,00104$
;src/funciones.c:192: b->energy = b->energy - ataque;
	ld	a, e
	sub	a, -2 (ix)
	ld	e, a
	ld	(hl), e
;src/funciones.c:193: sprintf(temp, "%-9s HP=>%02d",b->name, b->energy);
	ld	d, #0x00
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	de
	push	bc
	ld	bc, #___str_4
	push	bc
	push	hl
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	jr	00105$
00104$:
;src/funciones.c:195: b->energy = 0;
	ld	(hl), #0x00
;src/funciones.c:196: sprintf(temp, "%-9s DIED! ",b->name, b->energy);
	ld	e, (hl)
	ld	d, #0x00
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	de
	push	bc
	ld	bc, #___str_5
	push	bc
	push	hl
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;src/funciones.c:197: printStats(b);
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_printStats
	pop	af
;src/funciones.c:199: ataque = pen;
	ld	c, -5 (ix)
;src/funciones.c:200: pen = bg;
	ld	a, -6 (ix)
	ld	-5 (ix), a
;src/funciones.c:201: bg = ataque;
	ld	-6 (ix), c
00105$:
;src/funciones.c:204: printConsole(temp, pen, bg);
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	ld	h, -6 (ix)
	ld	l, -5 (ix)
	push	hl
	push	bc
	call	_printConsole
	ld	sp,ix
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
;src/funciones.c:207: void defender(TStats *a) {
;	---------------------------------
; Function defender
; ---------------------------------
_defender::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-27
	add	hl, sp
	ld	sp, hl
;src/funciones.c:210: pen = 0;
	ld	-27 (ix), #0x00
;src/funciones.c:211: bg = 2;
	ld	-26 (ix), #0x02
;src/funciones.c:212: if ((u16) a->sprite == (u16) G_mendo)  {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	ld	de, #0x0012
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
;src/funciones.c:213: pen = 2;
	ld	-27 (ix), #0x02
;src/funciones.c:214: bg = 0;
	ld	-26 (ix), #0x00
00102$:
;src/funciones.c:217: if (a->energy + a->defense < a->max_energy)
	ld	iy, #0x000a
	add	iy, bc
	ld	a, 0 (iy)
	ld	-2 (ix), a
	ld	e, a
	ld	d, #0x00
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x000e
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
	ld	de, #0x000b
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
;src/funciones.c:218: healed = a->defense;
	ld	e, -3 (ix)
	jr	00105$
00104$:
;src/funciones.c:220: healed = a->max_energy - a->energy;
	ld	a, e
	sub	a, -2 (ix)
	ld	e, a
00105$:
;src/funciones.c:222: a->energy = a->energy + healed;
	ld	a, -2 (ix)
	add	a, e
	ld	0 (iy), a
;src/funciones.c:224: if (healed) {
	ld	a, e
	or	a, a
	jr	Z,00108$
;src/funciones.c:225: sprintf(temp, "%-9s ^ %02dHP",a->name, healed);
	ld	d, #0x00
	ld	hl, #0x0002
	add	hl, sp
	push	hl
	pop	iy
	push	hl
	push	de
	push	bc
	ld	bc, #___str_6
	push	bc
	push	iy
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	hl
;src/funciones.c:226: printConsole(temp, pen, bg);
	ld	c, l
	ld	b, h
	ld	h, -26 (ix)
	ld	l, -27 (ix)
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
00108$:
	ld	sp, ix
	pop	ix
	ret
___str_6:
	.ascii "%-9s ^ %02dHP"
	.db 0x00
;src/funciones.c:230: void drawPotion(){
;	---------------------------------
; Function drawPotion
; ---------------------------------
_drawPotion::
;src/funciones.c:231: cpct_drawSpriteMasked (G_pocion, cpctm_screenPtr (CPCT_VMEM_START, 28, 144), 2,16);
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
