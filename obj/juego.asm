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
	.globl _defender
	.globl _atacar
	.globl _printConsole
	.globl _printLevel
	.globl _printStats
	.globl _initNivel
	.globl _initPlayer
	.globl _dibujarEscenario
	.globl _dibujarMarco
	.globl _pausaTecladoLibre
	.globl _pausa
	.globl _abs
	.globl _sprintf
	.globl _cpct_etm_setTileset2x4
	.globl _cpct_etm_drawTileBox2x4
	.globl _cpct_getRandom_mxor_u8
	.globl _cpct_getScreenPtr
	.globl _cpct_waitVSYNC
	.globl _cpct_drawStringM1
	.globl _cpct_setDrawCharM1
	.globl _cpct_drawSpriteMasked
	.globl _cpct_drawSprite
	.globl _cpct_drawSolidBox
	.globl _cpct_px2byteM1
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_memcpy
	.globl _cpct_memset
	.globl _cursorConsola
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_cursorConsola::
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
;src/juego.c:22: u8 abs (i8 valor){
;	---------------------------------
; Function abs
; ---------------------------------
_abs::
;src/juego.c:23: return (valor > 0 ? valor : -valor);
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
;src/juego.c:26: void pausa() {
;	---------------------------------
; Function pausa
; ---------------------------------
_pausa::
;src/juego.c:29: for (i = 0; i < 32768 /*16384*/; i++)
	ld	bc, #0x8000
00104$:
	ld	e, c
	ld	d, b
	dec	de
	ld	c, e
	ld	a,d
	ld	b,a
	or	a,e
	jr	NZ,00104$
	ret
;src/juego.c:33: void pausaTecladoLibre(){
;	---------------------------------
; Function pausaTecladoLibre
; ---------------------------------
_pausaTecladoLibre::
;src/juego.c:34: while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
00101$:
	call	_cpct_isAnyKeyPressed_f
	ld	a, l
	or	a, a
	ret	Z
;src/juego.c:35: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
	jr	00101$
;src/juego.c:39: void dibujarMarco (){
;	---------------------------------
; Function dibujarMarco
; ---------------------------------
_dibujarMarco::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/juego.c:44: tile = (u8*) &G_tile_cruzada[0];
	ld	-4 (ix), #<(_G_tile_cruzada)
	ld	-3 (ix), #>(_G_tile_cruzada)
;src/juego.c:45: if ((nivel/10) == 1)
	ld	a, #0x0a
	push	af
	inc	sp
	ld	a, (_nivel)
	push	af
	inc	sp
	call	__divuchar
	pop	af
	dec	l
	jr	NZ,00114$
;src/juego.c:46: tile = (u8*) &G_tile_cruzada[0];
	ld	-4 (ix), #<(_G_tile_cruzada)
	ld	-3 (ix), #>(_G_tile_cruzada)
;src/juego.c:50: for (i=0; i < 80; i += 4) {
00114$:
	ld	b, #0x00
00107$:
;src/juego.c:51: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,   0), 4, 16);
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
	push	bc
	ld	de, #0x1004
	push	de
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_cpct_drawSprite
	pop	bc
;src/juego.c:52: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i, 176), 4, 16);
	push	bc
	ld	a, #0xb0
	push	af
	inc	sp
	push	bc
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
;src/juego.c:53: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,  48), 4, 16);
	push	bc
	ld	a, #0x30
	push	af
	inc	sp
	push	bc
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
;src/juego.c:50: for (i=0; i < 80; i += 4) {
	inc	b
	inc	b
	inc	b
	inc	b
	ld	a, b
	sub	a, #0x50
	jr	C,00107$
;src/juego.c:56: for (i=16; i < 176; i += 16 ){
	ld	b, #0x10
00109$:
;src/juego.c:57: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, 0, i), 4, 16);
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
;src/juego.c:58: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,76, i), 4, 16);	
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
;src/juego.c:59: if (i>63)
	ld	a, #0x3f
	sub	a, b
	jr	NC,00110$
