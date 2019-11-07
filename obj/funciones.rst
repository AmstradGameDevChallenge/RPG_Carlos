                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (CYGWIN)
                              4 ;--------------------------------------------------------
                              5 	.module funciones
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _drawPotion
                             12 	.globl _defender
                             13 	.globl _atacar
                             14 	.globl _printConsole
                             15 	.globl _printLevel
                             16 	.globl _printStats
                             17 	.globl _dibujarEscenario
                             18 	.globl _dibujarMarcoInterior
                             19 	.globl _dibujarMarcoExterior
                             20 	.globl _pausaTecladoLibre
                             21 	.globl _efecto_pliegue
                             22 	.globl _pausa
                             23 	.globl _abs
                             24 	.globl _mydrawStringM1
                             25 	.globl _sprintf
                             26 	.globl _cpct_etm_setTileset2x4
                             27 	.globl _cpct_etm_drawTileBox2x4
                             28 	.globl _cpct_getRandom_mxor_u8
                             29 	.globl _cpct_setCRTCReg
                             30 	.globl _cpct_getScreenPtr
                             31 	.globl _cpct_setDrawCharM1
                             32 	.globl _cpct_drawSpriteMasked
                             33 	.globl _cpct_drawSprite
                             34 	.globl _cpct_drawSolidBox
                             35 	.globl _cpct_px2byteM1
                             36 	.globl _cpct_isAnyKeyPressed_f
                             37 	.globl _cpct_scanKeyboard_f
                             38 ;--------------------------------------------------------
                             39 ; special function registers
                             40 ;--------------------------------------------------------
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DATA
                             45 ;--------------------------------------------------------
                             46 ; ram data
                             47 ;--------------------------------------------------------
                             48 	.area _INITIALIZED
                             49 ;--------------------------------------------------------
                             50 ; absolute external ram data
                             51 ;--------------------------------------------------------
                             52 	.area _DABS (ABS)
                             53 ;--------------------------------------------------------
                             54 ; global & static initialisations
                             55 ;--------------------------------------------------------
                             56 	.area _HOME
                             57 	.area _GSINIT
                             58 	.area _GSFINAL
                             59 	.area _GSINIT
                             60 ;--------------------------------------------------------
                             61 ; Home
                             62 ;--------------------------------------------------------
                             63 	.area _HOME
                             64 	.area _HOME
                             65 ;--------------------------------------------------------
                             66 ; code
                             67 ;--------------------------------------------------------
                             68 	.area _CODE
                             69 ;src/funciones.c:40: u8 abs (i8 valor){
                             70 ;	---------------------------------
                             71 ; Function abs
                             72 ; ---------------------------------
   52AD                      73 _abs::
                             74 ;src/funciones.c:41: return (valor > 0 ? valor : -valor);
   52AD AF            [ 4]   75 	xor	a, a
   52AE FD 21 02 00   [14]   76 	ld	iy, #2
   52B2 FD 39         [15]   77 	add	iy, sp
   52B4 FD 96 00      [19]   78 	sub	a, 0 (iy)
   52B7 E2 BC 52      [10]   79 	jp	PO, 00109$
   52BA EE 80         [ 7]   80 	xor	a, #0x80
   52BC                      81 00109$:
   52BC F2 C9 52      [10]   82 	jp	P, 00103$
   52BF FD 21 02 00   [14]   83 	ld	iy, #2
   52C3 FD 39         [15]   84 	add	iy, sp
   52C5 FD 6E 00      [19]   85 	ld	l, 0 (iy)
   52C8 C9            [10]   86 	ret
   52C9                      87 00103$:
   52C9 AF            [ 4]   88 	xor	a, a
   52CA FD 21 02 00   [14]   89 	ld	iy, #2
   52CE FD 39         [15]   90 	add	iy, sp
   52D0 FD 96 00      [19]   91 	sub	a, 0 (iy)
   52D3 6F            [ 4]   92 	ld	l, a
   52D4 C9            [10]   93 	ret
                             94 ;src/funciones.c:44: void pausa(u16 ciclos) {
                             95 ;	---------------------------------
                             96 ; Function pausa
                             97 ; ---------------------------------
   52D5                      98 _pausa::
                             99 ;src/funciones.c:47: for (i = 0; i < ciclos; i++)
   52D5 01 00 00      [10]  100 	ld	bc, #0x0000
   52D8                     101 00103$:
   52D8 21 02 00      [10]  102 	ld	hl, #2
   52DB 39            [11]  103 	add	hl, sp
   52DC 79            [ 4]  104 	ld	a, c
   52DD 96            [ 7]  105 	sub	a, (hl)
   52DE 78            [ 4]  106 	ld	a, b
   52DF 23            [ 6]  107 	inc	hl
   52E0 9E            [ 7]  108 	sbc	a, (hl)
   52E1 D0            [11]  109 	ret	NC
   52E2 03            [ 6]  110 	inc	bc
   52E3 18 F3         [12]  111 	jr	00103$
                            112 ;src/funciones.c:51: void efecto_pliegue(u8 modo) {
                            113 ;	---------------------------------
                            114 ; Function efecto_pliegue
                            115 ; ---------------------------------
   52E5                     116 _efecto_pliegue::
                            117 ;src/funciones.c:54: i = 200;
   52E5 06 C8         [ 7]  118 	ld	b, #0xc8
                            119 ;src/funciones.c:55: if (modo)
   52E7 21 02 00      [10]  120 	ld	hl, #2+0
   52EA 39            [11]  121 	add	hl, sp
   52EB 7E            [ 7]  122 	ld	a, (hl)
   52EC B7            [ 4]  123 	or	a, a
   52ED 28 02         [12]  124 	jr	Z,00108$
                            125 ;src/funciones.c:56: i = 1;
   52EF 06 01         [ 7]  126 	ld	b, #0x01
                            127 ;src/funciones.c:58: do {
   52F1                     128 00108$:
                            129 ;src/funciones.c:59: cpct_setCRTCReg (1, i/5);   //Cambiar nº columnas por pantalla (1-40)
   52F1 C5            [11]  130 	push	bc
   52F2 3E 05         [ 7]  131 	ld	a, #0x05
   52F4 F5            [11]  132 	push	af
   52F5 33            [ 6]  133 	inc	sp
   52F6 C5            [11]  134 	push	bc
   52F7 33            [ 6]  135 	inc	sp
   52F8 CD 1B 60      [17]  136 	call	__divuchar
   52FB F1            [10]  137 	pop	af
   52FC 55            [ 4]  138 	ld	d, l
   52FD 1E 01         [ 7]  139 	ld	e, #0x01
   52FF D5            [11]  140 	push	de
   5300 CD C5 62      [17]  141 	call	_cpct_setCRTCReg
   5303 C1            [10]  142 	pop	bc
                            143 ;src/funciones.c:60: cpct_setCRTCReg (6, i/8);   //Cambiar nº de filas por pantallas (1-25)
   5304 50            [ 4]  144 	ld	d, b
   5305 CB 3A         [ 8]  145 	srl	d
   5307 CB 3A         [ 8]  146 	srl	d
   5309 CB 3A         [ 8]  147 	srl	d
   530B C5            [11]  148 	push	bc
   530C 1E 06         [ 7]  149 	ld	e, #0x06
   530E D5            [11]  150 	push	de
   530F CD C5 62      [17]  151 	call	_cpct_setCRTCReg
   5312 C1            [10]  152 	pop	bc
                            153 ;src/funciones.c:62: for (j = 0; j < 255; j++)
   5313 0E FF         [ 7]  154 	ld	c, #0xff
   5315                     155 00113$:
   5315 59            [ 4]  156 	ld	e, c
   5316 1D            [ 4]  157 	dec	e
   5317 7B            [ 4]  158 	ld	a,e
   5318 4F            [ 4]  159 	ld	c,a
   5319 B7            [ 4]  160 	or	a, a
   531A 20 F9         [12]  161 	jr	NZ,00113$
                            162 ;src/funciones.c:65: if (modo) {
   531C 21 02 00      [10]  163 	ld	hl, #2+0
   531F 39            [11]  164 	add	hl, sp
   5320 7E            [ 7]  165 	ld	a, (hl)
   5321 B7            [ 4]  166 	or	a, a
   5322 28 03         [12]  167 	jr	Z,00105$
                            168 ;src/funciones.c:66: i++;
   5324 04            [ 4]  169 	inc	b
   5325 18 01         [12]  170 	jr	00109$
   5327                     171 00105$:
                            172 ;src/funciones.c:68: i--; 
   5327 05            [ 4]  173 	dec	b
   5328                     174 00109$:
                            175 ;src/funciones.c:70: } while (i > 0 && i <= 200);
   5328 78            [ 4]  176 	ld	a, b
   5329 B7            [ 4]  177 	or	a, a
   532A C8            [11]  178 	ret	Z
   532B 3E C8         [ 7]  179 	ld	a, #0xc8
   532D 90            [ 4]  180 	sub	a, b
   532E 30 C1         [12]  181 	jr	NC,00108$
   5330 C9            [10]  182 	ret
                            183 ;src/funciones.c:74: void pausaTecladoLibre(){
                            184 ;	---------------------------------
                            185 ; Function pausaTecladoLibre
                            186 ; ---------------------------------
   5331                     187 _pausaTecladoLibre::
                            188 ;src/funciones.c:75: while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
   5331                     189 00101$:
   5331 CD A4 61      [17]  190 	call	_cpct_isAnyKeyPressed_f
   5334 7D            [ 4]  191 	ld	a, l
   5335 B7            [ 4]  192 	or	a, a
   5336 C8            [11]  193 	ret	Z
                            194 ;src/funciones.c:76: cpct_scanKeyboard_f();
   5337 CD 4E 5E      [17]  195 	call	_cpct_scanKeyboard_f
   533A 18 F5         [12]  196 	jr	00101$
                            197 ;src/funciones.c:80: void dibujarMarcoExterior (){
                            198 ;	---------------------------------
                            199 ; Function dibujarMarcoExterior
                            200 ; ---------------------------------
   533C                     201 _dibujarMarcoExterior::
   533C DD E5         [15]  202 	push	ix
   533E DD 21 00 00   [14]  203 	ld	ix,#0
   5342 DD 39         [15]  204 	add	ix,sp
   5344 F5            [11]  205 	push	af
                            206 ;src/funciones.c:85: tile = (u8*) &G_tile_cruzada[0];
   5345 01 66 3D      [10]  207 	ld	bc, #_G_tile_cruzada+0
                            208 ;src/funciones.c:86: if ((nivel/10) == 1)
   5348 C5            [11]  209 	push	bc
   5349 3E 0A         [ 7]  210 	ld	a, #0x0a
   534B F5            [11]  211 	push	af
   534C 33            [ 6]  212 	inc	sp
   534D 3A DC 6E      [13]  213 	ld	a, (_nivel)
   5350 F5            [11]  214 	push	af
   5351 33            [ 6]  215 	inc	sp
   5352 CD 1B 60      [17]  216 	call	__divuchar
   5355 F1            [10]  217 	pop	af
   5356 C1            [10]  218 	pop	bc
   5357 7D            [ 4]  219 	ld	a, l
   5358 3D            [ 4]  220 	dec	a
   5359 20 03         [12]  221 	jr	NZ,00102$
                            222 ;src/funciones.c:87: tile = (u8*) &G_tile_caverna[0];
   535B 01 A6 3D      [10]  223 	ld	bc, #_G_tile_caverna+0
   535E                     224 00102$:
                            225 ;src/funciones.c:88: if ((nivel/10) == 2)
   535E 7D            [ 4]  226 	ld	a, l
   535F D6 02         [ 7]  227 	sub	a, #0x02
   5361 20 03         [12]  228 	jr	NZ,00115$
                            229 ;src/funciones.c:89: tile = (u8*) &G_tile_castillo[0];
   5363 01 E6 3D      [10]  230 	ld	bc, #_G_tile_castillo
                            231 ;src/funciones.c:93: for (i=0; i < 80; i += 4) {
   5366                     232 00115$:
   5366 16 00         [ 7]  233 	ld	d, #0x00
   5368                     234 00107$:
                            235 ;src/funciones.c:94: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,   0), 4, 16);
   5368 C5            [11]  236 	push	bc
   5369 D5            [11]  237 	push	de
   536A AF            [ 4]  238 	xor	a, a
   536B F5            [11]  239 	push	af
   536C 33            [ 6]  240 	inc	sp
   536D D5            [11]  241 	push	de
   536E 33            [ 6]  242 	inc	sp
   536F 21 00 C0      [10]  243 	ld	hl, #0xc000
   5372 E5            [11]  244 	push	hl
   5373 CD D3 62      [17]  245 	call	_cpct_getScreenPtr
   5376 D1            [10]  246 	pop	de
   5377 C1            [10]  247 	pop	bc
   5378 E5            [11]  248 	push	hl
   5379 FD E1         [14]  249 	pop	iy
   537B 33            [ 6]  250 	inc	sp
   537C 33            [ 6]  251 	inc	sp
   537D C5            [11]  252 	push	bc
   537E C5            [11]  253 	push	bc
   537F D5            [11]  254 	push	de
   5380 21 04 10      [10]  255 	ld	hl, #0x1004
   5383 E5            [11]  256 	push	hl
   5384 FD E5         [15]  257 	push	iy
   5386 DD 6E FE      [19]  258 	ld	l,-2 (ix)
   5389 DD 66 FF      [19]  259 	ld	h,-1 (ix)
   538C E5            [11]  260 	push	hl
   538D CD C4 5E      [17]  261 	call	_cpct_drawSprite
   5390 D1            [10]  262 	pop	de
   5391 D5            [11]  263 	push	de
   5392 3E B0         [ 7]  264 	ld	a, #0xb0
   5394 F5            [11]  265 	push	af
   5395 33            [ 6]  266 	inc	sp
   5396 D5            [11]  267 	push	de
   5397 33            [ 6]  268 	inc	sp
   5398 21 00 C0      [10]  269 	ld	hl, #0xc000
   539B E5            [11]  270 	push	hl
   539C CD D3 62      [17]  271 	call	_cpct_getScreenPtr
   539F D1            [10]  272 	pop	de
   53A0 C1            [10]  273 	pop	bc
   53A1 E5            [11]  274 	push	hl
   53A2 FD E1         [14]  275 	pop	iy
   53A4 C5            [11]  276 	push	bc
   53A5 D5            [11]  277 	push	de
   53A6 21 04 10      [10]  278 	ld	hl, #0x1004
   53A9 E5            [11]  279 	push	hl
   53AA FD E5         [15]  280 	push	iy
   53AC DD 6E FE      [19]  281 	ld	l,-2 (ix)
   53AF DD 66 FF      [19]  282 	ld	h,-1 (ix)
   53B2 E5            [11]  283 	push	hl
   53B3 CD C4 5E      [17]  284 	call	_cpct_drawSprite
   53B6 D1            [10]  285 	pop	de
   53B7 C1            [10]  286 	pop	bc
                            287 ;src/funciones.c:93: for (i=0; i < 80; i += 4) {
   53B8 14            [ 4]  288 	inc	d
   53B9 14            [ 4]  289 	inc	d
   53BA 14            [ 4]  290 	inc	d
   53BB 14            [ 4]  291 	inc	d
   53BC 7A            [ 4]  292 	ld	a, d
   53BD D6 50         [ 7]  293 	sub	a, #0x50
   53BF 38 A7         [12]  294 	jr	C,00107$
                            295 ;src/funciones.c:98: for (i=16; i < 176; i += 16 ){
   53C1 06 10         [ 7]  296 	ld	b, #0x10
   53C3                     297 00109$:
                            298 ;src/funciones.c:99: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, 0, i), 4, 16);
   53C3 C5            [11]  299 	push	bc
   53C4 C5            [11]  300 	push	bc
   53C5 33            [ 6]  301 	inc	sp
   53C6 AF            [ 4]  302 	xor	a, a
   53C7 F5            [11]  303 	push	af
   53C8 33            [ 6]  304 	inc	sp
   53C9 21 00 C0      [10]  305 	ld	hl, #0xc000
   53CC E5            [11]  306 	push	hl
   53CD CD D3 62      [17]  307 	call	_cpct_getScreenPtr
   53D0 11 04 10      [10]  308 	ld	de, #0x1004
   53D3 D5            [11]  309 	push	de
   53D4 E5            [11]  310 	push	hl
   53D5 DD 6E FE      [19]  311 	ld	l,-2 (ix)
   53D8 DD 66 FF      [19]  312 	ld	h,-1 (ix)
   53DB E5            [11]  313 	push	hl
   53DC CD C4 5E      [17]  314 	call	_cpct_drawSprite
   53DF C1            [10]  315 	pop	bc
                            316 ;src/funciones.c:100: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,76, i), 4, 16);  
   53E0 C5            [11]  317 	push	bc
   53E1 C5            [11]  318 	push	bc
   53E2 33            [ 6]  319 	inc	sp
   53E3 3E 4C         [ 7]  320 	ld	a, #0x4c
   53E5 F5            [11]  321 	push	af
   53E6 33            [ 6]  322 	inc	sp
   53E7 21 00 C0      [10]  323 	ld	hl, #0xc000
   53EA E5            [11]  324 	push	hl
   53EB CD D3 62      [17]  325 	call	_cpct_getScreenPtr
   53EE 11 04 10      [10]  326 	ld	de, #0x1004
   53F1 D5            [11]  327 	push	de
   53F2 E5            [11]  328 	push	hl
   53F3 DD 6E FE      [19]  329 	ld	l,-2 (ix)
   53F6 DD 66 FF      [19]  330 	ld	h,-1 (ix)
   53F9 E5            [11]  331 	push	hl
   53FA CD C4 5E      [17]  332 	call	_cpct_drawSprite
   53FD C1            [10]  333 	pop	bc
                            334 ;src/funciones.c:98: for (i=16; i < 176; i += 16 ){
   53FE 78            [ 4]  335 	ld	a, b
   53FF C6 10         [ 7]  336 	add	a, #0x10
   5401 47            [ 4]  337 	ld	b,a
   5402 D6 B0         [ 7]  338 	sub	a, #0xb0
   5404 38 BD         [12]  339 	jr	C,00109$
   5406 DD F9         [10]  340 	ld	sp, ix
   5408 DD E1         [14]  341 	pop	ix
   540A C9            [10]  342 	ret
                            343 ;src/funciones.c:105: void dibujarMarcoInterior (){
                            344 ;	---------------------------------
                            345 ; Function dibujarMarcoInterior
                            346 ; ---------------------------------
   540B                     347 _dibujarMarcoInterior::
   540B DD E5         [15]  348 	push	ix
   540D DD 21 00 00   [14]  349 	ld	ix,#0
   5411 DD 39         [15]  350 	add	ix,sp
   5413 F5            [11]  351 	push	af
                            352 ;src/funciones.c:110: tile = (u8*) &G_tile_cruzada[0];
   5414 01 66 3D      [10]  353 	ld	bc, #_G_tile_cruzada
                            354 ;src/funciones.c:111: if ((nivel/10) == 1)
   5417 C5            [11]  355 	push	bc
   5418 3E 0A         [ 7]  356 	ld	a, #0x0a
   541A F5            [11]  357 	push	af
   541B 33            [ 6]  358 	inc	sp
   541C 3A DC 6E      [13]  359 	ld	a, (_nivel)
   541F F5            [11]  360 	push	af
   5420 33            [ 6]  361 	inc	sp
   5421 CD 1B 60      [17]  362 	call	__divuchar
   5424 F1            [10]  363 	pop	af
   5425 C1            [10]  364 	pop	bc
   5426 2D            [ 4]  365 	dec	l
   5427 20 03         [12]  366 	jr	NZ,00112$
                            367 ;src/funciones.c:112: tile = (u8*) &G_tile_cruzada[0];
   5429 01 66 3D      [10]  368 	ld	bc, #_G_tile_cruzada
                            369 ;src/funciones.c:116: for (i=0; i < 80; i += 4) {
   542C                     370 00112$:
   542C 1E 00         [ 7]  371 	ld	e, #0x00
   542E                     372 00105$:
                            373 ;src/funciones.c:117: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,  48), 4, 16);
   542E C5            [11]  374 	push	bc
   542F D5            [11]  375 	push	de
   5430 16 30         [ 7]  376 	ld	d,#0x30
   5432 D5            [11]  377 	push	de
   5433 21 00 C0      [10]  378 	ld	hl, #0xc000
   5436 E5            [11]  379 	push	hl
   5437 CD D3 62      [17]  380 	call	_cpct_getScreenPtr
   543A D1            [10]  381 	pop	de
   543B C1            [10]  382 	pop	bc
   543C E5            [11]  383 	push	hl
   543D FD E1         [14]  384 	pop	iy
   543F 33            [ 6]  385 	inc	sp
   5440 33            [ 6]  386 	inc	sp
   5441 C5            [11]  387 	push	bc
   5442 C5            [11]  388 	push	bc
   5443 D5            [11]  389 	push	de
   5444 21 04 10      [10]  390 	ld	hl, #0x1004
   5447 E5            [11]  391 	push	hl
   5448 FD E5         [15]  392 	push	iy
   544A DD 6E FE      [19]  393 	ld	l,-2 (ix)
   544D DD 66 FF      [19]  394 	ld	h,-1 (ix)
   5450 E5            [11]  395 	push	hl
   5451 CD C4 5E      [17]  396 	call	_cpct_drawSprite
   5454 D1            [10]  397 	pop	de
   5455 C1            [10]  398 	pop	bc
                            399 ;src/funciones.c:116: for (i=0; i < 80; i += 4) {
   5456 1C            [ 4]  400 	inc	e
   5457 1C            [ 4]  401 	inc	e
   5458 1C            [ 4]  402 	inc	e
   5459 1C            [ 4]  403 	inc	e
   545A 7B            [ 4]  404 	ld	a, e
   545B D6 50         [ 7]  405 	sub	a, #0x50
   545D 38 CF         [12]  406 	jr	C,00105$
                            407 ;src/funciones.c:120: for (i=64; i < 176; i += 16 ){
   545F 06 40         [ 7]  408 	ld	b, #0x40
   5461                     409 00107$:
                            410 ;src/funciones.c:121: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,40, i), 4, 16);
   5461 C5            [11]  411 	push	bc
   5462 C5            [11]  412 	push	bc
   5463 33            [ 6]  413 	inc	sp
   5464 3E 28         [ 7]  414 	ld	a, #0x28
   5466 F5            [11]  415 	push	af
   5467 33            [ 6]  416 	inc	sp
   5468 21 00 C0      [10]  417 	ld	hl, #0xc000
   546B E5            [11]  418 	push	hl
   546C CD D3 62      [17]  419 	call	_cpct_getScreenPtr
   546F 11 04 10      [10]  420 	ld	de, #0x1004
   5472 D5            [11]  421 	push	de
   5473 E5            [11]  422 	push	hl
   5474 DD 6E FE      [19]  423 	ld	l,-2 (ix)
   5477 DD 66 FF      [19]  424 	ld	h,-1 (ix)
   547A E5            [11]  425 	push	hl
   547B CD C4 5E      [17]  426 	call	_cpct_drawSprite
   547E C1            [10]  427 	pop	bc
                            428 ;src/funciones.c:120: for (i=64; i < 176; i += 16 ){
   547F 78            [ 4]  429 	ld	a, b
   5480 C6 10         [ 7]  430 	add	a, #0x10
   5482 47            [ 4]  431 	ld	b,a
   5483 D6 B0         [ 7]  432 	sub	a, #0xb0
   5485 38 DA         [12]  433 	jr	C,00107$
                            434 ;src/funciones.c:125: cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
   5487 21 00 00      [10]  435 	ld	hl, #0x0000
   548A E5            [11]  436 	push	hl
   548B 2E 00         [ 7]  437 	ld	l, #0x00
   548D E5            [11]  438 	push	hl
   548E CD CD 61      [17]  439 	call	_cpct_px2byteM1
   5491 F1            [10]  440 	pop	af
   5492 F1            [10]  441 	pop	af
   5493 45            [ 4]  442 	ld	b, l
   5494 21 22 80      [10]  443 	ld	hl, #0x8022
   5497 E5            [11]  444 	push	hl
   5498 C5            [11]  445 	push	bc
   5499 33            [ 6]  446 	inc	sp
   549A 21 5B C2      [10]  447 	ld	hl, #0xc25b
   549D E5            [11]  448 	push	hl
   549E CD FA 61      [17]  449 	call	_cpct_drawSolidBox
   54A1 DD F9         [10]  450 	ld	sp, ix
   54A3 DD E1         [14]  451 	pop	ix
   54A5 C9            [10]  452 	ret
                            453 ;src/funciones.c:128: void dibujarEscenario(){
                            454 ;	---------------------------------
                            455 ; Function dibujarEscenario
                            456 ; ---------------------------------
   54A6                     457 _dibujarEscenario::
                            458 ;src/funciones.c:131: cpct_etm_setTileset2x4(tileset1);
   54A6 21 74 32      [10]  459 	ld	hl, #_tileset1
   54A9 CD F8 5F      [17]  460 	call	_cpct_etm_setTileset2x4
                            461 ;src/funciones.c:132: if (nivel > 10)
   54AC 3E 0A         [ 7]  462 	ld	a, #0x0a
   54AE FD 21 DC 6E   [14]  463 	ld	iy, #_nivel
   54B2 FD 96 00      [19]  464 	sub	a, 0 (iy)
   54B5 30 06         [12]  465 	jr	NC,00102$
                            466 ;src/funciones.c:133: cpct_etm_setTileset2x4(tileset2);
   54B7 21 A0 2A      [10]  467 	ld	hl, #_tileset2
   54BA CD F8 5F      [17]  468 	call	_cpct_etm_setTileset2x4
   54BD                     469 00102$:
                            470 ;src/funciones.c:137: mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
   54BD 01 40 03      [10]  471 	ld	bc, #_g_mapa01+0
   54C0 21 DC 6E      [10]  472 	ld	hl,#_nivel + 0
   54C3 5E            [ 7]  473 	ld	e, (hl)
   54C4 16 00         [ 7]  474 	ld	d, #0x00
   54C6 1B            [ 6]  475 	dec	de
   54C7 6B            [ 4]  476 	ld	l, e
   54C8 62            [ 4]  477 	ld	h, d
   54C9 29            [11]  478 	add	hl, hl
   54CA 19            [11]  479 	add	hl, de
   54CB 29            [11]  480 	add	hl, hl
   54CC 19            [11]  481 	add	hl, de
   54CD 29            [11]  482 	add	hl, hl
   54CE 19            [11]  483 	add	hl, de
   54CF 29            [11]  484 	add	hl, hl
   54D0 19            [11]  485 	add	hl, de
   54D1 29            [11]  486 	add	hl, hl
   54D2 19            [11]  487 	add	hl, de
   54D3 29            [11]  488 	add	hl, hl
   54D4 29            [11]  489 	add	hl, hl
   54D5 29            [11]  490 	add	hl, hl
   54D6 09            [11]  491 	add	hl, bc
                            492 ;src/funciones.c:139: cpct_etm_drawTilemap2x4 ( g_mapa01_W, g_mapa01_H , INICIO_AREA_JUEGO, mapa);
   54D7 E5            [11]  493 	push	hl
   54D8 21 84 C2      [10]  494 	ld	hl, #0xc284
   54DB E5            [11]  495 	push	hl
   54DC 21 1C 12      [10]  496 	ld	hl, #0x121c
   54DF E5            [11]  497 	push	hl
   54E0 2E 00         [ 7]  498 	ld	l, #0x00
   54E2 E5            [11]  499 	push	hl
   54E3 AF            [ 4]  500 	xor	a, a
   54E4 F5            [11]  501 	push	af
   54E5 33            [ 6]  502 	inc	sp
   54E6 CD 69 5F      [17]  503 	call	_cpct_etm_drawTileBox2x4
   54E9 C9            [10]  504 	ret
                            505 ;src/funciones.c:143: void printStats(TStats *a) {
                            506 ;	---------------------------------
                            507 ; Function printStats
                            508 ; ---------------------------------
   54EA                     509 _printStats::
   54EA DD E5         [15]  510 	push	ix
   54EC DD 21 00 00   [14]  511 	ld	ix,#0
   54F0 DD 39         [15]  512 	add	ix,sp
   54F2 21 D6 FF      [10]  513 	ld	hl, #-42
   54F5 39            [11]  514 	add	hl, sp
   54F6 F9            [ 6]  515 	ld	sp, hl
                            516 ;src/funciones.c:146: cpct_setDrawCharM1(2, 0);
   54F7 21 02 00      [10]  517 	ld	hl, #0x0002
   54FA E5            [11]  518 	push	hl
   54FB CD F3 62      [17]  519 	call	_cpct_setDrawCharM1
                            520 ;src/funciones.c:147: sprintf(temp, "                                    ");
   54FE 11 8A 55      [10]  521 	ld	de, #___str_0+0
   5501 21 00 00      [10]  522 	ld	hl, #0x0000
   5504 39            [11]  523 	add	hl, sp
   5505 DD 75 FE      [19]  524 	ld	-2 (ix), l
   5508 DD 74 FF      [19]  525 	ld	-1 (ix), h
   550B D5            [11]  526 	push	de
   550C E5            [11]  527 	push	hl
   550D CD 36 61      [17]  528 	call	_sprintf
   5510 F1            [10]  529 	pop	af
   5511 F1            [10]  530 	pop	af
                            531 ;src/funciones.c:148: if (a->energy)
   5512 DD 4E 04      [19]  532 	ld	c,4 (ix)
   5515 DD 46 05      [19]  533 	ld	b,5 (ix)
   5518 C5            [11]  534 	push	bc
   5519 FD E1         [14]  535 	pop	iy
   551B FD 5E 0A      [19]  536 	ld	e, 10 (iy)
   551E 7B            [ 4]  537 	ld	a, e
   551F B7            [ 4]  538 	or	a, a
   5520 28 45         [12]  539 	jr	Z,00102$
                            540 ;src/funciones.c:149: sprintf(temp, "%-9s=> HP:%02d. ATT: %02d. DEF: %02d",a->name, a->energy,a->attack,a->defense);
   5522 C5            [11]  541 	push	bc
   5523 FD E1         [14]  542 	pop	iy
   5525 FD 6E 0E      [19]  543 	ld	l, 14 (iy)
   5528 DD 75 FC      [19]  544 	ld	-4 (ix), l
   552B DD 36 FD 00   [19]  545 	ld	-3 (ix), #0x00
   552F C5            [11]  546 	push	bc
   5530 FD E1         [14]  547 	pop	iy
   5532 FD 6E 0C      [19]  548 	ld	l, 12 (iy)
   5535 DD 75 FA      [19]  549 	ld	-6 (ix), l
   5538 DD 36 FB 00   [19]  550 	ld	-5 (ix), #0x00
   553C 16 00         [ 7]  551 	ld	d, #0x00
   553E DD 6E FE      [19]  552 	ld	l,-2 (ix)
   5541 DD 66 FF      [19]  553 	ld	h,-1 (ix)
   5544 E5            [11]  554 	push	hl
   5545 FD E1         [14]  555 	pop	iy
   5547 C5            [11]  556 	push	bc
   5548 DD 6E FC      [19]  557 	ld	l,-4 (ix)
   554B DD 66 FD      [19]  558 	ld	h,-3 (ix)
   554E E5            [11]  559 	push	hl
   554F DD 6E FA      [19]  560 	ld	l,-6 (ix)
   5552 DD 66 FB      [19]  561 	ld	h,-5 (ix)
   5555 E5            [11]  562 	push	hl
   5556 D5            [11]  563 	push	de
   5557 C5            [11]  564 	push	bc
   5558 21 AF 55      [10]  565 	ld	hl, #___str_1
   555B E5            [11]  566 	push	hl
   555C FD E5         [15]  567 	push	iy
   555E CD 36 61      [17]  568 	call	_sprintf
   5561 21 0C 00      [10]  569 	ld	hl, #12
   5564 39            [11]  570 	add	hl, sp
   5565 F9            [ 6]  571 	ld	sp, hl
   5566 C1            [10]  572 	pop	bc
   5567                     573 00102$:
                            574 ;src/funciones.c:151: mydrawStringM1(temp, cpct_getScreenPtr(CPCT_VMEM_START, 4, a->pos_y));
   5567 C5            [11]  575 	push	bc
   5568 FD E1         [14]  576 	pop	iy
   556A FD 46 11      [19]  577 	ld	b, 17 (iy)
   556D C5            [11]  578 	push	bc
   556E 33            [ 6]  579 	inc	sp
   556F 3E 04         [ 7]  580 	ld	a, #0x04
   5571 F5            [11]  581 	push	af
   5572 33            [ 6]  582 	inc	sp
   5573 21 00 C0      [10]  583 	ld	hl, #0xc000
   5576 E5            [11]  584 	push	hl
   5577 CD D3 62      [17]  585 	call	_cpct_getScreenPtr
   557A DD 4E FE      [19]  586 	ld	c,-2 (ix)
   557D DD 46 FF      [19]  587 	ld	b,-1 (ix)
   5580 E5            [11]  588 	push	hl
   5581 C5            [11]  589 	push	bc
   5582 CD B4 5D      [17]  590 	call	_mydrawStringM1
   5585 DD F9         [10]  591 	ld	sp, ix
   5587 DD E1         [14]  592 	pop	ix
   5589 C9            [10]  593 	ret
   558A                     594 ___str_0:
   558A 20 20 20 20 20 20   595 	.ascii "                                    "
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
   55AE 00                  596 	.db 0x00
   55AF                     597 ___str_1:
   55AF 25 2D 39 73 3D 3E   598 	.ascii "%-9s=> HP:%02d. ATT: %02d. DEF: %02d"
        20 48 50 3A 25 30
        32 64 2E 20 41 54
        54 3A 20 25 30 32
        64 2E 20 44 45 46
        3A 20 25 30 32 64
   55D3 00                  599 	.db 0x00
                            600 ;src/funciones.c:154: void printLevel() {
                            601 ;	---------------------------------
                            602 ; Function printLevel
                            603 ; ---------------------------------
   55D4                     604 _printLevel::
   55D4 DD E5         [15]  605 	push	ix
   55D6 DD 21 00 00   [14]  606 	ld	ix,#0
   55DA DD 39         [15]  607 	add	ix,sp
   55DC 21 D8 FF      [10]  608 	ld	hl, #-40
   55DF 39            [11]  609 	add	hl, sp
   55E0 F9            [ 6]  610 	ld	sp, hl
                            611 ;src/funciones.c:157: sprintf(temp, "LEVEL: %02d",nivel);
   55E1 21 DC 6E      [10]  612 	ld	hl,#_nivel + 0
   55E4 5E            [ 7]  613 	ld	e, (hl)
   55E5 16 00         [ 7]  614 	ld	d, #0x00
   55E7 21 00 00      [10]  615 	ld	hl, #0x0000
   55EA 39            [11]  616 	add	hl, sp
   55EB 4D            [ 4]  617 	ld	c, l
   55EC 44            [ 4]  618 	ld	b, h
   55ED E5            [11]  619 	push	hl
   55EE D5            [11]  620 	push	de
   55EF 11 11 56      [10]  621 	ld	de, #___str_2
   55F2 D5            [11]  622 	push	de
   55F3 C5            [11]  623 	push	bc
   55F4 CD 36 61      [17]  624 	call	_sprintf
   55F7 21 06 00      [10]  625 	ld	hl, #6
   55FA 39            [11]  626 	add	hl, sp
   55FB F9            [ 6]  627 	ld	sp, hl
   55FC 01 02 00      [10]  628 	ld	bc, #0x0002
   55FF C5            [11]  629 	push	bc
   5600 CD F3 62      [17]  630 	call	_cpct_setDrawCharM1
   5603 E1            [10]  631 	pop	hl
                            632 ;src/funciones.c:159: mydrawStringM1(temp, cpctm_screenPtr(CPCT_VMEM_START, 4, 16));
   5604 01 A4 C0      [10]  633 	ld	bc, #0xc0a4
   5607 C5            [11]  634 	push	bc
   5608 E5            [11]  635 	push	hl
   5609 CD B4 5D      [17]  636 	call	_mydrawStringM1
   560C DD F9         [10]  637 	ld	sp, ix
   560E DD E1         [14]  638 	pop	ix
   5610 C9            [10]  639 	ret
   5611                     640 ___str_2:
   5611 4C 45 56 45 4C 3A   641 	.ascii "LEVEL: %02d"
        20 25 30 32 64
   561C 00                  642 	.db 0x00
                            643 ;src/funciones.c:162: void printConsole  (void* string, u8 pen, u8 bground) {
                            644 ;	---------------------------------
                            645 ; Function printConsole
                            646 ; ---------------------------------
   561D                     647 _printConsole::
                            648 ;src/funciones.c:163: if (cursorConsola > 175){
   561D 3E AF         [ 7]  649 	ld	a, #0xaf
   561F FD 21 DD 6E   [14]  650 	ld	iy, #_cursorConsola
   5623 FD 96 00      [19]  651 	sub	a, 0 (iy)
   5626 30 27         [12]  652 	jr	NC,00102$
                            653 ;src/funciones.c:165: pausa(SEGUNDO);
   5628 21 00 80      [10]  654 	ld	hl, #0x8000
   562B E5            [11]  655 	push	hl
   562C CD D5 52      [17]  656 	call	_pausa
   562F F1            [10]  657 	pop	af
                            658 ;src/funciones.c:166: cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
   5630 21 00 00      [10]  659 	ld	hl, #0x0000
   5633 E5            [11]  660 	push	hl
   5634 2E 00         [ 7]  661 	ld	l, #0x00
   5636 E5            [11]  662 	push	hl
   5637 CD CD 61      [17]  663 	call	_cpct_px2byteM1
   563A F1            [10]  664 	pop	af
   563B F1            [10]  665 	pop	af
   563C 45            [ 4]  666 	ld	b, l
   563D 21 22 80      [10]  667 	ld	hl, #0x8022
   5640 E5            [11]  668 	push	hl
   5641 C5            [11]  669 	push	bc
   5642 33            [ 6]  670 	inc	sp
   5643 21 5B C2      [10]  671 	ld	hl, #0xc25b
   5646 E5            [11]  672 	push	hl
   5647 CD FA 61      [17]  673 	call	_cpct_drawSolidBox
                            674 ;src/funciones.c:167: cursorConsola = 64;
   564A 21 DD 6E      [10]  675 	ld	hl,#_cursorConsola + 0
   564D 36 40         [10]  676 	ld	(hl), #0x40
   564F                     677 00102$:
                            678 ;src/funciones.c:170: cpct_setDrawCharM1(pen, bground);
   564F 21 05 00      [10]  679 	ld	hl, #5+0
   5652 39            [11]  680 	add	hl, sp
   5653 7E            [ 7]  681 	ld	a, (hl)
   5654 F5            [11]  682 	push	af
   5655 33            [ 6]  683 	inc	sp
   5656 21 05 00      [10]  684 	ld	hl, #5+0
   5659 39            [11]  685 	add	hl, sp
   565A 7E            [ 7]  686 	ld	a, (hl)
   565B F5            [11]  687 	push	af
   565C 33            [ 6]  688 	inc	sp
   565D CD F3 62      [17]  689 	call	_cpct_setDrawCharM1
                            690 ;src/funciones.c:171: mydrawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 44, cursorConsola));
   5660 3A DD 6E      [13]  691 	ld	a, (_cursorConsola)
   5663 57            [ 4]  692 	ld	d,a
   5664 1E 2C         [ 7]  693 	ld	e,#0x2c
   5666 D5            [11]  694 	push	de
   5667 21 00 C0      [10]  695 	ld	hl, #0xc000
   566A E5            [11]  696 	push	hl
   566B CD D3 62      [17]  697 	call	_cpct_getScreenPtr
   566E E5            [11]  698 	push	hl
   566F 21 04 00      [10]  699 	ld	hl, #4
   5672 39            [11]  700 	add	hl, sp
   5673 4E            [ 7]  701 	ld	c, (hl)
   5674 23            [ 6]  702 	inc	hl
   5675 46            [ 7]  703 	ld	b, (hl)
   5676 C5            [11]  704 	push	bc
   5677 CD B4 5D      [17]  705 	call	_mydrawStringM1
                            706 ;src/funciones.c:172: cursorConsola +=8;
   567A 21 DD 6E      [10]  707 	ld	hl, #_cursorConsola
   567D 7E            [ 7]  708 	ld	a, (hl)
   567E C6 08         [ 7]  709 	add	a, #0x08
   5680 77            [ 7]  710 	ld	(hl), a
   5681 C9            [10]  711 	ret
                            712 ;src/funciones.c:175: void atacar(TStats *a, TStats *b) {
                            713 ;	---------------------------------
                            714 ; Function atacar
                            715 ; ---------------------------------
   5682                     716 _atacar::
   5682 DD E5         [15]  717 	push	ix
   5684 DD 21 00 00   [14]  718 	ld	ix,#0
   5688 DD 39         [15]  719 	add	ix,sp
   568A 21 E6 FF      [10]  720 	ld	hl, #-26
   568D 39            [11]  721 	add	hl, sp
   568E F9            [ 6]  722 	ld	sp, hl
                            723 ;src/funciones.c:179: pen = 0;
   568F DD 36 FB 00   [19]  724 	ld	-5 (ix), #0x00
                            725 ;src/funciones.c:180: bg = 2;
   5693 DD 36 FA 02   [19]  726 	ld	-6 (ix), #0x02
                            727 ;src/funciones.c:181: if ((u16) a->sprite == (u16) G_mendo)  {
   5697 DD 4E 04      [19]  728 	ld	c,4 (ix)
   569A DD 46 05      [19]  729 	ld	b,5 (ix)
   569D 69            [ 4]  730 	ld	l, c
   569E 60            [ 4]  731 	ld	h, b
   569F 11 12 00      [10]  732 	ld	de, #0x0012
   56A2 19            [11]  733 	add	hl, de
   56A3 5E            [ 7]  734 	ld	e, (hl)
   56A4 23            [ 6]  735 	inc	hl
   56A5 56            [ 7]  736 	ld	d, (hl)
   56A6 DD 36 FE 26   [19]  737 	ld	-2 (ix), #<(_G_mendo)
   56AA DD 36 FF 3E   [19]  738 	ld	-1 (ix), #>(_G_mendo)
   56AE 7B            [ 4]  739 	ld	a, e
   56AF DD 96 FE      [19]  740 	sub	a, -2 (ix)
   56B2 20 0E         [12]  741 	jr	NZ,00102$
   56B4 7A            [ 4]  742 	ld	a, d
   56B5 DD 96 FF      [19]  743 	sub	a, -1 (ix)
   56B8 20 08         [12]  744 	jr	NZ,00102$
                            745 ;src/funciones.c:182: pen = 2;
   56BA DD 36 FB 02   [19]  746 	ld	-5 (ix), #0x02
                            747 ;src/funciones.c:183: bg = 0;
   56BE DD 36 FA 00   [19]  748 	ld	-6 (ix), #0x00
   56C2                     749 00102$:
                            750 ;src/funciones.c:187: ataque = a->attack + (2*(cpct_rand()%a->force)) - a->force;
   56C2 C5            [11]  751 	push	bc
   56C3 FD E1         [14]  752 	pop	iy
   56C5 FD 7E 0C      [19]  753 	ld	a, 12 (iy)
   56C8 DD 77 FE      [19]  754 	ld	-2 (ix), a
   56CB C5            [11]  755 	push	bc
   56CC CD 6C 60      [17]  756 	call	_cpct_getRandom_mxor_u8
   56CF 5D            [ 4]  757 	ld	e, l
   56D0 C1            [10]  758 	pop	bc
   56D1 C5            [11]  759 	push	bc
   56D2 FD E1         [14]  760 	pop	iy
   56D4 FD 56 0D      [19]  761 	ld	d, 13 (iy)
   56D7 C5            [11]  762 	push	bc
   56D8 D5            [11]  763 	push	de
   56D9 D5            [11]  764 	push	de
   56DA CD FC 5F      [17]  765 	call	__moduchar
   56DD F1            [10]  766 	pop	af
   56DE D1            [10]  767 	pop	de
   56DF C1            [10]  768 	pop	bc
   56E0 CB 25         [ 8]  769 	sla	l
   56E2 DD 7E FE      [19]  770 	ld	a, -2 (ix)
   56E5 85            [ 4]  771 	add	a, l
   56E6 92            [ 4]  772 	sub	a, d
                            773 ;src/funciones.c:188: sprintf(temp, "%-9s ATT %02d",a->name, ataque);
   56E7 DD 77 FE      [19]  774 	ld	-2 (ix), a
   56EA 5F            [ 4]  775 	ld	e, a
   56EB 16 00         [ 7]  776 	ld	d, #0x00
   56ED 21 00 00      [10]  777 	ld	hl, #0x0000
   56F0 39            [11]  778 	add	hl, sp
   56F1 DD 75 FC      [19]  779 	ld	-4 (ix), l
   56F4 DD 74 FD      [19]  780 	ld	-3 (ix), h
   56F7 D5            [11]  781 	push	de
   56F8 C5            [11]  782 	push	bc
   56F9 01 90 57      [10]  783 	ld	bc, #___str_3
   56FC C5            [11]  784 	push	bc
   56FD E5            [11]  785 	push	hl
   56FE CD 36 61      [17]  786 	call	_sprintf
   5701 21 08 00      [10]  787 	ld	hl, #8
   5704 39            [11]  788 	add	hl, sp
   5705 F9            [ 6]  789 	ld	sp, hl
                            790 ;src/funciones.c:189: printConsole(temp, pen, bg);
   5706 DD 4E FC      [19]  791 	ld	c,-4 (ix)
   5709 DD 46 FD      [19]  792 	ld	b,-3 (ix)
   570C DD 66 FA      [19]  793 	ld	h, -6 (ix)
   570F DD 6E FB      [19]  794 	ld	l, -5 (ix)
   5712 E5            [11]  795 	push	hl
   5713 C5            [11]  796 	push	bc
   5714 CD 1D 56      [17]  797 	call	_printConsole
   5717 F1            [10]  798 	pop	af
   5718 F1            [10]  799 	pop	af
                            800 ;src/funciones.c:191: if (ataque < b->energy) {
   5719 DD 4E 06      [19]  801 	ld	c,6 (ix)
   571C DD 46 07      [19]  802 	ld	b,7 (ix)
   571F 21 0A 00      [10]  803 	ld	hl, #0x000a
   5722 09            [11]  804 	add	hl, bc
   5723 5E            [ 7]  805 	ld	e, (hl)
   5724 DD 7E FE      [19]  806 	ld	a, -2 (ix)
   5727 93            [ 4]  807 	sub	a, e
   5728 30 1F         [12]  808 	jr	NC,00104$
                            809 ;src/funciones.c:192: b->energy = b->energy - ataque;
   572A 7B            [ 4]  810 	ld	a, e
   572B DD 96 FE      [19]  811 	sub	a, -2 (ix)
   572E 5F            [ 4]  812 	ld	e, a
   572F 73            [ 7]  813 	ld	(hl), e
                            814 ;src/funciones.c:193: sprintf(temp, "%-9s HP=>%02d",b->name, b->energy);
   5730 16 00         [ 7]  815 	ld	d, #0x00
   5732 DD 6E FC      [19]  816 	ld	l,-4 (ix)
   5735 DD 66 FD      [19]  817 	ld	h,-3 (ix)
   5738 D5            [11]  818 	push	de
   5739 C5            [11]  819 	push	bc
   573A 01 9E 57      [10]  820 	ld	bc, #___str_4
   573D C5            [11]  821 	push	bc
   573E E5            [11]  822 	push	hl
   573F CD 36 61      [17]  823 	call	_sprintf
   5742 21 08 00      [10]  824 	ld	hl, #8
   5745 39            [11]  825 	add	hl, sp
   5746 F9            [ 6]  826 	ld	sp, hl
   5747 18 31         [12]  827 	jr	00105$
   5749                     828 00104$:
                            829 ;src/funciones.c:195: b->energy = 0;
   5749 36 00         [10]  830 	ld	(hl), #0x00
                            831 ;src/funciones.c:196: sprintf(temp, "%-9s DIED! ",b->name, b->energy);
   574B 5E            [ 7]  832 	ld	e, (hl)
   574C 16 00         [ 7]  833 	ld	d, #0x00
   574E DD 6E FC      [19]  834 	ld	l,-4 (ix)
   5751 DD 66 FD      [19]  835 	ld	h,-3 (ix)
   5754 D5            [11]  836 	push	de
   5755 C5            [11]  837 	push	bc
   5756 01 AC 57      [10]  838 	ld	bc, #___str_5
   5759 C5            [11]  839 	push	bc
   575A E5            [11]  840 	push	hl
   575B CD 36 61      [17]  841 	call	_sprintf
   575E 21 08 00      [10]  842 	ld	hl, #8
   5761 39            [11]  843 	add	hl, sp
   5762 F9            [ 6]  844 	ld	sp, hl
                            845 ;src/funciones.c:197: printStats(b);
   5763 DD 6E 06      [19]  846 	ld	l,6 (ix)
   5766 DD 66 07      [19]  847 	ld	h,7 (ix)
   5769 E5            [11]  848 	push	hl
   576A CD EA 54      [17]  849 	call	_printStats
   576D F1            [10]  850 	pop	af
                            851 ;src/funciones.c:199: ataque = pen;
   576E DD 4E FB      [19]  852 	ld	c, -5 (ix)
                            853 ;src/funciones.c:200: pen = bg;
   5771 DD 7E FA      [19]  854 	ld	a, -6 (ix)
   5774 DD 77 FB      [19]  855 	ld	-5 (ix), a
                            856 ;src/funciones.c:201: bg = ataque;
   5777 DD 71 FA      [19]  857 	ld	-6 (ix), c
   577A                     858 00105$:
                            859 ;src/funciones.c:204: printConsole(temp, pen, bg);
   577A DD 4E FC      [19]  860 	ld	c,-4 (ix)
   577D DD 46 FD      [19]  861 	ld	b,-3 (ix)
   5780 DD 66 FA      [19]  862 	ld	h, -6 (ix)
   5783 DD 6E FB      [19]  863 	ld	l, -5 (ix)
   5786 E5            [11]  864 	push	hl
   5787 C5            [11]  865 	push	bc
   5788 CD 1D 56      [17]  866 	call	_printConsole
   578B DD F9         [10]  867 	ld	sp,ix
   578D DD E1         [14]  868 	pop	ix
   578F C9            [10]  869 	ret
   5790                     870 ___str_3:
   5790 25 2D 39 73 20 41   871 	.ascii "%-9s ATT %02d"
        54 54 20 25 30 32
        64
   579D 00                  872 	.db 0x00
   579E                     873 ___str_4:
   579E 25 2D 39 73 20 48   874 	.ascii "%-9s HP=>%02d"
        50 3D 3E 25 30 32
        64
   57AB 00                  875 	.db 0x00
   57AC                     876 ___str_5:
   57AC 25 2D 39 73 20 44   877 	.ascii "%-9s DIED! "
        49 45 44 21 20
   57B7 00                  878 	.db 0x00
                            879 ;src/funciones.c:207: void defender(TStats *a) {
                            880 ;	---------------------------------
                            881 ; Function defender
                            882 ; ---------------------------------
   57B8                     883 _defender::
   57B8 DD E5         [15]  884 	push	ix
   57BA DD 21 00 00   [14]  885 	ld	ix,#0
   57BE DD 39         [15]  886 	add	ix,sp
   57C0 21 E5 FF      [10]  887 	ld	hl, #-27
   57C3 39            [11]  888 	add	hl, sp
   57C4 F9            [ 6]  889 	ld	sp, hl
                            890 ;src/funciones.c:210: pen = 0;
   57C5 DD 36 E5 00   [19]  891 	ld	-27 (ix), #0x00
                            892 ;src/funciones.c:211: bg = 2;
   57C9 DD 36 E6 02   [19]  893 	ld	-26 (ix), #0x02
                            894 ;src/funciones.c:212: if ((u16) a->sprite == (u16) G_mendo)  {
   57CD DD 4E 04      [19]  895 	ld	c,4 (ix)
   57D0 DD 46 05      [19]  896 	ld	b,5 (ix)
   57D3 69            [ 4]  897 	ld	l, c
   57D4 60            [ 4]  898 	ld	h, b
   57D5 11 12 00      [10]  899 	ld	de, #0x0012
   57D8 19            [11]  900 	add	hl, de
   57D9 5E            [ 7]  901 	ld	e, (hl)
   57DA 23            [ 6]  902 	inc	hl
   57DB 56            [ 7]  903 	ld	d, (hl)
   57DC DD 36 FE 26   [19]  904 	ld	-2 (ix), #<(_G_mendo)
   57E0 DD 36 FF 3E   [19]  905 	ld	-1 (ix), #>(_G_mendo)
   57E4 7B            [ 4]  906 	ld	a, e
   57E5 DD 96 FE      [19]  907 	sub	a, -2 (ix)
   57E8 20 0E         [12]  908 	jr	NZ,00102$
   57EA 7A            [ 4]  909 	ld	a, d
   57EB DD 96 FF      [19]  910 	sub	a, -1 (ix)
   57EE 20 08         [12]  911 	jr	NZ,00102$
                            912 ;src/funciones.c:213: pen = 2;
   57F0 DD 36 E5 02   [19]  913 	ld	-27 (ix), #0x02
                            914 ;src/funciones.c:214: bg = 0;
   57F4 DD 36 E6 00   [19]  915 	ld	-26 (ix), #0x00
   57F8                     916 00102$:
                            917 ;src/funciones.c:217: if (a->energy + a->defense < a->max_energy)
   57F8 FD 21 0A 00   [14]  918 	ld	iy, #0x000a
   57FC FD 09         [15]  919 	add	iy, bc
   57FE FD 7E 00      [19]  920 	ld	a, 0 (iy)
   5801 DD 77 FE      [19]  921 	ld	-2 (ix), a
   5804 5F            [ 4]  922 	ld	e, a
   5805 16 00         [ 7]  923 	ld	d, #0x00
   5807 69            [ 4]  924 	ld	l, c
   5808 60            [ 4]  925 	ld	h, b
   5809 C5            [11]  926 	push	bc
   580A 01 0E 00      [10]  927 	ld	bc, #0x000e
   580D 09            [11]  928 	add	hl, bc
   580E C1            [10]  929 	pop	bc
   580F 7E            [ 7]  930 	ld	a, (hl)
   5810 DD 77 FD      [19]  931 	ld	-3 (ix), a
   5813 6F            [ 4]  932 	ld	l, a
   5814 26 00         [ 7]  933 	ld	h, #0x00
   5816 19            [11]  934 	add	hl,de
   5817 DD 75 FB      [19]  935 	ld	-5 (ix), l
   581A DD 74 FC      [19]  936 	ld	-4 (ix), h
   581D 69            [ 4]  937 	ld	l, c
   581E 60            [ 4]  938 	ld	h, b
   581F 11 0B 00      [10]  939 	ld	de, #0x000b
   5822 19            [11]  940 	add	hl, de
   5823 5E            [ 7]  941 	ld	e, (hl)
   5824 6B            [ 4]  942 	ld	l, e
   5825 16 00         [ 7]  943 	ld	d, #0x00
   5827 DD 7E FB      [19]  944 	ld	a, -5 (ix)
   582A 95            [ 4]  945 	sub	a, l
   582B DD 7E FC      [19]  946 	ld	a, -4 (ix)
   582E 9A            [ 4]  947 	sbc	a, d
   582F E2 34 58      [10]  948 	jp	PO, 00124$
   5832 EE 80         [ 7]  949 	xor	a, #0x80
   5834                     950 00124$:
   5834 F2 3C 58      [10]  951 	jp	P, 00104$
                            952 ;src/funciones.c:218: healed = a->defense;
   5837 DD 5E FD      [19]  953 	ld	e, -3 (ix)
   583A 18 05         [12]  954 	jr	00105$
   583C                     955 00104$:
                            956 ;src/funciones.c:220: healed = a->max_energy - a->energy;
   583C 7B            [ 4]  957 	ld	a, e
   583D DD 96 FE      [19]  958 	sub	a, -2 (ix)
   5840 5F            [ 4]  959 	ld	e, a
   5841                     960 00105$:
                            961 ;src/funciones.c:222: a->energy = a->energy + healed;
   5841 DD 7E FE      [19]  962 	ld	a, -2 (ix)
   5844 83            [ 4]  963 	add	a, e
   5845 FD 77 00      [19]  964 	ld	0 (iy), a
                            965 ;src/funciones.c:224: if (healed) {
   5848 7B            [ 4]  966 	ld	a, e
   5849 B7            [ 4]  967 	or	a, a
   584A 28 2A         [12]  968 	jr	Z,00108$
                            969 ;src/funciones.c:225: sprintf(temp, "%-9s ^ %02dHP",a->name, healed);
   584C 16 00         [ 7]  970 	ld	d, #0x00
   584E 21 02 00      [10]  971 	ld	hl, #0x0002
   5851 39            [11]  972 	add	hl, sp
   5852 E5            [11]  973 	push	hl
   5853 FD E1         [14]  974 	pop	iy
   5855 E5            [11]  975 	push	hl
   5856 D5            [11]  976 	push	de
   5857 C5            [11]  977 	push	bc
   5858 01 7B 58      [10]  978 	ld	bc, #___str_6
   585B C5            [11]  979 	push	bc
   585C FD E5         [15]  980 	push	iy
   585E CD 36 61      [17]  981 	call	_sprintf
   5861 21 08 00      [10]  982 	ld	hl, #8
   5864 39            [11]  983 	add	hl, sp
   5865 F9            [ 6]  984 	ld	sp, hl
   5866 E1            [10]  985 	pop	hl
                            986 ;src/funciones.c:226: printConsole(temp, pen, bg);
   5867 4D            [ 4]  987 	ld	c, l
   5868 44            [ 4]  988 	ld	b, h
   5869 DD 66 E6      [19]  989 	ld	h, -26 (ix)
   586C DD 6E E5      [19]  990 	ld	l, -27 (ix)
   586F E5            [11]  991 	push	hl
   5870 C5            [11]  992 	push	bc
   5871 CD 1D 56      [17]  993 	call	_printConsole
   5874 F1            [10]  994 	pop	af
   5875 F1            [10]  995 	pop	af
   5876                     996 00108$:
   5876 DD F9         [10]  997 	ld	sp, ix
   5878 DD E1         [14]  998 	pop	ix
   587A C9            [10]  999 	ret
   587B                    1000 ___str_6:
   587B 25 2D 39 73 20 5E  1001 	.ascii "%-9s ^ %02dHP"
        20 25 30 32 64 48
        50
   5888 00                 1002 	.db 0x00
                           1003 ;src/funciones.c:230: void drawPotion(){
                           1004 ;	---------------------------------
                           1005 ; Function drawPotion
                           1006 ; ---------------------------------
   5889                    1007 _drawPotion::
                           1008 ;src/funciones.c:231: cpct_drawSpriteMasked (G_pocion, cpctm_screenPtr (CPCT_VMEM_START, 28, 144), 2,16);
   5889 21 02 10      [10] 1009 	ld	hl, #0x1002
   588C E5            [11] 1010 	push	hl
   588D 21 BC C5      [10] 1011 	ld	hl, #0xc5bc
   5890 E5            [11] 1012 	push	hl
   5891 21 46 44      [10] 1013 	ld	hl, #_G_pocion
   5894 E5            [11] 1014 	push	hl
   5895 CD B2 60      [17] 1015 	call	_cpct_drawSpriteMasked
   5898 C9            [10] 1016 	ret
                           1017 	.area _CODE
                           1018 	.area _INITIALIZER
                           1019 	.area _CABS (ABS)
