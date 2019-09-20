                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (CYGWIN)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _game
                             13 	.globl _defense
                             14 	.globl _attack
                             15 	.globl _showConsole
                             16 	.globl _initGoblin
                             17 	.globl _juego
                             18 	.globl _pausaTecladoLibre
                             19 	.globl _sprintf
                             20 	.globl _cpct_restoreState_mxor_u8
                             21 	.globl _cpct_setSeed_mxor
                             22 	.globl _cpct_getRandom_mxor_u8
                             23 	.globl _cpct_getScreenPtr
                             24 	.globl _cpct_setPALColour
                             25 	.globl _cpct_setPalette
                             26 	.globl _cpct_setVideoMode
                             27 	.globl _cpct_drawStringM1
                             28 	.globl _cpct_setDrawCharM1
                             29 	.globl _cpct_isAnyKeyPressed_f
                             30 	.globl _cpct_isKeyPressed
                             31 	.globl _cpct_scanKeyboard_f
                             32 	.globl _cpct_memset
                             33 	.globl _cpct_disableFirmware
                             34 	.globl _cursorPrint
                             35 	.globl _goblin
                             36 	.globl _player
                             37 	.globl _nivel
                             38 	.globl _entidad
                             39 	.globl _paletaM1
                             40 ;--------------------------------------------------------
                             41 ; special function registers
                             42 ;--------------------------------------------------------
                             43 ;--------------------------------------------------------
                             44 ; ram data
                             45 ;--------------------------------------------------------
                             46 	.area _DATA
   60EB                      47 _entidad::
   60EB                      48 	.ds 57
   6124                      49 _nivel::
   6124                      50 	.ds 1
   6125                      51 _player::
   6125                      52 	.ds 19
   6138                      53 _goblin::
   6138                      54 	.ds 19
   614B                      55 _cursorPrint::
   614B                      56 	.ds 1
                             57 ;--------------------------------------------------------
                             58 ; ram data
                             59 ;--------------------------------------------------------
                             60 	.area _INITIALIZED
                             61 ;--------------------------------------------------------
                             62 ; absolute external ram data
                             63 ;--------------------------------------------------------
                             64 	.area _DABS (ABS)
                             65 ;--------------------------------------------------------
                             66 ; global & static initialisations
                             67 ;--------------------------------------------------------
                             68 	.area _HOME
                             69 	.area _GSINIT
                             70 	.area _GSFINAL
                             71 	.area _GSINIT
                             72 ;--------------------------------------------------------
                             73 ; Home
                             74 ;--------------------------------------------------------
                             75 	.area _HOME
                             76 	.area _HOME
                             77 ;--------------------------------------------------------
                             78 ; code
                             79 ;--------------------------------------------------------
                             80 	.area _CODE
                             81 ;src/main.c:42: void initGoblin(){
                             82 ;	---------------------------------
                             83 ; Function initGoblin
                             84 ; ---------------------------------
   4000                      85 _initGoblin::
                             86 ;src/main.c:43: strcpy(goblin.name,"GOBLIN");
   4000 11 38 61      [10]   87 	ld	de, #_goblin
   4003 21 2F 40      [10]   88 	ld	hl, #___str_0
   4006 AF            [ 4]   89 	xor	a, a
   4007                      90 00103$:
   4007 BE            [ 7]   91 	cp	a, (hl)
   4008 ED A0         [16]   92 	ldi
   400A 20 FB         [12]   93 	jr	NZ, 00103$
                             94 ;src/main.c:44: goblin.max_energy = 90;
   400C 21 43 61      [10]   95 	ld	hl, #_goblin + 11
   400F 36 5A         [10]   96 	ld	(hl), #0x5a
                             97 ;src/main.c:45: goblin.energy = goblin.max_energy;
   4011 01 42 61      [10]   98 	ld	bc, #_goblin + 10
   4014 7E            [ 7]   99 	ld	a, (hl)
   4015 02            [ 7]  100 	ld	(bc), a
                            101 ;src/main.c:46: goblin.attack = 20;
   4016 21 44 61      [10]  102 	ld	hl, #(_goblin + 0x000c)
   4019 36 14         [10]  103 	ld	(hl), #0x14
                            104 ;src/main.c:47: goblin.force = 3;
   401B 21 45 61      [10]  105 	ld	hl, #(_goblin + 0x000d)
   401E 36 03         [10]  106 	ld	(hl), #0x03
                            107 ;src/main.c:48: goblin.defense = 10;
   4020 21 46 61      [10]  108 	ld	hl, #(_goblin + 0x000e)
   4023 36 0A         [10]  109 	ld	(hl), #0x0a
                            110 ;src/main.c:49: goblin.pos_x = 7;
   4025 21 47 61      [10]  111 	ld	hl, #(_goblin + 0x000f)
   4028 36 07         [10]  112 	ld	(hl), #0x07
   402A C9            [10]  113 	ret
   402B                     114 _paletaM1:
   402B 54                  115 	.db #0x54	; 84	'T'
   402C 40                  116 	.db #0x40	; 64
   402D 4B                  117 	.db #0x4b	; 75	'K'
   402E 44                  118 	.db #0x44	; 68	'D'
   402F                     119 ___str_0:
   402F 47 4F 42 4C 49 4E   120 	.ascii "GOBLIN"
   4035 00                  121 	.db 0x00
                            122 ;src/main.c:55: void showConsole  (void* string) {
                            123 ;	---------------------------------
                            124 ; Function showConsole
                            125 ; ---------------------------------
   4036                     126 _showConsole::
                            127 ;src/main.c:56: if (cursorPrint > 190){
   4036 3E BE         [ 7]  128 	ld	a, #0xbe
   4038 FD 21 4B 61   [14]  129 	ld	iy, #_cursorPrint
   403C FD 96 00      [19]  130 	sub	a, 0 (iy)
   403F 30 12         [12]  131 	jr	NC,00102$
                            132 ;src/main.c:57: cpct_clearScreen(0x00);
   4041 21 00 40      [10]  133 	ld	hl, #0x4000
   4044 E5            [11]  134 	push	hl
   4045 AF            [ 4]  135 	xor	a, a
   4046 F5            [11]  136 	push	af
   4047 33            [ 6]  137 	inc	sp
   4048 26 C0         [ 7]  138 	ld	h, #0xc0
   404A E5            [11]  139 	push	hl
   404B CD 2A 54      [17]  140 	call	_cpct_memset
                            141 ;src/main.c:58: cursorPrint = 44;
   404E 21 4B 61      [10]  142 	ld	hl,#_cursorPrint + 0
   4051 36 2C         [10]  143 	ld	(hl), #0x2c
   4053                     144 00102$:
                            145 ;src/main.c:61: cpct_drawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 0, cursorPrint));
   4053 3A 4B 61      [13]  146 	ld	a, (_cursorPrint)
   4056 F5            [11]  147 	push	af
   4057 33            [ 6]  148 	inc	sp
   4058 AF            [ 4]  149 	xor	a, a
   4059 F5            [11]  150 	push	af
   405A 33            [ 6]  151 	inc	sp
   405B 21 00 C0      [10]  152 	ld	hl, #0xc000
   405E E5            [11]  153 	push	hl
   405F CD 1E 55      [17]  154 	call	_cpct_getScreenPtr
   4062 D1            [10]  155 	pop	de
   4063 C1            [10]  156 	pop	bc
   4064 C5            [11]  157 	push	bc
   4065 D5            [11]  158 	push	de
   4066 E5            [11]  159 	push	hl
   4067 C5            [11]  160 	push	bc
   4068 CD 6B 51      [17]  161 	call	_cpct_drawStringM1
                            162 ;src/main.c:62: cursorPrint +=8;
   406B 21 4B 61      [10]  163 	ld	hl, #_cursorPrint
   406E 7E            [ 7]  164 	ld	a, (hl)
   406F C6 08         [ 7]  165 	add	a, #0x08
   4071 77            [ 7]  166 	ld	(hl), a
   4072 C9            [10]  167 	ret
                            168 ;src/main.c:67: void attack(TStats *a, TStats *b) {
                            169 ;	---------------------------------
                            170 ; Function attack
                            171 ; ---------------------------------
   4073                     172 _attack::
   4073 DD E5         [15]  173 	push	ix
   4075 DD 21 00 00   [14]  174 	ld	ix,#0
   4079 DD 39         [15]  175 	add	ix,sp
   407B 21 D7 FF      [10]  176 	ld	hl, #-41
   407E 39            [11]  177 	add	hl, sp
   407F F9            [ 6]  178 	ld	sp, hl
                            179 ;src/main.c:70: ataque = a->attack + (2*(cpct_rand()%a->force)) - a->force;
   4080 DD 4E 04      [19]  180 	ld	c,4 (ix)
   4083 DD 46 05      [19]  181 	ld	b,5 (ix)
   4086 C5            [11]  182 	push	bc
   4087 FD E1         [14]  183 	pop	iy
   4089 FD 7E 0C      [19]  184 	ld	a, 12 (iy)
   408C DD 77 FF      [19]  185 	ld	-1 (ix), a
   408F C5            [11]  186 	push	bc
   4090 CD 00 53      [17]  187 	call	_cpct_getRandom_mxor_u8
   4093 55            [ 4]  188 	ld	d, l
   4094 C1            [10]  189 	pop	bc
   4095 C5            [11]  190 	push	bc
   4096 FD E1         [14]  191 	pop	iy
   4098 FD 66 0D      [19]  192 	ld	h, 13 (iy)
   409B E5            [11]  193 	push	hl
   409C C5            [11]  194 	push	bc
   409D 6A            [ 4]  195 	ld	l, d
   409E E5            [11]  196 	push	hl
   409F CD 90 52      [17]  197 	call	__moduchar
   40A2 F1            [10]  198 	pop	af
   40A3 5D            [ 4]  199 	ld	e, l
   40A4 C1            [10]  200 	pop	bc
   40A5 E1            [10]  201 	pop	hl
   40A6 CB 23         [ 8]  202 	sla	e
   40A8 DD 7E FF      [19]  203 	ld	a, -1 (ix)
   40AB 83            [ 4]  204 	add	a, e
   40AC 94            [ 4]  205 	sub	a, h
   40AD 5F            [ 4]  206 	ld	e, a
                            207 ;src/main.c:73: if (ataque < b->energy) 
   40AE DD 6E 06      [19]  208 	ld	l,6 (ix)
   40B1 DD 66 07      [19]  209 	ld	h,7 (ix)
   40B4 D5            [11]  210 	push	de
   40B5 11 0A 00      [10]  211 	ld	de, #0x000a
   40B8 19            [11]  212 	add	hl, de
   40B9 D1            [10]  213 	pop	de
   40BA 56            [ 7]  214 	ld	d, (hl)
   40BB 7B            [ 4]  215 	ld	a, e
   40BC 92            [ 4]  216 	sub	a, d
   40BD 30 05         [12]  217 	jr	NC,00102$
                            218 ;src/main.c:74: b->energy = b->energy - ataque;
   40BF 7A            [ 4]  219 	ld	a, d
   40C0 93            [ 4]  220 	sub	a, e
   40C1 77            [ 7]  221 	ld	(hl), a
   40C2 18 02         [12]  222 	jr	00103$
   40C4                     223 00102$:
                            224 ;src/main.c:76: b->energy = 0;
   40C4 36 00         [10]  225 	ld	(hl), #0x00
   40C6                     226 00103$:
                            227 ;src/main.c:78: sprintf(temp, "%s attacks %02d.",a->name, ataque);
   40C6 16 00         [ 7]  228 	ld	d, #0x00
   40C8 21 00 00      [10]  229 	ld	hl, #0x0000
   40CB 39            [11]  230 	add	hl, sp
   40CC E5            [11]  231 	push	hl
   40CD FD E1         [14]  232 	pop	iy
   40CF E5            [11]  233 	push	hl
   40D0 D5            [11]  234 	push	de
   40D1 C5            [11]  235 	push	bc
   40D2 01 F6 40      [10]  236 	ld	bc, #___str_1
   40D5 C5            [11]  237 	push	bc
   40D6 FD E5         [15]  238 	push	iy
   40D8 CD A9 53      [17]  239 	call	_sprintf
   40DB 21 08 00      [10]  240 	ld	hl, #8
   40DE 39            [11]  241 	add	hl, sp
   40DF F9            [ 6]  242 	ld	sp, hl
   40E0 01 02 00      [10]  243 	ld	bc, #0x0002
   40E3 C5            [11]  244 	push	bc
   40E4 CD 3E 55      [17]  245 	call	_cpct_setDrawCharM1
   40E7 CD 36 40      [17]  246 	call	_showConsole
                            247 ;src/main.c:82: cpct_setDrawCharM1(3, 0);
   40EA 21 03 00      [10]  248 	ld	hl, #0x0003
   40ED E3            [19]  249 	ex	(sp),hl
   40EE CD 3E 55      [17]  250 	call	_cpct_setDrawCharM1
   40F1 DD F9         [10]  251 	ld	sp, ix
   40F3 DD E1         [14]  252 	pop	ix
   40F5 C9            [10]  253 	ret
   40F6                     254 ___str_1:
   40F6 25 73 20 61 74 74   255 	.ascii "%s attacks %02d."
        61 63 6B 73 20 25
        30 32 64 2E
   4106 00                  256 	.db 0x00
                            257 ;src/main.c:85: void defense(TStats *a) {
                            258 ;	---------------------------------
                            259 ; Function defense
                            260 ; ---------------------------------
   4107                     261 _defense::
   4107 DD E5         [15]  262 	push	ix
   4109 DD 21 00 00   [14]  263 	ld	ix,#0
   410D DD 39         [15]  264 	add	ix,sp
   410F 21 D5 FF      [10]  265 	ld	hl, #-43
   4112 39            [11]  266 	add	hl, sp
   4113 F9            [ 6]  267 	ld	sp, hl
                            268 ;src/main.c:88: healed = 0;
   4114 DD 36 D5 00   [19]  269 	ld	-43 (ix), #0x00
                            270 ;src/main.c:89: if (a->energy + a->defense < a->max_energy)
   4118 DD 4E 04      [19]  271 	ld	c,4 (ix)
   411B DD 46 05      [19]  272 	ld	b,5 (ix)
   411E FD 21 0A 00   [14]  273 	ld	iy, #0x000a
   4122 FD 09         [15]  274 	add	iy, bc
   4124 FD 7E 00      [19]  275 	ld	a, 0 (iy)
   4127 DD 77 FF      [19]  276 	ld	-1 (ix), a
   412A 5F            [ 4]  277 	ld	e, a
   412B 16 00         [ 7]  278 	ld	d, #0x00
   412D 69            [ 4]  279 	ld	l, c
   412E 60            [ 4]  280 	ld	h, b
   412F C5            [11]  281 	push	bc
   4130 01 0E 00      [10]  282 	ld	bc, #0x000e
   4133 09            [11]  283 	add	hl, bc
   4134 C1            [10]  284 	pop	bc
   4135 7E            [ 7]  285 	ld	a, (hl)
   4136 DD 77 FE      [19]  286 	ld	-2 (ix), a
   4139 6F            [ 4]  287 	ld	l, a
   413A 26 00         [ 7]  288 	ld	h, #0x00
   413C 19            [11]  289 	add	hl,de
   413D EB            [ 4]  290 	ex	de,hl
   413E 69            [ 4]  291 	ld	l, c
   413F 60            [ 4]  292 	ld	h, b
   4140 C5            [11]  293 	push	bc
   4141 01 0B 00      [10]  294 	ld	bc, #0x000b
   4144 09            [11]  295 	add	hl, bc
   4145 C1            [10]  296 	pop	bc
   4146 6E            [ 7]  297 	ld	l, (hl)
   4147 26 00         [ 7]  298 	ld	h, #0x00
   4149 7B            [ 4]  299 	ld	a, e
   414A 95            [ 4]  300 	sub	a, l
   414B 7A            [ 4]  301 	ld	a, d
   414C 9C            [ 4]  302 	sbc	a, h
   414D E2 52 41      [10]  303 	jp	PO, 00109$
   4150 EE 80         [ 7]  304 	xor	a, #0x80
   4152                     305 00109$:
   4152 F2 5B 41      [10]  306 	jp	P, 00102$
                            307 ;src/main.c:90: healed = a->defense;
   4155 DD 5E FE      [19]  308 	ld	e, -2 (ix)
   4158 DD 73 D5      [19]  309 	ld	-43 (ix), e
   415B                     310 00102$:
                            311 ;src/main.c:92: a->energy = a->energy + healed;
   415B DD 7E FF      [19]  312 	ld	a, -1 (ix)
   415E DD 86 D5      [19]  313 	add	a, -43 (ix)
   4161 FD 77 00      [19]  314 	ld	0 (iy), a
                            315 ;src/main.c:94: sprintf(temp, "%s heals %02d.",a->name, healed);
   4164 DD 5E D5      [19]  316 	ld	e, -43 (ix)
   4167 16 00         [ 7]  317 	ld	d, #0x00
   4169 21 01 00      [10]  318 	ld	hl, #0x0001
   416C 39            [11]  319 	add	hl, sp
   416D E5            [11]  320 	push	hl
   416E FD E1         [14]  321 	pop	iy
   4170 E5            [11]  322 	push	hl
   4171 D5            [11]  323 	push	de
   4172 C5            [11]  324 	push	bc
   4173 01 97 41      [10]  325 	ld	bc, #___str_2
   4176 C5            [11]  326 	push	bc
   4177 FD E5         [15]  327 	push	iy
   4179 CD A9 53      [17]  328 	call	_sprintf
   417C 21 08 00      [10]  329 	ld	hl, #8
   417F 39            [11]  330 	add	hl, sp
   4180 F9            [ 6]  331 	ld	sp, hl
   4181 01 01 00      [10]  332 	ld	bc, #0x0001
   4184 C5            [11]  333 	push	bc
   4185 CD 3E 55      [17]  334 	call	_cpct_setDrawCharM1
   4188 CD 36 40      [17]  335 	call	_showConsole
                            336 ;src/main.c:98: cpct_setDrawCharM1(3, 0);
   418B 21 03 00      [10]  337 	ld	hl, #0x0003
   418E E3            [19]  338 	ex	(sp),hl
   418F CD 3E 55      [17]  339 	call	_cpct_setDrawCharM1
   4192 DD F9         [10]  340 	ld	sp, ix
   4194 DD E1         [14]  341 	pop	ix
   4196 C9            [10]  342 	ret
   4197                     343 ___str_2:
   4197 25 73 20 68 65 61   344 	.ascii "%s heals %02d."
        6C 73 20 25 30 32
        64 2E
   41A5 00                  345 	.db 0x00
                            346 ;src/main.c:102: void game(){
                            347 ;	---------------------------------
                            348 ; Function game
                            349 ; ---------------------------------
   41A6                     350 _game::
                            351 ;src/main.c:105: while (player.energy) {
   41A6                     352 00118$:
   41A6 3A 2F 61      [13]  353 	ld	a,(#(_player + 0x000a) + 0)
   41A9 B7            [ 4]  354 	or	a, a
   41AA C8            [11]  355 	ret	Z
                            356 ;src/main.c:106: cpct_clearScreen(0x00);
   41AB 21 00 40      [10]  357 	ld	hl, #0x4000
   41AE E5            [11]  358 	push	hl
   41AF AF            [ 4]  359 	xor	a, a
   41B0 F5            [11]  360 	push	af
   41B1 33            [ 6]  361 	inc	sp
   41B2 26 C0         [ 7]  362 	ld	h, #0xc0
   41B4 E5            [11]  363 	push	hl
   41B5 CD 2A 54      [17]  364 	call	_cpct_memset
                            365 ;src/main.c:107: cursorPrint = 44;
   41B8 21 4B 61      [10]  366 	ld	hl,#_cursorPrint + 0
   41BB 36 2C         [10]  367 	ld	(hl), #0x2c
                            368 ;src/main.c:108: if (!goblin.energy) {
   41BD 3A 42 61      [13]  369 	ld	a, (#_goblin + 10)
   41C0 B7            [ 4]  370 	or	a, a
   41C1 20 0B         [12]  371 	jr	NZ,00102$
                            372 ;src/main.c:109: initGoblin();
   41C3 CD 00 40      [17]  373 	call	_initGoblin
                            374 ;src/main.c:110: showConsole("A GOBLIN APPEARS.");
   41C6 21 A0 42      [10]  375 	ld	hl, #___str_3
   41C9 E5            [11]  376 	push	hl
   41CA CD 36 40      [17]  377 	call	_showConsole
   41CD F1            [10]  378 	pop	af
   41CE                     379 00102$:
                            380 ;src/main.c:115: showConsole("ACTION (O/P/D)?");
   41CE 21 B2 42      [10]  381 	ld	hl, #___str_4
   41D1 E5            [11]  382 	push	hl
   41D2 CD 36 40      [17]  383 	call	_showConsole
   41D5 F1            [10]  384 	pop	af
                            385 ;src/main.c:116: do 
   41D6                     386 00105$:
                            387 ;src/main.c:117: cpct_scanKeyboard_f();
   41D6 CD F5 50      [17]  388 	call	_cpct_scanKeyboard_f
                            389 ;src/main.c:118: while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_D));
   41D9 21 04 04      [10]  390 	ld	hl, #0x0404
   41DC CD E9 50      [17]  391 	call	_cpct_isKeyPressed
   41DF 7D            [ 4]  392 	ld	a, l
   41E0 B7            [ 4]  393 	or	a, a
   41E1 20 14         [12]  394 	jr	NZ,00107$
   41E3 21 03 08      [10]  395 	ld	hl, #0x0803
   41E6 CD E9 50      [17]  396 	call	_cpct_isKeyPressed
   41E9 7D            [ 4]  397 	ld	a, l
   41EA B7            [ 4]  398 	or	a, a
   41EB 20 0A         [12]  399 	jr	NZ,00107$
   41ED 21 07 20      [10]  400 	ld	hl, #0x2007
   41F0 CD E9 50      [17]  401 	call	_cpct_isKeyPressed
   41F3 7D            [ 4]  402 	ld	a, l
   41F4 B7            [ 4]  403 	or	a, a
   41F5 28 DF         [12]  404 	jr	Z,00105$
   41F7                     405 00107$:
                            406 ;src/main.c:121: cpct_drawStringM1(" ", cpct_getScreenPtr(CPCT_VMEM_START, (player.pos_x)*2, 28));
   41F7 3A 34 61      [13]  407 	ld	a, (#(_player + 0x000f) + 0)
   41FA 87            [ 4]  408 	add	a, a
   41FB 47            [ 4]  409 	ld	b, a
   41FC 3E 1C         [ 7]  410 	ld	a, #0x1c
   41FE F5            [11]  411 	push	af
   41FF 33            [ 6]  412 	inc	sp
   4200 C5            [11]  413 	push	bc
   4201 33            [ 6]  414 	inc	sp
   4202 21 00 C0      [10]  415 	ld	hl, #0xc000
   4205 E5            [11]  416 	push	hl
   4206 CD 1E 55      [17]  417 	call	_cpct_getScreenPtr
   4209 E5            [11]  418 	push	hl
   420A 21 C2 42      [10]  419 	ld	hl, #___str_5
   420D E5            [11]  420 	push	hl
   420E CD 6B 51      [17]  421 	call	_cpct_drawStringM1
                            422 ;src/main.c:122: cpct_drawStringM1(" ", cpct_getScreenPtr(CPCT_VMEM_START, (goblin.pos_x)*2, 28));
   4211 3A 47 61      [13]  423 	ld	a, (#(_goblin + 0x000f) + 0)
   4214 87            [ 4]  424 	add	a, a
   4215 47            [ 4]  425 	ld	b, a
   4216 3E 1C         [ 7]  426 	ld	a, #0x1c
   4218 F5            [11]  427 	push	af
   4219 33            [ 6]  428 	inc	sp
   421A C5            [11]  429 	push	bc
   421B 33            [ 6]  430 	inc	sp
   421C 21 00 C0      [10]  431 	ld	hl, #0xc000
   421F E5            [11]  432 	push	hl
   4220 CD 1E 55      [17]  433 	call	_cpct_getScreenPtr
   4223 E5            [11]  434 	push	hl
   4224 21 C2 42      [10]  435 	ld	hl, #___str_5
   4227 E5            [11]  436 	push	hl
   4228 CD 6B 51      [17]  437 	call	_cpct_drawStringM1
                            438 ;src/main.c:125: if (cpct_isKeyPressed(Key_D)) {
   422B 21 07 20      [10]  439 	ld	hl, #0x2007
   422E CD E9 50      [17]  440 	call	_cpct_isKeyPressed
   4231 7D            [ 4]  441 	ld	a, l
   4232 B7            [ 4]  442 	or	a, a
   4233 28 08         [12]  443 	jr	Z,00109$
                            444 ;src/main.c:126: defense(&player);
   4235 21 25 61      [10]  445 	ld	hl, #_player
   4238 E5            [11]  446 	push	hl
   4239 CD 07 41      [17]  447 	call	_defense
   423C F1            [10]  448 	pop	af
   423D                     449 00109$:
                            450 ;src/main.c:130: cpct_drawStringM1("@", cpct_getScreenPtr(CPCT_VMEM_START, (player.pos_x)*2, 28));
   423D 3A 34 61      [13]  451 	ld	a, (#(_player + 0x000f) + 0)
   4240 87            [ 4]  452 	add	a, a
   4241 47            [ 4]  453 	ld	b, a
   4242 3E 1C         [ 7]  454 	ld	a, #0x1c
   4244 F5            [11]  455 	push	af
   4245 33            [ 6]  456 	inc	sp
   4246 C5            [11]  457 	push	bc
   4247 33            [ 6]  458 	inc	sp
   4248 21 00 C0      [10]  459 	ld	hl, #0xc000
   424B E5            [11]  460 	push	hl
   424C CD 1E 55      [17]  461 	call	_cpct_getScreenPtr
   424F E5            [11]  462 	push	hl
   4250 21 C4 42      [10]  463 	ld	hl, #___str_6
   4253 E5            [11]  464 	push	hl
   4254 CD 6B 51      [17]  465 	call	_cpct_drawStringM1
                            466 ;src/main.c:136: cpct_drawStringM1("G", cpct_getScreenPtr(CPCT_VMEM_START, (goblin.pos_x)*2, 28));
   4257 3A 47 61      [13]  467 	ld	a, (#(_goblin + 0x000f) + 0)
   425A 87            [ 4]  468 	add	a, a
   425B 47            [ 4]  469 	ld	b, a
   425C 3E 1C         [ 7]  470 	ld	a, #0x1c
   425E F5            [11]  471 	push	af
   425F 33            [ 6]  472 	inc	sp
   4260 C5            [11]  473 	push	bc
   4261 33            [ 6]  474 	inc	sp
   4262 21 00 C0      [10]  475 	ld	hl, #0xc000
   4265 E5            [11]  476 	push	hl
   4266 CD 1E 55      [17]  477 	call	_cpct_getScreenPtr
   4269 E5            [11]  478 	push	hl
   426A 21 C6 42      [10]  479 	ld	hl, #___str_7
   426D E5            [11]  480 	push	hl
   426E CD 6B 51      [17]  481 	call	_cpct_drawStringM1
                            482 ;src/main.c:138: if (!player.energy){
   4271 3A 2F 61      [13]  483 	ld	a, (#(_player + 0x000a) + 0)
   4274 B7            [ 4]  484 	or	a, a
   4275 20 08         [12]  485 	jr	NZ,00112$
                            486 ;src/main.c:139: showConsole("YOU DIED.");
   4277 21 C8 42      [10]  487 	ld	hl, #___str_8
   427A E5            [11]  488 	push	hl
   427B CD 36 40      [17]  489 	call	_showConsole
   427E F1            [10]  490 	pop	af
                            491 ;src/main.c:142: while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
   427F                     492 00112$:
   427F CD 0F 54      [17]  493 	call	_cpct_isAnyKeyPressed_f
   4282 7D            [ 4]  494 	ld	a, l
   4283 B7            [ 4]  495 	or	a, a
   4284 28 05         [12]  496 	jr	Z,00114$
                            497 ;src/main.c:143: cpct_scanKeyboard_f();
   4286 CD F5 50      [17]  498 	call	_cpct_scanKeyboard_f
   4289 18 F4         [12]  499 	jr	00112$
   428B                     500 00114$:
                            501 ;src/main.c:146: showConsole("PRESS ANY KEY TO CONTINUE");
   428B 21 D2 42      [10]  502 	ld	hl, #___str_9
   428E E5            [11]  503 	push	hl
   428F CD 36 40      [17]  504 	call	_showConsole
   4292 F1            [10]  505 	pop	af
                            506 ;src/main.c:148: do 
   4293                     507 00115$:
                            508 ;src/main.c:149: cpct_scanKeyboard_f();
   4293 CD F5 50      [17]  509 	call	_cpct_scanKeyboard_f
                            510 ;src/main.c:150: while (!cpct_isAnyKeyPressed_f());
   4296 CD 0F 54      [17]  511 	call	_cpct_isAnyKeyPressed_f
   4299 7D            [ 4]  512 	ld	a, l
   429A B7            [ 4]  513 	or	a, a
   429B 28 F6         [12]  514 	jr	Z,00115$
   429D C3 A6 41      [10]  515 	jp	00118$
   42A0                     516 ___str_3:
   42A0 41 20 47 4F 42 4C   517 	.ascii "A GOBLIN APPEARS."
        49 4E 20 41 50 50
        45 41 52 53 2E
   42B1 00                  518 	.db 0x00
   42B2                     519 ___str_4:
   42B2 41 43 54 49 4F 4E   520 	.ascii "ACTION (O/P/D)?"
        20 28 4F 2F 50 2F
        44 29 3F
   42C1 00                  521 	.db 0x00
   42C2                     522 ___str_5:
   42C2 20                  523 	.ascii " "
   42C3 00                  524 	.db 0x00
   42C4                     525 ___str_6:
   42C4 40                  526 	.ascii "@"
   42C5 00                  527 	.db 0x00
   42C6                     528 ___str_7:
   42C6 47                  529 	.ascii "G"
   42C7 00                  530 	.db 0x00
   42C8                     531 ___str_8:
   42C8 59 4F 55 20 44 49   532 	.ascii "YOU DIED."
        45 44 2E
   42D1 00                  533 	.db 0x00
   42D2                     534 ___str_9:
   42D2 50 52 45 53 53 20   535 	.ascii "PRESS ANY KEY TO CONTINUE"
        41 4E 59 20 4B 45
        59 20 54 4F 20 43
        4F 4E 54 49 4E 55
        45
   42EB 00                  536 	.db 0x00
                            537 ;src/main.c:154: void main(void) {
                            538 ;	---------------------------------
                            539 ; Function main
                            540 ; ---------------------------------
   42EC                     541 _main::
                            542 ;src/main.c:158: cpct_disableFirmware();
   42EC CD 55 54      [17]  543 	call	_cpct_disableFirmware
                            544 ;src/main.c:161: while (1) {
   42EF                     545 00107$:
                            546 ;src/main.c:162: cpct_setVideoMode(1);
   42EF 2E 01         [ 7]  547 	ld	l, #0x01
   42F1 CD 01 54      [17]  548 	call	_cpct_setVideoMode
                            549 ;src/main.c:163: cpct_clearScreen(0x00);
   42F4 21 00 40      [10]  550 	ld	hl, #0x4000
   42F7 E5            [11]  551 	push	hl
   42F8 AF            [ 4]  552 	xor	a, a
   42F9 F5            [11]  553 	push	af
   42FA 33            [ 6]  554 	inc	sp
   42FB 26 C0         [ 7]  555 	ld	h, #0xc0
   42FD E5            [11]  556 	push	hl
   42FE CD 2A 54      [17]  557 	call	_cpct_memset
                            558 ;src/main.c:164: cpct_setPalette(paletaM1,4);
   4301 21 04 00      [10]  559 	ld	hl, #0x0004
   4304 E5            [11]  560 	push	hl
   4305 21 2B 40      [10]  561 	ld	hl, #_paletaM1
   4308 E5            [11]  562 	push	hl
   4309 CD D2 50      [17]  563 	call	_cpct_setPalette
                            564 ;src/main.c:165: cpct_setBorder(HW_BLACK);
   430C 21 10 14      [10]  565 	ld	hl, #0x1410
   430F E5            [11]  566 	push	hl
   4310 CD 5F 51      [17]  567 	call	_cpct_setPALColour
                            568 ;src/main.c:168: cpct_setDrawCharM1(2, 0);
   4313 21 02 00      [10]  569 	ld	hl, #0x0002
   4316 E5            [11]  570 	push	hl
   4317 CD 3E 55      [17]  571 	call	_cpct_setDrawCharM1
                            572 ;src/main.c:169: cpct_drawStringM1("RPG GAME", cpct_getScreenPtr(CPCT_VMEM_START, 0, 0));
   431A 21 00 00      [10]  573 	ld	hl, #0x0000
   431D E5            [11]  574 	push	hl
   431E 26 C0         [ 7]  575 	ld	h, #0xc0
   4320 E5            [11]  576 	push	hl
   4321 CD 1E 55      [17]  577 	call	_cpct_getScreenPtr
   4324 01 6F 43      [10]  578 	ld	bc, #___str_10+0
   4327 E5            [11]  579 	push	hl
   4328 C5            [11]  580 	push	bc
   4329 CD 6B 51      [17]  581 	call	_cpct_drawStringM1
                            582 ;src/main.c:170: cpct_drawStringM1("PRESS ANY KEY TO START", cpct_getScreenPtr(CPCT_VMEM_START, 0, 20));
   432C 21 00 14      [10]  583 	ld	hl, #0x1400
   432F E5            [11]  584 	push	hl
   4330 26 C0         [ 7]  585 	ld	h, #0xc0
   4332 E5            [11]  586 	push	hl
   4333 CD 1E 55      [17]  587 	call	_cpct_getScreenPtr
   4336 01 78 43      [10]  588 	ld	bc, #___str_11+0
   4339 E5            [11]  589 	push	hl
   433A C5            [11]  590 	push	bc
   433B CD 6B 51      [17]  591 	call	_cpct_drawStringM1
                            592 ;src/main.c:173: pausaTecladoLibre();
   433E CD C4 43      [17]  593 	call	_pausaTecladoLibre
                            594 ;src/main.c:177: do {
   4341 0E 00         [ 7]  595 	ld	c, #0x00
   4343                     596 00101$:
                            597 ;src/main.c:178: cpct_scanKeyboard_f();
   4343 C5            [11]  598 	push	bc
   4344 CD F5 50      [17]  599 	call	_cpct_scanKeyboard_f
   4347 C1            [10]  600 	pop	bc
                            601 ;src/main.c:179: semilla++;
   4348 0C            [ 4]  602 	inc	c
                            603 ;src/main.c:181: while (!cpct_isAnyKeyPressed_f());
   4349 C5            [11]  604 	push	bc
   434A CD 0F 54      [17]  605 	call	_cpct_isAnyKeyPressed_f
   434D C1            [10]  606 	pop	bc
   434E 7D            [ 4]  607 	ld	a, l
   434F B7            [ 4]  608 	or	a, a
   4350 28 F1         [12]  609 	jr	Z,00101$
                            610 ;src/main.c:184: if (!semilla)
   4352 79            [ 4]  611 	ld	a,c
   4353 6F            [ 4]  612 	ld	l,a
   4354 B7            [ 4]  613 	or	a, a
   4355 20 02         [12]  614 	jr	NZ,00105$
                            615 ;src/main.c:185: semilla = 1;
   4357 2E 01         [ 7]  616 	ld	l, #0x01
   4359                     617 00105$:
                            618 ;src/main.c:187: cpct_srand8(semilla);
   4359 26 00         [ 7]  619 	ld	h, #0x00
   435B 11 00 00      [10]  620 	ld	de,#0x0000
   435E CD F2 52      [17]  621 	call	_cpct_setSeed_mxor
   4361 CD FA 52      [17]  622 	call	_cpct_restoreState_mxor_u8
                            623 ;src/main.c:188: nivel = 1;
   4364 21 24 61      [10]  624 	ld	hl,#_nivel + 0
   4367 36 01         [10]  625 	ld	(hl), #0x01
                            626 ;src/main.c:190: juego();
   4369 CD 5C 4E      [17]  627 	call	_juego
   436C C3 EF 42      [10]  628 	jp	00107$
   436F                     629 ___str_10:
   436F 52 50 47 20 47 41   630 	.ascii "RPG GAME"
        4D 45
   4377 00                  631 	.db 0x00
   4378                     632 ___str_11:
   4378 50 52 45 53 53 20   633 	.ascii "PRESS ANY KEY TO START"
        41 4E 59 20 4B 45
        59 20 54 4F 20 53
        54 41 52 54
   438E 00                  634 	.db 0x00
                            635 	.area _CODE
                            636 	.area _INITIALIZER
                            637 	.area _CABS (ABS)