;src/juego.c:60: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,40, i), 4, 16);
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
00110$:
;src/juego.c:56: for (i=16; i < 176; i += 16 ){
	ld	a, b
	add	a, #0x10
	ld	b,a
	sub	a, #0xb0
	jr	C,00109$
;src/juego.c:65: cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
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
	ld	sp,ix
	pop	ix
	ret
;src/juego.c:68: void dibujarEscenario(){
;	---------------------------------
; Function dibujarEscenario
; ---------------------------------
_dibujarEscenario::
;src/juego.c:71: cpct_etm_setTileset2x4(tileset1);
	ld	hl, #_tileset1
	call	_cpct_etm_setTileset2x4
;src/juego.c:72: if (nivel > 10)
	ld	a, #0x0a
	ld	iy, #_nivel
	sub	a, 0 (iy)
	jr	NC,00102$
;src/juego.c:73: cpct_etm_setTileset2x4(tileset1);
	ld	hl, #_tileset1
	call	_cpct_etm_setTileset2x4
00102$:
;src/juego.c:75: mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
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
;src/juego.c:77: cpct_etm_drawTilemap2x4 ( g_mapa01_W, g_mapa01_H , INICIO_AREA_JUEGO, mapa);
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
;src/juego.c:80: void initPlayer(){
;	---------------------------------
; Function initPlayer
; ---------------------------------
_initPlayer::
;src/juego.c:81: strcpy(entidad[0].name,"Don Mendo");
	ld	de, #_entidad
	ld	hl, #___str_0
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
;src/juego.c:82: entidad[0].max_energy = 99;
	ld	hl, #_entidad + 11
	ld	(hl), #0x63
;src/juego.c:83: entidad[0].energy = entidad[0].max_energy;
	ld	bc, #_entidad + 10
	ld	a, (hl)
	ld	(bc), a
;src/juego.c:84: entidad[0].attack = 30;
	ld	hl, #(_entidad + 0x000c)
	ld	(hl), #0x1e
;src/juego.c:85: entidad[0].force = 6;
	ld	hl, #(_entidad + 0x000d)
	ld	(hl), #0x06
;src/juego.c:86: entidad[0].defense = 15;
	ld	hl, #(_entidad + 0x000e)
	ld	(hl), #0x0f
;src/juego.c:87: entidad[0].pos_x = 8;
	ld	hl, #(_entidad + 0x000f)
	ld	(hl), #0x08
;src/juego.c:88: entidad[0].pos_x_ant = 8;
	ld	hl, #(_entidad + 0x0010)
	ld	(hl), #0x08
;src/juego.c:89: entidad[0].pos_y = 24;
	ld	hl, #(_entidad + 0x0011)
	ld	(hl), #0x18
;src/juego.c:90: entidad[0].sprite = (u8*) &G_mendo[0];
	ld	hl, #_G_mendo
	ld	((_entidad + 0x0012)), hl
	ret
___str_0:
	.ascii "Don Mendo"
	.db 0x00
;src/juego.c:93: void initNivel(){
;	---------------------------------
; Function initNivel
; ---------------------------------
_initNivel::
;src/juego.c:95: entidad[1].max_energy = 0;
	ld	hl, #(_entidad + 0x001f)
	ld	(hl), #0x00
;src/juego.c:96: entidad[1].pos_x_ant = 4;
	ld	hl, #(_entidad + 0x0024)
	ld	(hl), #0x04
;src/juego.c:97: entidad[2].max_energy = 0;
	ld	hl, #(_entidad + 0x0033)
	ld	(hl), #0x00
;src/juego.c:98: entidad[2].pos_x_ant = 4;
	ld	hl, #(_entidad + 0x0038)
	ld	(hl), #0x04
;src/juego.c:102: if (nivel == 1) {
	ld	a,(#_nivel + 0)
	dec	a
	jr	NZ,00102$
;src/juego.c:103: cpct_memcpy (&entidad[1],&SoldadoArabe,sizeof(TStats));
	ld	hl, #0x0014
	push	hl
	ld	hl, #_SoldadoArabe
	push	hl
	ld	hl, #(_entidad + 0x0014)
	push	hl
	call	_cpct_memcpy
00102$:
;src/juego.c:105: if (nivel == 2) {
	ld	a,(#_nivel + 0)
	sub	a, #0x02
	jr	NZ,00104$
;src/juego.c:106: cpct_memcpy (&entidad[1],&SoldadoArabe,sizeof(TStats));
	ld	hl, #0x0014
	push	hl
	ld	hl, #_SoldadoArabe
	push	hl
	ld	hl, #(_entidad + 0x0014)
	push	hl
	call	_cpct_memcpy
;src/juego.c:107: cpct_memcpy (&entidad[2],&SoldadoArabe,sizeof(TStats));
	ld	hl, #0x0014
	push	hl
	ld	hl, #_SoldadoArabe
	push	hl
	ld	hl, #(_entidad + 0x0028)
	push	hl
	call	_cpct_memcpy
;src/juego.c:108: entidad[2].pos_x = 36;
	ld	hl, #(_entidad + 0x0037)
	ld	(hl), #0x24
00104$:
;src/juego.c:111: entidad[1].pos_y = 32;
	ld	hl, #(_entidad + 0x0025)
	ld	(hl), #0x20
;src/juego.c:112: entidad[2].pos_y = 40;
	ld	hl, #(_entidad + 0x0039)
	ld	(hl), #0x28
;src/juego.c:113: entidad[1].energy = entidad[1].max_energy;
	ld	bc, #_entidad + 30
	ld	a, (#(_entidad + 0x001f) + 0)
	ld	(bc), a
;src/juego.c:114: entidad[2].energy = entidad[2].max_energy;
	ld	bc, #_entidad + 50
	ld	a, (#(_entidad + 0x0033) + 0)
	ld	(bc), a
	ret
;src/juego.c:117: void printStats(TStats *a) {
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
;src/juego.c:120: cpct_setDrawCharM1(2, 0);
	ld	hl, #0x0002
	push	hl
	call	_cpct_setDrawCharM1
;src/juego.c:121: sprintf(temp, "                                    ");
	ld	de, #___str_1+0
	ld	hl, #0x0000
	add	hl, sp
	ld	-2 (ix), l
	ld	-1 (ix), h
	push	de
	push	hl
	call	_sprintf
	pop	af
	pop	af
;src/juego.c:122: if (a->energy)
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	e, 10 (iy)
	ld	a, e
	or	a, a
	jr	Z,00102$
;src/juego.c:123: sprintf(temp, "%-9s=> HP:%02d. ATT: %02d. DEF: %02d",a->name, a->energy,a->attack,a->defense);
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
	ld	hl, #___str_2
	push	hl
	push	iy
	call	_sprintf
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
	pop	bc
00102$:
;src/juego.c:125: cpct_drawStringM1(temp, cpct_getScreenPtr(CPCT_VMEM_START, 4, a->pos_y));
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
	call	_cpct_drawStringM1
	ld	sp, ix
	pop	ix
	ret
___str_1:
	.ascii "                                    "
	.db 0x00
___str_2:
	.ascii "%-9s=> HP:%02d. ATT: %02d. DEF: %02d"
	.db 0x00
;src/juego.c:128: void printLevel() {
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
;src/juego.c:131: sprintf(temp, "LEVEL: %02d",nivel);
	ld	hl,#_nivel + 0
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #0x0000
	add	hl, sp
	ld	c, l
	ld	b, h
	push	hl
	push	de
	ld	de, #___str_3
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
;src/juego.c:133: cpct_drawStringM1(temp, cpctm_screenPtr(CPCT_VMEM_START, 4, 16));
	ld	bc, #0xc0a4
	push	bc
	push	hl
	call	_cpct_drawStringM1
	ld	sp, ix
	pop	ix
	ret
___str_3:
	.ascii "LEVEL: %02d"
	.db 0x00
;src/juego.c:136: void printConsole  (void* string, u8 pen, u8 bground) {
;	---------------------------------
; Function printConsole
; ---------------------------------
_printConsole::
;src/juego.c:137: if (cursorConsola > 175){
	ld	a, #0xaf
	ld	iy, #_cursorConsola
	sub	a, 0 (iy)
	jr	NC,00102$
;src/juego.c:139: pausa();
	call	_pausa
;src/juego.c:140: cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
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
	pop	af
	pop	af
	inc	sp
;src/juego.c:141: cursorConsola = 64;
	ld	hl,#_cursorConsola + 0
	ld	(hl), #0x40
00102$:
;src/juego.c:144: cpct_setDrawCharM1(pen, bground);
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
;src/juego.c:145: cpct_drawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 44, cursorConsola));
	ld	a, (_cursorConsola)
	ld	d,a
	ld	e,#0x2c
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
	push	bc
	push	de
	push	hl
	push	bc
	call	_cpct_drawStringM1
;src/juego.c:146: cursorConsola +=8;
	ld	hl, #_cursorConsola
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
	ret
;src/juego.c:149: void atacar(TStats *a, TStats *b) {
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
;src/juego.c:153: pen = 0;
	ld	-5 (ix), #0x00
;src/juego.c:154: bg = 2;
	ld	-6 (ix), #0x02
;src/juego.c:155: if ((u16) a->sprite == (u16) G_mendo)  {
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
;src/juego.c:156: pen = 2;
	ld	-5 (ix), #0x02
;src/juego.c:157: bg = 0;
	ld	-6 (ix), #0x00
00102$:
;src/juego.c:161: ataque = a->attack + (2*(cpct_rand()%a->force)) - a->force;
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
;src/juego.c:162: sprintf(temp, "%-9s ATT %02d",a->name, ataque);
	ld	-2 (ix), a
	ld	e, a
	ld	d, #0x00
	ld	hl, #0x0000
	add	hl, sp
	ld	-4 (ix), l
	ld	-3 (ix), h
	push	de
	push	bc
	ld	bc, #___str_4
	push	bc
	push	hl
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;src/juego.c:163: printConsole(temp, pen, bg);
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	ld	h, -6 (ix)
	ld	l, -5 (ix)
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
;src/juego.c:165: if (ataque < b->energy) {
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	hl, #0x000a
	add	hl, bc
	ld	e, (hl)
	ld	a, -2 (ix)
	sub	a, e
	jr	NC,00104$
;src/juego.c:166: b->energy = b->energy - ataque;
	ld	a, e
	sub	a, -2 (ix)
	ld	e, a
	ld	(hl), e
;src/juego.c:167: sprintf(temp, "%-9s HP=>%02d",b->name, b->energy);
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
	jr	00105$
00104$:
;src/juego.c:169: b->energy = 0;
	ld	(hl), #0x00
;src/juego.c:170: sprintf(temp, "%-9s DIED! ",b->name, b->energy);
	ld	e, (hl)
	ld	d, #0x00
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	de
	push	bc
	ld	bc, #___str_6
	push	bc
	push	hl
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;src/juego.c:171: printStats(b);
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_printStats
	pop	af
;src/juego.c:173: ataque = pen;
	ld	c, -5 (ix)
;src/juego.c:174: pen = bg;
	ld	a, -6 (ix)
	ld	-5 (ix), a
;src/juego.c:175: bg = ataque;
	ld	-6 (ix), c
00105$:
;src/juego.c:178: printConsole(temp, pen, bg);
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
___str_4:
	.ascii "%-9s ATT %02d"
	.db 0x00
___str_5:
	.ascii "%-9s HP=>%02d"
	.db 0x00
___str_6:
	.ascii "%-9s DIED! "
	.db 0x00
;src/juego.c:181: void defender(TStats *a) {
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
;src/juego.c:184: pen = 0;
	ld	-27 (ix), #0x00
;src/juego.c:185: bg = 2;
	ld	-26 (ix), #0x02
;src/juego.c:186: if ((u16) a->sprite == (u16) G_mendo)  {
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
;src/juego.c:187: pen = 2;
	ld	-27 (ix), #0x02
;src/juego.c:188: bg = 0;
	ld	-26 (ix), #0x00
00102$:
;src/juego.c:191: if (a->energy + a->defense < a->max_energy)
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
;src/juego.c:192: healed = a->defense;
	ld	e, -3 (ix)
	jr	00105$
00104$:
;src/juego.c:194: healed = a->max_energy - a->energy;
	ld	a, e
	sub	a, -2 (ix)
	ld	e, a
00105$:
;src/juego.c:196: a->energy = a->energy + healed;
	ld	a, -2 (ix)
	add	a, e
	ld	0 (iy), a
;src/juego.c:198: if (healed) {
	ld	a, e
	or	a, a
	jr	Z,00108$
;src/juego.c:199: sprintf(temp, "%-9s %c %02dHP",a->name, 240,healed);
	ld	d, #0x00
	ld	hl, #0x0002
	add	hl, sp
	push	hl
	pop	iy
	push	hl
	push	de
	ld	de, #0x00f0
	push	de
	push	bc
	ld	bc, #___str_7
	push	bc
	push	iy
	call	_sprintf
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
	pop	hl
;src/juego.c:200: printConsole(temp, pen, bg);
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
___str_7:
	.ascii "%-9s %c %02dHP"
	.db 0x00
;src/juego.c:204: u8 turno() { //devuelve valor 0 cuando muere personaje o se termina nivel
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
;src/juego.c:209: for (i = 0; i < 3; i++) {
	ld	-52 (ix), #0x00
00171$:
;src/juego.c:210: mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
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
	ld	-51 (ix), a
	ld	a, -1 (ix)
	ld	-50 (ix), a
;src/juego.c:211: cpct_etm_drawTileBox2x4 ((entidad[i].pos_x_ant - 4)/2, 17, 2, 7, g_mapa01_W, INICIO_AREA_JUEGO, mapa );
	ld	a, -51 (ix)
	ld	-2 (ix), a
	ld	a, -50 (ix)
	ld	-1 (ix), a
	ld	-4 (ix), #0x84
	ld	-3 (ix), #0xc2
	ld	c,-52 (ix)
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
	jr	Z,00181$
	ld	a, -6 (ix)
	add	a, #0xfd
	ld	-8 (ix), a
	ld	a, -5 (ix)
	adc	a, #0xff
	ld	-7 (ix), a
00181$:
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
;src/juego.c:209: for (i = 0; i < 3; i++) {
	inc	-52 (ix)
	ld	a, -52 (ix)
	sub	a, #0x03
	jp	C, 00171$
;src/juego.c:214: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/juego.c:216: for (i = 0; i < 3; i++) {
	ld	-52 (ix), #0x00
00173$:
;src/juego.c:217: if (entidad[i].energy) {
	ld	c,-52 (ix)
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
	jp	Z, 00174$
;src/juego.c:218: printStats(&entidad[i]);
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_printStats
	pop	af
;src/juego.c:219: cpct_drawSpriteMasked (entidad[i].sprite, cpct_getScreenPtr (CPCT_VMEM_START, entidad[i].pos_x, 132), 4,28);
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
;src/juego.c:220: entidad[i].pos_x_ant = entidad[i].pos_x;
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
00174$:
;src/juego.c:216: for (i = 0; i < 3; i++) {
	inc	-52 (ix)
	ld	a, -52 (ix)
	sub	a, #0x03
	jp	C, 00173$
;src/juego.c:228: i = 0;
	ld	-52 (ix), #0x00
;src/juego.c:229: do  {
	ld	hl, #0x0004
	add	hl, sp
	ld	-8 (ix), l
	ld	-7 (ix), h
00117$:
;src/juego.c:230: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/juego.c:231: sprintf(temp, "ACTION (%c/%c/D) ?",242,243);
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
	ld	hl, #0x00f3
	push	hl
	ld	l, #0xf2
	push	hl
	ld	hl, #___str_8
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;src/juego.c:232: if (i < 25) {
	ld	a, -52 (ix)
	sub	a, #0x19
	jr	NC,00106$
;src/juego.c:233: printConsole(temp, 2, 0);
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
	jr	00107$
00106$:
;src/juego.c:235: printConsole(temp, 0, 2);
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
00107$:
;src/juego.c:237: i++;
	inc	-52 (ix)
;src/juego.c:238: cursorConsola -=8;
	ld	hl, #_cursorConsola
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
;src/juego.c:239: if (i == 50)
	ld	a, -52 (ix)
	sub	a, #0x32
	jr	NZ,00118$
;src/juego.c:240: i=0;
	ld	-52 (ix), #0x00
00118$:
;src/juego.c:242: while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_CursorLeft)  && !cpct_isKeyPressed(Joy0_Left) 
	ld	hl, #0x0404
	call	_cpct_isKeyPressed
	ld	-6 (ix), l
	ld	a, l
	or	a, a
	jr	NZ,00119$
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	-6 (ix), l
	ld	a, l
	or	a, a
	jr	NZ,00119$
	ld	hl, #0x0409
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00119$
;src/juego.c:243: && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_CursorRight) && !cpct_isKeyPressed(Joy0_Right) 
	ld	hl, #0x0803
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00119$
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00119$
	ld	hl, #0x0809
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00119$
;src/juego.c:244: && !cpct_isKeyPressed(Key_D) && !cpct_isKeyPressed(Joy0_Fire1));
	ld	hl, #0x2007
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00119$
	ld	hl, #0x1009
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jp	Z, 00117$
00119$:
;src/juego.c:246: nueva_pos = 0;
	ld	-49 (ix), #0x00
;src/juego.c:249: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
	ld	hl, #0x0404
	call	_cpct_isKeyPressed
;src/juego.c:253: nueva_pos = entidad[0].pos_x - 4;
;src/juego.c:249: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
	ld	a, l
	or	a, a
	jr	NZ,00120$
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00120$
	ld	hl, #0x0409
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00121$
00120$:
;src/juego.c:250: sprintf(temp, "%-9s GOES %c",entidad[0].name,242);
	ld	de, #___str_9+0
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x00f2
	push	hl
	ld	hl, #_entidad
	push	hl
	push	de
	push	bc
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;src/juego.c:251: printConsole(temp, 2, 0);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x0002
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
;src/juego.c:253: nueva_pos = entidad[0].pos_x - 4;
	ld	a, (#(_entidad + 0x000f) + 0)
	add	a, #0xfc
	ld	-49 (ix), a
00121$:
;src/juego.c:257: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
	ld	hl, #0x0803
	call	_cpct_isKeyPressed
;src/juego.c:263: if (nueva_pos == entidad[1].pos_x)
;src/juego.c:266: if (nueva_pos == entidad[2].pos_x)
;src/juego.c:257: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
	ld	a, l
	or	a, a
	jr	NZ,00128$
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00128$
	ld	hl, #0x0809
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00129$
00128$:
;src/juego.c:258: sprintf(temp, "%-9s GOES %c",entidad[0].name,243);
	ld	de, #___str_9+0
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x00f3
	push	hl
	ld	hl, #_entidad
	push	hl
	push	de
	push	bc
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;src/juego.c:259: printConsole(temp, 2 ,0);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x0002
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
;src/juego.c:261: nueva_pos = entidad[0].pos_x + 4;
	ld	a, (#(_entidad + 0x000f) + 0)
	add	a, #0x04
	ld	-49 (ix), a
;src/juego.c:263: if (nueva_pos == entidad[1].pos_x)
	ld	hl, #(_entidad + 0x0023) + 0
	ld	a,-49 (ix)
	sub	a,(hl)
	jr	NZ,00125$
;src/juego.c:264: atacar(&entidad[0], &entidad[1]);
	ld	hl, #(_entidad + 0x0014)
	push	hl
	ld	hl, #_entidad
	push	hl
	call	_atacar
	pop	af
	pop	af
00125$:
;src/juego.c:266: if (nueva_pos == entidad[2].pos_x)
	ld	hl, #(_entidad + 0x0037) + 0
	ld	a,-49 (ix)
	sub	a,(hl)
	jr	NZ,00129$
;src/juego.c:267: atacar(&entidad[0], &entidad[2]);
	ld	hl, #(_entidad + 0x0028)
	push	hl
	ld	hl, #_entidad
	push	hl
	call	_atacar
	pop	af
	pop	af
00129$:
;src/juego.c:272: if (cpct_isKeyPressed(Key_D) || cpct_isKeyPressed(Joy0_Fire1)) {
	ld	hl, #0x2007
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00132$
	ld	hl, #0x1009
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00133$
00132$:
;src/juego.c:273: defender(&entidad[0]);
	ld	hl, #_entidad
	push	hl
	call	_defender
	pop	af
00133$:
;src/juego.c:280: && (!entidad[1].energy || nueva_pos != entidad[1].pos_x)
;src/juego.c:281: && (!entidad[2].energy || nueva_pos != entidad[2].pos_x)
;src/juego.c:279: && nueva_pos < 37 
	ld	a, #0x03
	sub	a, -49 (ix)
	jr	NC,00218$
;src/juego.c:280: && (!entidad[1].energy || nueva_pos != entidad[1].pos_x)
	ld	a, -49 (ix)
	sub	a, #0x25
	jr	NC,00218$
	ld	a, (#(_entidad + 0x001e) + 0)
	or	a, a
	jr	Z,00141$
	ld	hl, #(_entidad + 0x0023) + 0
	ld	a,-49 (ix)
	sub	a,(hl)
	jr	Z,00218$
00141$:
;src/juego.c:281: && (!entidad[2].energy || nueva_pos != entidad[2].pos_x)
	ld	a, (#(_entidad + 0x0032) + 0)
	or	a, a
	jr	Z,00135$
	ld	hl, #(_entidad + 0x0037) + 0
	ld	a,-49 (ix)
	sub	a,(hl)
	jr	Z,00218$
00135$:
;src/juego.c:283: entidad[0].pos_x = nueva_pos;
	ld	hl, #(_entidad + 0x000f)
	ld	a, -49 (ix)
	ld	(hl), a
;src/juego.c:287: for (i = 1; i < 3; i++) {
00218$:
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
	ld	-52 (ix), #0x01
00177$:
;src/juego.c:288: if (entidad[i].energy) {
	ld	c,-52 (ix)
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
	jp	Z, 00178$
;src/juego.c:289: if (abs(entidad[i].pos_x - entidad[0].pos_x) == 4) //Si está en casilla contigua, atacar
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
	jr	NZ,00149$
;src/juego.c:290: atacar(&entidad[i], &entidad[0]);
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
	jp	00215$
00149$:
;src/juego.c:292: enemy_mov = cpct_rand()%3; //33% de moverse a izquierda, derecha o curarse
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
;src/juego.c:293: if (enemy_mov == 1) {
	ld	a, e
	dec	a
	jr	NZ,00146$
;src/juego.c:294: sprintf(temp, "%-9s GOES %c",entidad[i].name,242);
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	push	de
	pop	iy
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	push	bc
	ld	hl, #0x00f2
	push	hl
	push	iy
	ld	hl, #___str_9
	push	hl
	push	de
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/juego.c:295: printConsole(temp, 0, 2);
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
;src/juego.c:297: nueva_pos = entidad[i].pos_x - 4;
	ld	a, (bc)
	add	a, #0xfc
	ld	-49 (ix), a
	jr	00215$
00146$:
;src/juego.c:298: } else if (enemy_mov == 2) {
	ld	a, e
	sub	a, #0x02
	jr	NZ,00143$
;src/juego.c:299: sprintf(temp, "%-9s GOES %c",entidad[i].name,243);
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	push	de
	pop	iy
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	push	bc
	ld	hl, #0x00f3
	push	hl
	push	iy
	ld	hl, #___str_9
	push	hl
	push	de
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/juego.c:300: printConsole(temp, 0, 2);
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
;src/juego.c:302: nueva_pos = entidad[i].pos_x + 4;
	ld	a, (bc)
	add	a, #0x04
	ld	-49 (ix), a
	jr	00215$
00143$:
;src/juego.c:304: defender(&entidad[i]);
	ld	e,-12 (ix)
	ld	d,-11 (ix)
	push	bc
	push	de
	call	_defender
	pop	af
	pop	bc
;src/juego.c:308: for (j = 0; j < 3; j++) {
00215$:
	ld	e, #0x00
00175$:
;src/juego.c:309: if (i!=j) {
	ld	a, -52 (ix)
	sub	a, e
	jr	Z,00176$
;src/juego.c:310: if (entidad[j].pos_x == nueva_pos) {
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
	ld	a, -49 (ix)
	sub	a, d
	jr	NZ,00176$
;src/juego.c:311: nueva_pos = 0;
	ld	-49 (ix), #0x00
;src/juego.c:312: break;
	jr	00155$
00176$:
;src/juego.c:308: for (j = 0; j < 3; j++) {
	inc	e
	ld	a, e
	sub	a, #0x03
	jr	C,00175$
00155$:
;src/juego.c:318: if (nueva_pos > 3 && nueva_pos < 37)
	ld	a, #0x03
	sub	a, -49 (ix)
	jr	NC,00178$
	ld	a, -49 (ix)
	sub	a, #0x25
	jr	NC,00178$
;src/juego.c:319: entidad[i].pos_x = nueva_pos; 
	ld	a, -49 (ix)
	ld	(bc), a
00178$:
;src/juego.c:287: for (i = 1; i < 3; i++) {
	inc	-52 (ix)
	ld	a, -52 (ix)
	sub	a, #0x03
	jp	C, 00177$
;src/juego.c:323: pausa();
	call	_pausa
;src/juego.c:324: pausaTecladoLibre();
	call	_pausaTecladoLibre
;src/juego.c:328: if (!(entidad[1].energy || entidad[2].energy)) {
	ld	a,(#(_entidad + 0x001e) + 0)
;src/juego.c:331: entidad[0].energy = 0;
;src/juego.c:328: if (!(entidad[1].energy || entidad[2].energy)) {
	ld	-12 (ix), a
	or	a, a
	jr	NZ,00166$
	ld	a, (#(_entidad + 0x0032) + 0)
	or	a, a
	jr	NZ,00166$
;src/juego.c:329: if (nivel == 10) {// Fin del Juego
	ld	a,(#_nivel + 0)
	sub	a, #0x0a
	jr	NZ,00163$
;src/juego.c:330: sprintf(temp, "CONGRATULATIONS!");
	ld	a, -8 (ix)
	ld	-12 (ix), a
	ld	a, -7 (ix)
	ld	-11 (ix), a
	ld	hl, #___str_10
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_sprintf
	pop	af
	pop	af
;src/juego.c:331: entidad[0].energy = 0;
	ld	hl, #(_entidad + 0x000a)
	ld	(hl), #0x00
	jr	00164$
00163$:
;src/juego.c:333: nivel++;
	ld	hl, #_nivel+0
	inc	(hl)
;src/juego.c:334: entidad[0].pos_x = 8;
	ld	hl, #(_entidad + 0x000f)
	ld	(hl), #0x08
;src/juego.c:335: sprintf(temp, "   NEXT LEVEL   ");
	ld	a, -8 (ix)
	ld	-12 (ix), a
	ld	a, -7 (ix)
	ld	-11 (ix), a
	ld	hl, #___str_11
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_sprintf
	pop	af
	pop	af
00164$:
;src/juego.c:337: printConsole(temp, 0, 2);
	ld	c,-8 (ix)
	ld	b,-7 (ix)
	ld	hl, #0x0200
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
;src/juego.c:338: return 0;
	ld	l, #0x00
	jr	00179$
00166$:
;src/juego.c:342: if (!entidad[0].energy) {
	ld	a, (#(_entidad + 0x000a) + 0)
	or	a, a
	jr	NZ,00169$
;src/juego.c:343: sprintf(temp, "    GAME OVER   ");
	ld	a, -8 (ix)
	ld	-12 (ix), a
	ld	a, -7 (ix)
	ld	-11 (ix), a
	ld	hl, #___str_12
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_sprintf
	pop	af
	pop	af
;src/juego.c:344: printConsole(temp, 0, 2);
	ld	a, -8 (ix)
	ld	-12 (ix), a
	ld	a, -7 (ix)
	ld	-11 (ix), a
	ld	hl, #0x0200
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_printConsole
	pop	af
	pop	af
;src/juego.c:345: return 0;
	ld	l, #0x00
	jr	00179$
00169$:
;src/juego.c:348: return 1;
	ld	l, #0x01
00179$:
	ld	sp, ix
	pop	ix
	ret
___str_8:
	.ascii "ACTION (%c/%c/D) ?"
	.db 0x00
___str_9:
	.ascii "%-9s GOES %c"
	.db 0x00
___str_10:
	.ascii "CONGRATULATIONS!"
	.db 0x00
___str_11:
	.ascii "   NEXT LEVEL   "
	.db 0x00
___str_12:
	.ascii "    GAME OVER   "
	.db 0x00
;src/juego.c:351: void juego() {
;	---------------------------------
; Function juego
; ---------------------------------
_juego::
;src/juego.c:352: initPlayer();
	call	_initPlayer
;src/juego.c:354: while(entidad[0].energy) {
00107$:
	ld	a, (#(_entidad + 0x000a) + 0)
	or	a, a
	ret	Z
;src/juego.c:355: cpct_clearScreen(0x00);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/juego.c:356: cursorConsola = 64;
	ld	hl,#_cursorConsola + 0
	ld	(hl), #0x40
;src/juego.c:358: dibujarMarco();
	call	_dibujarMarco
;src/juego.c:359: dibujarEscenario();
	call	_dibujarEscenario
;src/juego.c:361: initNivel();
	call	_initNivel
;src/juego.c:362: printLevel();
	call	_printLevel
;src/juego.c:363: while (turno())
00101$:
	call	_turno
	ld	a, l
	or	a, a
	jr	NZ,00101$
;src/juego.c:366: do {
00104$:
;src/juego.c:367: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/juego.c:368: } while (!cpct_isAnyKeyPressed_f());
	call	_cpct_isAnyKeyPressed_f
	ld	a, l
	or	a, a
	jr	Z,00104$
	jr	00107$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
