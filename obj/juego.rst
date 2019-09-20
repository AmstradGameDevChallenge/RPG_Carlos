                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (CYGWIN)
                              4 ;--------------------------------------------------------
                              5 	.module juego
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _juego
                             12 	.globl _turno
                             13 	.globl _defender
                             14 	.globl _atacar
                             15 	.globl _printConsole
                             16 	.globl _printLevel
                             17 	.globl _printStats
                             18 	.globl _initNivel
                             19 	.globl _initPlayer
                             20 	.globl _dibujarEscenario
                             21 	.globl _dibujarMarco
                             22 	.globl _pausaTecladoLibre
                             23 	.globl _pausa
                             24 	.globl _abs
                             25 	.globl _sprintf
                             26 	.globl _cpct_getRandom_mxor_u8
                             27 	.globl _cpct_getScreenPtr
                             28 	.globl _cpct_drawStringM1
                             29 	.globl _cpct_setDrawCharM1
                             30 	.globl _cpct_drawSpriteMasked
                             31 	.globl _cpct_drawSprite
                             32 	.globl _cpct_drawSolidBox
                             33 	.globl _cpct_px2byteM1
                             34 	.globl _cpct_isAnyKeyPressed_f
                             35 	.globl _cpct_isKeyPressed
                             36 	.globl _cpct_scanKeyboard_f
                             37 	.globl _cpct_memset
                             38 	.globl _cursorConsola
                             39 ;--------------------------------------------------------
                             40 ; special function registers
                             41 ;--------------------------------------------------------
                             42 ;--------------------------------------------------------
                             43 ; ram data
                             44 ;--------------------------------------------------------
                             45 	.area _DATA
   614C                      46 _cursorConsola::
   614C                      47 	.ds 1
                             48 ;--------------------------------------------------------
                             49 ; ram data
                             50 ;--------------------------------------------------------
                             51 	.area _INITIALIZED
                             52 ;--------------------------------------------------------
                             53 ; absolute external ram data
                             54 ;--------------------------------------------------------
                             55 	.area _DABS (ABS)
                             56 ;--------------------------------------------------------
                             57 ; global & static initialisations
                             58 ;--------------------------------------------------------
                             59 	.area _HOME
                             60 	.area _GSINIT
                             61 	.area _GSFINAL
                             62 	.area _GSINIT
                             63 ;--------------------------------------------------------
                             64 ; Home
                             65 ;--------------------------------------------------------
                             66 	.area _HOME
                             67 	.area _HOME
                             68 ;--------------------------------------------------------
                             69 ; code
                             70 ;--------------------------------------------------------
                             71 	.area _CODE
                             72 ;src/juego.c:11: u8 abs (i8 valor){
                             73 ;	---------------------------------
                             74 ; Function abs
                             75 ; ---------------------------------
   438F                      76 _abs::
                             77 ;src/juego.c:12: return (valor > 0 ? valor : -valor);
   438F AF            [ 4]   78 	xor	a, a
   4390 FD 21 02 00   [14]   79 	ld	iy, #2
   4394 FD 39         [15]   80 	add	iy, sp
   4396 FD 96 00      [19]   81 	sub	a, 0 (iy)
   4399 E2 9E 43      [10]   82 	jp	PO, 00109$
   439C EE 80         [ 7]   83 	xor	a, #0x80
   439E                      84 00109$:
   439E F2 AB 43      [10]   85 	jp	P, 00103$
   43A1 FD 21 02 00   [14]   86 	ld	iy, #2
   43A5 FD 39         [15]   87 	add	iy, sp
   43A7 FD 6E 00      [19]   88 	ld	l, 0 (iy)
   43AA C9            [10]   89 	ret
   43AB                      90 00103$:
   43AB AF            [ 4]   91 	xor	a, a
   43AC FD 21 02 00   [14]   92 	ld	iy, #2
   43B0 FD 39         [15]   93 	add	iy, sp
   43B2 FD 96 00      [19]   94 	sub	a, 0 (iy)
   43B5 6F            [ 4]   95 	ld	l, a
   43B6 C9            [10]   96 	ret
                             97 ;src/juego.c:15: void pausa() {
                             98 ;	---------------------------------
                             99 ; Function pausa
                            100 ; ---------------------------------
   43B7                     101 _pausa::
                            102 ;src/juego.c:18: for (i = 0; i < 32768 /*16384*/; i++)
   43B7 01 00 80      [10]  103 	ld	bc, #0x8000
   43BA                     104 00104$:
   43BA 59            [ 4]  105 	ld	e, c
   43BB 50            [ 4]  106 	ld	d, b
   43BC 1B            [ 6]  107 	dec	de
   43BD 4B            [ 4]  108 	ld	c, e
   43BE 7A            [ 4]  109 	ld	a,d
   43BF 47            [ 4]  110 	ld	b,a
   43C0 B3            [ 4]  111 	or	a,e
   43C1 20 F7         [12]  112 	jr	NZ,00104$
   43C3 C9            [10]  113 	ret
                            114 ;src/juego.c:22: void pausaTecladoLibre(){
                            115 ;	---------------------------------
                            116 ; Function pausaTecladoLibre
                            117 ; ---------------------------------
   43C4                     118 _pausaTecladoLibre::
                            119 ;src/juego.c:23: while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
   43C4                     120 00101$:
   43C4 CD 0F 54      [17]  121 	call	_cpct_isAnyKeyPressed_f
   43C7 7D            [ 4]  122 	ld	a, l
   43C8 B7            [ 4]  123 	or	a, a
   43C9 C8            [11]  124 	ret	Z
                            125 ;src/juego.c:24: cpct_scanKeyboard_f();
   43CA CD F5 50      [17]  126 	call	_cpct_scanKeyboard_f
   43CD 18 F5         [12]  127 	jr	00101$
                            128 ;src/juego.c:28: void dibujarMarco (){
                            129 ;	---------------------------------
                            130 ; Function dibujarMarco
                            131 ; ---------------------------------
   43CF                     132 _dibujarMarco::
   43CF DD E5         [15]  133 	push	ix
   43D1 DD 21 00 00   [14]  134 	ld	ix,#0
   43D5 DD 39         [15]  135 	add	ix,sp
   43D7 F5            [11]  136 	push	af
                            137 ;src/juego.c:33: tile = (u8*) &G_tile_cruzada[0];
   43D8 DD 36 FE 52   [19]  138 	ld	-2 (ix), #<(_G_tile_cruzada)
   43DC DD 36 FF 50   [19]  139 	ld	-1 (ix), #>(_G_tile_cruzada)
                            140 ;src/juego.c:34: if ((nivel/10) == 1)
   43E0 3E 0A         [ 7]  141 	ld	a, #0x0a
   43E2 F5            [11]  142 	push	af
   43E3 33            [ 6]  143 	inc	sp
   43E4 3A 24 61      [13]  144 	ld	a, (_nivel)
   43E7 F5            [11]  145 	push	af
   43E8 33            [ 6]  146 	inc	sp
   43E9 CD AF 52      [17]  147 	call	__divuchar
   43EC F1            [10]  148 	pop	af
   43ED 2D            [ 4]  149 	dec	l
   43EE 20 08         [12]  150 	jr	NZ,00114$
                            151 ;src/juego.c:35: tile = (u8*) &G_tile_cruzada[0];
   43F0 DD 36 FE 52   [19]  152 	ld	-2 (ix), #<(_G_tile_cruzada)
   43F4 DD 36 FF 50   [19]  153 	ld	-1 (ix), #>(_G_tile_cruzada)
                            154 ;src/juego.c:39: for (i=0; i < 80; i += 4) {
   43F8                     155 00114$:
   43F8 16 00         [ 7]  156 	ld	d, #0x00
   43FA                     157 00107$:
                            158 ;src/juego.c:40: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,   0), 4, 16);
   43FA D5            [11]  159 	push	de
   43FB AF            [ 4]  160 	xor	a, a
   43FC F5            [11]  161 	push	af
   43FD 33            [ 6]  162 	inc	sp
   43FE D5            [11]  163 	push	de
   43FF 33            [ 6]  164 	inc	sp
   4400 21 00 C0      [10]  165 	ld	hl, #0xc000
   4403 E5            [11]  166 	push	hl
   4404 CD 1E 55      [17]  167 	call	_cpct_getScreenPtr
   4407 D1            [10]  168 	pop	de
   4408 E5            [11]  169 	push	hl
   4409 FD E1         [14]  170 	pop	iy
   440B C1            [10]  171 	pop	bc
   440C C5            [11]  172 	push	bc
   440D C5            [11]  173 	push	bc
   440E D5            [11]  174 	push	de
   440F 21 04 10      [10]  175 	ld	hl, #0x1004
   4412 E5            [11]  176 	push	hl
   4413 FD E5         [15]  177 	push	iy
   4415 C5            [11]  178 	push	bc
   4416 CD 9B 51      [17]  179 	call	_cpct_drawSprite
   4419 D1            [10]  180 	pop	de
   441A D5            [11]  181 	push	de
   441B 3E B0         [ 7]  182 	ld	a, #0xb0
   441D F5            [11]  183 	push	af
   441E 33            [ 6]  184 	inc	sp
   441F D5            [11]  185 	push	de
   4420 33            [ 6]  186 	inc	sp
   4421 21 00 C0      [10]  187 	ld	hl, #0xc000
   4424 E5            [11]  188 	push	hl
   4425 CD 1E 55      [17]  189 	call	_cpct_getScreenPtr
   4428 D1            [10]  190 	pop	de
   4429 C1            [10]  191 	pop	bc
   442A E5            [11]  192 	push	hl
   442B FD E1         [14]  193 	pop	iy
   442D C5            [11]  194 	push	bc
   442E D5            [11]  195 	push	de
   442F 21 04 10      [10]  196 	ld	hl, #0x1004
   4432 E5            [11]  197 	push	hl
   4433 FD E5         [15]  198 	push	iy
   4435 C5            [11]  199 	push	bc
   4436 CD 9B 51      [17]  200 	call	_cpct_drawSprite
   4439 D1            [10]  201 	pop	de
   443A D5            [11]  202 	push	de
   443B 3E 30         [ 7]  203 	ld	a, #0x30
   443D F5            [11]  204 	push	af
   443E 33            [ 6]  205 	inc	sp
   443F D5            [11]  206 	push	de
   4440 33            [ 6]  207 	inc	sp
   4441 21 00 C0      [10]  208 	ld	hl, #0xc000
   4444 E5            [11]  209 	push	hl
   4445 CD 1E 55      [17]  210 	call	_cpct_getScreenPtr
   4448 D1            [10]  211 	pop	de
   4449 C1            [10]  212 	pop	bc
   444A E5            [11]  213 	push	hl
   444B FD E1         [14]  214 	pop	iy
   444D C5            [11]  215 	push	bc
   444E D5            [11]  216 	push	de
   444F 21 04 10      [10]  217 	ld	hl, #0x1004
   4452 E5            [11]  218 	push	hl
   4453 FD E5         [15]  219 	push	iy
   4455 C5            [11]  220 	push	bc
   4456 CD 9B 51      [17]  221 	call	_cpct_drawSprite
   4459 D1            [10]  222 	pop	de
   445A C1            [10]  223 	pop	bc
                            224 ;src/juego.c:39: for (i=0; i < 80; i += 4) {
   445B 14            [ 4]  225 	inc	d
   445C 14            [ 4]  226 	inc	d
   445D 14            [ 4]  227 	inc	d
   445E 14            [ 4]  228 	inc	d
   445F 7A            [ 4]  229 	ld	a, d
   4460 D6 50         [ 7]  230 	sub	a, #0x50
   4462 38 96         [12]  231 	jr	C,00107$
                            232 ;src/juego.c:45: for (i=16; i < 176; i += 16 ){
   4464 16 10         [ 7]  233 	ld	d, #0x10
   4466                     234 00109$:
                            235 ;src/juego.c:46: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, 0, i), 4, 16);
   4466 C5            [11]  236 	push	bc
   4467 D5            [11]  237 	push	de
   4468 D5            [11]  238 	push	de
   4469 33            [ 6]  239 	inc	sp
   446A AF            [ 4]  240 	xor	a, a
   446B F5            [11]  241 	push	af
   446C 33            [ 6]  242 	inc	sp
   446D 21 00 C0      [10]  243 	ld	hl, #0xc000
   4470 E5            [11]  244 	push	hl
   4471 CD 1E 55      [17]  245 	call	_cpct_getScreenPtr
   4474 D1            [10]  246 	pop	de
   4475 C1            [10]  247 	pop	bc
   4476 E5            [11]  248 	push	hl
   4477 FD E1         [14]  249 	pop	iy
   4479 C5            [11]  250 	push	bc
   447A D5            [11]  251 	push	de
   447B 21 04 10      [10]  252 	ld	hl, #0x1004
   447E E5            [11]  253 	push	hl
   447F FD E5         [15]  254 	push	iy
   4481 C5            [11]  255 	push	bc
   4482 CD 9B 51      [17]  256 	call	_cpct_drawSprite
   4485 D1            [10]  257 	pop	de
   4486 D5            [11]  258 	push	de
   4487 1E 4C         [ 7]  259 	ld	e, #0x4c
   4489 D5            [11]  260 	push	de
   448A 21 00 C0      [10]  261 	ld	hl, #0xc000
   448D E5            [11]  262 	push	hl
   448E CD 1E 55      [17]  263 	call	_cpct_getScreenPtr
   4491 D1            [10]  264 	pop	de
   4492 C1            [10]  265 	pop	bc
   4493 E5            [11]  266 	push	hl
   4494 FD E1         [14]  267 	pop	iy
   4496 C5            [11]  268 	push	bc
   4497 D5            [11]  269 	push	de
   4498 21 04 10      [10]  270 	ld	hl, #0x1004
   449B E5            [11]  271 	push	hl
   449C FD E5         [15]  272 	push	iy
   449E C5            [11]  273 	push	bc
   449F CD 9B 51      [17]  274 	call	_cpct_drawSprite
   44A2 D1            [10]  275 	pop	de
   44A3 C1            [10]  276 	pop	bc
                            277 ;src/juego.c:48: if (i>63)
   44A4 3E 3F         [ 7]  278 	ld	a, #0x3f
   44A6 92            [ 4]  279 	sub	a, d
   44A7 30 1F         [12]  280 	jr	NC,00110$
                            281 ;src/juego.c:49: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,40, i), 4, 16);
   44A9 C5            [11]  282 	push	bc
   44AA D5            [11]  283 	push	de
   44AB 1E 28         [ 7]  284 	ld	e, #0x28
   44AD D5            [11]  285 	push	de
   44AE 21 00 C0      [10]  286 	ld	hl, #0xc000
   44B1 E5            [11]  287 	push	hl
   44B2 CD 1E 55      [17]  288 	call	_cpct_getScreenPtr
   44B5 D1            [10]  289 	pop	de
   44B6 C1            [10]  290 	pop	bc
   44B7 E5            [11]  291 	push	hl
   44B8 FD E1         [14]  292 	pop	iy
   44BA C5            [11]  293 	push	bc
   44BB D5            [11]  294 	push	de
   44BC 21 04 10      [10]  295 	ld	hl, #0x1004
   44BF E5            [11]  296 	push	hl
   44C0 FD E5         [15]  297 	push	iy
   44C2 C5            [11]  298 	push	bc
   44C3 CD 9B 51      [17]  299 	call	_cpct_drawSprite
   44C6 D1            [10]  300 	pop	de
   44C7 C1            [10]  301 	pop	bc
   44C8                     302 00110$:
                            303 ;src/juego.c:45: for (i=16; i < 176; i += 16 ){
   44C8 7A            [ 4]  304 	ld	a, d
   44C9 C6 10         [ 7]  305 	add	a, #0x10
   44CB 57            [ 4]  306 	ld	d,a
   44CC D6 B0         [ 7]  307 	sub	a, #0xb0
   44CE 38 96         [12]  308 	jr	C,00109$
   44D0 DD F9         [10]  309 	ld	sp, ix
   44D2 DD E1         [14]  310 	pop	ix
   44D4 C9            [10]  311 	ret
                            312 ;src/juego.c:55: void dibujarEscenario(){
                            313 ;	---------------------------------
                            314 ; Function dibujarEscenario
                            315 ; ---------------------------------
   44D5                     316 _dibujarEscenario::
   44D5 DD E5         [15]  317 	push	ix
   44D7 DD 21 00 00   [14]  318 	ld	ix,#0
   44DB DD 39         [15]  319 	add	ix,sp
   44DD F5            [11]  320 	push	af
                            321 ;src/juego.c:60: tile = (u8*) &G_suelo_cruzada_1[0];
   44DE 01 92 50      [10]  322 	ld	bc, #_G_suelo_cruzada_1+0
   44E1 33            [ 6]  323 	inc	sp
   44E2 33            [ 6]  324 	inc	sp
   44E3 C5            [11]  325 	push	bc
                            326 ;src/juego.c:61: if (nivel < 6) {
   44E4 3A 24 61      [13]  327 	ld	a,(#_nivel + 0)
   44E7 D6 06         [ 7]  328 	sub	a, #0x06
   44E9 30 03         [12]  329 	jr	NC,00109$
                            330 ;src/juego.c:62: tile = (u8*) &G_suelo_cruzada_1[0];
   44EB 33            [ 6]  331 	inc	sp
   44EC 33            [ 6]  332 	inc	sp
   44ED C5            [11]  333 	push	bc
                            334 ;src/juego.c:65: for (i=4; i < 40; i+=4) {
   44EE                     335 00109$:
   44EE 06 04         [ 7]  336 	ld	b, #0x04
   44F0                     337 00104$:
                            338 ;src/juego.c:66: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,   160), 4, 16);
   44F0 C5            [11]  339 	push	bc
   44F1 3E A0         [ 7]  340 	ld	a, #0xa0
   44F3 F5            [11]  341 	push	af
   44F4 33            [ 6]  342 	inc	sp
   44F5 C5            [11]  343 	push	bc
   44F6 33            [ 6]  344 	inc	sp
   44F7 21 00 C0      [10]  345 	ld	hl, #0xc000
   44FA E5            [11]  346 	push	hl
   44FB CD 1E 55      [17]  347 	call	_cpct_getScreenPtr
   44FE C1            [10]  348 	pop	bc
   44FF FD E1         [14]  349 	pop	iy
   4501 FD E5         [15]  350 	push	iy
   4503 C5            [11]  351 	push	bc
   4504 11 04 10      [10]  352 	ld	de, #0x1004
   4507 D5            [11]  353 	push	de
   4508 E5            [11]  354 	push	hl
   4509 FD E5         [15]  355 	push	iy
   450B CD 9B 51      [17]  356 	call	_cpct_drawSprite
   450E C1            [10]  357 	pop	bc
                            358 ;src/juego.c:65: for (i=4; i < 40; i+=4) {
   450F 04            [ 4]  359 	inc	b
   4510 04            [ 4]  360 	inc	b
   4511 04            [ 4]  361 	inc	b
   4512 04            [ 4]  362 	inc	b
   4513 78            [ 4]  363 	ld	a, b
   4514 D6 28         [ 7]  364 	sub	a, #0x28
   4516 38 D8         [12]  365 	jr	C,00104$
   4518 DD F9         [10]  366 	ld	sp, ix
   451A DD E1         [14]  367 	pop	ix
   451C C9            [10]  368 	ret
                            369 ;src/juego.c:70: void initPlayer(){
                            370 ;	---------------------------------
                            371 ; Function initPlayer
                            372 ; ---------------------------------
   451D                     373 _initPlayer::
                            374 ;src/juego.c:71: strcpy(entidad[0].name,"Don Mendo");
   451D 11 EB 60      [10]  375 	ld	de, #_entidad
   4520 21 53 45      [10]  376 	ld	hl, #___str_0
   4523 AF            [ 4]  377 	xor	a, a
   4524                     378 00103$:
   4524 BE            [ 7]  379 	cp	a, (hl)
   4525 ED A0         [16]  380 	ldi
   4527 20 FB         [12]  381 	jr	NZ, 00103$
                            382 ;src/juego.c:72: entidad[0].max_energy = 99;
   4529 21 F6 60      [10]  383 	ld	hl, #_entidad + 11
   452C 36 63         [10]  384 	ld	(hl), #0x63
                            385 ;src/juego.c:73: entidad[0].energy = entidad[0].max_energy;
   452E 01 F5 60      [10]  386 	ld	bc, #_entidad + 10
   4531 7E            [ 7]  387 	ld	a, (hl)
   4532 02            [ 7]  388 	ld	(bc), a
                            389 ;src/juego.c:74: entidad[0].attack = 30;
   4533 21 F7 60      [10]  390 	ld	hl, #(_entidad + 0x000c)
   4536 36 1E         [10]  391 	ld	(hl), #0x1e
                            392 ;src/juego.c:75: entidad[0].force = 6;
   4538 21 F8 60      [10]  393 	ld	hl, #(_entidad + 0x000d)
   453B 36 06         [10]  394 	ld	(hl), #0x06
                            395 ;src/juego.c:76: entidad[0].defense = 15;
   453D 21 F9 60      [10]  396 	ld	hl, #(_entidad + 0x000e)
   4540 36 0F         [10]  397 	ld	(hl), #0x0f
                            398 ;src/juego.c:77: entidad[0].pos_x = 8;
   4542 21 FA 60      [10]  399 	ld	hl, #(_entidad + 0x000f)
   4545 36 08         [10]  400 	ld	(hl), #0x08
                            401 ;src/juego.c:78: entidad[0].pos_y = 24;
   4547 21 FB 60      [10]  402 	ld	hl, #(_entidad + 0x0010)
   454A 36 18         [10]  403 	ld	(hl), #0x18
                            404 ;src/juego.c:79: entidad[0].sprite = (u8*) &G_mendo[0];
   454C 21 92 4E      [10]  405 	ld	hl, #_G_mendo
   454F 22 FC 60      [16]  406 	ld	((_entidad + 0x0011)), hl
   4552 C9            [10]  407 	ret
   4553                     408 ___str_0:
   4553 44 6F 6E 20 4D 65   409 	.ascii "Don Mendo"
        6E 64 6F
   455C 00                  410 	.db 0x00
                            411 ;src/juego.c:82: void initNivel(){
                            412 ;	---------------------------------
                            413 ; Function initNivel
                            414 ; ---------------------------------
   455D                     415 _initNivel::
                            416 ;src/juego.c:84: entidad[1].max_energy = 0;
   455D 01 09 61      [10]  417 	ld	bc, #_entidad + 30
   4560 AF            [ 4]  418 	xor	a, a
   4561 02            [ 7]  419 	ld	(bc), a
                            420 ;src/juego.c:85: entidad[2].max_energy = 0;
   4562 11 1C 61      [10]  421 	ld	de, #_entidad + 49
   4565 AF            [ 4]  422 	xor	a, a
   4566 12            [ 7]  423 	ld	(de), a
                            424 ;src/juego.c:88: if (nivel == 1) {
   4567 FD 21 24 61   [14]  425 	ld	iy, #_nivel
   456B FD 7E 00      [19]  426 	ld	a, 0 (iy)
   456E 3D            [ 4]  427 	dec	a
   456F 20 32         [12]  428 	jr	NZ,00102$
                            429 ;src/juego.c:89: strcpy(entidad[1].name,"Soldier");
   4571 C5            [11]  430 	push	bc
   4572 D5            [11]  431 	push	de
   4573 11 FE 60      [10]  432 	ld	de, #(_entidad + 0x0013)
   4576 21 AD 45      [10]  433 	ld	hl, #___str_1
   4579 AF            [ 4]  434 	xor	a, a
   457A                     435 00111$:
   457A BE            [ 7]  436 	cp	a, (hl)
   457B ED A0         [16]  437 	ldi
   457D 20 FB         [12]  438 	jr	NZ, 00111$
   457F D1            [10]  439 	pop	de
   4580 C1            [10]  440 	pop	bc
                            441 ;src/juego.c:90: entidad[1].max_energy = 90;
   4581 3E 5A         [ 7]  442 	ld	a, #0x5a
   4583 02            [ 7]  443 	ld	(bc), a
                            444 ;src/juego.c:91: entidad[1].attack = 20;
   4584 21 0A 61      [10]  445 	ld	hl, #(_entidad + 0x001f)
   4587 36 14         [10]  446 	ld	(hl), #0x14
                            447 ;src/juego.c:92: entidad[1].force = 3;
   4589 21 0B 61      [10]  448 	ld	hl, #(_entidad + 0x0020)
   458C 36 03         [10]  449 	ld	(hl), #0x03
                            450 ;src/juego.c:93: entidad[1].defense = 10;
   458E 21 0C 61      [10]  451 	ld	hl, #(_entidad + 0x0021)
   4591 36 0A         [10]  452 	ld	(hl), #0x0a
                            453 ;src/juego.c:94: entidad[1].pos_x = 28;
   4593 21 0D 61      [10]  454 	ld	hl, #(_entidad + 0x0022)
   4596 36 1C         [10]  455 	ld	(hl), #0x1c
                            456 ;src/juego.c:95: entidad[1].pos_y = 32;
   4598 21 0E 61      [10]  457 	ld	hl, #(_entidad + 0x0023)
   459B 36 20         [10]  458 	ld	(hl), #0x20
                            459 ;src/juego.c:96: entidad[1].sprite = (u8*) &G_arabe_1[0];
   459D 21 72 4F      [10]  460 	ld	hl, #_G_arabe_1
   45A0 22 0F 61      [16]  461 	ld	((_entidad + 0x0024)), hl
   45A3                     462 00102$:
                            463 ;src/juego.c:99: entidad[1].energy = entidad[1].max_energy;
   45A3 0A            [ 7]  464 	ld	a, (bc)
   45A4 32 08 61      [13]  465 	ld	(#(_entidad + 0x001d)),a
                            466 ;src/juego.c:100: entidad[2].energy = entidad[2].max_energy;
   45A7 01 1B 61      [10]  467 	ld	bc, #_entidad + 48
   45AA 1A            [ 7]  468 	ld	a, (de)
   45AB 02            [ 7]  469 	ld	(bc), a
   45AC C9            [10]  470 	ret
   45AD                     471 ___str_1:
   45AD 53 6F 6C 64 69 65   472 	.ascii "Soldier"
        72
   45B4 00                  473 	.db 0x00
                            474 ;src/juego.c:103: void printStats(TStats *a) {
                            475 ;	---------------------------------
                            476 ; Function printStats
                            477 ; ---------------------------------
   45B5                     478 _printStats::
   45B5 DD E5         [15]  479 	push	ix
   45B7 DD 21 00 00   [14]  480 	ld	ix,#0
   45BB DD 39         [15]  481 	add	ix,sp
   45BD 21 D6 FF      [10]  482 	ld	hl, #-42
   45C0 39            [11]  483 	add	hl, sp
   45C1 F9            [ 6]  484 	ld	sp, hl
                            485 ;src/juego.c:106: sprintf(temp, "                                    ");
   45C2 11 4E 46      [10]  486 	ld	de, #___str_2+0
   45C5 21 00 00      [10]  487 	ld	hl, #0x0000
   45C8 39            [11]  488 	add	hl, sp
   45C9 DD 75 FE      [19]  489 	ld	-2 (ix), l
   45CC DD 74 FF      [19]  490 	ld	-1 (ix), h
   45CF D5            [11]  491 	push	de
   45D0 E5            [11]  492 	push	hl
   45D1 CD A9 53      [17]  493 	call	_sprintf
   45D4 F1            [10]  494 	pop	af
   45D5 F1            [10]  495 	pop	af
                            496 ;src/juego.c:107: if (a->energy)
   45D6 DD 4E 04      [19]  497 	ld	c,4 (ix)
   45D9 DD 46 05      [19]  498 	ld	b,5 (ix)
   45DC C5            [11]  499 	push	bc
   45DD FD E1         [14]  500 	pop	iy
   45DF FD 5E 0A      [19]  501 	ld	e, 10 (iy)
   45E2 7B            [ 4]  502 	ld	a, e
   45E3 B7            [ 4]  503 	or	a, a
   45E4 28 45         [12]  504 	jr	Z,00102$
                            505 ;src/juego.c:108: sprintf(temp, "%-9s=> HP:%02d. ATT: %02d. DEF: %02d",a->name, a->energy,a->attack,a->defense);
   45E6 C5            [11]  506 	push	bc
   45E7 FD E1         [14]  507 	pop	iy
   45E9 FD 6E 0E      [19]  508 	ld	l, 14 (iy)
   45EC DD 75 FC      [19]  509 	ld	-4 (ix), l
   45EF DD 36 FD 00   [19]  510 	ld	-3 (ix), #0x00
   45F3 C5            [11]  511 	push	bc
   45F4 FD E1         [14]  512 	pop	iy
   45F6 FD 6E 0C      [19]  513 	ld	l, 12 (iy)
   45F9 DD 75 FA      [19]  514 	ld	-6 (ix), l
   45FC DD 36 FB 00   [19]  515 	ld	-5 (ix), #0x00
   4600 16 00         [ 7]  516 	ld	d, #0x00
   4602 DD 6E FE      [19]  517 	ld	l,-2 (ix)
   4605 DD 66 FF      [19]  518 	ld	h,-1 (ix)
   4608 E5            [11]  519 	push	hl
   4609 FD E1         [14]  520 	pop	iy
   460B C5            [11]  521 	push	bc
   460C DD 6E FC      [19]  522 	ld	l,-4 (ix)
   460F DD 66 FD      [19]  523 	ld	h,-3 (ix)
   4612 E5            [11]  524 	push	hl
   4613 DD 6E FA      [19]  525 	ld	l,-6 (ix)
   4616 DD 66 FB      [19]  526 	ld	h,-5 (ix)
   4619 E5            [11]  527 	push	hl
   461A D5            [11]  528 	push	de
   461B C5            [11]  529 	push	bc
   461C 21 73 46      [10]  530 	ld	hl, #___str_3
   461F E5            [11]  531 	push	hl
   4620 FD E5         [15]  532 	push	iy
   4622 CD A9 53      [17]  533 	call	_sprintf
   4625 21 0C 00      [10]  534 	ld	hl, #12
   4628 39            [11]  535 	add	hl, sp
   4629 F9            [ 6]  536 	ld	sp, hl
   462A C1            [10]  537 	pop	bc
   462B                     538 00102$:
                            539 ;src/juego.c:110: cpct_drawStringM1(temp, cpct_getScreenPtr(CPCT_VMEM_START, 4, a->pos_y));
   462B C5            [11]  540 	push	bc
   462C FD E1         [14]  541 	pop	iy
   462E FD 46 10      [19]  542 	ld	b, 16 (iy)
   4631 C5            [11]  543 	push	bc
   4632 33            [ 6]  544 	inc	sp
   4633 3E 04         [ 7]  545 	ld	a, #0x04
   4635 F5            [11]  546 	push	af
   4636 33            [ 6]  547 	inc	sp
   4637 21 00 C0      [10]  548 	ld	hl, #0xc000
   463A E5            [11]  549 	push	hl
   463B CD 1E 55      [17]  550 	call	_cpct_getScreenPtr
   463E DD 4E FE      [19]  551 	ld	c,-2 (ix)
   4641 DD 46 FF      [19]  552 	ld	b,-1 (ix)
   4644 E5            [11]  553 	push	hl
   4645 C5            [11]  554 	push	bc
   4646 CD 6B 51      [17]  555 	call	_cpct_drawStringM1
   4649 DD F9         [10]  556 	ld	sp, ix
   464B DD E1         [14]  557 	pop	ix
   464D C9            [10]  558 	ret
   464E                     559 ___str_2:
   464E 20 20 20 20 20 20   560 	.ascii "                                    "
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
   4672 00                  561 	.db 0x00
   4673                     562 ___str_3:
   4673 25 2D 39 73 3D 3E   563 	.ascii "%-9s=> HP:%02d. ATT: %02d. DEF: %02d"
        20 48 50 3A 25 30
        32 64 2E 20 41 54
        54 3A 20 25 30 32
        64 2E 20 44 45 46
        3A 20 25 30 32 64
   4697 00                  564 	.db 0x00
                            565 ;src/juego.c:113: void printLevel() {
                            566 ;	---------------------------------
                            567 ; Function printLevel
                            568 ; ---------------------------------
   4698                     569 _printLevel::
   4698 DD E5         [15]  570 	push	ix
   469A DD 21 00 00   [14]  571 	ld	ix,#0
   469E DD 39         [15]  572 	add	ix,sp
   46A0 21 D8 FF      [10]  573 	ld	hl, #-40
   46A3 39            [11]  574 	add	hl, sp
   46A4 F9            [ 6]  575 	ld	sp, hl
                            576 ;src/juego.c:116: sprintf(temp, "LEVEL: %02d",nivel);
   46A5 21 24 61      [10]  577 	ld	hl,#_nivel + 0
   46A8 5E            [ 7]  578 	ld	e, (hl)
   46A9 16 00         [ 7]  579 	ld	d, #0x00
   46AB 21 00 00      [10]  580 	ld	hl, #0x0000
   46AE 39            [11]  581 	add	hl, sp
   46AF E5            [11]  582 	push	hl
   46B0 D5            [11]  583 	push	de
   46B1 11 DB 46      [10]  584 	ld	de, #___str_4
   46B4 D5            [11]  585 	push	de
   46B5 E5            [11]  586 	push	hl
   46B6 CD A9 53      [17]  587 	call	_sprintf
   46B9 21 06 00      [10]  588 	ld	hl, #6
   46BC 39            [11]  589 	add	hl, sp
   46BD F9            [ 6]  590 	ld	sp, hl
   46BE 21 02 00      [10]  591 	ld	hl, #0x0002
   46C1 E5            [11]  592 	push	hl
   46C2 CD 3E 55      [17]  593 	call	_cpct_setDrawCharM1
   46C5 21 04 10      [10]  594 	ld	hl, #0x1004
   46C8 E5            [11]  595 	push	hl
   46C9 21 00 C0      [10]  596 	ld	hl, #0xc000
   46CC E5            [11]  597 	push	hl
   46CD CD 1E 55      [17]  598 	call	_cpct_getScreenPtr
   46D0 C1            [10]  599 	pop	bc
   46D1 E5            [11]  600 	push	hl
   46D2 C5            [11]  601 	push	bc
   46D3 CD 6B 51      [17]  602 	call	_cpct_drawStringM1
   46D6 DD F9         [10]  603 	ld	sp, ix
   46D8 DD E1         [14]  604 	pop	ix
   46DA C9            [10]  605 	ret
   46DB                     606 ___str_4:
   46DB 4C 45 56 45 4C 3A   607 	.ascii "LEVEL: %02d"
        20 25 30 32 64
   46E6 00                  608 	.db 0x00
                            609 ;src/juego.c:121: void printConsole  (void* string, u8 pen, u8 bground) {
                            610 ;	---------------------------------
                            611 ; Function printConsole
                            612 ; ---------------------------------
   46E7                     613 _printConsole::
                            614 ;src/juego.c:122: if (cursorConsola > 175){
   46E7 3E AF         [ 7]  615 	ld	a, #0xaf
   46E9 FD 21 4C 61   [14]  616 	ld	iy, #_cursorConsola
   46ED FD 96 00      [19]  617 	sub	a, 0 (iy)
   46F0 30 31         [12]  618 	jr	NC,00102$
                            619 ;src/juego.c:124: pausa();
   46F2 CD B7 43      [17]  620 	call	_pausa
                            621 ;src/juego.c:125: cpct_drawSolidBox (cpct_getScreenPtr (CPCT_VMEM_START, 44, 64), cpct_px2byteM1 (0, 0, 0, 0), 32, 112);
   46F5 21 00 00      [10]  622 	ld	hl, #0x0000
   46F8 E5            [11]  623 	push	hl
   46F9 2E 00         [ 7]  624 	ld	l, #0x00
   46FB E5            [11]  625 	push	hl
   46FC CD 38 54      [17]  626 	call	_cpct_px2byteM1
   46FF F1            [10]  627 	pop	af
   4700 F1            [10]  628 	pop	af
   4701 55            [ 4]  629 	ld	d, l
   4702 D5            [11]  630 	push	de
   4703 21 2C 40      [10]  631 	ld	hl, #0x402c
   4706 E5            [11]  632 	push	hl
   4707 21 00 C0      [10]  633 	ld	hl, #0xc000
   470A E5            [11]  634 	push	hl
   470B CD 1E 55      [17]  635 	call	_cpct_getScreenPtr
   470E 4D            [ 4]  636 	ld	c, l
   470F 44            [ 4]  637 	ld	b, h
   4710 D1            [10]  638 	pop	de
   4711 21 20 70      [10]  639 	ld	hl, #0x7020
   4714 E5            [11]  640 	push	hl
   4715 D5            [11]  641 	push	de
   4716 33            [ 6]  642 	inc	sp
   4717 C5            [11]  643 	push	bc
   4718 CD 65 54      [17]  644 	call	_cpct_drawSolidBox
   471B F1            [10]  645 	pop	af
   471C F1            [10]  646 	pop	af
   471D 33            [ 6]  647 	inc	sp
                            648 ;src/juego.c:126: cursorConsola = 64;
   471E 21 4C 61      [10]  649 	ld	hl,#_cursorConsola + 0
   4721 36 40         [10]  650 	ld	(hl), #0x40
   4723                     651 00102$:
                            652 ;src/juego.c:129: cpct_setDrawCharM1(pen, bground);
   4723 21 05 00      [10]  653 	ld	hl, #5+0
   4726 39            [11]  654 	add	hl, sp
   4727 7E            [ 7]  655 	ld	a, (hl)
   4728 F5            [11]  656 	push	af
   4729 33            [ 6]  657 	inc	sp
   472A 21 05 00      [10]  658 	ld	hl, #5+0
   472D 39            [11]  659 	add	hl, sp
   472E 7E            [ 7]  660 	ld	a, (hl)
   472F F5            [11]  661 	push	af
   4730 33            [ 6]  662 	inc	sp
   4731 CD 3E 55      [17]  663 	call	_cpct_setDrawCharM1
                            664 ;src/juego.c:130: cpct_drawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 44, cursorConsola));
   4734 3A 4C 61      [13]  665 	ld	a, (_cursorConsola)
   4737 57            [ 4]  666 	ld	d,a
   4738 1E 2C         [ 7]  667 	ld	e,#0x2c
   473A D5            [11]  668 	push	de
   473B 21 00 C0      [10]  669 	ld	hl, #0xc000
   473E E5            [11]  670 	push	hl
   473F CD 1E 55      [17]  671 	call	_cpct_getScreenPtr
   4742 D1            [10]  672 	pop	de
   4743 C1            [10]  673 	pop	bc
   4744 C5            [11]  674 	push	bc
   4745 D5            [11]  675 	push	de
   4746 E5            [11]  676 	push	hl
   4747 C5            [11]  677 	push	bc
   4748 CD 6B 51      [17]  678 	call	_cpct_drawStringM1
                            679 ;src/juego.c:131: cursorConsola +=8;
   474B 21 4C 61      [10]  680 	ld	hl, #_cursorConsola
   474E 7E            [ 7]  681 	ld	a, (hl)
   474F C6 08         [ 7]  682 	add	a, #0x08
   4751 77            [ 7]  683 	ld	(hl), a
   4752 C9            [10]  684 	ret
                            685 ;src/juego.c:135: void atacar(TStats *a, TStats *b) {
                            686 ;	---------------------------------
                            687 ; Function atacar
                            688 ; ---------------------------------
   4753                     689 _atacar::
   4753 DD E5         [15]  690 	push	ix
   4755 DD 21 00 00   [14]  691 	ld	ix,#0
   4759 DD 39         [15]  692 	add	ix,sp
   475B 21 E6 FF      [10]  693 	ld	hl, #-26
   475E 39            [11]  694 	add	hl, sp
   475F F9            [ 6]  695 	ld	sp, hl
                            696 ;src/juego.c:139: pen = 0;
   4760 DD 36 E7 00   [19]  697 	ld	-25 (ix), #0x00
                            698 ;src/juego.c:140: bg = 2;
   4764 DD 36 E6 02   [19]  699 	ld	-26 (ix), #0x02
                            700 ;src/juego.c:141: if ((u16) a->sprite == (u16) G_mendo)  {
   4768 DD 4E 04      [19]  701 	ld	c,4 (ix)
   476B DD 46 05      [19]  702 	ld	b,5 (ix)
   476E 69            [ 4]  703 	ld	l, c
   476F 60            [ 4]  704 	ld	h, b
   4770 11 11 00      [10]  705 	ld	de, #0x0011
   4773 19            [11]  706 	add	hl, de
   4774 5E            [ 7]  707 	ld	e, (hl)
   4775 23            [ 6]  708 	inc	hl
   4776 56            [ 7]  709 	ld	d, (hl)
   4777 DD 36 FE 92   [19]  710 	ld	-2 (ix), #<(_G_mendo)
   477B DD 36 FF 4E   [19]  711 	ld	-1 (ix), #>(_G_mendo)
   477F 7B            [ 4]  712 	ld	a, e
   4780 DD 96 FE      [19]  713 	sub	a, -2 (ix)
   4783 20 0E         [12]  714 	jr	NZ,00102$
   4785 7A            [ 4]  715 	ld	a, d
   4786 DD 96 FF      [19]  716 	sub	a, -1 (ix)
   4789 20 08         [12]  717 	jr	NZ,00102$
                            718 ;src/juego.c:142: pen = 2;
   478B DD 36 E7 02   [19]  719 	ld	-25 (ix), #0x02
                            720 ;src/juego.c:143: bg = 0;
   478F DD 36 E6 00   [19]  721 	ld	-26 (ix), #0x00
   4793                     722 00102$:
                            723 ;src/juego.c:147: ataque = a->attack + (2*(cpct_rand()%a->force)) - a->force;
   4793 C5            [11]  724 	push	bc
   4794 FD E1         [14]  725 	pop	iy
   4796 FD 7E 0C      [19]  726 	ld	a, 12 (iy)
   4799 DD 77 FE      [19]  727 	ld	-2 (ix), a
   479C C5            [11]  728 	push	bc
   479D CD 00 53      [17]  729 	call	_cpct_getRandom_mxor_u8
   47A0 5D            [ 4]  730 	ld	e, l
   47A1 C1            [10]  731 	pop	bc
   47A2 C5            [11]  732 	push	bc
   47A3 FD E1         [14]  733 	pop	iy
   47A5 FD 56 0D      [19]  734 	ld	d, 13 (iy)
   47A8 C5            [11]  735 	push	bc
   47A9 D5            [11]  736 	push	de
   47AA D5            [11]  737 	push	de
   47AB CD 90 52      [17]  738 	call	__moduchar
   47AE F1            [10]  739 	pop	af
   47AF D1            [10]  740 	pop	de
   47B0 C1            [10]  741 	pop	bc
   47B1 CB 25         [ 8]  742 	sla	l
   47B3 DD 7E FE      [19]  743 	ld	a, -2 (ix)
   47B6 85            [ 4]  744 	add	a, l
   47B7 92            [ 4]  745 	sub	a, d
                            746 ;src/juego.c:148: sprintf(temp, "%-9s ATT %02d",a->name, ataque);
   47B8 DD 77 FE      [19]  747 	ld	-2 (ix), a
   47BB 5F            [ 4]  748 	ld	e, a
   47BC 16 00         [ 7]  749 	ld	d, #0x00
   47BE 21 02 00      [10]  750 	ld	hl, #0x0002
   47C1 39            [11]  751 	add	hl, sp
   47C2 DD 75 FC      [19]  752 	ld	-4 (ix), l
   47C5 DD 74 FD      [19]  753 	ld	-3 (ix), h
   47C8 D5            [11]  754 	push	de
   47C9 C5            [11]  755 	push	bc
   47CA 01 61 48      [10]  756 	ld	bc, #___str_5
   47CD C5            [11]  757 	push	bc
   47CE E5            [11]  758 	push	hl
   47CF CD A9 53      [17]  759 	call	_sprintf
   47D2 21 08 00      [10]  760 	ld	hl, #8
   47D5 39            [11]  761 	add	hl, sp
   47D6 F9            [ 6]  762 	ld	sp, hl
                            763 ;src/juego.c:149: printConsole(temp, pen, bg);
   47D7 DD 4E FC      [19]  764 	ld	c,-4 (ix)
   47DA DD 46 FD      [19]  765 	ld	b,-3 (ix)
   47DD DD 66 E6      [19]  766 	ld	h, -26 (ix)
   47E0 DD 6E E7      [19]  767 	ld	l, -25 (ix)
   47E3 E5            [11]  768 	push	hl
   47E4 C5            [11]  769 	push	bc
   47E5 CD E7 46      [17]  770 	call	_printConsole
   47E8 F1            [10]  771 	pop	af
   47E9 F1            [10]  772 	pop	af
                            773 ;src/juego.c:151: if (ataque < b->energy) {
   47EA DD 4E 06      [19]  774 	ld	c,6 (ix)
   47ED DD 46 07      [19]  775 	ld	b,7 (ix)
   47F0 21 0A 00      [10]  776 	ld	hl, #0x000a
   47F3 09            [11]  777 	add	hl, bc
   47F4 5E            [ 7]  778 	ld	e, (hl)
   47F5 DD 7E FE      [19]  779 	ld	a, -2 (ix)
   47F8 93            [ 4]  780 	sub	a, e
   47F9 30 1F         [12]  781 	jr	NC,00104$
                            782 ;src/juego.c:152: b->energy = b->energy - ataque;
   47FB 7B            [ 4]  783 	ld	a, e
   47FC DD 96 FE      [19]  784 	sub	a, -2 (ix)
   47FF 5F            [ 4]  785 	ld	e, a
   4800 73            [ 7]  786 	ld	(hl), e
                            787 ;src/juego.c:153: sprintf(temp, "%-9s HP=>%02d",b->name, b->energy);
   4801 16 00         [ 7]  788 	ld	d, #0x00
   4803 DD 6E FC      [19]  789 	ld	l,-4 (ix)
   4806 DD 66 FD      [19]  790 	ld	h,-3 (ix)
   4809 D5            [11]  791 	push	de
   480A C5            [11]  792 	push	bc
   480B 01 6F 48      [10]  793 	ld	bc, #___str_6
   480E C5            [11]  794 	push	bc
   480F E5            [11]  795 	push	hl
   4810 CD A9 53      [17]  796 	call	_sprintf
   4813 21 08 00      [10]  797 	ld	hl, #8
   4816 39            [11]  798 	add	hl, sp
   4817 F9            [ 6]  799 	ld	sp, hl
   4818 18 31         [12]  800 	jr	00105$
   481A                     801 00104$:
                            802 ;src/juego.c:156: b->energy = 0;
   481A 36 00         [10]  803 	ld	(hl), #0x00
                            804 ;src/juego.c:157: sprintf(temp, "%-9s DIED! ",b->name, b->energy);
   481C 5E            [ 7]  805 	ld	e, (hl)
   481D 16 00         [ 7]  806 	ld	d, #0x00
   481F DD 6E FC      [19]  807 	ld	l,-4 (ix)
   4822 DD 66 FD      [19]  808 	ld	h,-3 (ix)
   4825 D5            [11]  809 	push	de
   4826 C5            [11]  810 	push	bc
   4827 01 7D 48      [10]  811 	ld	bc, #___str_7
   482A C5            [11]  812 	push	bc
   482B E5            [11]  813 	push	hl
   482C CD A9 53      [17]  814 	call	_sprintf
   482F 21 08 00      [10]  815 	ld	hl, #8
   4832 39            [11]  816 	add	hl, sp
   4833 F9            [ 6]  817 	ld	sp, hl
                            818 ;src/juego.c:158: printStats(b);
   4834 DD 6E 06      [19]  819 	ld	l,6 (ix)
   4837 DD 66 07      [19]  820 	ld	h,7 (ix)
   483A E5            [11]  821 	push	hl
   483B CD B5 45      [17]  822 	call	_printStats
   483E F1            [10]  823 	pop	af
                            824 ;src/juego.c:160: ataque = pen;
   483F DD 4E E7      [19]  825 	ld	c, -25 (ix)
                            826 ;src/juego.c:161: pen = bg;
   4842 DD 7E E6      [19]  827 	ld	a, -26 (ix)
   4845 DD 77 E7      [19]  828 	ld	-25 (ix), a
                            829 ;src/juego.c:162: bg = ataque;
   4848 DD 71 E6      [19]  830 	ld	-26 (ix), c
   484B                     831 00105$:
                            832 ;src/juego.c:165: printConsole(temp, pen, bg);
   484B DD 4E FC      [19]  833 	ld	c,-4 (ix)
   484E DD 46 FD      [19]  834 	ld	b,-3 (ix)
   4851 DD 66 E6      [19]  835 	ld	h, -26 (ix)
   4854 DD 6E E7      [19]  836 	ld	l, -25 (ix)
   4857 E5            [11]  837 	push	hl
   4858 C5            [11]  838 	push	bc
   4859 CD E7 46      [17]  839 	call	_printConsole
   485C DD F9         [10]  840 	ld	sp,ix
   485E DD E1         [14]  841 	pop	ix
   4860 C9            [10]  842 	ret
   4861                     843 ___str_5:
   4861 25 2D 39 73 20 41   844 	.ascii "%-9s ATT %02d"
        54 54 20 25 30 32
        64
   486E 00                  845 	.db 0x00
   486F                     846 ___str_6:
   486F 25 2D 39 73 20 48   847 	.ascii "%-9s HP=>%02d"
        50 3D 3E 25 30 32
        64
   487C 00                  848 	.db 0x00
   487D                     849 ___str_7:
   487D 25 2D 39 73 20 44   850 	.ascii "%-9s DIED! "
        49 45 44 21 20
   4888 00                  851 	.db 0x00
                            852 ;src/juego.c:168: void defender(TStats *a) {
                            853 ;	---------------------------------
                            854 ; Function defender
                            855 ; ---------------------------------
   4889                     856 _defender::
   4889 DD E5         [15]  857 	push	ix
   488B DD 21 00 00   [14]  858 	ld	ix,#0
   488F DD 39         [15]  859 	add	ix,sp
   4891 21 E4 FF      [10]  860 	ld	hl, #-28
   4894 39            [11]  861 	add	hl, sp
   4895 F9            [ 6]  862 	ld	sp, hl
                            863 ;src/juego.c:171: pen = 0;
   4896 DD 36 FA 00   [19]  864 	ld	-6 (ix), #0x00
                            865 ;src/juego.c:172: bg = 2;
   489A DD 36 F9 02   [19]  866 	ld	-7 (ix), #0x02
                            867 ;src/juego.c:173: if ((u16) a->sprite == (u16) G_mendo)  {
   489E DD 4E 04      [19]  868 	ld	c,4 (ix)
   48A1 DD 46 05      [19]  869 	ld	b,5 (ix)
   48A4 69            [ 4]  870 	ld	l, c
   48A5 60            [ 4]  871 	ld	h, b
   48A6 11 11 00      [10]  872 	ld	de, #0x0011
   48A9 19            [11]  873 	add	hl, de
   48AA 5E            [ 7]  874 	ld	e, (hl)
   48AB 23            [ 6]  875 	inc	hl
   48AC 56            [ 7]  876 	ld	d, (hl)
   48AD DD 36 FE 92   [19]  877 	ld	-2 (ix), #<(_G_mendo)
   48B1 DD 36 FF 4E   [19]  878 	ld	-1 (ix), #>(_G_mendo)
   48B5 7B            [ 4]  879 	ld	a, e
   48B6 DD 96 FE      [19]  880 	sub	a, -2 (ix)
   48B9 20 0E         [12]  881 	jr	NZ,00102$
   48BB 7A            [ 4]  882 	ld	a, d
   48BC DD 96 FF      [19]  883 	sub	a, -1 (ix)
   48BF 20 08         [12]  884 	jr	NZ,00102$
                            885 ;src/juego.c:174: pen = 2;
   48C1 DD 36 FA 02   [19]  886 	ld	-6 (ix), #0x02
                            887 ;src/juego.c:175: bg = 0;
   48C5 DD 36 F9 00   [19]  888 	ld	-7 (ix), #0x00
   48C9                     889 00102$:
                            890 ;src/juego.c:178: healed = 0;
   48C9 DD 36 F8 00   [19]  891 	ld	-8 (ix), #0x00
                            892 ;src/juego.c:179: if (a->energy + a->defense < a->max_energy)
   48CD 21 0A 00      [10]  893 	ld	hl, #0x000a
   48D0 09            [11]  894 	add	hl,bc
   48D1 EB            [ 4]  895 	ex	de,hl
   48D2 1A            [ 7]  896 	ld	a, (de)
   48D3 DD 77 FE      [19]  897 	ld	-2 (ix), a
   48D6 DD 77 FC      [19]  898 	ld	-4 (ix), a
   48D9 DD 36 FD 00   [19]  899 	ld	-3 (ix), #0x00
   48DD C5            [11]  900 	push	bc
   48DE FD E1         [14]  901 	pop	iy
   48E0 FD 7E 0E      [19]  902 	ld	a, 14 (iy)
   48E3 DD 77 FB      [19]  903 	ld	-5 (ix), a
   48E6 6F            [ 4]  904 	ld	l, a
   48E7 26 00         [ 7]  905 	ld	h, #0x00
   48E9 DD 7E FC      [19]  906 	ld	a, -4 (ix)
   48EC 85            [ 4]  907 	add	a, l
   48ED DD 77 FC      [19]  908 	ld	-4 (ix), a
   48F0 DD 7E FD      [19]  909 	ld	a, -3 (ix)
   48F3 8C            [ 4]  910 	adc	a, h
   48F4 DD 77 FD      [19]  911 	ld	-3 (ix), a
   48F7 C5            [11]  912 	push	bc
   48F8 FD E1         [14]  913 	pop	iy
   48FA FD 6E 0B      [19]  914 	ld	l, 11 (iy)
   48FD 26 00         [ 7]  915 	ld	h, #0x00
   48FF DD 7E FC      [19]  916 	ld	a, -4 (ix)
   4902 95            [ 4]  917 	sub	a, l
   4903 DD 7E FD      [19]  918 	ld	a, -3 (ix)
   4906 9C            [ 4]  919 	sbc	a, h
   4907 E2 0C 49      [10]  920 	jp	PO, 00117$
   490A EE 80         [ 7]  921 	xor	a, #0x80
   490C                     922 00117$:
   490C F2 15 49      [10]  923 	jp	P, 00104$
                            924 ;src/juego.c:180: healed = a->defense;
   490F DD 6E FB      [19]  925 	ld	l, -5 (ix)
   4912 DD 75 F8      [19]  926 	ld	-8 (ix), l
   4915                     927 00104$:
                            928 ;src/juego.c:182: a->energy = a->energy + healed;
   4915 DD 7E FE      [19]  929 	ld	a, -2 (ix)
   4918 DD 86 F8      [19]  930 	add	a, -8 (ix)
   491B 12            [ 7]  931 	ld	(de), a
                            932 ;src/juego.c:184: sprintf(temp, "%-9s %c %02dHP",a->name, 240,healed);
   491C DD 5E F8      [19]  933 	ld	e, -8 (ix)
   491F 16 00         [ 7]  934 	ld	d, #0x00
   4921 21 00 00      [10]  935 	ld	hl, #0x0000
   4924 39            [11]  936 	add	hl, sp
   4925 E5            [11]  937 	push	hl
   4926 FD E1         [14]  938 	pop	iy
   4928 E5            [11]  939 	push	hl
   4929 D5            [11]  940 	push	de
   492A 11 F0 00      [10]  941 	ld	de, #0x00f0
   492D D5            [11]  942 	push	de
   492E C5            [11]  943 	push	bc
   492F 01 50 49      [10]  944 	ld	bc, #___str_8
   4932 C5            [11]  945 	push	bc
   4933 FD E5         [15]  946 	push	iy
   4935 CD A9 53      [17]  947 	call	_sprintf
   4938 21 0A 00      [10]  948 	ld	hl, #10
   493B 39            [11]  949 	add	hl, sp
   493C F9            [ 6]  950 	ld	sp, hl
   493D E1            [10]  951 	pop	hl
                            952 ;src/juego.c:186: printConsole(temp, pen, bg);
   493E 4D            [ 4]  953 	ld	c, l
   493F 44            [ 4]  954 	ld	b, h
   4940 DD 66 F9      [19]  955 	ld	h, -7 (ix)
   4943 DD 6E FA      [19]  956 	ld	l, -6 (ix)
   4946 E5            [11]  957 	push	hl
   4947 C5            [11]  958 	push	bc
   4948 CD E7 46      [17]  959 	call	_printConsole
   494B DD F9         [10]  960 	ld	sp,ix
   494D DD E1         [14]  961 	pop	ix
   494F C9            [10]  962 	ret
   4950                     963 ___str_8:
   4950 25 2D 39 73 20 25   964 	.ascii "%-9s %c %02dHP"
        63 20 25 30 32 64
        48 50
   495E 00                  965 	.db 0x00
                            966 ;src/juego.c:189: u8 turno() { //devuelve valor 0 cuando muere personaje o se termina nivel
                            967 ;	---------------------------------
                            968 ; Function turno
                            969 ; ---------------------------------
   495F                     970 _turno::
   495F DD E5         [15]  971 	push	ix
   4961 DD 21 00 00   [14]  972 	ld	ix,#0
   4965 DD 39         [15]  973 	add	ix,sp
   4967 21 CC FF      [10]  974 	ld	hl, #-52
   496A 39            [11]  975 	add	hl, sp
   496B F9            [ 6]  976 	ld	sp, hl
                            977 ;src/juego.c:192: printLevel();
   496C CD 98 46      [17]  978 	call	_printLevel
                            979 ;src/juego.c:194: for (i = 0; i < 3; i++) {
   496F 01 EB 60      [10]  980 	ld	bc, #_entidad+0
   4972 DD 36 F1 00   [19]  981 	ld	-15 (ix), #0x00
   4976                     982 00169$:
                            983 ;src/juego.c:195: if (entidad[i].energy){
   4976 DD 5E F1      [19]  984 	ld	e,-15 (ix)
   4979 16 00         [ 7]  985 	ld	d,#0x00
   497B 6B            [ 4]  986 	ld	l, e
   497C 62            [ 4]  987 	ld	h, d
   497D 29            [11]  988 	add	hl, hl
   497E 29            [11]  989 	add	hl, hl
   497F 29            [11]  990 	add	hl, hl
   4980 19            [11]  991 	add	hl, de
   4981 29            [11]  992 	add	hl, hl
   4982 19            [11]  993 	add	hl, de
   4983 09            [11]  994 	add	hl,bc
   4984 EB            [ 4]  995 	ex	de,hl
   4985 D5            [11]  996 	push	de
   4986 FD E1         [14]  997 	pop	iy
   4988 FD 7E 0A      [19]  998 	ld	a, 10 (iy)
   498B B7            [ 4]  999 	or	a, a
   498C 28 39         [12] 1000 	jr	Z,00170$
                           1001 ;src/juego.c:196: printStats(&entidad[i]);
   498E 6B            [ 4] 1002 	ld	l, e
   498F 62            [ 4] 1003 	ld	h, d
   4990 C5            [11] 1004 	push	bc
   4991 D5            [11] 1005 	push	de
   4992 E5            [11] 1006 	push	hl
   4993 CD B5 45      [17] 1007 	call	_printStats
   4996 F1            [10] 1008 	pop	af
   4997 D1            [10] 1009 	pop	de
   4998 C1            [10] 1010 	pop	bc
                           1011 ;src/juego.c:197: cpct_drawSpriteMasked (entidad[i].sprite, cpct_getScreenPtr (CPCT_VMEM_START, entidad[i].pos_x, 132), 4,28);
   4999 D5            [11] 1012 	push	de
   499A FD E1         [14] 1013 	pop	iy
   499C FD 66 0F      [19] 1014 	ld	h, 15 (iy)
   499F C5            [11] 1015 	push	bc
   49A0 D5            [11] 1016 	push	de
   49A1 3E 84         [ 7] 1017 	ld	a, #0x84
   49A3 F5            [11] 1018 	push	af
   49A4 33            [ 6] 1019 	inc	sp
   49A5 E5            [11] 1020 	push	hl
   49A6 33            [ 6] 1021 	inc	sp
   49A7 21 00 C0      [10] 1022 	ld	hl, #0xc000
   49AA E5            [11] 1023 	push	hl
   49AB CD 1E 55      [17] 1024 	call	_cpct_getScreenPtr
   49AE D1            [10] 1025 	pop	de
   49AF C1            [10] 1026 	pop	bc
   49B0 E5            [11] 1027 	push	hl
   49B1 FD E1         [14] 1028 	pop	iy
   49B3 EB            [ 4] 1029 	ex	de,hl
   49B4 11 11 00      [10] 1030 	ld	de, #0x0011
   49B7 19            [11] 1031 	add	hl, de
   49B8 5E            [ 7] 1032 	ld	e, (hl)
   49B9 23            [ 6] 1033 	inc	hl
   49BA 56            [ 7] 1034 	ld	d, (hl)
   49BB C5            [11] 1035 	push	bc
   49BC 21 04 1C      [10] 1036 	ld	hl, #0x1c04
   49BF E5            [11] 1037 	push	hl
   49C0 FD E5         [15] 1038 	push	iy
   49C2 D5            [11] 1039 	push	de
   49C3 CD 25 53      [17] 1040 	call	_cpct_drawSpriteMasked
   49C6 C1            [10] 1041 	pop	bc
   49C7                    1042 00170$:
                           1043 ;src/juego.c:194: for (i = 0; i < 3; i++) {
   49C7 DD 34 F1      [23] 1044 	inc	-15 (ix)
   49CA DD 7E F1      [19] 1045 	ld	a, -15 (ix)
   49CD D6 03         [ 7] 1046 	sub	a, #0x03
   49CF 38 A5         [12] 1047 	jr	C,00169$
                           1048 ;src/juego.c:205: i = 0;
   49D1 DD 36 F1 00   [19] 1049 	ld	-15 (ix), #0x00
                           1050 ;src/juego.c:206: do  {
   49D5 21 01 00      [10] 1051 	ld	hl, #0x0001
   49D8 39            [11] 1052 	add	hl, sp
   49D9 EB            [ 4] 1053 	ex	de,hl
   49DA                    1054 00116$:
                           1055 ;src/juego.c:207: cpct_scanKeyboard_f();
   49DA C5            [11] 1056 	push	bc
   49DB D5            [11] 1057 	push	de
   49DC CD F5 50      [17] 1058 	call	_cpct_scanKeyboard_f
   49DF D1            [10] 1059 	pop	de
   49E0 C1            [10] 1060 	pop	bc
                           1061 ;src/juego.c:208: sprintf(temp, "ACTION (%c/%c/D)?",242,243);
   49E1 D5            [11] 1062 	push	de
   49E2 FD E1         [14] 1063 	pop	iy
   49E4 C5            [11] 1064 	push	bc
   49E5 D5            [11] 1065 	push	de
   49E6 21 F3 00      [10] 1066 	ld	hl, #0x00f3
   49E9 E5            [11] 1067 	push	hl
   49EA 2E F2         [ 7] 1068 	ld	l, #0xf2
   49EC E5            [11] 1069 	push	hl
   49ED 21 3D 4E      [10] 1070 	ld	hl, #___str_9
   49F0 E5            [11] 1071 	push	hl
   49F1 FD E5         [15] 1072 	push	iy
   49F3 CD A9 53      [17] 1073 	call	_sprintf
   49F6 21 08 00      [10] 1074 	ld	hl, #8
   49F9 39            [11] 1075 	add	hl, sp
   49FA F9            [ 6] 1076 	ld	sp, hl
   49FB D1            [10] 1077 	pop	de
   49FC C1            [10] 1078 	pop	bc
                           1079 ;src/juego.c:209: if (i < 25) {
   49FD DD 7E F1      [19] 1080 	ld	a, -15 (ix)
   4A00 D6 19         [ 7] 1081 	sub	a, #0x19
   4A02 30 14         [12] 1082 	jr	NC,00105$
                           1083 ;src/juego.c:210: printConsole(temp, 2, 0);
   4A04 D5            [11] 1084 	push	de
   4A05 FD E1         [14] 1085 	pop	iy
   4A07 C5            [11] 1086 	push	bc
   4A08 D5            [11] 1087 	push	de
   4A09 21 02 00      [10] 1088 	ld	hl, #0x0002
   4A0C E5            [11] 1089 	push	hl
   4A0D FD E5         [15] 1090 	push	iy
   4A0F CD E7 46      [17] 1091 	call	_printConsole
   4A12 F1            [10] 1092 	pop	af
   4A13 F1            [10] 1093 	pop	af
   4A14 D1            [10] 1094 	pop	de
   4A15 C1            [10] 1095 	pop	bc
   4A16 18 14         [12] 1096 	jr	00106$
   4A18                    1097 00105$:
                           1098 ;src/juego.c:212: printConsole(temp, 0, 2);
   4A18 6B            [ 4] 1099 	ld	l, e
   4A19 62            [ 4] 1100 	ld	h, d
   4A1A E5            [11] 1101 	push	hl
   4A1B FD E1         [14] 1102 	pop	iy
   4A1D C5            [11] 1103 	push	bc
   4A1E D5            [11] 1104 	push	de
   4A1F 21 00 02      [10] 1105 	ld	hl, #0x0200
   4A22 E5            [11] 1106 	push	hl
   4A23 FD E5         [15] 1107 	push	iy
   4A25 CD E7 46      [17] 1108 	call	_printConsole
   4A28 F1            [10] 1109 	pop	af
   4A29 F1            [10] 1110 	pop	af
   4A2A D1            [10] 1111 	pop	de
   4A2B C1            [10] 1112 	pop	bc
   4A2C                    1113 00106$:
                           1114 ;src/juego.c:214: i++;
   4A2C DD 34 F1      [23] 1115 	inc	-15 (ix)
                           1116 ;src/juego.c:215: cursorConsola -=8;
   4A2F 21 4C 61      [10] 1117 	ld	hl, #_cursorConsola
   4A32 7E            [ 7] 1118 	ld	a, (hl)
   4A33 C6 F8         [ 7] 1119 	add	a, #0xf8
   4A35 77            [ 7] 1120 	ld	(hl), a
                           1121 ;src/juego.c:216: if (i == 50)
   4A36 DD 7E F1      [19] 1122 	ld	a, -15 (ix)
   4A39 D6 32         [ 7] 1123 	sub	a, #0x32
   4A3B 20 04         [12] 1124 	jr	NZ,00117$
                           1125 ;src/juego.c:217: i=0;
   4A3D DD 36 F1 00   [19] 1126 	ld	-15 (ix), #0x00
   4A41                    1127 00117$:
                           1128 ;src/juego.c:219: while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_CursorLeft)  && !cpct_isKeyPressed(Joy0_Left) 
   4A41 C5            [11] 1129 	push	bc
   4A42 D5            [11] 1130 	push	de
   4A43 21 04 04      [10] 1131 	ld	hl, #0x0404
   4A46 CD E9 50      [17] 1132 	call	_cpct_isKeyPressed
   4A49 D1            [10] 1133 	pop	de
   4A4A C1            [10] 1134 	pop	bc
   4A4B 7D            [ 4] 1135 	ld	a, l
   4A4C B7            [ 4] 1136 	or	a, a
   4A4D 20 63         [12] 1137 	jr	NZ,00118$
   4A4F C5            [11] 1138 	push	bc
   4A50 D5            [11] 1139 	push	de
   4A51 21 01 01      [10] 1140 	ld	hl, #0x0101
   4A54 CD E9 50      [17] 1141 	call	_cpct_isKeyPressed
   4A57 D1            [10] 1142 	pop	de
   4A58 C1            [10] 1143 	pop	bc
   4A59 7D            [ 4] 1144 	ld	a, l
   4A5A B7            [ 4] 1145 	or	a, a
   4A5B 20 55         [12] 1146 	jr	NZ,00118$
   4A5D C5            [11] 1147 	push	bc
   4A5E D5            [11] 1148 	push	de
   4A5F 21 09 04      [10] 1149 	ld	hl, #0x0409
   4A62 CD E9 50      [17] 1150 	call	_cpct_isKeyPressed
   4A65 D1            [10] 1151 	pop	de
   4A66 C1            [10] 1152 	pop	bc
   4A67 7D            [ 4] 1153 	ld	a, l
   4A68 B7            [ 4] 1154 	or	a, a
   4A69 20 47         [12] 1155 	jr	NZ,00118$
                           1156 ;src/juego.c:220: && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_CursorRight) && !cpct_isKeyPressed(Joy0_Right) 
   4A6B C5            [11] 1157 	push	bc
   4A6C D5            [11] 1158 	push	de
   4A6D 21 03 08      [10] 1159 	ld	hl, #0x0803
   4A70 CD E9 50      [17] 1160 	call	_cpct_isKeyPressed
   4A73 D1            [10] 1161 	pop	de
   4A74 C1            [10] 1162 	pop	bc
   4A75 7D            [ 4] 1163 	ld	a, l
   4A76 B7            [ 4] 1164 	or	a, a
   4A77 20 39         [12] 1165 	jr	NZ,00118$
   4A79 C5            [11] 1166 	push	bc
   4A7A D5            [11] 1167 	push	de
   4A7B 21 00 02      [10] 1168 	ld	hl, #0x0200
   4A7E CD E9 50      [17] 1169 	call	_cpct_isKeyPressed
   4A81 D1            [10] 1170 	pop	de
   4A82 C1            [10] 1171 	pop	bc
   4A83 7D            [ 4] 1172 	ld	a, l
   4A84 B7            [ 4] 1173 	or	a, a
   4A85 20 2B         [12] 1174 	jr	NZ,00118$
   4A87 C5            [11] 1175 	push	bc
   4A88 D5            [11] 1176 	push	de
   4A89 21 09 08      [10] 1177 	ld	hl, #0x0809
   4A8C CD E9 50      [17] 1178 	call	_cpct_isKeyPressed
   4A8F D1            [10] 1179 	pop	de
   4A90 C1            [10] 1180 	pop	bc
   4A91 7D            [ 4] 1181 	ld	a, l
   4A92 B7            [ 4] 1182 	or	a, a
   4A93 20 1D         [12] 1183 	jr	NZ,00118$
                           1184 ;src/juego.c:221: && !cpct_isKeyPressed(Key_D) && !cpct_isKeyPressed(Joy0_Fire1));
   4A95 C5            [11] 1185 	push	bc
   4A96 D5            [11] 1186 	push	de
   4A97 21 07 20      [10] 1187 	ld	hl, #0x2007
   4A9A CD E9 50      [17] 1188 	call	_cpct_isKeyPressed
   4A9D D1            [10] 1189 	pop	de
   4A9E C1            [10] 1190 	pop	bc
   4A9F 7D            [ 4] 1191 	ld	a, l
   4AA0 B7            [ 4] 1192 	or	a, a
   4AA1 20 0F         [12] 1193 	jr	NZ,00118$
   4AA3 C5            [11] 1194 	push	bc
   4AA4 D5            [11] 1195 	push	de
   4AA5 21 09 10      [10] 1196 	ld	hl, #0x1009
   4AA8 CD E9 50      [17] 1197 	call	_cpct_isKeyPressed
   4AAB D1            [10] 1198 	pop	de
   4AAC C1            [10] 1199 	pop	bc
   4AAD 7D            [ 4] 1200 	ld	a, l
   4AAE B7            [ 4] 1201 	or	a, a
   4AAF CA DA 49      [10] 1202 	jp	Z, 00116$
   4AB2                    1203 00118$:
                           1204 ;src/juego.c:224: nueva_pos = 0;
   4AB2 DD 36 F2 00   [19] 1205 	ld	-14 (ix), #0x00
                           1206 ;src/juego.c:227: for (i = 0; i < 3; i++) {
   4AB6 DD 36 F1 00   [19] 1207 	ld	-15 (ix), #0x00
   4ABA                    1208 00171$:
                           1209 ;src/juego.c:228: if (entidad[i].energy){
   4ABA D5            [11] 1210 	push	de
   4ABB DD 5E F1      [19] 1211 	ld	e,-15 (ix)
   4ABE 16 00         [ 7] 1212 	ld	d,#0x00
   4AC0 6B            [ 4] 1213 	ld	l, e
   4AC1 62            [ 4] 1214 	ld	h, d
   4AC2 29            [11] 1215 	add	hl, hl
   4AC3 29            [11] 1216 	add	hl, hl
   4AC4 29            [11] 1217 	add	hl, hl
   4AC5 19            [11] 1218 	add	hl, de
   4AC6 29            [11] 1219 	add	hl, hl
   4AC7 19            [11] 1220 	add	hl, de
   4AC8 D1            [10] 1221 	pop	de
   4AC9 09            [11] 1222 	add	hl,bc
   4ACA DD 75 FE      [19] 1223 	ld	-2 (ix), l
   4ACD DD 74 FF      [19] 1224 	ld	-1 (ix), h
   4AD0 C5            [11] 1225 	push	bc
   4AD1 01 0A 00      [10] 1226 	ld	bc, #0x000a
   4AD4 09            [11] 1227 	add	hl, bc
   4AD5 C1            [10] 1228 	pop	bc
   4AD6 7E            [ 7] 1229 	ld	a, (hl)
   4AD7 B7            [ 4] 1230 	or	a, a
   4AD8 28 49         [12] 1231 	jr	Z,00172$
                           1232 ;src/juego.c:229: cpct_drawSolidBox (cpct_getScreenPtr (CPCT_VMEM_START, entidad[i].pos_x, 132), cpct_px2byteM1 (0, 0, 0, 0), 4, 28);
   4ADA C5            [11] 1233 	push	bc
   4ADB D5            [11] 1234 	push	de
   4ADC 21 00 00      [10] 1235 	ld	hl, #0x0000
   4ADF E5            [11] 1236 	push	hl
   4AE0 2E 00         [ 7] 1237 	ld	l, #0x00
   4AE2 E5            [11] 1238 	push	hl
   4AE3 CD 38 54      [17] 1239 	call	_cpct_px2byteM1
   4AE6 F1            [10] 1240 	pop	af
   4AE7 F1            [10] 1241 	pop	af
   4AE8 DD 75 FD      [19] 1242 	ld	-3 (ix), l
   4AEB D1            [10] 1243 	pop	de
   4AEC C1            [10] 1244 	pop	bc
   4AED DD 6E FE      [19] 1245 	ld	l,-2 (ix)
   4AF0 DD 66 FF      [19] 1246 	ld	h,-1 (ix)
   4AF3 C5            [11] 1247 	push	bc
   4AF4 01 0F 00      [10] 1248 	ld	bc, #0x000f
   4AF7 09            [11] 1249 	add	hl, bc
   4AF8 C1            [10] 1250 	pop	bc
   4AF9 66            [ 7] 1251 	ld	h, (hl)
   4AFA C5            [11] 1252 	push	bc
   4AFB D5            [11] 1253 	push	de
   4AFC 3E 84         [ 7] 1254 	ld	a, #0x84
   4AFE F5            [11] 1255 	push	af
   4AFF 33            [ 6] 1256 	inc	sp
   4B00 E5            [11] 1257 	push	hl
   4B01 33            [ 6] 1258 	inc	sp
   4B02 21 00 C0      [10] 1259 	ld	hl, #0xc000
   4B05 E5            [11] 1260 	push	hl
   4B06 CD 1E 55      [17] 1261 	call	_cpct_getScreenPtr
   4B09 D1            [10] 1262 	pop	de
   4B0A C1            [10] 1263 	pop	bc
   4B0B E5            [11] 1264 	push	hl
   4B0C FD E1         [14] 1265 	pop	iy
   4B0E C5            [11] 1266 	push	bc
   4B0F D5            [11] 1267 	push	de
   4B10 21 04 1C      [10] 1268 	ld	hl, #0x1c04
   4B13 E5            [11] 1269 	push	hl
   4B14 DD 7E FD      [19] 1270 	ld	a, -3 (ix)
   4B17 F5            [11] 1271 	push	af
   4B18 33            [ 6] 1272 	inc	sp
   4B19 FD E5         [15] 1273 	push	iy
   4B1B CD 65 54      [17] 1274 	call	_cpct_drawSolidBox
   4B1E F1            [10] 1275 	pop	af
   4B1F F1            [10] 1276 	pop	af
   4B20 33            [ 6] 1277 	inc	sp
   4B21 D1            [10] 1278 	pop	de
   4B22 C1            [10] 1279 	pop	bc
   4B23                    1280 00172$:
                           1281 ;src/juego.c:227: for (i = 0; i < 3; i++) {
   4B23 DD 34 F1      [23] 1282 	inc	-15 (ix)
   4B26 DD 7E F1      [19] 1283 	ld	a, -15 (ix)
   4B29 D6 03         [ 7] 1284 	sub	a, #0x03
   4B2B 38 8D         [12] 1285 	jr	C,00171$
                           1286 ;src/juego.c:234: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
   4B2D C5            [11] 1287 	push	bc
   4B2E D5            [11] 1288 	push	de
   4B2F 21 04 04      [10] 1289 	ld	hl, #0x0404
   4B32 CD E9 50      [17] 1290 	call	_cpct_isKeyPressed
   4B35 D1            [10] 1291 	pop	de
   4B36 C1            [10] 1292 	pop	bc
                           1293 ;src/juego.c:238: nueva_pos = entidad[0].pos_x - 4;
                           1294 ;src/juego.c:234: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
   4B37 7D            [ 4] 1295 	ld	a, l
   4B38 B7            [ 4] 1296 	or	a, a
   4B39 20 1C         [12] 1297 	jr	NZ,00122$
   4B3B C5            [11] 1298 	push	bc
   4B3C D5            [11] 1299 	push	de
   4B3D 21 01 01      [10] 1300 	ld	hl, #0x0101
   4B40 CD E9 50      [17] 1301 	call	_cpct_isKeyPressed
   4B43 D1            [10] 1302 	pop	de
   4B44 C1            [10] 1303 	pop	bc
   4B45 7D            [ 4] 1304 	ld	a, l
   4B46 B7            [ 4] 1305 	or	a, a
   4B47 20 0E         [12] 1306 	jr	NZ,00122$
   4B49 C5            [11] 1307 	push	bc
   4B4A D5            [11] 1308 	push	de
   4B4B 21 09 04      [10] 1309 	ld	hl, #0x0409
   4B4E CD E9 50      [17] 1310 	call	_cpct_isKeyPressed
   4B51 D1            [10] 1311 	pop	de
   4B52 C1            [10] 1312 	pop	bc
   4B53 7D            [ 4] 1313 	ld	a, l
   4B54 B7            [ 4] 1314 	or	a, a
   4B55 28 37         [12] 1315 	jr	Z,00123$
   4B57                    1316 00122$:
                           1317 ;src/juego.c:235: sprintf(temp, "%-9s GOES %c",entidad[0].name,242);
   4B57 D5            [11] 1318 	push	de
   4B58 FD E1         [14] 1319 	pop	iy
   4B5A C5            [11] 1320 	push	bc
   4B5B D5            [11] 1321 	push	de
   4B5C 21 F2 00      [10] 1322 	ld	hl, #0x00f2
   4B5F E5            [11] 1323 	push	hl
   4B60 21 EB 60      [10] 1324 	ld	hl, #_entidad
   4B63 E5            [11] 1325 	push	hl
   4B64 21 4F 4E      [10] 1326 	ld	hl, #___str_10
   4B67 E5            [11] 1327 	push	hl
   4B68 FD E5         [15] 1328 	push	iy
   4B6A CD A9 53      [17] 1329 	call	_sprintf
   4B6D 21 08 00      [10] 1330 	ld	hl, #8
   4B70 39            [11] 1331 	add	hl, sp
   4B71 F9            [ 6] 1332 	ld	sp, hl
   4B72 D1            [10] 1333 	pop	de
   4B73 C1            [10] 1334 	pop	bc
                           1335 ;src/juego.c:236: printConsole(temp, 2, 0);
   4B74 D5            [11] 1336 	push	de
   4B75 FD E1         [14] 1337 	pop	iy
   4B77 C5            [11] 1338 	push	bc
   4B78 D5            [11] 1339 	push	de
   4B79 21 02 00      [10] 1340 	ld	hl, #0x0002
   4B7C E5            [11] 1341 	push	hl
   4B7D FD E5         [15] 1342 	push	iy
   4B7F CD E7 46      [17] 1343 	call	_printConsole
   4B82 F1            [10] 1344 	pop	af
   4B83 F1            [10] 1345 	pop	af
   4B84 D1            [10] 1346 	pop	de
   4B85 C1            [10] 1347 	pop	bc
                           1348 ;src/juego.c:238: nueva_pos = entidad[0].pos_x - 4;
   4B86 3A FA 60      [13] 1349 	ld	a, (#(_entidad + 0x000f) + 0)
   4B89 C6 FC         [ 7] 1350 	add	a, #0xfc
   4B8B DD 77 F2      [19] 1351 	ld	-14 (ix), a
   4B8E                    1352 00123$:
                           1353 ;src/juego.c:242: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
   4B8E C5            [11] 1354 	push	bc
   4B8F D5            [11] 1355 	push	de
   4B90 21 03 08      [10] 1356 	ld	hl, #0x0803
   4B93 CD E9 50      [17] 1357 	call	_cpct_isKeyPressed
   4B96 D1            [10] 1358 	pop	de
   4B97 C1            [10] 1359 	pop	bc
                           1360 ;src/juego.c:248: if (nueva_pos == entidad[1].pos_x)
                           1361 ;src/juego.c:251: if (nueva_pos == entidad[2].pos_x)
                           1362 ;src/juego.c:242: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
   4B98 7D            [ 4] 1363 	ld	a, l
   4B99 B7            [ 4] 1364 	or	a, a
   4B9A 20 1C         [12] 1365 	jr	NZ,00130$
   4B9C C5            [11] 1366 	push	bc
   4B9D D5            [11] 1367 	push	de
   4B9E 21 00 02      [10] 1368 	ld	hl, #0x0200
   4BA1 CD E9 50      [17] 1369 	call	_cpct_isKeyPressed
   4BA4 D1            [10] 1370 	pop	de
   4BA5 C1            [10] 1371 	pop	bc
   4BA6 7D            [ 4] 1372 	ld	a, l
   4BA7 B7            [ 4] 1373 	or	a, a
   4BA8 20 0E         [12] 1374 	jr	NZ,00130$
   4BAA C5            [11] 1375 	push	bc
   4BAB D5            [11] 1376 	push	de
   4BAC 21 09 08      [10] 1377 	ld	hl, #0x0809
   4BAF CD E9 50      [17] 1378 	call	_cpct_isKeyPressed
   4BB2 D1            [10] 1379 	pop	de
   4BB3 C1            [10] 1380 	pop	bc
   4BB4 7D            [ 4] 1381 	ld	a, l
   4BB5 B7            [ 4] 1382 	or	a, a
   4BB6 28 75         [12] 1383 	jr	Z,00131$
   4BB8                    1384 00130$:
                           1385 ;src/juego.c:243: sprintf(temp, "%-9s GOES %c",entidad[0].name,243);
   4BB8 D5            [11] 1386 	push	de
   4BB9 FD E1         [14] 1387 	pop	iy
   4BBB C5            [11] 1388 	push	bc
   4BBC D5            [11] 1389 	push	de
   4BBD 21 F3 00      [10] 1390 	ld	hl, #0x00f3
   4BC0 E5            [11] 1391 	push	hl
   4BC1 21 EB 60      [10] 1392 	ld	hl, #_entidad
   4BC4 E5            [11] 1393 	push	hl
   4BC5 21 4F 4E      [10] 1394 	ld	hl, #___str_10
   4BC8 E5            [11] 1395 	push	hl
   4BC9 FD E5         [15] 1396 	push	iy
   4BCB CD A9 53      [17] 1397 	call	_sprintf
   4BCE 21 08 00      [10] 1398 	ld	hl, #8
   4BD1 39            [11] 1399 	add	hl, sp
   4BD2 F9            [ 6] 1400 	ld	sp, hl
   4BD3 D1            [10] 1401 	pop	de
   4BD4 C1            [10] 1402 	pop	bc
                           1403 ;src/juego.c:244: printConsole(temp, 2 ,0);
   4BD5 D5            [11] 1404 	push	de
   4BD6 FD E1         [14] 1405 	pop	iy
   4BD8 C5            [11] 1406 	push	bc
   4BD9 D5            [11] 1407 	push	de
   4BDA 21 02 00      [10] 1408 	ld	hl, #0x0002
   4BDD E5            [11] 1409 	push	hl
   4BDE FD E5         [15] 1410 	push	iy
   4BE0 CD E7 46      [17] 1411 	call	_printConsole
   4BE3 F1            [10] 1412 	pop	af
   4BE4 F1            [10] 1413 	pop	af
   4BE5 D1            [10] 1414 	pop	de
   4BE6 C1            [10] 1415 	pop	bc
                           1416 ;src/juego.c:246: nueva_pos = entidad[0].pos_x + 4;
   4BE7 3A FA 60      [13] 1417 	ld	a, (#(_entidad + 0x000f) + 0)
   4BEA C6 04         [ 7] 1418 	add	a, #0x04
   4BEC DD 77 F2      [19] 1419 	ld	-14 (ix), a
                           1420 ;src/juego.c:248: if (nueva_pos == entidad[1].pos_x)
   4BEF 3A 0D 61      [13] 1421 	ld	a,(#(_entidad + 0x0022) + 0)
   4BF2 DD 77 FD      [19] 1422 	ld	-3 (ix), a
   4BF5 DD 7E F2      [19] 1423 	ld	a, -14 (ix)
   4BF8 DD 96 FD      [19] 1424 	sub	a, -3 (ix)
   4BFB 20 11         [12] 1425 	jr	NZ,00127$
                           1426 ;src/juego.c:249: atacar(&entidad[0], &entidad[1]);
   4BFD C5            [11] 1427 	push	bc
   4BFE D5            [11] 1428 	push	de
   4BFF 21 FE 60      [10] 1429 	ld	hl, #(_entidad + 0x0013)
   4C02 E5            [11] 1430 	push	hl
   4C03 21 EB 60      [10] 1431 	ld	hl, #_entidad
   4C06 E5            [11] 1432 	push	hl
   4C07 CD 53 47      [17] 1433 	call	_atacar
   4C0A F1            [10] 1434 	pop	af
   4C0B F1            [10] 1435 	pop	af
   4C0C D1            [10] 1436 	pop	de
   4C0D C1            [10] 1437 	pop	bc
   4C0E                    1438 00127$:
                           1439 ;src/juego.c:251: if (nueva_pos == entidad[2].pos_x)
   4C0E 3A 20 61      [13] 1440 	ld	a,(#(_entidad + 0x0035) + 0)
   4C11 DD 77 FD      [19] 1441 	ld	-3 (ix), a
   4C14 DD 7E F2      [19] 1442 	ld	a, -14 (ix)
   4C17 DD 96 FD      [19] 1443 	sub	a, -3 (ix)
   4C1A 20 11         [12] 1444 	jr	NZ,00131$
                           1445 ;src/juego.c:252: atacar(&entidad[0], &entidad[2]);
   4C1C C5            [11] 1446 	push	bc
   4C1D D5            [11] 1447 	push	de
   4C1E 21 11 61      [10] 1448 	ld	hl, #(_entidad + 0x0026)
   4C21 E5            [11] 1449 	push	hl
   4C22 21 EB 60      [10] 1450 	ld	hl, #_entidad
   4C25 E5            [11] 1451 	push	hl
   4C26 CD 53 47      [17] 1452 	call	_atacar
   4C29 F1            [10] 1453 	pop	af
   4C2A F1            [10] 1454 	pop	af
   4C2B D1            [10] 1455 	pop	de
   4C2C C1            [10] 1456 	pop	bc
   4C2D                    1457 00131$:
                           1458 ;src/juego.c:257: if (cpct_isKeyPressed(Key_D) || cpct_isKeyPressed(Joy0_Fire1)) {
   4C2D C5            [11] 1459 	push	bc
   4C2E D5            [11] 1460 	push	de
   4C2F 21 07 20      [10] 1461 	ld	hl, #0x2007
   4C32 CD E9 50      [17] 1462 	call	_cpct_isKeyPressed
   4C35 D1            [10] 1463 	pop	de
   4C36 C1            [10] 1464 	pop	bc
   4C37 7D            [ 4] 1465 	ld	a, l
   4C38 B7            [ 4] 1466 	or	a, a
   4C39 20 0E         [12] 1467 	jr	NZ,00134$
   4C3B C5            [11] 1468 	push	bc
   4C3C D5            [11] 1469 	push	de
   4C3D 21 09 10      [10] 1470 	ld	hl, #0x1009
   4C40 CD E9 50      [17] 1471 	call	_cpct_isKeyPressed
   4C43 D1            [10] 1472 	pop	de
   4C44 C1            [10] 1473 	pop	bc
   4C45 7D            [ 4] 1474 	ld	a, l
   4C46 B7            [ 4] 1475 	or	a, a
   4C47 28 0B         [12] 1476 	jr	Z,00135$
   4C49                    1477 00134$:
                           1478 ;src/juego.c:258: defender(&entidad[0]);
   4C49 69            [ 4] 1479 	ld	l, c
   4C4A 60            [ 4] 1480 	ld	h, b
   4C4B C5            [11] 1481 	push	bc
   4C4C D5            [11] 1482 	push	de
   4C4D E5            [11] 1483 	push	hl
   4C4E CD 89 48      [17] 1484 	call	_defender
   4C51 F1            [10] 1485 	pop	af
   4C52 D1            [10] 1486 	pop	de
   4C53 C1            [10] 1487 	pop	bc
   4C54                    1488 00135$:
                           1489 ;src/juego.c:264: && (!entidad[1].energy || nueva_pos != entidad[1].pos_x)
                           1490 ;src/juego.c:265: && (!entidad[2].energy || nueva_pos != entidad[2].pos_x)
                           1491 ;src/juego.c:263: && nueva_pos < 37 
   4C54 3E 03         [ 7] 1492 	ld	a, #0x03
   4C56 DD 96 F2      [19] 1493 	sub	a, -14 (ix)
   4C59 30 36         [12] 1494 	jr	NC,00215$
                           1495 ;src/juego.c:264: && (!entidad[1].energy || nueva_pos != entidad[1].pos_x)
   4C5B DD 7E F2      [19] 1496 	ld	a, -14 (ix)
   4C5E D6 25         [ 7] 1497 	sub	a, #0x25
   4C60 30 2F         [12] 1498 	jr	NC,00215$
   4C62 3A 08 61      [13] 1499 	ld	a, (#(_entidad + 0x001d) + 0)
   4C65 B7            [ 4] 1500 	or	a, a
   4C66 28 0E         [12] 1501 	jr	Z,00143$
   4C68 3A 0D 61      [13] 1502 	ld	a,(#(_entidad + 0x0022) + 0)
   4C6B DD 77 FD      [19] 1503 	ld	-3 (ix), a
   4C6E DD 7E F2      [19] 1504 	ld	a, -14 (ix)
   4C71 DD 96 FD      [19] 1505 	sub	a, -3 (ix)
   4C74 28 1B         [12] 1506 	jr	Z,00215$
   4C76                    1507 00143$:
                           1508 ;src/juego.c:265: && (!entidad[2].energy || nueva_pos != entidad[2].pos_x)
   4C76 3A 1B 61      [13] 1509 	ld	a, (#(_entidad + 0x0030) + 0)
   4C79 B7            [ 4] 1510 	or	a, a
   4C7A 28 0E         [12] 1511 	jr	Z,00137$
   4C7C 3A 20 61      [13] 1512 	ld	a,(#(_entidad + 0x0035) + 0)
   4C7F DD 77 FD      [19] 1513 	ld	-3 (ix), a
   4C82 DD 7E F2      [19] 1514 	ld	a, -14 (ix)
   4C85 DD 96 FD      [19] 1515 	sub	a, -3 (ix)
   4C88 28 07         [12] 1516 	jr	Z,00215$
   4C8A                    1517 00137$:
                           1518 ;src/juego.c:267: entidad[0].pos_x = nueva_pos;
   4C8A 21 FA 60      [10] 1519 	ld	hl, #(_entidad + 0x000f)
   4C8D DD 7E F2      [19] 1520 	ld	a, -14 (ix)
   4C90 77            [ 7] 1521 	ld	(hl), a
                           1522 ;src/juego.c:272: for (i = 1; i < 3; i++) {
   4C91                    1523 00215$:
   4C91 DD 73 FE      [19] 1524 	ld	-2 (ix), e
   4C94 DD 72 FF      [19] 1525 	ld	-1 (ix), d
   4C97 DD 73 FB      [19] 1526 	ld	-5 (ix), e
   4C9A DD 72 FC      [19] 1527 	ld	-4 (ix), d
   4C9D DD 73 F9      [19] 1528 	ld	-7 (ix), e
   4CA0 DD 72 FA      [19] 1529 	ld	-6 (ix), d
   4CA3 DD 73 F7      [19] 1530 	ld	-9 (ix), e
   4CA6 DD 72 F8      [19] 1531 	ld	-8 (ix), d
   4CA9 DD 36 F1 01   [19] 1532 	ld	-15 (ix), #0x01
   4CAD                    1533 00175$:
                           1534 ;src/juego.c:273: if (entidad[i].energy) {
   4CAD DD 5E F1      [19] 1535 	ld	e,-15 (ix)
   4CB0 16 00         [ 7] 1536 	ld	d,#0x00
   4CB2 6B            [ 4] 1537 	ld	l, e
   4CB3 62            [ 4] 1538 	ld	h, d
   4CB4 29            [11] 1539 	add	hl, hl
   4CB5 29            [11] 1540 	add	hl, hl
   4CB6 29            [11] 1541 	add	hl, hl
   4CB7 19            [11] 1542 	add	hl, de
   4CB8 29            [11] 1543 	add	hl, hl
   4CB9 19            [11] 1544 	add	hl, de
   4CBA 09            [11] 1545 	add	hl,bc
   4CBB DD 75 F5      [19] 1546 	ld	-11 (ix), l
   4CBE DD 74 F6      [19] 1547 	ld	-10 (ix), h
   4CC1 11 0A 00      [10] 1548 	ld	de, #0x000a
   4CC4 19            [11] 1549 	add	hl, de
   4CC5 7E            [ 7] 1550 	ld	a, (hl)
   4CC6 B7            [ 4] 1551 	or	a, a
   4CC7 CA 05 4E      [10] 1552 	jp	Z, 00176$
                           1553 ;src/juego.c:274: if (abs(entidad[i].pos_x - entidad[0].pos_x) == 4) //Si está en casilla contigua, atacar
   4CCA DD 7E F5      [19] 1554 	ld	a, -11 (ix)
   4CCD C6 0F         [ 7] 1555 	add	a, #0x0f
   4CCF DD 77 F3      [19] 1556 	ld	-13 (ix), a
   4CD2 DD 7E F6      [19] 1557 	ld	a, -10 (ix)
   4CD5 CE 00         [ 7] 1558 	adc	a, #0x00
   4CD7 DD 77 F4      [19] 1559 	ld	-12 (ix), a
   4CDA DD 6E F3      [19] 1560 	ld	l,-13 (ix)
   4CDD DD 66 F4      [19] 1561 	ld	h,-12 (ix)
   4CE0 5E            [ 7] 1562 	ld	e, (hl)
   4CE1 21 FA 60      [10] 1563 	ld	hl, #(_entidad + 0x000f) + 0
   4CE4 56            [ 7] 1564 	ld	d, (hl)
   4CE5 7B            [ 4] 1565 	ld	a, e
   4CE6 92            [ 4] 1566 	sub	a, d
   4CE7 57            [ 4] 1567 	ld	d, a
   4CE8 C5            [11] 1568 	push	bc
   4CE9 D5            [11] 1569 	push	de
   4CEA 33            [ 6] 1570 	inc	sp
   4CEB CD 8F 43      [17] 1571 	call	_abs
   4CEE 33            [ 6] 1572 	inc	sp
   4CEF C1            [10] 1573 	pop	bc
   4CF0 7D            [ 4] 1574 	ld	a, l
   4CF1 D6 04         [ 7] 1575 	sub	a, #0x04
   4CF3 20 15         [12] 1576 	jr	NZ,00151$
                           1577 ;src/juego.c:275: atacar(&entidad[i], &entidad[0]);
   4CF5 11 EB 60      [10] 1578 	ld	de, #_entidad
   4CF8 DD 6E F5      [19] 1579 	ld	l,-11 (ix)
   4CFB DD 66 F6      [19] 1580 	ld	h,-10 (ix)
   4CFE C5            [11] 1581 	push	bc
   4CFF D5            [11] 1582 	push	de
   4D00 E5            [11] 1583 	push	hl
   4D01 CD 53 47      [17] 1584 	call	_atacar
   4D04 F1            [10] 1585 	pop	af
   4D05 F1            [10] 1586 	pop	af
   4D06 C1            [10] 1587 	pop	bc
   4D07 C3 B9 4D      [10] 1588 	jp	00212$
   4D0A                    1589 00151$:
                           1590 ;src/juego.c:277: enemy_mov = cpct_rand()%3; //33% de moverse a izquierda, derecha o curarse
   4D0A C5            [11] 1591 	push	bc
   4D0B CD 00 53      [17] 1592 	call	_cpct_getRandom_mxor_u8
   4D0E 55            [ 4] 1593 	ld	d, l
   4D0F 3E 03         [ 7] 1594 	ld	a, #0x03
   4D11 F5            [11] 1595 	push	af
   4D12 33            [ 6] 1596 	inc	sp
   4D13 D5            [11] 1597 	push	de
   4D14 33            [ 6] 1598 	inc	sp
   4D15 CD 90 52      [17] 1599 	call	__moduchar
   4D18 F1            [10] 1600 	pop	af
   4D19 5D            [ 4] 1601 	ld	e, l
   4D1A C1            [10] 1602 	pop	bc
                           1603 ;src/juego.c:278: if (enemy_mov == 1) {
   4D1B 7B            [ 4] 1604 	ld	a, e
   4D1C 3D            [ 4] 1605 	dec	a
   4D1D 20 44         [12] 1606 	jr	NZ,00148$
                           1607 ;src/juego.c:279: sprintf(temp, "%-9s GOES %c",entidad[i].name,242);
   4D1F DD 5E F5      [19] 1608 	ld	e,-11 (ix)
   4D22 DD 56 F6      [19] 1609 	ld	d,-10 (ix)
   4D25 D5            [11] 1610 	push	de
   4D26 FD E1         [14] 1611 	pop	iy
   4D28 DD 5E F9      [19] 1612 	ld	e,-7 (ix)
   4D2B DD 56 FA      [19] 1613 	ld	d,-6 (ix)
   4D2E C5            [11] 1614 	push	bc
   4D2F 21 F2 00      [10] 1615 	ld	hl, #0x00f2
   4D32 E5            [11] 1616 	push	hl
   4D33 FD E5         [15] 1617 	push	iy
   4D35 21 4F 4E      [10] 1618 	ld	hl, #___str_10
   4D38 E5            [11] 1619 	push	hl
   4D39 D5            [11] 1620 	push	de
   4D3A CD A9 53      [17] 1621 	call	_sprintf
   4D3D 21 08 00      [10] 1622 	ld	hl, #8
   4D40 39            [11] 1623 	add	hl, sp
   4D41 F9            [ 6] 1624 	ld	sp, hl
   4D42 C1            [10] 1625 	pop	bc
                           1626 ;src/juego.c:280: printConsole(temp, 2, 0);
   4D43 DD 5E F7      [19] 1627 	ld	e,-9 (ix)
   4D46 DD 56 F8      [19] 1628 	ld	d,-8 (ix)
   4D49 C5            [11] 1629 	push	bc
   4D4A 21 02 00      [10] 1630 	ld	hl, #0x0002
   4D4D E5            [11] 1631 	push	hl
   4D4E D5            [11] 1632 	push	de
   4D4F CD E7 46      [17] 1633 	call	_printConsole
   4D52 F1            [10] 1634 	pop	af
   4D53 F1            [10] 1635 	pop	af
   4D54 C1            [10] 1636 	pop	bc
                           1637 ;src/juego.c:282: nueva_pos = entidad[i].pos_x - 4;
   4D55 DD 6E F3      [19] 1638 	ld	l,-13 (ix)
   4D58 DD 66 F4      [19] 1639 	ld	h,-12 (ix)
   4D5B 7E            [ 7] 1640 	ld	a, (hl)
   4D5C C6 FC         [ 7] 1641 	add	a, #0xfc
   4D5E DD 77 F2      [19] 1642 	ld	-14 (ix), a
   4D61 18 56         [12] 1643 	jr	00212$
   4D63                    1644 00148$:
                           1645 ;src/juego.c:283: } else if (enemy_mov == 2) {
   4D63 7B            [ 4] 1646 	ld	a, e
   4D64 D6 02         [ 7] 1647 	sub	a, #0x02
   4D66 20 44         [12] 1648 	jr	NZ,00145$
                           1649 ;src/juego.c:284: sprintf(temp, "%-9s GOES %c",entidad[i].name,243);
   4D68 DD 5E F5      [19] 1650 	ld	e,-11 (ix)
   4D6B DD 56 F6      [19] 1651 	ld	d,-10 (ix)
   4D6E D5            [11] 1652 	push	de
   4D6F FD E1         [14] 1653 	pop	iy
   4D71 DD 5E FE      [19] 1654 	ld	e,-2 (ix)
   4D74 DD 56 FF      [19] 1655 	ld	d,-1 (ix)
   4D77 C5            [11] 1656 	push	bc
   4D78 21 F3 00      [10] 1657 	ld	hl, #0x00f3
   4D7B E5            [11] 1658 	push	hl
   4D7C FD E5         [15] 1659 	push	iy
   4D7E 21 4F 4E      [10] 1660 	ld	hl, #___str_10
   4D81 E5            [11] 1661 	push	hl
   4D82 D5            [11] 1662 	push	de
   4D83 CD A9 53      [17] 1663 	call	_sprintf
   4D86 21 08 00      [10] 1664 	ld	hl, #8
   4D89 39            [11] 1665 	add	hl, sp
   4D8A F9            [ 6] 1666 	ld	sp, hl
   4D8B C1            [10] 1667 	pop	bc
                           1668 ;src/juego.c:285: printConsole(temp, 2, 0);
   4D8C DD 5E FB      [19] 1669 	ld	e,-5 (ix)
   4D8F DD 56 FC      [19] 1670 	ld	d,-4 (ix)
   4D92 C5            [11] 1671 	push	bc
   4D93 21 02 00      [10] 1672 	ld	hl, #0x0002
   4D96 E5            [11] 1673 	push	hl
   4D97 D5            [11] 1674 	push	de
   4D98 CD E7 46      [17] 1675 	call	_printConsole
   4D9B F1            [10] 1676 	pop	af
   4D9C F1            [10] 1677 	pop	af
   4D9D C1            [10] 1678 	pop	bc
                           1679 ;src/juego.c:287: nueva_pos = entidad[i].pos_x + 4;
   4D9E DD 6E F3      [19] 1680 	ld	l,-13 (ix)
   4DA1 DD 66 F4      [19] 1681 	ld	h,-12 (ix)
   4DA4 7E            [ 7] 1682 	ld	a, (hl)
   4DA5 C6 04         [ 7] 1683 	add	a, #0x04
   4DA7 DD 77 F2      [19] 1684 	ld	-14 (ix), a
   4DAA 18 0D         [12] 1685 	jr	00212$
   4DAC                    1686 00145$:
                           1687 ;src/juego.c:289: defender(&entidad[i]);
   4DAC DD 5E F5      [19] 1688 	ld	e,-11 (ix)
   4DAF DD 56 F6      [19] 1689 	ld	d,-10 (ix)
   4DB2 C5            [11] 1690 	push	bc
   4DB3 D5            [11] 1691 	push	de
   4DB4 CD 89 48      [17] 1692 	call	_defender
   4DB7 F1            [10] 1693 	pop	af
   4DB8 C1            [10] 1694 	pop	bc
                           1695 ;src/juego.c:293: for (j = 0; j < 3; j++) {
   4DB9                    1696 00212$:
   4DB9 DD 36 CC 00   [19] 1697 	ld	-52 (ix), #0x00
   4DBD                    1698 00173$:
                           1699 ;src/juego.c:294: if (i!=j) {
   4DBD DD 7E F1      [19] 1700 	ld	a, -15 (ix)
   4DC0 DD 96 CC      [19] 1701 	sub	a, -52 (ix)
   4DC3 28 1E         [12] 1702 	jr	Z,00174$
                           1703 ;src/juego.c:295: if (entidad[j].pos_x == nueva_pos) {
   4DC5 DD 5E CC      [19] 1704 	ld	e,-52 (ix)
   4DC8 16 00         [ 7] 1705 	ld	d,#0x00
   4DCA 6B            [ 4] 1706 	ld	l, e
   4DCB 62            [ 4] 1707 	ld	h, d
   4DCC 29            [11] 1708 	add	hl, hl
   4DCD 29            [11] 1709 	add	hl, hl
   4DCE 29            [11] 1710 	add	hl, hl
   4DCF 19            [11] 1711 	add	hl, de
   4DD0 29            [11] 1712 	add	hl, hl
   4DD1 19            [11] 1713 	add	hl, de
   4DD2 09            [11] 1714 	add	hl, bc
   4DD3 11 0F 00      [10] 1715 	ld	de, #0x000f
   4DD6 19            [11] 1716 	add	hl, de
   4DD7 DD 7E F2      [19] 1717 	ld	a,-14 (ix)
   4DDA 96            [ 7] 1718 	sub	a,(hl)
   4DDB 20 06         [12] 1719 	jr	NZ,00174$
                           1720 ;src/juego.c:296: nueva_pos = 0;
   4DDD DD 36 F2 00   [19] 1721 	ld	-14 (ix), #0x00
                           1722 ;src/juego.c:297: break;
   4DE1 18 0A         [12] 1723 	jr	00157$
   4DE3                    1724 00174$:
                           1725 ;src/juego.c:293: for (j = 0; j < 3; j++) {
   4DE3 DD 34 CC      [23] 1726 	inc	-52 (ix)
   4DE6 DD 7E CC      [19] 1727 	ld	a, -52 (ix)
   4DE9 D6 03         [ 7] 1728 	sub	a, #0x03
   4DEB 38 D0         [12] 1729 	jr	C,00173$
   4DED                    1730 00157$:
                           1731 ;src/juego.c:303: if (nueva_pos > 3 && nueva_pos < 37)
   4DED 3E 03         [ 7] 1732 	ld	a, #0x03
   4DEF DD 96 F2      [19] 1733 	sub	a, -14 (ix)
   4DF2 30 11         [12] 1734 	jr	NC,00176$
   4DF4 DD 7E F2      [19] 1735 	ld	a, -14 (ix)
   4DF7 D6 25         [ 7] 1736 	sub	a, #0x25
   4DF9 30 0A         [12] 1737 	jr	NC,00176$
                           1738 ;src/juego.c:304: entidad[i].pos_x = nueva_pos; 
   4DFB DD 6E F3      [19] 1739 	ld	l,-13 (ix)
   4DFE DD 66 F4      [19] 1740 	ld	h,-12 (ix)
   4E01 DD 7E F2      [19] 1741 	ld	a, -14 (ix)
   4E04 77            [ 7] 1742 	ld	(hl), a
   4E05                    1743 00176$:
                           1744 ;src/juego.c:272: for (i = 1; i < 3; i++) {
   4E05 DD 34 F1      [23] 1745 	inc	-15 (ix)
   4E08 DD 7E F1      [19] 1746 	ld	a, -15 (ix)
   4E0B D6 03         [ 7] 1747 	sub	a, #0x03
   4E0D DA AD 4C      [10] 1748 	jp	C, 00175$
                           1749 ;src/juego.c:308: pausa();
   4E10 C5            [11] 1750 	push	bc
   4E11 CD B7 43      [17] 1751 	call	_pausa
   4E14 CD C4 43      [17] 1752 	call	_pausaTecladoLibre
   4E17 C1            [10] 1753 	pop	bc
                           1754 ;src/juego.c:311: if (entidad[0].energy)
   4E18 3A F5 60      [13] 1755 	ld	a, (#_entidad + 10)
   4E1B B7            [ 4] 1756 	or	a, a
   4E1C 28 04         [12] 1757 	jr	Z,00165$
                           1758 ;src/juego.c:312: return 1;
   4E1E 2E 01         [ 7] 1759 	ld	l, #0x01
   4E20 18 16         [12] 1760 	jr	00177$
   4E22                    1761 00165$:
                           1762 ;src/juego.c:314: if (!entidad[1].energy && !entidad[2].energy){
   4E22 3A 08 61      [13] 1763 	ld	a, (#(_entidad + 0x001d) + 0)
   4E25 B7            [ 4] 1764 	or	a, a
   4E26 20 0E         [12] 1765 	jr	NZ,00167$
   4E28 3A 1B 61      [13] 1766 	ld	a, (#(_entidad + 0x0030) + 0)
   4E2B B7            [ 4] 1767 	or	a, a
   4E2C 20 08         [12] 1768 	jr	NZ,00167$
                           1769 ;src/juego.c:315: nivel++;
   4E2E 21 24 61      [10] 1770 	ld	hl, #_nivel+0
   4E31 34            [11] 1771 	inc	(hl)
                           1772 ;src/juego.c:316: return 1;
   4E32 2E 01         [ 7] 1773 	ld	l, #0x01
   4E34 18 02         [12] 1774 	jr	00177$
   4E36                    1775 00167$:
                           1776 ;src/juego.c:320: return 0;
   4E36 2E 00         [ 7] 1777 	ld	l, #0x00
   4E38                    1778 00177$:
   4E38 DD F9         [10] 1779 	ld	sp, ix
   4E3A DD E1         [14] 1780 	pop	ix
   4E3C C9            [10] 1781 	ret
   4E3D                    1782 ___str_9:
   4E3D 41 43 54 49 4F 4E  1783 	.ascii "ACTION (%c/%c/D)?"
        20 28 25 63 2F 25
        63 2F 44 29 3F
   4E4E 00                 1784 	.db 0x00
   4E4F                    1785 ___str_10:
   4E4F 25 2D 39 73 20 47  1786 	.ascii "%-9s GOES %c"
        4F 45 53 20 25 63
   4E5B 00                 1787 	.db 0x00
                           1788 ;src/juego.c:323: void juego() {
                           1789 ;	---------------------------------
                           1790 ; Function juego
                           1791 ; ---------------------------------
   4E5C                    1792 _juego::
                           1793 ;src/juego.c:324: initPlayer();
   4E5C CD 1D 45      [17] 1794 	call	_initPlayer
                           1795 ;src/juego.c:326: while(entidad[0].energy) {
   4E5F                    1796 00107$:
   4E5F 3A F5 60      [13] 1797 	ld	a, (#(_entidad + 0x000a) + 0)
   4E62 B7            [ 4] 1798 	or	a, a
   4E63 C8            [11] 1799 	ret	Z
                           1800 ;src/juego.c:327: cpct_clearScreen(0x00);
   4E64 21 00 40      [10] 1801 	ld	hl, #0x4000
   4E67 E5            [11] 1802 	push	hl
   4E68 AF            [ 4] 1803 	xor	a, a
   4E69 F5            [11] 1804 	push	af
   4E6A 33            [ 6] 1805 	inc	sp
   4E6B 26 C0         [ 7] 1806 	ld	h, #0xc0
   4E6D E5            [11] 1807 	push	hl
   4E6E CD 2A 54      [17] 1808 	call	_cpct_memset
                           1809 ;src/juego.c:328: cursorConsola = 64;
   4E71 21 4C 61      [10] 1810 	ld	hl,#_cursorConsola + 0
   4E74 36 40         [10] 1811 	ld	(hl), #0x40
                           1812 ;src/juego.c:330: dibujarMarco();
   4E76 CD CF 43      [17] 1813 	call	_dibujarMarco
                           1814 ;src/juego.c:331: dibujarEscenario();
   4E79 CD D5 44      [17] 1815 	call	_dibujarEscenario
                           1816 ;src/juego.c:333: initNivel();
   4E7C CD 5D 45      [17] 1817 	call	_initNivel
                           1818 ;src/juego.c:334: while (turno())
   4E7F                    1819 00101$:
   4E7F CD 5F 49      [17] 1820 	call	_turno
   4E82 7D            [ 4] 1821 	ld	a, l
   4E83 B7            [ 4] 1822 	or	a, a
   4E84 20 F9         [12] 1823 	jr	NZ,00101$
                           1824 ;src/juego.c:339: do {
   4E86                    1825 00104$:
                           1826 ;src/juego.c:340: cpct_scanKeyboard_f();
   4E86 CD F5 50      [17] 1827 	call	_cpct_scanKeyboard_f
                           1828 ;src/juego.c:342: while (!cpct_isAnyKeyPressed_f());
   4E89 CD 0F 54      [17] 1829 	call	_cpct_isAnyKeyPressed_f
   4E8C 7D            [ 4] 1830 	ld	a, l
   4E8D B7            [ 4] 1831 	or	a, a
   4E8E 28 F6         [12] 1832 	jr	Z,00104$
   4E90 18 CD         [12] 1833 	jr	00107$
                           1834 	.area _CODE
                           1835 	.area _INITIALIZER
                           1836 	.area _CABS (ABS)
