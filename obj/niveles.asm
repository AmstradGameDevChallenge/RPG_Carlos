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
	push	bc
	ld	hl, #___str_0
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:9: entidad->max_energy = 60;
	ld	hl, #0x000b
	add	hl, bc
	ld	(hl), #0x3c
;src/niveles.c:10: entidad->attack = 20;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x14
;src/niveles.c:11: entidad->force = 5;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x05
;src/niveles.c:12: entidad->defense = 10;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:13: entidad->sprite = (u8*) &G_arabe_1[0];
	ld	hl, #0x0012
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
	push	bc
	ld	hl, #___str_1
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:18: entidad->max_energy = 75;
	ld	hl, #0x000b
	add	hl, bc
	ld	(hl), #0x4b
;src/niveles.c:19: entidad->attack = 30;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x1e
;src/niveles.c:20: entidad->force = 10;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:21: entidad->defense = 20;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x14
;src/niveles.c:22: entidad->sprite = (u8*) &G_arabe_2[0];
	ld	hl, #0x0012
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
	push	bc
	ld	hl, #___str_2
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:27: entidad->max_energy = 90;
	ld	hl, #0x000b
	add	hl, bc
	ld	(hl), #0x5a
;src/niveles.c:28: entidad->attack = 30;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x1e
;src/niveles.c:29: entidad->force = 20;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x14
;src/niveles.c:30: entidad->defense = 30;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x1e
;src/niveles.c:31: entidad->sprite = (u8*) &G_arabe_3[0];
	ld	hl, #0x0012
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
	push	bc
	ld	hl, #___str_3
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:36: entidad->max_energy = 60;
	ld	hl, #0x000b
	add	hl, bc
	ld	(hl), #0x3c
;src/niveles.c:37: entidad->attack = 40;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x28
;src/niveles.c:38: entidad->force = 0;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x00
;src/niveles.c:39: entidad->defense = 5;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x05
;src/niveles.c:40: entidad->sprite = (u8*) &G_fakir[0];
	ld	hl, #0x0012
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
	push	bc
	ld	hl, #___str_4
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
	pop	bc
;src/niveles.c:45: entidad->max_energy = 60;
	ld	hl, #0x000b
	add	hl, bc
	ld	(hl), #0x3c
