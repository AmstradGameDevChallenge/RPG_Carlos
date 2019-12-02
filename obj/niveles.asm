;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (CYGWIN)
;--------------------------------------------------------
	.module niveles
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _initNivel
	.globl _initPlayer
	.globl _initMago
	.globl _initCarcelero
	.globl _initCaballero
	.globl _initSoldado2
	.globl _initSoldado1
	.globl _initGoblin
	.globl _initSpider
	.globl _initGusano
	.globl _initEsqueleto
	.globl _initMurcielago
	.globl _initAbeja
	.globl _initFakir
	.globl _initSoldadoArabe3
	.globl _initSoldadoArabe2
	.globl _initSoldadoArabe1
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
;src/niveles.c:7: void initSoldadoArabe1(TStats *entidad) {
;	---------------------------------
; Function initSoldadoArabe1
; ---------------------------------
_initSoldadoArabe1::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles.c:8: strcpy(entidad->name,"Soldier 1");
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #___str_0
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:9: entidad->max_energy = 60;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x3c
;src/niveles.c:10: entidad->attack = 10;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:11: entidad->force = 5;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x05
;src/niveles.c:12: entidad->defense = 10;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:13: entidad->sprite = (u8*) &G_arabe_1[0];
	ld	hl, #0x0013
	add	hl, bc
	ld	bc, #_G_arabe_1+0
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	ix
	ret
___str_0:
	.ascii "Soldier 1"
	.db 0x00
;src/niveles.c:16: void initSoldadoArabe2(TStats *entidad) {
;	---------------------------------
; Function initSoldadoArabe2
; ---------------------------------
_initSoldadoArabe2::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles.c:17: strcpy(entidad->name,"Soldier 2");
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #___str_1
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:18: entidad->max_energy = 60;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x3c
;src/niveles.c:19: entidad->attack = 15;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x0f
;src/niveles.c:20: entidad->force = 10;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:21: entidad->defense = 5;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x05
;src/niveles.c:22: entidad->sprite = (u8*) &G_arabe_2[0];
	ld	hl, #0x0013
	add	hl, bc
	ld	bc, #_G_arabe_2+0
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	ix
	ret
___str_1:
	.ascii "Soldier 2"
	.db 0x00
;src/niveles.c:25: void initSoldadoArabe3(TStats *entidad) {
;	---------------------------------
; Function initSoldadoArabe3
; ---------------------------------
_initSoldadoArabe3::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles.c:26: strcpy(entidad->name,"Soldier 3");
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #___str_2
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:27: entidad->max_energy = 40;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x28
;src/niveles.c:28: entidad->attack = 3;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x03
;src/niveles.c:29: entidad->force = 2;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x02
;src/niveles.c:30: entidad->defense = 0;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x00
;src/niveles.c:31: entidad->sprite = (u8*) &G_arabe_3[0];
	ld	hl, #0x0013
	add	hl, bc
	ld	bc, #_G_arabe_3+0
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	ix
	ret
___str_2:
	.ascii "Soldier 3"
	.db 0x00
;src/niveles.c:34: void initFakir(TStats *entidad) {
;	---------------------------------
; Function initFakir
; ---------------------------------
_initFakir::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles.c:35: strcpy(entidad->name,"Fakir");
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #___str_3
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:36: entidad->max_energy = 30;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x1e
;src/niveles.c:37: entidad->attack = 30;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x1e
;src/niveles.c:38: entidad->force = 5;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x05
;src/niveles.c:39: entidad->defense = 0;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x00
;src/niveles.c:40: entidad->sprite = (u8*) &G_fakir[0];
	ld	hl, #0x0013
	add	hl, bc
	ld	bc, #_G_fakir+0
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	ix
	ret
___str_3:
	.ascii "Fakir"
	.db 0x00
;src/niveles.c:43: void initAbeja(TStats *entidad) {
;	---------------------------------
; Function initAbeja
; ---------------------------------
_initAbeja::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles.c:44: strcpy(entidad->name,"Bee");
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #___str_4
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:45: entidad->max_energy = 50;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x32
;src/niveles.c:46: entidad->attack = 10;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:47: entidad->force = 5;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x05
;src/niveles.c:48: entidad->defense = 20;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x14
;src/niveles.c:49: entidad->sprite = (u8*) &G_abeja[0];
	ld	hl, #0x0013
	add	hl, bc
	ld	bc, #_G_abeja+0
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	ix
	ret
___str_4:
	.ascii "Bee"
	.db 0x00
;src/niveles.c:52: void initMurcielago(TStats *entidad) {
;	---------------------------------
; Function initMurcielago
; ---------------------------------
_initMurcielago::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles.c:53: strcpy(entidad->name,"Evil Bat");
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #___str_5
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:54: entidad->max_energy = 60;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x3c
;src/niveles.c:55: entidad->attack = 15;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x0f
;src/niveles.c:56: entidad->force = 5;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x05
;src/niveles.c:57: entidad->defense = 20;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x14
;src/niveles.c:58: entidad->sprite = (u8*) &G_murcielago[0];
	ld	hl, #0x0013
	add	hl, bc
	ld	bc, #_G_murcielago+0
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	ix
	ret
___str_5:
	.ascii "Evil Bat"
	.db 0x00
;src/niveles.c:61: void initEsqueleto(TStats *entidad) {
;	---------------------------------
; Function initEsqueleto
; ---------------------------------
_initEsqueleto::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles.c:62: strcpy(entidad->name,"Skeleton");
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #___str_6
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:63: entidad->max_energy = 70;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x46
;src/niveles.c:64: entidad->attack = 10;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:65: entidad->force = 7;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x07
;src/niveles.c:66: entidad->defense = 5;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x05
;src/niveles.c:67: entidad->sprite = (u8*) &G_esqueleto[0];
	ld	hl, #0x0013
	add	hl, bc
	ld	bc, #_G_esqueleto+0
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	ix
	ret
___str_6:
	.ascii "Skeleton"
	.db 0x00
;src/niveles.c:70: void initGusano(TStats *entidad) {
;	---------------------------------
; Function initGusano
; ---------------------------------
_initGusano::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles.c:71: strcpy(entidad->name,"Worm");
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #___str_7
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:72: entidad->max_energy = 40;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x28
;src/niveles.c:73: entidad->attack = 30;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x1e
;src/niveles.c:74: entidad->force = 5;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x05
;src/niveles.c:75: entidad->defense = 0;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x00
;src/niveles.c:76: entidad->sprite = (u8*) &G_gusano[0];
	ld	hl, #0x0013
	add	hl, bc
	ld	bc, #_G_gusano+0
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	ix
	ret
___str_7:
	.ascii "Worm"
	.db 0x00
;src/niveles.c:79: void initSpider(TStats *entidad) {
;	---------------------------------
; Function initSpider
; ---------------------------------
_initSpider::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles.c:80: strcpy(entidad->name,"Spider");
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #___str_8
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:81: entidad->max_energy = 70;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x46
;src/niveles.c:82: entidad->attack = 15;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x0f
;src/niveles.c:83: entidad->force = 10;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:84: entidad->defense = 10;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:85: entidad->sprite = (u8*) &G_spider[0];
	ld	hl, #0x0013
	add	hl, bc
	ld	bc, #_G_spider+0
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	ix
	ret
___str_8:
	.ascii "Spider"
	.db 0x00
;src/niveles.c:88: void initGoblin(TStats *entidad) {
;	---------------------------------
; Function initGoblin
; ---------------------------------
_initGoblin::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles.c:89: strcpy(entidad->name,"Goblin");
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #___str_9
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:90: entidad->max_energy = 45;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x2d
;src/niveles.c:91: entidad->attack = 20;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x14
;src/niveles.c:92: entidad->force = 10;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:93: entidad->defense = 5;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x05
;src/niveles.c:94: entidad->sprite = (u8*) &G_goblin[0];
	ld	hl, #0x0013
	add	hl, bc
	ld	bc, #_G_goblin+0
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	ix
	ret
___str_9:
	.ascii "Goblin"
	.db 0x00
;src/niveles.c:97: void initSoldado1(TStats *entidad) {
;	---------------------------------
; Function initSoldado1
; ---------------------------------
_initSoldado1::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles.c:98: strcpy(entidad->name,"Soldier 1");
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #___str_10
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:99: entidad->max_energy = 60;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x3c
;src/niveles.c:100: entidad->attack = 12;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x0c
;src/niveles.c:101: entidad->force = 5;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x05
;src/niveles.c:102: entidad->defense = 10;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:103: entidad->sprite = (u8*) &G_soldado_1[0];
	ld	hl, #0x0013
	add	hl, bc
	ld	bc, #_G_soldado_1+0
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	ix
	ret
___str_10:
	.ascii "Soldier 1"
	.db 0x00
;src/niveles.c:106: void initSoldado2(TStats *entidad) {
;	---------------------------------
; Function initSoldado2
; ---------------------------------
_initSoldado2::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles.c:107: strcpy(entidad->name,"Soldier 2");
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #___str_11
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:108: entidad->max_energy = 50;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x32
;src/niveles.c:109: entidad->attack = 25;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x19
;src/niveles.c:110: entidad->force = 10;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:111: entidad->defense = 0;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x00
;src/niveles.c:112: entidad->sprite = (u8*) &G_soldado_2[0];
	ld	hl, #0x0013
	add	hl, bc
	ld	bc, #_G_soldado_2+0
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	ix
	ret
___str_11:
	.ascii "Soldier 2"
	.db 0x00
;src/niveles.c:115: void initCaballero(TStats *entidad) {
;	---------------------------------
; Function initCaballero
; ---------------------------------
_initCaballero::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles.c:116: strcpy(entidad->name,"Knight");
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #___str_12
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:117: entidad->max_energy = 75;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x4b
;src/niveles.c:118: entidad->attack = 15;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x0f
;src/niveles.c:119: entidad->force = 10;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:120: entidad->defense = 15;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x0f
;src/niveles.c:121: entidad->sprite = (u8*) &G_caballero[0];
	ld	hl, #0x0013
	add	hl, bc
	ld	bc, #_G_caballero+0
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	ix
	ret
___str_12:
	.ascii "Knight"
	.db 0x00
;src/niveles.c:124: void initCarcelero(TStats *entidad) {
;	---------------------------------
; Function initCarcelero
; ---------------------------------
_initCarcelero::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles.c:125: strcpy(entidad->name,"Guard");
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #___str_13
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:126: entidad->max_energy = 60;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x3c
;src/niveles.c:127: entidad->attack = 20;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x14
;src/niveles.c:128: entidad->force = 10;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:129: entidad->defense = 10;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:130: entidad->sprite = (u8*) &G_carcelero[0];
	ld	hl, #0x0013
	add	hl, bc
	ld	bc, #_G_carcelero+0
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	ix
	ret
___str_13:
	.ascii "Guard"
	.db 0x00
;src/niveles.c:133: void initMago(TStats *entidad) {
;	---------------------------------
; Function initMago
; ---------------------------------
_initMago::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles.c:134: strcpy(entidad->name,"Magician");
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	ld	hl, #___str_14
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:135: entidad->max_energy = 60;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x3c
;src/niveles.c:136: entidad->attack = 14;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x0e
;src/niveles.c:137: entidad->force = 2;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x02
;src/niveles.c:138: entidad->defense = 0;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x00
;src/niveles.c:139: entidad->sprite = (u8*) &G_mago[0];
	ld	hl, #0x0013
	add	hl, bc
	ld	bc, #_G_mago+0
	ld	(hl), c
	inc	hl
	ld	(hl), b
	pop	ix
	ret
___str_14:
	.ascii "Magician"
	.db 0x00
;src/niveles.c:142: void initPlayer(){
;	---------------------------------
; Function initPlayer
; ---------------------------------
_initPlayer::
;src/niveles.c:143: entidad[0].id =0;
	ld	hl, #_entidad
	ld	(hl), #0x00
;src/niveles.c:144: strcpy(entidad[0].name,"Don Mendo");
	ld	de, #(_entidad + 0x0001)
	ld	hl, #___str_15
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
;src/niveles.c:145: entidad[0].max_energy = entidad[0].energy = 60;
	ld	hl, #(_entidad + 0x000b)
	ld	(hl), #0x3c
	ld	hl, #(_entidad + 0x000c)
	ld	(hl), #0x3c
;src/niveles.c:146: entidad[0].attack = 20;
	ld	hl, #(_entidad + 0x000d)
	ld	(hl), #0x14
;src/niveles.c:147: entidad[0].force = 5;
	ld	hl, #(_entidad + 0x000e)
	ld	(hl), #0x05
;src/niveles.c:148: entidad[0].defense = 15;
	ld	hl, #(_entidad + 0x000f)
	ld	(hl), #0x0f
;src/niveles.c:149: entidad[0].pos_x = 8;
	ld	hl, #(_entidad + 0x0010)
	ld	(hl), #0x08
;src/niveles.c:150: entidad[0].pos_x_ant = 8;
	ld	hl, #(_entidad + 0x0011)
	ld	(hl), #0x08
;src/niveles.c:151: entidad[0].pos_y = 24;
	ld	hl, #(_entidad + 0x0012)
	ld	(hl), #0x18
;src/niveles.c:152: entidad[0].sprite = (u8*) &G_mendo[0];
	ld	hl, #_G_mendo
	ld	((_entidad + 0x0013)), hl
	ret
___str_15:
	.ascii "Don Mendo"
	.db 0x00
;src/niveles.c:155: void initNivel(){
;	---------------------------------
; Function initNivel
; ---------------------------------
_initNivel::
;src/niveles.c:157: entidad[1].id = 1;
	ld	hl, #(_entidad + 0x0015)
	ld	(hl), #0x01
;src/niveles.c:158: entidad[1].max_energy = 0;
	ld	hl, #(_entidad + 0x0021)
	ld	(hl), #0x00
;src/niveles.c:159: entidad[1].pos_x_ant = 4;
	ld	hl, #(_entidad + 0x0026)
	ld	(hl), #0x04
;src/niveles.c:160: entidad[2].id = 2;
	ld	hl, #(_entidad + 0x002a)
	ld	(hl), #0x02
;src/niveles.c:161: entidad[2].max_energy = 0;
	ld	hl, #(_entidad + 0x0036)
	ld	(hl), #0x00
;src/niveles.c:162: entidad[2].pos_x_ant = 4;
	ld	hl, #(_entidad + 0x003b)
	ld	(hl), #0x04
;src/niveles.c:165: if (nivel == 1) {
	ld	a,(#_nivel + 0)
	dec	a
	jr	NZ,00102$
;src/niveles.c:166: initSoldadoArabe1(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initSoldadoArabe1
	pop	af
00102$:
;src/niveles.c:168: if (nivel == 2) {
	ld	a,(#_nivel + 0)
	sub	a, #0x02
	jr	NZ,00104$
;src/niveles.c:169: initSoldadoArabe1(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	push	hl
	call	_initSoldadoArabe1
	pop	af
00104$:
;src/niveles.c:171: if (nivel == 3){
	ld	a,(#_nivel + 0)
	sub	a, #0x03
	jr	NZ,00106$
;src/niveles.c:172: initAbeja(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initAbeja
;src/niveles.c:173: initSoldadoArabe1(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initSoldadoArabe1
	pop	af
00106$:
;src/niveles.c:175: if (nivel == 4){
	ld	a,(#_nivel + 0)
	sub	a, #0x04
	jr	NZ,00108$
;src/niveles.c:176: initSoldadoArabe2(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initSoldadoArabe2
	pop	af
00108$:
;src/niveles.c:178: if (nivel == 6){
	ld	a,(#_nivel + 0)
	sub	a, #0x06
	jr	NZ,00110$
;src/niveles.c:179: initAbeja(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initAbeja
;src/niveles.c:180: initFakir(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initFakir
	pop	af
00110$:
;src/niveles.c:182: if (nivel == 7){
	ld	a,(#_nivel + 0)
	sub	a, #0x07
	jr	NZ,00112$
;src/niveles.c:183: initSoldadoArabe2(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initSoldadoArabe2
;src/niveles.c:184: initSoldadoArabe3(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initSoldadoArabe3
	pop	af
00112$:
;src/niveles.c:186: if (nivel == 8){
	ld	a,(#_nivel + 0)
	sub	a, #0x08
	jr	NZ,00114$
;src/niveles.c:187: initFakir(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initFakir
;src/niveles.c:188: initSoldadoArabe2(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initSoldadoArabe2
	pop	af
00114$:
;src/niveles.c:190: if (nivel == 9){
	ld	a,(#_nivel + 0)
	sub	a, #0x09
	jr	NZ,00116$
;src/niveles.c:191: initSoldadoArabe3(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initSoldadoArabe3
;src/niveles.c:192: initSoldadoArabe3(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initSoldadoArabe3
	pop	af
00116$:
;src/niveles.c:195: strcpy(entidad[2].name,"Boss Lvl1");
;src/niveles.c:197: entidad[2].attack = 20;
;src/niveles.c:198: entidad[2].force = 10;
;src/niveles.c:199: entidad[2].defense = 10;
;src/niveles.c:200: entidad[2].sprite = (u8*) &G_arabe_boss[0];
;src/niveles.c:195: strcpy(entidad[2].name,"Boss Lvl1");
;src/niveles.c:194: if (nivel == 10){
	ld	iy, #_nivel
	ld	a, 0 (iy)
	sub	a, #0x0a
	jr	NZ,00118$
;src/niveles.c:195: strcpy(entidad[2].name,"Boss Lvl1");
	ld	de, #(_entidad + 0x002b)
	ld	hl, #___str_16
	xor	a, a
00301$:
	cp	a, (hl)
	ldi
	jr	NZ, 00301$
;src/niveles.c:196: entidad[2].max_energy = 99;
	ld	hl, #(_entidad + 0x0036)
	ld	(hl), #0x63
;src/niveles.c:197: entidad[2].attack = 20;
	ld	hl, #(_entidad + 0x0037)
	ld	(hl), #0x14
;src/niveles.c:198: entidad[2].force = 10;
	ld	hl, #(_entidad + 0x0038)
	ld	(hl), #0x0a
;src/niveles.c:199: entidad[2].defense = 10;
	ld	hl, #(_entidad + 0x0039)
	ld	(hl), #0x0a
;src/niveles.c:200: entidad[2].sprite = (u8*) &G_arabe_boss[0];
	ld	hl, #_G_arabe_boss
	ld	((_entidad + 0x003d)), hl
00118$:
;src/niveles.c:203: if (nivel == 11) {
	ld	a,(#_nivel + 0)
	sub	a, #0x0b
	jr	NZ,00120$
;src/niveles.c:204: initMurcielago(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initMurcielago
	pop	af
00120$:
;src/niveles.c:206: if (nivel == 12) {
	ld	a,(#_nivel + 0)
	sub	a, #0x0c
	jr	NZ,00122$
;src/niveles.c:207: initEsqueleto(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	push	hl
	call	_initEsqueleto
	pop	af
00122$:
;src/niveles.c:209: if (nivel == 13){
	ld	a,(#_nivel + 0)
	sub	a, #0x0d
	jr	NZ,00124$
;src/niveles.c:210: initMurcielago(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initMurcielago
;src/niveles.c:211: initEsqueleto(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initEsqueleto
	pop	af
00124$:
;src/niveles.c:213: if (nivel == 14){
	ld	a,(#_nivel + 0)
	sub	a, #0x0e
	jr	NZ,00126$
;src/niveles.c:214: initMurcielago(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initMurcielago
;src/niveles.c:215: initGusano(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initGusano
	pop	af
00126$:
;src/niveles.c:217: if (nivel == 16){
	ld	a,(#_nivel + 0)
	sub	a, #0x10
	jr	NZ,00128$
;src/niveles.c:218: initEsqueleto(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initEsqueleto
;src/niveles.c:219: initGusano(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initGusano
	pop	af
00128$:
;src/niveles.c:221: if (nivel == 17){
	ld	a,(#_nivel + 0)
	sub	a, #0x11
	jr	NZ,00130$
;src/niveles.c:222: initSpider(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initSpider
;src/niveles.c:223: initSpider(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initSpider
	pop	af
00130$:
;src/niveles.c:225: if (nivel == 18){
	ld	a,(#_nivel + 0)
	sub	a, #0x12
	jr	NZ,00132$
;src/niveles.c:226: initGoblin(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initGoblin
;src/niveles.c:227: initGoblin(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initGoblin
	pop	af
00132$:
;src/niveles.c:229: if (nivel == 19){
	ld	a,(#_nivel + 0)
	sub	a, #0x13
	jr	NZ,00134$
;src/niveles.c:230: initGoblin(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initGoblin
;src/niveles.c:231: initSpider(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initSpider
	pop	af
00134$:
;src/niveles.c:233: if (nivel == 20){
	ld	iy, #_nivel
	ld	a, 0 (iy)
	sub	a, #0x14
	jr	NZ,00136$
;src/niveles.c:234: strcpy(entidad[2].name,"Boss Lvl2");
	ld	de, #(_entidad + 0x002b)
	ld	hl, #___str_17
	xor	a, a
00320$:
	cp	a, (hl)
	ldi
	jr	NZ, 00320$
;src/niveles.c:235: entidad[2].max_energy = 99;
	ld	hl, #(_entidad + 0x0036)
	ld	(hl), #0x63
;src/niveles.c:236: entidad[2].attack = 30;
	ld	hl, #(_entidad + 0x0037)
	ld	(hl), #0x1e
;src/niveles.c:237: entidad[2].force = 5;
	ld	hl, #(_entidad + 0x0038)
	ld	(hl), #0x05
;src/niveles.c:238: entidad[2].defense = 10;
	ld	hl, #(_entidad + 0x0039)
	ld	(hl), #0x0a
;src/niveles.c:239: entidad[2].sprite = (u8*) &G_cavern_boss[0];
	ld	hl, #_G_cavern_boss
	ld	((_entidad + 0x003d)), hl
00136$:
;src/niveles.c:242: if (nivel == 21) {
	ld	a,(#_nivel + 0)
	sub	a, #0x15
	jr	NZ,00138$
;src/niveles.c:243: initSoldado1(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initSoldado1
	pop	af
00138$:
;src/niveles.c:245: if (nivel == 22) {
	ld	a,(#_nivel + 0)
	sub	a, #0x16
	jr	NZ,00140$
;src/niveles.c:246: initCarcelero(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initCarcelero
	pop	af
00140$:
;src/niveles.c:248: if (nivel == 23){
	ld	a,(#_nivel + 0)
	sub	a, #0x17
	jr	NZ,00142$
;src/niveles.c:249: initSoldado1(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initSoldado1
;src/niveles.c:250: initCarcelero(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initCarcelero
	pop	af
00142$:
;src/niveles.c:252: if (nivel == 24){
	ld	a,(#_nivel + 0)
	sub	a, #0x18
	jr	NZ,00144$
;src/niveles.c:253: initSoldado1(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initSoldado1
;src/niveles.c:254: initCaballero(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initCaballero
	pop	af
00144$:
;src/niveles.c:256: if (nivel == 26){
	ld	a,(#_nivel + 0)
	sub	a, #0x1a
	jr	NZ,00146$
;src/niveles.c:257: initSoldado2(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initSoldado2
;src/niveles.c:258: initCaballero(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initCaballero
	pop	af
00146$:
;src/niveles.c:260: if (nivel == 27){
	ld	a,(#_nivel + 0)
	sub	a, #0x1b
	jr	NZ,00148$
;src/niveles.c:261: initSoldado2(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initSoldado2
;src/niveles.c:262: initSoldado2(&entidad[2]);    
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initSoldado2
	pop	af
00148$:
;src/niveles.c:264: if (nivel == 28){
	ld	a,(#_nivel + 0)
	sub	a, #0x1c
	jr	NZ,00150$
;src/niveles.c:265: initMago(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	push	hl
	call	_initMago
	pop	af
00150$:
;src/niveles.c:267: if (nivel == 29){
	ld	a,(#_nivel + 0)
	sub	a, #0x1d
	jr	NZ,00152$
;src/niveles.c:268: initCaballero(&entidad[1]);
	ld	hl, #(_entidad + 0x0015)
	push	hl
	call	_initCaballero
;src/niveles.c:269: initCaballero(&entidad[2]);
	ld	hl, #(_entidad + 0x002a)
	ex	(sp),hl
	call	_initCaballero
	pop	af
00152$:
;src/niveles.c:271: if (nivel == 30){
	ld	iy, #_nivel
	ld	a, 0 (iy)
	sub	a, #0x1e
	jr	NZ,00154$
;src/niveles.c:272: strcpy(entidad[2].name,"Ricardo");
	ld	de, #(_entidad + 0x002b)
	ld	hl, #___str_18
	xor	a, a
00339$:
	cp	a, (hl)
	ldi
	jr	NZ, 00339$
;src/niveles.c:273: entidad[2].max_energy = 1;
	ld	hl, #(_entidad + 0x0036)
	ld	(hl), #0x01
;src/niveles.c:274: entidad[2].attack = 0;
	ld	hl, #(_entidad + 0x0037)
	ld	(hl), #0x00
;src/niveles.c:275: entidad[2].force = 0;
	ld	hl, #(_entidad + 0x0038)
	ld	(hl), #0x00
;src/niveles.c:276: entidad[2].defense = 0;
	ld	hl, #(_entidad + 0x0039)
	ld	(hl), #0x00
;src/niveles.c:277: entidad[2].sprite = (u8*) &G_ricardo[0];
	ld	hl, #_G_ricardo
	ld	((_entidad + 0x003d)), hl
00154$:
;src/niveles.c:279: if (nivel == 31){
	ld	iy, #_nivel
	ld	a, 0 (iy)
	sub	a, #0x1f
	jr	NZ,00156$
;src/niveles.c:280: strcpy(entidad[2].name,"Lady Sol");
	ld	de, #(_entidad + 0x002b)
	ld	hl, #___str_19
	xor	a, a
00342$:
	cp	a, (hl)
	ldi
	jr	NZ, 00342$
;src/niveles.c:281: entidad[2].max_energy = 1;
	ld	hl, #(_entidad + 0x0036)
	ld	(hl), #0x01
;src/niveles.c:282: entidad[2].attack = 0;
	ld	hl, #(_entidad + 0x0037)
	ld	(hl), #0x00
;src/niveles.c:283: entidad[2].force = 0;
	ld	hl, #(_entidad + 0x0038)
	ld	(hl), #0x00
;src/niveles.c:284: entidad[2].defense = 0;
	ld	hl, #(_entidad + 0x0039)
	ld	(hl), #0x00
;src/niveles.c:285: entidad[2].sprite = (u8*) &G_sol[0];
	ld	hl, #_G_sol
	ld	((_entidad + 0x003d)), hl
00156$:
;src/niveles.c:288: entidad[1].pos_x = 28;  //Posición del sprite en pantalla
	ld	hl, #(_entidad + 0x0025)
	ld	(hl), #0x1c
;src/niveles.c:289: entidad[2].pos_x = 36;
	ld	bc, #_entidad + 58
	ld	a, #0x24
	ld	(bc), a
;src/niveles.c:290: if (nivel == 30)
	ld	a,(#_nivel + 0)
	sub	a, #0x1e
	jr	NZ,00158$
;src/niveles.c:291: entidad[2].pos_x = 32;
	ld	a, #0x20
	ld	(bc), a
00158$:
;src/niveles.c:292: if (nivel == 31)
	ld	a,(#_nivel + 0)
	sub	a, #0x1f
	jr	NZ,00160$
;src/niveles.c:293: entidad[2].pos_x = 20;
	ld	a, #0x14
	ld	(bc), a
00160$:
;src/niveles.c:294: entidad[1].pos_y = 32;  //Posición en el marcador
	ld	hl, #(_entidad + 0x0027)
	ld	(hl), #0x20
;src/niveles.c:295: entidad[2].pos_y = 40;  //
	ld	hl, #(_entidad + 0x003c)
	ld	(hl), #0x28
;src/niveles.c:296: entidad[1].energy = entidad[1].max_energy;
	ld	bc, #_entidad + 32
	ld	a, (#(_entidad + 0x0021) + 0)
	ld	(bc), a
;src/niveles.c:297: entidad[2].energy = entidad[2].max_energy;
	ld	bc, #_entidad + 53
	ld	a, (#(_entidad + 0x0036) + 0)
	ld	(bc), a
	ret
___str_16:
	.ascii "Boss Lvl1"
	.db 0x00
___str_17:
	.ascii "Boss Lvl2"
	.db 0x00
___str_18:
	.ascii "Ricardo"
	.db 0x00
___str_19:
	.ascii "Lady Sol"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
