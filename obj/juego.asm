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
	.globl _cpct_getRandom_mxor_u8
	.globl _cpct_getScreenPtr
	.globl _cpct_drawStringM1
	.globl _cpct_setDrawCharM1
	.globl _cpct_drawSpriteMasked
	.globl _cpct_drawSprite
	.globl _cpct_drawSolidBox
	.globl _cpct_px2byteM1
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
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
;src/juego.c:11: u8 abs (i8 valor){
;	---------------------------------
; Function abs
; ---------------------------------
_abs::
;src/juego.c:12: return (valor > 0 ? valor : -valor);
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
;src/juego.c:15: void pausa() {
;	---------------------------------
; Function pausa
; ---------------------------------
_pausa::
;src/juego.c:18: for (i = 0; i < 32768 /*16384*/; i++)
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
;src/juego.c:22: void pausaTecladoLibre(){
;	---------------------------------
; Function pausaTecladoLibre
; ---------------------------------
_pausaTecladoLibre::
;src/juego.c:23: while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
00101$:
	call	_cpct_isAnyKeyPressed_f
	ld	a, l
	or	a, a
	ret	Z
;src/juego.c:24: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
	jr	00101$
;src/juego.c:28: void dibujarMarco (){
;	---------------------------------
; Function dibujarMarco
; ---------------------------------
_dibujarMarco::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/juego.c:33: tile = (u8*) &G_tile_cruzada[0];
	ld	-2 (ix), #<(_G_tile_cruzada)
	ld	-1 (ix), #>(_G_tile_cruzada)
;src/juego.c:34: if ((nivel/10) == 1)
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
;src/juego.c:35: tile = (u8*) &G_tile_cruzada[0];
	ld	-2 (ix), #<(_G_tile_cruzada)
	ld	-1 (ix), #>(_G_tile_cruzada)
;src/juego.c:39: for (i=0; i < 80; i += 4) {
00114$:
	ld	d, #0x00
00107$:
;src/juego.c:40: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,   0), 4, 16);
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
	push	hl
	pop	iy
	pop	bc
	push	bc
	push	bc
	push	de
	ld	hl, #0x1004
	push	hl
	push	iy
	push	bc
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
	push	bc
	call	_cpct_drawSprite
	pop	de
	push	de
	ld	a, #0x30
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
	push	bc
	call	_cpct_drawSprite
	pop	de
	pop	bc
;src/juego.c:39: for (i=0; i < 80; i += 4) {
	inc	d
	inc	d
	inc	d
	inc	d
	ld	a, d
	sub	a, #0x50
	jr	C,00107$
;src/juego.c:45: for (i=16; i < 176; i += 16 ){
	ld	d, #0x10
00109$:
;src/juego.c:46: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, 0, i), 4, 16);
	push	bc
	push	de
	push	de
	inc	sp
	xor	a, a
	push	af
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
	push	bc
	call	_cpct_drawSprite
	pop	de
	push	de
	ld	e, #0x4c
	push	de
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
	push	bc
	call	_cpct_drawSprite
	pop	de
	pop	bc
;src/juego.c:48: if (i>63)
	ld	a, #0x3f
	sub	a, d
	jr	NC,00110$
;src/juego.c:49: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,40, i), 4, 16);
	push	bc
	push	de
	ld	e, #0x28
	push	de
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
	push	bc
	call	_cpct_drawSprite
	pop	de
	pop	bc
00110$:
;src/juego.c:45: for (i=16; i < 176; i += 16 ){
	ld	a, d
	add	a, #0x10
	ld	d,a
	sub	a, #0xb0
	jr	C,00109$
	ld	sp, ix
	pop	ix
	ret
;src/juego.c:55: void dibujarEscenario(){
;	---------------------------------
; Function dibujarEscenario
; ---------------------------------
_dibujarEscenario::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/juego.c:60: tile = (u8*) &G_suelo_cruzada_1[0];
	ld	bc, #_G_suelo_cruzada_1+0
	inc	sp
	inc	sp
	push	bc
;src/juego.c:61: if (nivel < 6) {
	ld	a,(#_nivel + 0)
	sub	a, #0x06
	jr	NC,00109$
;src/juego.c:62: tile = (u8*) &G_suelo_cruzada_1[0];
	inc	sp
	inc	sp
	push	bc
;src/juego.c:65: for (i=4; i < 40; i+=4) {
00109$:
	ld	b, #0x04
00104$:
;src/juego.c:66: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,   160), 4, 16);
	push	bc
	ld	a, #0xa0
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	pop	iy
	push	iy
	push	bc
	ld	de, #0x1004
	push	de
	push	hl
	push	iy
	call	_cpct_drawSprite
	pop	bc
;src/juego.c:65: for (i=4; i < 40; i+=4) {
	inc	b
	inc	b
	inc	b
	inc	b
	ld	a, b
	sub	a, #0x28
	jr	C,00104$
	ld	sp, ix
	pop	ix
	ret
;src/juego.c:70: void initPlayer(){
;	---------------------------------
; Function initPlayer
; ---------------------------------
_initPlayer::
;src/juego.c:71: strcpy(entidad[0].name,"Don Mendo");
	ld	de, #_entidad
	ld	hl, #___str_0
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
;src/juego.c:72: entidad[0].max_energy = 99;
	ld	hl, #_entidad + 11
	ld	(hl), #0x63
;src/juego.c:73: entidad[0].energy = entidad[0].max_energy;
	ld	bc, #_entidad + 10
	ld	a, (hl)
	ld	(bc), a
;src/juego.c:74: entidad[0].attack = 30;
	ld	hl, #(_entidad + 0x000c)
	ld	(hl), #0x1e
;src/juego.c:75: entidad[0].force = 6;
	ld	hl, #(_entidad + 0x000d)
	ld	(hl), #0x06
;src/juego.c:76: entidad[0].defense = 15;
	ld	hl, #(_entidad + 0x000e)
	ld	(hl), #0x0f
;src/juego.c:77: entidad[0].pos_x = 8;
	ld	hl, #(_entidad + 0x000f)
	ld	(hl), #0x08
;src/juego.c:78: entidad[0].pos_y = 24;
	ld	hl, #(_entidad + 0x0010)
	ld	(hl), #0x18
;src/juego.c:79: entidad[0].sprite = (u8*) &G_mendo[0];
	ld	hl, #_G_mendo
	ld	((_entidad + 0x0011)), hl
	ret
___str_0:
	.ascii "Don Mendo"
	.db 0x00
;src/juego.c:82: void initNivel(){
;	---------------------------------
; Function initNivel
; ---------------------------------
_initNivel::
;src/juego.c:84: entidad[1].max_energy = 0;
	ld	bc, #_entidad + 30
	xor	a, a
	ld	(bc), a
;src/juego.c:85: entidad[2].max_energy = 0;
	ld	de, #_entidad + 49
	xor	a, a
	ld	(de), a
;src/juego.c:88: if (nivel == 1) {
	ld	iy, #_nivel
	ld	a, 0 (iy)
	dec	a
	jr	NZ,00102$
;src/juego.c:89: strcpy(entidad[1].name,"Soldier");
	push	bc
	push	de
	ld	de, #(_entidad + 0x0013)
	ld	hl, #___str_1
	xor	a, a
00111$:
	cp	a, (hl)
	ldi
	jr	NZ, 00111$
	pop	de
	pop	bc
;src/juego.c:90: entidad[1].max_energy = 90;
	ld	a, #0x5a
	ld	(bc), a
;src/juego.c:91: entidad[1].attack = 20;
	ld	hl, #(_entidad + 0x001f)
	ld	(hl), #0x14
;src/juego.c:92: entidad[1].force = 3;
	ld	hl, #(_entidad + 0x0020)
	ld	(hl), #0x03
;src/juego.c:93: entidad[1].defense = 10;
	ld	hl, #(_entidad + 0x0021)
	ld	(hl), #0x0a
;src/juego.c:94: entidad[1].pos_x = 28;
	ld	hl, #(_entidad + 0x0022)
	ld	(hl), #0x1c
;src/juego.c:95: entidad[1].pos_y = 32;
	ld	hl, #(_entidad + 0x0023)
	ld	(hl), #0x20
;src/juego.c:96: entidad[1].sprite = (u8*) &G_arabe_1[0];
	ld	hl, #_G_arabe_1
	ld	((_entidad + 0x0024)), hl
00102$:
;src/juego.c:99: entidad[1].energy = entidad[1].max_energy;
	ld	a, (bc)
	ld	(#(_entidad + 0x001d)),a
;src/juego.c:100: entidad[2].energy = entidad[2].max_energy;
	ld	bc, #_entidad + 48
	ld	a, (de)
	ld	(bc), a
	ret
___str_1:
	.ascii "Soldier"
	.db 0x00
;src/juego.c:103: void printStats(TStats *a) {
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
;src/juego.c:106: sprintf(temp, "                                    ");
	ld	de, #___str_2+0
	ld	hl, #0x0000
	add	hl, sp
	ld	-2 (ix), l
	ld	-1 (ix), h
	push	de
	push	hl
	call	_sprintf
	pop	af
	pop	af
;src/juego.c:107: if (a->energy)
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	e, 10 (iy)
	ld	a, e
	or	a, a
	jr	Z,00102$
;src/juego.c:108: sprintf(temp, "%-9s=> HP:%02d. ATT: %02d. DEF: %02d",a->name, a->energy,a->attack,a->defense);
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
	ld	hl, #___str_3
	push	hl
	push	iy
	call	_sprintf
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
	pop	bc
00102$:
;src/juego.c:110: cpct_drawStringM1(temp, cpct_getScreenPtr(CPCT_VMEM_START, 4, a->pos_y));
	push	bc
	pop	iy
	ld	b, 16 (iy)
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
___str_2:
	.ascii "                                    "
	.db 0x00
___str_3:
	.ascii "%-9s=> HP:%02d. ATT: %02d. DEF: %02d"
	.db 0x00
;src/juego.c:113: void printLevel() {
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
;src/juego.c:116: sprintf(temp, "LEVEL: %02d",nivel);
	ld	hl,#_nivel + 0
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #0x0000
	add	hl, sp
	push	hl
	push	de
	ld	de, #___str_4
	push	de
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	ld	hl, #0x0002
	push	hl
	call	_cpct_setDrawCharM1
	ld	hl, #0x1004
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
	push	hl
	push	bc
	call	_cpct_drawStringM1
	ld	sp, ix
	pop	ix
	ret
___str_4:
	.ascii "LEVEL: %02d"
	.db 0x00
;src/juego.c:121: void printConsole  (void* string, u8 pen, u8 bground) {
;	---------------------------------
; Function printConsole
; ---------------------------------
_printConsole::
;src/juego.c:122: if (cursorConsola > 175){
	ld	a, #0xaf
	ld	iy, #_cursorConsola
	sub	a, 0 (iy)
	jr	NC,00102$
;src/juego.c:124: pausa();
	call	_pausa
;src/juego.c:125: cpct_drawSolidBox (cpct_getScreenPtr (CPCT_VMEM_START, 44, 64), cpct_px2byteM1 (0, 0, 0, 0), 32, 112);
	ld	hl, #0x0000
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_px2byteM1
	pop	af
	pop	af
	ld	d, l
	push	de
	ld	hl, #0x402c
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
	pop	de
	ld	hl, #0x7020
	push	hl
	push	de
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/juego.c:126: cursorConsola = 64;
	ld	hl,#_cursorConsola + 0
	ld	(hl), #0x40
00102$:
;src/juego.c:129: cpct_setDrawCharM1(pen, bground);
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
;src/juego.c:130: cpct_drawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 44, cursorConsola));
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
;src/juego.c:131: cursorConsola +=8;
	ld	hl, #_cursorConsola
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
	ret
;src/juego.c:135: void atacar(TStats *a, TStats *b) {
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
;src/juego.c:139: pen = 0;
	ld	-25 (ix), #0x00
;src/juego.c:140: bg = 2;
	ld	-26 (ix), #0x02
;src/juego.c:141: if ((u16) a->sprite == (u16) G_mendo)  {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	ld	de, #0x0011
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
;src/juego.c:142: pen = 2;
	ld	-25 (ix), #0x02
;src/juego.c:143: bg = 0;
	ld	-26 (ix), #0x00
00102$:
;src/juego.c:147: ataque = a->attack + (2*(cpct_rand()%a->force)) - a->force;
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
;src/juego.c:148: sprintf(temp, "%-9s ATT %02d",a->name, ataque);
	ld	-2 (ix), a
	ld	e, a
	ld	d, #0x00
	ld	hl, #0x0002
	add	hl, sp
	ld	-4 (ix), l
	ld	-3 (ix), h
	push	de
	push	bc
	ld	bc, #___str_5
	push	bc
	push	hl
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;src/juego.c:149: printConsole(temp, pen, bg);
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	ld	h, -26 (ix)
	ld	l, -25 (ix)
	push	hl
	push	bc
	call	_printConsole
	pop	af
	pop	af
;src/juego.c:151: if (ataque < b->energy) {
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	hl, #0x000a
	add	hl, bc
	ld	e, (hl)
	ld	a, -2 (ix)
	sub	a, e
	jr	NC,00104$
;src/juego.c:152: b->energy = b->energy - ataque;
	ld	a, e
	sub	a, -2 (ix)
	ld	e, a
	ld	(hl), e
;src/juego.c:153: sprintf(temp, "%-9s HP=>%02d",b->name, b->energy);
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
	jr	00105$
00104$:
;src/juego.c:156: b->energy = 0;
	ld	(hl), #0x00
;src/juego.c:157: sprintf(temp, "%-9s DIED! ",b->name, b->energy);
	ld	e, (hl)
	ld	d, #0x00
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	de
	push	bc
	ld	bc, #___str_7
	push	bc
	push	hl
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;src/juego.c:158: printStats(b);
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_printStats
	pop	af
;src/juego.c:160: ataque = pen;
	ld	c, -25 (ix)
;src/juego.c:161: pen = bg;
	ld	a, -26 (ix)
	ld	-25 (ix), a
;src/juego.c:162: bg = ataque;
	ld	-26 (ix), c
00105$:
;src/juego.c:165: printConsole(temp, pen, bg);
	ld	c,-4 (ix)
	ld	b,-3 (ix)
	ld	h, -26 (ix)
	ld	l, -25 (ix)
	push	hl
	push	bc
	call	_printConsole
	ld	sp,ix
	pop	ix
	ret
___str_5:
	.ascii "%-9s ATT %02d"
	.db 0x00
___str_6:
	.ascii "%-9s HP=>%02d"
	.db 0x00
___str_7:
	.ascii "%-9s DIED! "
	.db 0x00
;src/juego.c:168: void defender(TStats *a) {
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
;src/juego.c:171: pen = 0;
	ld	-6 (ix), #0x00
;src/juego.c:172: bg = 2;
	ld	-7 (ix), #0x02
;src/juego.c:173: if ((u16) a->sprite == (u16) G_mendo)  {
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	ld	de, #0x0011
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
;src/juego.c:174: pen = 2;
	ld	-6 (ix), #0x02
;src/juego.c:175: bg = 0;
	ld	-7 (ix), #0x00
00102$:
;src/juego.c:178: healed = 0;
	ld	-8 (ix), #0x00
;src/juego.c:179: if (a->energy + a->defense < a->max_energy)
	ld	hl, #0x000a
	add	hl,bc
	ex	de,hl
	ld	a, (de)
	ld	-2 (ix), a
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	push	bc
	pop	iy
	ld	a, 14 (iy)
	ld	-5 (ix), a
	ld	l, a
	ld	h, #0x00
	ld	a, -4 (ix)
	add	a, l
	ld	-4 (ix), a
	ld	a, -3 (ix)
	adc	a, h
	ld	-3 (ix), a
	push	bc
	pop	iy
	ld	l, 11 (iy)
	ld	h, #0x00
	ld	a, -4 (ix)
	sub	a, l
	ld	a, -3 (ix)
	sbc	a, h
	jp	PO, 00117$
	xor	a, #0x80
00117$:
	jp	P, 00104$
;src/juego.c:180: healed = a->defense;
	ld	l, -5 (ix)
	ld	-8 (ix), l
00104$:
;src/juego.c:182: a->energy = a->energy + healed;
	ld	a, -2 (ix)
	add	a, -8 (ix)
	ld	(de), a
;src/juego.c:184: sprintf(temp, "%-9s %c %02dHP",a->name, 240,healed);
	ld	e, -8 (ix)
	ld	d, #0x00
	ld	hl, #0x0000
	add	hl, sp
	push	hl
	pop	iy
	push	hl
	push	de
	ld	de, #0x00f0
	push	de
	push	bc
	ld	bc, #___str_8
	push	bc
	push	iy
	call	_sprintf
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
	pop	hl
;src/juego.c:186: printConsole(temp, pen, bg);
	ld	c, l
	ld	b, h
	ld	h, -7 (ix)
	ld	l, -6 (ix)
	push	hl
	push	bc
	call	_printConsole
	ld	sp,ix
	pop	ix
	ret
___str_8:
	.ascii "%-9s %c %02dHP"
	.db 0x00
;src/juego.c:189: u8 turno() { //devuelve valor 0 cuando muere personaje o se termina nivel
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
;src/juego.c:192: printLevel();
	call	_printLevel
;src/juego.c:194: for (i = 0; i < 3; i++) {
	ld	bc, #_entidad+0
	ld	-15 (ix), #0x00
00169$:
;src/juego.c:195: if (entidad[i].energy){
	ld	e,-15 (ix)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl,bc
	ex	de,hl
	push	de
	pop	iy
	ld	a, 10 (iy)
	or	a, a
	jr	Z,00170$
;src/juego.c:196: printStats(&entidad[i]);
	ld	l, e
	ld	h, d
	push	bc
	push	de
	push	hl
	call	_printStats
	pop	af
	pop	de
	pop	bc
;src/juego.c:197: cpct_drawSpriteMasked (entidad[i].sprite, cpct_getScreenPtr (CPCT_VMEM_START, entidad[i].pos_x, 132), 4,28);
	push	de
	pop	iy
	ld	h, 15 (iy)
	push	bc
	push	de
	ld	a, #0x84
	push	af
	inc	sp
	push	hl
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
	push	hl
	pop	iy
	ex	de,hl
	ld	de, #0x0011
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	hl, #0x1c04
	push	hl
	push	iy
	push	de
	call	_cpct_drawSpriteMasked
	pop	bc
00170$:
;src/juego.c:194: for (i = 0; i < 3; i++) {
	inc	-15 (ix)
	ld	a, -15 (ix)
	sub	a, #0x03
	jr	C,00169$
;src/juego.c:205: i = 0;
	ld	-15 (ix), #0x00
;src/juego.c:206: do  {
	ld	hl, #0x0001
	add	hl, sp
	ex	de,hl
00116$:
;src/juego.c:207: cpct_scanKeyboard_f();
	push	bc
	push	de
	call	_cpct_scanKeyboard_f
	pop	de
	pop	bc
;src/juego.c:208: sprintf(temp, "ACTION (%c/%c/D)?",242,243);
	push	de
	pop	iy
	push	bc
	push	de
	ld	hl, #0x00f3
	push	hl
	ld	l, #0xf2
	push	hl
	ld	hl, #___str_9
	push	hl
	push	iy
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
;src/juego.c:209: if (i < 25) {
	ld	a, -15 (ix)
	sub	a, #0x19
	jr	NC,00105$
;src/juego.c:210: printConsole(temp, 2, 0);
	push	de
	pop	iy
	push	bc
	push	de
	ld	hl, #0x0002
	push	hl
	push	iy
	call	_printConsole
	pop	af
	pop	af
	pop	de
	pop	bc
	jr	00106$
00105$:
;src/juego.c:212: printConsole(temp, 0, 2);
	ld	l, e
	ld	h, d
	push	hl
	pop	iy
	push	bc
	push	de
	ld	hl, #0x0200
	push	hl
	push	iy
	call	_printConsole
	pop	af
	pop	af
	pop	de
	pop	bc
00106$:
;src/juego.c:214: i++;
	inc	-15 (ix)
;src/juego.c:215: cursorConsola -=8;
	ld	hl, #_cursorConsola
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
;src/juego.c:216: if (i == 50)
	ld	a, -15 (ix)
	sub	a, #0x32
	jr	NZ,00117$
;src/juego.c:217: i=0;
	ld	-15 (ix), #0x00
00117$:
;src/juego.c:219: while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_CursorLeft)  && !cpct_isKeyPressed(Joy0_Left) 
	push	bc
	push	de
	ld	hl, #0x0404
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00118$
	push	bc
	push	de
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00118$
	push	bc
	push	de
	ld	hl, #0x0409
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00118$
;src/juego.c:220: && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_CursorRight) && !cpct_isKeyPressed(Joy0_Right) 
	push	bc
	push	de
	ld	hl, #0x0803
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00118$
	push	bc
	push	de
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00118$
	push	bc
	push	de
	ld	hl, #0x0809
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00118$
;src/juego.c:221: && !cpct_isKeyPressed(Key_D) && !cpct_isKeyPressed(Joy0_Fire1));
	push	bc
	push	de
	ld	hl, #0x2007
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00118$
	push	bc
	push	de
	ld	hl, #0x1009
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jp	Z, 00116$
00118$:
;src/juego.c:224: nueva_pos = 0;
	ld	-14 (ix), #0x00
;src/juego.c:227: for (i = 0; i < 3; i++) {
	ld	-15 (ix), #0x00
00171$:
;src/juego.c:228: if (entidad[i].energy){
	push	de
	ld	e,-15 (ix)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	pop	de
	add	hl,bc
	ld	-2 (ix), l
	ld	-1 (ix), h
	push	bc
	ld	bc, #0x000a
	add	hl, bc
	pop	bc
	ld	a, (hl)
	or	a, a
	jr	Z,00172$
;src/juego.c:229: cpct_drawSolidBox (cpct_getScreenPtr (CPCT_VMEM_START, entidad[i].pos_x, 132), cpct_px2byteM1 (0, 0, 0, 0), 4, 28);
	push	bc
	push	de
	ld	hl, #0x0000
	push	hl
	ld	l, #0x00
	push	hl
	call	_cpct_px2byteM1
	pop	af
	pop	af
	ld	-3 (ix), l
	pop	de
	pop	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	bc
	ld	bc, #0x000f
	add	hl, bc
	pop	bc
	ld	h, (hl)
	push	bc
	push	de
	ld	a, #0x84
	push	af
	inc	sp
	push	hl
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
	ld	hl, #0x1c04
	push	hl
	ld	a, -3 (ix)
	push	af
	inc	sp
	push	iy
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
00172$:
;src/juego.c:227: for (i = 0; i < 3; i++) {
	inc	-15 (ix)
	ld	a, -15 (ix)
	sub	a, #0x03
	jr	C,00171$
;src/juego.c:234: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
	push	bc
	push	de
	ld	hl, #0x0404
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
;src/juego.c:238: nueva_pos = entidad[0].pos_x - 4;
;src/juego.c:234: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
	ld	a, l
	or	a, a
	jr	NZ,00122$
	push	bc
	push	de
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00122$
	push	bc
	push	de
	ld	hl, #0x0409
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00123$
00122$:
;src/juego.c:235: sprintf(temp, "%-9s GOES %c",entidad[0].name,242);
	push	de
	pop	iy
	push	bc
	push	de
	ld	hl, #0x00f2
	push	hl
	ld	hl, #_entidad
	push	hl
	ld	hl, #___str_10
	push	hl
	push	iy
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
;src/juego.c:236: printConsole(temp, 2, 0);
	push	de
	pop	iy
	push	bc
	push	de
	ld	hl, #0x0002
	push	hl
	push	iy
	call	_printConsole
	pop	af
	pop	af
	pop	de
	pop	bc
;src/juego.c:238: nueva_pos = entidad[0].pos_x - 4;
	ld	a, (#(_entidad + 0x000f) + 0)
	add	a, #0xfc
	ld	-14 (ix), a
00123$:
;src/juego.c:242: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
	push	bc
	push	de
	ld	hl, #0x0803
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
;src/juego.c:248: if (nueva_pos == entidad[1].pos_x)
;src/juego.c:251: if (nueva_pos == entidad[2].pos_x)
;src/juego.c:242: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
	ld	a, l
	or	a, a
	jr	NZ,00130$
	push	bc
	push	de
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00130$
	push	bc
	push	de
	ld	hl, #0x0809
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00131$
00130$:
;src/juego.c:243: sprintf(temp, "%-9s GOES %c",entidad[0].name,243);
	push	de
	pop	iy
	push	bc
	push	de
	ld	hl, #0x00f3
	push	hl
	ld	hl, #_entidad
	push	hl
	ld	hl, #___str_10
	push	hl
	push	iy
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
;src/juego.c:244: printConsole(temp, 2 ,0);
	push	de
	pop	iy
	push	bc
	push	de
	ld	hl, #0x0002
	push	hl
	push	iy
	call	_printConsole
	pop	af
	pop	af
	pop	de
	pop	bc
;src/juego.c:246: nueva_pos = entidad[0].pos_x + 4;
	ld	a, (#(_entidad + 0x000f) + 0)
	add	a, #0x04
	ld	-14 (ix), a
;src/juego.c:248: if (nueva_pos == entidad[1].pos_x)
	ld	a,(#(_entidad + 0x0022) + 0)
	ld	-3 (ix), a
	ld	a, -14 (ix)
	sub	a, -3 (ix)
	jr	NZ,00127$
;src/juego.c:249: atacar(&entidad[0], &entidad[1]);
	push	bc
	push	de
	ld	hl, #(_entidad + 0x0013)
	push	hl
	ld	hl, #_entidad
	push	hl
	call	_atacar
	pop	af
	pop	af
	pop	de
	pop	bc
00127$:
;src/juego.c:251: if (nueva_pos == entidad[2].pos_x)
	ld	a,(#(_entidad + 0x0035) + 0)
	ld	-3 (ix), a
	ld	a, -14 (ix)
	sub	a, -3 (ix)
	jr	NZ,00131$
;src/juego.c:252: atacar(&entidad[0], &entidad[2]);
	push	bc
	push	de
	ld	hl, #(_entidad + 0x0026)
	push	hl
	ld	hl, #_entidad
	push	hl
	call	_atacar
	pop	af
	pop	af
	pop	de
	pop	bc
00131$:
;src/juego.c:257: if (cpct_isKeyPressed(Key_D) || cpct_isKeyPressed(Joy0_Fire1)) {
	push	bc
	push	de
	ld	hl, #0x2007
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jr	NZ,00134$
	push	bc
	push	de
	ld	hl, #0x1009
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00135$
00134$:
;src/juego.c:258: defender(&entidad[0]);
	ld	l, c
	ld	h, b
	push	bc
	push	de
	push	hl
	call	_defender
	pop	af
	pop	de
	pop	bc
00135$:
;src/juego.c:264: && (!entidad[1].energy || nueva_pos != entidad[1].pos_x)
;src/juego.c:265: && (!entidad[2].energy || nueva_pos != entidad[2].pos_x)
;src/juego.c:263: && nueva_pos < 37 
	ld	a, #0x03
	sub	a, -14 (ix)
	jr	NC,00215$
;src/juego.c:264: && (!entidad[1].energy || nueva_pos != entidad[1].pos_x)
	ld	a, -14 (ix)
	sub	a, #0x25
	jr	NC,00215$
	ld	a, (#(_entidad + 0x001d) + 0)
	or	a, a
	jr	Z,00143$
	ld	a,(#(_entidad + 0x0022) + 0)
	ld	-3 (ix), a
	ld	a, -14 (ix)
	sub	a, -3 (ix)
	jr	Z,00215$
00143$:
;src/juego.c:265: && (!entidad[2].energy || nueva_pos != entidad[2].pos_x)
	ld	a, (#(_entidad + 0x0030) + 0)
	or	a, a
	jr	Z,00137$
	ld	a,(#(_entidad + 0x0035) + 0)
	ld	-3 (ix), a
	ld	a, -14 (ix)
	sub	a, -3 (ix)
	jr	Z,00215$
00137$:
;src/juego.c:267: entidad[0].pos_x = nueva_pos;
	ld	hl, #(_entidad + 0x000f)
	ld	a, -14 (ix)
	ld	(hl), a
;src/juego.c:272: for (i = 1; i < 3; i++) {
00215$:
	ld	-2 (ix), e
	ld	-1 (ix), d
	ld	-5 (ix), e
	ld	-4 (ix), d
	ld	-7 (ix), e
	ld	-6 (ix), d
	ld	-9 (ix), e
	ld	-8 (ix), d
	ld	-15 (ix), #0x01
00175$:
;src/juego.c:273: if (entidad[i].energy) {
	ld	e,-15 (ix)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl,bc
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	de, #0x000a
	add	hl, de
	ld	a, (hl)
	or	a, a
	jp	Z, 00176$
;src/juego.c:274: if (abs(entidad[i].pos_x - entidad[0].pos_x) == 4) //Si está en casilla contigua, atacar
	ld	a, -11 (ix)
	add	a, #0x0f
	ld	-13 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-12 (ix), a
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	e, (hl)
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
	jr	NZ,00151$
;src/juego.c:275: atacar(&entidad[i], &entidad[0]);
	ld	de, #_entidad
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	bc
	push	de
	push	hl
	call	_atacar
	pop	af
	pop	af
	pop	bc
	jp	00212$
00151$:
;src/juego.c:277: enemy_mov = cpct_rand()%3; //33% de moverse a izquierda, derecha o curarse
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
;src/juego.c:278: if (enemy_mov == 1) {
	ld	a, e
	dec	a
	jr	NZ,00148$
;src/juego.c:279: sprintf(temp, "%-9s GOES %c",entidad[i].name,242);
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	push	de
	pop	iy
	ld	e,-7 (ix)
	ld	d,-6 (ix)
	push	bc
	ld	hl, #0x00f2
	push	hl
	push	iy
	ld	hl, #___str_10
	push	hl
	push	de
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/juego.c:280: printConsole(temp, 2, 0);
	ld	e,-9 (ix)
	ld	d,-8 (ix)
	push	bc
	ld	hl, #0x0002
	push	hl
	push	de
	call	_printConsole
	pop	af
	pop	af
	pop	bc
;src/juego.c:282: nueva_pos = entidad[i].pos_x - 4;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a, (hl)
	add	a, #0xfc
	ld	-14 (ix), a
	jr	00212$
00148$:
;src/juego.c:283: } else if (enemy_mov == 2) {
	ld	a, e
	sub	a, #0x02
	jr	NZ,00145$
;src/juego.c:284: sprintf(temp, "%-9s GOES %c",entidad[i].name,243);
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	push	de
	pop	iy
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	push	bc
	ld	hl, #0x00f3
	push	hl
	push	iy
	ld	hl, #___str_10
	push	hl
	push	de
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/juego.c:285: printConsole(temp, 2, 0);
	ld	e,-5 (ix)
	ld	d,-4 (ix)
	push	bc
	ld	hl, #0x0002
	push	hl
	push	de
	call	_printConsole
	pop	af
	pop	af
	pop	bc
;src/juego.c:287: nueva_pos = entidad[i].pos_x + 4;
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a, (hl)
	add	a, #0x04
	ld	-14 (ix), a
	jr	00212$
00145$:
;src/juego.c:289: defender(&entidad[i]);
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	push	bc
	push	de
	call	_defender
	pop	af
	pop	bc
;src/juego.c:293: for (j = 0; j < 3; j++) {
00212$:
	ld	-52 (ix), #0x00
00173$:
;src/juego.c:294: if (i!=j) {
	ld	a, -15 (ix)
	sub	a, -52 (ix)
	jr	Z,00174$
;src/juego.c:295: if (entidad[j].pos_x == nueva_pos) {
	ld	e,-52 (ix)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	de, #0x000f
	add	hl, de
	ld	a,-14 (ix)
	sub	a,(hl)
	jr	NZ,00174$
;src/juego.c:296: nueva_pos = 0;
	ld	-14 (ix), #0x00
;src/juego.c:297: break;
	jr	00157$
00174$:
;src/juego.c:293: for (j = 0; j < 3; j++) {
	inc	-52 (ix)
	ld	a, -52 (ix)
	sub	a, #0x03
	jr	C,00173$
00157$:
;src/juego.c:303: if (nueva_pos > 3 && nueva_pos < 37)
	ld	a, #0x03
	sub	a, -14 (ix)
	jr	NC,00176$
	ld	a, -14 (ix)
	sub	a, #0x25
	jr	NC,00176$
;src/juego.c:304: entidad[i].pos_x = nueva_pos; 
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	ld	a, -14 (ix)
	ld	(hl), a
00176$:
;src/juego.c:272: for (i = 1; i < 3; i++) {
	inc	-15 (ix)
	ld	a, -15 (ix)
	sub	a, #0x03
	jp	C, 00175$
;src/juego.c:308: pausa();
	push	bc
	call	_pausa
	call	_pausaTecladoLibre
	pop	bc
;src/juego.c:311: if (entidad[0].energy)
	ld	a, (#_entidad + 10)
	or	a, a
	jr	Z,00165$
;src/juego.c:312: return 1;
	ld	l, #0x01
	jr	00177$
00165$:
;src/juego.c:314: if (!entidad[1].energy && !entidad[2].energy){
	ld	a, (#(_entidad + 0x001d) + 0)
	or	a, a
	jr	NZ,00167$
	ld	a, (#(_entidad + 0x0030) + 0)
	or	a, a
	jr	NZ,00167$
;src/juego.c:315: nivel++;
	ld	hl, #_nivel+0
	inc	(hl)
;src/juego.c:316: return 1;
	ld	l, #0x01
	jr	00177$
00167$:
;src/juego.c:320: return 0;
	ld	l, #0x00
00177$:
	ld	sp, ix
	pop	ix
	ret
___str_9:
	.ascii "ACTION (%c/%c/D)?"
	.db 0x00
___str_10:
	.ascii "%-9s GOES %c"
	.db 0x00
;src/juego.c:323: void juego() {
;	---------------------------------
; Function juego
; ---------------------------------
_juego::
;src/juego.c:324: initPlayer();
	call	_initPlayer
;src/juego.c:326: while(entidad[0].energy) {
00107$:
	ld	a, (#(_entidad + 0x000a) + 0)
	or	a, a
	ret	Z
;src/juego.c:327: cpct_clearScreen(0x00);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/juego.c:328: cursorConsola = 64;
	ld	hl,#_cursorConsola + 0
	ld	(hl), #0x40
;src/juego.c:330: dibujarMarco();
	call	_dibujarMarco
;src/juego.c:331: dibujarEscenario();
	call	_dibujarEscenario
;src/juego.c:333: initNivel();
	call	_initNivel
;src/juego.c:334: while (turno())
00101$:
	call	_turno
	ld	a, l
	or	a, a
	jr	NZ,00101$
;src/juego.c:339: do {
00104$:
;src/juego.c:340: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/juego.c:342: while (!cpct_isAnyKeyPressed_f());
	call	_cpct_isAnyKeyPressed_f
	ld	a, l
	or	a, a
	jr	Z,00104$
	jr	00107$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
