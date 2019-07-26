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
	.globl _printStats
	.globl _initGoblin
	.globl _initPlayer
	.globl _abs
	.globl _sprintf
	.globl _cpct_restoreState_mxor_u8
	.globl _cpct_setSeed_mxor
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
	.globl _paletaM1
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_player::
	.ds 15
_goblin::
	.ds 15
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
;src/main.c:32: u8 abs (i8 valor){
;	---------------------------------
; Function abs
; ---------------------------------
_abs::
;src/main.c:33: return (valor > 0 ? valor : -valor);
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
_paletaM1:
	.db #0x54	; 84	'T'
	.db #0x43	; 67	'C'
	.db #0x4c	; 76	'L'
	.db #0x4b	; 75	'K'
;src/main.c:36: void initPlayer(){
;	---------------------------------
; Function initPlayer
; ---------------------------------
_initPlayer::
;src/main.c:37: strcpy(player.name,"PLAYER");
	ld	de, #_player
	ld	hl, #___str_0
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
;src/main.c:38: player.max_energy = 99;
	ld	hl, #_player + 11
	ld	(hl), #0x63
;src/main.c:39: player.energy = player.max_energy;
	ld	bc, #_player + 10
	ld	a, (hl)
	ld	(bc), a
;src/main.c:40: player.attack = 30;
	ld	hl, #(_player + 0x000c)
	ld	(hl), #0x1e
;src/main.c:41: player.defense = 15;
	ld	hl, #(_player + 0x000d)
	ld	(hl), #0x0f
;src/main.c:42: player.pos_x = 5;
	ld	hl, #(_player + 0x000e)
	ld	(hl), #0x05
	ret
___str_0:
	.ascii "PLAYER"
	.db 0x00
;src/main.c:45: void initGoblin(){
;	---------------------------------
; Function initGoblin
; ---------------------------------
_initGoblin::
;src/main.c:46: strcpy(goblin.name,"GOBLIN");
	ld	de, #_goblin
	ld	hl, #___str_1
	xor	a, a
00103$:
	cp	a, (hl)
	ldi
	jr	NZ, 00103$
;src/main.c:47: goblin.max_energy = 90;
	ld	hl, #_goblin + 11
	ld	(hl), #0x5a
;src/main.c:48: goblin.energy = goblin.max_energy;
	ld	bc, #_goblin + 10
	ld	a, (hl)
	ld	(bc), a
;src/main.c:49: goblin.attack = 20;
	ld	hl, #(_goblin + 0x000c)
	ld	(hl), #0x14
;src/main.c:50: goblin.defense = 10;
	ld	hl, #(_goblin + 0x000d)
	ld	(hl), #0x0a
;src/main.c:51: goblin.pos_x = 7;
	ld	hl, #(_goblin + 0x000e)
	ld	(hl), #0x07
	ret
___str_1:
	.ascii "GOBLIN"
	.db 0x00
;src/main.c:54: void printStats(TStats *a) {
;	---------------------------------
; Function printStats
; ---------------------------------
_printStats::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-47
	add	hl, sp
	ld	sp, hl
;src/main.c:57: u8 posy = 10;
	ld	-47 (ix), #0x0a
;src/main.c:58: sprintf(temp, "%s %02d. ATTACK: %02d. DEFENSE: %02d",a->name, a->energy,a->attack,a->defense);
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	e, 13 (iy)
	ld	d, #0x00
	push	bc
	pop	iy
	ld	l, 12 (iy)
	ld	-2 (ix), l
	ld	-1 (ix), #0x00
	push	bc
	pop	iy
	ld	l, 10 (iy)
	ld	-4 (ix), l
	ld	-3 (ix), #0x00
	ld	hl, #0x0001
	add	hl, sp
	ld	-6 (ix), l
	ld	-5 (ix), h
	push	de
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	push	de
	ld	e,-4 (ix)
	ld	d,-3 (ix)
	push	de
	push	bc
	ld	bc, #___str_2
	push	bc
	push	hl
	call	_sprintf
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
;src/main.c:60: if (a == &player) 
	ld	a, 4 (ix)
	sub	a, #<(_player)
	jr	NZ,00102$
	ld	a, 5 (ix)
	sub	a, #>(_player)
	jr	NZ,00102$
;src/main.c:61: posy = 0;
	ld	-47 (ix), #0x00
00102$:
;src/main.c:63: cpct_drawStringM1(temp, cpct_getScreenPtr(CPCT_VMEM_START, 0, posy));
	ld	a, -47 (ix)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c,-6 (ix)
	ld	b,-5 (ix)
	push	hl
	push	bc
	call	_cpct_drawStringM1
	ld	sp, ix
	pop	ix
	ret
___str_2:
	.ascii "%s %02d. ATTACK: %02d. DEFENSE: %02d"
	.db 0x00
;src/main.c:67: void showConsole  (void* string) {
;	---------------------------------
; Function showConsole
; ---------------------------------
_showConsole::
;src/main.c:68: if (cursorPrint > 190){
	ld	a, #0xbe
	ld	iy, #_cursorPrint
	sub	a, 0 (iy)
	jr	NC,00102$
;src/main.c:69: cpct_clearScreen(0x00);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:70: cursorPrint = 44;
	ld	hl,#_cursorPrint + 0
	ld	(hl), #0x2c
00102$:
;src/main.c:73: cpct_drawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 0, cursorPrint));
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
;src/main.c:74: cursorPrint +=8;
	ld	hl, #_cursorPrint
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
	ret
;src/main.c:79: void attack(TStats *a, TStats *b) {
;	---------------------------------
; Function attack
; ---------------------------------
_attack::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-43
	add	hl, sp
	ld	sp, hl
;src/main.c:82: if (a->attack < b->energy) 
	ld	a, 4 (ix)
	ld	-2 (ix), a
	ld	a, 5 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	add	a, #0x0c
	ld	c, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	-3 (ix), a
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	hl, #0x000a
	add	hl,de
	ex	de,hl
	ld	a, (de)
	ld	l, a
	ld	a, -3 (ix)
	sub	a, l
	jr	NC,00102$
;src/main.c:83: b->energy = b->energy - a->attack;
	ld	a, l
	sub	a, -3 (ix)
	ld	(de), a
	jr	00103$
00102$:
;src/main.c:85: b->energy = 0;
	xor	a, a
	ld	(de), a
00103$:
;src/main.c:87: sprintf(temp, "%s attacks %02d.",a->name, a->attack);
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ld	hl, #0x0000
	add	hl, sp
	ld	e, l
	ld	d, h
	push	hl
	push	bc
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	push	bc
	ld	bc, #___str_3
	push	bc
	push	de
	call	_sprintf
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	ld	bc, #0x0002
	push	bc
	call	_cpct_setDrawCharM1
	call	_showConsole
;src/main.c:91: cpct_setDrawCharM1(3, 0);
	ld	hl, #0x0003
	ex	(sp),hl
	call	_cpct_setDrawCharM1
	ld	sp, ix
	pop	ix
	ret
___str_3:
	.ascii "%s attacks %02d."
	.db 0x00
;src/main.c:94: void defense(TStats *a) {
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
;src/main.c:97: healed = 0;
	ld	-43 (ix), #0x00
;src/main.c:98: if (a->energy + a->defense < a->max_energy)
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
	ld	bc, #0x000d
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
;src/main.c:99: healed = a->defense;
	ld	e, -2 (ix)
	ld	-43 (ix), e
00102$:
;src/main.c:101: a->energy = a->energy + healed;
	ld	a, -1 (ix)
	add	a, -43 (ix)
	ld	0 (iy), a
;src/main.c:103: sprintf(temp, "%s heals %02d.",a->name, healed);
	ld	e, -43 (ix)
	ld	d, #0x00
	ld	hl, #0x0001
	add	hl, sp
	push	hl
	pop	iy
	push	hl
	push	de
	push	bc
	ld	bc, #___str_4
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
;src/main.c:107: cpct_setDrawCharM1(3, 0);
	ld	hl, #0x0003
	ex	(sp),hl
	call	_cpct_setDrawCharM1
	ld	sp, ix
	pop	ix
	ret
___str_4:
	.ascii "%s heals %02d."
	.db 0x00
;src/main.c:111: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:112: while (player.energy) {
00134$:
	ld	a,(#(_player + 0x000a) + 0)
	or	a, a
	jp	Z, 00137$
;src/main.c:113: cpct_clearScreen(0x00);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:114: cursorPrint = 44;
	ld	hl,#_cursorPrint + 0
	ld	(hl), #0x2c
;src/main.c:115: if (!goblin.energy) {
	ld	a, (#(_goblin + 0x000a) + 0)
	or	a, a
	jr	NZ,00102$
;src/main.c:116: initGoblin();
	call	_initGoblin
;src/main.c:117: showConsole("A GOBLIN APPEARS.");
	ld	hl, #___str_5
	push	hl
	call	_showConsole
	pop	af
00102$:
;src/main.c:121: printStats(&player);
	ld	hl, #_player
	push	hl
	call	_printStats
;src/main.c:122: printStats(&goblin);
	ld	hl, #_goblin
	ex	(sp),hl
	call	_printStats
	pop	af
;src/main.c:123: cpct_drawStringM1("========================================", cpct_getScreenPtr(CPCT_VMEM_START, 0, 36));
	ld	hl, #0x2400
	push	hl
	ld	h, #0xc0
	push	hl
	call	_cpct_getScreenPtr
	push	hl
	ld	hl, #___str_6
	push	hl
	call	_cpct_drawStringM1
;src/main.c:126: cpct_drawStringM1("@", cpct_getScreenPtr(CPCT_VMEM_START, (player.pos_x)*2, 28));
	ld	a, (#(_player + 0x000e) + 0)
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
;src/main.c:128: cpct_drawStringM1("G", cpct_getScreenPtr(CPCT_VMEM_START, (goblin.pos_x)*2, 28));
	ld	a, (#(_goblin + 0x000e) + 0)
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
	ld	hl, #___str_8
	push	hl
	call	_cpct_drawStringM1
;src/main.c:133: showConsole("ACTION (O/P/D)?");
	ld	hl, #___str_9
	push	hl
	call	_showConsole
	pop	af
;src/main.c:134: do 
00105$:
;src/main.c:135: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:136: while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_D));
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
;src/main.c:139: cpct_drawStringM1(" ", cpct_getScreenPtr(CPCT_VMEM_START, (player.pos_x)*2, 28));
	ld	a, (#(_player + 0x000e) + 0)
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
	ld	hl, #___str_10
	push	hl
	call	_cpct_drawStringM1
;src/main.c:141: if (cpct_isKeyPressed(Key_O)) {
	ld	hl, #0x0404
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00111$
;src/main.c:142: player.pos_x--;
	ld	a, (#(_player + 0x000e) + 0)
	add	a, #0xff
	ld	hl, #(_player + 0x000e)
	ld	(hl), a
;src/main.c:143: if (!player.pos_x)
	or	a, a
	jr	NZ,00111$
;src/main.c:144: player.pos_x = 1;
	ld	(hl), #0x01
00111$:
;src/main.c:147: if (cpct_isKeyPressed(Key_P)) {
	ld	hl, #0x0803
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00117$
;src/main.c:148: player.pos_x++;
	ld	a,(#(_player + 0x000e) + 0)
	ld	-1 (ix), a
	inc	-1 (ix)
	ld	hl, #(_player + 0x000e)
	ld	a, -1 (ix)
	ld	(hl), a
;src/main.c:149: if (player.pos_x == 40)
	ld	a, -1 (ix)
	sub	a, #0x28
	jr	NZ,00113$
;src/main.c:150: player.pos_x = 39;
	ld	(hl), #0x27
00113$:
;src/main.c:126: cpct_drawStringM1("@", cpct_getScreenPtr(CPCT_VMEM_START, (player.pos_x)*2, 28));
	ld	hl, #(_player + 0x000e) + 0
	ld	c, (hl)
;src/main.c:151: if (player.pos_x == goblin.pos_x) {
	ld	a, (#(_goblin + 0x000e) + 0)
	sub	a, c
	jr	NZ,00117$
;src/main.c:152: player.pos_x--;
	dec	c
	ld	hl, #(_player + 0x000e)
	ld	(hl), c
;src/main.c:153: attack(&player, &goblin);
	ld	hl, #_goblin
	push	hl
	ld	hl, #_player
	push	hl
	call	_attack
	pop	af
	pop	af
00117$:
;src/main.c:158: if (cpct_isKeyPressed(Key_D)) {
	ld	hl, #0x2007
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00119$
;src/main.c:159: defense(&player);
	ld	hl, #_player
	push	hl
	call	_defense
	pop	af
00119$:
;src/main.c:163: cpct_drawStringM1("@", cpct_getScreenPtr(CPCT_VMEM_START, (player.pos_x)*2, 28));
	ld	a, (#(_player + 0x000e) + 0)
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
;src/main.c:167: if (goblin.energy) {
	ld	a,(#(_goblin + 0x000a) + 0)
	or	a, a
	jr	Z,00124$
;src/main.c:168: if (abs(goblin.pos_x - player.pos_x) == 1) //attack
	ld	hl, #(_goblin + 0x000e) + 0
	ld	c, (hl)
	ld	hl, #(_player + 0x000e) + 0
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	b, a
	push	bc
	inc	sp
	call	_abs
	inc	sp
	dec	l
	jr	NZ,00121$
;src/main.c:169: attack(&goblin,&player);
	ld	hl, #_player
	push	hl
	ld	hl, #_goblin
	push	hl
	call	_attack
	pop	af
	pop	af
	jr	00125$
00121$:
;src/main.c:171: defense(&goblin);
	ld	hl, #_goblin
	push	hl
	call	_defense
	pop	af
	jr	00125$
00124$:
;src/main.c:173: showConsole("YOU KILLED THE GOBLIN.");
	ld	hl, #___str_11
	push	hl
	call	_showConsole
	pop	af
00125$:
;src/main.c:176: if (!player.energy){
	ld	a, (#(_player + 0x000a) + 0)
	or	a, a
	jr	NZ,00128$
;src/main.c:177: showConsole("YOU DIED.");
	ld	hl, #___str_12
	push	hl
	call	_showConsole
	pop	af
;src/main.c:180: while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
00128$:
	call	_cpct_isAnyKeyPressed_f
	ld	a, l
	or	a, a
	jr	Z,00130$
;src/main.c:181: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
	jr	00128$
00130$:
;src/main.c:184: showConsole("PRESS ANY KEY TO CONTINUE");
	ld	hl, #___str_13
	push	hl
	call	_showConsole
	pop	af
;src/main.c:186: do 
00131$:
;src/main.c:187: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:188: while (!cpct_isAnyKeyPressed_f());
	call	_cpct_isAnyKeyPressed_f
	ld	a, l
	or	a, a
	jr	Z,00131$
	jp	00134$
00137$:
	inc	sp
	pop	ix
	ret
___str_5:
	.ascii "A GOBLIN APPEARS."
	.db 0x00
___str_6:
	.ascii "========================================"
	.db 0x00
___str_7:
	.ascii "@"
	.db 0x00
___str_8:
	.ascii "G"
	.db 0x00
___str_9:
	.ascii "ACTION (O/P/D)?"
	.db 0x00
___str_10:
	.ascii " "
	.db 0x00
___str_11:
	.ascii "YOU KILLED THE GOBLIN."
	.db 0x00
___str_12:
	.ascii "YOU DIED."
	.db 0x00
___str_13:
	.ascii "PRESS ANY KEY TO CONTINUE"
	.db 0x00
;src/main.c:192: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:196: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:199: while (1) {
00107$:
;src/main.c:200: cpct_setVideoMode(1);
	ld	l, #0x01
	call	_cpct_setVideoMode
;src/main.c:201: cpct_clearScreen(0x00);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:202: cpct_setPalette(paletaM1,4);
	ld	hl, #0x0004
	push	hl
	ld	hl, #_paletaM1
	push	hl
	call	_cpct_setPalette
;src/main.c:203: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:206: cpct_setDrawCharM1(3, 0);
	ld	hl, #0x0003
	push	hl
	call	_cpct_setDrawCharM1
;src/main.c:207: cpct_drawStringM1("RPG GAME", cpct_getScreenPtr(CPCT_VMEM_START, 0, 0));
	ld	hl, #0x0000
	push	hl
	ld	h, #0xc0
	push	hl
	call	_cpct_getScreenPtr
	ld	bc, #___str_14+0
	push	hl
	push	bc
	call	_cpct_drawStringM1
;src/main.c:208: cpct_drawStringM1("PRESS ANY KEY TO START", cpct_getScreenPtr(CPCT_VMEM_START, 0, 20));
	ld	hl, #0x1400
	push	hl
	ld	h, #0xc0
	push	hl
	call	_cpct_getScreenPtr
	ld	bc, #___str_15+0
	push	hl
	push	bc
	call	_cpct_drawStringM1
;src/main.c:212: do {
	ld	h, #0x00
00101$:
;src/main.c:213: cpct_scanKeyboard_f();
	push	hl
	call	_cpct_scanKeyboard_f
	pop	hl
;src/main.c:214: semilla++;
	inc	h
;src/main.c:216: while (!cpct_isAnyKeyPressed_f());
	push	hl
	call	_cpct_isAnyKeyPressed_f
	ld	a, l
	pop	hl
	or	a, a
	jr	Z,00101$
;src/main.c:217: cpct_clearScreen(0x00);
	ld	l, h
	push	hl
	ld	bc, #0x4000
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	bc, #0xc000
	push	bc
	call	_cpct_memset
	pop	hl
;src/main.c:220: if (!semilla)
	ld	a, h
	or	a, a
	jr	NZ,00105$
;src/main.c:221: semilla = 1;
	ld	l, #0x01
00105$:
;src/main.c:223: cpct_srand8(semilla);
	ld	h, #0x00
	ld	de,#0x0000
	call	_cpct_setSeed_mxor
	call	_cpct_restoreState_mxor_u8
;src/main.c:224: initPlayer();
	call	_initPlayer
;src/main.c:225: game();
	call	_game
	jp	00107$
___str_14:
	.ascii "RPG GAME"
	.db 0x00
___str_15:
	.ascii "PRESS ANY KEY TO START"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
