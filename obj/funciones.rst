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
                             12 	.globl _IA
                             13 	.globl _defender
                             14 	.globl _moverDcha
                             15 	.globl _moverIzq
                             16 	.globl _comprobarPosicion
                             17 	.globl _atacar
                             18 	.globl _printConsole
                             19 	.globl _printLevel
                             20 	.globl _printStats
                             21 	.globl _dibujarEscenario
                             22 	.globl _dibujarMarcoInterior
                             23 	.globl _dibujarMarcoExterior
                             24 	.globl _pausaTecladoLibre
                             25 	.globl _efecto_pliegue
                             26 	.globl _pausa
                             27 	.globl _abs
                             28 	.globl _mydrawStringM1
                             29 	.globl _playFX
                             30 	.globl _sprintf
                             31 	.globl _cpct_etm_setTileset2x4
                             32 	.globl _cpct_etm_drawTilemap2x4_f
                             33 	.globl _cpct_getRandom_mxor_u8
                             34 	.globl _cpct_setCRTCReg
                             35 	.globl _cpct_getScreenPtr
                             36 	.globl _cpct_setDrawCharM1
                             37 	.globl _cpct_drawSpriteMasked
                             38 	.globl _cpct_drawSprite
                             39 	.globl _cpct_drawSolidBox
                             40 	.globl _cpct_px2byteM1
                             41 	.globl _cpct_isAnyKeyPressed_f
                             42 ;--------------------------------------------------------
                             43 ; special function registers
                             44 ;--------------------------------------------------------
                             45 ;--------------------------------------------------------
                             46 ; ram data
                             47 ;--------------------------------------------------------
                             48 	.area _DATA
                             49 ;--------------------------------------------------------
                             50 ; ram data
                             51 ;--------------------------------------------------------
                             52 	.area _INITIALIZED
                             53 ;--------------------------------------------------------
                             54 ; absolute external ram data
                             55 ;--------------------------------------------------------
                             56 	.area _DABS (ABS)
                             57 ;--------------------------------------------------------
                             58 ; global & static initialisations
                             59 ;--------------------------------------------------------
                             60 	.area _HOME
                             61 	.area _GSINIT
                             62 	.area _GSFINAL
                             63 	.area _GSINIT
                             64 ;--------------------------------------------------------
                             65 ; Home
                             66 ;--------------------------------------------------------
                             67 	.area _HOME
                             68 	.area _HOME
                             69 ;--------------------------------------------------------
                             70 ; code
                             71 ;--------------------------------------------------------
                             72 	.area _CODE
                             73 ;src/funciones.c:41: u8 abs (i8 valor){
                             74 ;	---------------------------------
                             75 ; Function abs
                             76 ; ---------------------------------
   7649                      77 _abs::
                             78 ;src/funciones.c:42: return (valor > 0 ? valor : -valor);
   7649 AF            [ 4]   79 	xor	a, a
   764A FD 21 02 00   [14]   80 	ld	iy, #2
   764E FD 39         [15]   81 	add	iy, sp
   7650 FD 96 00      [19]   82 	sub	a, 0 (iy)
   7653 E2 58 76      [10]   83 	jp	PO, 00109$
   7656 EE 80         [ 7]   84 	xor	a, #0x80
   7658                      85 00109$:
   7658 F2 65 76      [10]   86 	jp	P, 00103$
   765B FD 21 02 00   [14]   87 	ld	iy, #2
   765F FD 39         [15]   88 	add	iy, sp
   7661 FD 6E 00      [19]   89 	ld	l, 0 (iy)
   7664 C9            [10]   90 	ret
   7665                      91 00103$:
   7665 AF            [ 4]   92 	xor	a, a
   7666 FD 21 02 00   [14]   93 	ld	iy, #2
   766A FD 39         [15]   94 	add	iy, sp
   766C FD 96 00      [19]   95 	sub	a, 0 (iy)
   766F 6F            [ 4]   96 	ld	l, a
   7670 C9            [10]   97 	ret
                             98 ;src/funciones.c:45: void pausa(u16 ciclos) {
                             99 ;	---------------------------------
                            100 ; Function pausa
                            101 ; ---------------------------------
   7671                     102 _pausa::
                            103 ;src/funciones.c:48: for (i = 0; i < ciclos; i++)
   7671 01 00 00      [10]  104 	ld	bc, #0x0000
   7674                     105 00103$:
   7674 21 02 00      [10]  106 	ld	hl, #2
   7677 39            [11]  107 	add	hl, sp
   7678 79            [ 4]  108 	ld	a, c
   7679 96            [ 7]  109 	sub	a, (hl)
   767A 78            [ 4]  110 	ld	a, b
   767B 23            [ 6]  111 	inc	hl
   767C 9E            [ 7]  112 	sbc	a, (hl)
   767D D0            [11]  113 	ret	NC
   767E 03            [ 6]  114 	inc	bc
   767F 18 F3         [12]  115 	jr	00103$
                            116 ;src/funciones.c:52: void efecto_pliegue(u8 modo) {
                            117 ;	---------------------------------
                            118 ; Function efecto_pliegue
                            119 ; ---------------------------------
   7681                     120 _efecto_pliegue::
                            121 ;src/funciones.c:55: i = 80;
   7681 0E 50         [ 7]  122 	ld	c, #0x50
                            123 ;src/funciones.c:56: if (modo)
   7683 21 02 00      [10]  124 	ld	hl, #2+0
   7686 39            [11]  125 	add	hl, sp
   7687 7E            [ 7]  126 	ld	a, (hl)
   7688 B7            [ 4]  127 	or	a, a
   7689 28 02         [12]  128 	jr	Z,00108$
                            129 ;src/funciones.c:57: i = 1;
   768B 0E 01         [ 7]  130 	ld	c, #0x01
                            131 ;src/funciones.c:59: do {
   768D                     132 00108$:
                            133 ;src/funciones.c:60: cpct_setCRTCReg (1, i/2);   //Cambiar nº columnas por pantalla (1-40)
   768D 41            [ 4]  134 	ld	b, c
   768E CB 38         [ 8]  135 	srl	b
   7690 C5            [11]  136 	push	bc
   7691 C5            [11]  137 	push	bc
   7692 33            [ 6]  138 	inc	sp
   7693 3E 01         [ 7]  139 	ld	a, #0x01
   7695 F5            [11]  140 	push	af
   7696 33            [ 6]  141 	inc	sp
   7697 CD 1E 96      [17]  142 	call	_cpct_setCRTCReg
   769A C1            [10]  143 	pop	bc
                            144 ;src/funciones.c:62: for (j = 0; j < 255; j++)
   769B 06 FF         [ 7]  145 	ld	b, #0xff
   769D                     146 00113$:
   769D 58            [ 4]  147 	ld	e, b
   769E 1D            [ 4]  148 	dec	e
   769F 7B            [ 4]  149 	ld	a,e
   76A0 47            [ 4]  150 	ld	b,a
   76A1 B7            [ 4]  151 	or	a, a
   76A2 20 F9         [12]  152 	jr	NZ,00113$
                            153 ;src/funciones.c:65: if (modo) {
   76A4 21 02 00      [10]  154 	ld	hl, #2+0
   76A7 39            [11]  155 	add	hl, sp
   76A8 7E            [ 7]  156 	ld	a, (hl)
   76A9 B7            [ 4]  157 	or	a, a
   76AA 28 03         [12]  158 	jr	Z,00105$
                            159 ;src/funciones.c:66: i++;
   76AC 0C            [ 4]  160 	inc	c
   76AD 18 01         [12]  161 	jr	00109$
   76AF                     162 00105$:
                            163 ;src/funciones.c:68: i--; 
   76AF 0D            [ 4]  164 	dec	c
   76B0                     165 00109$:
                            166 ;src/funciones.c:70: } while (i > 0 && i <= 80);
   76B0 79            [ 4]  167 	ld	a, c
   76B1 B7            [ 4]  168 	or	a, a
   76B2 C8            [11]  169 	ret	Z
   76B3 3E 50         [ 7]  170 	ld	a, #0x50
   76B5 91            [ 4]  171 	sub	a, c
   76B6 30 D5         [12]  172 	jr	NC,00108$
   76B8 C9            [10]  173 	ret
                            174 ;src/funciones.c:74: void pausaTecladoLibre(){
                            175 ;	---------------------------------
                            176 ; Function pausaTecladoLibre
                            177 ; ---------------------------------
   76B9                     178 _pausaTecladoLibre::
                            179 ;src/funciones.c:75: while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
   76B9                     180 00101$:
   76B9 CD FD 94      [17]  181 	call	_cpct_isAnyKeyPressed_f
   76BC 7D            [ 4]  182 	ld	a, l
   76BD B7            [ 4]  183 	or	a, a
   76BE 20 F9         [12]  184 	jr	NZ,00101$
   76C0 C9            [10]  185 	ret
                            186 ;src/funciones.c:81: void dibujarMarcoExterior (){
                            187 ;	---------------------------------
                            188 ; Function dibujarMarcoExterior
                            189 ; ---------------------------------
   76C1                     190 _dibujarMarcoExterior::
   76C1 DD E5         [15]  191 	push	ix
   76C3 DD 21 00 00   [14]  192 	ld	ix,#0
   76C7 DD 39         [15]  193 	add	ix,sp
   76C9 F5            [11]  194 	push	af
                            195 ;src/funciones.c:86: tile = (u8*) &G_tile_cruzada[0];
   76CA 01 C9 63      [10]  196 	ld	bc, #_G_tile_cruzada+0
                            197 ;src/funciones.c:87: if (nivel > 10)
   76CD 3E 0A         [ 7]  198 	ld	a, #0x0a
   76CF FD 21 60 A2   [14]  199 	ld	iy, #_nivel
   76D3 FD 96 00      [19]  200 	sub	a, 0 (iy)
   76D6 30 03         [12]  201 	jr	NC,00102$
                            202 ;src/funciones.c:88: tile = (u8*) &G_tile_caverna[0];
   76D8 01 09 64      [10]  203 	ld	bc, #_G_tile_caverna
   76DB                     204 00102$:
                            205 ;src/funciones.c:89: if (nivel > 20)
   76DB 3E 14         [ 7]  206 	ld	a, #0x14
   76DD FD 21 60 A2   [14]  207 	ld	iy, #_nivel
   76E1 FD 96 00      [19]  208 	sub	a, 0 (iy)
   76E4 30 03         [12]  209 	jr	NC,00115$
                            210 ;src/funciones.c:90: tile = (u8*) &G_tile_castillo[0];
   76E6 01 49 64      [10]  211 	ld	bc, #_G_tile_castillo
                            212 ;src/funciones.c:94: for (i=0; i < 80; i += 4) {
   76E9                     213 00115$:
   76E9 16 00         [ 7]  214 	ld	d, #0x00
   76EB                     215 00107$:
                            216 ;src/funciones.c:95: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,   0), 4, 16);
   76EB C5            [11]  217 	push	bc
   76EC D5            [11]  218 	push	de
   76ED AF            [ 4]  219 	xor	a, a
   76EE F5            [11]  220 	push	af
   76EF 33            [ 6]  221 	inc	sp
   76F0 D5            [11]  222 	push	de
   76F1 33            [ 6]  223 	inc	sp
   76F2 21 00 C0      [10]  224 	ld	hl, #0xc000
   76F5 E5            [11]  225 	push	hl
   76F6 CD 2C 96      [17]  226 	call	_cpct_getScreenPtr
   76F9 D1            [10]  227 	pop	de
   76FA C1            [10]  228 	pop	bc
   76FB E5            [11]  229 	push	hl
   76FC FD E1         [14]  230 	pop	iy
   76FE 33            [ 6]  231 	inc	sp
   76FF 33            [ 6]  232 	inc	sp
   7700 C5            [11]  233 	push	bc
   7701 C5            [11]  234 	push	bc
   7702 D5            [11]  235 	push	de
   7703 21 04 10      [10]  236 	ld	hl, #0x1004
   7706 E5            [11]  237 	push	hl
   7707 FD E5         [15]  238 	push	iy
   7709 DD 6E FE      [19]  239 	ld	l,-2 (ix)
   770C DD 66 FF      [19]  240 	ld	h,-1 (ix)
   770F E5            [11]  241 	push	hl
   7710 CD 89 91      [17]  242 	call	_cpct_drawSprite
   7713 D1            [10]  243 	pop	de
   7714 D5            [11]  244 	push	de
   7715 3E B0         [ 7]  245 	ld	a, #0xb0
   7717 F5            [11]  246 	push	af
   7718 33            [ 6]  247 	inc	sp
   7719 D5            [11]  248 	push	de
   771A 33            [ 6]  249 	inc	sp
   771B 21 00 C0      [10]  250 	ld	hl, #0xc000
   771E E5            [11]  251 	push	hl
   771F CD 2C 96      [17]  252 	call	_cpct_getScreenPtr
   7722 D1            [10]  253 	pop	de
   7723 C1            [10]  254 	pop	bc
   7724 E5            [11]  255 	push	hl
   7725 FD E1         [14]  256 	pop	iy
   7727 C5            [11]  257 	push	bc
   7728 D5            [11]  258 	push	de
   7729 21 04 10      [10]  259 	ld	hl, #0x1004
   772C E5            [11]  260 	push	hl
   772D FD E5         [15]  261 	push	iy
   772F DD 6E FE      [19]  262 	ld	l,-2 (ix)
   7732 DD 66 FF      [19]  263 	ld	h,-1 (ix)
   7735 E5            [11]  264 	push	hl
   7736 CD 89 91      [17]  265 	call	_cpct_drawSprite
   7739 D1            [10]  266 	pop	de
   773A C1            [10]  267 	pop	bc
                            268 ;src/funciones.c:94: for (i=0; i < 80; i += 4) {
   773B 14            [ 4]  269 	inc	d
   773C 14            [ 4]  270 	inc	d
   773D 14            [ 4]  271 	inc	d
   773E 14            [ 4]  272 	inc	d
   773F 7A            [ 4]  273 	ld	a, d
   7740 D6 50         [ 7]  274 	sub	a, #0x50
   7742 38 A7         [12]  275 	jr	C,00107$
                            276 ;src/funciones.c:99: for (i=16; i < 176; i += 16 ){
   7744 06 10         [ 7]  277 	ld	b, #0x10
   7746                     278 00109$:
                            279 ;src/funciones.c:100: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, 0, i), 4, 16);
   7746 C5            [11]  280 	push	bc
   7747 C5            [11]  281 	push	bc
   7748 33            [ 6]  282 	inc	sp
   7749 AF            [ 4]  283 	xor	a, a
   774A F5            [11]  284 	push	af
   774B 33            [ 6]  285 	inc	sp
   774C 21 00 C0      [10]  286 	ld	hl, #0xc000
   774F E5            [11]  287 	push	hl
   7750 CD 2C 96      [17]  288 	call	_cpct_getScreenPtr
   7753 11 04 10      [10]  289 	ld	de, #0x1004
   7756 D5            [11]  290 	push	de
   7757 E5            [11]  291 	push	hl
   7758 DD 6E FE      [19]  292 	ld	l,-2 (ix)
   775B DD 66 FF      [19]  293 	ld	h,-1 (ix)
   775E E5            [11]  294 	push	hl
   775F CD 89 91      [17]  295 	call	_cpct_drawSprite
   7762 C1            [10]  296 	pop	bc
                            297 ;src/funciones.c:101: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,76, i), 4, 16);  
   7763 C5            [11]  298 	push	bc
   7764 C5            [11]  299 	push	bc
   7765 33            [ 6]  300 	inc	sp
   7766 3E 4C         [ 7]  301 	ld	a, #0x4c
   7768 F5            [11]  302 	push	af
   7769 33            [ 6]  303 	inc	sp
   776A 21 00 C0      [10]  304 	ld	hl, #0xc000
   776D E5            [11]  305 	push	hl
   776E CD 2C 96      [17]  306 	call	_cpct_getScreenPtr
   7771 11 04 10      [10]  307 	ld	de, #0x1004
   7774 D5            [11]  308 	push	de
   7775 E5            [11]  309 	push	hl
   7776 DD 6E FE      [19]  310 	ld	l,-2 (ix)
   7779 DD 66 FF      [19]  311 	ld	h,-1 (ix)
   777C E5            [11]  312 	push	hl
   777D CD 89 91      [17]  313 	call	_cpct_drawSprite
   7780 C1            [10]  314 	pop	bc
                            315 ;src/funciones.c:99: for (i=16; i < 176; i += 16 ){
   7781 78            [ 4]  316 	ld	a, b
   7782 C6 10         [ 7]  317 	add	a, #0x10
   7784 47            [ 4]  318 	ld	b,a
   7785 D6 B0         [ 7]  319 	sub	a, #0xb0
   7787 38 BD         [12]  320 	jr	C,00109$
   7789 DD F9         [10]  321 	ld	sp, ix
   778B DD E1         [14]  322 	pop	ix
   778D C9            [10]  323 	ret
                            324 ;src/funciones.c:106: void dibujarMarcoInterior (){
                            325 ;	---------------------------------
                            326 ; Function dibujarMarcoInterior
                            327 ; ---------------------------------
   778E                     328 _dibujarMarcoInterior::
   778E DD E5         [15]  329 	push	ix
   7790 DD 21 00 00   [14]  330 	ld	ix,#0
   7794 DD 39         [15]  331 	add	ix,sp
   7796 F5            [11]  332 	push	af
                            333 ;src/funciones.c:111: tile = (u8*) &G_tile_cruzada[0];
   7797 01 C9 63      [10]  334 	ld	bc, #_G_tile_cruzada
                            335 ;src/funciones.c:112: if (nivel > 10)
   779A 3E 0A         [ 7]  336 	ld	a, #0x0a
   779C FD 21 60 A2   [14]  337 	ld	iy, #_nivel
   77A0 FD 96 00      [19]  338 	sub	a, 0 (iy)
   77A3 30 03         [12]  339 	jr	NC,00102$
                            340 ;src/funciones.c:113: tile = (u8*) &G_tile_caverna[0];
   77A5 01 09 64      [10]  341 	ld	bc, #_G_tile_caverna
   77A8                     342 00102$:
                            343 ;src/funciones.c:114: if (nivel > 20)
   77A8 3E 14         [ 7]  344 	ld	a, #0x14
   77AA FD 21 60 A2   [14]  345 	ld	iy, #_nivel
   77AE FD 96 00      [19]  346 	sub	a, 0 (iy)
   77B1 30 03         [12]  347 	jr	NC,00115$
                            348 ;src/funciones.c:115: tile = (u8*) &G_tile_castillo[0];
   77B3 01 49 64      [10]  349 	ld	bc, #_G_tile_castillo
                            350 ;src/funciones.c:119: for (i=0; i < 80; i += 4) {
   77B6                     351 00115$:
   77B6 1E 00         [ 7]  352 	ld	e, #0x00
   77B8                     353 00107$:
                            354 ;src/funciones.c:120: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,  48), 4, 16);
   77B8 C5            [11]  355 	push	bc
   77B9 D5            [11]  356 	push	de
   77BA 16 30         [ 7]  357 	ld	d,#0x30
   77BC D5            [11]  358 	push	de
   77BD 21 00 C0      [10]  359 	ld	hl, #0xc000
   77C0 E5            [11]  360 	push	hl
   77C1 CD 2C 96      [17]  361 	call	_cpct_getScreenPtr
   77C4 D1            [10]  362 	pop	de
   77C5 C1            [10]  363 	pop	bc
   77C6 E5            [11]  364 	push	hl
   77C7 FD E1         [14]  365 	pop	iy
   77C9 33            [ 6]  366 	inc	sp
   77CA 33            [ 6]  367 	inc	sp
   77CB C5            [11]  368 	push	bc
   77CC C5            [11]  369 	push	bc
   77CD D5            [11]  370 	push	de
   77CE 21 04 10      [10]  371 	ld	hl, #0x1004
   77D1 E5            [11]  372 	push	hl
   77D2 FD E5         [15]  373 	push	iy
   77D4 DD 6E FE      [19]  374 	ld	l,-2 (ix)
   77D7 DD 66 FF      [19]  375 	ld	h,-1 (ix)
   77DA E5            [11]  376 	push	hl
   77DB CD 89 91      [17]  377 	call	_cpct_drawSprite
   77DE D1            [10]  378 	pop	de
   77DF C1            [10]  379 	pop	bc
                            380 ;src/funciones.c:119: for (i=0; i < 80; i += 4) {
   77E0 1C            [ 4]  381 	inc	e
   77E1 1C            [ 4]  382 	inc	e
   77E2 1C            [ 4]  383 	inc	e
   77E3 1C            [ 4]  384 	inc	e
   77E4 7B            [ 4]  385 	ld	a, e
   77E5 D6 50         [ 7]  386 	sub	a, #0x50
   77E7 38 CF         [12]  387 	jr	C,00107$
                            388 ;src/funciones.c:123: for (i=64; i < 176; i += 16 ){
   77E9 06 40         [ 7]  389 	ld	b, #0x40
   77EB                     390 00109$:
                            391 ;src/funciones.c:124: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,40, i), 4, 16);
   77EB C5            [11]  392 	push	bc
   77EC C5            [11]  393 	push	bc
   77ED 33            [ 6]  394 	inc	sp
   77EE 3E 28         [ 7]  395 	ld	a, #0x28
   77F0 F5            [11]  396 	push	af
   77F1 33            [ 6]  397 	inc	sp
   77F2 21 00 C0      [10]  398 	ld	hl, #0xc000
   77F5 E5            [11]  399 	push	hl
   77F6 CD 2C 96      [17]  400 	call	_cpct_getScreenPtr
   77F9 11 04 10      [10]  401 	ld	de, #0x1004
   77FC D5            [11]  402 	push	de
   77FD E5            [11]  403 	push	hl
   77FE DD 6E FE      [19]  404 	ld	l,-2 (ix)
   7801 DD 66 FF      [19]  405 	ld	h,-1 (ix)
   7804 E5            [11]  406 	push	hl
   7805 CD 89 91      [17]  407 	call	_cpct_drawSprite
   7808 C1            [10]  408 	pop	bc
                            409 ;src/funciones.c:123: for (i=64; i < 176; i += 16 ){
   7809 78            [ 4]  410 	ld	a, b
   780A C6 10         [ 7]  411 	add	a, #0x10
   780C 47            [ 4]  412 	ld	b,a
   780D D6 B0         [ 7]  413 	sub	a, #0xb0
   780F 38 DA         [12]  414 	jr	C,00109$
                            415 ;src/funciones.c:128: cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
   7811 21 00 00      [10]  416 	ld	hl, #0x0000
   7814 E5            [11]  417 	push	hl
   7815 2E 00         [ 7]  418 	ld	l, #0x00
   7817 E5            [11]  419 	push	hl
   7818 CD 26 95      [17]  420 	call	_cpct_px2byteM1
   781B F1            [10]  421 	pop	af
   781C F1            [10]  422 	pop	af
   781D 45            [ 4]  423 	ld	b, l
   781E 21 22 80      [10]  424 	ld	hl, #0x8022
   7821 E5            [11]  425 	push	hl
   7822 C5            [11]  426 	push	bc
   7823 33            [ 6]  427 	inc	sp
   7824 21 5B C2      [10]  428 	ld	hl, #0xc25b
   7827 E5            [11]  429 	push	hl
   7828 CD 53 95      [17]  430 	call	_cpct_drawSolidBox
   782B DD F9         [10]  431 	ld	sp, ix
   782D DD E1         [14]  432 	pop	ix
   782F C9            [10]  433 	ret
                            434 ;src/funciones.c:131: void dibujarEscenario(){
                            435 ;	---------------------------------
                            436 ; Function dibujarEscenario
                            437 ; ---------------------------------
   7830                     438 _dibujarEscenario::
                            439 ;src/funciones.c:134: cpct_etm_setTileset2x4(tileset1);
   7830 21 BB 51      [10]  440 	ld	hl, #_tileset1
   7833 CD BD 92      [17]  441 	call	_cpct_etm_setTileset2x4
                            442 ;src/funciones.c:135: if (nivel > 10)
   7836 3E 0A         [ 7]  443 	ld	a, #0x0a
   7838 FD 21 60 A2   [14]  444 	ld	iy, #_nivel
   783C FD 96 00      [19]  445 	sub	a, 0 (iy)
   783F 30 06         [12]  446 	jr	NC,00102$
                            447 ;src/funciones.c:136: cpct_etm_setTileset2x4(tileset2);
   7841 21 E7 49      [10]  448 	ld	hl, #_tileset2
   7844 CD BD 92      [17]  449 	call	_cpct_etm_setTileset2x4
   7847                     450 00102$:
                            451 ;src/funciones.c:137: if (nivel > 20)
   7847 3E 14         [ 7]  452 	ld	a, #0x14
   7849 FD 21 60 A2   [14]  453 	ld	iy, #_nivel
   784D FD 96 00      [19]  454 	sub	a, 0 (iy)
   7850 30 06         [12]  455 	jr	NC,00104$
                            456 ;src/funciones.c:138: cpct_etm_setTileset2x4(tileset3);
   7852 21 17 42      [10]  457 	ld	hl, #_tileset3
   7855 CD BD 92      [17]  458 	call	_cpct_etm_setTileset2x4
   7858                     459 00104$:
                            460 ;src/funciones.c:140: mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
   7858 01 0F 05      [10]  461 	ld	bc, #_g_mapa01+0
   785B FD 21 60 A2   [14]  462 	ld	iy, #_nivel
   785F FD 5E 00      [19]  463 	ld	e, 0 (iy)
   7862 16 00         [ 7]  464 	ld	d, #0x00
   7864 1B            [ 6]  465 	dec	de
   7865 6B            [ 4]  466 	ld	l, e
   7866 62            [ 4]  467 	ld	h, d
   7867 29            [11]  468 	add	hl, hl
   7868 19            [11]  469 	add	hl, de
   7869 29            [11]  470 	add	hl, hl
   786A 19            [11]  471 	add	hl, de
   786B 29            [11]  472 	add	hl, hl
   786C 19            [11]  473 	add	hl, de
   786D 29            [11]  474 	add	hl, hl
   786E 19            [11]  475 	add	hl, de
   786F 29            [11]  476 	add	hl, hl
   7870 19            [11]  477 	add	hl, de
   7871 29            [11]  478 	add	hl, hl
   7872 29            [11]  479 	add	hl, hl
   7873 29            [11]  480 	add	hl, hl
   7874 09            [11]  481 	add	hl, bc
                            482 ;src/funciones.c:144: __endasm;
   7875 F3            [ 4]  483 	di
                            484 ;src/funciones.c:145: cpct_etm_drawTilemap2x4_f ( g_mapa01_W, g_mapa01_H , INICIO_AREA_JUEGO, mapa);
   7876 E5            [11]  485 	push	hl
   7877 21 84 C2      [10]  486 	ld	hl, #0xc284
   787A E5            [11]  487 	push	hl
   787B 21 12 1C      [10]  488 	ld	hl, #0x1c12
   787E E5            [11]  489 	push	hl
   787F CD 53 94      [17]  490 	call	_cpct_etm_drawTilemap2x4_f
                            491 ;src/funciones.c:148: __endasm;
   7882 FB            [ 4]  492 	ei
   7883 C9            [10]  493 	ret
                            494 ;src/funciones.c:152: void printStats(TStats *a) {
                            495 ;	---------------------------------
                            496 ; Function printStats
                            497 ; ---------------------------------
   7884                     498 _printStats::
   7884 DD E5         [15]  499 	push	ix
   7886 DD 21 00 00   [14]  500 	ld	ix,#0
   788A DD 39         [15]  501 	add	ix,sp
   788C 21 D4 FF      [10]  502 	ld	hl, #-44
   788F 39            [11]  503 	add	hl, sp
   7890 F9            [ 6]  504 	ld	sp, hl
                            505 ;src/funciones.c:155: cpct_setDrawCharM1(2, 0);
   7891 21 02 00      [10]  506 	ld	hl, #0x0002
   7894 E5            [11]  507 	push	hl
   7895 CD 4C 96      [17]  508 	call	_cpct_setDrawCharM1
                            509 ;src/funciones.c:156: sprintf(temp, "                                    ");
   7898 11 32 79      [10]  510 	ld	de, #___str_0+0
   789B 21 00 00      [10]  511 	ld	hl, #0x0000
   789E 39            [11]  512 	add	hl, sp
   789F DD 75 FE      [19]  513 	ld	-2 (ix), l
   78A2 DD 74 FF      [19]  514 	ld	-1 (ix), h
   78A5 D5            [11]  515 	push	de
   78A6 E5            [11]  516 	push	hl
   78A7 CD FB 93      [17]  517 	call	_sprintf
   78AA F1            [10]  518 	pop	af
   78AB F1            [10]  519 	pop	af
                            520 ;src/funciones.c:157: if (a->energy)
   78AC DD 4E 04      [19]  521 	ld	c,4 (ix)
   78AF DD 46 05      [19]  522 	ld	b,5 (ix)
   78B2 C5            [11]  523 	push	bc
   78B3 FD E1         [14]  524 	pop	iy
   78B5 FD 5E 0B      [19]  525 	ld	e, 11 (iy)
   78B8 7B            [ 4]  526 	ld	a, e
   78B9 B7            [ 4]  527 	or	a, a
   78BA 28 53         [12]  528 	jr	Z,00102$
                            529 ;src/funciones.c:158: sprintf(temp, "%-9s=> HP:%02d. ATT: %02d. DEF: %02d",a->name, a->energy,a->attack,a->defense);
   78BC C5            [11]  530 	push	bc
   78BD FD E1         [14]  531 	pop	iy
   78BF FD 6E 0F      [19]  532 	ld	l, 15 (iy)
   78C2 DD 75 FC      [19]  533 	ld	-4 (ix), l
   78C5 DD 36 FD 00   [19]  534 	ld	-3 (ix), #0x00
   78C9 C5            [11]  535 	push	bc
   78CA FD E1         [14]  536 	pop	iy
   78CC FD 6E 0D      [19]  537 	ld	l, 13 (iy)
   78CF DD 75 FA      [19]  538 	ld	-6 (ix), l
   78D2 DD 36 FB 00   [19]  539 	ld	-5 (ix), #0x00
   78D6 DD 73 F8      [19]  540 	ld	-8 (ix), e
   78D9 DD 36 F9 00   [19]  541 	ld	-7 (ix), #0x00
   78DD 59            [ 4]  542 	ld	e, c
   78DE 50            [ 4]  543 	ld	d, b
   78DF 13            [ 6]  544 	inc	de
   78E0 DD 6E FE      [19]  545 	ld	l,-2 (ix)
   78E3 DD 66 FF      [19]  546 	ld	h,-1 (ix)
   78E6 E5            [11]  547 	push	hl
   78E7 FD E1         [14]  548 	pop	iy
   78E9 C5            [11]  549 	push	bc
   78EA DD 6E FC      [19]  550 	ld	l,-4 (ix)
   78ED DD 66 FD      [19]  551 	ld	h,-3 (ix)
   78F0 E5            [11]  552 	push	hl
   78F1 DD 6E FA      [19]  553 	ld	l,-6 (ix)
   78F4 DD 66 FB      [19]  554 	ld	h,-5 (ix)
   78F7 E5            [11]  555 	push	hl
   78F8 DD 6E F8      [19]  556 	ld	l,-8 (ix)
   78FB DD 66 F9      [19]  557 	ld	h,-7 (ix)
   78FE E5            [11]  558 	push	hl
   78FF D5            [11]  559 	push	de
   7900 21 57 79      [10]  560 	ld	hl, #___str_1
   7903 E5            [11]  561 	push	hl
   7904 FD E5         [15]  562 	push	iy
   7906 CD FB 93      [17]  563 	call	_sprintf
   7909 21 0C 00      [10]  564 	ld	hl, #12
   790C 39            [11]  565 	add	hl, sp
   790D F9            [ 6]  566 	ld	sp, hl
   790E C1            [10]  567 	pop	bc
   790F                     568 00102$:
                            569 ;src/funciones.c:160: mydrawStringM1(temp, cpct_getScreenPtr(CPCT_VMEM_START, 4, a->pos_y));
   790F C5            [11]  570 	push	bc
   7910 FD E1         [14]  571 	pop	iy
   7912 FD 46 12      [19]  572 	ld	b, 18 (iy)
   7915 C5            [11]  573 	push	bc
   7916 33            [ 6]  574 	inc	sp
   7917 3E 04         [ 7]  575 	ld	a, #0x04
   7919 F5            [11]  576 	push	af
   791A 33            [ 6]  577 	inc	sp
   791B 21 00 C0      [10]  578 	ld	hl, #0xc000
   791E E5            [11]  579 	push	hl
   791F CD 2C 96      [17]  580 	call	_cpct_getScreenPtr
   7922 DD 4E FE      [19]  581 	ld	c,-2 (ix)
   7925 DD 46 FF      [19]  582 	ld	b,-1 (ix)
   7928 E5            [11]  583 	push	hl
   7929 C5            [11]  584 	push	bc
   792A CD BA 88      [17]  585 	call	_mydrawStringM1
   792D DD F9         [10]  586 	ld	sp, ix
   792F DD E1         [14]  587 	pop	ix
   7931 C9            [10]  588 	ret
   7932                     589 ___str_0:
   7932 20 20 20 20 20 20   590 	.ascii "                                    "
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
   7956 00                  591 	.db 0x00
   7957                     592 ___str_1:
   7957 25 2D 39 73 3D 3E   593 	.ascii "%-9s=> HP:%02d. ATT: %02d. DEF: %02d"
        20 48 50 3A 25 30
        32 64 2E 20 41 54
        54 3A 20 25 30 32
        64 2E 20 44 45 46
        3A 20 25 30 32 64
   797B 00                  594 	.db 0x00
                            595 ;src/funciones.c:163: void printLevel() {
                            596 ;	---------------------------------
                            597 ; Function printLevel
                            598 ; ---------------------------------
   797C                     599 _printLevel::
   797C DD E5         [15]  600 	push	ix
   797E DD 21 00 00   [14]  601 	ld	ix,#0
   7982 DD 39         [15]  602 	add	ix,sp
   7984 21 D8 FF      [10]  603 	ld	hl, #-40
   7987 39            [11]  604 	add	hl, sp
   7988 F9            [ 6]  605 	ld	sp, hl
                            606 ;src/funciones.c:166: sprintf(temp, "LEVEL: %02d",nivel);
   7989 21 60 A2      [10]  607 	ld	hl,#_nivel + 0
   798C 5E            [ 7]  608 	ld	e, (hl)
   798D 16 00         [ 7]  609 	ld	d, #0x00
   798F 21 00 00      [10]  610 	ld	hl, #0x0000
   7992 39            [11]  611 	add	hl, sp
   7993 4D            [ 4]  612 	ld	c, l
   7994 44            [ 4]  613 	ld	b, h
   7995 E5            [11]  614 	push	hl
   7996 D5            [11]  615 	push	de
   7997 11 B9 79      [10]  616 	ld	de, #___str_2
   799A D5            [11]  617 	push	de
   799B C5            [11]  618 	push	bc
   799C CD FB 93      [17]  619 	call	_sprintf
   799F 21 06 00      [10]  620 	ld	hl, #6
   79A2 39            [11]  621 	add	hl, sp
   79A3 F9            [ 6]  622 	ld	sp, hl
   79A4 01 02 00      [10]  623 	ld	bc, #0x0002
   79A7 C5            [11]  624 	push	bc
   79A8 CD 4C 96      [17]  625 	call	_cpct_setDrawCharM1
   79AB E1            [10]  626 	pop	hl
                            627 ;src/funciones.c:168: mydrawStringM1(temp, cpctm_screenPtr(CPCT_VMEM_START, 4, 16));
   79AC 01 A4 C0      [10]  628 	ld	bc, #0xc0a4
   79AF C5            [11]  629 	push	bc
   79B0 E5            [11]  630 	push	hl
   79B1 CD BA 88      [17]  631 	call	_mydrawStringM1
   79B4 DD F9         [10]  632 	ld	sp, ix
   79B6 DD E1         [14]  633 	pop	ix
   79B8 C9            [10]  634 	ret
   79B9                     635 ___str_2:
   79B9 4C 45 56 45 4C 3A   636 	.ascii "LEVEL: %02d"
        20 25 30 32 64
   79C4 00                  637 	.db 0x00
                            638 ;src/funciones.c:171: void printConsole  (void* string, u8 pen, u8 bground) {
                            639 ;	---------------------------------
                            640 ; Function printConsole
                            641 ; ---------------------------------
   79C5                     642 _printConsole::
                            643 ;src/funciones.c:172: if (cursorConsola > 175){
   79C5 3E AF         [ 7]  644 	ld	a, #0xaf
   79C7 FD 21 61 A2   [14]  645 	ld	iy, #_cursorConsola
   79CB FD 96 00      [19]  646 	sub	a, 0 (iy)
   79CE 30 27         [12]  647 	jr	NC,00102$
                            648 ;src/funciones.c:174: pausa(SEGUNDO);
   79D0 21 00 80      [10]  649 	ld	hl, #0x8000
   79D3 E5            [11]  650 	push	hl
   79D4 CD 71 76      [17]  651 	call	_pausa
   79D7 F1            [10]  652 	pop	af
                            653 ;src/funciones.c:175: cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
   79D8 21 00 00      [10]  654 	ld	hl, #0x0000
   79DB E5            [11]  655 	push	hl
   79DC 2E 00         [ 7]  656 	ld	l, #0x00
   79DE E5            [11]  657 	push	hl
   79DF CD 26 95      [17]  658 	call	_cpct_px2byteM1
   79E2 F1            [10]  659 	pop	af
   79E3 F1            [10]  660 	pop	af
   79E4 45            [ 4]  661 	ld	b, l
   79E5 21 22 80      [10]  662 	ld	hl, #0x8022
   79E8 E5            [11]  663 	push	hl
   79E9 C5            [11]  664 	push	bc
   79EA 33            [ 6]  665 	inc	sp
   79EB 21 5B C2      [10]  666 	ld	hl, #0xc25b
   79EE E5            [11]  667 	push	hl
   79EF CD 53 95      [17]  668 	call	_cpct_drawSolidBox
                            669 ;src/funciones.c:176: cursorConsola = 64;
   79F2 21 61 A2      [10]  670 	ld	hl,#_cursorConsola + 0
   79F5 36 40         [10]  671 	ld	(hl), #0x40
   79F7                     672 00102$:
                            673 ;src/funciones.c:179: cpct_setDrawCharM1(pen, bground);
   79F7 21 05 00      [10]  674 	ld	hl, #5+0
   79FA 39            [11]  675 	add	hl, sp
   79FB 7E            [ 7]  676 	ld	a, (hl)
   79FC F5            [11]  677 	push	af
   79FD 33            [ 6]  678 	inc	sp
   79FE 21 05 00      [10]  679 	ld	hl, #5+0
   7A01 39            [11]  680 	add	hl, sp
   7A02 7E            [ 7]  681 	ld	a, (hl)
   7A03 F5            [11]  682 	push	af
   7A04 33            [ 6]  683 	inc	sp
   7A05 CD 4C 96      [17]  684 	call	_cpct_setDrawCharM1
                            685 ;src/funciones.c:180: mydrawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 44, cursorConsola));
   7A08 3A 61 A2      [13]  686 	ld	a, (_cursorConsola)
   7A0B 57            [ 4]  687 	ld	d,a
   7A0C 1E 2C         [ 7]  688 	ld	e,#0x2c
   7A0E D5            [11]  689 	push	de
   7A0F 21 00 C0      [10]  690 	ld	hl, #0xc000
   7A12 E5            [11]  691 	push	hl
   7A13 CD 2C 96      [17]  692 	call	_cpct_getScreenPtr
   7A16 E5            [11]  693 	push	hl
   7A17 21 04 00      [10]  694 	ld	hl, #4
   7A1A 39            [11]  695 	add	hl, sp
   7A1B 4E            [ 7]  696 	ld	c, (hl)
   7A1C 23            [ 6]  697 	inc	hl
   7A1D 46            [ 7]  698 	ld	b, (hl)
   7A1E C5            [11]  699 	push	bc
   7A1F CD BA 88      [17]  700 	call	_mydrawStringM1
                            701 ;src/funciones.c:181: cursorConsola +=8;
   7A22 21 61 A2      [10]  702 	ld	hl, #_cursorConsola
   7A25 7E            [ 7]  703 	ld	a, (hl)
   7A26 C6 08         [ 7]  704 	add	a, #0x08
   7A28 77            [ 7]  705 	ld	(hl), a
   7A29 C9            [10]  706 	ret
                            707 ;src/funciones.c:184: void atacar(TStats *a, TStats *b) {
                            708 ;	---------------------------------
                            709 ; Function atacar
                            710 ; ---------------------------------
   7A2A                     711 _atacar::
   7A2A DD E5         [15]  712 	push	ix
   7A2C DD 21 00 00   [14]  713 	ld	ix,#0
   7A30 DD 39         [15]  714 	add	ix,sp
   7A32 21 DD FF      [10]  715 	ld	hl, #-35
   7A35 39            [11]  716 	add	hl, sp
   7A36 F9            [ 6]  717 	ld	sp, hl
                            718 ;src/funciones.c:188: pen = 0;
   7A37 DD 36 F3 00   [19]  719 	ld	-13 (ix), #0x00
                            720 ;src/funciones.c:189: bg = 2;
   7A3B DD 36 F2 02   [19]  721 	ld	-14 (ix), #0x02
                            722 ;src/funciones.c:190: nota = 33;
   7A3F DD 36 F1 21   [19]  723 	ld	-15 (ix), #0x21
                            724 ;src/funciones.c:191: if ((u16) a->sprite == (u16) G_mendo)  {
   7A43 DD 7E 04      [19]  725 	ld	a, 4 (ix)
   7A46 DD 77 F9      [19]  726 	ld	-7 (ix), a
   7A49 DD 7E 05      [19]  727 	ld	a, 5 (ix)
   7A4C DD 77 FA      [19]  728 	ld	-6 (ix), a
   7A4F DD 6E F9      [19]  729 	ld	l,-7 (ix)
   7A52 DD 66 FA      [19]  730 	ld	h,-6 (ix)
   7A55 11 13 00      [10]  731 	ld	de, #0x0013
   7A58 19            [11]  732 	add	hl, de
   7A59 4E            [ 7]  733 	ld	c, (hl)
   7A5A 23            [ 6]  734 	inc	hl
   7A5B 46            [ 7]  735 	ld	b, (hl)
   7A5C 11 89 64      [10]  736 	ld	de, #_G_mendo+0
   7A5F 79            [ 4]  737 	ld	a, c
   7A60 93            [ 4]  738 	sub	a, e
   7A61 20 10         [12]  739 	jr	NZ,00102$
   7A63 78            [ 4]  740 	ld	a, b
   7A64 92            [ 4]  741 	sub	a, d
   7A65 20 0C         [12]  742 	jr	NZ,00102$
                            743 ;src/funciones.c:192: pen = 2;
   7A67 DD 36 F3 02   [19]  744 	ld	-13 (ix), #0x02
                            745 ;src/funciones.c:193: bg = 0;
   7A6B DD 36 F2 00   [19]  746 	ld	-14 (ix), #0x00
                            747 ;src/funciones.c:194: nota = 23;
   7A6F DD 36 F1 17   [19]  748 	ld	-15 (ix), #0x17
   7A73                     749 00102$:
                            750 ;src/funciones.c:197: if (b->energy) { //Asegurarnos que el atacado sigue vivo
   7A73 DD 7E 06      [19]  751 	ld	a, 6 (ix)
   7A76 DD 77 F7      [19]  752 	ld	-9 (ix), a
   7A79 DD 7E 07      [19]  753 	ld	a, 7 (ix)
   7A7C DD 77 F8      [19]  754 	ld	-8 (ix), a
   7A7F DD 7E F7      [19]  755 	ld	a, -9 (ix)
   7A82 C6 0B         [ 7]  756 	add	a, #0x0b
   7A84 DD 77 F5      [19]  757 	ld	-11 (ix), a
   7A87 DD 7E F8      [19]  758 	ld	a, -8 (ix)
   7A8A CE 00         [ 7]  759 	adc	a, #0x00
   7A8C DD 77 F6      [19]  760 	ld	-10 (ix), a
   7A8F DD 6E F5      [19]  761 	ld	l,-11 (ix)
   7A92 DD 66 F6      [19]  762 	ld	h,-10 (ix)
   7A95 7E            [ 7]  763 	ld	a, (hl)
   7A96 B7            [ 4]  764 	or	a, a
   7A97 CA CE 7B      [10]  765 	jp	Z, 00108$
                            766 ;src/funciones.c:198: ataque = a->attack + (2*(cpct_rand()%a->force)) - a->force;
   7A9A DD 6E F9      [19]  767 	ld	l,-7 (ix)
   7A9D DD 66 FA      [19]  768 	ld	h,-6 (ix)
   7AA0 11 0D 00      [10]  769 	ld	de, #0x000d
   7AA3 19            [11]  770 	add	hl, de
   7AA4 4E            [ 7]  771 	ld	c, (hl)
   7AA5 C5            [11]  772 	push	bc
   7AA6 CD 31 93      [17]  773 	call	_cpct_getRandom_mxor_u8
   7AA9 55            [ 4]  774 	ld	d, l
   7AAA C1            [10]  775 	pop	bc
   7AAB DD 6E F9      [19]  776 	ld	l,-7 (ix)
   7AAE DD 66 FA      [19]  777 	ld	h,-6 (ix)
   7AB1 C5            [11]  778 	push	bc
   7AB2 01 0E 00      [10]  779 	ld	bc, #0x000e
   7AB5 09            [11]  780 	add	hl, bc
   7AB6 C1            [10]  781 	pop	bc
   7AB7 46            [ 7]  782 	ld	b, (hl)
   7AB8 C5            [11]  783 	push	bc
   7AB9 4A            [ 4]  784 	ld	c, d
   7ABA C5            [11]  785 	push	bc
   7ABB CD C1 92      [17]  786 	call	__moduchar
   7ABE F1            [10]  787 	pop	af
   7ABF C1            [10]  788 	pop	bc
   7AC0 CB 25         [ 8]  789 	sla	l
   7AC2 09            [11]  790 	add	hl, bc
   7AC3 7D            [ 4]  791 	ld	a, l
   7AC4 90            [ 4]  792 	sub	a, b
                            793 ;src/funciones.c:199: sprintf(temp, "%-9s ATT %02d",a->name, ataque);
   7AC5 DD 77 F4      [19]  794 	ld	-12 (ix), a
   7AC8 5F            [ 4]  795 	ld	e, a
   7AC9 16 00         [ 7]  796 	ld	d, #0x00
   7ACB DD 4E F9      [19]  797 	ld	c,-7 (ix)
   7ACE DD 46 FA      [19]  798 	ld	b,-6 (ix)
   7AD1 03            [ 6]  799 	inc	bc
   7AD2 21 00 00      [10]  800 	ld	hl, #0x0000
   7AD5 39            [11]  801 	add	hl, sp
   7AD6 DD 75 F9      [19]  802 	ld	-7 (ix), l
   7AD9 DD 74 FA      [19]  803 	ld	-6 (ix), h
   7ADC D5            [11]  804 	push	de
   7ADD C5            [11]  805 	push	bc
   7ADE 01 D3 7B      [10]  806 	ld	bc, #___str_3
   7AE1 C5            [11]  807 	push	bc
   7AE2 E5            [11]  808 	push	hl
   7AE3 CD FB 93      [17]  809 	call	_sprintf
   7AE6 21 08 00      [10]  810 	ld	hl, #8
   7AE9 39            [11]  811 	add	hl, sp
   7AEA F9            [ 6]  812 	ld	sp, hl
                            813 ;src/funciones.c:200: printConsole(temp, pen, bg);
   7AEB DD 4E F9      [19]  814 	ld	c,-7 (ix)
   7AEE DD 46 FA      [19]  815 	ld	b,-6 (ix)
   7AF1 DD 66 F2      [19]  816 	ld	h, -14 (ix)
   7AF4 DD 6E F3      [19]  817 	ld	l, -13 (ix)
   7AF7 E5            [11]  818 	push	hl
   7AF8 C5            [11]  819 	push	bc
   7AF9 CD C5 79      [17]  820 	call	_printConsole
   7AFC F1            [10]  821 	pop	af
   7AFD F1            [10]  822 	pop	af
                            823 ;src/funciones.c:201: playFX (1, nota);
   7AFE DD 56 F1      [19]  824 	ld	d, -15 (ix)
   7B01 1E 01         [ 7]  825 	ld	e,#0x01
   7B03 D5            [11]  826 	push	de
   7B04 CD 8F 59      [17]  827 	call	_playFX
                            828 ;src/funciones.c:202: pausa(SEGUNDO/2);
   7B07 21 00 40      [10]  829 	ld	hl, #0x4000
   7B0A E3            [19]  830 	ex	(sp),hl
   7B0B CD 71 76      [17]  831 	call	_pausa
   7B0E F1            [10]  832 	pop	af
                            833 ;src/funciones.c:204: if (ataque < b->energy) {
   7B0F DD 6E F5      [19]  834 	ld	l,-11 (ix)
   7B12 DD 66 F6      [19]  835 	ld	h,-10 (ix)
   7B15 7E            [ 7]  836 	ld	a, (hl)
   7B16 DD 77 FF      [19]  837 	ld	-1 (ix), a
                            838 ;src/funciones.c:206: sprintf(temp, "%-9s HP=>%02d",b->name, b->energy);
   7B19 DD 7E F7      [19]  839 	ld	a, -9 (ix)
   7B1C C6 01         [ 7]  840 	add	a, #0x01
   7B1E DD 77 FD      [19]  841 	ld	-3 (ix), a
   7B21 DD 7E F8      [19]  842 	ld	a, -8 (ix)
   7B24 CE 00         [ 7]  843 	adc	a, #0x00
   7B26 DD 77 FE      [19]  844 	ld	-2 (ix), a
                            845 ;src/funciones.c:204: if (ataque < b->energy) {
   7B29 DD 7E F4      [19]  846 	ld	a, -12 (ix)
   7B2C DD 96 FF      [19]  847 	sub	a, -1 (ix)
   7B2F 30 2D         [12]  848 	jr	NC,00104$
                            849 ;src/funciones.c:205: b->energy = b->energy - ataque;
   7B31 DD 7E FF      [19]  850 	ld	a, -1 (ix)
   7B34 DD 96 F4      [19]  851 	sub	a, -12 (ix)
   7B37 DD 6E F5      [19]  852 	ld	l,-11 (ix)
   7B3A DD 66 F6      [19]  853 	ld	h,-10 (ix)
   7B3D 77            [ 7]  854 	ld	(hl), a
                            855 ;src/funciones.c:206: sprintf(temp, "%-9s HP=>%02d",b->name, b->energy);
   7B3E 6F            [ 4]  856 	ld	l, a
   7B3F 26 00         [ 7]  857 	ld	h, #0x00
   7B41 11 E1 7B      [10]  858 	ld	de, #___str_4+0
   7B44 DD 4E F9      [19]  859 	ld	c,-7 (ix)
   7B47 DD 46 FA      [19]  860 	ld	b,-6 (ix)
   7B4A E5            [11]  861 	push	hl
   7B4B DD 6E FD      [19]  862 	ld	l,-3 (ix)
   7B4E DD 66 FE      [19]  863 	ld	h,-2 (ix)
   7B51 E5            [11]  864 	push	hl
   7B52 D5            [11]  865 	push	de
   7B53 C5            [11]  866 	push	bc
   7B54 CD FB 93      [17]  867 	call	_sprintf
   7B57 21 08 00      [10]  868 	ld	hl, #8
   7B5A 39            [11]  869 	add	hl, sp
   7B5B F9            [ 6]  870 	ld	sp, hl
   7B5C 18 5D         [12]  871 	jr	00105$
   7B5E                     872 00104$:
                            873 ;src/funciones.c:208: b->energy = 0;
   7B5E DD 6E F5      [19]  874 	ld	l,-11 (ix)
   7B61 DD 66 F6      [19]  875 	ld	h,-10 (ix)
   7B64 36 00         [10]  876 	ld	(hl), #0x00
                            877 ;src/funciones.c:209: sprintf(temp, "%-9s DIED! ",b->name, b->energy);
   7B66 DD 6E F5      [19]  878 	ld	l,-11 (ix)
   7B69 DD 66 F6      [19]  879 	ld	h,-10 (ix)
   7B6C 7E            [ 7]  880 	ld	a, (hl)
   7B6D DD 77 FF      [19]  881 	ld	-1 (ix), a
   7B70 DD 77 F5      [19]  882 	ld	-11 (ix), a
   7B73 DD 36 F6 00   [19]  883 	ld	-10 (ix), #0x00
   7B77 DD 7E F9      [19]  884 	ld	a, -7 (ix)
   7B7A DD 77 FB      [19]  885 	ld	-5 (ix), a
   7B7D DD 7E FA      [19]  886 	ld	a, -6 (ix)
   7B80 DD 77 FC      [19]  887 	ld	-4 (ix), a
   7B83 DD 6E F5      [19]  888 	ld	l,-11 (ix)
   7B86 DD 66 F6      [19]  889 	ld	h,-10 (ix)
   7B89 E5            [11]  890 	push	hl
   7B8A DD 6E FD      [19]  891 	ld	l,-3 (ix)
   7B8D DD 66 FE      [19]  892 	ld	h,-2 (ix)
   7B90 E5            [11]  893 	push	hl
   7B91 21 EF 7B      [10]  894 	ld	hl, #___str_5
   7B94 E5            [11]  895 	push	hl
   7B95 DD 6E FB      [19]  896 	ld	l,-5 (ix)
   7B98 DD 66 FC      [19]  897 	ld	h,-4 (ix)
   7B9B E5            [11]  898 	push	hl
   7B9C CD FB 93      [17]  899 	call	_sprintf
   7B9F 21 08 00      [10]  900 	ld	hl, #8
   7BA2 39            [11]  901 	add	hl, sp
   7BA3 F9            [ 6]  902 	ld	sp, hl
                            903 ;src/funciones.c:210: printStats(b);
   7BA4 DD 6E F7      [19]  904 	ld	l,-9 (ix)
   7BA7 DD 66 F8      [19]  905 	ld	h,-8 (ix)
   7BAA E5            [11]  906 	push	hl
   7BAB CD 84 78      [17]  907 	call	_printStats
   7BAE F1            [10]  908 	pop	af
                            909 ;src/funciones.c:212: ataque = pen;
   7BAF DD 4E F3      [19]  910 	ld	c, -13 (ix)
                            911 ;src/funciones.c:213: pen = bg;
   7BB2 DD 7E F2      [19]  912 	ld	a, -14 (ix)
   7BB5 DD 77 F3      [19]  913 	ld	-13 (ix), a
                            914 ;src/funciones.c:214: bg = ataque;
   7BB8 DD 71 F2      [19]  915 	ld	-14 (ix), c
   7BBB                     916 00105$:
                            917 ;src/funciones.c:217: printConsole(temp, pen, bg);
   7BBB DD 4E F9      [19]  918 	ld	c,-7 (ix)
   7BBE DD 46 FA      [19]  919 	ld	b,-6 (ix)
   7BC1 DD 66 F2      [19]  920 	ld	h, -14 (ix)
   7BC4 DD 6E F3      [19]  921 	ld	l, -13 (ix)
   7BC7 E5            [11]  922 	push	hl
   7BC8 C5            [11]  923 	push	bc
   7BC9 CD C5 79      [17]  924 	call	_printConsole
   7BCC F1            [10]  925 	pop	af
   7BCD F1            [10]  926 	pop	af
   7BCE                     927 00108$:
   7BCE DD F9         [10]  928 	ld	sp, ix
   7BD0 DD E1         [14]  929 	pop	ix
   7BD2 C9            [10]  930 	ret
   7BD3                     931 ___str_3:
   7BD3 25 2D 39 73 20 41   932 	.ascii "%-9s ATT %02d"
        54 54 20 25 30 32
        64
   7BE0 00                  933 	.db 0x00
   7BE1                     934 ___str_4:
   7BE1 25 2D 39 73 20 48   935 	.ascii "%-9s HP=>%02d"
        50 3D 3E 25 30 32
        64
   7BEE 00                  936 	.db 0x00
   7BEF                     937 ___str_5:
   7BEF 25 2D 39 73 20 44   938 	.ascii "%-9s DIED! "
        49 45 44 21 20
   7BFA 00                  939 	.db 0x00
                            940 ;src/funciones.c:221: void comprobarPosicion (TStats *a, u8 nuevaPosicion){
                            941 ;	---------------------------------
                            942 ; Function comprobarPosicion
                            943 ; ---------------------------------
   7BFB                     944 _comprobarPosicion::
   7BFB DD E5         [15]  945 	push	ix
   7BFD DD 21 00 00   [14]  946 	ld	ix,#0
   7C01 DD 39         [15]  947 	add	ix,sp
   7C03 F5            [11]  948 	push	af
   7C04 3B            [ 6]  949 	dec	sp
                            950 ;src/funciones.c:224: nueva = nuevaPosicion;
   7C05 DD 7E 06      [19]  951 	ld	a, 6 (ix)
   7C08 DD 77 FD      [19]  952 	ld	-3 (ix), a
                            953 ;src/funciones.c:227: for (j = 0; j < 3; j++) {
   7C0B DD 36 FF 00   [19]  954 	ld	-1 (ix), #0x00
   7C0F DD 5E 04      [19]  955 	ld	e,4 (ix)
   7C12 DD 56 05      [19]  956 	ld	d,5 (ix)
   7C15 0E 00         [ 7]  957 	ld	c, #0x00
   7C17                     958 00113$:
                            959 ;src/funciones.c:228: if (a->id != j && entidad[j].energy) {
   7C17 1A            [ 7]  960 	ld	a, (de)
   7C18 DD 77 FE      [19]  961 	ld	-2 (ix), a
   7C1B 79            [ 4]  962 	ld	a, c
   7C1C DD 96 FE      [19]  963 	sub	a, -2 (ix)
   7C1F 28 65         [12]  964 	jr	Z,00114$
   7C21 06 00         [ 7]  965 	ld	b,#0x00
   7C23 69            [ 4]  966 	ld	l, c
   7C24 60            [ 4]  967 	ld	h, b
   7C25 29            [11]  968 	add	hl, hl
   7C26 29            [11]  969 	add	hl, hl
   7C27 09            [11]  970 	add	hl, bc
   7C28 29            [11]  971 	add	hl, hl
   7C29 29            [11]  972 	add	hl, hl
   7C2A 09            [11]  973 	add	hl, bc
   7C2B 44            [ 4]  974 	ld	b, h
   7C2C FD 21 21 A2   [14]  975 	ld	iy, #_entidad
   7C30 C5            [11]  976 	push	bc
   7C31 4D            [ 4]  977 	ld	c, l
   7C32 FD 09         [15]  978 	add	iy, bc
   7C34 C1            [10]  979 	pop	bc
   7C35 FD E5         [15]  980 	push	iy
   7C37 E1            [10]  981 	pop	hl
   7C38 C5            [11]  982 	push	bc
   7C39 01 0B 00      [10]  983 	ld	bc, #0x000b
   7C3C 09            [11]  984 	add	hl, bc
   7C3D C1            [10]  985 	pop	bc
   7C3E 7E            [ 7]  986 	ld	a, (hl)
   7C3F B7            [ 4]  987 	or	a, a
   7C40 28 44         [12]  988 	jr	Z,00114$
                            989 ;src/funciones.c:229: if (entidad[j].pos_x == nueva) {
   7C42 FD E5         [15]  990 	push	iy
   7C44 E1            [10]  991 	pop	hl
   7C45 C5            [11]  992 	push	bc
   7C46 01 10 00      [10]  993 	ld	bc, #0x0010
   7C49 09            [11]  994 	add	hl, bc
   7C4A C1            [10]  995 	pop	bc
   7C4B DD 7E FD      [19]  996 	ld	a,-3 (ix)
   7C4E 96            [ 7]  997 	sub	a,(hl)
   7C4F 20 35         [12]  998 	jr	NZ,00114$
                            999 ;src/funciones.c:230: nueva = 0;
   7C51 DD 36 FD 00   [19] 1000 	ld	-3 (ix), #0x00
                           1001 ;src/funciones.c:231: if (a->id == 0 || j == 0) //ataque sólo si está involucrado el jugador. Para que no se ataquen los enemigos
   7C55 DD 7E FE      [19] 1002 	ld	a, -2 (ix)
   7C58 B7            [ 4] 1003 	or	a, a
   7C59 28 06         [12] 1004 	jr	Z,00101$
   7C5B DD 7E FF      [19] 1005 	ld	a, -1 (ix)
   7C5E B7            [ 4] 1006 	or	a, a
   7C5F 20 2E         [12] 1007 	jr	NZ,00109$
   7C61                    1008 00101$:
                           1009 ;src/funciones.c:232: atacar(&entidad[a->id], &entidad[j]);
   7C61 FD E5         [15] 1010 	push	iy
   7C63 C1            [10] 1011 	pop	bc
   7C64 D5            [11] 1012 	push	de
   7C65 DD 5E FE      [19] 1013 	ld	e,-2 (ix)
   7C68 16 00         [ 7] 1014 	ld	d,#0x00
   7C6A 6B            [ 4] 1015 	ld	l, e
   7C6B 62            [ 4] 1016 	ld	h, d
   7C6C 29            [11] 1017 	add	hl, hl
   7C6D 29            [11] 1018 	add	hl, hl
   7C6E 19            [11] 1019 	add	hl, de
   7C6F 29            [11] 1020 	add	hl, hl
   7C70 29            [11] 1021 	add	hl, hl
   7C71 19            [11] 1022 	add	hl, de
   7C72 D1            [10] 1023 	pop	de
   7C73 3E 21         [ 7] 1024 	ld	a, #<(_entidad)
   7C75 85            [ 4] 1025 	add	a, l
   7C76 6F            [ 4] 1026 	ld	l, a
   7C77 3E A2         [ 7] 1027 	ld	a, #>(_entidad)
   7C79 8C            [ 4] 1028 	adc	a, h
   7C7A 67            [ 4] 1029 	ld	h, a
   7C7B D5            [11] 1030 	push	de
   7C7C C5            [11] 1031 	push	bc
   7C7D E5            [11] 1032 	push	hl
   7C7E CD 2A 7A      [17] 1033 	call	_atacar
   7C81 F1            [10] 1034 	pop	af
   7C82 F1            [10] 1035 	pop	af
   7C83 D1            [10] 1036 	pop	de
                           1037 ;src/funciones.c:233: break;
   7C84 18 09         [12] 1038 	jr	00109$
   7C86                    1039 00114$:
                           1040 ;src/funciones.c:227: for (j = 0; j < 3; j++) {
   7C86 0C            [ 4] 1041 	inc	c
   7C87 DD 71 FF      [19] 1042 	ld	-1 (ix), c
   7C8A 79            [ 4] 1043 	ld	a, c
   7C8B D6 03         [ 7] 1044 	sub	a, #0x03
   7C8D 38 88         [12] 1045 	jr	C,00113$
   7C8F                    1046 00109$:
                           1047 ;src/funciones.c:239: if (nueva > 3 && nueva < 37)
   7C8F 3E 03         [ 7] 1048 	ld	a, #0x03
   7C91 DD 96 FD      [19] 1049 	sub	a, -3 (ix)
   7C94 30 0F         [12] 1050 	jr	NC,00115$
   7C96 DD 7E FD      [19] 1051 	ld	a, -3 (ix)
   7C99 D6 25         [ 7] 1052 	sub	a, #0x25
   7C9B 30 08         [12] 1053 	jr	NC,00115$
                           1054 ;src/funciones.c:240: a->pos_x = nueva;
   7C9D 21 10 00      [10] 1055 	ld	hl, #0x0010
   7CA0 19            [11] 1056 	add	hl, de
   7CA1 DD 7E FD      [19] 1057 	ld	a, -3 (ix)
   7CA4 77            [ 7] 1058 	ld	(hl), a
   7CA5                    1059 00115$:
   7CA5 DD F9         [10] 1060 	ld	sp, ix
   7CA7 DD E1         [14] 1061 	pop	ix
   7CA9 C9            [10] 1062 	ret
                           1063 ;src/funciones.c:243: void moverIzq(TStats *a) {
                           1064 ;	---------------------------------
                           1065 ; Function moverIzq
                           1066 ; ---------------------------------
   7CAA                    1067 _moverIzq::
   7CAA DD E5         [15] 1068 	push	ix
   7CAC DD 21 00 00   [14] 1069 	ld	ix,#0
   7CB0 DD 39         [15] 1070 	add	ix,sp
   7CB2 21 E8 FF      [10] 1071 	ld	hl, #-24
   7CB5 39            [11] 1072 	add	hl, sp
   7CB6 F9            [ 6] 1073 	ld	sp, hl
                           1074 ;src/funciones.c:246: pen = 0;
   7CB7 DD 36 E9 00   [19] 1075 	ld	-23 (ix), #0x00
                           1076 ;src/funciones.c:247: bg = 2;
   7CBB DD 36 E8 02   [19] 1077 	ld	-24 (ix), #0x02
                           1078 ;src/funciones.c:248: if ((u16) a->sprite == (u16) G_mendo)  {
   7CBF DD 4E 04      [19] 1079 	ld	c,4 (ix)
   7CC2 DD 46 05      [19] 1080 	ld	b,5 (ix)
   7CC5 69            [ 4] 1081 	ld	l, c
   7CC6 60            [ 4] 1082 	ld	h, b
   7CC7 11 13 00      [10] 1083 	ld	de, #0x0013
   7CCA 19            [11] 1084 	add	hl, de
   7CCB 5E            [ 7] 1085 	ld	e, (hl)
   7CCC 23            [ 6] 1086 	inc	hl
   7CCD 56            [ 7] 1087 	ld	d, (hl)
   7CCE DD 36 FE 89   [19] 1088 	ld	-2 (ix), #<(_G_mendo)
   7CD2 DD 36 FF 64   [19] 1089 	ld	-1 (ix), #>(_G_mendo)
   7CD6 7B            [ 4] 1090 	ld	a, e
   7CD7 DD 96 FE      [19] 1091 	sub	a, -2 (ix)
   7CDA 20 0E         [12] 1092 	jr	NZ,00102$
   7CDC 7A            [ 4] 1093 	ld	a, d
   7CDD DD 96 FF      [19] 1094 	sub	a, -1 (ix)
   7CE0 20 08         [12] 1095 	jr	NZ,00102$
                           1096 ;src/funciones.c:249: pen = 2;
   7CE2 DD 36 E9 02   [19] 1097 	ld	-23 (ix), #0x02
                           1098 ;src/funciones.c:250: bg = 0;
   7CE6 DD 36 E8 00   [19] 1099 	ld	-24 (ix), #0x00
   7CEA                    1100 00102$:
                           1101 ;src/funciones.c:253: sprintf(temp, "%-9s GOES <",a->name);
   7CEA 59            [ 4] 1102 	ld	e, c
   7CEB 50            [ 4] 1103 	ld	d, b
   7CEC 13            [ 6] 1104 	inc	de
   7CED 21 02 00      [10] 1105 	ld	hl, #0x0002
   7CF0 39            [11] 1106 	add	hl, sp
   7CF1 E5            [11] 1107 	push	hl
   7CF2 FD E1         [14] 1108 	pop	iy
   7CF4 E5            [11] 1109 	push	hl
   7CF5 C5            [11] 1110 	push	bc
   7CF6 D5            [11] 1111 	push	de
   7CF7 11 2B 7D      [10] 1112 	ld	de, #___str_6
   7CFA D5            [11] 1113 	push	de
   7CFB FD E5         [15] 1114 	push	iy
   7CFD CD FB 93      [17] 1115 	call	_sprintf
   7D00 21 06 00      [10] 1116 	ld	hl, #6
   7D03 39            [11] 1117 	add	hl, sp
   7D04 F9            [ 6] 1118 	ld	sp, hl
   7D05 C1            [10] 1119 	pop	bc
   7D06 E1            [10] 1120 	pop	hl
                           1121 ;src/funciones.c:254: printConsole(temp, pen, bg);
   7D07 EB            [ 4] 1122 	ex	de,hl
   7D08 C5            [11] 1123 	push	bc
   7D09 DD 66 E8      [19] 1124 	ld	h, -24 (ix)
   7D0C DD 6E E9      [19] 1125 	ld	l, -23 (ix)
   7D0F E5            [11] 1126 	push	hl
   7D10 D5            [11] 1127 	push	de
   7D11 CD C5 79      [17] 1128 	call	_printConsole
   7D14 F1            [10] 1129 	pop	af
   7D15 F1            [10] 1130 	pop	af
   7D16 C1            [10] 1131 	pop	bc
                           1132 ;src/funciones.c:256: comprobarPosicion(a,a->pos_x - 4);
   7D17 C5            [11] 1133 	push	bc
   7D18 FD E1         [14] 1134 	pop	iy
   7D1A FD 7E 10      [19] 1135 	ld	a, 16 (iy)
   7D1D C6 FC         [ 7] 1136 	add	a, #0xfc
   7D1F 57            [ 4] 1137 	ld	d, a
   7D20 D5            [11] 1138 	push	de
   7D21 33            [ 6] 1139 	inc	sp
   7D22 C5            [11] 1140 	push	bc
   7D23 CD FB 7B      [17] 1141 	call	_comprobarPosicion
   7D26 DD F9         [10] 1142 	ld	sp,ix
   7D28 DD E1         [14] 1143 	pop	ix
   7D2A C9            [10] 1144 	ret
   7D2B                    1145 ___str_6:
   7D2B 25 2D 39 73 20 47  1146 	.ascii "%-9s GOES <"
        4F 45 53 20 3C
   7D36 00                 1147 	.db 0x00
                           1148 ;src/funciones.c:259: void moverDcha(TStats *a) {
                           1149 ;	---------------------------------
                           1150 ; Function moverDcha
                           1151 ; ---------------------------------
   7D37                    1152 _moverDcha::
   7D37 DD E5         [15] 1153 	push	ix
   7D39 DD 21 00 00   [14] 1154 	ld	ix,#0
   7D3D DD 39         [15] 1155 	add	ix,sp
   7D3F 21 E8 FF      [10] 1156 	ld	hl, #-24
   7D42 39            [11] 1157 	add	hl, sp
   7D43 F9            [ 6] 1158 	ld	sp, hl
                           1159 ;src/funciones.c:262: pen = 0;
   7D44 DD 36 E9 00   [19] 1160 	ld	-23 (ix), #0x00
                           1161 ;src/funciones.c:263: bg = 2;
   7D48 DD 36 E8 02   [19] 1162 	ld	-24 (ix), #0x02
                           1163 ;src/funciones.c:264: if ((u16) a->sprite == (u16) G_mendo)  {
   7D4C DD 4E 04      [19] 1164 	ld	c,4 (ix)
   7D4F DD 46 05      [19] 1165 	ld	b,5 (ix)
   7D52 69            [ 4] 1166 	ld	l, c
   7D53 60            [ 4] 1167 	ld	h, b
   7D54 11 13 00      [10] 1168 	ld	de, #0x0013
   7D57 19            [11] 1169 	add	hl, de
   7D58 5E            [ 7] 1170 	ld	e, (hl)
   7D59 23            [ 6] 1171 	inc	hl
   7D5A 56            [ 7] 1172 	ld	d, (hl)
   7D5B DD 36 FE 89   [19] 1173 	ld	-2 (ix), #<(_G_mendo)
   7D5F DD 36 FF 64   [19] 1174 	ld	-1 (ix), #>(_G_mendo)
   7D63 7B            [ 4] 1175 	ld	a, e
   7D64 DD 96 FE      [19] 1176 	sub	a, -2 (ix)
   7D67 20 0E         [12] 1177 	jr	NZ,00102$
   7D69 7A            [ 4] 1178 	ld	a, d
   7D6A DD 96 FF      [19] 1179 	sub	a, -1 (ix)
   7D6D 20 08         [12] 1180 	jr	NZ,00102$
                           1181 ;src/funciones.c:265: pen = 2;
   7D6F DD 36 E9 02   [19] 1182 	ld	-23 (ix), #0x02
                           1183 ;src/funciones.c:266: bg = 0;
   7D73 DD 36 E8 00   [19] 1184 	ld	-24 (ix), #0x00
   7D77                    1185 00102$:
                           1186 ;src/funciones.c:269: sprintf(temp, "%-9s GOES >",a->name);
   7D77 59            [ 4] 1187 	ld	e, c
   7D78 50            [ 4] 1188 	ld	d, b
   7D79 13            [ 6] 1189 	inc	de
   7D7A 21 02 00      [10] 1190 	ld	hl, #0x0002
   7D7D 39            [11] 1191 	add	hl, sp
   7D7E E5            [11] 1192 	push	hl
   7D7F FD E1         [14] 1193 	pop	iy
   7D81 E5            [11] 1194 	push	hl
   7D82 C5            [11] 1195 	push	bc
   7D83 D5            [11] 1196 	push	de
   7D84 11 B7 7D      [10] 1197 	ld	de, #___str_7
   7D87 D5            [11] 1198 	push	de
   7D88 FD E5         [15] 1199 	push	iy
   7D8A CD FB 93      [17] 1200 	call	_sprintf
   7D8D 21 06 00      [10] 1201 	ld	hl, #6
   7D90 39            [11] 1202 	add	hl, sp
   7D91 F9            [ 6] 1203 	ld	sp, hl
   7D92 C1            [10] 1204 	pop	bc
   7D93 E1            [10] 1205 	pop	hl
                           1206 ;src/funciones.c:270: printConsole(temp, pen, bg);
   7D94 EB            [ 4] 1207 	ex	de,hl
   7D95 C5            [11] 1208 	push	bc
   7D96 DD 66 E8      [19] 1209 	ld	h, -24 (ix)
   7D99 DD 6E E9      [19] 1210 	ld	l, -23 (ix)
   7D9C E5            [11] 1211 	push	hl
   7D9D D5            [11] 1212 	push	de
   7D9E CD C5 79      [17] 1213 	call	_printConsole
   7DA1 F1            [10] 1214 	pop	af
   7DA2 F1            [10] 1215 	pop	af
   7DA3 C1            [10] 1216 	pop	bc
                           1217 ;src/funciones.c:272: comprobarPosicion(a,a->pos_x + 4);
   7DA4 C5            [11] 1218 	push	bc
   7DA5 FD E1         [14] 1219 	pop	iy
   7DA7 FD 7E 10      [19] 1220 	ld	a, 16 (iy)
   7DAA C6 04         [ 7] 1221 	add	a, #0x04
   7DAC F5            [11] 1222 	push	af
   7DAD 33            [ 6] 1223 	inc	sp
   7DAE C5            [11] 1224 	push	bc
   7DAF CD FB 7B      [17] 1225 	call	_comprobarPosicion
   7DB2 DD F9         [10] 1226 	ld	sp,ix
   7DB4 DD E1         [14] 1227 	pop	ix
   7DB6 C9            [10] 1228 	ret
   7DB7                    1229 ___str_7:
   7DB7 25 2D 39 73 20 47  1230 	.ascii "%-9s GOES >"
        4F 45 53 20 3E
   7DC2 00                 1231 	.db 0x00
                           1232 ;src/funciones.c:275: void defender(TStats *a) {
                           1233 ;	---------------------------------
                           1234 ; Function defender
                           1235 ; ---------------------------------
   7DC3                    1236 _defender::
   7DC3 DD E5         [15] 1237 	push	ix
   7DC5 DD 21 00 00   [14] 1238 	ld	ix,#0
   7DC9 DD 39         [15] 1239 	add	ix,sp
   7DCB 21 E4 FF      [10] 1240 	ld	hl, #-28
   7DCE 39            [11] 1241 	add	hl, sp
   7DCF F9            [ 6] 1242 	ld	sp, hl
                           1243 ;src/funciones.c:278: pen = 0;
   7DD0 DD 36 E6 00   [19] 1244 	ld	-26 (ix), #0x00
                           1245 ;src/funciones.c:279: bg = 2;
   7DD4 DD 36 E5 02   [19] 1246 	ld	-27 (ix), #0x02
                           1247 ;src/funciones.c:280: nota = 33;
   7DD8 DD 36 E4 21   [19] 1248 	ld	-28 (ix), #0x21
                           1249 ;src/funciones.c:281: if ((u16) a->sprite == (u16) G_mendo)  {
   7DDC DD 4E 04      [19] 1250 	ld	c,4 (ix)
   7DDF DD 46 05      [19] 1251 	ld	b,5 (ix)
   7DE2 69            [ 4] 1252 	ld	l, c
   7DE3 60            [ 4] 1253 	ld	h, b
   7DE4 11 13 00      [10] 1254 	ld	de, #0x0013
   7DE7 19            [11] 1255 	add	hl, de
   7DE8 5E            [ 7] 1256 	ld	e, (hl)
   7DE9 23            [ 6] 1257 	inc	hl
   7DEA 56            [ 7] 1258 	ld	d, (hl)
   7DEB DD 36 FE 89   [19] 1259 	ld	-2 (ix), #<(_G_mendo)
   7DEF DD 36 FF 64   [19] 1260 	ld	-1 (ix), #>(_G_mendo)
   7DF3 7B            [ 4] 1261 	ld	a, e
   7DF4 DD 96 FE      [19] 1262 	sub	a, -2 (ix)
   7DF7 20 12         [12] 1263 	jr	NZ,00102$
   7DF9 7A            [ 4] 1264 	ld	a, d
   7DFA DD 96 FF      [19] 1265 	sub	a, -1 (ix)
   7DFD 20 0C         [12] 1266 	jr	NZ,00102$
                           1267 ;src/funciones.c:282: pen = 2;
   7DFF DD 36 E6 02   [19] 1268 	ld	-26 (ix), #0x02
                           1269 ;src/funciones.c:283: bg = 0;
   7E03 DD 36 E5 00   [19] 1270 	ld	-27 (ix), #0x00
                           1271 ;src/funciones.c:284: nota = 23;
   7E07 DD 36 E4 17   [19] 1272 	ld	-28 (ix), #0x17
   7E0B                    1273 00102$:
                           1274 ;src/funciones.c:287: if (a->energy + a->defense < a->max_energy)
   7E0B FD 21 0B 00   [14] 1275 	ld	iy, #0x000b
   7E0F FD 09         [15] 1276 	add	iy, bc
   7E11 FD 7E 00      [19] 1277 	ld	a, 0 (iy)
   7E14 DD 77 FE      [19] 1278 	ld	-2 (ix), a
   7E17 5F            [ 4] 1279 	ld	e, a
   7E18 16 00         [ 7] 1280 	ld	d, #0x00
   7E1A 69            [ 4] 1281 	ld	l, c
   7E1B 60            [ 4] 1282 	ld	h, b
   7E1C C5            [11] 1283 	push	bc
   7E1D 01 0F 00      [10] 1284 	ld	bc, #0x000f
   7E20 09            [11] 1285 	add	hl, bc
   7E21 C1            [10] 1286 	pop	bc
   7E22 7E            [ 7] 1287 	ld	a, (hl)
   7E23 DD 77 FD      [19] 1288 	ld	-3 (ix), a
   7E26 6F            [ 4] 1289 	ld	l, a
   7E27 26 00         [ 7] 1290 	ld	h, #0x00
   7E29 19            [11] 1291 	add	hl,de
   7E2A DD 75 FB      [19] 1292 	ld	-5 (ix), l
   7E2D DD 74 FC      [19] 1293 	ld	-4 (ix), h
   7E30 69            [ 4] 1294 	ld	l, c
   7E31 60            [ 4] 1295 	ld	h, b
   7E32 11 0C 00      [10] 1296 	ld	de, #0x000c
   7E35 19            [11] 1297 	add	hl, de
   7E36 5E            [ 7] 1298 	ld	e, (hl)
   7E37 6B            [ 4] 1299 	ld	l, e
   7E38 16 00         [ 7] 1300 	ld	d, #0x00
   7E3A DD 7E FB      [19] 1301 	ld	a, -5 (ix)
   7E3D 95            [ 4] 1302 	sub	a, l
   7E3E DD 7E FC      [19] 1303 	ld	a, -4 (ix)
   7E41 9A            [ 4] 1304 	sbc	a, d
   7E42 E2 47 7E      [10] 1305 	jp	PO, 00124$
   7E45 EE 80         [ 7] 1306 	xor	a, #0x80
   7E47                    1307 00124$:
   7E47 F2 4F 7E      [10] 1308 	jp	P, 00104$
                           1309 ;src/funciones.c:288: healed = a->defense;
   7E4A DD 5E FD      [19] 1310 	ld	e, -3 (ix)
   7E4D 18 05         [12] 1311 	jr	00105$
   7E4F                    1312 00104$:
                           1313 ;src/funciones.c:290: healed = a->max_energy - a->energy;
   7E4F 7B            [ 4] 1314 	ld	a, e
   7E50 DD 96 FE      [19] 1315 	sub	a, -2 (ix)
   7E53 5F            [ 4] 1316 	ld	e, a
   7E54                    1317 00105$:
                           1318 ;src/funciones.c:292: a->energy = a->energy + healed;
   7E54 DD 7E FE      [19] 1319 	ld	a, -2 (ix)
   7E57 83            [ 4] 1320 	add	a, e
   7E58 FD 77 00      [19] 1321 	ld	0 (iy), a
                           1322 ;src/funciones.c:294: if (healed) {
   7E5B 7B            [ 4] 1323 	ld	a, e
   7E5C B7            [ 4] 1324 	or	a, a
   7E5D 28 44         [12] 1325 	jr	Z,00108$
                           1326 ;src/funciones.c:295: sprintf(temp, "%-9s ^ %02dHP",a->name, healed);
   7E5F 16 00         [ 7] 1327 	ld	d, #0x00
   7E61 03            [ 6] 1328 	inc	bc
   7E62 21 03 00      [10] 1329 	ld	hl, #0x0003
   7E65 39            [11] 1330 	add	hl, sp
   7E66 DD 75 FB      [19] 1331 	ld	-5 (ix), l
   7E69 DD 74 FC      [19] 1332 	ld	-4 (ix), h
   7E6C E5            [11] 1333 	push	hl
   7E6D D5            [11] 1334 	push	de
   7E6E C5            [11] 1335 	push	bc
   7E6F 01 A8 7E      [10] 1336 	ld	bc, #___str_8
   7E72 C5            [11] 1337 	push	bc
   7E73 DD 4E FB      [19] 1338 	ld	c,-5 (ix)
   7E76 DD 46 FC      [19] 1339 	ld	b,-4 (ix)
   7E79 C5            [11] 1340 	push	bc
   7E7A CD FB 93      [17] 1341 	call	_sprintf
   7E7D 21 08 00      [10] 1342 	ld	hl, #8
   7E80 39            [11] 1343 	add	hl, sp
   7E81 F9            [ 6] 1344 	ld	sp, hl
   7E82 E1            [10] 1345 	pop	hl
                           1346 ;src/funciones.c:296: printConsole(temp, pen, bg);
   7E83 4D            [ 4] 1347 	ld	c, l
   7E84 44            [ 4] 1348 	ld	b, h
   7E85 DD 66 E5      [19] 1349 	ld	h, -27 (ix)
   7E88 DD 6E E6      [19] 1350 	ld	l, -26 (ix)
   7E8B E5            [11] 1351 	push	hl
   7E8C C5            [11] 1352 	push	bc
   7E8D CD C5 79      [17] 1353 	call	_printConsole
   7E90 F1            [10] 1354 	pop	af
   7E91 F1            [10] 1355 	pop	af
                           1356 ;src/funciones.c:297: playFX (2, nota);
   7E92 DD 56 E4      [19] 1357 	ld	d, -28 (ix)
   7E95 1E 02         [ 7] 1358 	ld	e,#0x02
   7E97 D5            [11] 1359 	push	de
   7E98 CD 8F 59      [17] 1360 	call	_playFX
                           1361 ;src/funciones.c:298: pausa(SEGUNDO/2);
   7E9B 21 00 40      [10] 1362 	ld	hl, #0x4000
   7E9E E3            [19] 1363 	ex	(sp),hl
   7E9F CD 71 76      [17] 1364 	call	_pausa
   7EA2 F1            [10] 1365 	pop	af
   7EA3                    1366 00108$:
   7EA3 DD F9         [10] 1367 	ld	sp, ix
   7EA5 DD E1         [14] 1368 	pop	ix
   7EA7 C9            [10] 1369 	ret
   7EA8                    1370 ___str_8:
   7EA8 25 2D 39 73 20 5E  1371 	.ascii "%-9s ^ %02dHP"
        20 25 30 32 64 48
        50
   7EB5 00                 1372 	.db 0x00
                           1373 ;src/funciones.c:302: void IA(TStats *a) {
                           1374 ;	---------------------------------
                           1375 ; Function IA
                           1376 ; ---------------------------------
   7EB6                    1377 _IA::
   7EB6 DD E5         [15] 1378 	push	ix
   7EB8 DD 21 00 00   [14] 1379 	ld	ix,#0
   7EBC DD 39         [15] 1380 	add	ix,sp
   7EBE 21 F8 FF      [10] 1381 	ld	hl, #-8
   7EC1 39            [11] 1382 	add	hl, sp
   7EC2 F9            [ 6] 1383 	ld	sp, hl
                           1384 ;src/funciones.c:304: if ((u16) a->sprite == (u16) G_goblin) {
   7EC3 DD 7E 04      [19] 1385 	ld	a, 4 (ix)
   7EC6 DD 77 FE      [19] 1386 	ld	-2 (ix), a
   7EC9 DD 7E 05      [19] 1387 	ld	a, 5 (ix)
   7ECC DD 77 FF      [19] 1388 	ld	-1 (ix), a
   7ECF DD 7E FE      [19] 1389 	ld	a, -2 (ix)
   7ED2 C6 13         [ 7] 1390 	add	a, #0x13
   7ED4 DD 77 FC      [19] 1391 	ld	-4 (ix), a
   7ED7 DD 7E FF      [19] 1392 	ld	a, -1 (ix)
   7EDA CE 00         [ 7] 1393 	adc	a, #0x00
   7EDC DD 77 FD      [19] 1394 	ld	-3 (ix), a
   7EDF DD 6E FC      [19] 1395 	ld	l,-4 (ix)
   7EE2 DD 66 FD      [19] 1396 	ld	h,-3 (ix)
   7EE5 4E            [ 7] 1397 	ld	c, (hl)
   7EE6 23            [ 6] 1398 	inc	hl
   7EE7 46            [ 7] 1399 	ld	b, (hl)
   7EE8 11 69 6E      [10] 1400 	ld	de, #_G_goblin+0
   7EEB 79            [ 4] 1401 	ld	a, c
   7EEC 93            [ 4] 1402 	sub	a, e
   7EED 20 16         [12] 1403 	jr	NZ,00104$
   7EEF 78            [ 4] 1404 	ld	a, b
   7EF0 92            [ 4] 1405 	sub	a, d
   7EF1 20 12         [12] 1406 	jr	NZ,00104$
                           1407 ;src/funciones.c:305: if (cpct_rand() % 2)
   7EF3 CD 31 93      [17] 1408 	call	_cpct_getRandom_mxor_u8
   7EF6 CB 45         [ 8] 1409 	bit	0, l
   7EF8 28 0B         [12] 1410 	jr	Z,00104$
                           1411 ;src/funciones.c:306: moverIzq(a);
   7EFA DD 6E FE      [19] 1412 	ld	l,-2 (ix)
   7EFD DD 66 FF      [19] 1413 	ld	h,-1 (ix)
   7F00 E5            [11] 1414 	push	hl
   7F01 CD AA 7C      [17] 1415 	call	_moverIzq
   7F04 F1            [10] 1416 	pop	af
   7F05                    1417 00104$:
                           1418 ;src/funciones.c:304: if ((u16) a->sprite == (u16) G_goblin) {
   7F05 DD 6E FC      [19] 1419 	ld	l,-4 (ix)
   7F08 DD 66 FD      [19] 1420 	ld	h,-3 (ix)
   7F0B 7E            [ 7] 1421 	ld	a, (hl)
   7F0C DD 77 FA      [19] 1422 	ld	-6 (ix), a
   7F0F 23            [ 6] 1423 	inc	hl
   7F10 7E            [ 7] 1424 	ld	a, (hl)
   7F11 DD 77 FB      [19] 1425 	ld	-5 (ix), a
                           1426 ;src/funciones.c:309: if ( ((u16) a->sprite == (u16) G_arabe_1)
   7F14 D1            [10] 1427 	pop	de
   7F15 C1            [10] 1428 	pop	bc
   7F16 C5            [11] 1429 	push	bc
   7F17 D5            [11] 1430 	push	de
   7F18 11 69 65      [10] 1431 	ld	de, #_G_arabe_1+0
                           1432 ;src/funciones.c:319: if (abs(a->pos_x - entidad[0].pos_x) <= 8)  {
   7F1B DD 7E FE      [19] 1433 	ld	a, -2 (ix)
   7F1E C6 10         [ 7] 1434 	add	a, #0x10
   7F20 DD 77 F8      [19] 1435 	ld	-8 (ix), a
   7F23 DD 7E FF      [19] 1436 	ld	a, -1 (ix)
   7F26 CE 00         [ 7] 1437 	adc	a, #0x00
   7F28 DD 77 F9      [19] 1438 	ld	-7 (ix), a
                           1439 ;src/funciones.c:309: if ( ((u16) a->sprite == (u16) G_arabe_1)
   7F2B 79            [ 4] 1440 	ld	a, c
   7F2C 93            [ 4] 1441 	sub	a, e
   7F2D 20 04         [12] 1442 	jr	NZ,00231$
   7F2F 78            [ 4] 1443 	ld	a, b
   7F30 92            [ 4] 1444 	sub	a, d
   7F31 28 56         [12] 1445 	jr	Z,00114$
   7F33                    1446 00231$:
                           1447 ;src/funciones.c:310: || ((u16) a->sprite == (u16) G_arabe_2)
   7F33 11 49 66      [10] 1448 	ld	de, #_G_arabe_2+0
   7F36 79            [ 4] 1449 	ld	a, c
   7F37 93            [ 4] 1450 	sub	a, e
   7F38 20 04         [12] 1451 	jr	NZ,00232$
   7F3A 78            [ 4] 1452 	ld	a, b
   7F3B 92            [ 4] 1453 	sub	a, d
   7F3C 28 4B         [12] 1454 	jr	Z,00114$
   7F3E                    1455 00232$:
                           1456 ;src/funciones.c:311: || ((u16) a->sprite == (u16) G_esqueleto)
   7F3E D1            [10] 1457 	pop	de
   7F3F C1            [10] 1458 	pop	bc
   7F40 C5            [11] 1459 	push	bc
   7F41 D5            [11] 1460 	push	de
   7F42 11 C9 6B      [10] 1461 	ld	de, #_G_esqueleto+0
   7F45 7B            [ 4] 1462 	ld	a, e
   7F46 91            [ 4] 1463 	sub	a, c
   7F47 20 04         [12] 1464 	jr	NZ,00233$
   7F49 7A            [ 4] 1465 	ld	a, d
   7F4A 90            [ 4] 1466 	sub	a, b
   7F4B 28 3C         [12] 1467 	jr	Z,00114$
   7F4D                    1468 00233$:
                           1469 ;src/funciones.c:312: || ((u16) a->sprite == (u16) G_spider)
   7F4D D1            [10] 1470 	pop	de
   7F4E C1            [10] 1471 	pop	bc
   7F4F C5            [11] 1472 	push	bc
   7F50 D5            [11] 1473 	push	de
   7F51 11 89 6D      [10] 1474 	ld	de, #_G_spider+0
   7F54 79            [ 4] 1475 	ld	a, c
   7F55 93            [ 4] 1476 	sub	a, e
   7F56 20 04         [12] 1477 	jr	NZ,00234$
   7F58 78            [ 4] 1478 	ld	a, b
   7F59 92            [ 4] 1479 	sub	a, d
   7F5A 28 2D         [12] 1480 	jr	Z,00114$
   7F5C                    1481 00234$:
                           1482 ;src/funciones.c:313: || ((u16) a->sprite == (u16) G_soldado_1)
   7F5C D1            [10] 1483 	pop	de
   7F5D C1            [10] 1484 	pop	bc
   7F5E C5            [11] 1485 	push	bc
   7F5F D5            [11] 1486 	push	de
   7F60 11 29 70      [10] 1487 	ld	de, #_G_soldado_1+0
   7F63 79            [ 4] 1488 	ld	a, c
   7F64 93            [ 4] 1489 	sub	a, e
   7F65 20 04         [12] 1490 	jr	NZ,00235$
   7F67 78            [ 4] 1491 	ld	a, b
   7F68 92            [ 4] 1492 	sub	a, d
   7F69 28 1E         [12] 1493 	jr	Z,00114$
   7F6B                    1494 00235$:
                           1495 ;src/funciones.c:314: || ((u16) a->sprite == (u16) G_carcelero)
   7F6B D1            [10] 1496 	pop	de
   7F6C C1            [10] 1497 	pop	bc
   7F6D C5            [11] 1498 	push	bc
   7F6E D5            [11] 1499 	push	de
   7F6F 11 09 71      [10] 1500 	ld	de, #_G_carcelero+0
   7F72 79            [ 4] 1501 	ld	a, c
   7F73 93            [ 4] 1502 	sub	a, e
   7F74 20 04         [12] 1503 	jr	NZ,00236$
   7F76 78            [ 4] 1504 	ld	a, b
   7F77 92            [ 4] 1505 	sub	a, d
   7F78 28 0F         [12] 1506 	jr	Z,00114$
   7F7A                    1507 00236$:
                           1508 ;src/funciones.c:315: || ((u16) a->sprite == (u16) G_caballero)
   7F7A D1            [10] 1509 	pop	de
   7F7B C1            [10] 1510 	pop	bc
   7F7C C5            [11] 1511 	push	bc
   7F7D D5            [11] 1512 	push	de
   7F7E 11 E9 71      [10] 1513 	ld	de, #_G_caballero+0
   7F81 79            [ 4] 1514 	ld	a, c
   7F82 93            [ 4] 1515 	sub	a, e
   7F83 20 59         [12] 1516 	jr	NZ,00115$
   7F85 78            [ 4] 1517 	ld	a, b
   7F86 92            [ 4] 1518 	sub	a, d
   7F87 20 55         [12] 1519 	jr	NZ,00115$
   7F89                    1520 00114$:
                           1521 ;src/funciones.c:319: if (abs(a->pos_x - entidad[0].pos_x) <= 8)  {
   7F89 E1            [10] 1522 	pop	hl
   7F8A E5            [11] 1523 	push	hl
   7F8B 4E            [ 7] 1524 	ld	c, (hl)
   7F8C 21 31 A2      [10] 1525 	ld	hl, #_entidad+16
   7F8F 46            [ 7] 1526 	ld	b, (hl)
   7F90 79            [ 4] 1527 	ld	a, c
   7F91 90            [ 4] 1528 	sub	a, b
   7F92 47            [ 4] 1529 	ld	b, a
   7F93 C5            [11] 1530 	push	bc
   7F94 33            [ 6] 1531 	inc	sp
   7F95 CD 49 76      [17] 1532 	call	_abs
   7F98 33            [ 6] 1533 	inc	sp
   7F99 3E 08         [ 7] 1534 	ld	a, #0x08
   7F9B 95            [ 4] 1535 	sub	a, l
   7F9C 38 0D         [12] 1536 	jr	C,00112$
                           1537 ;src/funciones.c:320: moverIzq(a);
   7F9E DD 6E FE      [19] 1538 	ld	l,-2 (ix)
   7FA1 DD 66 FF      [19] 1539 	ld	h,-1 (ix)
   7FA4 E5            [11] 1540 	push	hl
   7FA5 CD AA 7C      [17] 1541 	call	_moverIzq
   7FA8 F1            [10] 1542 	pop	af
   7FA9 18 33         [12] 1543 	jr	00115$
   7FAB                    1544 00112$:
                           1545 ;src/funciones.c:323: if (cpct_rand() % 2)
   7FAB CD 31 93      [17] 1546 	call	_cpct_getRandom_mxor_u8
   7FAE CB 45         [ 8] 1547 	bit	0, l
   7FB0 28 0D         [12] 1548 	jr	Z,00109$
                           1549 ;src/funciones.c:324: defender(a);
   7FB2 DD 6E FE      [19] 1550 	ld	l,-2 (ix)
   7FB5 DD 66 FF      [19] 1551 	ld	h,-1 (ix)
   7FB8 E5            [11] 1552 	push	hl
   7FB9 CD C3 7D      [17] 1553 	call	_defender
   7FBC F1            [10] 1554 	pop	af
   7FBD 18 1F         [12] 1555 	jr	00115$
   7FBF                    1556 00109$:
                           1557 ;src/funciones.c:326: if (cpct_rand() % 2)
   7FBF CD 31 93      [17] 1558 	call	_cpct_getRandom_mxor_u8
   7FC2 CB 45         [ 8] 1559 	bit	0, l
   7FC4 28 0D         [12] 1560 	jr	Z,00106$
                           1561 ;src/funciones.c:327: moverIzq(a);
   7FC6 DD 6E FE      [19] 1562 	ld	l,-2 (ix)
   7FC9 DD 66 FF      [19] 1563 	ld	h,-1 (ix)
   7FCC E5            [11] 1564 	push	hl
   7FCD CD AA 7C      [17] 1565 	call	_moverIzq
   7FD0 F1            [10] 1566 	pop	af
   7FD1 18 0B         [12] 1567 	jr	00115$
   7FD3                    1568 00106$:
                           1569 ;src/funciones.c:329: moverDcha(a);
   7FD3 DD 6E FE      [19] 1570 	ld	l,-2 (ix)
   7FD6 DD 66 FF      [19] 1571 	ld	h,-1 (ix)
   7FD9 E5            [11] 1572 	push	hl
   7FDA CD 37 7D      [17] 1573 	call	_moverDcha
   7FDD F1            [10] 1574 	pop	af
   7FDE                    1575 00115$:
                           1576 ;src/funciones.c:333: if ((u16) a->sprite == (u16) G_abeja 
   7FDE DD 6E FC      [19] 1577 	ld	l,-4 (ix)
   7FE1 DD 66 FD      [19] 1578 	ld	h,-3 (ix)
   7FE4 4E            [ 7] 1579 	ld	c, (hl)
   7FE5 23            [ 6] 1580 	inc	hl
   7FE6 46            [ 7] 1581 	ld	b, (hl)
   7FE7 DD 71 FA      [19] 1582 	ld	-6 (ix), c
   7FEA DD 70 FB      [19] 1583 	ld	-5 (ix), b
                           1584 ;src/funciones.c:334: || (u16) a->sprite == (u16) G_murcielago
   7FED 11 C9 69      [10] 1585 	ld	de, #_G_abeja+0
   7FF0 DD 7E FA      [19] 1586 	ld	a, -6 (ix)
   7FF3 93            [ 4] 1587 	sub	a, e
   7FF4 20 06         [12] 1588 	jr	NZ,00241$
   7FF6 DD 7E FB      [19] 1589 	ld	a, -5 (ix)
   7FF9 92            [ 4] 1590 	sub	a, d
   7FFA 28 1D         [12] 1591 	jr	Z,00125$
   7FFC                    1592 00241$:
                           1593 ;src/funciones.c:335: || nivel == 10
   7FFC 11 E9 6A      [10] 1594 	ld	de, #_G_murcielago+0
   7FFF 79            [ 4] 1595 	ld	a, c
   8000 93            [ 4] 1596 	sub	a, e
   8001 20 04         [12] 1597 	jr	NZ,00242$
   8003 78            [ 4] 1598 	ld	a, b
   8004 92            [ 4] 1599 	sub	a, d
   8005 28 12         [12] 1600 	jr	Z,00125$
   8007                    1601 00242$:
                           1602 ;src/funciones.c:336: || nivel == 20
   8007 FD 21 60 A2   [14] 1603 	ld	iy, #_nivel
   800B FD 7E 00      [19] 1604 	ld	a, 0 (iy)
   800E D6 0A         [ 7] 1605 	sub	a, #0x0a
   8010 28 07         [12] 1606 	jr	Z,00125$
                           1607 ;src/funciones.c:337: )  {  
   8012 FD 7E 00      [19] 1608 	ld	a, 0 (iy)
   8015 D6 14         [ 7] 1609 	sub	a, #0x14
   8017 20 1F         [12] 1610 	jr	NZ,00126$
   8019                    1611 00125$:
                           1612 ;src/funciones.c:339: if (cpct_rand() % 2)
   8019 CD 31 93      [17] 1613 	call	_cpct_getRandom_mxor_u8
   801C CB 45         [ 8] 1614 	bit	0, l
   801E 28 0D         [12] 1615 	jr	Z,00123$
                           1616 ;src/funciones.c:340: defender(a);
   8020 DD 6E FE      [19] 1617 	ld	l,-2 (ix)
   8023 DD 66 FF      [19] 1618 	ld	h,-1 (ix)
   8026 E5            [11] 1619 	push	hl
   8027 CD C3 7D      [17] 1620 	call	_defender
   802A F1            [10] 1621 	pop	af
   802B 18 0B         [12] 1622 	jr	00126$
   802D                    1623 00123$:
                           1624 ;src/funciones.c:342: moverIzq(a);
   802D DD 6E FE      [19] 1625 	ld	l,-2 (ix)
   8030 DD 66 FF      [19] 1626 	ld	h,-1 (ix)
   8033 E5            [11] 1627 	push	hl
   8034 CD AA 7C      [17] 1628 	call	_moverIzq
   8037 F1            [10] 1629 	pop	af
   8038                    1630 00126$:
                           1631 ;src/funciones.c:304: if ((u16) a->sprite == (u16) G_goblin) {
   8038 DD 6E FC      [19] 1632 	ld	l,-4 (ix)
   803B DD 66 FD      [19] 1633 	ld	h,-3 (ix)
   803E 4E            [ 7] 1634 	ld	c, (hl)
   803F 23            [ 6] 1635 	inc	hl
   8040 46            [ 7] 1636 	ld	b, (hl)
                           1637 ;src/funciones.c:309: if ( ((u16) a->sprite == (u16) G_arabe_1)
   8041 DD 71 FA      [19] 1638 	ld	-6 (ix), c
   8044 DD 70 FB      [19] 1639 	ld	-5 (ix), b
                           1640 ;src/funciones.c:344: if (((u16) a->sprite == (u16) G_fakir)
   8047 11 09 68      [10] 1641 	ld	de, #_G_fakir+0
   804A DD 7E FA      [19] 1642 	ld	a, -6 (ix)
   804D 93            [ 4] 1643 	sub	a, e
   804E 20 06         [12] 1644 	jr	NZ,00247$
   8050 DD 7E FB      [19] 1645 	ld	a, -5 (ix)
   8053 92            [ 4] 1646 	sub	a, d
   8054 28 1A         [12] 1647 	jr	Z,00132$
   8056                    1648 00247$:
                           1649 ;src/funciones.c:345: || ((u16) a->sprite == (u16) G_gusano)
   8056 11 A9 6C      [10] 1650 	ld	de, #_G_gusano+0
   8059 DD 7E FA      [19] 1651 	ld	a, -6 (ix)
   805C 93            [ 4] 1652 	sub	a, e
   805D 20 06         [12] 1653 	jr	NZ,00248$
   805F DD 7E FB      [19] 1654 	ld	a, -5 (ix)
   8062 92            [ 4] 1655 	sub	a, d
   8063 28 0B         [12] 1656 	jr	Z,00132$
   8065                    1657 00248$:
                           1658 ;src/funciones.c:346: || ((u16) a->sprite == (u16) G_soldado_2)
   8065 11 C9 72      [10] 1659 	ld	de, #_G_soldado_2+0
   8068 7B            [ 4] 1660 	ld	a, e
   8069 91            [ 4] 1661 	sub	a, c
   806A 20 24         [12] 1662 	jr	NZ,00133$
   806C 7A            [ 4] 1663 	ld	a, d
   806D 90            [ 4] 1664 	sub	a, b
   806E 20 20         [12] 1665 	jr	NZ,00133$
   8070                    1666 00132$:
                           1667 ;src/funciones.c:349: if (abs(a->pos_x - entidad[0].pos_x) <= 4) 
   8070 E1            [10] 1668 	pop	hl
   8071 E5            [11] 1669 	push	hl
   8072 4E            [ 7] 1670 	ld	c, (hl)
   8073 21 31 A2      [10] 1671 	ld	hl, #_entidad+16
   8076 46            [ 7] 1672 	ld	b, (hl)
   8077 79            [ 4] 1673 	ld	a, c
   8078 90            [ 4] 1674 	sub	a, b
   8079 47            [ 4] 1675 	ld	b, a
   807A C5            [11] 1676 	push	bc
   807B 33            [ 6] 1677 	inc	sp
   807C CD 49 76      [17] 1678 	call	_abs
   807F 33            [ 6] 1679 	inc	sp
   8080 3E 04         [ 7] 1680 	ld	a, #0x04
   8082 95            [ 4] 1681 	sub	a, l
   8083 38 0B         [12] 1682 	jr	C,00133$
                           1683 ;src/funciones.c:350: moverIzq(a);
   8085 DD 6E FE      [19] 1684 	ld	l,-2 (ix)
   8088 DD 66 FF      [19] 1685 	ld	h,-1 (ix)
   808B E5            [11] 1686 	push	hl
   808C CD AA 7C      [17] 1687 	call	_moverIzq
   808F F1            [10] 1688 	pop	af
   8090                    1689 00133$:
                           1690 ;src/funciones.c:352: if ((u16) a->sprite == (u16) G_arabe_3)  {  
   8090 DD 6E FC      [19] 1691 	ld	l,-4 (ix)
   8093 DD 66 FD      [19] 1692 	ld	h,-3 (ix)
   8096 4E            [ 7] 1693 	ld	c, (hl)
   8097 23            [ 6] 1694 	inc	hl
   8098 46            [ 7] 1695 	ld	b, (hl)
   8099 11 29 67      [10] 1696 	ld	de, #_G_arabe_3+0
   809C 79            [ 4] 1697 	ld	a, c
   809D 93            [ 4] 1698 	sub	a, e
   809E 20 29         [12] 1699 	jr	NZ,00139$
   80A0 78            [ 4] 1700 	ld	a, b
   80A1 92            [ 4] 1701 	sub	a, d
   80A2 20 25         [12] 1702 	jr	NZ,00139$
                           1703 ;src/funciones.c:355: if (abs(a->pos_x - entidad[0].pos_x) <= 16) 
   80A4 E1            [10] 1704 	pop	hl
   80A5 E5            [11] 1705 	push	hl
   80A6 4E            [ 7] 1706 	ld	c, (hl)
   80A7 21 31 A2      [10] 1707 	ld	hl, #_entidad + 16
   80AA 46            [ 7] 1708 	ld	b, (hl)
   80AB 79            [ 4] 1709 	ld	a, c
   80AC 90            [ 4] 1710 	sub	a, b
   80AD 47            [ 4] 1711 	ld	b, a
   80AE C5            [11] 1712 	push	bc
   80AF 33            [ 6] 1713 	inc	sp
   80B0 CD 49 76      [17] 1714 	call	_abs
   80B3 33            [ 6] 1715 	inc	sp
   80B4 3E 10         [ 7] 1716 	ld	a, #0x10
   80B6 95            [ 4] 1717 	sub	a, l
   80B7 38 10         [12] 1718 	jr	C,00139$
                           1719 ;src/funciones.c:356: atacar(a,&entidad[0]);
   80B9 21 21 A2      [10] 1720 	ld	hl, #_entidad
   80BC E5            [11] 1721 	push	hl
   80BD DD 6E FE      [19] 1722 	ld	l,-2 (ix)
   80C0 DD 66 FF      [19] 1723 	ld	h,-1 (ix)
   80C3 E5            [11] 1724 	push	hl
   80C4 CD 2A 7A      [17] 1725 	call	_atacar
   80C7 F1            [10] 1726 	pop	af
   80C8 F1            [10] 1727 	pop	af
   80C9                    1728 00139$:
                           1729 ;src/funciones.c:358: if ((u16) a->sprite == (u16) G_mago)  {  
   80C9 DD 6E FC      [19] 1730 	ld	l,-4 (ix)
   80CC DD 66 FD      [19] 1731 	ld	h,-3 (ix)
   80CF 4E            [ 7] 1732 	ld	c, (hl)
   80D0 23            [ 6] 1733 	inc	hl
   80D1 46            [ 7] 1734 	ld	b, (hl)
   80D2 11 A9 73      [10] 1735 	ld	de, #_G_mago+0
   80D5 79            [ 4] 1736 	ld	a, c
   80D6 93            [ 4] 1737 	sub	a, e
   80D7 20 14         [12] 1738 	jr	NZ,00142$
   80D9 78            [ 4] 1739 	ld	a, b
   80DA 92            [ 4] 1740 	sub	a, d
   80DB 20 10         [12] 1741 	jr	NZ,00142$
                           1742 ;src/funciones.c:360: atacar(a,&entidad[0]);
   80DD 21 21 A2      [10] 1743 	ld	hl, #_entidad
   80E0 E5            [11] 1744 	push	hl
   80E1 DD 6E 04      [19] 1745 	ld	l,4 (ix)
   80E4 DD 66 05      [19] 1746 	ld	h,5 (ix)
   80E7 E5            [11] 1747 	push	hl
   80E8 CD 2A 7A      [17] 1748 	call	_atacar
   80EB F1            [10] 1749 	pop	af
   80EC F1            [10] 1750 	pop	af
   80ED                    1751 00142$:
   80ED DD F9         [10] 1752 	ld	sp, ix
   80EF DD E1         [14] 1753 	pop	ix
   80F1 C9            [10] 1754 	ret
                           1755 ;src/funciones.c:366: void drawPotion(){
                           1756 ;	---------------------------------
                           1757 ; Function drawPotion
                           1758 ; ---------------------------------
   80F2                    1759 _drawPotion::
                           1760 ;src/funciones.c:367: cpct_drawSpriteMasked (G_pocion, cpctm_screenPtr (CPCT_VMEM_START, 28, 144), 2,16);
   80F2 21 02 10      [10] 1761 	ld	hl, #0x1002
   80F5 E5            [11] 1762 	push	hl
   80F6 21 BC C5      [10] 1763 	ld	hl, #0xc5bc
   80F9 E5            [11] 1764 	push	hl
   80FA 21 A9 6A      [10] 1765 	ld	hl, #_G_pocion
   80FD E5            [11] 1766 	push	hl
   80FE CD 77 93      [17] 1767 	call	_cpct_drawSpriteMasked
   8101 C9            [10] 1768 	ret
                           1769 	.area _CODE
                           1770 	.area _INITIALIZER
                           1771 	.area _CABS (ABS)
