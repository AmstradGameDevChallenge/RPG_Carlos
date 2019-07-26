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
                             19 	.globl _abs
                             20 	.globl _sprintf
                             21 	.globl _cpct_restoreState_mxor_u8
                             22 	.globl _cpct_setSeed_mxor
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
   53B2                      45 _player::
   53B2                      46 	.ds 15
   53C1                      47 _goblin::
   53C1                      48 	.ds 15
   53D0                      49 _cursorPrint::
   53D0                      50 	.ds 1
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
                             75 ;src/main.c:32: u8 abs (i8 valor){
                             76 ;	---------------------------------
                             77 ; Function abs
                             78 ; ---------------------------------
   4000                      79 _abs::
                             80 ;src/main.c:33: return (valor > 0 ? valor : -valor);
   4000 AF            [ 4]   81 	xor	a, a
   4001 FD 21 02 00   [14]   82 	ld	iy, #2
   4005 FD 39         [15]   83 	add	iy, sp
   4007 FD 96 00      [19]   84 	sub	a, 0 (iy)
   400A E2 0F 40      [10]   85 	jp	PO, 00109$
   400D EE 80         [ 7]   86 	xor	a, #0x80
   400F                      87 00109$:
   400F F2 1C 40      [10]   88 	jp	P, 00103$
   4012 FD 21 02 00   [14]   89 	ld	iy, #2
   4016 FD 39         [15]   90 	add	iy, sp
   4018 FD 6E 00      [19]   91 	ld	l, 0 (iy)
   401B C9            [10]   92 	ret
   401C                      93 00103$:
   401C AF            [ 4]   94 	xor	a, a
   401D FD 21 02 00   [14]   95 	ld	iy, #2
   4021 FD 39         [15]   96 	add	iy, sp
   4023 FD 96 00      [19]   97 	sub	a, 0 (iy)
   4026 6F            [ 4]   98 	ld	l, a
   4027 C9            [10]   99 	ret
   4028                     100 _paletaM1:
   4028 54                  101 	.db #0x54	; 84	'T'
   4029 43                  102 	.db #0x43	; 67	'C'
   402A 4C                  103 	.db #0x4c	; 76	'L'
   402B 4B                  104 	.db #0x4b	; 75	'K'
                            105 ;src/main.c:36: void initPlayer(){
                            106 ;	---------------------------------
                            107 ; Function initPlayer
                            108 ; ---------------------------------
   402C                     109 _initPlayer::
                            110 ;src/main.c:37: strcpy(player.name,"PLAYER");
   402C 11 B2 53      [10]  111 	ld	de, #_player
   402F 21 52 40      [10]  112 	ld	hl, #___str_0
   4032 AF            [ 4]  113 	xor	a, a
   4033                     114 00103$:
   4033 BE            [ 7]  115 	cp	a, (hl)
   4034 ED A0         [16]  116 	ldi
   4036 20 FB         [12]  117 	jr	NZ, 00103$
                            118 ;src/main.c:38: player.max_energy = 99;
   4038 21 BD 53      [10]  119 	ld	hl, #_player + 11
   403B 36 63         [10]  120 	ld	(hl), #0x63
                            121 ;src/main.c:39: player.energy = player.max_energy;
   403D 01 BC 53      [10]  122 	ld	bc, #_player + 10
   4040 7E            [ 7]  123 	ld	a, (hl)
   4041 02            [ 7]  124 	ld	(bc), a
                            125 ;src/main.c:40: player.attack = 30;
   4042 21 BE 53      [10]  126 	ld	hl, #(_player + 0x000c)
   4045 36 1E         [10]  127 	ld	(hl), #0x1e
                            128 ;src/main.c:41: player.defense = 15;
   4047 21 BF 53      [10]  129 	ld	hl, #(_player + 0x000d)
   404A 36 0F         [10]  130 	ld	(hl), #0x0f
                            131 ;src/main.c:42: player.pos_x = 5;
   404C 21 C0 53      [10]  132 	ld	hl, #(_player + 0x000e)
   404F 36 05         [10]  133 	ld	(hl), #0x05
   4051 C9            [10]  134 	ret
   4052                     135 ___str_0:
   4052 50 4C 41 59 45 52   136 	.ascii "PLAYER"
   4058 00                  137 	.db 0x00
                            138 ;src/main.c:45: void initGoblin(){
                            139 ;	---------------------------------
                            140 ; Function initGoblin
                            141 ; ---------------------------------
   4059                     142 _initGoblin::
                            143 ;src/main.c:46: strcpy(goblin.name,"GOBLIN");
   4059 11 C1 53      [10]  144 	ld	de, #_goblin
   405C 21 7F 40      [10]  145 	ld	hl, #___str_1
   405F AF            [ 4]  146 	xor	a, a
   4060                     147 00103$:
   4060 BE            [ 7]  148 	cp	a, (hl)
   4061 ED A0         [16]  149 	ldi
   4063 20 FB         [12]  150 	jr	NZ, 00103$
                            151 ;src/main.c:47: goblin.max_energy = 90;
   4065 21 CC 53      [10]  152 	ld	hl, #_goblin + 11
   4068 36 5A         [10]  153 	ld	(hl), #0x5a
                            154 ;src/main.c:48: goblin.energy = goblin.max_energy;
   406A 01 CB 53      [10]  155 	ld	bc, #_goblin + 10
   406D 7E            [ 7]  156 	ld	a, (hl)
   406E 02            [ 7]  157 	ld	(bc), a
                            158 ;src/main.c:49: goblin.attack = 20;
   406F 21 CD 53      [10]  159 	ld	hl, #(_goblin + 0x000c)
   4072 36 14         [10]  160 	ld	(hl), #0x14
                            161 ;src/main.c:50: goblin.defense = 10;
   4074 21 CE 53      [10]  162 	ld	hl, #(_goblin + 0x000d)
   4077 36 0A         [10]  163 	ld	(hl), #0x0a
                            164 ;src/main.c:51: goblin.pos_x = 7;
   4079 21 CF 53      [10]  165 	ld	hl, #(_goblin + 0x000e)
   407C 36 07         [10]  166 	ld	(hl), #0x07
   407E C9            [10]  167 	ret
   407F                     168 ___str_1:
   407F 47 4F 42 4C 49 4E   169 	.ascii "GOBLIN"
   4085 00                  170 	.db 0x00
                            171 ;src/main.c:54: void printStats(TStats *a) {
                            172 ;	---------------------------------
                            173 ; Function printStats
                            174 ; ---------------------------------
   4086                     175 _printStats::
   4086 DD E5         [15]  176 	push	ix
   4088 DD 21 00 00   [14]  177 	ld	ix,#0
   408C DD 39         [15]  178 	add	ix,sp
   408E 21 D1 FF      [10]  179 	ld	hl, #-47
   4091 39            [11]  180 	add	hl, sp
   4092 F9            [ 6]  181 	ld	sp, hl
                            182 ;src/main.c:57: u8 posy = 10;
   4093 DD 36 D1 0A   [19]  183 	ld	-47 (ix), #0x0a
                            184 ;src/main.c:58: sprintf(temp, "%s %02d. ATTACK: %02d. DEFENSE: %02d",a->name, a->energy,a->attack,a->defense);
   4097 DD 4E 04      [19]  185 	ld	c,4 (ix)
   409A DD 46 05      [19]  186 	ld	b,5 (ix)
   409D C5            [11]  187 	push	bc
   409E FD E1         [14]  188 	pop	iy
   40A0 FD 5E 0D      [19]  189 	ld	e, 13 (iy)
   40A3 16 00         [ 7]  190 	ld	d, #0x00
   40A5 C5            [11]  191 	push	bc
   40A6 FD E1         [14]  192 	pop	iy
   40A8 FD 6E 0C      [19]  193 	ld	l, 12 (iy)
   40AB DD 75 FE      [19]  194 	ld	-2 (ix), l
   40AE DD 36 FF 00   [19]  195 	ld	-1 (ix), #0x00
   40B2 C5            [11]  196 	push	bc
   40B3 FD E1         [14]  197 	pop	iy
   40B5 FD 6E 0A      [19]  198 	ld	l, 10 (iy)
   40B8 DD 75 FC      [19]  199 	ld	-4 (ix), l
   40BB DD 36 FD 00   [19]  200 	ld	-3 (ix), #0x00
   40BF 21 01 00      [10]  201 	ld	hl, #0x0001
   40C2 39            [11]  202 	add	hl, sp
   40C3 DD 75 FA      [19]  203 	ld	-6 (ix), l
   40C6 DD 74 FB      [19]  204 	ld	-5 (ix), h
   40C9 D5            [11]  205 	push	de
   40CA DD 5E FE      [19]  206 	ld	e,-2 (ix)
   40CD DD 56 FF      [19]  207 	ld	d,-1 (ix)
   40D0 D5            [11]  208 	push	de
   40D1 DD 5E FC      [19]  209 	ld	e,-4 (ix)
   40D4 DD 56 FD      [19]  210 	ld	d,-3 (ix)
   40D7 D5            [11]  211 	push	de
   40D8 C5            [11]  212 	push	bc
   40D9 01 17 41      [10]  213 	ld	bc, #___str_2
   40DC C5            [11]  214 	push	bc
   40DD E5            [11]  215 	push	hl
   40DE CD 45 47      [17]  216 	call	_sprintf
   40E1 21 0C 00      [10]  217 	ld	hl, #12
   40E4 39            [11]  218 	add	hl, sp
   40E5 F9            [ 6]  219 	ld	sp, hl
                            220 ;src/main.c:60: if (a == &player) 
   40E6 DD 7E 04      [19]  221 	ld	a, 4 (ix)
   40E9 D6 B2         [ 7]  222 	sub	a, #<(_player)
   40EB 20 0B         [12]  223 	jr	NZ,00102$
   40ED DD 7E 05      [19]  224 	ld	a, 5 (ix)
   40F0 D6 53         [ 7]  225 	sub	a, #>(_player)
   40F2 20 04         [12]  226 	jr	NZ,00102$
                            227 ;src/main.c:61: posy = 0;
   40F4 DD 36 D1 00   [19]  228 	ld	-47 (ix), #0x00
   40F8                     229 00102$:
                            230 ;src/main.c:63: cpct_drawStringM1(temp, cpct_getScreenPtr(CPCT_VMEM_START, 0, posy));
   40F8 DD 7E D1      [19]  231 	ld	a, -47 (ix)
   40FB F5            [11]  232 	push	af
   40FC 33            [ 6]  233 	inc	sp
   40FD AF            [ 4]  234 	xor	a, a
   40FE F5            [11]  235 	push	af
   40FF 33            [ 6]  236 	inc	sp
   4100 21 00 C0      [10]  237 	ld	hl, #0xc000
   4103 E5            [11]  238 	push	hl
   4104 CD E5 47      [17]  239 	call	_cpct_getScreenPtr
   4107 DD 4E FA      [19]  240 	ld	c,-6 (ix)
   410A DD 46 FB      [19]  241 	ld	b,-5 (ix)
   410D E5            [11]  242 	push	hl
   410E C5            [11]  243 	push	bc
   410F CD 33 46      [17]  244 	call	_cpct_drawStringM1
   4112 DD F9         [10]  245 	ld	sp, ix
   4114 DD E1         [14]  246 	pop	ix
   4116 C9            [10]  247 	ret
   4117                     248 ___str_2:
   4117 25 73 20 25 30 32   249 	.ascii "%s %02d. ATTACK: %02d. DEFENSE: %02d"
        64 2E 20 41 54 54
        41 43 4B 3A 20 25
        30 32 64 2E 20 44
        45 46 45 4E 53 45
        3A 20 25 30 32 64
   413B 00                  250 	.db 0x00
                            251 ;src/main.c:67: void showConsole  (void* string) {
                            252 ;	---------------------------------
                            253 ; Function showConsole
                            254 ; ---------------------------------
   413C                     255 _showConsole::
                            256 ;src/main.c:68: if (cursorPrint > 190){
   413C 3E BE         [ 7]  257 	ld	a, #0xbe
   413E FD 21 D0 53   [14]  258 	ld	iy, #_cursorPrint
   4142 FD 96 00      [19]  259 	sub	a, 0 (iy)
   4145 30 12         [12]  260 	jr	NC,00102$
                            261 ;src/main.c:69: cpct_clearScreen(0x00);
   4147 21 00 40      [10]  262 	ld	hl, #0x4000
   414A E5            [11]  263 	push	hl
   414B AF            [ 4]  264 	xor	a, a
   414C F5            [11]  265 	push	af
   414D 33            [ 6]  266 	inc	sp
   414E 26 C0         [ 7]  267 	ld	h, #0xc0
   4150 E5            [11]  268 	push	hl
   4151 CD C6 47      [17]  269 	call	_cpct_memset
                            270 ;src/main.c:70: cursorPrint = 44;
   4154 21 D0 53      [10]  271 	ld	hl,#_cursorPrint + 0
   4157 36 2C         [10]  272 	ld	(hl), #0x2c
   4159                     273 00102$:
                            274 ;src/main.c:73: cpct_drawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 0, cursorPrint));
   4159 3A D0 53      [13]  275 	ld	a, (_cursorPrint)
   415C F5            [11]  276 	push	af
   415D 33            [ 6]  277 	inc	sp
   415E AF            [ 4]  278 	xor	a, a
   415F F5            [11]  279 	push	af
   4160 33            [ 6]  280 	inc	sp
   4161 21 00 C0      [10]  281 	ld	hl, #0xc000
   4164 E5            [11]  282 	push	hl
   4165 CD E5 47      [17]  283 	call	_cpct_getScreenPtr
   4168 D1            [10]  284 	pop	de
   4169 C1            [10]  285 	pop	bc
   416A C5            [11]  286 	push	bc
   416B D5            [11]  287 	push	de
   416C E5            [11]  288 	push	hl
   416D C5            [11]  289 	push	bc
   416E CD 33 46      [17]  290 	call	_cpct_drawStringM1
                            291 ;src/main.c:74: cursorPrint +=8;
   4171 21 D0 53      [10]  292 	ld	hl, #_cursorPrint
   4174 7E            [ 7]  293 	ld	a, (hl)
   4175 C6 08         [ 7]  294 	add	a, #0x08
   4177 77            [ 7]  295 	ld	(hl), a
   4178 C9            [10]  296 	ret
                            297 ;src/main.c:79: void attack(TStats *a, TStats *b) {
                            298 ;	---------------------------------
                            299 ; Function attack
                            300 ; ---------------------------------
   4179                     301 _attack::
   4179 DD E5         [15]  302 	push	ix
   417B DD 21 00 00   [14]  303 	ld	ix,#0
   417F DD 39         [15]  304 	add	ix,sp
   4181 21 D5 FF      [10]  305 	ld	hl, #-43
   4184 39            [11]  306 	add	hl, sp
   4185 F9            [ 6]  307 	ld	sp, hl
                            308 ;src/main.c:82: if (a->attack < b->energy) 
   4186 DD 7E 04      [19]  309 	ld	a, 4 (ix)
   4189 DD 77 FE      [19]  310 	ld	-2 (ix), a
   418C DD 7E 05      [19]  311 	ld	a, 5 (ix)
   418F DD 77 FF      [19]  312 	ld	-1 (ix), a
   4192 DD 7E FE      [19]  313 	ld	a, -2 (ix)
   4195 C6 0C         [ 7]  314 	add	a, #0x0c
   4197 4F            [ 4]  315 	ld	c, a
   4198 DD 7E FF      [19]  316 	ld	a, -1 (ix)
   419B CE 00         [ 7]  317 	adc	a, #0x00
   419D 47            [ 4]  318 	ld	b, a
   419E 0A            [ 7]  319 	ld	a, (bc)
   419F DD 77 FD      [19]  320 	ld	-3 (ix), a
   41A2 DD 5E 06      [19]  321 	ld	e,6 (ix)
   41A5 DD 56 07      [19]  322 	ld	d,7 (ix)
   41A8 21 0A 00      [10]  323 	ld	hl, #0x000a
   41AB 19            [11]  324 	add	hl,de
   41AC EB            [ 4]  325 	ex	de,hl
   41AD 1A            [ 7]  326 	ld	a, (de)
   41AE 6F            [ 4]  327 	ld	l, a
   41AF DD 7E FD      [19]  328 	ld	a, -3 (ix)
   41B2 95            [ 4]  329 	sub	a, l
   41B3 30 07         [12]  330 	jr	NC,00102$
                            331 ;src/main.c:83: b->energy = b->energy - a->attack;
   41B5 7D            [ 4]  332 	ld	a, l
   41B6 DD 96 FD      [19]  333 	sub	a, -3 (ix)
   41B9 12            [ 7]  334 	ld	(de), a
   41BA 18 02         [12]  335 	jr	00103$
   41BC                     336 00102$:
                            337 ;src/main.c:85: b->energy = 0;
   41BC AF            [ 4]  338 	xor	a, a
   41BD 12            [ 7]  339 	ld	(de), a
   41BE                     340 00103$:
                            341 ;src/main.c:87: sprintf(temp, "%s attacks %02d.",a->name, a->attack);
   41BE 0A            [ 7]  342 	ld	a, (bc)
   41BF 4F            [ 4]  343 	ld	c, a
   41C0 06 00         [ 7]  344 	ld	b, #0x00
   41C2 21 00 00      [10]  345 	ld	hl, #0x0000
   41C5 39            [11]  346 	add	hl, sp
   41C6 5D            [ 4]  347 	ld	e, l
   41C7 54            [ 4]  348 	ld	d, h
   41C8 E5            [11]  349 	push	hl
   41C9 C5            [11]  350 	push	bc
   41CA DD 4E FE      [19]  351 	ld	c,-2 (ix)
   41CD DD 46 FF      [19]  352 	ld	b,-1 (ix)
   41D0 C5            [11]  353 	push	bc
   41D1 01 F4 41      [10]  354 	ld	bc, #___str_3
   41D4 C5            [11]  355 	push	bc
   41D5 D5            [11]  356 	push	de
   41D6 CD 45 47      [17]  357 	call	_sprintf
   41D9 21 08 00      [10]  358 	ld	hl, #8
   41DC 39            [11]  359 	add	hl, sp
   41DD F9            [ 6]  360 	ld	sp, hl
   41DE 01 02 00      [10]  361 	ld	bc, #0x0002
   41E1 C5            [11]  362 	push	bc
   41E2 CD 05 48      [17]  363 	call	_cpct_setDrawCharM1
   41E5 CD 3C 41      [17]  364 	call	_showConsole
                            365 ;src/main.c:91: cpct_setDrawCharM1(3, 0);
   41E8 21 03 00      [10]  366 	ld	hl, #0x0003
   41EB E3            [19]  367 	ex	(sp),hl
   41EC CD 05 48      [17]  368 	call	_cpct_setDrawCharM1
   41EF DD F9         [10]  369 	ld	sp, ix
   41F1 DD E1         [14]  370 	pop	ix
   41F3 C9            [10]  371 	ret
   41F4                     372 ___str_3:
   41F4 25 73 20 61 74 74   373 	.ascii "%s attacks %02d."
        61 63 6B 73 20 25
        30 32 64 2E
   4204 00                  374 	.db 0x00
                            375 ;src/main.c:94: void defense(TStats *a) {
                            376 ;	---------------------------------
                            377 ; Function defense
                            378 ; ---------------------------------
   4205                     379 _defense::
   4205 DD E5         [15]  380 	push	ix
   4207 DD 21 00 00   [14]  381 	ld	ix,#0
   420B DD 39         [15]  382 	add	ix,sp
   420D 21 D5 FF      [10]  383 	ld	hl, #-43
   4210 39            [11]  384 	add	hl, sp
   4211 F9            [ 6]  385 	ld	sp, hl
                            386 ;src/main.c:97: healed = 0;
   4212 DD 36 D5 00   [19]  387 	ld	-43 (ix), #0x00
                            388 ;src/main.c:98: if (a->energy + a->defense < a->max_energy)
   4216 DD 4E 04      [19]  389 	ld	c,4 (ix)
   4219 DD 46 05      [19]  390 	ld	b,5 (ix)
   421C FD 21 0A 00   [14]  391 	ld	iy, #0x000a
   4220 FD 09         [15]  392 	add	iy, bc
   4222 FD 7E 00      [19]  393 	ld	a, 0 (iy)
   4225 DD 77 FF      [19]  394 	ld	-1 (ix), a
   4228 5F            [ 4]  395 	ld	e, a
   4229 16 00         [ 7]  396 	ld	d, #0x00
   422B 69            [ 4]  397 	ld	l, c
   422C 60            [ 4]  398 	ld	h, b
   422D C5            [11]  399 	push	bc
   422E 01 0D 00      [10]  400 	ld	bc, #0x000d
   4231 09            [11]  401 	add	hl, bc
   4232 C1            [10]  402 	pop	bc
   4233 7E            [ 7]  403 	ld	a, (hl)
   4234 DD 77 FE      [19]  404 	ld	-2 (ix), a
   4237 6F            [ 4]  405 	ld	l, a
   4238 26 00         [ 7]  406 	ld	h, #0x00
   423A 19            [11]  407 	add	hl,de
   423B EB            [ 4]  408 	ex	de,hl
   423C 69            [ 4]  409 	ld	l, c
   423D 60            [ 4]  410 	ld	h, b
   423E C5            [11]  411 	push	bc
   423F 01 0B 00      [10]  412 	ld	bc, #0x000b
   4242 09            [11]  413 	add	hl, bc
   4243 C1            [10]  414 	pop	bc
   4244 6E            [ 7]  415 	ld	l, (hl)
   4245 26 00         [ 7]  416 	ld	h, #0x00
   4247 7B            [ 4]  417 	ld	a, e
   4248 95            [ 4]  418 	sub	a, l
   4249 7A            [ 4]  419 	ld	a, d
   424A 9C            [ 4]  420 	sbc	a, h
   424B E2 50 42      [10]  421 	jp	PO, 00109$
   424E EE 80         [ 7]  422 	xor	a, #0x80
   4250                     423 00109$:
   4250 F2 59 42      [10]  424 	jp	P, 00102$
                            425 ;src/main.c:99: healed = a->defense;
   4253 DD 5E FE      [19]  426 	ld	e, -2 (ix)
   4256 DD 73 D5      [19]  427 	ld	-43 (ix), e
   4259                     428 00102$:
                            429 ;src/main.c:101: a->energy = a->energy + healed;
   4259 DD 7E FF      [19]  430 	ld	a, -1 (ix)
   425C DD 86 D5      [19]  431 	add	a, -43 (ix)
   425F FD 77 00      [19]  432 	ld	0 (iy), a
                            433 ;src/main.c:103: sprintf(temp, "%s heals %02d.",a->name, healed);
   4262 DD 5E D5      [19]  434 	ld	e, -43 (ix)
   4265 16 00         [ 7]  435 	ld	d, #0x00
   4267 21 01 00      [10]  436 	ld	hl, #0x0001
   426A 39            [11]  437 	add	hl, sp
   426B E5            [11]  438 	push	hl
   426C FD E1         [14]  439 	pop	iy
   426E E5            [11]  440 	push	hl
   426F D5            [11]  441 	push	de
   4270 C5            [11]  442 	push	bc
   4271 01 95 42      [10]  443 	ld	bc, #___str_4
   4274 C5            [11]  444 	push	bc
   4275 FD E5         [15]  445 	push	iy
   4277 CD 45 47      [17]  446 	call	_sprintf
   427A 21 08 00      [10]  447 	ld	hl, #8
   427D 39            [11]  448 	add	hl, sp
   427E F9            [ 6]  449 	ld	sp, hl
   427F 01 01 00      [10]  450 	ld	bc, #0x0001
   4282 C5            [11]  451 	push	bc
   4283 CD 05 48      [17]  452 	call	_cpct_setDrawCharM1
   4286 CD 3C 41      [17]  453 	call	_showConsole
                            454 ;src/main.c:107: cpct_setDrawCharM1(3, 0);
   4289 21 03 00      [10]  455 	ld	hl, #0x0003
   428C E3            [19]  456 	ex	(sp),hl
   428D CD 05 48      [17]  457 	call	_cpct_setDrawCharM1
   4290 DD F9         [10]  458 	ld	sp, ix
   4292 DD E1         [14]  459 	pop	ix
   4294 C9            [10]  460 	ret
   4295                     461 ___str_4:
   4295 25 73 20 68 65 61   462 	.ascii "%s heals %02d."
        6C 73 20 25 30 32
        64 2E
   42A3 00                  463 	.db 0x00
                            464 ;src/main.c:111: void game(){
                            465 ;	---------------------------------
                            466 ; Function game
                            467 ; ---------------------------------
   42A4                     468 _game::
   42A4 DD E5         [15]  469 	push	ix
   42A6 DD 21 00 00   [14]  470 	ld	ix,#0
   42AA DD 39         [15]  471 	add	ix,sp
   42AC 3B            [ 6]  472 	dec	sp
                            473 ;src/main.c:112: while (player.energy) {
   42AD                     474 00134$:
   42AD 3A BC 53      [13]  475 	ld	a,(#(_player + 0x000a) + 0)
   42B0 B7            [ 4]  476 	or	a, a
   42B1 CA 5C 44      [10]  477 	jp	Z, 00137$
                            478 ;src/main.c:113: cpct_clearScreen(0x00);
   42B4 21 00 40      [10]  479 	ld	hl, #0x4000
   42B7 E5            [11]  480 	push	hl
   42B8 AF            [ 4]  481 	xor	a, a
   42B9 F5            [11]  482 	push	af
   42BA 33            [ 6]  483 	inc	sp
   42BB 26 C0         [ 7]  484 	ld	h, #0xc0
   42BD E5            [11]  485 	push	hl
   42BE CD C6 47      [17]  486 	call	_cpct_memset
                            487 ;src/main.c:114: cursorPrint = 44;
   42C1 21 D0 53      [10]  488 	ld	hl,#_cursorPrint + 0
   42C4 36 2C         [10]  489 	ld	(hl), #0x2c
                            490 ;src/main.c:115: if (!goblin.energy) {
   42C6 3A CB 53      [13]  491 	ld	a, (#(_goblin + 0x000a) + 0)
   42C9 B7            [ 4]  492 	or	a, a
   42CA 20 0B         [12]  493 	jr	NZ,00102$
                            494 ;src/main.c:116: initGoblin();
   42CC CD 59 40      [17]  495 	call	_initGoblin
                            496 ;src/main.c:117: showConsole("A GOBLIN APPEARS.");
   42CF 21 60 44      [10]  497 	ld	hl, #___str_5
   42D2 E5            [11]  498 	push	hl
   42D3 CD 3C 41      [17]  499 	call	_showConsole
   42D6 F1            [10]  500 	pop	af
   42D7                     501 00102$:
                            502 ;src/main.c:121: printStats(&player);
   42D7 21 B2 53      [10]  503 	ld	hl, #_player
   42DA E5            [11]  504 	push	hl
   42DB CD 86 40      [17]  505 	call	_printStats
                            506 ;src/main.c:122: printStats(&goblin);
   42DE 21 C1 53      [10]  507 	ld	hl, #_goblin
   42E1 E3            [19]  508 	ex	(sp),hl
   42E2 CD 86 40      [17]  509 	call	_printStats
   42E5 F1            [10]  510 	pop	af
                            511 ;src/main.c:123: cpct_drawStringM1("========================================", cpct_getScreenPtr(CPCT_VMEM_START, 0, 36));
   42E6 21 00 24      [10]  512 	ld	hl, #0x2400
   42E9 E5            [11]  513 	push	hl
   42EA 26 C0         [ 7]  514 	ld	h, #0xc0
   42EC E5            [11]  515 	push	hl
   42ED CD E5 47      [17]  516 	call	_cpct_getScreenPtr
   42F0 E5            [11]  517 	push	hl
   42F1 21 72 44      [10]  518 	ld	hl, #___str_6
   42F4 E5            [11]  519 	push	hl
   42F5 CD 33 46      [17]  520 	call	_cpct_drawStringM1
                            521 ;src/main.c:126: cpct_drawStringM1("@", cpct_getScreenPtr(CPCT_VMEM_START, (player.pos_x)*2, 28));
   42F8 3A C0 53      [13]  522 	ld	a, (#(_player + 0x000e) + 0)
   42FB 87            [ 4]  523 	add	a, a
   42FC 47            [ 4]  524 	ld	b, a
   42FD 3E 1C         [ 7]  525 	ld	a, #0x1c
   42FF F5            [11]  526 	push	af
   4300 33            [ 6]  527 	inc	sp
   4301 C5            [11]  528 	push	bc
   4302 33            [ 6]  529 	inc	sp
   4303 21 00 C0      [10]  530 	ld	hl, #0xc000
   4306 E5            [11]  531 	push	hl
   4307 CD E5 47      [17]  532 	call	_cpct_getScreenPtr
   430A E5            [11]  533 	push	hl
   430B 21 9B 44      [10]  534 	ld	hl, #___str_7
   430E E5            [11]  535 	push	hl
   430F CD 33 46      [17]  536 	call	_cpct_drawStringM1
                            537 ;src/main.c:128: cpct_drawStringM1("G", cpct_getScreenPtr(CPCT_VMEM_START, (goblin.pos_x)*2, 28));
   4312 3A CF 53      [13]  538 	ld	a, (#(_goblin + 0x000e) + 0)
   4315 87            [ 4]  539 	add	a, a
   4316 47            [ 4]  540 	ld	b, a
   4317 3E 1C         [ 7]  541 	ld	a, #0x1c
   4319 F5            [11]  542 	push	af
   431A 33            [ 6]  543 	inc	sp
   431B C5            [11]  544 	push	bc
   431C 33            [ 6]  545 	inc	sp
   431D 21 00 C0      [10]  546 	ld	hl, #0xc000
   4320 E5            [11]  547 	push	hl
   4321 CD E5 47      [17]  548 	call	_cpct_getScreenPtr
   4324 E5            [11]  549 	push	hl
   4325 21 9D 44      [10]  550 	ld	hl, #___str_8
   4328 E5            [11]  551 	push	hl
   4329 CD 33 46      [17]  552 	call	_cpct_drawStringM1
                            553 ;src/main.c:133: showConsole("ACTION (O/P/D)?");
   432C 21 9F 44      [10]  554 	ld	hl, #___str_9
   432F E5            [11]  555 	push	hl
   4330 CD 3C 41      [17]  556 	call	_showConsole
   4333 F1            [10]  557 	pop	af
                            558 ;src/main.c:134: do 
   4334                     559 00105$:
                            560 ;src/main.c:135: cpct_scanKeyboard_f();
   4334 CD BD 45      [17]  561 	call	_cpct_scanKeyboard_f
                            562 ;src/main.c:136: while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_D));
   4337 21 04 04      [10]  563 	ld	hl, #0x0404
   433A CD B1 45      [17]  564 	call	_cpct_isKeyPressed
   433D 7D            [ 4]  565 	ld	a, l
   433E B7            [ 4]  566 	or	a, a
   433F 20 14         [12]  567 	jr	NZ,00107$
   4341 21 03 08      [10]  568 	ld	hl, #0x0803
   4344 CD B1 45      [17]  569 	call	_cpct_isKeyPressed
   4347 7D            [ 4]  570 	ld	a, l
   4348 B7            [ 4]  571 	or	a, a
   4349 20 0A         [12]  572 	jr	NZ,00107$
   434B 21 07 20      [10]  573 	ld	hl, #0x2007
   434E CD B1 45      [17]  574 	call	_cpct_isKeyPressed
   4351 7D            [ 4]  575 	ld	a, l
   4352 B7            [ 4]  576 	or	a, a
   4353 28 DF         [12]  577 	jr	Z,00105$
   4355                     578 00107$:
                            579 ;src/main.c:139: cpct_drawStringM1(" ", cpct_getScreenPtr(CPCT_VMEM_START, (player.pos_x)*2, 28));
   4355 3A C0 53      [13]  580 	ld	a, (#(_player + 0x000e) + 0)
   4358 87            [ 4]  581 	add	a, a
   4359 47            [ 4]  582 	ld	b, a
   435A 3E 1C         [ 7]  583 	ld	a, #0x1c
   435C F5            [11]  584 	push	af
   435D 33            [ 6]  585 	inc	sp
   435E C5            [11]  586 	push	bc
   435F 33            [ 6]  587 	inc	sp
   4360 21 00 C0      [10]  588 	ld	hl, #0xc000
   4363 E5            [11]  589 	push	hl
   4364 CD E5 47      [17]  590 	call	_cpct_getScreenPtr
   4367 E5            [11]  591 	push	hl
   4368 21 AF 44      [10]  592 	ld	hl, #___str_10
   436B E5            [11]  593 	push	hl
   436C CD 33 46      [17]  594 	call	_cpct_drawStringM1
                            595 ;src/main.c:141: if (cpct_isKeyPressed(Key_O)) {
   436F 21 04 04      [10]  596 	ld	hl, #0x0404
   4372 CD B1 45      [17]  597 	call	_cpct_isKeyPressed
   4375 7D            [ 4]  598 	ld	a, l
   4376 B7            [ 4]  599 	or	a, a
   4377 28 0E         [12]  600 	jr	Z,00111$
                            601 ;src/main.c:142: player.pos_x--;
   4379 3A C0 53      [13]  602 	ld	a, (#(_player + 0x000e) + 0)
   437C C6 FF         [ 7]  603 	add	a, #0xff
   437E 21 C0 53      [10]  604 	ld	hl, #(_player + 0x000e)
   4381 77            [ 7]  605 	ld	(hl), a
                            606 ;src/main.c:143: if (!player.pos_x)
   4382 B7            [ 4]  607 	or	a, a
   4383 20 02         [12]  608 	jr	NZ,00111$
                            609 ;src/main.c:144: player.pos_x = 1;
   4385 36 01         [10]  610 	ld	(hl), #0x01
   4387                     611 00111$:
                            612 ;src/main.c:147: if (cpct_isKeyPressed(Key_P)) {
   4387 21 03 08      [10]  613 	ld	hl, #0x0803
   438A CD B1 45      [17]  614 	call	_cpct_isKeyPressed
   438D 7D            [ 4]  615 	ld	a, l
   438E B7            [ 4]  616 	or	a, a
   438F 28 35         [12]  617 	jr	Z,00117$
                            618 ;src/main.c:148: player.pos_x++;
   4391 3A C0 53      [13]  619 	ld	a,(#(_player + 0x000e) + 0)
   4394 DD 77 FF      [19]  620 	ld	-1 (ix), a
   4397 DD 34 FF      [23]  621 	inc	-1 (ix)
   439A 21 C0 53      [10]  622 	ld	hl, #(_player + 0x000e)
   439D DD 7E FF      [19]  623 	ld	a, -1 (ix)
   43A0 77            [ 7]  624 	ld	(hl), a
                            625 ;src/main.c:149: if (player.pos_x == 40)
   43A1 DD 7E FF      [19]  626 	ld	a, -1 (ix)
   43A4 D6 28         [ 7]  627 	sub	a, #0x28
   43A6 20 02         [12]  628 	jr	NZ,00113$
                            629 ;src/main.c:150: player.pos_x = 39;
   43A8 36 27         [10]  630 	ld	(hl), #0x27
   43AA                     631 00113$:
                            632 ;src/main.c:126: cpct_drawStringM1("@", cpct_getScreenPtr(CPCT_VMEM_START, (player.pos_x)*2, 28));
   43AA 21 C0 53      [10]  633 	ld	hl, #(_player + 0x000e) + 0
   43AD 4E            [ 7]  634 	ld	c, (hl)
                            635 ;src/main.c:151: if (player.pos_x == goblin.pos_x) {
   43AE 3A CF 53      [13]  636 	ld	a, (#(_goblin + 0x000e) + 0)
   43B1 91            [ 4]  637 	sub	a, c
   43B2 20 12         [12]  638 	jr	NZ,00117$
                            639 ;src/main.c:152: player.pos_x--;
   43B4 0D            [ 4]  640 	dec	c
   43B5 21 C0 53      [10]  641 	ld	hl, #(_player + 0x000e)
   43B8 71            [ 7]  642 	ld	(hl), c
                            643 ;src/main.c:153: attack(&player, &goblin);
   43B9 21 C1 53      [10]  644 	ld	hl, #_goblin
   43BC E5            [11]  645 	push	hl
   43BD 21 B2 53      [10]  646 	ld	hl, #_player
   43C0 E5            [11]  647 	push	hl
   43C1 CD 79 41      [17]  648 	call	_attack
   43C4 F1            [10]  649 	pop	af
   43C5 F1            [10]  650 	pop	af
   43C6                     651 00117$:
                            652 ;src/main.c:158: if (cpct_isKeyPressed(Key_D)) {
   43C6 21 07 20      [10]  653 	ld	hl, #0x2007
   43C9 CD B1 45      [17]  654 	call	_cpct_isKeyPressed
   43CC 7D            [ 4]  655 	ld	a, l
   43CD B7            [ 4]  656 	or	a, a
   43CE 28 08         [12]  657 	jr	Z,00119$
                            658 ;src/main.c:159: defense(&player);
   43D0 21 B2 53      [10]  659 	ld	hl, #_player
   43D3 E5            [11]  660 	push	hl
   43D4 CD 05 42      [17]  661 	call	_defense
   43D7 F1            [10]  662 	pop	af
   43D8                     663 00119$:
                            664 ;src/main.c:163: cpct_drawStringM1("@", cpct_getScreenPtr(CPCT_VMEM_START, (player.pos_x)*2, 28));
   43D8 3A C0 53      [13]  665 	ld	a, (#(_player + 0x000e) + 0)
   43DB 87            [ 4]  666 	add	a, a
   43DC 47            [ 4]  667 	ld	b, a
   43DD 3E 1C         [ 7]  668 	ld	a, #0x1c
   43DF F5            [11]  669 	push	af
   43E0 33            [ 6]  670 	inc	sp
   43E1 C5            [11]  671 	push	bc
   43E2 33            [ 6]  672 	inc	sp
   43E3 21 00 C0      [10]  673 	ld	hl, #0xc000
   43E6 E5            [11]  674 	push	hl
   43E7 CD E5 47      [17]  675 	call	_cpct_getScreenPtr
   43EA E5            [11]  676 	push	hl
   43EB 21 9B 44      [10]  677 	ld	hl, #___str_7
   43EE E5            [11]  678 	push	hl
   43EF CD 33 46      [17]  679 	call	_cpct_drawStringM1
                            680 ;src/main.c:167: if (goblin.energy) {
   43F2 3A CB 53      [13]  681 	ld	a,(#(_goblin + 0x000a) + 0)
   43F5 B7            [ 4]  682 	or	a, a
   43F6 28 2D         [12]  683 	jr	Z,00124$
                            684 ;src/main.c:168: if (abs(goblin.pos_x - player.pos_x) == 1) //attack
   43F8 21 CF 53      [10]  685 	ld	hl, #(_goblin + 0x000e) + 0
   43FB 4E            [ 7]  686 	ld	c, (hl)
   43FC 21 C0 53      [10]  687 	ld	hl, #(_player + 0x000e) + 0
   43FF 46            [ 7]  688 	ld	b, (hl)
   4400 79            [ 4]  689 	ld	a, c
   4401 90            [ 4]  690 	sub	a, b
   4402 47            [ 4]  691 	ld	b, a
   4403 C5            [11]  692 	push	bc
   4404 33            [ 6]  693 	inc	sp
   4405 CD 00 40      [17]  694 	call	_abs
   4408 33            [ 6]  695 	inc	sp
   4409 2D            [ 4]  696 	dec	l
   440A 20 0F         [12]  697 	jr	NZ,00121$
                            698 ;src/main.c:169: attack(&goblin,&player);
   440C 21 B2 53      [10]  699 	ld	hl, #_player
   440F E5            [11]  700 	push	hl
   4410 21 C1 53      [10]  701 	ld	hl, #_goblin
   4413 E5            [11]  702 	push	hl
   4414 CD 79 41      [17]  703 	call	_attack
   4417 F1            [10]  704 	pop	af
   4418 F1            [10]  705 	pop	af
   4419 18 12         [12]  706 	jr	00125$
   441B                     707 00121$:
                            708 ;src/main.c:171: defense(&goblin);
   441B 21 C1 53      [10]  709 	ld	hl, #_goblin
   441E E5            [11]  710 	push	hl
   441F CD 05 42      [17]  711 	call	_defense
   4422 F1            [10]  712 	pop	af
   4423 18 08         [12]  713 	jr	00125$
   4425                     714 00124$:
                            715 ;src/main.c:173: showConsole("YOU KILLED THE GOBLIN.");
   4425 21 B1 44      [10]  716 	ld	hl, #___str_11
   4428 E5            [11]  717 	push	hl
   4429 CD 3C 41      [17]  718 	call	_showConsole
   442C F1            [10]  719 	pop	af
   442D                     720 00125$:
                            721 ;src/main.c:176: if (!player.energy){
   442D 3A BC 53      [13]  722 	ld	a, (#(_player + 0x000a) + 0)
   4430 B7            [ 4]  723 	or	a, a
   4431 20 08         [12]  724 	jr	NZ,00128$
                            725 ;src/main.c:177: showConsole("YOU DIED.");
   4433 21 C8 44      [10]  726 	ld	hl, #___str_12
   4436 E5            [11]  727 	push	hl
   4437 CD 3C 41      [17]  728 	call	_showConsole
   443A F1            [10]  729 	pop	af
                            730 ;src/main.c:180: while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
   443B                     731 00128$:
   443B CD AB 47      [17]  732 	call	_cpct_isAnyKeyPressed_f
   443E 7D            [ 4]  733 	ld	a, l
   443F B7            [ 4]  734 	or	a, a
   4440 28 05         [12]  735 	jr	Z,00130$
                            736 ;src/main.c:181: cpct_scanKeyboard_f();
   4442 CD BD 45      [17]  737 	call	_cpct_scanKeyboard_f
   4445 18 F4         [12]  738 	jr	00128$
   4447                     739 00130$:
                            740 ;src/main.c:184: showConsole("PRESS ANY KEY TO CONTINUE");
   4447 21 D2 44      [10]  741 	ld	hl, #___str_13
   444A E5            [11]  742 	push	hl
   444B CD 3C 41      [17]  743 	call	_showConsole
   444E F1            [10]  744 	pop	af
                            745 ;src/main.c:186: do 
   444F                     746 00131$:
                            747 ;src/main.c:187: cpct_scanKeyboard_f();
   444F CD BD 45      [17]  748 	call	_cpct_scanKeyboard_f
                            749 ;src/main.c:188: while (!cpct_isAnyKeyPressed_f());
   4452 CD AB 47      [17]  750 	call	_cpct_isAnyKeyPressed_f
   4455 7D            [ 4]  751 	ld	a, l
   4456 B7            [ 4]  752 	or	a, a
   4457 28 F6         [12]  753 	jr	Z,00131$
   4459 C3 AD 42      [10]  754 	jp	00134$
   445C                     755 00137$:
   445C 33            [ 6]  756 	inc	sp
   445D DD E1         [14]  757 	pop	ix
   445F C9            [10]  758 	ret
   4460                     759 ___str_5:
   4460 41 20 47 4F 42 4C   760 	.ascii "A GOBLIN APPEARS."
        49 4E 20 41 50 50
        45 41 52 53 2E
   4471 00                  761 	.db 0x00
   4472                     762 ___str_6:
   4472 3D 3D 3D 3D 3D 3D   763 	.ascii "========================================"
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D 3D 3D
        3D 3D 3D 3D
   449A 00                  764 	.db 0x00
   449B                     765 ___str_7:
   449B 40                  766 	.ascii "@"
   449C 00                  767 	.db 0x00
   449D                     768 ___str_8:
   449D 47                  769 	.ascii "G"
   449E 00                  770 	.db 0x00
   449F                     771 ___str_9:
   449F 41 43 54 49 4F 4E   772 	.ascii "ACTION (O/P/D)?"
        20 28 4F 2F 50 2F
        44 29 3F
   44AE 00                  773 	.db 0x00
   44AF                     774 ___str_10:
   44AF 20                  775 	.ascii " "
   44B0 00                  776 	.db 0x00
   44B1                     777 ___str_11:
   44B1 59 4F 55 20 4B 49   778 	.ascii "YOU KILLED THE GOBLIN."
        4C 4C 45 44 20 54
        48 45 20 47 4F 42
        4C 49 4E 2E
   44C7 00                  779 	.db 0x00
   44C8                     780 ___str_12:
   44C8 59 4F 55 20 44 49   781 	.ascii "YOU DIED."
        45 44 2E
   44D1 00                  782 	.db 0x00
   44D2                     783 ___str_13:
   44D2 50 52 45 53 53 20   784 	.ascii "PRESS ANY KEY TO CONTINUE"
        41 4E 59 20 4B 45
        59 20 54 4F 20 43
        4F 4E 54 49 4E 55
        45
   44EB 00                  785 	.db 0x00
                            786 ;src/main.c:192: void main(void) {
                            787 ;	---------------------------------
                            788 ; Function main
                            789 ; ---------------------------------
   44EC                     790 _main::
                            791 ;src/main.c:196: cpct_disableFirmware();
   44EC CD D4 47      [17]  792 	call	_cpct_disableFirmware
                            793 ;src/main.c:199: while (1) {
   44EF                     794 00107$:
                            795 ;src/main.c:200: cpct_setVideoMode(1);
   44EF 2E 01         [ 7]  796 	ld	l, #0x01
   44F1 CD 9D 47      [17]  797 	call	_cpct_setVideoMode
                            798 ;src/main.c:201: cpct_clearScreen(0x00);
   44F4 21 00 40      [10]  799 	ld	hl, #0x4000
   44F7 E5            [11]  800 	push	hl
   44F8 AF            [ 4]  801 	xor	a, a
   44F9 F5            [11]  802 	push	af
   44FA 33            [ 6]  803 	inc	sp
   44FB 26 C0         [ 7]  804 	ld	h, #0xc0
   44FD E5            [11]  805 	push	hl
   44FE CD C6 47      [17]  806 	call	_cpct_memset
                            807 ;src/main.c:202: cpct_setPalette(paletaM1,4);
   4501 21 04 00      [10]  808 	ld	hl, #0x0004
   4504 E5            [11]  809 	push	hl
   4505 21 28 40      [10]  810 	ld	hl, #_paletaM1
   4508 E5            [11]  811 	push	hl
   4509 CD 9A 45      [17]  812 	call	_cpct_setPalette
                            813 ;src/main.c:203: cpct_setBorder(HW_BLACK);
   450C 21 10 14      [10]  814 	ld	hl, #0x1410
   450F E5            [11]  815 	push	hl
   4510 CD 27 46      [17]  816 	call	_cpct_setPALColour
                            817 ;src/main.c:206: cpct_setDrawCharM1(3, 0);
   4513 21 03 00      [10]  818 	ld	hl, #0x0003
   4516 E5            [11]  819 	push	hl
   4517 CD 05 48      [17]  820 	call	_cpct_setDrawCharM1
                            821 ;src/main.c:207: cpct_drawStringM1("RPG GAME", cpct_getScreenPtr(CPCT_VMEM_START, 0, 0));
   451A 21 00 00      [10]  822 	ld	hl, #0x0000
   451D E5            [11]  823 	push	hl
   451E 26 C0         [ 7]  824 	ld	h, #0xc0
   4520 E5            [11]  825 	push	hl
   4521 CD E5 47      [17]  826 	call	_cpct_getScreenPtr
   4524 01 7A 45      [10]  827 	ld	bc, #___str_14+0
   4527 E5            [11]  828 	push	hl
   4528 C5            [11]  829 	push	bc
   4529 CD 33 46      [17]  830 	call	_cpct_drawStringM1
                            831 ;src/main.c:208: cpct_drawStringM1("PRESS ANY KEY TO START", cpct_getScreenPtr(CPCT_VMEM_START, 0, 20));
   452C 21 00 14      [10]  832 	ld	hl, #0x1400
   452F E5            [11]  833 	push	hl
   4530 26 C0         [ 7]  834 	ld	h, #0xc0
   4532 E5            [11]  835 	push	hl
   4533 CD E5 47      [17]  836 	call	_cpct_getScreenPtr
   4536 01 83 45      [10]  837 	ld	bc, #___str_15+0
   4539 E5            [11]  838 	push	hl
   453A C5            [11]  839 	push	bc
   453B CD 33 46      [17]  840 	call	_cpct_drawStringM1
                            841 ;src/main.c:212: do {
   453E 26 00         [ 7]  842 	ld	h, #0x00
   4540                     843 00101$:
                            844 ;src/main.c:213: cpct_scanKeyboard_f();
   4540 E5            [11]  845 	push	hl
   4541 CD BD 45      [17]  846 	call	_cpct_scanKeyboard_f
   4544 E1            [10]  847 	pop	hl
                            848 ;src/main.c:214: semilla++;
   4545 24            [ 4]  849 	inc	h
                            850 ;src/main.c:216: while (!cpct_isAnyKeyPressed_f());
   4546 E5            [11]  851 	push	hl
   4547 CD AB 47      [17]  852 	call	_cpct_isAnyKeyPressed_f
   454A 7D            [ 4]  853 	ld	a, l
   454B E1            [10]  854 	pop	hl
   454C B7            [ 4]  855 	or	a, a
   454D 28 F1         [12]  856 	jr	Z,00101$
                            857 ;src/main.c:217: cpct_clearScreen(0x00);
   454F 6C            [ 4]  858 	ld	l, h
   4550 E5            [11]  859 	push	hl
   4551 01 00 40      [10]  860 	ld	bc, #0x4000
   4554 C5            [11]  861 	push	bc
   4555 AF            [ 4]  862 	xor	a, a
   4556 F5            [11]  863 	push	af
   4557 33            [ 6]  864 	inc	sp
   4558 01 00 C0      [10]  865 	ld	bc, #0xc000
   455B C5            [11]  866 	push	bc
   455C CD C6 47      [17]  867 	call	_cpct_memset
   455F E1            [10]  868 	pop	hl
                            869 ;src/main.c:220: if (!semilla)
   4560 7C            [ 4]  870 	ld	a, h
   4561 B7            [ 4]  871 	or	a, a
   4562 20 02         [12]  872 	jr	NZ,00105$
                            873 ;src/main.c:221: semilla = 1;
   4564 2E 01         [ 7]  874 	ld	l, #0x01
   4566                     875 00105$:
                            876 ;src/main.c:223: cpct_srand8(semilla);
   4566 26 00         [ 7]  877 	ld	h, #0x00
   4568 11 00 00      [10]  878 	ld	de,#0x0000
   456B CD BD 46      [17]  879 	call	_cpct_setSeed_mxor
   456E CD C5 46      [17]  880 	call	_cpct_restoreState_mxor_u8
                            881 ;src/main.c:224: initPlayer();
   4571 CD 2C 40      [17]  882 	call	_initPlayer
                            883 ;src/main.c:225: game();
   4574 CD A4 42      [17]  884 	call	_game
   4577 C3 EF 44      [10]  885 	jp	00107$
   457A                     886 ___str_14:
   457A 52 50 47 20 47 41   887 	.ascii "RPG GAME"
        4D 45
   4582 00                  888 	.db 0x00
   4583                     889 ___str_15:
   4583 50 52 45 53 53 20   890 	.ascii "PRESS ANY KEY TO START"
        41 4E 59 20 4B 45
        59 20 54 4F 20 53
        54 41 52 54
   4599 00                  891 	.db 0x00
                            892 	.area _CODE
                            893 	.area _INITIALIZER
                            894 	.area _CABS (ABS)
