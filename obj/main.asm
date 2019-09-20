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
	.globl _game
	.globl _defense
	.globl _attack
	.globl _showConsole
	.globl _initGoblin
	.globl _juego
	.globl _pausaTecladoLibre
	.globl _sprintf
	.globl _cpct_restoreState_mxor_u8
	.globl _cpct_setSeed_mxor
	.globl _cpct_getRandom_mxor_u8
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_drawStringM1
	.globl _cpct_setDrawCharM1
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_memset
	.globl _cpct_disableFirmware
	.globl _cursorPrint
	.globl _goblin
	.globl _player
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
	.ds 57
_nivel::
	.ds 1
_player::
	.ds 19
_goblin::
	.ds 19
_cursorPrint::
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
;src/main.c:42: void initGoblin(){
;	---------------------------------
; Function initGoblin
; ---------------------------------
_initGoblin::
;src/main.c:43: strcpy(goblin.name,"GOBLIN");
	ld	de, #_goblin
	ld	hl, #___str_0
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
;src/main.c:44: goblin.max_energy = 90;
	ld	hl, #_goblin + 11
	ld	(hl), #0x5a
;src/main.c:45: goblin.energy = goblin.max_energy;
	ld	bc, #_goblin + 10
	ld	a, (hl)
	ld	(bc), a
;src/main.c:46: goblin.attack = 20;
	ld	hl, #(_goblin + 0x000c)
	ld	(hl), #0x14
;src/main.c:47: goblin.force = 3;
	ld	hl, #(_goblin + 0x000d)
	ld	(hl), #0x03
;src/main.c:48: goblin.defense = 10;
	ld	hl, #(_goblin + 0x000e)
	ld	(hl), #0x0a
;src/main.c:49: goblin.pos_x = 7;
	ld	hl, #(_goblin + 0x000f)
	ld	(hl), #0x07
	ret
_paletaM1:
	.db #0x54	; 84	'T'
	.db #0x40	; 64
	.db #0x4b	; 75	'K'
	.db #0x44	; 68	'D'
___str_0:
	.ascii "GOBLIN"
	.db 0x00
;src/main.c:55: void showConsole  (void* string) {
;	---------------------------------
; Function showConsole
; ---------------------------------
_showConsole::
;src/main.c:56: if (cursorPrint > 190){
	ld	a, #0xbe
	ld	iy, #_cursorPrint
	sub	a, 0 (iy)
	jr	NC,00102$
;src/main.c:57: cpct_clearScreen(0x00);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:58: cursorPrint = 44;
	ld	hl,#_cursorPrint + 0
	ld	(hl), #0x2c
00102$:
;src/main.c:61: cpct_drawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 0, cursorPrint));
	ld	a, (_cursorPrint)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
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
;src/main.c:62: cursorPrint +=8;
	ld	hl, #_cursorPrint
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
	ret
;src/main.c:67: void attack(TStats *a, TStats *b) {
;	---------------------------------
; Function attack
; ---------------------------------
_attack::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-41
	add	hl, sp
	ld	sp, hl
;src/main.c:70: ataque = a->attack + (2*(cpct_rand()%a->force)) - a->force;
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a, 12 (iy)
	ld	-1 (ix), a
	push	bc
	call	_cpct_getRandom_mxor_u8
	ld	d, l
	pop	bc
	push	bc
	pop	iy
	ld	h, 13 (iy)
	push	hl
	push	bc
	ld	l, d
	push	hl
	call	__moduchar
	pop	af
	ld	e, l
	pop	bc
	pop	hl
	sla	e
	ld	a, -1 (ix)
	add	a, e
	sub	a, h
	ld	e, a
;src/main.c:73: if (ataque < b->energy) 
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	de
	ld	de, #0x000a
	add	hl, de
	pop	de
	ld	d, (hl)
	ld	a, e
	sub	a, d
	jr	NC,00102$
;src/main.c:74: b->energy = b->energy - ataque;
	ld	a, d
	sub	a, e
	ld	(hl), a
	jr	00103$
00102$:
;src/main.c:76: b->energy = 0;
	ld	(hl), #0x00
00103$:
;src/main.c:78: sprintf(temp, "%s attacks %02d.",a->name, ataque);
	ld	d, #0x00
	ld	hl, #0x0000
	add	hl, sp
	push	hl
	pop	iy
	push	hl
	push	de
	push	bc
	ld	bc, #___str_1
	push	bc
	push	iy
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	ld	bc, #0x0002
	push	bc
	call	_cpct_setDrawCharM1
	call	_showConsole
;src/main.c:82: cpct_setDrawCharM1(3, 0);
	ld	hl, #0x0003
	ex	(sp),hl
	call	_cpct_setDrawCharM1
	ld	sp, ix
	pop	ix
	ret
___str_1:
	.ascii "%s attacks %02d."
	.db 0x00
;src/main.c:85: void defense(TStats *a) {
;	---------------------------------
; Function defense
; ---------------------------------
_defense::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-43
	add	hl, sp
	ld	sp, hl
;src/main.c:88: healed = 0;
	ld	-43 (ix), #0x00
;src/main.c:89: if (a->energy + a->defense < a->max_energy)
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	iy, #0x000a
	add	iy, bc
	ld	a, 0 (iy)
	ld	-1 (ix), a
	ld	e, a
	ld	d, #0x00
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x000e
	add	hl, bc
	pop	bc
	ld	a, (hl)
	ld	-2 (ix), a
	ld	l, a
	ld	h, #0x00
	add	hl,de
	ex	de,hl
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x000b
	add	hl, bc
	pop	bc
	ld	l, (hl)
	ld	h, #0x00
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00109$
	xor	a, #0x80
00109$:
	jp	P, 00102$
;src/main.c:90: healed = a->defense;
	ld	e, -2 (ix)
	ld	-43 (ix), e
00102$:
;src/main.c:92: a->energy = a->energy + healed;
	ld	a, -1 (ix)
	add	a, -43 (ix)
	ld	0 (iy), a
;src/main.c:94: sprintf(temp, "%s heals %02d.",a->name, healed);
	ld	e, -43 (ix)
	ld	d, #0x00
	ld	hl, #0x0001
	add	hl, sp
	push	hl
	pop	iy
	push	hl
	push	de
	push	bc
	ld	bc, #___str_2
	push	bc
	push	iy
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	ld	bc, #0x0001
	push	bc
	call	_cpct_setDrawCharM1
	call	_showConsole
;src/main.c:98: cpct_setDrawCharM1(3, 0);
	ld	hl, #0x0003
	ex	(sp),hl
	call	_cpct_setDrawCharM1
	ld	sp, ix
	pop	ix
	ret
___str_2:
	.ascii "%s heals %02d."
	.db 0x00
;src/main.c:102: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
;src/main.c:105: while (player.energy) {
00118$:
	ld	a,(#(_player + 0x000a) + 0)
	or	a, a
	ret	Z
;src/main.c:106: cpct_clearScreen(0x00);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:107: cursorPrint = 44;
	ld	hl,#_cursorPrint + 0
	ld	(hl), #0x2c
;src/main.c:108: if (!goblin.energy) {
	ld	a, (#_goblin + 10)
	or	a, a
	jr	NZ,00102$
;src/main.c:109: initGoblin();
	call	_initGoblin
;src/main.c:110: showConsole("A GOBLIN APPEARS.");
	ld	hl, #___str_3
	push	hl
	call	_showConsole
	pop	af
00102$:
;src/main.c:115: showConsole("ACTION (O/P/D)?");
	ld	hl, #___str_4
	push	hl
	call	_showConsole
	pop	af
;src/main.c:116: do 
00105$:
;src/main.c:117: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:118: while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_D));
	ld	hl, #0x0404
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00107$
	ld	hl, #0x0803
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00107$
	ld	hl, #0x2007
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00105$
00107$:
;src/main.c:121: cpct_drawStringM1(" ", cpct_getScreenPtr(CPCT_VMEM_START, (player.pos_x)*2, 28));
	ld	a, (#(_player + 0x000f) + 0)
	add	a, a
	ld	b, a
	ld	a, #0x1c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	push	hl
	ld	hl, #___str_5
	push	hl
	call	_cpct_drawStringM1
;src/main.c:122: cpct_drawStringM1(" ", cpct_getScreenPtr(CPCT_VMEM_START, (goblin.pos_x)*2, 28));
	ld	a, (#(_goblin + 0x000f) + 0)
	add	a, a
	ld	b, a
	ld	a, #0x1c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	push	hl
	ld	hl, #___str_5
	push	hl
	call	_cpct_drawStringM1
;src/main.c:125: if (cpct_isKeyPressed(Key_D)) {
	ld	hl, #0x2007
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00109$
;src/main.c:126: defense(&player);
	ld	hl, #_player
	push	hl
	call	_defense
	pop	af
00109$:
;src/main.c:130: cpct_drawStringM1("@", cpct_getScreenPtr(CPCT_VMEM_START, (player.pos_x)*2, 28));
	ld	a, (#(_player + 0x000f) + 0)
	add	a, a
	ld	b, a
	ld	a, #0x1c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	push	hl
	ld	hl, #___str_6
	push	hl
	call	_cpct_drawStringM1
;src/main.c:136: cpct_drawStringM1("G", cpct_getScreenPtr(CPCT_VMEM_START, (goblin.pos_x)*2, 28));
	ld	a, (#(_goblin + 0x000f) + 0)
	add	a, a
	ld	b, a
	ld	a, #0x1c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	push	hl
	ld	hl, #___str_7
	push	hl
	call	_cpct_drawStringM1
;src/main.c:138: if (!player.energy){
	ld	a, (#(_player + 0x000a) + 0)
	or	a, a
	jr	NZ,00112$
;src/main.c:139: showConsole("YOU DIED.");
	ld	hl, #___str_8
	push	hl
	call	_showConsole
	pop	af
;src/main.c:142: while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
00112$:
	call	_cpct_isAnyKeyPressed_f
	ld	a, l
	or	a, a
	jr	Z,00114$
;src/main.c:143: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
	jr	00112$
00114$:
;src/main.c:146: showConsole("PRESS ANY KEY TO CONTINUE");
	ld	hl, #___str_9
	push	hl
	call	_showConsole
	pop	af
;src/main.c:148: do 
00115$:
;src/main.c:149: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:150: while (!cpct_isAnyKeyPressed_f());
	call	_cpct_isAnyKeyPressed_f
	ld	a, l
	or	a, a
	jr	Z,00115$
	jp	00118$
___str_3:
	.ascii "A GOBLIN APPEARS."
	.db 0x00
___str_4:
	.ascii "ACTION (O/P/D)?"
	.db 0x00
___str_5:
	.ascii " "
	.db 0x00
___str_6:
	.ascii "@"
	.db 0x00
___str_7:
	.ascii "G"
	.db 0x00
___str_8:
	.ascii "YOU DIED."
	.db 0x00
___str_9:
	.ascii "PRESS ANY KEY TO CONTINUE"
	.db 0x00
;src/main.c:154: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:158: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:161: while (1) {
00107$:
;src/main.c:162: cpct_setVideoMode(1);
	ld	l, #0x01
	call	_cpct_setVideoMode
;src/main.c:163: cpct_clearScreen(0x00);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:164: cpct_setPalette(paletaM1,4);
	ld	hl, #0x0004
	push	hl
	ld	hl, #_paletaM1
	push	hl
	call	_cpct_setPalette
;src/main.c:165: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:168: cpct_setDrawCharM1(2, 0);
	ld	hl, #0x0002
	push	hl
	call	_cpct_setDrawCharM1
;src/main.c:169: cpct_drawStringM1("RPG GAME", cpct_getScreenPtr(CPCT_VMEM_START, 0, 0));
	ld	hl, #0x0000
	push	hl
	ld	h, #0xc0
	push	hl
	call	_cpct_getScreenPtr
	ld	bc, #___str_10+0
	push	hl
	push	bc
	call	_cpct_drawStringM1
;src/main.c:170: cpct_drawStringM1("PRESS ANY KEY TO START", cpct_getScreenPtr(CPCT_VMEM_START, 0, 20));
	ld	hl, #0x1400
	push	hl
	ld	h, #0xc0
	push	hl
	call	_cpct_getScreenPtr
	ld	bc, #___str_11+0
	push	hl
	push	bc
	call	_cpct_drawStringM1
;src/main.c:173: pausaTecladoLibre();
	call	_pausaTecladoLibre
;src/main.c:177: do {
	ld	c, #0x00
00101$:
;src/main.c:178: cpct_scanKeyboard_f();
	push	bc
	call	_cpct_scanKeyboard_f
	pop	bc
;src/main.c:179: semilla++;
	inc	c
;src/main.c:181: while (!cpct_isAnyKeyPressed_f());
	push	bc
	call	_cpct_isAnyKeyPressed_f
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00101$
;src/main.c:184: if (!semilla)
	ld	a,c
	ld	l,a
	or	a, a
	jr	NZ,00105$
;src/main.c:185: semilla = 1;
	ld	l, #0x01
00105$:
;src/main.c:187: cpct_srand8(semilla);
	ld	h, #0x00
	ld	de,#0x0000
	call	_cpct_setSeed_mxor
	call	_cpct_restoreState_mxor_u8
;src/main.c:188: nivel = 1;
	ld	hl,#_nivel + 0
	ld	(hl), #0x01
;src/main.c:190: juego();
	call	_juego
	jp	00107$
___str_10:
	.ascii "RPG GAME"
	.db 0x00
___str_11:
	.ascii "PRESS ANY KEY TO START"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