;src/niveles.c:46: entidad->attack = 30;
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x1e
;src/niveles.c:47: entidad->force = 10;
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x0a
;src/niveles.c:48: entidad->defense = 5;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x05
;src/niveles.c:49: entidad->sprite = (u8*) &G_abeja[0];
	ld	hl, #0x0012
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
;src/niveles.c:52: void initPlayer(){
;	---------------------------------
; Function initPlayer
; ---------------------------------
_initPlayer::
;src/niveles.c:53: strcpy(entidad[0].name,"Don Mendo");
	ld	de, #_entidad
	ld	hl, #___str_5
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
;src/niveles.c:54: entidad[0].max_energy = entidad[0].energy = 99;
	ld	hl, #(_entidad + 0x000a)
	ld	(hl), #0x63
	ld	hl, #(_entidad + 0x000b)
	ld	(hl), #0x63
;src/niveles.c:55: entidad[0].attack = 30;
	ld	hl, #(_entidad + 0x000c)
	ld	(hl), #0x1e
;src/niveles.c:56: entidad[0].force = 6;
	ld	hl, #(_entidad + 0x000d)
	ld	(hl), #0x06
;src/niveles.c:57: entidad[0].defense = 15;
	ld	hl, #(_entidad + 0x000e)
	ld	(hl), #0x0f
;src/niveles.c:58: entidad[0].pos_x = 8;
	ld	hl, #(_entidad + 0x000f)
	ld	(hl), #0x08
;src/niveles.c:59: entidad[0].pos_x_ant = 8;
	ld	hl, #(_entidad + 0x0010)
	ld	(hl), #0x08
;src/niveles.c:60: entidad[0].pos_y = 24;
	ld	hl, #(_entidad + 0x0011)
	ld	(hl), #0x18
;src/niveles.c:61: entidad[0].sprite = (u8*) &G_mendo[0];
	ld	hl, #_G_mendo
	ld	((_entidad + 0x0012)), hl
	ret
___str_5:
	.ascii "Don Mendo"
	.db 0x00
;src/niveles.c:64: void initNivel(){
;	---------------------------------
; Function initNivel
; ---------------------------------
_initNivel::
;src/niveles.c:66: entidad[1].max_energy = 0;
	ld	hl, #(_entidad + 0x001f)
	ld	(hl), #0x00
;src/niveles.c:67: entidad[1].pos_x_ant = 4;
	ld	hl, #(_entidad + 0x0024)
	ld	(hl), #0x04
;src/niveles.c:68: entidad[2].max_energy = 0;
	ld	hl, #(_entidad + 0x0033)
	ld	(hl), #0x00
;src/niveles.c:69: entidad[2].pos_x_ant = 4;
	ld	hl, #(_entidad + 0x0038)
	ld	(hl), #0x04
;src/niveles.c:72: if (nivel == 1) {
	ld	a,(#_nivel + 0)
	dec	a
	jr	NZ,00102$
;src/niveles.c:73: initSoldadoArabe1(&entidad[1]);
	ld	hl, #(_entidad + 0x0014)
	push	hl
	call	_initSoldadoArabe1
	pop	af
00102$:
;src/niveles.c:75: if (nivel == 2) {
	ld	a,(#_nivel + 0)
	sub	a, #0x02
	jr	NZ,00104$
;src/niveles.c:76: initSoldadoArabe1(&entidad[1]);
	ld	hl, #(_entidad + 0x0014)
	push	hl
	call	_initSoldadoArabe1
;src/niveles.c:77: initSoldadoArabe1(&entidad[2]);
	ld	hl, #(_entidad + 0x0028)
	ex	(sp),hl
	call	_initSoldadoArabe1
	pop	af
00104$:
;src/niveles.c:79: if (nivel == 3){
	ld	a,(#_nivel + 0)
	sub	a, #0x03
	jr	NZ,00106$
;src/niveles.c:80: initAbeja(&entidad[1]);
	ld	hl, #(_entidad + 0x0014)
	push	hl
	call	_initAbeja
;src/niveles.c:81: initSoldadoArabe1(&entidad[2]);
	ld	hl, #(_entidad + 0x0028)
	ex	(sp),hl
	call	_initSoldadoArabe1
	pop	af
00106$:
;src/niveles.c:83: if (nivel == 4){
	ld	a,(#_nivel + 0)
	sub	a, #0x04
	jr	NZ,00108$
;src/niveles.c:84: initSoldadoArabe2(&entidad[1]);
	ld	hl, #(_entidad + 0x0014)
	push	hl
	call	_initSoldadoArabe2
	pop	af
00108$:
;src/niveles.c:86: if (nivel == 6){
	ld	a,(#_nivel + 0)
	sub	a, #0x06
	jr	NZ,00110$
;src/niveles.c:87: initAbeja(&entidad[1]);
	ld	hl, #(_entidad + 0x0014)
	push	hl
	call	_initAbeja
;src/niveles.c:88: initFakir(&entidad[2]);
	ld	hl, #(_entidad + 0x0028)
	ex	(sp),hl
	call	_initFakir
	pop	af
00110$:
;src/niveles.c:90: if (nivel == 7){
	ld	a,(#_nivel + 0)
	sub	a, #0x07
	jr	NZ,00112$
;src/niveles.c:91: initSoldadoArabe2(&entidad[1]);
	ld	hl, #(_entidad + 0x0014)
	push	hl
	call	_initSoldadoArabe2
;src/niveles.c:92: initSoldadoArabe3(&entidad[2]);
	ld	hl, #(_entidad + 0x0028)
	ex	(sp),hl
	call	_initSoldadoArabe3
	pop	af
00112$:
;src/niveles.c:94: if (nivel == 8){
	ld	a,(#_nivel + 0)
	sub	a, #0x08
	jr	NZ,00114$
;src/niveles.c:95: initFakir(&entidad[1]);
	ld	hl, #(_entidad + 0x0014)
	push	hl
	call	_initFakir
;src/niveles.c:96: initSoldadoArabe2(&entidad[2]);
	ld	hl, #(_entidad + 0x0028)
	ex	(sp),hl
	call	_initSoldadoArabe2
	pop	af
00114$:
;src/niveles.c:98: if (nivel == 9){
	ld	a,(#_nivel + 0)
	sub	a, #0x09
	jr	NZ,00116$
;src/niveles.c:99: initSoldadoArabe3(&entidad[1]);
	ld	hl, #(_entidad + 0x0014)
	push	hl
	call	_initSoldadoArabe3
;src/niveles.c:100: initSoldadoArabe3(&entidad[2]);
	ld	hl, #(_entidad + 0x0028)
	ex	(sp),hl
	call	_initSoldadoArabe3
	pop	af
00116$:
;src/niveles.c:102: if (nivel == 10){
	ld	iy, #_nivel
	ld	a, 0 (iy)
	sub	a, #0x0a
	jr	NZ,00118$
;src/niveles.c:103: strcpy(entidad[2].name,"Boss Lvl1");
	ld	de, #(_entidad + 0x0028)
	ld	hl, #___str_6
	xor	a, a
00175$:
	cp	a, (hl)
	ldi
	jr	NZ, 00175$
;src/niveles.c:104: entidad[2].max_energy = 99;
	ld	hl, #(_entidad + 0x0033)
	ld	(hl), #0x63
;src/niveles.c:105: entidad[2].attack = 40;
	ld	hl, #(_entidad + 0x0034)
	ld	(hl), #0x28
;src/niveles.c:106: entidad[2].force = 10;
	ld	hl, #(_entidad + 0x0035)
	ld	(hl), #0x0a
;src/niveles.c:107: entidad[2].defense = 25;
	ld	hl, #(_entidad + 0x0036)
	ld	(hl), #0x19
;src/niveles.c:108: entidad[2].sprite = (u8*) &G_arabe_boss[0];
	ld	hl, #_G_arabe_boss
	ld	((_entidad + 0x003a)), hl
00118$:
;src/niveles.c:111: entidad[1].pos_x = 28;  //Posición del sprite en pantalla
	ld	hl, #(_entidad + 0x0023)
	ld	(hl), #0x1c
;src/niveles.c:112: entidad[2].pos_x = 36;
	ld	hl, #(_entidad + 0x0037)
	ld	(hl), #0x24
;src/niveles.c:113: entidad[1].pos_y = 32;  //Posición en el marcador
	ld	hl, #(_entidad + 0x0025)
	ld	(hl), #0x20
;src/niveles.c:114: entidad[2].pos_y = 40;  //
	ld	hl, #(_entidad + 0x0039)
	ld	(hl), #0x28
;src/niveles.c:115: entidad[1].energy = entidad[1].max_energy;
	ld	bc, #_entidad + 30
	ld	a, (#(_entidad + 0x001f) + 0)
	ld	(bc), a
;src/niveles.c:116: entidad[2].energy = entidad[2].max_energy;
	ld	bc, #_entidad + 50
	ld	a, (#(_entidad + 0x0033) + 0)
	ld	(bc), a
	ret
___str_6:
	.ascii "Boss Lvl1"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
