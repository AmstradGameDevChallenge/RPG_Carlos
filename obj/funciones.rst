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
                             24 	.globl _sprintf
                             25 	.globl _cpct_etm_setTileset2x4
                             26 	.globl _cpct_etm_drawTileBox2x4
                             27 	.globl _cpct_getRandom_mxor_u8
                             28 	.globl _cpct_setCRTCReg
                             29 	.globl _cpct_getScreenPtr
                             30 	.globl _cpct_drawStringM1
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
                             69 ;src/funciones.c:18: u8 abs (i8 valor){
                             70 ;	---------------------------------
                             71 ; Function abs
                             72 ; ---------------------------------
   6DC2                      73 _abs::
                             74 ;src/funciones.c:19: return (valor > 0 ? valor : -valor);
   6DC2 AF            [ 4]   75 	xor	a, a
   6DC3 FD 21 02 00   [14]   76 	ld	iy, #2
   6DC7 FD 39         [15]   77 	add	iy, sp
   6DC9 FD 96 00      [19]   78 	sub	a, 0 (iy)
   6DCC E2 D1 6D      [10]   79 	jp	PO, 00109$
   6DCF EE 80         [ 7]   80 	xor	a, #0x80
   6DD1                      81 00109$:
   6DD1 F2 DE 6D      [10]   82 	jp	P, 00103$
   6DD4 FD 21 02 00   [14]   83 	ld	iy, #2
   6DD8 FD 39         [15]   84 	add	iy, sp
   6DDA FD 6E 00      [19]   85 	ld	l, 0 (iy)
   6DDD C9            [10]   86 	ret
   6DDE                      87 00103$:
   6DDE AF            [ 4]   88 	xor	a, a
   6DDF FD 21 02 00   [14]   89 	ld	iy, #2
   6DE3 FD 39         [15]   90 	add	iy, sp
   6DE5 FD 96 00      [19]   91 	sub	a, 0 (iy)
   6DE8 6F            [ 4]   92 	ld	l, a
   6DE9 C9            [10]   93 	ret
                             94 ;src/funciones.c:22: void pausa(u16 ciclos) {
                             95 ;	---------------------------------
                             96 ; Function pausa
                             97 ; ---------------------------------
   6DEA                      98 _pausa::
                             99 ;src/funciones.c:25: for (i = 0; i < ciclos; i++)
   6DEA 01 00 00      [10]  100 	ld	bc, #0x0000
   6DED                     101 00103$:
   6DED 21 02 00      [10]  102 	ld	hl, #2
   6DF0 39            [11]  103 	add	hl, sp
   6DF1 79            [ 4]  104 	ld	a, c
   6DF2 96            [ 7]  105 	sub	a, (hl)
   6DF3 78            [ 4]  106 	ld	a, b
   6DF4 23            [ 6]  107 	inc	hl
   6DF5 9E            [ 7]  108 	sbc	a, (hl)
   6DF6 D0            [11]  109 	ret	NC
   6DF7 03            [ 6]  110 	inc	bc
   6DF8 18 F3         [12]  111 	jr	00103$
                            112 ;src/funciones.c:29: void efecto_pliegue(u8 modo) {
                            113 ;	---------------------------------
                            114 ; Function efecto_pliegue
                            115 ; ---------------------------------
   6DFA                     116 _efecto_pliegue::
                            117 ;src/funciones.c:32: i = 200;
   6DFA 06 C8         [ 7]  118 	ld	b, #0xc8
                            119 ;src/funciones.c:33: if (modo)
   6DFC 21 02 00      [10]  120 	ld	hl, #2+0
   6DFF 39            [11]  121 	add	hl, sp
   6E00 7E            [ 7]  122 	ld	a, (hl)
   6E01 B7            [ 4]  123 	or	a, a
   6E02 28 02         [12]  124 	jr	Z,00108$
                            125 ;src/funciones.c:34: i = 1;
   6E04 06 01         [ 7]  126 	ld	b, #0x01
                            127 ;src/funciones.c:36: do {
   6E06                     128 00108$:
                            129 ;src/funciones.c:37: cpct_setCRTCReg (1, i/5);   //Cambiar nº columnas por pantalla (1-40)
   6E06 C5            [11]  130 	push	bc
   6E07 3E 05         [ 7]  131 	ld	a, #0x05
   6E09 F5            [11]  132 	push	af
   6E0A 33            [ 6]  133 	inc	sp
   6E0B C5            [11]  134 	push	bc
   6E0C 33            [ 6]  135 	inc	sp
   6E0D CD DC 78      [17]  136 	call	__divuchar
   6E10 F1            [10]  137 	pop	af
   6E11 55            [ 4]  138 	ld	d, l
   6E12 1E 01         [ 7]  139 	ld	e, #0x01
   6E14 D5            [11]  140 	push	de
   6E15 CD 95 7B      [17]  141 	call	_cpct_setCRTCReg
   6E18 C1            [10]  142 	pop	bc
                            143 ;src/funciones.c:38: cpct_setCRTCReg (6, i/8);   //Cambiar nº de filas por pantallas (1-25)
   6E19 50            [ 4]  144 	ld	d, b
   6E1A CB 3A         [ 8]  145 	srl	d
   6E1C CB 3A         [ 8]  146 	srl	d
   6E1E CB 3A         [ 8]  147 	srl	d
   6E20 C5            [11]  148 	push	bc
   6E21 1E 06         [ 7]  149 	ld	e, #0x06
   6E23 D5            [11]  150 	push	de
   6E24 CD 95 7B      [17]  151 	call	_cpct_setCRTCReg
   6E27 C1            [10]  152 	pop	bc
                            153 ;src/funciones.c:40: for (j = 0; j < 255; j++)
   6E28 0E FF         [ 7]  154 	ld	c, #0xff
   6E2A                     155 00113$:
   6E2A 59            [ 4]  156 	ld	e, c
   6E2B 1D            [ 4]  157 	dec	e
   6E2C 7B            [ 4]  158 	ld	a,e
   6E2D 4F            [ 4]  159 	ld	c,a
   6E2E B7            [ 4]  160 	or	a, a
   6E2F 20 F9         [12]  161 	jr	NZ,00113$
                            162 ;src/funciones.c:43: if (modo) {
   6E31 21 02 00      [10]  163 	ld	hl, #2+0
   6E34 39            [11]  164 	add	hl, sp
   6E35 7E            [ 7]  165 	ld	a, (hl)
   6E36 B7            [ 4]  166 	or	a, a
   6E37 28 03         [12]  167 	jr	Z,00105$
                            168 ;src/funciones.c:44: i++;
   6E39 04            [ 4]  169 	inc	b
   6E3A 18 01         [12]  170 	jr	00109$
   6E3C                     171 00105$:
                            172 ;src/funciones.c:46: i--; 
   6E3C 05            [ 4]  173 	dec	b
   6E3D                     174 00109$:
                            175 ;src/funciones.c:48: } while (i > 0 && i <= 200);
   6E3D 78            [ 4]  176 	ld	a, b
   6E3E B7            [ 4]  177 	or	a, a
   6E3F C8            [11]  178 	ret	Z
   6E40 3E C8         [ 7]  179 	ld	a, #0xc8
   6E42 90            [ 4]  180 	sub	a, b
   6E43 30 C1         [12]  181 	jr	NC,00108$
   6E45 C9            [10]  182 	ret
                            183 ;src/funciones.c:52: void pausaTecladoLibre(){
                            184 ;	---------------------------------
                            185 ; Function pausaTecladoLibre
                            186 ; ---------------------------------
   6E46                     187 _pausaTecladoLibre::
                            188 ;src/funciones.c:53: while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
   6E46                     189 00101$:
   6E46 CD 65 7A      [17]  190 	call	_cpct_isAnyKeyPressed_f
   6E49 7D            [ 4]  191 	ld	a, l
   6E4A B7            [ 4]  192 	or	a, a
   6E4B C8            [11]  193 	ret	Z
                            194 ;src/funciones.c:54: cpct_scanKeyboard_f();
   6E4C CD 8F 76      [17]  195 	call	_cpct_scanKeyboard_f
   6E4F 18 F5         [12]  196 	jr	00101$
                            197 ;src/funciones.c:58: void dibujarMarcoExterior (){
                            198 ;	---------------------------------
                            199 ; Function dibujarMarcoExterior
                            200 ; ---------------------------------
   6E51                     201 _dibujarMarcoExterior::
   6E51 DD E5         [15]  202 	push	ix
   6E53 DD 21 00 00   [14]  203 	ld	ix,#0
   6E57 DD 39         [15]  204 	add	ix,sp
   6E59 F5            [11]  205 	push	af
   6E5A F5            [11]  206 	push	af
                            207 ;src/funciones.c:63: tile = (u8*) &G_tile_cruzada[0];
   6E5B DD 36 FC 22   [19]  208 	ld	-4 (ix), #<(_G_tile_cruzada)
   6E5F DD 36 FD 67   [19]  209 	ld	-3 (ix), #>(_G_tile_cruzada)
                            210 ;src/funciones.c:64: if ((nivel/10) == 1)
   6E63 3E 0A         [ 7]  211 	ld	a, #0x0a
   6E65 F5            [11]  212 	push	af
   6E66 33            [ 6]  213 	inc	sp
   6E67 3A AC 87      [13]  214 	ld	a, (_nivel)
   6E6A F5            [11]  215 	push	af
   6E6B 33            [ 6]  216 	inc	sp
   6E6C CD DC 78      [17]  217 	call	__divuchar
   6E6F F1            [10]  218 	pop	af
   6E70 2D            [ 4]  219 	dec	l
   6E71 20 08         [12]  220 	jr	NZ,00112$
                            221 ;src/funciones.c:65: tile = (u8*) &G_tile_cruzada[0];
   6E73 DD 36 FC 22   [19]  222 	ld	-4 (ix), #<(_G_tile_cruzada)
   6E77 DD 36 FD 67   [19]  223 	ld	-3 (ix), #>(_G_tile_cruzada)
                            224 ;src/funciones.c:69: for (i=0; i < 80; i += 4) {
   6E7B                     225 00112$:
   6E7B 06 00         [ 7]  226 	ld	b, #0x00
   6E7D                     227 00105$:
                            228 ;src/funciones.c:70: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,   0), 4, 16);
   6E7D C5            [11]  229 	push	bc
   6E7E AF            [ 4]  230 	xor	a, a
   6E7F F5            [11]  231 	push	af
   6E80 33            [ 6]  232 	inc	sp
   6E81 C5            [11]  233 	push	bc
   6E82 33            [ 6]  234 	inc	sp
   6E83 21 00 C0      [10]  235 	ld	hl, #0xc000
   6E86 E5            [11]  236 	push	hl
   6E87 CD A3 7B      [17]  237 	call	_cpct_getScreenPtr
   6E8A C1            [10]  238 	pop	bc
   6E8B DD 7E FC      [19]  239 	ld	a, -4 (ix)
   6E8E DD 77 FE      [19]  240 	ld	-2 (ix), a
   6E91 DD 7E FD      [19]  241 	ld	a, -3 (ix)
   6E94 DD 77 FF      [19]  242 	ld	-1 (ix), a
   6E97 C5            [11]  243 	push	bc
   6E98 11 04 10      [10]  244 	ld	de, #0x1004
   6E9B D5            [11]  245 	push	de
   6E9C E5            [11]  246 	push	hl
   6E9D DD 6E FE      [19]  247 	ld	l,-2 (ix)
   6EA0 DD 66 FF      [19]  248 	ld	h,-1 (ix)
   6EA3 E5            [11]  249 	push	hl
   6EA4 CD 35 77      [17]  250 	call	_cpct_drawSprite
   6EA7 C1            [10]  251 	pop	bc
                            252 ;src/funciones.c:71: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i, 176), 4, 16);
   6EA8 C5            [11]  253 	push	bc
   6EA9 3E B0         [ 7]  254 	ld	a, #0xb0
   6EAB F5            [11]  255 	push	af
   6EAC 33            [ 6]  256 	inc	sp
   6EAD C5            [11]  257 	push	bc
   6EAE 33            [ 6]  258 	inc	sp
   6EAF 21 00 C0      [10]  259 	ld	hl, #0xc000
   6EB2 E5            [11]  260 	push	hl
   6EB3 CD A3 7B      [17]  261 	call	_cpct_getScreenPtr
   6EB6 11 04 10      [10]  262 	ld	de, #0x1004
   6EB9 D5            [11]  263 	push	de
   6EBA E5            [11]  264 	push	hl
   6EBB DD 6E FE      [19]  265 	ld	l,-2 (ix)
   6EBE DD 66 FF      [19]  266 	ld	h,-1 (ix)
   6EC1 E5            [11]  267 	push	hl
   6EC2 CD 35 77      [17]  268 	call	_cpct_drawSprite
   6EC5 C1            [10]  269 	pop	bc
                            270 ;src/funciones.c:69: for (i=0; i < 80; i += 4) {
   6EC6 04            [ 4]  271 	inc	b
   6EC7 04            [ 4]  272 	inc	b
   6EC8 04            [ 4]  273 	inc	b
   6EC9 04            [ 4]  274 	inc	b
   6ECA 78            [ 4]  275 	ld	a, b
   6ECB D6 50         [ 7]  276 	sub	a, #0x50
   6ECD 38 AE         [12]  277 	jr	C,00105$
                            278 ;src/funciones.c:74: for (i=16; i < 176; i += 16 ){
   6ECF 06 10         [ 7]  279 	ld	b, #0x10
   6ED1                     280 00107$:
                            281 ;src/funciones.c:75: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, 0, i), 4, 16);
   6ED1 C5            [11]  282 	push	bc
   6ED2 C5            [11]  283 	push	bc
   6ED3 33            [ 6]  284 	inc	sp
   6ED4 AF            [ 4]  285 	xor	a, a
   6ED5 F5            [11]  286 	push	af
   6ED6 33            [ 6]  287 	inc	sp
   6ED7 21 00 C0      [10]  288 	ld	hl, #0xc000
   6EDA E5            [11]  289 	push	hl
   6EDB CD A3 7B      [17]  290 	call	_cpct_getScreenPtr
   6EDE 11 04 10      [10]  291 	ld	de, #0x1004
   6EE1 D5            [11]  292 	push	de
   6EE2 E5            [11]  293 	push	hl
   6EE3 DD 6E FE      [19]  294 	ld	l,-2 (ix)
   6EE6 DD 66 FF      [19]  295 	ld	h,-1 (ix)
   6EE9 E5            [11]  296 	push	hl
   6EEA CD 35 77      [17]  297 	call	_cpct_drawSprite
   6EED C1            [10]  298 	pop	bc
                            299 ;src/funciones.c:76: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,76, i), 4, 16);  
   6EEE C5            [11]  300 	push	bc
   6EEF C5            [11]  301 	push	bc
   6EF0 33            [ 6]  302 	inc	sp
   6EF1 3E 4C         [ 7]  303 	ld	a, #0x4c
   6EF3 F5            [11]  304 	push	af
   6EF4 33            [ 6]  305 	inc	sp
   6EF5 21 00 C0      [10]  306 	ld	hl, #0xc000
   6EF8 E5            [11]  307 	push	hl
   6EF9 CD A3 7B      [17]  308 	call	_cpct_getScreenPtr
   6EFC 11 04 10      [10]  309 	ld	de, #0x1004
   6EFF D5            [11]  310 	push	de
   6F00 E5            [11]  311 	push	hl
   6F01 DD 6E FE      [19]  312 	ld	l,-2 (ix)
   6F04 DD 66 FF      [19]  313 	ld	h,-1 (ix)
   6F07 E5            [11]  314 	push	hl
   6F08 CD 35 77      [17]  315 	call	_cpct_drawSprite
   6F0B C1            [10]  316 	pop	bc
                            317 ;src/funciones.c:74: for (i=16; i < 176; i += 16 ){
   6F0C 78            [ 4]  318 	ld	a, b
   6F0D C6 10         [ 7]  319 	add	a, #0x10
   6F0F 47            [ 4]  320 	ld	b,a
   6F10 D6 B0         [ 7]  321 	sub	a, #0xb0
   6F12 38 BD         [12]  322 	jr	C,00107$
   6F14 DD F9         [10]  323 	ld	sp, ix
   6F16 DD E1         [14]  324 	pop	ix
   6F18 C9            [10]  325 	ret
                            326 ;src/funciones.c:81: void dibujarMarcoInterior (){
                            327 ;	---------------------------------
                            328 ; Function dibujarMarcoInterior
                            329 ; ---------------------------------
   6F19                     330 _dibujarMarcoInterior::
   6F19 DD E5         [15]  331 	push	ix
   6F1B DD 21 00 00   [14]  332 	ld	ix,#0
   6F1F DD 39         [15]  333 	add	ix,sp
   6F21 F5            [11]  334 	push	af
                            335 ;src/funciones.c:86: tile = (u8*) &G_tile_cruzada[0];
   6F22 01 22 67      [10]  336 	ld	bc, #_G_tile_cruzada
                            337 ;src/funciones.c:87: if ((nivel/10) == 1)
   6F25 C5            [11]  338 	push	bc
   6F26 3E 0A         [ 7]  339 	ld	a, #0x0a
   6F28 F5            [11]  340 	push	af
   6F29 33            [ 6]  341 	inc	sp
   6F2A 3A AC 87      [13]  342 	ld	a, (_nivel)
   6F2D F5            [11]  343 	push	af
   6F2E 33            [ 6]  344 	inc	sp
   6F2F CD DC 78      [17]  345 	call	__divuchar
   6F32 F1            [10]  346 	pop	af
   6F33 C1            [10]  347 	pop	bc
   6F34 2D            [ 4]  348 	dec	l
   6F35 20 03         [12]  349 	jr	NZ,00112$
                            350 ;src/funciones.c:88: tile = (u8*) &G_tile_cruzada[0];
   6F37 01 22 67      [10]  351 	ld	bc, #_G_tile_cruzada
                            352 ;src/funciones.c:92: for (i=0; i < 80; i += 4) {
   6F3A                     353 00112$:
   6F3A 1E 00         [ 7]  354 	ld	e, #0x00
   6F3C                     355 00105$:
                            356 ;src/funciones.c:93: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,  48), 4, 16);
   6F3C C5            [11]  357 	push	bc
   6F3D D5            [11]  358 	push	de
   6F3E 16 30         [ 7]  359 	ld	d,#0x30
   6F40 D5            [11]  360 	push	de
   6F41 21 00 C0      [10]  361 	ld	hl, #0xc000
   6F44 E5            [11]  362 	push	hl
   6F45 CD A3 7B      [17]  363 	call	_cpct_getScreenPtr
   6F48 D1            [10]  364 	pop	de
   6F49 C1            [10]  365 	pop	bc
   6F4A E5            [11]  366 	push	hl
   6F4B FD E1         [14]  367 	pop	iy
   6F4D 33            [ 6]  368 	inc	sp
   6F4E 33            [ 6]  369 	inc	sp
   6F4F C5            [11]  370 	push	bc
   6F50 C5            [11]  371 	push	bc
   6F51 D5            [11]  372 	push	de
   6F52 21 04 10      [10]  373 	ld	hl, #0x1004
   6F55 E5            [11]  374 	push	hl
   6F56 FD E5         [15]  375 	push	iy
   6F58 DD 6E FE      [19]  376 	ld	l,-2 (ix)
   6F5B DD 66 FF      [19]  377 	ld	h,-1 (ix)
   6F5E E5            [11]  378 	push	hl
   6F5F CD 35 77      [17]  379 	call	_cpct_drawSprite
   6F62 D1            [10]  380 	pop	de
   6F63 C1            [10]  381 	pop	bc
                            382 ;src/funciones.c:92: for (i=0; i < 80; i += 4) {
   6F64 1C            [ 4]  383 	inc	e
   6F65 1C            [ 4]  384 	inc	e
   6F66 1C            [ 4]  385 	inc	e
   6F67 1C            [ 4]  386 	inc	e
   6F68 7B            [ 4]  387 	ld	a, e
   6F69 D6 50         [ 7]  388 	sub	a, #0x50
   6F6B 38 CF         [12]  389 	jr	C,00105$
                            390 ;src/funciones.c:96: for (i=64; i < 176; i += 16 ){
   6F6D 06 40         [ 7]  391 	ld	b, #0x40
   6F6F                     392 00107$:
                            393 ;src/funciones.c:97: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,40, i), 4, 16);
   6F6F C5            [11]  394 	push	bc
   6F70 C5            [11]  395 	push	bc
   6F71 33            [ 6]  396 	inc	sp
   6F72 3E 28         [ 7]  397 	ld	a, #0x28
   6F74 F5            [11]  398 	push	af
   6F75 33            [ 6]  399 	inc	sp
   6F76 21 00 C0      [10]  400 	ld	hl, #0xc000
   6F79 E5            [11]  401 	push	hl
   6F7A CD A3 7B      [17]  402 	call	_cpct_getScreenPtr
   6F7D 11 04 10      [10]  403 	ld	de, #0x1004
   6F80 D5            [11]  404 	push	de
   6F81 E5            [11]  405 	push	hl
   6F82 DD 6E FE      [19]  406 	ld	l,-2 (ix)
   6F85 DD 66 FF      [19]  407 	ld	h,-1 (ix)
   6F88 E5            [11]  408 	push	hl
   6F89 CD 35 77      [17]  409 	call	_cpct_drawSprite
   6F8C C1            [10]  410 	pop	bc
                            411 ;src/funciones.c:96: for (i=64; i < 176; i += 16 ){
   6F8D 78            [ 4]  412 	ld	a, b
   6F8E C6 10         [ 7]  413 	add	a, #0x10
   6F90 47            [ 4]  414 	ld	b,a
   6F91 D6 B0         [ 7]  415 	sub	a, #0xb0
   6F93 38 DA         [12]  416 	jr	C,00107$
                            417 ;src/funciones.c:101: cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
   6F95 21 00 00      [10]  418 	ld	hl, #0x0000
   6F98 E5            [11]  419 	push	hl
   6F99 2E 00         [ 7]  420 	ld	l, #0x00
   6F9B E5            [11]  421 	push	hl
   6F9C CD 8E 7A      [17]  422 	call	_cpct_px2byteM1
   6F9F F1            [10]  423 	pop	af
   6FA0 F1            [10]  424 	pop	af
   6FA1 45            [ 4]  425 	ld	b, l
   6FA2 21 22 80      [10]  426 	ld	hl, #0x8022
   6FA5 E5            [11]  427 	push	hl
   6FA6 C5            [11]  428 	push	bc
   6FA7 33            [ 6]  429 	inc	sp
   6FA8 21 5B C2      [10]  430 	ld	hl, #0xc25b
   6FAB E5            [11]  431 	push	hl
   6FAC CD BB 7A      [17]  432 	call	_cpct_drawSolidBox
   6FAF DD F9         [10]  433 	ld	sp,ix
   6FB1 DD E1         [14]  434 	pop	ix
   6FB3 C9            [10]  435 	ret
                            436 ;src/funciones.c:104: void dibujarEscenario(){
                            437 ;	---------------------------------
                            438 ; Function dibujarEscenario
                            439 ; ---------------------------------
   6FB4                     440 _dibujarEscenario::
                            441 ;src/funciones.c:107: cpct_etm_setTileset2x4(tileset1);
   6FB4 21 B4 53      [10]  442 	ld	hl, #_tileset1
   6FB7 CD B9 78      [17]  443 	call	_cpct_etm_setTileset2x4
                            444 ;src/funciones.c:108: if (nivel > 10)
   6FBA 3E 0A         [ 7]  445 	ld	a, #0x0a
   6FBC FD 21 AC 87   [14]  446 	ld	iy, #_nivel
   6FC0 FD 96 00      [19]  447 	sub	a, 0 (iy)
   6FC3 30 06         [12]  448 	jr	NC,00102$
                            449 ;src/funciones.c:109: cpct_etm_setTileset2x4(tileset1);
   6FC5 21 B4 53      [10]  450 	ld	hl, #_tileset1
   6FC8 CD B9 78      [17]  451 	call	_cpct_etm_setTileset2x4
   6FCB                     452 00102$:
                            453 ;src/funciones.c:111: mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
   6FCB 01 00 40      [10]  454 	ld	bc, #_g_mapa01+0
   6FCE 21 AC 87      [10]  455 	ld	hl,#_nivel + 0
   6FD1 5E            [ 7]  456 	ld	e, (hl)
   6FD2 16 00         [ 7]  457 	ld	d, #0x00
   6FD4 1B            [ 6]  458 	dec	de
   6FD5 6B            [ 4]  459 	ld	l, e
   6FD6 62            [ 4]  460 	ld	h, d
   6FD7 29            [11]  461 	add	hl, hl
   6FD8 19            [11]  462 	add	hl, de
   6FD9 29            [11]  463 	add	hl, hl
   6FDA 19            [11]  464 	add	hl, de
   6FDB 29            [11]  465 	add	hl, hl
   6FDC 19            [11]  466 	add	hl, de
   6FDD 29            [11]  467 	add	hl, hl
   6FDE 19            [11]  468 	add	hl, de
   6FDF 29            [11]  469 	add	hl, hl
   6FE0 19            [11]  470 	add	hl, de
   6FE1 29            [11]  471 	add	hl, hl
   6FE2 29            [11]  472 	add	hl, hl
   6FE3 29            [11]  473 	add	hl, hl
   6FE4 09            [11]  474 	add	hl, bc
                            475 ;src/funciones.c:113: cpct_etm_drawTilemap2x4 ( g_mapa01_W, g_mapa01_H , INICIO_AREA_JUEGO, mapa);
   6FE5 E5            [11]  476 	push	hl
   6FE6 21 84 C2      [10]  477 	ld	hl, #0xc284
   6FE9 E5            [11]  478 	push	hl
   6FEA 21 1C 12      [10]  479 	ld	hl, #0x121c
   6FED E5            [11]  480 	push	hl
   6FEE 2E 00         [ 7]  481 	ld	l, #0x00
   6FF0 E5            [11]  482 	push	hl
   6FF1 AF            [ 4]  483 	xor	a, a
   6FF2 F5            [11]  484 	push	af
   6FF3 33            [ 6]  485 	inc	sp
   6FF4 CD 2A 78      [17]  486 	call	_cpct_etm_drawTileBox2x4
   6FF7 C9            [10]  487 	ret
                            488 ;src/funciones.c:117: void printStats(TStats *a) {
                            489 ;	---------------------------------
                            490 ; Function printStats
                            491 ; ---------------------------------
   6FF8                     492 _printStats::
   6FF8 DD E5         [15]  493 	push	ix
   6FFA DD 21 00 00   [14]  494 	ld	ix,#0
   6FFE DD 39         [15]  495 	add	ix,sp
   7000 21 D6 FF      [10]  496 	ld	hl, #-42
   7003 39            [11]  497 	add	hl, sp
   7004 F9            [ 6]  498 	ld	sp, hl
                            499 ;src/funciones.c:120: cpct_setDrawCharM1(2, 0);
   7005 21 02 00      [10]  500 	ld	hl, #0x0002
   7008 E5            [11]  501 	push	hl
   7009 CD C3 7B      [17]  502 	call	_cpct_setDrawCharM1
                            503 ;src/funciones.c:121: sprintf(temp, "                                    ");
   700C 11 98 70      [10]  504 	ld	de, #___str_0+0
   700F 21 00 00      [10]  505 	ld	hl, #0x0000
   7012 39            [11]  506 	add	hl, sp
   7013 DD 75 FE      [19]  507 	ld	-2 (ix), l
   7016 DD 74 FF      [19]  508 	ld	-1 (ix), h
   7019 D5            [11]  509 	push	de
   701A E5            [11]  510 	push	hl
   701B CD F7 79      [17]  511 	call	_sprintf
   701E F1            [10]  512 	pop	af
   701F F1            [10]  513 	pop	af
                            514 ;src/funciones.c:122: if (a->energy)
   7020 DD 4E 04      [19]  515 	ld	c,4 (ix)
   7023 DD 46 05      [19]  516 	ld	b,5 (ix)
   7026 C5            [11]  517 	push	bc
   7027 FD E1         [14]  518 	pop	iy
   7029 FD 5E 0A      [19]  519 	ld	e, 10 (iy)
   702C 7B            [ 4]  520 	ld	a, e
   702D B7            [ 4]  521 	or	a, a
   702E 28 45         [12]  522 	jr	Z,00102$
                            523 ;src/funciones.c:123: sprintf(temp, "%-9s=> HP:%02d. ATT: %02d. DEF: %02d",a->name, a->energy,a->attack,a->defense);
   7030 C5            [11]  524 	push	bc
   7031 FD E1         [14]  525 	pop	iy
   7033 FD 6E 0E      [19]  526 	ld	l, 14 (iy)
   7036 DD 75 FC      [19]  527 	ld	-4 (ix), l
   7039 DD 36 FD 00   [19]  528 	ld	-3 (ix), #0x00
   703D C5            [11]  529 	push	bc
   703E FD E1         [14]  530 	pop	iy
   7040 FD 6E 0C      [19]  531 	ld	l, 12 (iy)
   7043 DD 75 FA      [19]  532 	ld	-6 (ix), l
   7046 DD 36 FB 00   [19]  533 	ld	-5 (ix), #0x00
   704A 16 00         [ 7]  534 	ld	d, #0x00
   704C DD 6E FE      [19]  535 	ld	l,-2 (ix)
   704F DD 66 FF      [19]  536 	ld	h,-1 (ix)
   7052 E5            [11]  537 	push	hl
   7053 FD E1         [14]  538 	pop	iy
   7055 C5            [11]  539 	push	bc
   7056 DD 6E FC      [19]  540 	ld	l,-4 (ix)
   7059 DD 66 FD      [19]  541 	ld	h,-3 (ix)
   705C E5            [11]  542 	push	hl
   705D DD 6E FA      [19]  543 	ld	l,-6 (ix)
   7060 DD 66 FB      [19]  544 	ld	h,-5 (ix)
   7063 E5            [11]  545 	push	hl
   7064 D5            [11]  546 	push	de
   7065 C5            [11]  547 	push	bc
   7066 21 BD 70      [10]  548 	ld	hl, #___str_1
   7069 E5            [11]  549 	push	hl
   706A FD E5         [15]  550 	push	iy
   706C CD F7 79      [17]  551 	call	_sprintf
   706F 21 0C 00      [10]  552 	ld	hl, #12
   7072 39            [11]  553 	add	hl, sp
   7073 F9            [ 6]  554 	ld	sp, hl
   7074 C1            [10]  555 	pop	bc
   7075                     556 00102$:
                            557 ;src/funciones.c:125: cpct_drawStringM1(temp, cpct_getScreenPtr(CPCT_VMEM_START, 4, a->pos_y));
   7075 C5            [11]  558 	push	bc
   7076 FD E1         [14]  559 	pop	iy
   7078 FD 46 11      [19]  560 	ld	b, 17 (iy)
   707B C5            [11]  561 	push	bc
   707C 33            [ 6]  562 	inc	sp
   707D 3E 04         [ 7]  563 	ld	a, #0x04
   707F F5            [11]  564 	push	af
   7080 33            [ 6]  565 	inc	sp
   7081 21 00 C0      [10]  566 	ld	hl, #0xc000
   7084 E5            [11]  567 	push	hl
   7085 CD A3 7B      [17]  568 	call	_cpct_getScreenPtr
   7088 DD 4E FE      [19]  569 	ld	c,-2 (ix)
   708B DD 46 FF      [19]  570 	ld	b,-1 (ix)
   708E E5            [11]  571 	push	hl
   708F C5            [11]  572 	push	bc
   7090 CD 05 77      [17]  573 	call	_cpct_drawStringM1
   7093 DD F9         [10]  574 	ld	sp, ix
   7095 DD E1         [14]  575 	pop	ix
   7097 C9            [10]  576 	ret
   7098                     577 ___str_0:
   7098 20 20 20 20 20 20   578 	.ascii "                                    "
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
   70BC 00                  579 	.db 0x00
   70BD                     580 ___str_1:
   70BD 25 2D 39 73 3D 3E   581 	.ascii "%-9s=> HP:%02d. ATT: %02d. DEF: %02d"
        20 48 50 3A 25 30
        32 64 2E 20 41 54
        54 3A 20 25 30 32
        64 2E 20 44 45 46
        3A 20 25 30 32 64
   70E1 00                  582 	.db 0x00
                            583 ;src/funciones.c:128: void printLevel() {
                            584 ;	---------------------------------
                            585 ; Function printLevel
                            586 ; ---------------------------------
   70E2                     587 _printLevel::
   70E2 DD E5         [15]  588 	push	ix
   70E4 DD 21 00 00   [14]  589 	ld	ix,#0
   70E8 DD 39         [15]  590 	add	ix,sp
   70EA 21 D8 FF      [10]  591 	ld	hl, #-40
   70ED 39            [11]  592 	add	hl, sp
   70EE F9            [ 6]  593 	ld	sp, hl
                            594 ;src/funciones.c:131: sprintf(temp, "LEVEL: %02d",nivel);
   70EF 21 AC 87      [10]  595 	ld	hl,#_nivel + 0
   70F2 5E            [ 7]  596 	ld	e, (hl)
   70F3 16 00         [ 7]  597 	ld	d, #0x00
   70F5 21 00 00      [10]  598 	ld	hl, #0x0000
   70F8 39            [11]  599 	add	hl, sp
   70F9 4D            [ 4]  600 	ld	c, l
   70FA 44            [ 4]  601 	ld	b, h
   70FB E5            [11]  602 	push	hl
   70FC D5            [11]  603 	push	de
   70FD 11 1F 71      [10]  604 	ld	de, #___str_2
   7100 D5            [11]  605 	push	de
   7101 C5            [11]  606 	push	bc
   7102 CD F7 79      [17]  607 	call	_sprintf
   7105 21 06 00      [10]  608 	ld	hl, #6
   7108 39            [11]  609 	add	hl, sp
   7109 F9            [ 6]  610 	ld	sp, hl
   710A 01 02 00      [10]  611 	ld	bc, #0x0002
   710D C5            [11]  612 	push	bc
   710E CD C3 7B      [17]  613 	call	_cpct_setDrawCharM1
   7111 E1            [10]  614 	pop	hl
                            615 ;src/funciones.c:133: cpct_drawStringM1(temp, cpctm_screenPtr(CPCT_VMEM_START, 4, 16));
   7112 01 A4 C0      [10]  616 	ld	bc, #0xc0a4
   7115 C5            [11]  617 	push	bc
   7116 E5            [11]  618 	push	hl
   7117 CD 05 77      [17]  619 	call	_cpct_drawStringM1
   711A DD F9         [10]  620 	ld	sp, ix
   711C DD E1         [14]  621 	pop	ix
   711E C9            [10]  622 	ret
   711F                     623 ___str_2:
   711F 4C 45 56 45 4C 3A   624 	.ascii "LEVEL: %02d"
        20 25 30 32 64
   712A 00                  625 	.db 0x00
                            626 ;src/funciones.c:136: void printConsole  (void* string, u8 pen, u8 bground) {
                            627 ;	---------------------------------
                            628 ; Function printConsole
                            629 ; ---------------------------------
   712B                     630 _printConsole::
                            631 ;src/funciones.c:137: if (cursorConsola > 175){
   712B 3E AF         [ 7]  632 	ld	a, #0xaf
   712D FD 21 AD 87   [14]  633 	ld	iy, #_cursorConsola
   7131 FD 96 00      [19]  634 	sub	a, 0 (iy)
   7134 30 2A         [12]  635 	jr	NC,00102$
                            636 ;src/funciones.c:139: pausa(SEGUNDO);
   7136 21 00 80      [10]  637 	ld	hl, #0x8000
   7139 E5            [11]  638 	push	hl
   713A CD EA 6D      [17]  639 	call	_pausa
   713D F1            [10]  640 	pop	af
                            641 ;src/funciones.c:140: cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
   713E 21 00 00      [10]  642 	ld	hl, #0x0000
   7141 E5            [11]  643 	push	hl
   7142 2E 00         [ 7]  644 	ld	l, #0x00
   7144 E5            [11]  645 	push	hl
   7145 CD 8E 7A      [17]  646 	call	_cpct_px2byteM1
   7148 F1            [10]  647 	pop	af
   7149 F1            [10]  648 	pop	af
   714A 45            [ 4]  649 	ld	b, l
   714B 21 22 80      [10]  650 	ld	hl, #0x8022
   714E E5            [11]  651 	push	hl
   714F C5            [11]  652 	push	bc
   7150 33            [ 6]  653 	inc	sp
   7151 21 5B C2      [10]  654 	ld	hl, #0xc25b
   7154 E5            [11]  655 	push	hl
   7155 CD BB 7A      [17]  656 	call	_cpct_drawSolidBox
   7158 F1            [10]  657 	pop	af
   7159 F1            [10]  658 	pop	af
   715A 33            [ 6]  659 	inc	sp
                            660 ;src/funciones.c:141: cursorConsola = 64;
   715B 21 AD 87      [10]  661 	ld	hl,#_cursorConsola + 0
   715E 36 40         [10]  662 	ld	(hl), #0x40
   7160                     663 00102$:
                            664 ;src/funciones.c:144: cpct_setDrawCharM1(pen, bground);
   7160 21 05 00      [10]  665 	ld	hl, #5+0
   7163 39            [11]  666 	add	hl, sp
   7164 7E            [ 7]  667 	ld	a, (hl)
   7165 F5            [11]  668 	push	af
   7166 33            [ 6]  669 	inc	sp
   7167 21 05 00      [10]  670 	ld	hl, #5+0
   716A 39            [11]  671 	add	hl, sp
   716B 7E            [ 7]  672 	ld	a, (hl)
   716C F5            [11]  673 	push	af
   716D 33            [ 6]  674 	inc	sp
   716E CD C3 7B      [17]  675 	call	_cpct_setDrawCharM1
                            676 ;src/funciones.c:145: cpct_drawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 44, cursorConsola));
   7171 3A AD 87      [13]  677 	ld	a, (_cursorConsola)
   7174 57            [ 4]  678 	ld	d,a
   7175 1E 2C         [ 7]  679 	ld	e,#0x2c
   7177 D5            [11]  680 	push	de
   7178 21 00 C0      [10]  681 	ld	hl, #0xc000
   717B E5            [11]  682 	push	hl
   717C CD A3 7B      [17]  683 	call	_cpct_getScreenPtr
   717F D1            [10]  684 	pop	de
   7180 C1            [10]  685 	pop	bc
   7181 C5            [11]  686 	push	bc
   7182 D5            [11]  687 	push	de
   7183 E5            [11]  688 	push	hl
   7184 C5            [11]  689 	push	bc
   7185 CD 05 77      [17]  690 	call	_cpct_drawStringM1
                            691 ;src/funciones.c:146: cursorConsola +=8;
   7188 21 AD 87      [10]  692 	ld	hl, #_cursorConsola
   718B 7E            [ 7]  693 	ld	a, (hl)
   718C C6 08         [ 7]  694 	add	a, #0x08
   718E 77            [ 7]  695 	ld	(hl), a
   718F C9            [10]  696 	ret
                            697 ;src/funciones.c:149: void atacar(TStats *a, TStats *b) {
                            698 ;	---------------------------------
                            699 ; Function atacar
                            700 ; ---------------------------------
   7190                     701 _atacar::
   7190 DD E5         [15]  702 	push	ix
   7192 DD 21 00 00   [14]  703 	ld	ix,#0
   7196 DD 39         [15]  704 	add	ix,sp
   7198 21 E6 FF      [10]  705 	ld	hl, #-26
   719B 39            [11]  706 	add	hl, sp
   719C F9            [ 6]  707 	ld	sp, hl
                            708 ;src/funciones.c:153: pen = 0;
   719D DD 36 FB 00   [19]  709 	ld	-5 (ix), #0x00
                            710 ;src/funciones.c:154: bg = 2;
   71A1 DD 36 FA 02   [19]  711 	ld	-6 (ix), #0x02
                            712 ;src/funciones.c:155: if ((u16) a->sprite == (u16) G_mendo)  {
   71A5 DD 4E 04      [19]  713 	ld	c,4 (ix)
   71A8 DD 46 05      [19]  714 	ld	b,5 (ix)
   71AB 69            [ 4]  715 	ld	l, c
   71AC 60            [ 4]  716 	ld	h, b
   71AD 11 12 00      [10]  717 	ld	de, #0x0012
   71B0 19            [11]  718 	add	hl, de
   71B1 5E            [ 7]  719 	ld	e, (hl)
   71B2 23            [ 6]  720 	inc	hl
   71B3 56            [ 7]  721 	ld	d, (hl)
   71B4 DD 36 FE 62   [19]  722 	ld	-2 (ix), #<(_G_mendo)
   71B8 DD 36 FF 67   [19]  723 	ld	-1 (ix), #>(_G_mendo)
   71BC 7B            [ 4]  724 	ld	a, e
   71BD DD 96 FE      [19]  725 	sub	a, -2 (ix)
   71C0 20 0E         [12]  726 	jr	NZ,00102$
   71C2 7A            [ 4]  727 	ld	a, d
   71C3 DD 96 FF      [19]  728 	sub	a, -1 (ix)
   71C6 20 08         [12]  729 	jr	NZ,00102$
                            730 ;src/funciones.c:156: pen = 2;
   71C8 DD 36 FB 02   [19]  731 	ld	-5 (ix), #0x02
                            732 ;src/funciones.c:157: bg = 0;
   71CC DD 36 FA 00   [19]  733 	ld	-6 (ix), #0x00
   71D0                     734 00102$:
                            735 ;src/funciones.c:161: ataque = a->attack + (2*(cpct_rand()%a->force)) - a->force;
   71D0 C5            [11]  736 	push	bc
   71D1 FD E1         [14]  737 	pop	iy
   71D3 FD 7E 0C      [19]  738 	ld	a, 12 (iy)
   71D6 DD 77 FE      [19]  739 	ld	-2 (ix), a
   71D9 C5            [11]  740 	push	bc
   71DA CD 2D 79      [17]  741 	call	_cpct_getRandom_mxor_u8
   71DD 5D            [ 4]  742 	ld	e, l
   71DE C1            [10]  743 	pop	bc
   71DF C5            [11]  744 	push	bc
   71E0 FD E1         [14]  745 	pop	iy
   71E2 FD 56 0D      [19]  746 	ld	d, 13 (iy)
   71E5 C5            [11]  747 	push	bc
   71E6 D5            [11]  748 	push	de
   71E7 D5            [11]  749 	push	de
   71E8 CD BD 78      [17]  750 	call	__moduchar
   71EB F1            [10]  751 	pop	af
   71EC D1            [10]  752 	pop	de
   71ED C1            [10]  753 	pop	bc
   71EE CB 25         [ 8]  754 	sla	l
   71F0 DD 7E FE      [19]  755 	ld	a, -2 (ix)
   71F3 85            [ 4]  756 	add	a, l
   71F4 92            [ 4]  757 	sub	a, d
                            758 ;src/funciones.c:162: sprintf(temp, "%-9s ATT %02d",a->name, ataque);
   71F5 DD 77 FE      [19]  759 	ld	-2 (ix), a
   71F8 5F            [ 4]  760 	ld	e, a
   71F9 16 00         [ 7]  761 	ld	d, #0x00
   71FB 21 00 00      [10]  762 	ld	hl, #0x0000
   71FE 39            [11]  763 	add	hl, sp
   71FF DD 75 FC      [19]  764 	ld	-4 (ix), l
   7202 DD 74 FD      [19]  765 	ld	-3 (ix), h
   7205 D5            [11]  766 	push	de
   7206 C5            [11]  767 	push	bc
   7207 01 9E 72      [10]  768 	ld	bc, #___str_3
   720A C5            [11]  769 	push	bc
   720B E5            [11]  770 	push	hl
   720C CD F7 79      [17]  771 	call	_sprintf
   720F 21 08 00      [10]  772 	ld	hl, #8
   7212 39            [11]  773 	add	hl, sp
   7213 F9            [ 6]  774 	ld	sp, hl
                            775 ;src/funciones.c:163: printConsole(temp, pen, bg);
   7214 DD 4E FC      [19]  776 	ld	c,-4 (ix)
   7217 DD 46 FD      [19]  777 	ld	b,-3 (ix)
   721A DD 66 FA      [19]  778 	ld	h, -6 (ix)
   721D DD 6E FB      [19]  779 	ld	l, -5 (ix)
   7220 E5            [11]  780 	push	hl
   7221 C5            [11]  781 	push	bc
   7222 CD 2B 71      [17]  782 	call	_printConsole
   7225 F1            [10]  783 	pop	af
   7226 F1            [10]  784 	pop	af
                            785 ;src/funciones.c:165: if (ataque < b->energy) {
   7227 DD 4E 06      [19]  786 	ld	c,6 (ix)
   722A DD 46 07      [19]  787 	ld	b,7 (ix)
   722D 21 0A 00      [10]  788 	ld	hl, #0x000a
   7230 09            [11]  789 	add	hl, bc
   7231 5E            [ 7]  790 	ld	e, (hl)
   7232 DD 7E FE      [19]  791 	ld	a, -2 (ix)
   7235 93            [ 4]  792 	sub	a, e
   7236 30 1F         [12]  793 	jr	NC,00104$
                            794 ;src/funciones.c:166: b->energy = b->energy - ataque;
   7238 7B            [ 4]  795 	ld	a, e
   7239 DD 96 FE      [19]  796 	sub	a, -2 (ix)
   723C 5F            [ 4]  797 	ld	e, a
   723D 73            [ 7]  798 	ld	(hl), e
                            799 ;src/funciones.c:167: sprintf(temp, "%-9s HP=>%02d",b->name, b->energy);
   723E 16 00         [ 7]  800 	ld	d, #0x00
   7240 DD 6E FC      [19]  801 	ld	l,-4 (ix)
   7243 DD 66 FD      [19]  802 	ld	h,-3 (ix)
   7246 D5            [11]  803 	push	de
   7247 C5            [11]  804 	push	bc
   7248 01 AC 72      [10]  805 	ld	bc, #___str_4
   724B C5            [11]  806 	push	bc
   724C E5            [11]  807 	push	hl
   724D CD F7 79      [17]  808 	call	_sprintf
   7250 21 08 00      [10]  809 	ld	hl, #8
   7253 39            [11]  810 	add	hl, sp
   7254 F9            [ 6]  811 	ld	sp, hl
   7255 18 31         [12]  812 	jr	00105$
   7257                     813 00104$:
                            814 ;src/funciones.c:169: b->energy = 0;
   7257 36 00         [10]  815 	ld	(hl), #0x00
                            816 ;src/funciones.c:170: sprintf(temp, "%-9s DIED! ",b->name, b->energy);
   7259 5E            [ 7]  817 	ld	e, (hl)
   725A 16 00         [ 7]  818 	ld	d, #0x00
   725C DD 6E FC      [19]  819 	ld	l,-4 (ix)
   725F DD 66 FD      [19]  820 	ld	h,-3 (ix)
   7262 D5            [11]  821 	push	de
   7263 C5            [11]  822 	push	bc
   7264 01 BA 72      [10]  823 	ld	bc, #___str_5
   7267 C5            [11]  824 	push	bc
   7268 E5            [11]  825 	push	hl
   7269 CD F7 79      [17]  826 	call	_sprintf
   726C 21 08 00      [10]  827 	ld	hl, #8
   726F 39            [11]  828 	add	hl, sp
   7270 F9            [ 6]  829 	ld	sp, hl
                            830 ;src/funciones.c:171: printStats(b);
   7271 DD 6E 06      [19]  831 	ld	l,6 (ix)
   7274 DD 66 07      [19]  832 	ld	h,7 (ix)
   7277 E5            [11]  833 	push	hl
   7278 CD F8 6F      [17]  834 	call	_printStats
   727B F1            [10]  835 	pop	af
                            836 ;src/funciones.c:173: ataque = pen;
   727C DD 4E FB      [19]  837 	ld	c, -5 (ix)
                            838 ;src/funciones.c:174: pen = bg;
   727F DD 7E FA      [19]  839 	ld	a, -6 (ix)
   7282 DD 77 FB      [19]  840 	ld	-5 (ix), a
                            841 ;src/funciones.c:175: bg = ataque;
   7285 DD 71 FA      [19]  842 	ld	-6 (ix), c
   7288                     843 00105$:
                            844 ;src/funciones.c:178: printConsole(temp, pen, bg);
   7288 DD 4E FC      [19]  845 	ld	c,-4 (ix)
   728B DD 46 FD      [19]  846 	ld	b,-3 (ix)
   728E DD 66 FA      [19]  847 	ld	h, -6 (ix)
   7291 DD 6E FB      [19]  848 	ld	l, -5 (ix)
   7294 E5            [11]  849 	push	hl
   7295 C5            [11]  850 	push	bc
   7296 CD 2B 71      [17]  851 	call	_printConsole
   7299 DD F9         [10]  852 	ld	sp,ix
   729B DD E1         [14]  853 	pop	ix
   729D C9            [10]  854 	ret
   729E                     855 ___str_3:
   729E 25 2D 39 73 20 41   856 	.ascii "%-9s ATT %02d"
        54 54 20 25 30 32
        64
   72AB 00                  857 	.db 0x00
   72AC                     858 ___str_4:
   72AC 25 2D 39 73 20 48   859 	.ascii "%-9s HP=>%02d"
        50 3D 3E 25 30 32
        64
   72B9 00                  860 	.db 0x00
   72BA                     861 ___str_5:
   72BA 25 2D 39 73 20 44   862 	.ascii "%-9s DIED! "
        49 45 44 21 20
   72C5 00                  863 	.db 0x00
                            864 ;src/funciones.c:181: void defender(TStats *a) {
                            865 ;	---------------------------------
                            866 ; Function defender
                            867 ; ---------------------------------
   72C6                     868 _defender::
   72C6 DD E5         [15]  869 	push	ix
   72C8 DD 21 00 00   [14]  870 	ld	ix,#0
   72CC DD 39         [15]  871 	add	ix,sp
   72CE 21 E5 FF      [10]  872 	ld	hl, #-27
   72D1 39            [11]  873 	add	hl, sp
   72D2 F9            [ 6]  874 	ld	sp, hl
                            875 ;src/funciones.c:184: pen = 0;
   72D3 DD 36 E5 00   [19]  876 	ld	-27 (ix), #0x00
                            877 ;src/funciones.c:185: bg = 2;
   72D7 DD 36 E6 02   [19]  878 	ld	-26 (ix), #0x02
                            879 ;src/funciones.c:186: if ((u16) a->sprite == (u16) G_mendo)  {
   72DB DD 4E 04      [19]  880 	ld	c,4 (ix)
   72DE DD 46 05      [19]  881 	ld	b,5 (ix)
   72E1 69            [ 4]  882 	ld	l, c
   72E2 60            [ 4]  883 	ld	h, b
   72E3 11 12 00      [10]  884 	ld	de, #0x0012
   72E6 19            [11]  885 	add	hl, de
   72E7 5E            [ 7]  886 	ld	e, (hl)
   72E8 23            [ 6]  887 	inc	hl
   72E9 56            [ 7]  888 	ld	d, (hl)
   72EA DD 36 FE 62   [19]  889 	ld	-2 (ix), #<(_G_mendo)
   72EE DD 36 FF 67   [19]  890 	ld	-1 (ix), #>(_G_mendo)
   72F2 7B            [ 4]  891 	ld	a, e
   72F3 DD 96 FE      [19]  892 	sub	a, -2 (ix)
   72F6 20 0E         [12]  893 	jr	NZ,00102$
   72F8 7A            [ 4]  894 	ld	a, d
   72F9 DD 96 FF      [19]  895 	sub	a, -1 (ix)
   72FC 20 08         [12]  896 	jr	NZ,00102$
                            897 ;src/funciones.c:187: pen = 2;
   72FE DD 36 E5 02   [19]  898 	ld	-27 (ix), #0x02
                            899 ;src/funciones.c:188: bg = 0;
   7302 DD 36 E6 00   [19]  900 	ld	-26 (ix), #0x00
   7306                     901 00102$:
                            902 ;src/funciones.c:191: if (a->energy + a->defense < a->max_energy)
   7306 FD 21 0A 00   [14]  903 	ld	iy, #0x000a
   730A FD 09         [15]  904 	add	iy, bc
   730C FD 7E 00      [19]  905 	ld	a, 0 (iy)
   730F DD 77 FE      [19]  906 	ld	-2 (ix), a
   7312 5F            [ 4]  907 	ld	e, a
   7313 16 00         [ 7]  908 	ld	d, #0x00
   7315 69            [ 4]  909 	ld	l, c
   7316 60            [ 4]  910 	ld	h, b
   7317 C5            [11]  911 	push	bc
   7318 01 0E 00      [10]  912 	ld	bc, #0x000e
   731B 09            [11]  913 	add	hl, bc
   731C C1            [10]  914 	pop	bc
   731D 7E            [ 7]  915 	ld	a, (hl)
   731E DD 77 FD      [19]  916 	ld	-3 (ix), a
   7321 6F            [ 4]  917 	ld	l, a
   7322 26 00         [ 7]  918 	ld	h, #0x00
   7324 19            [11]  919 	add	hl,de
   7325 DD 75 FB      [19]  920 	ld	-5 (ix), l
   7328 DD 74 FC      [19]  921 	ld	-4 (ix), h
   732B 69            [ 4]  922 	ld	l, c
   732C 60            [ 4]  923 	ld	h, b
   732D 11 0B 00      [10]  924 	ld	de, #0x000b
   7330 19            [11]  925 	add	hl, de
   7331 5E            [ 7]  926 	ld	e, (hl)
   7332 6B            [ 4]  927 	ld	l, e
   7333 16 00         [ 7]  928 	ld	d, #0x00
   7335 DD 7E FB      [19]  929 	ld	a, -5 (ix)
   7338 95            [ 4]  930 	sub	a, l
   7339 DD 7E FC      [19]  931 	ld	a, -4 (ix)
   733C 9A            [ 4]  932 	sbc	a, d
   733D E2 42 73      [10]  933 	jp	PO, 00124$
   7340 EE 80         [ 7]  934 	xor	a, #0x80
   7342                     935 00124$:
   7342 F2 4A 73      [10]  936 	jp	P, 00104$
                            937 ;src/funciones.c:192: healed = a->defense;
   7345 DD 5E FD      [19]  938 	ld	e, -3 (ix)
   7348 18 05         [12]  939 	jr	00105$
   734A                     940 00104$:
                            941 ;src/funciones.c:194: healed = a->max_energy - a->energy;
   734A 7B            [ 4]  942 	ld	a, e
   734B DD 96 FE      [19]  943 	sub	a, -2 (ix)
   734E 5F            [ 4]  944 	ld	e, a
   734F                     945 00105$:
                            946 ;src/funciones.c:196: a->energy = a->energy + healed;
   734F DD 7E FE      [19]  947 	ld	a, -2 (ix)
   7352 83            [ 4]  948 	add	a, e
   7353 FD 77 00      [19]  949 	ld	0 (iy), a
                            950 ;src/funciones.c:198: if (healed) {
   7356 7B            [ 4]  951 	ld	a, e
   7357 B7            [ 4]  952 	or	a, a
   7358 28 2E         [12]  953 	jr	Z,00108$
                            954 ;src/funciones.c:199: sprintf(temp, "%-9s %c %02dHP",a->name, 240,healed);
   735A 16 00         [ 7]  955 	ld	d, #0x00
   735C 21 02 00      [10]  956 	ld	hl, #0x0002
   735F 39            [11]  957 	add	hl, sp
   7360 E5            [11]  958 	push	hl
   7361 FD E1         [14]  959 	pop	iy
   7363 E5            [11]  960 	push	hl
   7364 D5            [11]  961 	push	de
   7365 11 F0 00      [10]  962 	ld	de, #0x00f0
   7368 D5            [11]  963 	push	de
   7369 C5            [11]  964 	push	bc
   736A 01 8D 73      [10]  965 	ld	bc, #___str_6
   736D C5            [11]  966 	push	bc
   736E FD E5         [15]  967 	push	iy
   7370 CD F7 79      [17]  968 	call	_sprintf
   7373 21 0A 00      [10]  969 	ld	hl, #10
   7376 39            [11]  970 	add	hl, sp
   7377 F9            [ 6]  971 	ld	sp, hl
   7378 E1            [10]  972 	pop	hl
                            973 ;src/funciones.c:200: printConsole(temp, pen, bg);
   7379 4D            [ 4]  974 	ld	c, l
   737A 44            [ 4]  975 	ld	b, h
   737B DD 66 E6      [19]  976 	ld	h, -26 (ix)
   737E DD 6E E5      [19]  977 	ld	l, -27 (ix)
   7381 E5            [11]  978 	push	hl
   7382 C5            [11]  979 	push	bc
   7383 CD 2B 71      [17]  980 	call	_printConsole
   7386 F1            [10]  981 	pop	af
   7387 F1            [10]  982 	pop	af
   7388                     983 00108$:
   7388 DD F9         [10]  984 	ld	sp, ix
   738A DD E1         [14]  985 	pop	ix
   738C C9            [10]  986 	ret
   738D                     987 ___str_6:
   738D 25 2D 39 73 20 25   988 	.ascii "%-9s %c %02dHP"
        63 20 25 30 32 64
        48 50
   739B 00                  989 	.db 0x00
                            990 ;src/funciones.c:204: void drawPotion(){
                            991 ;	---------------------------------
                            992 ; Function drawPotion
                            993 ; ---------------------------------
   739C                     994 _drawPotion::
                            995 ;src/funciones.c:205: cpct_drawSpriteMasked (G_pocion, cpctm_screenPtr (CPCT_VMEM_START, 28, 144), 2,16);
   739C 21 02 10      [10]  996 	ld	hl, #0x1002
   739F E5            [11]  997 	push	hl
   73A0 21 BC C5      [10]  998 	ld	hl, #0xc5bc
   73A3 E5            [11]  999 	push	hl
   73A4 21 82 6D      [10] 1000 	ld	hl, #_G_pocion
   73A7 E5            [11] 1001 	push	hl
   73A8 CD 73 79      [17] 1002 	call	_cpct_drawSpriteMasked
   73AB C9            [10] 1003 	ret
                           1004 	.area _CODE
                           1005 	.area _INITIALIZER
                           1006 	.area _CABS (ABS)
