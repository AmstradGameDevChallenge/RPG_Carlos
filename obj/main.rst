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
                             16 	.globl _printStats
                             17 	.globl _initGoblin
                             18 	.globl _initPlayer
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
                             37 	.globl _paletaM1
                             38 ;--------------------------------------------------------
                             39 ; special function registers
                             40 ;--------------------------------------------------------
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DATA
   527B                      45 _player::
   527B                      46 	.ds 14
   5289                      47 _goblin::
   5289                      48 	.ds 14
   5297                      49 _cursorPrint::
   5297                      50 	.ds 1
                             51 ;--------------------------------------------------------
                             52 ; ram data
                             53 ;--------------------------------------------------------
                             54 	.area _INITIALIZED
                             55 ;--------------------------------------------------------
                             56 ; absolute external ram data
                             57 ;--------------------------------------------------------
                             58 	.area _DABS (ABS)
                             59 ;--------------------------------------------------------
                             60 ; global & static initialisations
                             61 ;--------------------------------------------------------
                             62 	.area _HOME
                             63 	.area _GSINIT
                             64 	.area _GSFINAL
                             65 	.area _GSINIT
                             66 ;--------------------------------------------------------
                             67 ; Home
                             68 ;--------------------------------------------------------
                             69 	.area _HOME
                             70 	.area _HOME
                             71 ;--------------------------------------------------------
                             72 ; code
                             73 ;--------------------------------------------------------
                             74 	.area _CODE
                             75 ;src/main.c:32: void initPlayer(){
                             76 ;	---------------------------------
                             77 ; Function initPlayer
                             78 ; ---------------------------------
   4000                      79 _initPlayer::
                             80 ;src/main.c:33: strcpy(player.name,"PLAYER");
   4000 11 7B 52      [10]   81 	ld	de, #_player
   4003 21 25 40      [10]   82 	ld	hl, #___str_0
   4006 AF            [ 4]   83 	xor	a, a
   4007                      84 00103$:
   4007 BE            [ 7]   85 	cp	a, (hl)
   4008 ED A0         [16]   86 	ldi
   400A 20 FB         [12]   87 	jr	NZ, 00103$
                             88 ;src/main.c:34: player.max_energy = 99;
   400C 21 86 52      [10]   89 	ld	hl, #_player + 11
   400F 36 63         [10]   90 	ld	(hl), #0x63
                             91 ;src/main.c:35: player.energy = player.max_energy;
   4011 01 85 52      [10]   92 	ld	bc, #_player + 10
   4014 7E            [ 7]   93 	ld	a, (hl)
   4015 02            [ 7]   94 	ld	(bc), a
                             95 ;src/main.c:36: player.attack = 30;
   4016 21 87 52      [10]   96 	ld	hl, #(_player + 0x000c)
   4019 36 1E         [10]   97 	ld	(hl), #0x1e
                             98 ;src/main.c:37: player.defense = 15;
   401B 21 88 52      [10]   99 	ld	hl, #(_player + 0x000d)
   401E 36 0F         [10]  100 	ld	(hl), #0x0f
   4020 C9            [10]  101 	ret
   4021                     102 _paletaM1:
   4021 54                  103 	.db #0x54	; 84	'T'
   4022 43                  104 	.db #0x43	; 67	'C'
   4023 4C                  105 	.db #0x4c	; 76	'L'
   4024 4B                  106 	.db #0x4b	; 75	'K'
   4025                     107 ___str_0:
   4025 50 4C 41 59 45 52   108 	.ascii "PLAYER"
   402B 00                  109 	.db 0x00
                            110 ;src/main.c:40: void initGoblin(){
                            111 ;	---------------------------------
                            112 ; Function initGoblin
                            113 ; ---------------------------------
   402C                     114 _initGoblin::
                            115 ;src/main.c:41: strcpy(goblin.name,"GOBLIN");
   402C 11 89 52      [10]  116 	ld	de, #_goblin
   402F 21 4D 40      [10]  117 	ld	hl, #___str_1
   4032 AF            [ 4]  118 	xor	a, a
   4033                     119 00103$:
   4033 BE            [ 7]  120 	cp	a, (hl)
   4034 ED A0         [16]  121 	ldi
   4036 20 FB         [12]  122 	jr	NZ, 00103$
                            123 ;src/main.c:42: goblin.max_energy = 90;
   4038 21 94 52      [10]  124 	ld	hl, #_goblin + 11
   403B 36 5A         [10]  125 	ld	(hl), #0x5a
                            126 ;src/main.c:43: goblin.energy = goblin.max_energy;
   403D 01 93 52      [10]  127 	ld	bc, #_goblin + 10
   4040 7E            [ 7]  128 	ld	a, (hl)
   4041 02            [ 7]  129 	ld	(bc), a
                            130 ;src/main.c:44: goblin.attack = 20;
   4042 21 95 52      [10]  131 	ld	hl, #(_goblin + 0x000c)
   4045 36 14         [10]  132 	ld	(hl), #0x14
                            133 ;src/main.c:45: goblin.defense = 10;
   4047 21 96 52      [10]  134 	ld	hl, #(_goblin + 0x000d)
   404A 36 0A         [10]  135 	ld	(hl), #0x0a
   404C C9            [10]  136 	ret
   404D                     137 ___str_1:
   404D 47 4F 42 4C 49 4E   138 	.ascii "GOBLIN"
   4053 00                  139 	.db 0x00
                            140 ;src/main.c:48: void printStats(TStats *a) {
                            141 ;	---------------------------------
                            142 ; Function printStats
                            143 ; ---------------------------------
   4054                     144 _printStats::
   4054 DD E5         [15]  145 	push	ix
   4056 DD 21 00 00   [14]  146 	ld	ix,#0
   405A DD 39         [15]  147 	add	ix,sp
   405C 21 D1 FF      [10]  148 	ld	hl, #-47
   405F 39            [11]  149 	add	hl, sp
   4060 F9            [ 6]  150 	ld	sp, hl
                            151 ;src/main.c:51: u8 posy = 10;
   4061 DD 36 D1 0A   [19]  152 	ld	-47 (ix), #0x0a
                            153 ;src/main.c:52: sprintf(temp, "%s %02d. ATTACK: %02d. DEFENSE: %02d",a->name, a->energy,a->attack,a->defense);
   4065 DD 4E 04      [19]  154 	ld	c,4 (ix)
   4068 DD 46 05      [19]  155 	ld	b,5 (ix)
   406B C5            [11]  156 	push	bc
   406C FD E1         [14]  157 	pop	iy
   406E FD 5E 0D      [19]  158 	ld	e, 13 (iy)
   4071 16 00         [ 7]  159 	ld	d, #0x00
   4073 C5            [11]  160 	push	bc
   4074 FD E1         [14]  161 	pop	iy
   4076 FD 6E 0C      [19]  162 	ld	l, 12 (iy)
   4079 DD 75 FE      [19]  163 	ld	-2 (ix), l
   407C DD 36 FF 00   [19]  164 	ld	-1 (ix), #0x00
   4080 C5            [11]  165 	push	bc
   4081 FD E1         [14]  166 	pop	iy
   4083 FD 6E 0A      [19]  167 	ld	l, 10 (iy)
   4086 DD 75 FC      [19]  168 	ld	-4 (ix), l
   4089 DD 36 FD 00   [19]  169 	ld	-3 (ix), #0x00
   408D 21 01 00      [10]  170 	ld	hl, #0x0001
   4090 39            [11]  171 	add	hl, sp
   4091 DD 75 FA      [19]  172 	ld	-6 (ix), l
   4094 DD 74 FB      [19]  173 	ld	-5 (ix), h
   4097 D5            [11]  174 	push	de
   4098 DD 5E FE      [19]  175 	ld	e,-2 (ix)
   409B DD 56 FF      [19]  176 	ld	d,-1 (ix)
   409E D5            [11]  177 	push	de
   409F DD 5E FC      [19]  178 	ld	e,-4 (ix)
   40A2 DD 56 FD      [19]  179 	ld	d,-3 (ix)
   40A5 D5            [11]  180 	push	de
   40A6 C5            [11]  181 	push	bc
   40A7 01 E5 40      [10]  182 	ld	bc, #___str_2
   40AA C5            [11]  183 	push	bc
   40AB E5            [11]  184 	push	hl
   40AC CD 0E 46      [17]  185 	call	_sprintf
   40AF 21 0C 00      [10]  186 	ld	hl, #12
   40B2 39            [11]  187 	add	hl, sp
   40B3 F9            [ 6]  188 	ld	sp, hl
                            189 ;src/main.c:54: if (a == &player) 
   40B4 DD 7E 04      [19]  190 	ld	a, 4 (ix)
   40B7 D6 7B         [ 7]  191 	sub	a, #<(_player)
   40B9 20 0B         [12]  192 	jr	NZ,00102$
   40BB DD 7E 05      [19]  193 	ld	a, 5 (ix)
   40BE D6 52         [ 7]  194 	sub	a, #>(_player)
   40C0 20 04         [12]  195 	jr	NZ,00102$
                            196 ;src/main.c:55: posy = 0;
   40C2 DD 36 D1 00   [19]  197 	ld	-47 (ix), #0x00
   40C6                     198 00102$:
                            199 ;src/main.c:57: cpct_drawStringM1(temp, cpct_getScreenPtr(CPCT_VMEM_START, 0, posy));
   40C6 DD 7E D1      [19]  200 	ld	a, -47 (ix)
   40C9 F5            [11]  201 	push	af
   40CA 33            [ 6]  202 	inc	sp
   40CB AF            [ 4]  203 	xor	a, a
   40CC F5            [11]  204 	push	af
   40CD 33            [ 6]  205 	inc	sp
   40CE 21 00 C0      [10]  206 	ld	hl, #0xc000
   40D1 E5            [11]  207 	push	hl
   40D2 CD AE 46      [17]  208 	call	_cpct_getScreenPtr
   40D5 DD 4E FA      [19]  209 	ld	c,-6 (ix)
   40D8 DD 46 FB      [19]  210 	ld	b,-5 (ix)
   40DB E5            [11]  211 	push	hl
   40DC C5            [11]  212 	push	bc
   40DD CD FC 44      [17]  213 	call	_cpct_drawStringM1
   40E0 DD F9         [10]  214 	ld	sp, ix
   40E2 DD E1         [14]  215 	pop	ix
   40E4 C9            [10]  216 	ret
   40E5                     217 ___str_2:
   40E5 25 73 20 25 30 32   218 	.ascii "%s %02d. ATTACK: %02d. DEFENSE: %02d"
        64 2E 20 41 54 54
        41 43 4B 3A 20 25
        30 32 64 2E 20 44
        45 46 45 4E 53 45
        3A 20 25 30 32 64
   4109 00                  219 	.db 0x00
                            220 ;src/main.c:61: void showConsole  (void* string) {
                            221 ;	---------------------------------
                            222 ; Function showConsole
                            223 ; ---------------------------------
   410A                     224 _showConsole::
   410A DD E5         [15]  225 	push	ix
   410C DD 21 00 00   [14]  226 	ld	ix,#0
   4110 DD 39         [15]  227 	add	ix,sp
                            228 ;src/main.c:62: if (cursorPrint > 190){
   4112 3E BE         [ 7]  229 	ld	a, #0xbe
   4114 FD 21 97 52   [14]  230 	ld	iy, #_cursorPrint
   4118 FD 96 00      [19]  231 	sub	a, 0 (iy)
   411B 30 12         [12]  232 	jr	NC,00102$
                            233 ;src/main.c:63: cpct_clearScreen(0x00);
   411D 21 00 40      [10]  234 	ld	hl, #0x4000
   4120 E5            [11]  235 	push	hl
   4121 AF            [ 4]  236 	xor	a, a
   4122 F5            [11]  237 	push	af
   4123 33            [ 6]  238 	inc	sp
   4124 26 C0         [ 7]  239 	ld	h, #0xc0
   4126 E5            [11]  240 	push	hl
   4127 CD 8F 46      [17]  241 	call	_cpct_memset
                            242 ;src/main.c:64: cursorPrint = 30;
   412A 21 97 52      [10]  243 	ld	hl,#_cursorPrint + 0
   412D 36 1E         [10]  244 	ld	(hl), #0x1e
   412F                     245 00102$:
                            246 ;src/main.c:67: cpct_drawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 0, cursorPrint));
   412F 3A 97 52      [13]  247 	ld	a, (_cursorPrint)
   4132 F5            [11]  248 	push	af
   4133 33            [ 6]  249 	inc	sp
   4134 AF            [ 4]  250 	xor	a, a
   4135 F5            [11]  251 	push	af
   4136 33            [ 6]  252 	inc	sp
   4137 21 00 C0      [10]  253 	ld	hl, #0xc000
   413A E5            [11]  254 	push	hl
   413B CD AE 46      [17]  255 	call	_cpct_getScreenPtr
   413E DD 4E 04      [19]  256 	ld	c,4 (ix)
   4141 DD 46 05      [19]  257 	ld	b,5 (ix)
   4144 E5            [11]  258 	push	hl
   4145 C5            [11]  259 	push	bc
   4146 CD FC 44      [17]  260 	call	_cpct_drawStringM1
                            261 ;src/main.c:68: cursorPrint +=8;
   4149 21 97 52      [10]  262 	ld	hl, #_cursorPrint
   414C 7E            [ 7]  263 	ld	a, (hl)
   414D C6 08         [ 7]  264 	add	a, #0x08
   414F 77            [ 7]  265 	ld	(hl), a
                            266 ;src/main.c:70: cpct_setDrawCharM1(3, 0);
   4150 21 03 00      [10]  267 	ld	hl, #0x0003
   4153 E5            [11]  268 	push	hl
   4154 CD CE 46      [17]  269 	call	_cpct_setDrawCharM1
                            270 ;src/main.c:71: printStats(&player);
   4157 21 7B 52      [10]  271 	ld	hl, #_player
   415A E5            [11]  272 	push	hl
   415B CD 54 40      [17]  273 	call	_printStats
                            274 ;src/main.c:72: printStats(&goblin);
   415E 21 89 52      [10]  275 	ld	hl, #_goblin
   4161 E3            [19]  276 	ex	(sp),hl
   4162 CD 54 40      [17]  277 	call	_printStats
   4165 F1            [10]  278 	pop	af
                            279 ;src/main.c:73: cpct_drawStringM1("========================================", cpct_getScreenPtr(CPCT_VMEM_START, 0, 20));
   4166 21 00 14      [10]  280 	ld	hl, #0x1400
   4169 E5            [11]  281 	push	hl
   416A 26 C0         [ 7]  282 	ld	h, #0xc0
   416C E5            [11]  283 	push	hl
   416D CD AE 46      [17]  284 	call	_cpct_getScreenPtr
   4170 01 7B 41      [10]  285 	ld	bc, #___str_3+0
   4173 E5            [11]  286 	push	hl
   4174 C5            [11]  287 	push	bc
   4175 CD FC 44      [17]  288 	call	_cpct_drawStringM1
   4178 DD E1         [14]  289 	pop	ix
   417A C9            [10]  290 	ret
   417B                     291 ___str_3:
   417B 3D 3D 3D 3D 3D 3D   292 	.ascii "========================================"
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D
   41A3 00                  293 	.db 0x00
                            294 ;src/main.c:77: void attack(TStats *a, TStats *b) {
                            295 ;	---------------------------------
                            296 ; Function attack
                            297 ; ---------------------------------
   41A4                     298 _attack::
   41A4 DD E5         [15]  299 	push	ix
   41A6 DD 21 00 00   [14]  300 	ld	ix,#0
   41AA DD 39         [15]  301 	add	ix,sp
   41AC 21 D5 FF      [10]  302 	ld	hl, #-43
   41AF 39            [11]  303 	add	hl, sp
   41B0 F9            [ 6]  304 	ld	sp, hl
                            305 ;src/main.c:80: if (a->attack < b->energy) 
   41B1 DD 7E 04      [19]  306 	ld	a, 4 (ix)
   41B4 DD 77 FE      [19]  307 	ld	-2 (ix), a
   41B7 DD 7E 05      [19]  308 	ld	a, 5 (ix)
   41BA DD 77 FF      [19]  309 	ld	-1 (ix), a
   41BD DD 7E FE      [19]  310 	ld	a, -2 (ix)
   41C0 C6 0C         [ 7]  311 	add	a, #0x0c
   41C2 4F            [ 4]  312 	ld	c, a
   41C3 DD 7E FF      [19]  313 	ld	a, -1 (ix)
   41C6 CE 00         [ 7]  314 	adc	a, #0x00
   41C8 47            [ 4]  315 	ld	b, a
   41C9 0A            [ 7]  316 	ld	a, (bc)
   41CA DD 77 FD      [19]  317 	ld	-3 (ix), a
   41CD DD 5E 06      [19]  318 	ld	e,6 (ix)
   41D0 DD 56 07      [19]  319 	ld	d,7 (ix)
   41D3 21 0A 00      [10]  320 	ld	hl, #0x000a
   41D6 19            [11]  321 	add	hl,de
   41D7 EB            [ 4]  322 	ex	de,hl
   41D8 1A            [ 7]  323 	ld	a, (de)
   41D9 6F            [ 4]  324 	ld	l, a
   41DA DD 7E FD      [19]  325 	ld	a, -3 (ix)
   41DD 95            [ 4]  326 	sub	a, l
   41DE 30 07         [12]  327 	jr	NC,00102$
                            328 ;src/main.c:81: b->energy = b->energy - a->attack;
   41E0 7D            [ 4]  329 	ld	a, l
   41E1 DD 96 FD      [19]  330 	sub	a, -3 (ix)
   41E4 12            [ 7]  331 	ld	(de), a
   41E5 18 02         [12]  332 	jr	00103$
   41E7                     333 00102$:
                            334 ;src/main.c:83: b->energy = 0;
   41E7 AF            [ 4]  335 	xor	a, a
   41E8 12            [ 7]  336 	ld	(de), a
   41E9                     337 00103$:
                            338 ;src/main.c:85: sprintf(temp, "%s attacks %02d.",a->name, a->attack);
   41E9 0A            [ 7]  339 	ld	a, (bc)
   41EA 4F            [ 4]  340 	ld	c, a
   41EB 06 00         [ 7]  341 	ld	b, #0x00
   41ED 21 00 00      [10]  342 	ld	hl, #0x0000
   41F0 39            [11]  343 	add	hl, sp
   41F1 5D            [ 4]  344 	ld	e, l
   41F2 54            [ 4]  345 	ld	d, h
   41F3 E5            [11]  346 	push	hl
   41F4 C5            [11]  347 	push	bc
   41F5 DD 4E FE      [19]  348 	ld	c,-2 (ix)
   41F8 DD 46 FF      [19]  349 	ld	b,-1 (ix)
   41FB C5            [11]  350 	push	bc
   41FC 01 18 42      [10]  351 	ld	bc, #___str_4
   41FF C5            [11]  352 	push	bc
   4200 D5            [11]  353 	push	de
   4201 CD 0E 46      [17]  354 	call	_sprintf
   4204 21 08 00      [10]  355 	ld	hl, #8
   4207 39            [11]  356 	add	hl, sp
   4208 F9            [ 6]  357 	ld	sp, hl
   4209 01 02 00      [10]  358 	ld	bc, #0x0002
   420C C5            [11]  359 	push	bc
   420D CD CE 46      [17]  360 	call	_cpct_setDrawCharM1
   4210 CD 0A 41      [17]  361 	call	_showConsole
   4213 DD F9         [10]  362 	ld	sp,ix
   4215 DD E1         [14]  363 	pop	ix
   4217 C9            [10]  364 	ret
   4218                     365 ___str_4:
   4218 25 73 20 61 74 74   366 	.ascii "%s attacks %02d."
        61 63 6B 73 20 25
        30 32 64 2E
   4228 00                  367 	.db 0x00
                            368 ;src/main.c:91: void defense(TStats *a) {
                            369 ;	---------------------------------
                            370 ; Function defense
                            371 ; ---------------------------------
   4229                     372 _defense::
   4229 DD E5         [15]  373 	push	ix
   422B DD 21 00 00   [14]  374 	ld	ix,#0
   422F DD 39         [15]  375 	add	ix,sp
   4231 21 D5 FF      [10]  376 	ld	hl, #-43
   4234 39            [11]  377 	add	hl, sp
   4235 F9            [ 6]  378 	ld	sp, hl
                            379 ;src/main.c:94: healed = 0;
   4236 DD 36 FD 00   [19]  380 	ld	-3 (ix), #0x00
                            381 ;src/main.c:95: if (a->energy + a->defense < a->max_energy)
   423A DD 4E 04      [19]  382 	ld	c,4 (ix)
   423D DD 46 05      [19]  383 	ld	b,5 (ix)
   4240 FD 21 0A 00   [14]  384 	ld	iy, #0x000a
   4244 FD 09         [15]  385 	add	iy, bc
   4246 FD 7E 00      [19]  386 	ld	a, 0 (iy)
   4249 DD 77 FF      [19]  387 	ld	-1 (ix), a
   424C 5F            [ 4]  388 	ld	e, a
   424D 16 00         [ 7]  389 	ld	d, #0x00
   424F 69            [ 4]  390 	ld	l, c
   4250 60            [ 4]  391 	ld	h, b
   4251 C5            [11]  392 	push	bc
   4252 01 0D 00      [10]  393 	ld	bc, #0x000d
   4255 09            [11]  394 	add	hl, bc
   4256 C1            [10]  395 	pop	bc
   4257 7E            [ 7]  396 	ld	a, (hl)
   4258 DD 77 FE      [19]  397 	ld	-2 (ix), a
   425B 6F            [ 4]  398 	ld	l, a
   425C 26 00         [ 7]  399 	ld	h, #0x00
   425E 19            [11]  400 	add	hl,de
   425F EB            [ 4]  401 	ex	de,hl
   4260 69            [ 4]  402 	ld	l, c
   4261 60            [ 4]  403 	ld	h, b
   4262 C5            [11]  404 	push	bc
   4263 01 0B 00      [10]  405 	ld	bc, #0x000b
   4266 09            [11]  406 	add	hl, bc
   4267 C1            [10]  407 	pop	bc
   4268 6E            [ 7]  408 	ld	l, (hl)
   4269 26 00         [ 7]  409 	ld	h, #0x00
   426B 7B            [ 4]  410 	ld	a, e
   426C 95            [ 4]  411 	sub	a, l
   426D 7A            [ 4]  412 	ld	a, d
   426E 9C            [ 4]  413 	sbc	a, h
   426F E2 74 42      [10]  414 	jp	PO, 00109$
   4272 EE 80         [ 7]  415 	xor	a, #0x80
   4274                     416 00109$:
   4274 F2 7D 42      [10]  417 	jp	P, 00102$
                            418 ;src/main.c:96: healed = a->defense;
   4277 DD 5E FE      [19]  419 	ld	e, -2 (ix)
   427A DD 73 FD      [19]  420 	ld	-3 (ix), e
   427D                     421 00102$:
                            422 ;src/main.c:98: a->energy = a->energy + healed;
   427D DD 7E FF      [19]  423 	ld	a, -1 (ix)
   4280 DD 86 FD      [19]  424 	add	a, -3 (ix)
   4283 FD 77 00      [19]  425 	ld	0 (iy), a
                            426 ;src/main.c:100: sprintf(temp, "%s heals %02d.",a->name, healed);
   4286 DD 5E FD      [19]  427 	ld	e, -3 (ix)
   4289 16 00         [ 7]  428 	ld	d, #0x00
   428B 21 00 00      [10]  429 	ld	hl, #0x0000
   428E 39            [11]  430 	add	hl, sp
   428F E5            [11]  431 	push	hl
   4290 FD E1         [14]  432 	pop	iy
   4292 E5            [11]  433 	push	hl
   4293 D5            [11]  434 	push	de
   4294 C5            [11]  435 	push	bc
   4295 01 B2 42      [10]  436 	ld	bc, #___str_5
   4298 C5            [11]  437 	push	bc
   4299 FD E5         [15]  438 	push	iy
   429B CD 0E 46      [17]  439 	call	_sprintf
   429E 21 08 00      [10]  440 	ld	hl, #8
   42A1 39            [11]  441 	add	hl, sp
   42A2 F9            [ 6]  442 	ld	sp, hl
   42A3 01 01 00      [10]  443 	ld	bc, #0x0001
   42A6 C5            [11]  444 	push	bc
   42A7 CD CE 46      [17]  445 	call	_cpct_setDrawCharM1
   42AA CD 0A 41      [17]  446 	call	_showConsole
   42AD DD F9         [10]  447 	ld	sp,ix
   42AF DD E1         [14]  448 	pop	ix
   42B1 C9            [10]  449 	ret
   42B2                     450 ___str_5:
   42B2 25 73 20 68 65 61   451 	.ascii "%s heals %02d."
        6C 73 20 25 30 32
        64 2E
   42C0 00                  452 	.db 0x00
                            453 ;src/main.c:107: void game(){
                            454 ;	---------------------------------
                            455 ; Function game
                            456 ; ---------------------------------
   42C1                     457 _game::
                            458 ;src/main.c:108: while (player.energy) {
   42C1                     459 00124$:
   42C1 3A 85 52      [13]  460 	ld	a, (#(_player + 0x000a) + 0)
   42C4 B7            [ 4]  461 	or	a, a
   42C5 C8            [11]  462 	ret	Z
                            463 ;src/main.c:109: initGoblin();
   42C6 CD 2C 40      [17]  464 	call	_initGoblin
                            465 ;src/main.c:110: showConsole("A GOBLIN APPEARS.");
   42C9 21 6F 43      [10]  466 	ld	hl, #___str_6
   42CC E5            [11]  467 	push	hl
   42CD CD 0A 41      [17]  468 	call	_showConsole
   42D0 F1            [10]  469 	pop	af
                            470 ;src/main.c:112: while (player.energy && goblin.energy) {
   42D1                     471 00121$:
   42D1 3A 85 52      [13]  472 	ld	a, (#(_player + 0x000a) + 0)
   42D4 B7            [ 4]  473 	or	a, a
   42D5 28 EA         [12]  474 	jr	Z,00124$
   42D7 3A 93 52      [13]  475 	ld	a, (#(_goblin + 0x000a) + 0)
   42DA B7            [ 4]  476 	or	a, a
   42DB 28 E4         [12]  477 	jr	Z,00124$
                            478 ;src/main.c:114: showConsole("ACTION (A/D)?");
   42DD 21 81 43      [10]  479 	ld	hl, #___str_7
   42E0 E5            [11]  480 	push	hl
   42E1 CD 0A 41      [17]  481 	call	_showConsole
   42E4 F1            [10]  482 	pop	af
                            483 ;src/main.c:115: do 
   42E5                     484 00102$:
                            485 ;src/main.c:116: cpct_scanKeyboard_f();
   42E5 CD 86 44      [17]  486 	call	_cpct_scanKeyboard_f
                            487 ;src/main.c:117: while (!cpct_isKeyPressed(Key_A) && !cpct_isKeyPressed(Key_D));
   42E8 21 08 20      [10]  488 	ld	hl, #0x2008
   42EB CD 7A 44      [17]  489 	call	_cpct_isKeyPressed
   42EE 7D            [ 4]  490 	ld	a, l
   42EF B7            [ 4]  491 	or	a, a
   42F0 20 0A         [12]  492 	jr	NZ,00104$
   42F2 21 07 20      [10]  493 	ld	hl, #0x2007
   42F5 CD 7A 44      [17]  494 	call	_cpct_isKeyPressed
   42F8 7D            [ 4]  495 	ld	a, l
   42F9 B7            [ 4]  496 	or	a, a
   42FA 28 E9         [12]  497 	jr	Z,00102$
   42FC                     498 00104$:
                            499 ;src/main.c:120: if (cpct_isKeyPressed(Key_A)) {
   42FC 21 08 20      [10]  500 	ld	hl, #0x2008
   42FF CD 7A 44      [17]  501 	call	_cpct_isKeyPressed
   4302 7D            [ 4]  502 	ld	a, l
   4303 B7            [ 4]  503 	or	a, a
   4304 28 0D         [12]  504 	jr	Z,00106$
                            505 ;src/main.c:121: attack(&player, &goblin);
   4306 21 89 52      [10]  506 	ld	hl, #_goblin
   4309 E5            [11]  507 	push	hl
   430A 21 7B 52      [10]  508 	ld	hl, #_player
   430D E5            [11]  509 	push	hl
   430E CD A4 41      [17]  510 	call	_attack
   4311 F1            [10]  511 	pop	af
   4312 F1            [10]  512 	pop	af
   4313                     513 00106$:
                            514 ;src/main.c:124: if (cpct_isKeyPressed(Key_D)) {
   4313 21 07 20      [10]  515 	ld	hl, #0x2007
   4316 CD 7A 44      [17]  516 	call	_cpct_isKeyPressed
   4319 7D            [ 4]  517 	ld	a, l
   431A B7            [ 4]  518 	or	a, a
   431B 28 08         [12]  519 	jr	Z,00108$
                            520 ;src/main.c:125: defense(&player);
   431D 21 7B 52      [10]  521 	ld	hl, #_player
   4320 E5            [11]  522 	push	hl
   4321 CD 29 42      [17]  523 	call	_defense
   4324 F1            [10]  524 	pop	af
   4325                     525 00108$:
                            526 ;src/main.c:131: if (goblin.energy) {
   4325 3A 93 52      [13]  527 	ld	a, (#(_goblin + 0x000a) + 0)
   4328 B7            [ 4]  528 	or	a, a
   4329 28 21         [12]  529 	jr	Z,00113$
                            530 ;src/main.c:132: if (cpct_rand()%4) {// 75% of attack
   432B CD 94 45      [17]  531 	call	_cpct_getRandom_mxor_u8
   432E 7D            [ 4]  532 	ld	a, l
   432F E6 03         [ 7]  533 	and	a, #0x03
   4331 28 0F         [12]  534 	jr	Z,00110$
                            535 ;src/main.c:133: attack(&goblin,&player);
   4333 21 7B 52      [10]  536 	ld	hl, #_player
   4336 E5            [11]  537 	push	hl
   4337 21 89 52      [10]  538 	ld	hl, #_goblin
   433A E5            [11]  539 	push	hl
   433B CD A4 41      [17]  540 	call	_attack
   433E F1            [10]  541 	pop	af
   433F F1            [10]  542 	pop	af
   4340 18 12         [12]  543 	jr	00114$
   4342                     544 00110$:
                            545 ;src/main.c:135: defense(&goblin);
   4342 21 89 52      [10]  546 	ld	hl, #_goblin
   4345 E5            [11]  547 	push	hl
   4346 CD 29 42      [17]  548 	call	_defense
   4349 F1            [10]  549 	pop	af
   434A 18 08         [12]  550 	jr	00114$
   434C                     551 00113$:
                            552 ;src/main.c:138: showConsole("YOU KILLED THE GOBLIN.");
   434C 21 8F 43      [10]  553 	ld	hl, #___str_8
   434F E5            [11]  554 	push	hl
   4350 CD 0A 41      [17]  555 	call	_showConsole
   4353 F1            [10]  556 	pop	af
   4354                     557 00114$:
                            558 ;src/main.c:141: if (!player.energy){
   4354 3A 85 52      [13]  559 	ld	a, (#(_player + 0x000a) + 0)
   4357 B7            [ 4]  560 	or	a, a
   4358 20 08         [12]  561 	jr	NZ,00117$
                            562 ;src/main.c:142: showConsole("YOU DIED.");
   435A 21 A6 43      [10]  563 	ld	hl, #___str_9
   435D E5            [11]  564 	push	hl
   435E CD 0A 41      [17]  565 	call	_showConsole
   4361 F1            [10]  566 	pop	af
                            567 ;src/main.c:145: while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
   4362                     568 00117$:
   4362 CD 74 46      [17]  569 	call	_cpct_isAnyKeyPressed_f
   4365 7D            [ 4]  570 	ld	a, l
   4366 B7            [ 4]  571 	or	a, a
   4367 CA D1 42      [10]  572 	jp	Z, 00121$
                            573 ;src/main.c:146: cpct_scanKeyboard_f();
   436A CD 86 44      [17]  574 	call	_cpct_scanKeyboard_f
   436D 18 F3         [12]  575 	jr	00117$
   436F                     576 ___str_6:
   436F 41 20 47 4F 42 4C   577 	.ascii "A GOBLIN APPEARS."
        49 4E 20 41 50 50
        45 41 52 53 2E
   4380 00                  578 	.db 0x00
   4381                     579 ___str_7:
   4381 41 43 54 49 4F 4E   580 	.ascii "ACTION (A/D)?"
        20 28 41 2F 44 29
        3F
   438E 00                  581 	.db 0x00
   438F                     582 ___str_8:
   438F 59 4F 55 20 4B 49   583 	.ascii "YOU KILLED THE GOBLIN."
        4C 4C 45 44 20 54
        48 45 20 47 4F 42
        4C 49 4E 2E
   43A5 00                  584 	.db 0x00
   43A6                     585 ___str_9:
   43A6 59 4F 55 20 44 49   586 	.ascii "YOU DIED."
        45 44 2E
   43AF 00                  587 	.db 0x00
                            588 ;src/main.c:152: void main(void) {
                            589 ;	---------------------------------
                            590 ; Function main
                            591 ; ---------------------------------
   43B0                     592 _main::
                            593 ;src/main.c:156: cpct_disableFirmware();
   43B0 CD 9D 46      [17]  594 	call	_cpct_disableFirmware
                            595 ;src/main.c:159: while (1) {
   43B3                     596 00107$:
                            597 ;src/main.c:160: cpct_setVideoMode(1);
   43B3 2E 01         [ 7]  598 	ld	l, #0x01
   43B5 CD 66 46      [17]  599 	call	_cpct_setVideoMode
                            600 ;src/main.c:161: cpct_clearScreen(0x00);
   43B8 21 00 40      [10]  601 	ld	hl, #0x4000
   43BB E5            [11]  602 	push	hl
   43BC AF            [ 4]  603 	xor	a, a
   43BD F5            [11]  604 	push	af
   43BE 33            [ 6]  605 	inc	sp
   43BF 26 C0         [ 7]  606 	ld	h, #0xc0
   43C1 E5            [11]  607 	push	hl
   43C2 CD 8F 46      [17]  608 	call	_cpct_memset
                            609 ;src/main.c:162: cpct_setPalette(paletaM1,4);
   43C5 21 04 00      [10]  610 	ld	hl, #0x0004
   43C8 E5            [11]  611 	push	hl
   43C9 21 21 40      [10]  612 	ld	hl, #_paletaM1
   43CC E5            [11]  613 	push	hl
   43CD CD 63 44      [17]  614 	call	_cpct_setPalette
                            615 ;src/main.c:163: cpct_setBorder(HW_BLACK);
   43D0 21 10 14      [10]  616 	ld	hl, #0x1410
   43D3 E5            [11]  617 	push	hl
   43D4 CD F0 44      [17]  618 	call	_cpct_setPALColour
                            619 ;src/main.c:166: cpct_setDrawCharM1(3, 0);
   43D7 21 03 00      [10]  620 	ld	hl, #0x0003
   43DA E5            [11]  621 	push	hl
   43DB CD CE 46      [17]  622 	call	_cpct_setDrawCharM1
                            623 ;src/main.c:167: cpct_drawStringM1("RPG GAME", cpct_getScreenPtr(CPCT_VMEM_START, 0, 0));
   43DE 21 00 00      [10]  624 	ld	hl, #0x0000
   43E1 E5            [11]  625 	push	hl
   43E2 26 C0         [ 7]  626 	ld	h, #0xc0
   43E4 E5            [11]  627 	push	hl
   43E5 CD AE 46      [17]  628 	call	_cpct_getScreenPtr
   43E8 01 43 44      [10]  629 	ld	bc, #___str_10+0
   43EB E5            [11]  630 	push	hl
   43EC C5            [11]  631 	push	bc
   43ED CD FC 44      [17]  632 	call	_cpct_drawStringM1
                            633 ;src/main.c:168: cpct_drawStringM1("PRESS ANY KEY TO START", cpct_getScreenPtr(CPCT_VMEM_START, 0, 20));
   43F0 21 00 14      [10]  634 	ld	hl, #0x1400
   43F3 E5            [11]  635 	push	hl
   43F4 26 C0         [ 7]  636 	ld	h, #0xc0
   43F6 E5            [11]  637 	push	hl
   43F7 CD AE 46      [17]  638 	call	_cpct_getScreenPtr
   43FA 01 4C 44      [10]  639 	ld	bc, #___str_11+0
   43FD E5            [11]  640 	push	hl
   43FE C5            [11]  641 	push	bc
   43FF CD FC 44      [17]  642 	call	_cpct_drawStringM1
                            643 ;src/main.c:172: do {
   4402 06 00         [ 7]  644 	ld	b, #0x00
   4404                     645 00101$:
                            646 ;src/main.c:173: cpct_scanKeyboard_f();
   4404 C5            [11]  647 	push	bc
   4405 CD 86 44      [17]  648 	call	_cpct_scanKeyboard_f
   4408 C1            [10]  649 	pop	bc
                            650 ;src/main.c:174: semilla++;
   4409 04            [ 4]  651 	inc	b
                            652 ;src/main.c:176: while (!cpct_isAnyKeyPressed_f());
   440A C5            [11]  653 	push	bc
   440B CD 74 46      [17]  654 	call	_cpct_isAnyKeyPressed_f
   440E C1            [10]  655 	pop	bc
   440F 7D            [ 4]  656 	ld	a, l
   4410 B7            [ 4]  657 	or	a, a
   4411 28 F1         [12]  658 	jr	Z,00101$
                            659 ;src/main.c:177: cpct_clearScreen(0x00);
   4413 48            [ 4]  660 	ld	c, b
   4414 C5            [11]  661 	push	bc
   4415 21 00 40      [10]  662 	ld	hl, #0x4000
   4418 E5            [11]  663 	push	hl
   4419 AF            [ 4]  664 	xor	a, a
   441A F5            [11]  665 	push	af
   441B 33            [ 6]  666 	inc	sp
   441C 26 C0         [ 7]  667 	ld	h, #0xc0
   441E E5            [11]  668 	push	hl
   441F CD 8F 46      [17]  669 	call	_cpct_memset
   4422 C1            [10]  670 	pop	bc
                            671 ;src/main.c:179: cursorPrint = 30;
   4423 21 97 52      [10]  672 	ld	hl,#_cursorPrint + 0
   4426 36 1E         [10]  673 	ld	(hl), #0x1e
                            674 ;src/main.c:180: if (!semilla)
   4428 78            [ 4]  675 	ld	a, b
   4429 B7            [ 4]  676 	or	a, a
   442A 20 02         [12]  677 	jr	NZ,00105$
                            678 ;src/main.c:181: semilla = 1;
   442C 0E 01         [ 7]  679 	ld	c, #0x01
   442E                     680 00105$:
                            681 ;src/main.c:183: cpct_srand8(semilla);
   442E 26 00         [ 7]  682 	ld	h, #0x00
   4430 11 00 00      [10]  683 	ld	de,#0x0000
   4433 69            [ 4]  684 	ld	l, c
   4434 CD 86 45      [17]  685 	call	_cpct_setSeed_mxor
   4437 CD 8E 45      [17]  686 	call	_cpct_restoreState_mxor_u8
                            687 ;src/main.c:184: initPlayer();
   443A CD 00 40      [17]  688 	call	_initPlayer
                            689 ;src/main.c:185: game();
   443D CD C1 42      [17]  690 	call	_game
   4440 C3 B3 43      [10]  691 	jp	00107$
   4443                     692 ___str_10:
   4443 52 50 47 20 47 41   693 	.ascii "RPG GAME"
        4D 45
   444B 00                  694 	.db 0x00
   444C                     695 ___str_11:
   444C 50 52 45 53 53 20   696 	.ascii "PRESS ANY KEY TO START"
        41 4E 59 20 4B 45
        59 20 54 4F 20 53
        54 41 52 54
   4462 00                  697 	.db 0x00
                            698 	.area _CODE
                            699 	.area _INITIALIZER
                            700 	.area _CABS (ABS)
