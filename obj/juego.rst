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
                             26 	.globl _cpct_etm_setTileset2x4
                             27 	.globl _cpct_etm_drawTileBox2x4
                             28 	.globl _cpct_getRandom_mxor_u8
                             29 	.globl _cpct_getScreenPtr
                             30 	.globl _cpct_waitVSYNC
                             31 	.globl _cpct_drawStringM1
                             32 	.globl _cpct_setDrawCharM1
                             33 	.globl _cpct_drawSpriteMasked
                             34 	.globl _cpct_drawSprite
                             35 	.globl _cpct_drawSolidBox
                             36 	.globl _cpct_px2byteM1
                             37 	.globl _cpct_isAnyKeyPressed_f
                             38 	.globl _cpct_isKeyPressed
                             39 	.globl _cpct_scanKeyboard_f
                             40 	.globl _cpct_memcpy
                             41 	.globl _cpct_memset
                             42 	.globl _cursorConsola
                             43 ;--------------------------------------------------------
                             44 ; special function registers
                             45 ;--------------------------------------------------------
                             46 ;--------------------------------------------------------
                             47 ; ram data
                             48 ;--------------------------------------------------------
                             49 	.area _DATA
   7EB8                      50 _cursorConsola::
   7EB8                      51 	.ds 1
                             52 ;--------------------------------------------------------
                             53 ; ram data
                             54 ;--------------------------------------------------------
                             55 	.area _INITIALIZED
                             56 ;--------------------------------------------------------
                             57 ; absolute external ram data
                             58 ;--------------------------------------------------------
                             59 	.area _DABS (ABS)
                             60 ;--------------------------------------------------------
                             61 ; global & static initialisations
                             62 ;--------------------------------------------------------
                             63 	.area _HOME
                             64 	.area _GSINIT
                             65 	.area _GSFINAL
                             66 	.area _GSINIT
                             67 ;--------------------------------------------------------
                             68 ; Home
                             69 ;--------------------------------------------------------
                             70 	.area _HOME
                             71 	.area _HOME
                             72 ;--------------------------------------------------------
                             73 ; code
                             74 ;--------------------------------------------------------
                             75 	.area _CODE
                             76 ;src/juego.c:22: u8 abs (i8 valor){
                             77 ;	---------------------------------
                             78 ; Function abs
                             79 ; ---------------------------------
   5EBF                      80 _abs::
                             81 ;src/juego.c:23: return (valor > 0 ? valor : -valor);
   5EBF AF            [ 4]   82 	xor	a, a
   5EC0 FD 21 02 00   [14]   83 	ld	iy, #2
   5EC4 FD 39         [15]   84 	add	iy, sp
   5EC6 FD 96 00      [19]   85 	sub	a, 0 (iy)
   5EC9 E2 CE 5E      [10]   86 	jp	PO, 00109$
   5ECC EE 80         [ 7]   87 	xor	a, #0x80
   5ECE                      88 00109$:
   5ECE F2 DB 5E      [10]   89 	jp	P, 00103$
   5ED1 FD 21 02 00   [14]   90 	ld	iy, #2
   5ED5 FD 39         [15]   91 	add	iy, sp
   5ED7 FD 6E 00      [19]   92 	ld	l, 0 (iy)
   5EDA C9            [10]   93 	ret
   5EDB                      94 00103$:
   5EDB AF            [ 4]   95 	xor	a, a
   5EDC FD 21 02 00   [14]   96 	ld	iy, #2
   5EE0 FD 39         [15]   97 	add	iy, sp
   5EE2 FD 96 00      [19]   98 	sub	a, 0 (iy)
   5EE5 6F            [ 4]   99 	ld	l, a
   5EE6 C9            [10]  100 	ret
                            101 ;src/juego.c:26: void pausa() {
                            102 ;	---------------------------------
                            103 ; Function pausa
                            104 ; ---------------------------------
   5EE7                     105 _pausa::
                            106 ;src/juego.c:29: for (i = 0; i < 32768 /*16384*/; i++)
   5EE7 01 00 80      [10]  107 	ld	bc, #0x8000
   5EEA                     108 00104$:
   5EEA 59            [ 4]  109 	ld	e, c
   5EEB 50            [ 4]  110 	ld	d, b
   5EEC 1B            [ 6]  111 	dec	de
   5EED 4B            [ 4]  112 	ld	c, e
   5EEE 7A            [ 4]  113 	ld	a,d
   5EEF 47            [ 4]  114 	ld	b,a
   5EF0 B3            [ 4]  115 	or	a,e
   5EF1 20 F7         [12]  116 	jr	NZ,00104$
   5EF3 C9            [10]  117 	ret
                            118 ;src/juego.c:33: void pausaTecladoLibre(){
                            119 ;	---------------------------------
                            120 ; Function pausaTecladoLibre
                            121 ; ---------------------------------
   5EF4                     122 _pausaTecladoLibre::
                            123 ;src/juego.c:34: while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
   5EF4                     124 00101$:
   5EF4 CD 4D 71      [17]  125 	call	_cpct_isAnyKeyPressed_f
   5EF7 7D            [ 4]  126 	ld	a, l
   5EF8 B7            [ 4]  127 	or	a, a
   5EF9 C8            [11]  128 	ret	Z
                            129 ;src/juego.c:35: cpct_scanKeyboard_f();
   5EFA CD 77 6D      [17]  130 	call	_cpct_scanKeyboard_f
   5EFD 18 F5         [12]  131 	jr	00101$
                            132 ;src/juego.c:39: void dibujarMarco (){
                            133 ;	---------------------------------
                            134 ; Function dibujarMarco
                            135 ; ---------------------------------
   5EFF                     136 _dibujarMarco::
   5EFF DD E5         [15]  137 	push	ix
   5F01 DD 21 00 00   [14]  138 	ld	ix,#0
   5F05 DD 39         [15]  139 	add	ix,sp
   5F07 F5            [11]  140 	push	af
   5F08 F5            [11]  141 	push	af
                            142 ;src/juego.c:44: tile = (u8*) &G_tile_cruzada[0];
   5F09 DD 36 FC 14   [19]  143 	ld	-4 (ix), #<(_G_tile_cruzada)
   5F0D DD 36 FD 6D   [19]  144 	ld	-3 (ix), #>(_G_tile_cruzada)
                            145 ;src/juego.c:45: if ((nivel/10) == 1)
   5F11 3E 0A         [ 7]  146 	ld	a, #0x0a
   5F13 F5            [11]  147 	push	af
   5F14 33            [ 6]  148 	inc	sp
   5F15 3A 8E 7E      [13]  149 	ld	a, (_nivel)
   5F18 F5            [11]  150 	push	af
   5F19 33            [ 6]  151 	inc	sp
   5F1A CD C4 6F      [17]  152 	call	__divuchar
   5F1D F1            [10]  153 	pop	af
   5F1E 2D            [ 4]  154 	dec	l
   5F1F 20 08         [12]  155 	jr	NZ,00114$
                            156 ;src/juego.c:46: tile = (u8*) &G_tile_cruzada[0];
   5F21 DD 36 FC 14   [19]  157 	ld	-4 (ix), #<(_G_tile_cruzada)
   5F25 DD 36 FD 6D   [19]  158 	ld	-3 (ix), #>(_G_tile_cruzada)
                            159 ;src/juego.c:50: for (i=0; i < 80; i += 4) {
   5F29                     160 00114$:
   5F29 06 00         [ 7]  161 	ld	b, #0x00
   5F2B                     162 00107$:
                            163 ;src/juego.c:51: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,   0), 4, 16);
   5F2B C5            [11]  164 	push	bc
   5F2C AF            [ 4]  165 	xor	a, a
   5F2D F5            [11]  166 	push	af
   5F2E 33            [ 6]  167 	inc	sp
   5F2F C5            [11]  168 	push	bc
   5F30 33            [ 6]  169 	inc	sp
   5F31 21 00 C0      [10]  170 	ld	hl, #0xc000
   5F34 E5            [11]  171 	push	hl
   5F35 CD 85 72      [17]  172 	call	_cpct_getScreenPtr
   5F38 C1            [10]  173 	pop	bc
   5F39 DD 7E FC      [19]  174 	ld	a, -4 (ix)
   5F3C DD 77 FE      [19]  175 	ld	-2 (ix), a
   5F3F DD 7E FD      [19]  176 	ld	a, -3 (ix)
   5F42 DD 77 FF      [19]  177 	ld	-1 (ix), a
   5F45 C5            [11]  178 	push	bc
   5F46 11 04 10      [10]  179 	ld	de, #0x1004
   5F49 D5            [11]  180 	push	de
   5F4A E5            [11]  181 	push	hl
   5F4B DD 6E FE      [19]  182 	ld	l,-2 (ix)
   5F4E DD 66 FF      [19]  183 	ld	h,-1 (ix)
   5F51 E5            [11]  184 	push	hl
   5F52 CD 1D 6E      [17]  185 	call	_cpct_drawSprite
   5F55 C1            [10]  186 	pop	bc
                            187 ;src/juego.c:52: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i, 176), 4, 16);
   5F56 C5            [11]  188 	push	bc
   5F57 3E B0         [ 7]  189 	ld	a, #0xb0
   5F59 F5            [11]  190 	push	af
   5F5A 33            [ 6]  191 	inc	sp
   5F5B C5            [11]  192 	push	bc
   5F5C 33            [ 6]  193 	inc	sp
   5F5D 21 00 C0      [10]  194 	ld	hl, #0xc000
   5F60 E5            [11]  195 	push	hl
   5F61 CD 85 72      [17]  196 	call	_cpct_getScreenPtr
   5F64 11 04 10      [10]  197 	ld	de, #0x1004
   5F67 D5            [11]  198 	push	de
   5F68 E5            [11]  199 	push	hl
   5F69 DD 6E FE      [19]  200 	ld	l,-2 (ix)
   5F6C DD 66 FF      [19]  201 	ld	h,-1 (ix)
   5F6F E5            [11]  202 	push	hl
   5F70 CD 1D 6E      [17]  203 	call	_cpct_drawSprite
   5F73 C1            [10]  204 	pop	bc
                            205 ;src/juego.c:53: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,  48), 4, 16);
   5F74 C5            [11]  206 	push	bc
   5F75 3E 30         [ 7]  207 	ld	a, #0x30
   5F77 F5            [11]  208 	push	af
   5F78 33            [ 6]  209 	inc	sp
   5F79 C5            [11]  210 	push	bc
   5F7A 33            [ 6]  211 	inc	sp
   5F7B 21 00 C0      [10]  212 	ld	hl, #0xc000
   5F7E E5            [11]  213 	push	hl
   5F7F CD 85 72      [17]  214 	call	_cpct_getScreenPtr
   5F82 11 04 10      [10]  215 	ld	de, #0x1004
   5F85 D5            [11]  216 	push	de
   5F86 E5            [11]  217 	push	hl
   5F87 DD 6E FE      [19]  218 	ld	l,-2 (ix)
   5F8A DD 66 FF      [19]  219 	ld	h,-1 (ix)
   5F8D E5            [11]  220 	push	hl
   5F8E CD 1D 6E      [17]  221 	call	_cpct_drawSprite
   5F91 C1            [10]  222 	pop	bc
                            223 ;src/juego.c:50: for (i=0; i < 80; i += 4) {
   5F92 04            [ 4]  224 	inc	b
   5F93 04            [ 4]  225 	inc	b
   5F94 04            [ 4]  226 	inc	b
   5F95 04            [ 4]  227 	inc	b
   5F96 78            [ 4]  228 	ld	a, b
   5F97 D6 50         [ 7]  229 	sub	a, #0x50
   5F99 38 90         [12]  230 	jr	C,00107$
                            231 ;src/juego.c:56: for (i=16; i < 176; i += 16 ){
   5F9B 06 10         [ 7]  232 	ld	b, #0x10
   5F9D                     233 00109$:
                            234 ;src/juego.c:57: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, 0, i), 4, 16);
   5F9D C5            [11]  235 	push	bc
   5F9E C5            [11]  236 	push	bc
   5F9F 33            [ 6]  237 	inc	sp
   5FA0 AF            [ 4]  238 	xor	a, a
   5FA1 F5            [11]  239 	push	af
   5FA2 33            [ 6]  240 	inc	sp
   5FA3 21 00 C0      [10]  241 	ld	hl, #0xc000
   5FA6 E5            [11]  242 	push	hl
   5FA7 CD 85 72      [17]  243 	call	_cpct_getScreenPtr
   5FAA 11 04 10      [10]  244 	ld	de, #0x1004
   5FAD D5            [11]  245 	push	de
   5FAE E5            [11]  246 	push	hl
   5FAF DD 6E FE      [19]  247 	ld	l,-2 (ix)
   5FB2 DD 66 FF      [19]  248 	ld	h,-1 (ix)
   5FB5 E5            [11]  249 	push	hl
   5FB6 CD 1D 6E      [17]  250 	call	_cpct_drawSprite
   5FB9 C1            [10]  251 	pop	bc
                            252 ;src/juego.c:58: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,76, i), 4, 16);	
   5FBA C5            [11]  253 	push	bc
   5FBB C5            [11]  254 	push	bc
   5FBC 33            [ 6]  255 	inc	sp
   5FBD 3E 4C         [ 7]  256 	ld	a, #0x4c
   5FBF F5            [11]  257 	push	af
   5FC0 33            [ 6]  258 	inc	sp
   5FC1 21 00 C0      [10]  259 	ld	hl, #0xc000
   5FC4 E5            [11]  260 	push	hl
   5FC5 CD 85 72      [17]  261 	call	_cpct_getScreenPtr
   5FC8 11 04 10      [10]  262 	ld	de, #0x1004
   5FCB D5            [11]  263 	push	de
   5FCC E5            [11]  264 	push	hl
   5FCD DD 6E FE      [19]  265 	ld	l,-2 (ix)
   5FD0 DD 66 FF      [19]  266 	ld	h,-1 (ix)
   5FD3 E5            [11]  267 	push	hl
   5FD4 CD 1D 6E      [17]  268 	call	_cpct_drawSprite
   5FD7 C1            [10]  269 	pop	bc
                            270 ;src/juego.c:59: if (i>63)
   5FD8 3E 3F         [ 7]  271 	ld	a, #0x3f
   5FDA 90            [ 4]  272 	sub	a, b
   5FDB 30 1E         [12]  273 	jr	NC,00110$
                            274 ;src/juego.c:60: cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,40, i), 4, 16);
   5FDD C5            [11]  275 	push	bc
   5FDE C5            [11]  276 	push	bc
   5FDF 33            [ 6]  277 	inc	sp
   5FE0 3E 28         [ 7]  278 	ld	a, #0x28
   5FE2 F5            [11]  279 	push	af
   5FE3 33            [ 6]  280 	inc	sp
   5FE4 21 00 C0      [10]  281 	ld	hl, #0xc000
   5FE7 E5            [11]  282 	push	hl
   5FE8 CD 85 72      [17]  283 	call	_cpct_getScreenPtr
   5FEB 11 04 10      [10]  284 	ld	de, #0x1004
   5FEE D5            [11]  285 	push	de
   5FEF E5            [11]  286 	push	hl
   5FF0 DD 6E FE      [19]  287 	ld	l,-2 (ix)
   5FF3 DD 66 FF      [19]  288 	ld	h,-1 (ix)
   5FF6 E5            [11]  289 	push	hl
   5FF7 CD 1D 6E      [17]  290 	call	_cpct_drawSprite
   5FFA C1            [10]  291 	pop	bc
   5FFB                     292 00110$:
                            293 ;src/juego.c:56: for (i=16; i < 176; i += 16 ){
   5FFB 78            [ 4]  294 	ld	a, b
   5FFC C6 10         [ 7]  295 	add	a, #0x10
   5FFE 47            [ 4]  296 	ld	b,a
   5FFF D6 B0         [ 7]  297 	sub	a, #0xb0
   6001 38 9A         [12]  298 	jr	C,00109$
                            299 ;src/juego.c:65: cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
   6003 21 00 00      [10]  300 	ld	hl, #0x0000
   6006 E5            [11]  301 	push	hl
   6007 2E 00         [ 7]  302 	ld	l, #0x00
   6009 E5            [11]  303 	push	hl
   600A CD 7E 71      [17]  304 	call	_cpct_px2byteM1
   600D F1            [10]  305 	pop	af
   600E F1            [10]  306 	pop	af
   600F 45            [ 4]  307 	ld	b, l
   6010 21 22 80      [10]  308 	ld	hl, #0x8022
   6013 E5            [11]  309 	push	hl
   6014 C5            [11]  310 	push	bc
   6015 33            [ 6]  311 	inc	sp
   6016 21 5B C2      [10]  312 	ld	hl, #0xc25b
   6019 E5            [11]  313 	push	hl
   601A CD AB 71      [17]  314 	call	_cpct_drawSolidBox
   601D DD F9         [10]  315 	ld	sp,ix
   601F DD E1         [14]  316 	pop	ix
   6021 C9            [10]  317 	ret
                            318 ;src/juego.c:68: void dibujarEscenario(){
                            319 ;	---------------------------------
                            320 ; Function dibujarEscenario
                            321 ; ---------------------------------
   6022                     322 _dibujarEscenario::
                            323 ;src/juego.c:71: cpct_etm_setTileset2x4(tileset1);
   6022 21 B4 53      [10]  324 	ld	hl, #_tileset1
   6025 CD A1 6F      [17]  325 	call	_cpct_etm_setTileset2x4
                            326 ;src/juego.c:72: if (nivel > 10)
   6028 3E 0A         [ 7]  327 	ld	a, #0x0a
   602A FD 21 8E 7E   [14]  328 	ld	iy, #_nivel
   602E FD 96 00      [19]  329 	sub	a, 0 (iy)
   6031 30 06         [12]  330 	jr	NC,00102$
                            331 ;src/juego.c:73: cpct_etm_setTileset2x4(tileset1);
   6033 21 B4 53      [10]  332 	ld	hl, #_tileset1
   6036 CD A1 6F      [17]  333 	call	_cpct_etm_setTileset2x4
   6039                     334 00102$:
                            335 ;src/juego.c:75: mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
   6039 01 00 40      [10]  336 	ld	bc, #_g_mapa01+0
   603C 21 8E 7E      [10]  337 	ld	hl,#_nivel + 0
   603F 5E            [ 7]  338 	ld	e, (hl)
   6040 16 00         [ 7]  339 	ld	d, #0x00
   6042 1B            [ 6]  340 	dec	de
   6043 6B            [ 4]  341 	ld	l, e
   6044 62            [ 4]  342 	ld	h, d
   6045 29            [11]  343 	add	hl, hl
   6046 19            [11]  344 	add	hl, de
   6047 29            [11]  345 	add	hl, hl
   6048 19            [11]  346 	add	hl, de
   6049 29            [11]  347 	add	hl, hl
   604A 19            [11]  348 	add	hl, de
   604B 29            [11]  349 	add	hl, hl
   604C 19            [11]  350 	add	hl, de
   604D 29            [11]  351 	add	hl, hl
   604E 19            [11]  352 	add	hl, de
   604F 29            [11]  353 	add	hl, hl
   6050 29            [11]  354 	add	hl, hl
   6051 29            [11]  355 	add	hl, hl
   6052 09            [11]  356 	add	hl, bc
                            357 ;src/juego.c:77: cpct_etm_drawTilemap2x4 ( g_mapa01_W, g_mapa01_H , INICIO_AREA_JUEGO, mapa);
   6053 E5            [11]  358 	push	hl
   6054 21 84 C2      [10]  359 	ld	hl, #0xc284
   6057 E5            [11]  360 	push	hl
   6058 21 1C 12      [10]  361 	ld	hl, #0x121c
   605B E5            [11]  362 	push	hl
   605C 2E 00         [ 7]  363 	ld	l, #0x00
   605E E5            [11]  364 	push	hl
   605F AF            [ 4]  365 	xor	a, a
   6060 F5            [11]  366 	push	af
   6061 33            [ 6]  367 	inc	sp
   6062 CD 12 6F      [17]  368 	call	_cpct_etm_drawTileBox2x4
   6065 C9            [10]  369 	ret
                            370 ;src/juego.c:80: void initPlayer(){
                            371 ;	---------------------------------
                            372 ; Function initPlayer
                            373 ; ---------------------------------
   6066                     374 _initPlayer::
                            375 ;src/juego.c:81: strcpy(entidad[0].name,"Don Mendo");
   6066 11 52 7E      [10]  376 	ld	de, #_entidad
   6069 21 A1 60      [10]  377 	ld	hl, #___str_0
   606C AF            [ 4]  378 	xor	a, a
   606D                     379 00103$:
   606D BE            [ 7]  380 	cp	a, (hl)
   606E ED A0         [16]  381 	ldi
   6070 20 FB         [12]  382 	jr	NZ, 00103$
                            383 ;src/juego.c:82: entidad[0].max_energy = 99;
   6072 21 5D 7E      [10]  384 	ld	hl, #_entidad + 11
   6075 36 63         [10]  385 	ld	(hl), #0x63
                            386 ;src/juego.c:83: entidad[0].energy = entidad[0].max_energy;
   6077 01 5C 7E      [10]  387 	ld	bc, #_entidad + 10
   607A 7E            [ 7]  388 	ld	a, (hl)
   607B 02            [ 7]  389 	ld	(bc), a
                            390 ;src/juego.c:84: entidad[0].attack = 30;
   607C 21 5E 7E      [10]  391 	ld	hl, #(_entidad + 0x000c)
   607F 36 1E         [10]  392 	ld	(hl), #0x1e
                            393 ;src/juego.c:85: entidad[0].force = 6;
   6081 21 5F 7E      [10]  394 	ld	hl, #(_entidad + 0x000d)
   6084 36 06         [10]  395 	ld	(hl), #0x06
                            396 ;src/juego.c:86: entidad[0].defense = 15;
   6086 21 60 7E      [10]  397 	ld	hl, #(_entidad + 0x000e)
   6089 36 0F         [10]  398 	ld	(hl), #0x0f
                            399 ;src/juego.c:87: entidad[0].pos_x = 8;
   608B 21 61 7E      [10]  400 	ld	hl, #(_entidad + 0x000f)
   608E 36 08         [10]  401 	ld	(hl), #0x08
                            402 ;src/juego.c:88: entidad[0].pos_x_ant = 8;
   6090 21 62 7E      [10]  403 	ld	hl, #(_entidad + 0x0010)
   6093 36 08         [10]  404 	ld	(hl), #0x08
                            405 ;src/juego.c:89: entidad[0].pos_y = 24;
   6095 21 63 7E      [10]  406 	ld	hl, #(_entidad + 0x0011)
   6098 36 18         [10]  407 	ld	(hl), #0x18
                            408 ;src/juego.c:90: entidad[0].sprite = (u8*) &G_mendo[0];
   609A 21 54 6B      [10]  409 	ld	hl, #_G_mendo
   609D 22 64 7E      [16]  410 	ld	((_entidad + 0x0012)), hl
   60A0 C9            [10]  411 	ret
   60A1                     412 ___str_0:
   60A1 44 6F 6E 20 4D 65   413 	.ascii "Don Mendo"
        6E 64 6F
   60AA 00                  414 	.db 0x00
                            415 ;src/juego.c:93: void initNivel(){
                            416 ;	---------------------------------
                            417 ; Function initNivel
                            418 ; ---------------------------------
   60AB                     419 _initNivel::
                            420 ;src/juego.c:95: entidad[1].max_energy = 0;
   60AB 21 71 7E      [10]  421 	ld	hl, #(_entidad + 0x001f)
   60AE 36 00         [10]  422 	ld	(hl), #0x00
                            423 ;src/juego.c:96: entidad[1].pos_x_ant = 4;
   60B0 21 76 7E      [10]  424 	ld	hl, #(_entidad + 0x0024)
   60B3 36 04         [10]  425 	ld	(hl), #0x04
                            426 ;src/juego.c:97: entidad[2].max_energy = 0;
   60B5 21 85 7E      [10]  427 	ld	hl, #(_entidad + 0x0033)
   60B8 36 00         [10]  428 	ld	(hl), #0x00
                            429 ;src/juego.c:98: entidad[2].pos_x_ant = 4;
   60BA 21 8A 7E      [10]  430 	ld	hl, #(_entidad + 0x0038)
   60BD 36 04         [10]  431 	ld	(hl), #0x04
                            432 ;src/juego.c:102: if (nivel == 1) {
   60BF 3A 8E 7E      [13]  433 	ld	a,(#_nivel + 0)
   60C2 3D            [ 4]  434 	dec	a
   60C3 20 0F         [12]  435 	jr	NZ,00102$
                            436 ;src/juego.c:103: cpct_memcpy (&entidad[1],&SoldadoArabe,sizeof(TStats));
   60C5 21 14 00      [10]  437 	ld	hl, #0x0014
   60C8 E5            [11]  438 	push	hl
   60C9 21 97 5C      [10]  439 	ld	hl, #_SoldadoArabe
   60CC E5            [11]  440 	push	hl
   60CD 21 66 7E      [10]  441 	ld	hl, #(_entidad + 0x0014)
   60D0 E5            [11]  442 	push	hl
   60D1 CD 68 71      [17]  443 	call	_cpct_memcpy
   60D4                     444 00102$:
                            445 ;src/juego.c:105: if (nivel == 2) {
   60D4 3A 8E 7E      [13]  446 	ld	a,(#_nivel + 0)
   60D7 D6 02         [ 7]  447 	sub	a, #0x02
   60D9 20 23         [12]  448 	jr	NZ,00104$
                            449 ;src/juego.c:106: cpct_memcpy (&entidad[1],&SoldadoArabe,sizeof(TStats));
   60DB 21 14 00      [10]  450 	ld	hl, #0x0014
   60DE E5            [11]  451 	push	hl
   60DF 21 97 5C      [10]  452 	ld	hl, #_SoldadoArabe
   60E2 E5            [11]  453 	push	hl
   60E3 21 66 7E      [10]  454 	ld	hl, #(_entidad + 0x0014)
   60E6 E5            [11]  455 	push	hl
   60E7 CD 68 71      [17]  456 	call	_cpct_memcpy
                            457 ;src/juego.c:107: cpct_memcpy (&entidad[2],&SoldadoArabe,sizeof(TStats));
   60EA 21 14 00      [10]  458 	ld	hl, #0x0014
   60ED E5            [11]  459 	push	hl
   60EE 21 97 5C      [10]  460 	ld	hl, #_SoldadoArabe
   60F1 E5            [11]  461 	push	hl
   60F2 21 7A 7E      [10]  462 	ld	hl, #(_entidad + 0x0028)
   60F5 E5            [11]  463 	push	hl
   60F6 CD 68 71      [17]  464 	call	_cpct_memcpy
                            465 ;src/juego.c:108: entidad[2].pos_x = 36;
   60F9 21 89 7E      [10]  466 	ld	hl, #(_entidad + 0x0037)
   60FC 36 24         [10]  467 	ld	(hl), #0x24
   60FE                     468 00104$:
                            469 ;src/juego.c:111: entidad[1].pos_y = 32;
   60FE 21 77 7E      [10]  470 	ld	hl, #(_entidad + 0x0025)
   6101 36 20         [10]  471 	ld	(hl), #0x20
                            472 ;src/juego.c:112: entidad[2].pos_y = 40;
   6103 21 8B 7E      [10]  473 	ld	hl, #(_entidad + 0x0039)
   6106 36 28         [10]  474 	ld	(hl), #0x28
                            475 ;src/juego.c:113: entidad[1].energy = entidad[1].max_energy;
   6108 01 70 7E      [10]  476 	ld	bc, #_entidad + 30
   610B 3A 71 7E      [13]  477 	ld	a, (#(_entidad + 0x001f) + 0)
   610E 02            [ 7]  478 	ld	(bc), a
                            479 ;src/juego.c:114: entidad[2].energy = entidad[2].max_energy;
   610F 01 84 7E      [10]  480 	ld	bc, #_entidad + 50
   6112 3A 85 7E      [13]  481 	ld	a, (#(_entidad + 0x0033) + 0)
   6115 02            [ 7]  482 	ld	(bc), a
   6116 C9            [10]  483 	ret
                            484 ;src/juego.c:117: void printStats(TStats *a) {
                            485 ;	---------------------------------
                            486 ; Function printStats
                            487 ; ---------------------------------
   6117                     488 _printStats::
   6117 DD E5         [15]  489 	push	ix
   6119 DD 21 00 00   [14]  490 	ld	ix,#0
   611D DD 39         [15]  491 	add	ix,sp
   611F 21 D6 FF      [10]  492 	ld	hl, #-42
   6122 39            [11]  493 	add	hl, sp
   6123 F9            [ 6]  494 	ld	sp, hl
                            495 ;src/juego.c:120: cpct_setDrawCharM1(2, 0);
   6124 21 02 00      [10]  496 	ld	hl, #0x0002
   6127 E5            [11]  497 	push	hl
   6128 CD A5 72      [17]  498 	call	_cpct_setDrawCharM1
                            499 ;src/juego.c:121: sprintf(temp, "                                    ");
   612B 11 B7 61      [10]  500 	ld	de, #___str_1+0
   612E 21 00 00      [10]  501 	ld	hl, #0x0000
   6131 39            [11]  502 	add	hl, sp
   6132 DD 75 FE      [19]  503 	ld	-2 (ix), l
   6135 DD 74 FF      [19]  504 	ld	-1 (ix), h
   6138 D5            [11]  505 	push	de
   6139 E5            [11]  506 	push	hl
   613A CD DF 70      [17]  507 	call	_sprintf
   613D F1            [10]  508 	pop	af
   613E F1            [10]  509 	pop	af
                            510 ;src/juego.c:122: if (a->energy)
   613F DD 4E 04      [19]  511 	ld	c,4 (ix)
   6142 DD 46 05      [19]  512 	ld	b,5 (ix)
   6145 C5            [11]  513 	push	bc
   6146 FD E1         [14]  514 	pop	iy
   6148 FD 5E 0A      [19]  515 	ld	e, 10 (iy)
   614B 7B            [ 4]  516 	ld	a, e
   614C B7            [ 4]  517 	or	a, a
   614D 28 45         [12]  518 	jr	Z,00102$
                            519 ;src/juego.c:123: sprintf(temp, "%-9s=> HP:%02d. ATT: %02d. DEF: %02d",a->name, a->energy,a->attack,a->defense);
   614F C5            [11]  520 	push	bc
   6150 FD E1         [14]  521 	pop	iy
   6152 FD 6E 0E      [19]  522 	ld	l, 14 (iy)
   6155 DD 75 FC      [19]  523 	ld	-4 (ix), l
   6158 DD 36 FD 00   [19]  524 	ld	-3 (ix), #0x00
   615C C5            [11]  525 	push	bc
   615D FD E1         [14]  526 	pop	iy
   615F FD 6E 0C      [19]  527 	ld	l, 12 (iy)
   6162 DD 75 FA      [19]  528 	ld	-6 (ix), l
   6165 DD 36 FB 00   [19]  529 	ld	-5 (ix), #0x00
   6169 16 00         [ 7]  530 	ld	d, #0x00
   616B DD 6E FE      [19]  531 	ld	l,-2 (ix)
   616E DD 66 FF      [19]  532 	ld	h,-1 (ix)
   6171 E5            [11]  533 	push	hl
   6172 FD E1         [14]  534 	pop	iy
   6174 C5            [11]  535 	push	bc
   6175 DD 6E FC      [19]  536 	ld	l,-4 (ix)
   6178 DD 66 FD      [19]  537 	ld	h,-3 (ix)
   617B E5            [11]  538 	push	hl
   617C DD 6E FA      [19]  539 	ld	l,-6 (ix)
   617F DD 66 FB      [19]  540 	ld	h,-5 (ix)
   6182 E5            [11]  541 	push	hl
   6183 D5            [11]  542 	push	de
   6184 C5            [11]  543 	push	bc
   6185 21 DC 61      [10]  544 	ld	hl, #___str_2
   6188 E5            [11]  545 	push	hl
   6189 FD E5         [15]  546 	push	iy
   618B CD DF 70      [17]  547 	call	_sprintf
   618E 21 0C 00      [10]  548 	ld	hl, #12
   6191 39            [11]  549 	add	hl, sp
   6192 F9            [ 6]  550 	ld	sp, hl
   6193 C1            [10]  551 	pop	bc
   6194                     552 00102$:
                            553 ;src/juego.c:125: cpct_drawStringM1(temp, cpct_getScreenPtr(CPCT_VMEM_START, 4, a->pos_y));
   6194 C5            [11]  554 	push	bc
   6195 FD E1         [14]  555 	pop	iy
   6197 FD 46 11      [19]  556 	ld	b, 17 (iy)
   619A C5            [11]  557 	push	bc
   619B 33            [ 6]  558 	inc	sp
   619C 3E 04         [ 7]  559 	ld	a, #0x04
   619E F5            [11]  560 	push	af
   619F 33            [ 6]  561 	inc	sp
   61A0 21 00 C0      [10]  562 	ld	hl, #0xc000
   61A3 E5            [11]  563 	push	hl
   61A4 CD 85 72      [17]  564 	call	_cpct_getScreenPtr
   61A7 DD 4E FE      [19]  565 	ld	c,-2 (ix)
   61AA DD 46 FF      [19]  566 	ld	b,-1 (ix)
   61AD E5            [11]  567 	push	hl
   61AE C5            [11]  568 	push	bc
   61AF CD ED 6D      [17]  569 	call	_cpct_drawStringM1
   61B2 DD F9         [10]  570 	ld	sp, ix
   61B4 DD E1         [14]  571 	pop	ix
   61B6 C9            [10]  572 	ret
   61B7                     573 ___str_1:
   61B7 20 20 20 20 20 20   574 	.ascii "                                    "
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 20 20 20 20 20
   61DB 00                  575 	.db 0x00
   61DC                     576 ___str_2:
   61DC 25 2D 39 73 3D 3E   577 	.ascii "%-9s=> HP:%02d. ATT: %02d. DEF: %02d"
        20 48 50 3A 25 30
        32 64 2E 20 41 54
        54 3A 20 25 30 32
        64 2E 20 44 45 46
        3A 20 25 30 32 64
   6200 00                  578 	.db 0x00
                            579 ;src/juego.c:128: void printLevel() {
                            580 ;	---------------------------------
                            581 ; Function printLevel
                            582 ; ---------------------------------
   6201                     583 _printLevel::
   6201 DD E5         [15]  584 	push	ix
   6203 DD 21 00 00   [14]  585 	ld	ix,#0
   6207 DD 39         [15]  586 	add	ix,sp
   6209 21 D8 FF      [10]  587 	ld	hl, #-40
   620C 39            [11]  588 	add	hl, sp
   620D F9            [ 6]  589 	ld	sp, hl
                            590 ;src/juego.c:131: sprintf(temp, "LEVEL: %02d",nivel);
   620E 21 8E 7E      [10]  591 	ld	hl,#_nivel + 0
   6211 5E            [ 7]  592 	ld	e, (hl)
   6212 16 00         [ 7]  593 	ld	d, #0x00
   6214 21 00 00      [10]  594 	ld	hl, #0x0000
   6217 39            [11]  595 	add	hl, sp
   6218 4D            [ 4]  596 	ld	c, l
   6219 44            [ 4]  597 	ld	b, h
   621A E5            [11]  598 	push	hl
   621B D5            [11]  599 	push	de
   621C 11 3E 62      [10]  600 	ld	de, #___str_3
   621F D5            [11]  601 	push	de
   6220 C5            [11]  602 	push	bc
   6221 CD DF 70      [17]  603 	call	_sprintf
   6224 21 06 00      [10]  604 	ld	hl, #6
   6227 39            [11]  605 	add	hl, sp
   6228 F9            [ 6]  606 	ld	sp, hl
   6229 01 02 00      [10]  607 	ld	bc, #0x0002
   622C C5            [11]  608 	push	bc
   622D CD A5 72      [17]  609 	call	_cpct_setDrawCharM1
   6230 E1            [10]  610 	pop	hl
                            611 ;src/juego.c:133: cpct_drawStringM1(temp, cpctm_screenPtr(CPCT_VMEM_START, 4, 16));
   6231 01 A4 C0      [10]  612 	ld	bc, #0xc0a4
   6234 C5            [11]  613 	push	bc
   6235 E5            [11]  614 	push	hl
   6236 CD ED 6D      [17]  615 	call	_cpct_drawStringM1
   6239 DD F9         [10]  616 	ld	sp, ix
   623B DD E1         [14]  617 	pop	ix
   623D C9            [10]  618 	ret
   623E                     619 ___str_3:
   623E 4C 45 56 45 4C 3A   620 	.ascii "LEVEL: %02d"
        20 25 30 32 64
   6249 00                  621 	.db 0x00
                            622 ;src/juego.c:136: void printConsole  (void* string, u8 pen, u8 bground) {
                            623 ;	---------------------------------
                            624 ; Function printConsole
                            625 ; ---------------------------------
   624A                     626 _printConsole::
                            627 ;src/juego.c:137: if (cursorConsola > 175){
   624A 3E AF         [ 7]  628 	ld	a, #0xaf
   624C FD 21 B8 7E   [14]  629 	ld	iy, #_cursorConsola
   6250 FD 96 00      [19]  630 	sub	a, 0 (iy)
   6253 30 25         [12]  631 	jr	NC,00102$
                            632 ;src/juego.c:139: pausa();
   6255 CD E7 5E      [17]  633 	call	_pausa
                            634 ;src/juego.c:140: cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
   6258 21 00 00      [10]  635 	ld	hl, #0x0000
   625B E5            [11]  636 	push	hl
   625C 2E 00         [ 7]  637 	ld	l, #0x00
   625E E5            [11]  638 	push	hl
   625F CD 7E 71      [17]  639 	call	_cpct_px2byteM1
   6262 F1            [10]  640 	pop	af
   6263 F1            [10]  641 	pop	af
   6264 45            [ 4]  642 	ld	b, l
   6265 21 22 80      [10]  643 	ld	hl, #0x8022
   6268 E5            [11]  644 	push	hl
   6269 C5            [11]  645 	push	bc
   626A 33            [ 6]  646 	inc	sp
   626B 21 5B C2      [10]  647 	ld	hl, #0xc25b
   626E E5            [11]  648 	push	hl
   626F CD AB 71      [17]  649 	call	_cpct_drawSolidBox
   6272 F1            [10]  650 	pop	af
   6273 F1            [10]  651 	pop	af
   6274 33            [ 6]  652 	inc	sp
                            653 ;src/juego.c:141: cursorConsola = 64;
   6275 21 B8 7E      [10]  654 	ld	hl,#_cursorConsola + 0
   6278 36 40         [10]  655 	ld	(hl), #0x40
   627A                     656 00102$:
                            657 ;src/juego.c:144: cpct_setDrawCharM1(pen, bground);
   627A 21 05 00      [10]  658 	ld	hl, #5+0
   627D 39            [11]  659 	add	hl, sp
   627E 7E            [ 7]  660 	ld	a, (hl)
   627F F5            [11]  661 	push	af
   6280 33            [ 6]  662 	inc	sp
   6281 21 05 00      [10]  663 	ld	hl, #5+0
   6284 39            [11]  664 	add	hl, sp
   6285 7E            [ 7]  665 	ld	a, (hl)
   6286 F5            [11]  666 	push	af
   6287 33            [ 6]  667 	inc	sp
   6288 CD A5 72      [17]  668 	call	_cpct_setDrawCharM1
                            669 ;src/juego.c:145: cpct_drawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 44, cursorConsola));
   628B 3A B8 7E      [13]  670 	ld	a, (_cursorConsola)
   628E 57            [ 4]  671 	ld	d,a
   628F 1E 2C         [ 7]  672 	ld	e,#0x2c
   6291 D5            [11]  673 	push	de
   6292 21 00 C0      [10]  674 	ld	hl, #0xc000
   6295 E5            [11]  675 	push	hl
   6296 CD 85 72      [17]  676 	call	_cpct_getScreenPtr
   6299 D1            [10]  677 	pop	de
   629A C1            [10]  678 	pop	bc
   629B C5            [11]  679 	push	bc
   629C D5            [11]  680 	push	de
   629D E5            [11]  681 	push	hl
   629E C5            [11]  682 	push	bc
   629F CD ED 6D      [17]  683 	call	_cpct_drawStringM1
                            684 ;src/juego.c:146: cursorConsola +=8;
   62A2 21 B8 7E      [10]  685 	ld	hl, #_cursorConsola
   62A5 7E            [ 7]  686 	ld	a, (hl)
   62A6 C6 08         [ 7]  687 	add	a, #0x08
   62A8 77            [ 7]  688 	ld	(hl), a
   62A9 C9            [10]  689 	ret
                            690 ;src/juego.c:149: void atacar(TStats *a, TStats *b) {
                            691 ;	---------------------------------
                            692 ; Function atacar
                            693 ; ---------------------------------
   62AA                     694 _atacar::
   62AA DD E5         [15]  695 	push	ix
   62AC DD 21 00 00   [14]  696 	ld	ix,#0
   62B0 DD 39         [15]  697 	add	ix,sp
   62B2 21 E6 FF      [10]  698 	ld	hl, #-26
   62B5 39            [11]  699 	add	hl, sp
   62B6 F9            [ 6]  700 	ld	sp, hl
                            701 ;src/juego.c:153: pen = 0;
   62B7 DD 36 FB 00   [19]  702 	ld	-5 (ix), #0x00
                            703 ;src/juego.c:154: bg = 2;
   62BB DD 36 FA 02   [19]  704 	ld	-6 (ix), #0x02
                            705 ;src/juego.c:155: if ((u16) a->sprite == (u16) G_mendo)  {
   62BF DD 4E 04      [19]  706 	ld	c,4 (ix)
   62C2 DD 46 05      [19]  707 	ld	b,5 (ix)
   62C5 69            [ 4]  708 	ld	l, c
   62C6 60            [ 4]  709 	ld	h, b
   62C7 11 12 00      [10]  710 	ld	de, #0x0012
   62CA 19            [11]  711 	add	hl, de
   62CB 5E            [ 7]  712 	ld	e, (hl)
   62CC 23            [ 6]  713 	inc	hl
   62CD 56            [ 7]  714 	ld	d, (hl)
   62CE DD 36 FE 54   [19]  715 	ld	-2 (ix), #<(_G_mendo)
   62D2 DD 36 FF 6B   [19]  716 	ld	-1 (ix), #>(_G_mendo)
   62D6 7B            [ 4]  717 	ld	a, e
   62D7 DD 96 FE      [19]  718 	sub	a, -2 (ix)
   62DA 20 0E         [12]  719 	jr	NZ,00102$
   62DC 7A            [ 4]  720 	ld	a, d
   62DD DD 96 FF      [19]  721 	sub	a, -1 (ix)
   62E0 20 08         [12]  722 	jr	NZ,00102$
                            723 ;src/juego.c:156: pen = 2;
   62E2 DD 36 FB 02   [19]  724 	ld	-5 (ix), #0x02
                            725 ;src/juego.c:157: bg = 0;
   62E6 DD 36 FA 00   [19]  726 	ld	-6 (ix), #0x00
   62EA                     727 00102$:
                            728 ;src/juego.c:161: ataque = a->attack + (2*(cpct_rand()%a->force)) - a->force;
   62EA C5            [11]  729 	push	bc
   62EB FD E1         [14]  730 	pop	iy
   62ED FD 7E 0C      [19]  731 	ld	a, 12 (iy)
   62F0 DD 77 FE      [19]  732 	ld	-2 (ix), a
   62F3 C5            [11]  733 	push	bc
   62F4 CD 15 70      [17]  734 	call	_cpct_getRandom_mxor_u8
   62F7 5D            [ 4]  735 	ld	e, l
   62F8 C1            [10]  736 	pop	bc
   62F9 C5            [11]  737 	push	bc
   62FA FD E1         [14]  738 	pop	iy
   62FC FD 56 0D      [19]  739 	ld	d, 13 (iy)
   62FF C5            [11]  740 	push	bc
   6300 D5            [11]  741 	push	de
   6301 D5            [11]  742 	push	de
   6302 CD A5 6F      [17]  743 	call	__moduchar
   6305 F1            [10]  744 	pop	af
   6306 D1            [10]  745 	pop	de
   6307 C1            [10]  746 	pop	bc
   6308 CB 25         [ 8]  747 	sla	l
   630A DD 7E FE      [19]  748 	ld	a, -2 (ix)
   630D 85            [ 4]  749 	add	a, l
   630E 92            [ 4]  750 	sub	a, d
                            751 ;src/juego.c:162: sprintf(temp, "%-9s ATT %02d",a->name, ataque);
   630F DD 77 FE      [19]  752 	ld	-2 (ix), a
   6312 5F            [ 4]  753 	ld	e, a
   6313 16 00         [ 7]  754 	ld	d, #0x00
   6315 21 00 00      [10]  755 	ld	hl, #0x0000
   6318 39            [11]  756 	add	hl, sp
   6319 DD 75 FC      [19]  757 	ld	-4 (ix), l
   631C DD 74 FD      [19]  758 	ld	-3 (ix), h
   631F D5            [11]  759 	push	de
   6320 C5            [11]  760 	push	bc
   6321 01 B8 63      [10]  761 	ld	bc, #___str_4
   6324 C5            [11]  762 	push	bc
   6325 E5            [11]  763 	push	hl
   6326 CD DF 70      [17]  764 	call	_sprintf
   6329 21 08 00      [10]  765 	ld	hl, #8
   632C 39            [11]  766 	add	hl, sp
   632D F9            [ 6]  767 	ld	sp, hl
                            768 ;src/juego.c:163: printConsole(temp, pen, bg);
   632E DD 4E FC      [19]  769 	ld	c,-4 (ix)
   6331 DD 46 FD      [19]  770 	ld	b,-3 (ix)
   6334 DD 66 FA      [19]  771 	ld	h, -6 (ix)
   6337 DD 6E FB      [19]  772 	ld	l, -5 (ix)
   633A E5            [11]  773 	push	hl
   633B C5            [11]  774 	push	bc
   633C CD 4A 62      [17]  775 	call	_printConsole
   633F F1            [10]  776 	pop	af
   6340 F1            [10]  777 	pop	af
                            778 ;src/juego.c:165: if (ataque < b->energy) {
   6341 DD 4E 06      [19]  779 	ld	c,6 (ix)
   6344 DD 46 07      [19]  780 	ld	b,7 (ix)
   6347 21 0A 00      [10]  781 	ld	hl, #0x000a
   634A 09            [11]  782 	add	hl, bc
   634B 5E            [ 7]  783 	ld	e, (hl)
   634C DD 7E FE      [19]  784 	ld	a, -2 (ix)
   634F 93            [ 4]  785 	sub	a, e
   6350 30 1F         [12]  786 	jr	NC,00104$
                            787 ;src/juego.c:166: b->energy = b->energy - ataque;
   6352 7B            [ 4]  788 	ld	a, e
   6353 DD 96 FE      [19]  789 	sub	a, -2 (ix)
   6356 5F            [ 4]  790 	ld	e, a
   6357 73            [ 7]  791 	ld	(hl), e
                            792 ;src/juego.c:167: sprintf(temp, "%-9s HP=>%02d",b->name, b->energy);
   6358 16 00         [ 7]  793 	ld	d, #0x00
   635A DD 6E FC      [19]  794 	ld	l,-4 (ix)
   635D DD 66 FD      [19]  795 	ld	h,-3 (ix)
   6360 D5            [11]  796 	push	de
   6361 C5            [11]  797 	push	bc
   6362 01 C6 63      [10]  798 	ld	bc, #___str_5
   6365 C5            [11]  799 	push	bc
   6366 E5            [11]  800 	push	hl
   6367 CD DF 70      [17]  801 	call	_sprintf
   636A 21 08 00      [10]  802 	ld	hl, #8
   636D 39            [11]  803 	add	hl, sp
   636E F9            [ 6]  804 	ld	sp, hl
   636F 18 31         [12]  805 	jr	00105$
   6371                     806 00104$:
                            807 ;src/juego.c:169: b->energy = 0;
   6371 36 00         [10]  808 	ld	(hl), #0x00
                            809 ;src/juego.c:170: sprintf(temp, "%-9s DIED! ",b->name, b->energy);
   6373 5E            [ 7]  810 	ld	e, (hl)
   6374 16 00         [ 7]  811 	ld	d, #0x00
   6376 DD 6E FC      [19]  812 	ld	l,-4 (ix)
   6379 DD 66 FD      [19]  813 	ld	h,-3 (ix)
   637C D5            [11]  814 	push	de
   637D C5            [11]  815 	push	bc
   637E 01 D4 63      [10]  816 	ld	bc, #___str_6
   6381 C5            [11]  817 	push	bc
   6382 E5            [11]  818 	push	hl
   6383 CD DF 70      [17]  819 	call	_sprintf
   6386 21 08 00      [10]  820 	ld	hl, #8
   6389 39            [11]  821 	add	hl, sp
   638A F9            [ 6]  822 	ld	sp, hl
                            823 ;src/juego.c:171: printStats(b);
   638B DD 6E 06      [19]  824 	ld	l,6 (ix)
   638E DD 66 07      [19]  825 	ld	h,7 (ix)
   6391 E5            [11]  826 	push	hl
   6392 CD 17 61      [17]  827 	call	_printStats
   6395 F1            [10]  828 	pop	af
                            829 ;src/juego.c:173: ataque = pen;
   6396 DD 4E FB      [19]  830 	ld	c, -5 (ix)
                            831 ;src/juego.c:174: pen = bg;
   6399 DD 7E FA      [19]  832 	ld	a, -6 (ix)
   639C DD 77 FB      [19]  833 	ld	-5 (ix), a
                            834 ;src/juego.c:175: bg = ataque;
   639F DD 71 FA      [19]  835 	ld	-6 (ix), c
   63A2                     836 00105$:
                            837 ;src/juego.c:178: printConsole(temp, pen, bg);
   63A2 DD 4E FC      [19]  838 	ld	c,-4 (ix)
   63A5 DD 46 FD      [19]  839 	ld	b,-3 (ix)
   63A8 DD 66 FA      [19]  840 	ld	h, -6 (ix)
   63AB DD 6E FB      [19]  841 	ld	l, -5 (ix)
   63AE E5            [11]  842 	push	hl
   63AF C5            [11]  843 	push	bc
   63B0 CD 4A 62      [17]  844 	call	_printConsole
   63B3 DD F9         [10]  845 	ld	sp,ix
   63B5 DD E1         [14]  846 	pop	ix
   63B7 C9            [10]  847 	ret
   63B8                     848 ___str_4:
   63B8 25 2D 39 73 20 41   849 	.ascii "%-9s ATT %02d"
        54 54 20 25 30 32
        64
   63C5 00                  850 	.db 0x00
   63C6                     851 ___str_5:
   63C6 25 2D 39 73 20 48   852 	.ascii "%-9s HP=>%02d"
        50 3D 3E 25 30 32
        64
   63D3 00                  853 	.db 0x00
   63D4                     854 ___str_6:
   63D4 25 2D 39 73 20 44   855 	.ascii "%-9s DIED! "
        49 45 44 21 20
   63DF 00                  856 	.db 0x00
                            857 ;src/juego.c:181: void defender(TStats *a) {
                            858 ;	---------------------------------
                            859 ; Function defender
                            860 ; ---------------------------------
   63E0                     861 _defender::
   63E0 DD E5         [15]  862 	push	ix
   63E2 DD 21 00 00   [14]  863 	ld	ix,#0
   63E6 DD 39         [15]  864 	add	ix,sp
   63E8 21 E5 FF      [10]  865 	ld	hl, #-27
   63EB 39            [11]  866 	add	hl, sp
   63EC F9            [ 6]  867 	ld	sp, hl
                            868 ;src/juego.c:184: pen = 0;
   63ED DD 36 E5 00   [19]  869 	ld	-27 (ix), #0x00
                            870 ;src/juego.c:185: bg = 2;
   63F1 DD 36 E6 02   [19]  871 	ld	-26 (ix), #0x02
                            872 ;src/juego.c:186: if ((u16) a->sprite == (u16) G_mendo)  {
   63F5 DD 4E 04      [19]  873 	ld	c,4 (ix)
   63F8 DD 46 05      [19]  874 	ld	b,5 (ix)
   63FB 69            [ 4]  875 	ld	l, c
   63FC 60            [ 4]  876 	ld	h, b
   63FD 11 12 00      [10]  877 	ld	de, #0x0012
   6400 19            [11]  878 	add	hl, de
   6401 5E            [ 7]  879 	ld	e, (hl)
   6402 23            [ 6]  880 	inc	hl
   6403 56            [ 7]  881 	ld	d, (hl)
   6404 DD 36 FE 54   [19]  882 	ld	-2 (ix), #<(_G_mendo)
   6408 DD 36 FF 6B   [19]  883 	ld	-1 (ix), #>(_G_mendo)
   640C 7B            [ 4]  884 	ld	a, e
   640D DD 96 FE      [19]  885 	sub	a, -2 (ix)
   6410 20 0E         [12]  886 	jr	NZ,00102$
   6412 7A            [ 4]  887 	ld	a, d
   6413 DD 96 FF      [19]  888 	sub	a, -1 (ix)
   6416 20 08         [12]  889 	jr	NZ,00102$
                            890 ;src/juego.c:187: pen = 2;
   6418 DD 36 E5 02   [19]  891 	ld	-27 (ix), #0x02
                            892 ;src/juego.c:188: bg = 0;
   641C DD 36 E6 00   [19]  893 	ld	-26 (ix), #0x00
   6420                     894 00102$:
                            895 ;src/juego.c:191: if (a->energy + a->defense < a->max_energy)
   6420 FD 21 0A 00   [14]  896 	ld	iy, #0x000a
   6424 FD 09         [15]  897 	add	iy, bc
   6426 FD 7E 00      [19]  898 	ld	a, 0 (iy)
   6429 DD 77 FE      [19]  899 	ld	-2 (ix), a
   642C 5F            [ 4]  900 	ld	e, a
   642D 16 00         [ 7]  901 	ld	d, #0x00
   642F 69            [ 4]  902 	ld	l, c
   6430 60            [ 4]  903 	ld	h, b
   6431 C5            [11]  904 	push	bc
   6432 01 0E 00      [10]  905 	ld	bc, #0x000e
   6435 09            [11]  906 	add	hl, bc
   6436 C1            [10]  907 	pop	bc
   6437 7E            [ 7]  908 	ld	a, (hl)
   6438 DD 77 FD      [19]  909 	ld	-3 (ix), a
   643B 6F            [ 4]  910 	ld	l, a
   643C 26 00         [ 7]  911 	ld	h, #0x00
   643E 19            [11]  912 	add	hl,de
   643F DD 75 FB      [19]  913 	ld	-5 (ix), l
   6442 DD 74 FC      [19]  914 	ld	-4 (ix), h
   6445 69            [ 4]  915 	ld	l, c
   6446 60            [ 4]  916 	ld	h, b
   6447 11 0B 00      [10]  917 	ld	de, #0x000b
   644A 19            [11]  918 	add	hl, de
   644B 5E            [ 7]  919 	ld	e, (hl)
   644C 6B            [ 4]  920 	ld	l, e
   644D 16 00         [ 7]  921 	ld	d, #0x00
   644F DD 7E FB      [19]  922 	ld	a, -5 (ix)
   6452 95            [ 4]  923 	sub	a, l
   6453 DD 7E FC      [19]  924 	ld	a, -4 (ix)
   6456 9A            [ 4]  925 	sbc	a, d
   6457 E2 5C 64      [10]  926 	jp	PO, 00124$
   645A EE 80         [ 7]  927 	xor	a, #0x80
   645C                     928 00124$:
   645C F2 64 64      [10]  929 	jp	P, 00104$
                            930 ;src/juego.c:192: healed = a->defense;
   645F DD 5E FD      [19]  931 	ld	e, -3 (ix)
   6462 18 05         [12]  932 	jr	00105$
   6464                     933 00104$:
                            934 ;src/juego.c:194: healed = a->max_energy - a->energy;
   6464 7B            [ 4]  935 	ld	a, e
   6465 DD 96 FE      [19]  936 	sub	a, -2 (ix)
   6468 5F            [ 4]  937 	ld	e, a
   6469                     938 00105$:
                            939 ;src/juego.c:196: a->energy = a->energy + healed;
   6469 DD 7E FE      [19]  940 	ld	a, -2 (ix)
   646C 83            [ 4]  941 	add	a, e
   646D FD 77 00      [19]  942 	ld	0 (iy), a
                            943 ;src/juego.c:198: if (healed) {
   6470 7B            [ 4]  944 	ld	a, e
   6471 B7            [ 4]  945 	or	a, a
   6472 28 2E         [12]  946 	jr	Z,00108$
                            947 ;src/juego.c:199: sprintf(temp, "%-9s %c %02dHP",a->name, 240,healed);
   6474 16 00         [ 7]  948 	ld	d, #0x00
   6476 21 02 00      [10]  949 	ld	hl, #0x0002
   6479 39            [11]  950 	add	hl, sp
   647A E5            [11]  951 	push	hl
   647B FD E1         [14]  952 	pop	iy
   647D E5            [11]  953 	push	hl
   647E D5            [11]  954 	push	de
   647F 11 F0 00      [10]  955 	ld	de, #0x00f0
   6482 D5            [11]  956 	push	de
   6483 C5            [11]  957 	push	bc
   6484 01 A7 64      [10]  958 	ld	bc, #___str_7
   6487 C5            [11]  959 	push	bc
   6488 FD E5         [15]  960 	push	iy
   648A CD DF 70      [17]  961 	call	_sprintf
   648D 21 0A 00      [10]  962 	ld	hl, #10
   6490 39            [11]  963 	add	hl, sp
   6491 F9            [ 6]  964 	ld	sp, hl
   6492 E1            [10]  965 	pop	hl
                            966 ;src/juego.c:200: printConsole(temp, pen, bg);
   6493 4D            [ 4]  967 	ld	c, l
   6494 44            [ 4]  968 	ld	b, h
   6495 DD 66 E6      [19]  969 	ld	h, -26 (ix)
   6498 DD 6E E5      [19]  970 	ld	l, -27 (ix)
   649B E5            [11]  971 	push	hl
   649C C5            [11]  972 	push	bc
   649D CD 4A 62      [17]  973 	call	_printConsole
   64A0 F1            [10]  974 	pop	af
   64A1 F1            [10]  975 	pop	af
   64A2                     976 00108$:
   64A2 DD F9         [10]  977 	ld	sp, ix
   64A4 DD E1         [14]  978 	pop	ix
   64A6 C9            [10]  979 	ret
   64A7                     980 ___str_7:
   64A7 25 2D 39 73 20 25   981 	.ascii "%-9s %c %02dHP"
        63 20 25 30 32 64
        48 50
   64B5 00                  982 	.db 0x00
                            983 ;src/juego.c:204: u8 turno() { //devuelve valor 0 cuando muere personaje o se termina nivel
                            984 ;	---------------------------------
                            985 ; Function turno
                            986 ; ---------------------------------
   64B6                     987 _turno::
   64B6 DD E5         [15]  988 	push	ix
   64B8 DD 21 00 00   [14]  989 	ld	ix,#0
   64BC DD 39         [15]  990 	add	ix,sp
   64BE 21 CC FF      [10]  991 	ld	hl, #-52
   64C1 39            [11]  992 	add	hl, sp
   64C2 F9            [ 6]  993 	ld	sp, hl
                            994 ;src/juego.c:209: for (i = 0; i < 3; i++) {
   64C3 DD 36 CC 00   [19]  995 	ld	-52 (ix), #0x00
   64C7                     996 00171$:
                            997 ;src/juego.c:210: mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
   64C7 3A 8E 7E      [13]  998 	ld	a,(#_nivel + 0)
   64CA DD 77 FE      [19]  999 	ld	-2 (ix), a
   64CD DD 36 FF 00   [19] 1000 	ld	-1 (ix), #0x00
   64D1 6F            [ 4] 1001 	ld	l, a
   64D2 26 00         [ 7] 1002 	ld	h, #0x00
   64D4 2B            [ 6] 1003 	dec	hl
   64D5 DD 75 FE      [19] 1004 	ld	-2 (ix), l
   64D8 DD 74 FF      [19] 1005 	ld	-1 (ix), h
   64DB 4D            [ 4] 1006 	ld	c,l
   64DC 44            [ 4] 1007 	ld	b,h
   64DD 29            [11] 1008 	add	hl, hl
   64DE 09            [11] 1009 	add	hl, bc
   64DF 29            [11] 1010 	add	hl, hl
   64E0 09            [11] 1011 	add	hl, bc
   64E1 29            [11] 1012 	add	hl, hl
   64E2 09            [11] 1013 	add	hl, bc
   64E3 29            [11] 1014 	add	hl, hl
   64E4 09            [11] 1015 	add	hl, bc
   64E5 29            [11] 1016 	add	hl, hl
   64E6 09            [11] 1017 	add	hl, bc
   64E7 29            [11] 1018 	add	hl, hl
   64E8 29            [11] 1019 	add	hl, hl
   64E9 29            [11] 1020 	add	hl, hl
   64EA DD 75 FE      [19] 1021 	ld	-2 (ix), l
   64ED DD 74 FF      [19] 1022 	ld	-1 (ix), h
   64F0 3E 00         [ 7] 1023 	ld	a, #<(_g_mapa01)
   64F2 DD 86 FE      [19] 1024 	add	a, -2 (ix)
   64F5 DD 77 FE      [19] 1025 	ld	-2 (ix), a
   64F8 3E 40         [ 7] 1026 	ld	a, #>(_g_mapa01)
   64FA DD 8E FF      [19] 1027 	adc	a, -1 (ix)
   64FD DD 77 FF      [19] 1028 	ld	-1 (ix), a
   6500 DD 7E FE      [19] 1029 	ld	a, -2 (ix)
   6503 DD 77 CD      [19] 1030 	ld	-51 (ix), a
   6506 DD 7E FF      [19] 1031 	ld	a, -1 (ix)
   6509 DD 77 CE      [19] 1032 	ld	-50 (ix), a
                           1033 ;src/juego.c:211: cpct_etm_drawTileBox2x4 ((entidad[i].pos_x_ant - 4)/2, 17, 2, 7, g_mapa01_W, INICIO_AREA_JUEGO, mapa );
   650C DD 7E CD      [19] 1034 	ld	a, -51 (ix)
   650F DD 77 FE      [19] 1035 	ld	-2 (ix), a
   6512 DD 7E CE      [19] 1036 	ld	a, -50 (ix)
   6515 DD 77 FF      [19] 1037 	ld	-1 (ix), a
   6518 DD 36 FC 84   [19] 1038 	ld	-4 (ix), #0x84
   651C DD 36 FD C2   [19] 1039 	ld	-3 (ix), #0xc2
   6520 DD 4E CC      [19] 1040 	ld	c,-52 (ix)
   6523 06 00         [ 7] 1041 	ld	b,#0x00
   6525 69            [ 4] 1042 	ld	l, c
   6526 60            [ 4] 1043 	ld	h, b
   6527 29            [11] 1044 	add	hl, hl
   6528 29            [11] 1045 	add	hl, hl
   6529 09            [11] 1046 	add	hl, bc
   652A 29            [11] 1047 	add	hl, hl
   652B 29            [11] 1048 	add	hl, hl
   652C 01 52 7E      [10] 1049 	ld	bc,#_entidad
   652F 09            [11] 1050 	add	hl,bc
   6530 DD 75 FA      [19] 1051 	ld	-6 (ix), l
   6533 DD 74 FB      [19] 1052 	ld	-5 (ix), h
   6536 11 10 00      [10] 1053 	ld	de, #0x0010
   6539 19            [11] 1054 	add	hl, de
   653A 7E            [ 7] 1055 	ld	a, (hl)
   653B DD 77 FA      [19] 1056 	ld	-6 (ix), a
   653E DD 77 FA      [19] 1057 	ld	-6 (ix), a
   6541 DD 36 FB 00   [19] 1058 	ld	-5 (ix), #0x00
   6545 DD 7E FA      [19] 1059 	ld	a, -6 (ix)
   6548 C6 FC         [ 7] 1060 	add	a, #0xfc
   654A 4F            [ 4] 1061 	ld	c, a
   654B DD 7E FB      [19] 1062 	ld	a, -5 (ix)
   654E CE FF         [ 7] 1063 	adc	a, #0xff
   6550 47            [ 4] 1064 	ld	b, a
   6551 DD 71 F8      [19] 1065 	ld	-8 (ix), c
   6554 DD 70 F9      [19] 1066 	ld	-7 (ix), b
   6557 CB 78         [ 8] 1067 	bit	7, b
   6559 28 10         [12] 1068 	jr	Z,00181$
   655B DD 7E FA      [19] 1069 	ld	a, -6 (ix)
   655E C6 FD         [ 7] 1070 	add	a, #0xfd
   6560 DD 77 F8      [19] 1071 	ld	-8 (ix), a
   6563 DD 7E FB      [19] 1072 	ld	a, -5 (ix)
   6566 CE FF         [ 7] 1073 	adc	a, #0xff
   6568 DD 77 F9      [19] 1074 	ld	-7 (ix), a
   656B                    1075 00181$:
   656B DD 46 F8      [19] 1076 	ld	b, -8 (ix)
   656E DD 4E F9      [19] 1077 	ld	c, -7 (ix)
   6571 CB 29         [ 8] 1078 	sra	c
   6573 CB 18         [ 8] 1079 	rr	b
   6575 DD 6E FE      [19] 1080 	ld	l,-2 (ix)
   6578 DD 66 FF      [19] 1081 	ld	h,-1 (ix)
   657B E5            [11] 1082 	push	hl
   657C DD 6E FC      [19] 1083 	ld	l,-4 (ix)
   657F DD 66 FD      [19] 1084 	ld	h,-3 (ix)
   6582 E5            [11] 1085 	push	hl
   6583 21 07 12      [10] 1086 	ld	hl, #0x1207
   6586 E5            [11] 1087 	push	hl
   6587 21 11 02      [10] 1088 	ld	hl, #0x0211
   658A E5            [11] 1089 	push	hl
   658B C5            [11] 1090 	push	bc
   658C 33            [ 6] 1091 	inc	sp
   658D CD 12 6F      [17] 1092 	call	_cpct_etm_drawTileBox2x4
                           1093 ;src/juego.c:209: for (i = 0; i < 3; i++) {
   6590 DD 34 CC      [23] 1094 	inc	-52 (ix)
   6593 DD 7E CC      [19] 1095 	ld	a, -52 (ix)
   6596 D6 03         [ 7] 1096 	sub	a, #0x03
   6598 DA C7 64      [10] 1097 	jp	C, 00171$
                           1098 ;src/juego.c:214: cpct_waitVSYNC();
   659B CD 37 71      [17] 1099 	call	_cpct_waitVSYNC
                           1100 ;src/juego.c:216: for (i = 0; i < 3; i++) {
   659E DD 36 CC 00   [19] 1101 	ld	-52 (ix), #0x00
   65A2                    1102 00173$:
                           1103 ;src/juego.c:217: if (entidad[i].energy) {
   65A2 DD 4E CC      [19] 1104 	ld	c,-52 (ix)
   65A5 06 00         [ 7] 1105 	ld	b,#0x00
   65A7 69            [ 4] 1106 	ld	l, c
   65A8 60            [ 4] 1107 	ld	h, b
   65A9 29            [11] 1108 	add	hl, hl
   65AA 29            [11] 1109 	add	hl, hl
   65AB 09            [11] 1110 	add	hl, bc
   65AC 29            [11] 1111 	add	hl, hl
   65AD 29            [11] 1112 	add	hl, hl
   65AE DD 75 F8      [19] 1113 	ld	-8 (ix), l
   65B1 DD 74 F9      [19] 1114 	ld	-7 (ix), h
   65B4 DD 7E F8      [19] 1115 	ld	a, -8 (ix)
   65B7 C6 52         [ 7] 1116 	add	a, #<(_entidad)
   65B9 DD 77 F8      [19] 1117 	ld	-8 (ix), a
   65BC DD 7E F9      [19] 1118 	ld	a, -7 (ix)
   65BF CE 7E         [ 7] 1119 	adc	a, #>(_entidad)
   65C1 DD 77 F9      [19] 1120 	ld	-7 (ix), a
   65C4 DD 7E F8      [19] 1121 	ld	a, -8 (ix)
   65C7 DD 77 FA      [19] 1122 	ld	-6 (ix), a
   65CA DD 7E F9      [19] 1123 	ld	a, -7 (ix)
   65CD DD 77 FB      [19] 1124 	ld	-5 (ix), a
   65D0 DD 6E FA      [19] 1125 	ld	l,-6 (ix)
   65D3 DD 66 FB      [19] 1126 	ld	h,-5 (ix)
   65D6 11 0A 00      [10] 1127 	ld	de, #0x000a
   65D9 19            [11] 1128 	add	hl, de
   65DA 7E            [ 7] 1129 	ld	a, (hl)
   65DB DD 77 FA      [19] 1130 	ld	-6 (ix), a
   65DE B7            [ 4] 1131 	or	a, a
   65DF CA 6B 66      [10] 1132 	jp	Z, 00174$
                           1133 ;src/juego.c:218: printStats(&entidad[i]);
   65E2 DD 7E F8      [19] 1134 	ld	a, -8 (ix)
   65E5 DD 77 FA      [19] 1135 	ld	-6 (ix), a
   65E8 DD 7E F9      [19] 1136 	ld	a, -7 (ix)
   65EB DD 77 FB      [19] 1137 	ld	-5 (ix), a
   65EE DD 6E FA      [19] 1138 	ld	l,-6 (ix)
   65F1 DD 66 FB      [19] 1139 	ld	h,-5 (ix)
   65F4 E5            [11] 1140 	push	hl
   65F5 CD 17 61      [17] 1141 	call	_printStats
   65F8 F1            [10] 1142 	pop	af
                           1143 ;src/juego.c:219: cpct_drawSpriteMasked (entidad[i].sprite, cpct_getScreenPtr (CPCT_VMEM_START, entidad[i].pos_x, 132), 4,28);
   65F9 DD 7E F8      [19] 1144 	ld	a, -8 (ix)
   65FC C6 0F         [ 7] 1145 	add	a, #0x0f
   65FE DD 77 FA      [19] 1146 	ld	-6 (ix), a
   6601 DD 7E F9      [19] 1147 	ld	a, -7 (ix)
   6604 CE 00         [ 7] 1148 	adc	a, #0x00
   6606 DD 77 FB      [19] 1149 	ld	-5 (ix), a
   6609 DD 6E FA      [19] 1150 	ld	l,-6 (ix)
   660C DD 66 FB      [19] 1151 	ld	h,-5 (ix)
   660F 46            [ 7] 1152 	ld	b, (hl)
   6610 3E 84         [ 7] 1153 	ld	a, #0x84
   6612 F5            [11] 1154 	push	af
   6613 33            [ 6] 1155 	inc	sp
   6614 C5            [11] 1156 	push	bc
   6615 33            [ 6] 1157 	inc	sp
   6616 21 00 C0      [10] 1158 	ld	hl, #0xc000
   6619 E5            [11] 1159 	push	hl
   661A CD 85 72      [17] 1160 	call	_cpct_getScreenPtr
   661D DD 74 FD      [19] 1161 	ld	-3 (ix), h
   6620 DD 75 FC      [19] 1162 	ld	-4 (ix), l
   6623 DD 7E F8      [19] 1163 	ld	a, -8 (ix)
   6626 DD 77 FE      [19] 1164 	ld	-2 (ix), a
   6629 DD 7E F9      [19] 1165 	ld	a, -7 (ix)
   662C DD 77 FF      [19] 1166 	ld	-1 (ix), a
   662F DD 6E FE      [19] 1167 	ld	l,-2 (ix)
   6632 DD 66 FF      [19] 1168 	ld	h,-1 (ix)
   6635 11 12 00      [10] 1169 	ld	de, #0x0012
   6638 19            [11] 1170 	add	hl, de
   6639 7E            [ 7] 1171 	ld	a, (hl)
   663A DD 77 FE      [19] 1172 	ld	-2 (ix), a
   663D 23            [ 6] 1173 	inc	hl
   663E 7E            [ 7] 1174 	ld	a, (hl)
   663F DD 77 FF      [19] 1175 	ld	-1 (ix), a
   6642 21 04 1C      [10] 1176 	ld	hl, #0x1c04
   6645 E5            [11] 1177 	push	hl
   6646 DD 6E FC      [19] 1178 	ld	l,-4 (ix)
   6649 DD 66 FD      [19] 1179 	ld	h,-3 (ix)
   664C E5            [11] 1180 	push	hl
   664D DD 6E FE      [19] 1181 	ld	l,-2 (ix)
   6650 DD 66 FF      [19] 1182 	ld	h,-1 (ix)
   6653 E5            [11] 1183 	push	hl
   6654 CD 5B 70      [17] 1184 	call	_cpct_drawSpriteMasked
                           1185 ;src/juego.c:220: entidad[i].pos_x_ant = entidad[i].pos_x;
   6657 DD 7E F8      [19] 1186 	ld	a, -8 (ix)
   665A C6 10         [ 7] 1187 	add	a, #0x10
   665C 4F            [ 4] 1188 	ld	c, a
   665D DD 7E F9      [19] 1189 	ld	a, -7 (ix)
   6660 CE 00         [ 7] 1190 	adc	a, #0x00
   6662 47            [ 4] 1191 	ld	b, a
   6663 DD 6E FA      [19] 1192 	ld	l,-6 (ix)
   6666 DD 66 FB      [19] 1193 	ld	h,-5 (ix)
   6669 7E            [ 7] 1194 	ld	a, (hl)
   666A 02            [ 7] 1195 	ld	(bc), a
   666B                    1196 00174$:
                           1197 ;src/juego.c:216: for (i = 0; i < 3; i++) {
   666B DD 34 CC      [23] 1198 	inc	-52 (ix)
   666E DD 7E CC      [19] 1199 	ld	a, -52 (ix)
   6671 D6 03         [ 7] 1200 	sub	a, #0x03
   6673 DA A2 65      [10] 1201 	jp	C, 00173$
                           1202 ;src/juego.c:228: i = 0;
   6676 DD 36 CC 00   [19] 1203 	ld	-52 (ix), #0x00
                           1204 ;src/juego.c:229: do  {
   667A 21 04 00      [10] 1205 	ld	hl, #0x0004
   667D 39            [11] 1206 	add	hl, sp
   667E DD 75 F8      [19] 1207 	ld	-8 (ix), l
   6681 DD 74 F9      [19] 1208 	ld	-7 (ix), h
   6684                    1209 00117$:
                           1210 ;src/juego.c:230: cpct_scanKeyboard_f();
   6684 CD 77 6D      [17] 1211 	call	_cpct_scanKeyboard_f
                           1212 ;src/juego.c:231: sprintf(temp, "ACTION (%c/%c/D) ?",242,243);
   6687 DD 7E F8      [19] 1213 	ld	a, -8 (ix)
   668A DD 77 FA      [19] 1214 	ld	-6 (ix), a
   668D DD 7E F9      [19] 1215 	ld	a, -7 (ix)
   6690 DD 77 FB      [19] 1216 	ld	-5 (ix), a
   6693 21 F3 00      [10] 1217 	ld	hl, #0x00f3
   6696 E5            [11] 1218 	push	hl
   6697 2E F2         [ 7] 1219 	ld	l, #0xf2
   6699 E5            [11] 1220 	push	hl
   669A 21 C8 6A      [10] 1221 	ld	hl, #___str_8
   669D E5            [11] 1222 	push	hl
   669E DD 6E FA      [19] 1223 	ld	l,-6 (ix)
   66A1 DD 66 FB      [19] 1224 	ld	h,-5 (ix)
   66A4 E5            [11] 1225 	push	hl
   66A5 CD DF 70      [17] 1226 	call	_sprintf
   66A8 21 08 00      [10] 1227 	ld	hl, #8
   66AB 39            [11] 1228 	add	hl, sp
   66AC F9            [ 6] 1229 	ld	sp, hl
                           1230 ;src/juego.c:232: if (i < 25) {
   66AD DD 7E CC      [19] 1231 	ld	a, -52 (ix)
   66B0 D6 19         [ 7] 1232 	sub	a, #0x19
   66B2 30 1E         [12] 1233 	jr	NC,00106$
                           1234 ;src/juego.c:233: printConsole(temp, 2, 0);
   66B4 DD 7E F8      [19] 1235 	ld	a, -8 (ix)
   66B7 DD 77 FA      [19] 1236 	ld	-6 (ix), a
   66BA DD 7E F9      [19] 1237 	ld	a, -7 (ix)
   66BD DD 77 FB      [19] 1238 	ld	-5 (ix), a
   66C0 21 02 00      [10] 1239 	ld	hl, #0x0002
   66C3 E5            [11] 1240 	push	hl
   66C4 DD 6E FA      [19] 1241 	ld	l,-6 (ix)
   66C7 DD 66 FB      [19] 1242 	ld	h,-5 (ix)
   66CA E5            [11] 1243 	push	hl
   66CB CD 4A 62      [17] 1244 	call	_printConsole
   66CE F1            [10] 1245 	pop	af
   66CF F1            [10] 1246 	pop	af
   66D0 18 1C         [12] 1247 	jr	00107$
   66D2                    1248 00106$:
                           1249 ;src/juego.c:235: printConsole(temp, 0, 2);
   66D2 DD 7E F8      [19] 1250 	ld	a, -8 (ix)
   66D5 DD 77 FA      [19] 1251 	ld	-6 (ix), a
   66D8 DD 7E F9      [19] 1252 	ld	a, -7 (ix)
   66DB DD 77 FB      [19] 1253 	ld	-5 (ix), a
   66DE 21 00 02      [10] 1254 	ld	hl, #0x0200
   66E1 E5            [11] 1255 	push	hl
   66E2 DD 6E FA      [19] 1256 	ld	l,-6 (ix)
   66E5 DD 66 FB      [19] 1257 	ld	h,-5 (ix)
   66E8 E5            [11] 1258 	push	hl
   66E9 CD 4A 62      [17] 1259 	call	_printConsole
   66EC F1            [10] 1260 	pop	af
   66ED F1            [10] 1261 	pop	af
   66EE                    1262 00107$:
                           1263 ;src/juego.c:237: i++;
   66EE DD 34 CC      [23] 1264 	inc	-52 (ix)
                           1265 ;src/juego.c:238: cursorConsola -=8;
   66F1 21 B8 7E      [10] 1266 	ld	hl, #_cursorConsola
   66F4 7E            [ 7] 1267 	ld	a, (hl)
   66F5 C6 F8         [ 7] 1268 	add	a, #0xf8
   66F7 77            [ 7] 1269 	ld	(hl), a
                           1270 ;src/juego.c:239: if (i == 50)
   66F8 DD 7E CC      [19] 1271 	ld	a, -52 (ix)
   66FB D6 32         [ 7] 1272 	sub	a, #0x32
   66FD 20 04         [12] 1273 	jr	NZ,00118$
                           1274 ;src/juego.c:240: i=0;
   66FF DD 36 CC 00   [19] 1275 	ld	-52 (ix), #0x00
   6703                    1276 00118$:
                           1277 ;src/juego.c:242: while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_CursorLeft)  && !cpct_isKeyPressed(Joy0_Left) 
   6703 21 04 04      [10] 1278 	ld	hl, #0x0404
   6706 CD 54 6D      [17] 1279 	call	_cpct_isKeyPressed
   6709 DD 75 FA      [19] 1280 	ld	-6 (ix), l
   670C 7D            [ 4] 1281 	ld	a, l
   670D B7            [ 4] 1282 	or	a, a
   670E 20 4A         [12] 1283 	jr	NZ,00119$
   6710 21 01 01      [10] 1284 	ld	hl, #0x0101
   6713 CD 54 6D      [17] 1285 	call	_cpct_isKeyPressed
   6716 DD 75 FA      [19] 1286 	ld	-6 (ix), l
   6719 7D            [ 4] 1287 	ld	a, l
   671A B7            [ 4] 1288 	or	a, a
   671B 20 3D         [12] 1289 	jr	NZ,00119$
   671D 21 09 04      [10] 1290 	ld	hl, #0x0409
   6720 CD 54 6D      [17] 1291 	call	_cpct_isKeyPressed
   6723 7D            [ 4] 1292 	ld	a, l
   6724 B7            [ 4] 1293 	or	a, a
   6725 20 33         [12] 1294 	jr	NZ,00119$
                           1295 ;src/juego.c:243: && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_CursorRight) && !cpct_isKeyPressed(Joy0_Right) 
   6727 21 03 08      [10] 1296 	ld	hl, #0x0803
   672A CD 54 6D      [17] 1297 	call	_cpct_isKeyPressed
   672D 7D            [ 4] 1298 	ld	a, l
   672E B7            [ 4] 1299 	or	a, a
   672F 20 29         [12] 1300 	jr	NZ,00119$
   6731 21 00 02      [10] 1301 	ld	hl, #0x0200
   6734 CD 54 6D      [17] 1302 	call	_cpct_isKeyPressed
   6737 7D            [ 4] 1303 	ld	a, l
   6738 B7            [ 4] 1304 	or	a, a
   6739 20 1F         [12] 1305 	jr	NZ,00119$
   673B 21 09 08      [10] 1306 	ld	hl, #0x0809
   673E CD 54 6D      [17] 1307 	call	_cpct_isKeyPressed
   6741 7D            [ 4] 1308 	ld	a, l
   6742 B7            [ 4] 1309 	or	a, a
   6743 20 15         [12] 1310 	jr	NZ,00119$
                           1311 ;src/juego.c:244: && !cpct_isKeyPressed(Key_D) && !cpct_isKeyPressed(Joy0_Fire1));
   6745 21 07 20      [10] 1312 	ld	hl, #0x2007
   6748 CD 54 6D      [17] 1313 	call	_cpct_isKeyPressed
   674B 7D            [ 4] 1314 	ld	a, l
   674C B7            [ 4] 1315 	or	a, a
   674D 20 0B         [12] 1316 	jr	NZ,00119$
   674F 21 09 10      [10] 1317 	ld	hl, #0x1009
   6752 CD 54 6D      [17] 1318 	call	_cpct_isKeyPressed
   6755 7D            [ 4] 1319 	ld	a, l
   6756 B7            [ 4] 1320 	or	a, a
   6757 CA 84 66      [10] 1321 	jp	Z, 00117$
   675A                    1322 00119$:
                           1323 ;src/juego.c:246: nueva_pos = 0;
   675A DD 36 CF 00   [19] 1324 	ld	-49 (ix), #0x00
                           1325 ;src/juego.c:249: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
   675E 21 04 04      [10] 1326 	ld	hl, #0x0404
   6761 CD 54 6D      [17] 1327 	call	_cpct_isKeyPressed
                           1328 ;src/juego.c:253: nueva_pos = entidad[0].pos_x - 4;
                           1329 ;src/juego.c:249: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
   6764 7D            [ 4] 1330 	ld	a, l
   6765 B7            [ 4] 1331 	or	a, a
   6766 20 14         [12] 1332 	jr	NZ,00120$
   6768 21 01 01      [10] 1333 	ld	hl, #0x0101
   676B CD 54 6D      [17] 1334 	call	_cpct_isKeyPressed
   676E 7D            [ 4] 1335 	ld	a, l
   676F B7            [ 4] 1336 	or	a, a
   6770 20 0A         [12] 1337 	jr	NZ,00120$
   6772 21 09 04      [10] 1338 	ld	hl, #0x0409
   6775 CD 54 6D      [17] 1339 	call	_cpct_isKeyPressed
   6778 7D            [ 4] 1340 	ld	a, l
   6779 B7            [ 4] 1341 	or	a, a
   677A 28 33         [12] 1342 	jr	Z,00121$
   677C                    1343 00120$:
                           1344 ;src/juego.c:250: sprintf(temp, "%-9s GOES %c",entidad[0].name,242);
   677C 11 DB 6A      [10] 1345 	ld	de, #___str_9+0
   677F DD 4E F8      [19] 1346 	ld	c,-8 (ix)
   6782 DD 46 F9      [19] 1347 	ld	b,-7 (ix)
   6785 21 F2 00      [10] 1348 	ld	hl, #0x00f2
   6788 E5            [11] 1349 	push	hl
   6789 21 52 7E      [10] 1350 	ld	hl, #_entidad
   678C E5            [11] 1351 	push	hl
   678D D5            [11] 1352 	push	de
   678E C5            [11] 1353 	push	bc
   678F CD DF 70      [17] 1354 	call	_sprintf
   6792 21 08 00      [10] 1355 	ld	hl, #8
   6795 39            [11] 1356 	add	hl, sp
   6796 F9            [ 6] 1357 	ld	sp, hl
                           1358 ;src/juego.c:251: printConsole(temp, 2, 0);
   6797 DD 4E F8      [19] 1359 	ld	c,-8 (ix)
   679A DD 46 F9      [19] 1360 	ld	b,-7 (ix)
   679D 21 02 00      [10] 1361 	ld	hl, #0x0002
   67A0 E5            [11] 1362 	push	hl
   67A1 C5            [11] 1363 	push	bc
   67A2 CD 4A 62      [17] 1364 	call	_printConsole
   67A5 F1            [10] 1365 	pop	af
   67A6 F1            [10] 1366 	pop	af
                           1367 ;src/juego.c:253: nueva_pos = entidad[0].pos_x - 4;
   67A7 3A 61 7E      [13] 1368 	ld	a, (#(_entidad + 0x000f) + 0)
   67AA C6 FC         [ 7] 1369 	add	a, #0xfc
   67AC DD 77 CF      [19] 1370 	ld	-49 (ix), a
   67AF                    1371 00121$:
                           1372 ;src/juego.c:257: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
   67AF 21 03 08      [10] 1373 	ld	hl, #0x0803
   67B2 CD 54 6D      [17] 1374 	call	_cpct_isKeyPressed
                           1375 ;src/juego.c:263: if (nueva_pos == entidad[1].pos_x)
                           1376 ;src/juego.c:266: if (nueva_pos == entidad[2].pos_x)
                           1377 ;src/juego.c:257: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
   67B5 7D            [ 4] 1378 	ld	a, l
   67B6 B7            [ 4] 1379 	or	a, a
   67B7 20 14         [12] 1380 	jr	NZ,00128$
   67B9 21 00 02      [10] 1381 	ld	hl, #0x0200
   67BC CD 54 6D      [17] 1382 	call	_cpct_isKeyPressed
   67BF 7D            [ 4] 1383 	ld	a, l
   67C0 B7            [ 4] 1384 	or	a, a
   67C1 20 0A         [12] 1385 	jr	NZ,00128$
   67C3 21 09 08      [10] 1386 	ld	hl, #0x0809
   67C6 CD 54 6D      [17] 1387 	call	_cpct_isKeyPressed
   67C9 7D            [ 4] 1388 	ld	a, l
   67CA B7            [ 4] 1389 	or	a, a
   67CB 28 5F         [12] 1390 	jr	Z,00129$
   67CD                    1391 00128$:
                           1392 ;src/juego.c:258: sprintf(temp, "%-9s GOES %c",entidad[0].name,243);
   67CD 11 DB 6A      [10] 1393 	ld	de, #___str_9+0
   67D0 DD 4E F8      [19] 1394 	ld	c,-8 (ix)
   67D3 DD 46 F9      [19] 1395 	ld	b,-7 (ix)
   67D6 21 F3 00      [10] 1396 	ld	hl, #0x00f3
   67D9 E5            [11] 1397 	push	hl
   67DA 21 52 7E      [10] 1398 	ld	hl, #_entidad
   67DD E5            [11] 1399 	push	hl
   67DE D5            [11] 1400 	push	de
   67DF C5            [11] 1401 	push	bc
   67E0 CD DF 70      [17] 1402 	call	_sprintf
   67E3 21 08 00      [10] 1403 	ld	hl, #8
   67E6 39            [11] 1404 	add	hl, sp
   67E7 F9            [ 6] 1405 	ld	sp, hl
                           1406 ;src/juego.c:259: printConsole(temp, 2 ,0);
   67E8 DD 4E F8      [19] 1407 	ld	c,-8 (ix)
   67EB DD 46 F9      [19] 1408 	ld	b,-7 (ix)
   67EE 21 02 00      [10] 1409 	ld	hl, #0x0002
   67F1 E5            [11] 1410 	push	hl
   67F2 C5            [11] 1411 	push	bc
   67F3 CD 4A 62      [17] 1412 	call	_printConsole
   67F6 F1            [10] 1413 	pop	af
   67F7 F1            [10] 1414 	pop	af
                           1415 ;src/juego.c:261: nueva_pos = entidad[0].pos_x + 4;
   67F8 3A 61 7E      [13] 1416 	ld	a, (#(_entidad + 0x000f) + 0)
   67FB C6 04         [ 7] 1417 	add	a, #0x04
   67FD DD 77 CF      [19] 1418 	ld	-49 (ix), a
                           1419 ;src/juego.c:263: if (nueva_pos == entidad[1].pos_x)
   6800 21 75 7E      [10] 1420 	ld	hl, #(_entidad + 0x0023) + 0
   6803 DD 7E CF      [19] 1421 	ld	a,-49 (ix)
   6806 96            [ 7] 1422 	sub	a,(hl)
   6807 20 0D         [12] 1423 	jr	NZ,00125$
                           1424 ;src/juego.c:264: atacar(&entidad[0], &entidad[1]);
   6809 21 66 7E      [10] 1425 	ld	hl, #(_entidad + 0x0014)
   680C E5            [11] 1426 	push	hl
   680D 21 52 7E      [10] 1427 	ld	hl, #_entidad
   6810 E5            [11] 1428 	push	hl
   6811 CD AA 62      [17] 1429 	call	_atacar
   6814 F1            [10] 1430 	pop	af
   6815 F1            [10] 1431 	pop	af
   6816                    1432 00125$:
                           1433 ;src/juego.c:266: if (nueva_pos == entidad[2].pos_x)
   6816 21 89 7E      [10] 1434 	ld	hl, #(_entidad + 0x0037) + 0
   6819 DD 7E CF      [19] 1435 	ld	a,-49 (ix)
   681C 96            [ 7] 1436 	sub	a,(hl)
   681D 20 0D         [12] 1437 	jr	NZ,00129$
                           1438 ;src/juego.c:267: atacar(&entidad[0], &entidad[2]);
   681F 21 7A 7E      [10] 1439 	ld	hl, #(_entidad + 0x0028)
   6822 E5            [11] 1440 	push	hl
   6823 21 52 7E      [10] 1441 	ld	hl, #_entidad
   6826 E5            [11] 1442 	push	hl
   6827 CD AA 62      [17] 1443 	call	_atacar
   682A F1            [10] 1444 	pop	af
   682B F1            [10] 1445 	pop	af
   682C                    1446 00129$:
                           1447 ;src/juego.c:272: if (cpct_isKeyPressed(Key_D) || cpct_isKeyPressed(Joy0_Fire1)) {
   682C 21 07 20      [10] 1448 	ld	hl, #0x2007
   682F CD 54 6D      [17] 1449 	call	_cpct_isKeyPressed
   6832 7D            [ 4] 1450 	ld	a, l
   6833 B7            [ 4] 1451 	or	a, a
   6834 20 0A         [12] 1452 	jr	NZ,00132$
   6836 21 09 10      [10] 1453 	ld	hl, #0x1009
   6839 CD 54 6D      [17] 1454 	call	_cpct_isKeyPressed
   683C 7D            [ 4] 1455 	ld	a, l
   683D B7            [ 4] 1456 	or	a, a
   683E 28 08         [12] 1457 	jr	Z,00133$
   6840                    1458 00132$:
                           1459 ;src/juego.c:273: defender(&entidad[0]);
   6840 21 52 7E      [10] 1460 	ld	hl, #_entidad
   6843 E5            [11] 1461 	push	hl
   6844 CD E0 63      [17] 1462 	call	_defender
   6847 F1            [10] 1463 	pop	af
   6848                    1464 00133$:
                           1465 ;src/juego.c:280: && (!entidad[1].energy || nueva_pos != entidad[1].pos_x)
                           1466 ;src/juego.c:281: && (!entidad[2].energy || nueva_pos != entidad[2].pos_x)
                           1467 ;src/juego.c:279: && nueva_pos < 37 
   6848 3E 03         [ 7] 1468 	ld	a, #0x03
   684A DD 96 CF      [19] 1469 	sub	a, -49 (ix)
   684D 30 2C         [12] 1470 	jr	NC,00218$
                           1471 ;src/juego.c:280: && (!entidad[1].energy || nueva_pos != entidad[1].pos_x)
   684F DD 7E CF      [19] 1472 	ld	a, -49 (ix)
   6852 D6 25         [ 7] 1473 	sub	a, #0x25
   6854 30 25         [12] 1474 	jr	NC,00218$
   6856 3A 70 7E      [13] 1475 	ld	a, (#(_entidad + 0x001e) + 0)
   6859 B7            [ 4] 1476 	or	a, a
   685A 28 09         [12] 1477 	jr	Z,00141$
   685C 21 75 7E      [10] 1478 	ld	hl, #(_entidad + 0x0023) + 0
   685F DD 7E CF      [19] 1479 	ld	a,-49 (ix)
   6862 96            [ 7] 1480 	sub	a,(hl)
   6863 28 16         [12] 1481 	jr	Z,00218$
   6865                    1482 00141$:
                           1483 ;src/juego.c:281: && (!entidad[2].energy || nueva_pos != entidad[2].pos_x)
   6865 3A 84 7E      [13] 1484 	ld	a, (#(_entidad + 0x0032) + 0)
   6868 B7            [ 4] 1485 	or	a, a
   6869 28 09         [12] 1486 	jr	Z,00135$
   686B 21 89 7E      [10] 1487 	ld	hl, #(_entidad + 0x0037) + 0
   686E DD 7E CF      [19] 1488 	ld	a,-49 (ix)
   6871 96            [ 7] 1489 	sub	a,(hl)
   6872 28 07         [12] 1490 	jr	Z,00218$
   6874                    1491 00135$:
                           1492 ;src/juego.c:283: entidad[0].pos_x = nueva_pos;
   6874 21 61 7E      [10] 1493 	ld	hl, #(_entidad + 0x000f)
   6877 DD 7E CF      [19] 1494 	ld	a, -49 (ix)
   687A 77            [ 7] 1495 	ld	(hl), a
                           1496 ;src/juego.c:287: for (i = 1; i < 3; i++) {
   687B                    1497 00218$:
   687B DD 7E F8      [19] 1498 	ld	a, -8 (ix)
   687E DD 77 FA      [19] 1499 	ld	-6 (ix), a
   6881 DD 7E F9      [19] 1500 	ld	a, -7 (ix)
   6884 DD 77 FB      [19] 1501 	ld	-5 (ix), a
   6887 DD 7E F8      [19] 1502 	ld	a, -8 (ix)
   688A DD 77 FC      [19] 1503 	ld	-4 (ix), a
   688D DD 7E F9      [19] 1504 	ld	a, -7 (ix)
   6890 DD 77 FD      [19] 1505 	ld	-3 (ix), a
   6893 DD 7E F8      [19] 1506 	ld	a, -8 (ix)
   6896 DD 77 FE      [19] 1507 	ld	-2 (ix), a
   6899 DD 7E F9      [19] 1508 	ld	a, -7 (ix)
   689C DD 77 FF      [19] 1509 	ld	-1 (ix), a
   689F DD 7E F8      [19] 1510 	ld	a, -8 (ix)
   68A2 DD 77 F6      [19] 1511 	ld	-10 (ix), a
   68A5 DD 7E F9      [19] 1512 	ld	a, -7 (ix)
   68A8 DD 77 F7      [19] 1513 	ld	-9 (ix), a
   68AB DD 36 CC 01   [19] 1514 	ld	-52 (ix), #0x01
   68AF                    1515 00177$:
                           1516 ;src/juego.c:288: if (entidad[i].energy) {
   68AF DD 4E CC      [19] 1517 	ld	c,-52 (ix)
   68B2 06 00         [ 7] 1518 	ld	b,#0x00
   68B4 69            [ 4] 1519 	ld	l, c
   68B5 60            [ 4] 1520 	ld	h, b
   68B6 29            [11] 1521 	add	hl, hl
   68B7 29            [11] 1522 	add	hl, hl
   68B8 09            [11] 1523 	add	hl, bc
   68B9 29            [11] 1524 	add	hl, hl
   68BA 29            [11] 1525 	add	hl, hl
   68BB DD 75 F4      [19] 1526 	ld	-12 (ix), l
   68BE DD 74 F5      [19] 1527 	ld	-11 (ix), h
   68C1 DD 7E F4      [19] 1528 	ld	a, -12 (ix)
   68C4 C6 52         [ 7] 1529 	add	a, #<(_entidad)
   68C6 DD 77 F4      [19] 1530 	ld	-12 (ix), a
   68C9 DD 7E F5      [19] 1531 	ld	a, -11 (ix)
   68CC CE 7E         [ 7] 1532 	adc	a, #>(_entidad)
   68CE DD 77 F5      [19] 1533 	ld	-11 (ix), a
   68D1 DD 6E F4      [19] 1534 	ld	l,-12 (ix)
   68D4 DD 66 F5      [19] 1535 	ld	h,-11 (ix)
   68D7 11 0A 00      [10] 1536 	ld	de, #0x000a
   68DA 19            [11] 1537 	add	hl, de
   68DB 7E            [ 7] 1538 	ld	a, (hl)
   68DC B7            [ 4] 1539 	or	a, a
   68DD CA FC 69      [10] 1540 	jp	Z, 00178$
                           1541 ;src/juego.c:289: if (abs(entidad[i].pos_x - entidad[0].pos_x) == 4) //Si está en casilla contigua, atacar
   68E0 DD 7E F4      [19] 1542 	ld	a, -12 (ix)
   68E3 C6 0F         [ 7] 1543 	add	a, #0x0f
   68E5 4F            [ 4] 1544 	ld	c, a
   68E6 DD 7E F5      [19] 1545 	ld	a, -11 (ix)
   68E9 CE 00         [ 7] 1546 	adc	a, #0x00
   68EB 47            [ 4] 1547 	ld	b, a
   68EC 0A            [ 7] 1548 	ld	a, (bc)
   68ED 5F            [ 4] 1549 	ld	e, a
   68EE 21 61 7E      [10] 1550 	ld	hl, #(_entidad + 0x000f) + 0
   68F1 56            [ 7] 1551 	ld	d, (hl)
   68F2 7B            [ 4] 1552 	ld	a, e
   68F3 92            [ 4] 1553 	sub	a, d
   68F4 57            [ 4] 1554 	ld	d, a
   68F5 C5            [11] 1555 	push	bc
   68F6 D5            [11] 1556 	push	de
   68F7 33            [ 6] 1557 	inc	sp
   68F8 CD BF 5E      [17] 1558 	call	_abs
   68FB 33            [ 6] 1559 	inc	sp
   68FC C1            [10] 1560 	pop	bc
   68FD 7D            [ 4] 1561 	ld	a, l
   68FE D6 04         [ 7] 1562 	sub	a, #0x04
   6900 20 15         [12] 1563 	jr	NZ,00149$
                           1564 ;src/juego.c:290: atacar(&entidad[i], &entidad[0]);
   6902 11 52 7E      [10] 1565 	ld	de, #_entidad
   6905 DD 6E F4      [19] 1566 	ld	l,-12 (ix)
   6908 DD 66 F5      [19] 1567 	ld	h,-11 (ix)
   690B C5            [11] 1568 	push	bc
   690C D5            [11] 1569 	push	de
   690D E5            [11] 1570 	push	hl
   690E CD AA 62      [17] 1571 	call	_atacar
   6911 F1            [10] 1572 	pop	af
   6912 F1            [10] 1573 	pop	af
   6913 C1            [10] 1574 	pop	bc
   6914 C3 BA 69      [10] 1575 	jp	00215$
   6917                    1576 00149$:
                           1577 ;src/juego.c:292: enemy_mov = cpct_rand()%3; //33% de moverse a izquierda, derecha o curarse
   6917 C5            [11] 1578 	push	bc
   6918 CD 15 70      [17] 1579 	call	_cpct_getRandom_mxor_u8
   691B 55            [ 4] 1580 	ld	d, l
   691C 3E 03         [ 7] 1581 	ld	a, #0x03
   691E F5            [11] 1582 	push	af
   691F 33            [ 6] 1583 	inc	sp
   6920 D5            [11] 1584 	push	de
   6921 33            [ 6] 1585 	inc	sp
   6922 CD A5 6F      [17] 1586 	call	__moduchar
   6925 F1            [10] 1587 	pop	af
   6926 5D            [ 4] 1588 	ld	e, l
   6927 C1            [10] 1589 	pop	bc
                           1590 ;src/juego.c:293: if (enemy_mov == 1) {
   6928 7B            [ 4] 1591 	ld	a, e
   6929 3D            [ 4] 1592 	dec	a
   692A 20 3E         [12] 1593 	jr	NZ,00146$
                           1594 ;src/juego.c:294: sprintf(temp, "%-9s GOES %c",entidad[i].name,242);
   692C DD 5E F4      [19] 1595 	ld	e,-12 (ix)
   692F DD 56 F5      [19] 1596 	ld	d,-11 (ix)
   6932 D5            [11] 1597 	push	de
   6933 FD E1         [14] 1598 	pop	iy
   6935 DD 5E FE      [19] 1599 	ld	e,-2 (ix)
   6938 DD 56 FF      [19] 1600 	ld	d,-1 (ix)
   693B C5            [11] 1601 	push	bc
   693C 21 F2 00      [10] 1602 	ld	hl, #0x00f2
   693F E5            [11] 1603 	push	hl
   6940 FD E5         [15] 1604 	push	iy
   6942 21 DB 6A      [10] 1605 	ld	hl, #___str_9
   6945 E5            [11] 1606 	push	hl
   6946 D5            [11] 1607 	push	de
   6947 CD DF 70      [17] 1608 	call	_sprintf
   694A 21 08 00      [10] 1609 	ld	hl, #8
   694D 39            [11] 1610 	add	hl, sp
   694E F9            [ 6] 1611 	ld	sp, hl
   694F C1            [10] 1612 	pop	bc
                           1613 ;src/juego.c:295: printConsole(temp, 0, 2);
   6950 DD 5E F6      [19] 1614 	ld	e,-10 (ix)
   6953 DD 56 F7      [19] 1615 	ld	d,-9 (ix)
   6956 C5            [11] 1616 	push	bc
   6957 21 00 02      [10] 1617 	ld	hl, #0x0200
   695A E5            [11] 1618 	push	hl
   695B D5            [11] 1619 	push	de
   695C CD 4A 62      [17] 1620 	call	_printConsole
   695F F1            [10] 1621 	pop	af
   6960 F1            [10] 1622 	pop	af
   6961 C1            [10] 1623 	pop	bc
                           1624 ;src/juego.c:297: nueva_pos = entidad[i].pos_x - 4;
   6962 0A            [ 7] 1625 	ld	a, (bc)
   6963 C6 FC         [ 7] 1626 	add	a, #0xfc
   6965 DD 77 CF      [19] 1627 	ld	-49 (ix), a
   6968 18 50         [12] 1628 	jr	00215$
   696A                    1629 00146$:
                           1630 ;src/juego.c:298: } else if (enemy_mov == 2) {
   696A 7B            [ 4] 1631 	ld	a, e
   696B D6 02         [ 7] 1632 	sub	a, #0x02
   696D 20 3E         [12] 1633 	jr	NZ,00143$
                           1634 ;src/juego.c:299: sprintf(temp, "%-9s GOES %c",entidad[i].name,243);
   696F DD 5E F4      [19] 1635 	ld	e,-12 (ix)
   6972 DD 56 F5      [19] 1636 	ld	d,-11 (ix)
   6975 D5            [11] 1637 	push	de
   6976 FD E1         [14] 1638 	pop	iy
   6978 DD 5E FA      [19] 1639 	ld	e,-6 (ix)
   697B DD 56 FB      [19] 1640 	ld	d,-5 (ix)
   697E C5            [11] 1641 	push	bc
   697F 21 F3 00      [10] 1642 	ld	hl, #0x00f3
   6982 E5            [11] 1643 	push	hl
   6983 FD E5         [15] 1644 	push	iy
   6985 21 DB 6A      [10] 1645 	ld	hl, #___str_9
   6988 E5            [11] 1646 	push	hl
   6989 D5            [11] 1647 	push	de
   698A CD DF 70      [17] 1648 	call	_sprintf
   698D 21 08 00      [10] 1649 	ld	hl, #8
   6990 39            [11] 1650 	add	hl, sp
   6991 F9            [ 6] 1651 	ld	sp, hl
   6992 C1            [10] 1652 	pop	bc
                           1653 ;src/juego.c:300: printConsole(temp, 0, 2);
   6993 DD 5E FC      [19] 1654 	ld	e,-4 (ix)
   6996 DD 56 FD      [19] 1655 	ld	d,-3 (ix)
   6999 C5            [11] 1656 	push	bc
   699A 21 00 02      [10] 1657 	ld	hl, #0x0200
   699D E5            [11] 1658 	push	hl
   699E D5            [11] 1659 	push	de
   699F CD 4A 62      [17] 1660 	call	_printConsole
   69A2 F1            [10] 1661 	pop	af
   69A3 F1            [10] 1662 	pop	af
   69A4 C1            [10] 1663 	pop	bc
                           1664 ;src/juego.c:302: nueva_pos = entidad[i].pos_x + 4;
   69A5 0A            [ 7] 1665 	ld	a, (bc)
   69A6 C6 04         [ 7] 1666 	add	a, #0x04
   69A8 DD 77 CF      [19] 1667 	ld	-49 (ix), a
   69AB 18 0D         [12] 1668 	jr	00215$
   69AD                    1669 00143$:
                           1670 ;src/juego.c:304: defender(&entidad[i]);
   69AD DD 5E F4      [19] 1671 	ld	e,-12 (ix)
   69B0 DD 56 F5      [19] 1672 	ld	d,-11 (ix)
   69B3 C5            [11] 1673 	push	bc
   69B4 D5            [11] 1674 	push	de
   69B5 CD E0 63      [17] 1675 	call	_defender
   69B8 F1            [10] 1676 	pop	af
   69B9 C1            [10] 1677 	pop	bc
                           1678 ;src/juego.c:308: for (j = 0; j < 3; j++) {
   69BA                    1679 00215$:
   69BA 1E 00         [ 7] 1680 	ld	e, #0x00
   69BC                    1681 00175$:
                           1682 ;src/juego.c:309: if (i!=j) {
   69BC DD 7E CC      [19] 1683 	ld	a, -52 (ix)
   69BF 93            [ 4] 1684 	sub	a, e
   69C0 28 22         [12] 1685 	jr	Z,00176$
                           1686 ;src/juego.c:310: if (entidad[j].pos_x == nueva_pos) {
   69C2 D5            [11] 1687 	push	de
   69C3 16 00         [ 7] 1688 	ld	d,#0x00
   69C5 6B            [ 4] 1689 	ld	l, e
   69C6 62            [ 4] 1690 	ld	h, d
   69C7 29            [11] 1691 	add	hl, hl
   69C8 29            [11] 1692 	add	hl, hl
   69C9 19            [11] 1693 	add	hl, de
   69CA 29            [11] 1694 	add	hl, hl
   69CB 29            [11] 1695 	add	hl, hl
   69CC D1            [10] 1696 	pop	de
   69CD C5            [11] 1697 	push	bc
   69CE 01 52 7E      [10] 1698 	ld	bc, #_entidad
   69D1 09            [11] 1699 	add	hl, bc
   69D2 01 0F 00      [10] 1700 	ld	bc, #0x000f
   69D5 09            [11] 1701 	add	hl, bc
   69D6 C1            [10] 1702 	pop	bc
   69D7 56            [ 7] 1703 	ld	d, (hl)
   69D8 DD 7E CF      [19] 1704 	ld	a, -49 (ix)
   69DB 92            [ 4] 1705 	sub	a, d
   69DC 20 06         [12] 1706 	jr	NZ,00176$
                           1707 ;src/juego.c:311: nueva_pos = 0;
   69DE DD 36 CF 00   [19] 1708 	ld	-49 (ix), #0x00
                           1709 ;src/juego.c:312: break;
   69E2 18 06         [12] 1710 	jr	00155$
   69E4                    1711 00176$:
                           1712 ;src/juego.c:308: for (j = 0; j < 3; j++) {
   69E4 1C            [ 4] 1713 	inc	e
   69E5 7B            [ 4] 1714 	ld	a, e
   69E6 D6 03         [ 7] 1715 	sub	a, #0x03
   69E8 38 D2         [12] 1716 	jr	C,00175$
   69EA                    1717 00155$:
                           1718 ;src/juego.c:318: if (nueva_pos > 3 && nueva_pos < 37)
   69EA 3E 03         [ 7] 1719 	ld	a, #0x03
   69EC DD 96 CF      [19] 1720 	sub	a, -49 (ix)
   69EF 30 0B         [12] 1721 	jr	NC,00178$
   69F1 DD 7E CF      [19] 1722 	ld	a, -49 (ix)
   69F4 D6 25         [ 7] 1723 	sub	a, #0x25
   69F6 30 04         [12] 1724 	jr	NC,00178$
                           1725 ;src/juego.c:319: entidad[i].pos_x = nueva_pos; 
   69F8 DD 7E CF      [19] 1726 	ld	a, -49 (ix)
   69FB 02            [ 7] 1727 	ld	(bc), a
   69FC                    1728 00178$:
                           1729 ;src/juego.c:287: for (i = 1; i < 3; i++) {
   69FC DD 34 CC      [23] 1730 	inc	-52 (ix)
   69FF DD 7E CC      [19] 1731 	ld	a, -52 (ix)
   6A02 D6 03         [ 7] 1732 	sub	a, #0x03
   6A04 DA AF 68      [10] 1733 	jp	C, 00177$
                           1734 ;src/juego.c:323: pausa();
   6A07 CD E7 5E      [17] 1735 	call	_pausa
                           1736 ;src/juego.c:324: pausaTecladoLibre();
   6A0A CD F4 5E      [17] 1737 	call	_pausaTecladoLibre
                           1738 ;src/juego.c:328: if (!(entidad[1].energy || entidad[2].energy)) {
   6A0D 3A 70 7E      [13] 1739 	ld	a,(#(_entidad + 0x001e) + 0)
                           1740 ;src/juego.c:331: entidad[0].energy = 0;
                           1741 ;src/juego.c:328: if (!(entidad[1].energy || entidad[2].energy)) {
   6A10 DD 77 F4      [19] 1742 	ld	-12 (ix), a
   6A13 B7            [ 4] 1743 	or	a, a
   6A14 20 69         [12] 1744 	jr	NZ,00166$
   6A16 3A 84 7E      [13] 1745 	ld	a, (#(_entidad + 0x0032) + 0)
   6A19 B7            [ 4] 1746 	or	a, a
   6A1A 20 63         [12] 1747 	jr	NZ,00166$
                           1748 ;src/juego.c:329: if (nivel == 10) {// Fin del Juego
   6A1C 3A 8E 7E      [13] 1749 	ld	a,(#_nivel + 0)
   6A1F D6 0A         [ 7] 1750 	sub	a, #0x0a
   6A21 20 23         [12] 1751 	jr	NZ,00163$
                           1752 ;src/juego.c:330: sprintf(temp, "CONGRATULATIONS!");
   6A23 DD 7E F8      [19] 1753 	ld	a, -8 (ix)
   6A26 DD 77 F4      [19] 1754 	ld	-12 (ix), a
   6A29 DD 7E F9      [19] 1755 	ld	a, -7 (ix)
   6A2C DD 77 F5      [19] 1756 	ld	-11 (ix), a
   6A2F 21 E8 6A      [10] 1757 	ld	hl, #___str_10
   6A32 E5            [11] 1758 	push	hl
   6A33 DD 6E F4      [19] 1759 	ld	l,-12 (ix)
   6A36 DD 66 F5      [19] 1760 	ld	h,-11 (ix)
   6A39 E5            [11] 1761 	push	hl
   6A3A CD DF 70      [17] 1762 	call	_sprintf
   6A3D F1            [10] 1763 	pop	af
   6A3E F1            [10] 1764 	pop	af
                           1765 ;src/juego.c:331: entidad[0].energy = 0;
   6A3F 21 5C 7E      [10] 1766 	ld	hl, #(_entidad + 0x000a)
   6A42 36 00         [10] 1767 	ld	(hl), #0x00
   6A44 18 25         [12] 1768 	jr	00164$
   6A46                    1769 00163$:
                           1770 ;src/juego.c:333: nivel++;
   6A46 21 8E 7E      [10] 1771 	ld	hl, #_nivel+0
   6A49 34            [11] 1772 	inc	(hl)
                           1773 ;src/juego.c:334: entidad[0].pos_x = 8;
   6A4A 21 61 7E      [10] 1774 	ld	hl, #(_entidad + 0x000f)
   6A4D 36 08         [10] 1775 	ld	(hl), #0x08
                           1776 ;src/juego.c:335: sprintf(temp, "   NEXT LEVEL   ");
   6A4F DD 7E F8      [19] 1777 	ld	a, -8 (ix)
   6A52 DD 77 F4      [19] 1778 	ld	-12 (ix), a
   6A55 DD 7E F9      [19] 1779 	ld	a, -7 (ix)
   6A58 DD 77 F5      [19] 1780 	ld	-11 (ix), a
   6A5B 21 F9 6A      [10] 1781 	ld	hl, #___str_11
   6A5E E5            [11] 1782 	push	hl
   6A5F DD 6E F4      [19] 1783 	ld	l,-12 (ix)
   6A62 DD 66 F5      [19] 1784 	ld	h,-11 (ix)
   6A65 E5            [11] 1785 	push	hl
   6A66 CD DF 70      [17] 1786 	call	_sprintf
   6A69 F1            [10] 1787 	pop	af
   6A6A F1            [10] 1788 	pop	af
   6A6B                    1789 00164$:
                           1790 ;src/juego.c:337: printConsole(temp, 0, 2);
   6A6B DD 4E F8      [19] 1791 	ld	c,-8 (ix)
   6A6E DD 46 F9      [19] 1792 	ld	b,-7 (ix)
   6A71 21 00 02      [10] 1793 	ld	hl, #0x0200
   6A74 E5            [11] 1794 	push	hl
   6A75 C5            [11] 1795 	push	bc
   6A76 CD 4A 62      [17] 1796 	call	_printConsole
   6A79 F1            [10] 1797 	pop	af
   6A7A F1            [10] 1798 	pop	af
                           1799 ;src/juego.c:338: return 0;
   6A7B 2E 00         [ 7] 1800 	ld	l, #0x00
   6A7D 18 44         [12] 1801 	jr	00179$
   6A7F                    1802 00166$:
                           1803 ;src/juego.c:342: if (!entidad[0].energy) {
   6A7F 3A 5C 7E      [13] 1804 	ld	a, (#(_entidad + 0x000a) + 0)
   6A82 B7            [ 4] 1805 	or	a, a
   6A83 20 3C         [12] 1806 	jr	NZ,00169$
                           1807 ;src/juego.c:343: sprintf(temp, "    GAME OVER   ");
   6A85 DD 7E F8      [19] 1808 	ld	a, -8 (ix)
   6A88 DD 77 F4      [19] 1809 	ld	-12 (ix), a
   6A8B DD 7E F9      [19] 1810 	ld	a, -7 (ix)
   6A8E DD 77 F5      [19] 1811 	ld	-11 (ix), a
   6A91 21 0A 6B      [10] 1812 	ld	hl, #___str_12
   6A94 E5            [11] 1813 	push	hl
   6A95 DD 6E F4      [19] 1814 	ld	l,-12 (ix)
   6A98 DD 66 F5      [19] 1815 	ld	h,-11 (ix)
   6A9B E5            [11] 1816 	push	hl
   6A9C CD DF 70      [17] 1817 	call	_sprintf
   6A9F F1            [10] 1818 	pop	af
   6AA0 F1            [10] 1819 	pop	af
                           1820 ;src/juego.c:344: printConsole(temp, 0, 2);
   6AA1 DD 7E F8      [19] 1821 	ld	a, -8 (ix)
   6AA4 DD 77 F4      [19] 1822 	ld	-12 (ix), a
   6AA7 DD 7E F9      [19] 1823 	ld	a, -7 (ix)
   6AAA DD 77 F5      [19] 1824 	ld	-11 (ix), a
   6AAD 21 00 02      [10] 1825 	ld	hl, #0x0200
   6AB0 E5            [11] 1826 	push	hl
   6AB1 DD 6E F4      [19] 1827 	ld	l,-12 (ix)
   6AB4 DD 66 F5      [19] 1828 	ld	h,-11 (ix)
   6AB7 E5            [11] 1829 	push	hl
   6AB8 CD 4A 62      [17] 1830 	call	_printConsole
   6ABB F1            [10] 1831 	pop	af
   6ABC F1            [10] 1832 	pop	af
                           1833 ;src/juego.c:345: return 0;
   6ABD 2E 00         [ 7] 1834 	ld	l, #0x00
   6ABF 18 02         [12] 1835 	jr	00179$
   6AC1                    1836 00169$:
                           1837 ;src/juego.c:348: return 1;
   6AC1 2E 01         [ 7] 1838 	ld	l, #0x01
   6AC3                    1839 00179$:
   6AC3 DD F9         [10] 1840 	ld	sp, ix
   6AC5 DD E1         [14] 1841 	pop	ix
   6AC7 C9            [10] 1842 	ret
   6AC8                    1843 ___str_8:
   6AC8 41 43 54 49 4F 4E  1844 	.ascii "ACTION (%c/%c/D) ?"
        20 28 25 63 2F 25
        63 2F 44 29 20 3F
   6ADA 00                 1845 	.db 0x00
   6ADB                    1846 ___str_9:
   6ADB 25 2D 39 73 20 47  1847 	.ascii "%-9s GOES %c"
        4F 45 53 20 25 63
   6AE7 00                 1848 	.db 0x00
   6AE8                    1849 ___str_10:
   6AE8 43 4F 4E 47 52 41  1850 	.ascii "CONGRATULATIONS!"
        54 55 4C 41 54 49
        4F 4E 53 21
   6AF8 00                 1851 	.db 0x00
   6AF9                    1852 ___str_11:
   6AF9 20 20 20 4E 45 58  1853 	.ascii "   NEXT LEVEL   "
        54 20 4C 45 56 45
        4C 20 20 20
   6B09 00                 1854 	.db 0x00
   6B0A                    1855 ___str_12:
   6B0A 20 20 20 20 47 41  1856 	.ascii "    GAME OVER   "
        4D 45 20 4F 56 45
        52 20 20 20
   6B1A 00                 1857 	.db 0x00
                           1858 ;src/juego.c:351: void juego() {
                           1859 ;	---------------------------------
                           1860 ; Function juego
                           1861 ; ---------------------------------
   6B1B                    1862 _juego::
                           1863 ;src/juego.c:352: initPlayer();
   6B1B CD 66 60      [17] 1864 	call	_initPlayer
                           1865 ;src/juego.c:354: while(entidad[0].energy) {
   6B1E                    1866 00107$:
   6B1E 3A 5C 7E      [13] 1867 	ld	a, (#(_entidad + 0x000a) + 0)
   6B21 B7            [ 4] 1868 	or	a, a
   6B22 C8            [11] 1869 	ret	Z
                           1870 ;src/juego.c:355: cpct_clearScreen(0x00);
   6B23 21 00 40      [10] 1871 	ld	hl, #0x4000
   6B26 E5            [11] 1872 	push	hl
   6B27 AF            [ 4] 1873 	xor	a, a
   6B28 F5            [11] 1874 	push	af
   6B29 33            [ 6] 1875 	inc	sp
   6B2A 26 C0         [ 7] 1876 	ld	h, #0xc0
   6B2C E5            [11] 1877 	push	hl
   6B2D CD 70 71      [17] 1878 	call	_cpct_memset
                           1879 ;src/juego.c:356: cursorConsola = 64;
   6B30 21 B8 7E      [10] 1880 	ld	hl,#_cursorConsola + 0
   6B33 36 40         [10] 1881 	ld	(hl), #0x40
                           1882 ;src/juego.c:358: dibujarMarco();
   6B35 CD FF 5E      [17] 1883 	call	_dibujarMarco
                           1884 ;src/juego.c:359: dibujarEscenario();
   6B38 CD 22 60      [17] 1885 	call	_dibujarEscenario
                           1886 ;src/juego.c:361: initNivel();
   6B3B CD AB 60      [17] 1887 	call	_initNivel
                           1888 ;src/juego.c:362: printLevel();
   6B3E CD 01 62      [17] 1889 	call	_printLevel
                           1890 ;src/juego.c:363: while (turno())
   6B41                    1891 00101$:
   6B41 CD B6 64      [17] 1892 	call	_turno
   6B44 7D            [ 4] 1893 	ld	a, l
   6B45 B7            [ 4] 1894 	or	a, a
   6B46 20 F9         [12] 1895 	jr	NZ,00101$
                           1896 ;src/juego.c:366: do {
   6B48                    1897 00104$:
                           1898 ;src/juego.c:367: cpct_scanKeyboard_f();
   6B48 CD 77 6D      [17] 1899 	call	_cpct_scanKeyboard_f
                           1900 ;src/juego.c:368: } while (!cpct_isAnyKeyPressed_f());
   6B4B CD 4D 71      [17] 1901 	call	_cpct_isAnyKeyPressed_f
   6B4E 7D            [ 4] 1902 	ld	a, l
   6B4F B7            [ 4] 1903 	or	a, a
   6B50 28 F6         [12] 1904 	jr	Z,00104$
   6B52 18 CA         [12] 1905 	jr	00107$
                           1906 	.area _CODE
                           1907 	.area _INITIALIZER
                           1908 	.area _CABS (ABS)
