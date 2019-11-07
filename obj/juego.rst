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
                             13 	.globl _drawPotion
                             14 	.globl _defender
                             15 	.globl _atacar
                             16 	.globl _printConsole
                             17 	.globl _printLevel
                             18 	.globl _printStats
                             19 	.globl _dibujarEscenario
                             20 	.globl _dibujarMarcoInterior
                             21 	.globl _dibujarMarcoExterior
                             22 	.globl _pausaTecladoLibre
                             23 	.globl _efecto_pliegue
                             24 	.globl _pausa
                             25 	.globl _abs
                             26 	.globl _initNivel
                             27 	.globl _initPlayer
                             28 	.globl _mydrawStringM1
                             29 	.globl _sprintf
                             30 	.globl _cpct_etm_drawTileBox2x4
                             31 	.globl _cpct_getRandom_mxor_u8
                             32 	.globl _cpct_getScreenPtr
                             33 	.globl _cpct_waitVSYNC
                             34 	.globl _cpct_drawSpriteMasked
                             35 	.globl _cpct_isAnyKeyPressed_f
                             36 	.globl _cpct_isKeyPressed
                             37 	.globl _cpct_scanKeyboard_f
                             38 	.globl _cpct_memset
                             39 ;--------------------------------------------------------
                             40 ; special function registers
                             41 ;--------------------------------------------------------
                             42 ;--------------------------------------------------------
                             43 ; ram data
                             44 ;--------------------------------------------------------
                             45 	.area _DATA
                             46 ;--------------------------------------------------------
                             47 ; ram data
                             48 ;--------------------------------------------------------
                             49 	.area _INITIALIZED
                             50 ;--------------------------------------------------------
                             51 ; absolute external ram data
                             52 ;--------------------------------------------------------
                             53 	.area _DABS (ABS)
                             54 ;--------------------------------------------------------
                             55 ; global & static initialisations
                             56 ;--------------------------------------------------------
                             57 	.area _HOME
                             58 	.area _GSINIT
                             59 	.area _GSFINAL
                             60 	.area _GSINIT
                             61 ;--------------------------------------------------------
                             62 ; Home
                             63 ;--------------------------------------------------------
                             64 	.area _HOME
                             65 	.area _HOME
                             66 ;--------------------------------------------------------
                             67 ; code
                             68 ;--------------------------------------------------------
                             69 	.area _CODE
                             70 ;src/juego.c:11: u8 turno() { //devuelve valor 0 cuando muere personaje o se termina nivel
                             71 ;	---------------------------------
                             72 ; Function turno
                             73 ; ---------------------------------
   49C6                      74 _turno::
   49C6 DD E5         [15]   75 	push	ix
   49C8 DD 21 00 00   [14]   76 	ld	ix,#0
   49CC DD 39         [15]   77 	add	ix,sp
   49CE 21 CC FF      [10]   78 	ld	hl, #-52
   49D1 39            [11]   79 	add	hl, sp
   49D2 F9            [ 6]   80 	ld	sp, hl
                             81 ;src/juego.c:16: for (i = 0; i < 3; i++) {
   49D3 DD 36 F3 00   [19]   82 	ld	-13 (ix), #0x00
   49D7                      83 00192$:
                             84 ;src/juego.c:17: mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
   49D7 3A DC 6E      [13]   85 	ld	a,(#_nivel + 0)
   49DA DD 77 FE      [19]   86 	ld	-2 (ix), a
   49DD DD 36 FF 00   [19]   87 	ld	-1 (ix), #0x00
   49E1 6F            [ 4]   88 	ld	l, a
   49E2 26 00         [ 7]   89 	ld	h, #0x00
   49E4 2B            [ 6]   90 	dec	hl
   49E5 DD 75 FE      [19]   91 	ld	-2 (ix), l
   49E8 DD 74 FF      [19]   92 	ld	-1 (ix), h
   49EB 4D            [ 4]   93 	ld	c,l
   49EC 44            [ 4]   94 	ld	b,h
   49ED 29            [11]   95 	add	hl, hl
   49EE 09            [11]   96 	add	hl, bc
   49EF 29            [11]   97 	add	hl, hl
   49F0 09            [11]   98 	add	hl, bc
   49F1 29            [11]   99 	add	hl, hl
   49F2 09            [11]  100 	add	hl, bc
   49F3 29            [11]  101 	add	hl, hl
   49F4 09            [11]  102 	add	hl, bc
   49F5 29            [11]  103 	add	hl, hl
   49F6 09            [11]  104 	add	hl, bc
   49F7 29            [11]  105 	add	hl, hl
   49F8 29            [11]  106 	add	hl, hl
   49F9 29            [11]  107 	add	hl, hl
   49FA DD 75 FE      [19]  108 	ld	-2 (ix), l
   49FD DD 74 FF      [19]  109 	ld	-1 (ix), h
   4A00 3E 40         [ 7]  110 	ld	a, #<(_g_mapa01)
   4A02 DD 86 FE      [19]  111 	add	a, -2 (ix)
   4A05 DD 77 FE      [19]  112 	ld	-2 (ix), a
   4A08 3E 03         [ 7]  113 	ld	a, #>(_g_mapa01)
   4A0A DD 8E FF      [19]  114 	adc	a, -1 (ix)
   4A0D DD 77 FF      [19]  115 	ld	-1 (ix), a
   4A10 DD 7E FE      [19]  116 	ld	a, -2 (ix)
   4A13 DD 77 CC      [19]  117 	ld	-52 (ix), a
   4A16 DD 7E FF      [19]  118 	ld	a, -1 (ix)
   4A19 DD 77 CD      [19]  119 	ld	-51 (ix), a
                            120 ;src/juego.c:18: cpct_etm_drawTileBox2x4 ((entidad[i].pos_x_ant - 4)/2, 17, 2, 7, 18, INICIO_AREA_JUEGO, mapa );
   4A1C DD 7E CC      [19]  121 	ld	a, -52 (ix)
   4A1F DD 77 FE      [19]  122 	ld	-2 (ix), a
   4A22 DD 7E CD      [19]  123 	ld	a, -51 (ix)
   4A25 DD 77 FF      [19]  124 	ld	-1 (ix), a
   4A28 DD 36 FC 84   [19]  125 	ld	-4 (ix), #0x84
   4A2C DD 36 FD C2   [19]  126 	ld	-3 (ix), #0xc2
   4A30 DD 4E F3      [19]  127 	ld	c,-13 (ix)
   4A33 06 00         [ 7]  128 	ld	b,#0x00
   4A35 69            [ 4]  129 	ld	l, c
   4A36 60            [ 4]  130 	ld	h, b
   4A37 29            [11]  131 	add	hl, hl
   4A38 29            [11]  132 	add	hl, hl
   4A39 09            [11]  133 	add	hl, bc
   4A3A 29            [11]  134 	add	hl, hl
   4A3B 29            [11]  135 	add	hl, hl
   4A3C 01 A0 6E      [10]  136 	ld	bc,#_entidad
   4A3F 09            [11]  137 	add	hl,bc
   4A40 DD 75 FA      [19]  138 	ld	-6 (ix), l
   4A43 DD 74 FB      [19]  139 	ld	-5 (ix), h
   4A46 11 10 00      [10]  140 	ld	de, #0x0010
   4A49 19            [11]  141 	add	hl, de
   4A4A 7E            [ 7]  142 	ld	a, (hl)
   4A4B DD 77 FA      [19]  143 	ld	-6 (ix), a
   4A4E DD 77 FA      [19]  144 	ld	-6 (ix), a
   4A51 DD 36 FB 00   [19]  145 	ld	-5 (ix), #0x00
   4A55 DD 7E FA      [19]  146 	ld	a, -6 (ix)
   4A58 C6 FC         [ 7]  147 	add	a, #0xfc
   4A5A 4F            [ 4]  148 	ld	c, a
   4A5B DD 7E FB      [19]  149 	ld	a, -5 (ix)
   4A5E CE FF         [ 7]  150 	adc	a, #0xff
   4A60 47            [ 4]  151 	ld	b, a
   4A61 DD 71 F8      [19]  152 	ld	-8 (ix), c
   4A64 DD 70 F9      [19]  153 	ld	-7 (ix), b
   4A67 CB 78         [ 8]  154 	bit	7, b
   4A69 28 10         [12]  155 	jr	Z,00202$
   4A6B DD 7E FA      [19]  156 	ld	a, -6 (ix)
   4A6E C6 FD         [ 7]  157 	add	a, #0xfd
   4A70 DD 77 F8      [19]  158 	ld	-8 (ix), a
   4A73 DD 7E FB      [19]  159 	ld	a, -5 (ix)
   4A76 CE FF         [ 7]  160 	adc	a, #0xff
   4A78 DD 77 F9      [19]  161 	ld	-7 (ix), a
   4A7B                     162 00202$:
   4A7B DD 46 F8      [19]  163 	ld	b, -8 (ix)
   4A7E DD 4E F9      [19]  164 	ld	c, -7 (ix)
   4A81 CB 29         [ 8]  165 	sra	c
   4A83 CB 18         [ 8]  166 	rr	b
   4A85 DD 6E FE      [19]  167 	ld	l,-2 (ix)
   4A88 DD 66 FF      [19]  168 	ld	h,-1 (ix)
   4A8B E5            [11]  169 	push	hl
   4A8C DD 6E FC      [19]  170 	ld	l,-4 (ix)
   4A8F DD 66 FD      [19]  171 	ld	h,-3 (ix)
   4A92 E5            [11]  172 	push	hl
   4A93 21 07 12      [10]  173 	ld	hl, #0x1207
   4A96 E5            [11]  174 	push	hl
   4A97 21 11 02      [10]  175 	ld	hl, #0x0211
   4A9A E5            [11]  176 	push	hl
   4A9B C5            [11]  177 	push	bc
   4A9C 33            [ 6]  178 	inc	sp
   4A9D CD 69 5F      [17]  179 	call	_cpct_etm_drawTileBox2x4
                            180 ;src/juego.c:16: for (i = 0; i < 3; i++) {
   4AA0 DD 34 F3      [23]  181 	inc	-13 (ix)
   4AA3 DD 7E F3      [19]  182 	ld	a, -13 (ix)
   4AA6 D6 03         [ 7]  183 	sub	a, #0x03
   4AA8 DA D7 49      [10]  184 	jp	C, 00192$
                            185 ;src/juego.c:21: cpct_waitVSYNC();
   4AAB CD 8E 61      [17]  186 	call	_cpct_waitVSYNC
                            187 ;src/juego.c:23: for (i = 0; i < 3; i++) {
   4AAE DD 36 F3 00   [19]  188 	ld	-13 (ix), #0x00
   4AB2                     189 00194$:
                            190 ;src/juego.c:24: if (entidad[i].energy) {
   4AB2 DD 4E F3      [19]  191 	ld	c,-13 (ix)
   4AB5 06 00         [ 7]  192 	ld	b,#0x00
   4AB7 69            [ 4]  193 	ld	l, c
   4AB8 60            [ 4]  194 	ld	h, b
   4AB9 29            [11]  195 	add	hl, hl
   4ABA 29            [11]  196 	add	hl, hl
   4ABB 09            [11]  197 	add	hl, bc
   4ABC 29            [11]  198 	add	hl, hl
   4ABD 29            [11]  199 	add	hl, hl
   4ABE DD 75 F8      [19]  200 	ld	-8 (ix), l
   4AC1 DD 74 F9      [19]  201 	ld	-7 (ix), h
   4AC4 DD 7E F8      [19]  202 	ld	a, -8 (ix)
   4AC7 C6 A0         [ 7]  203 	add	a, #<(_entidad)
   4AC9 DD 77 F8      [19]  204 	ld	-8 (ix), a
   4ACC DD 7E F9      [19]  205 	ld	a, -7 (ix)
   4ACF CE 6E         [ 7]  206 	adc	a, #>(_entidad)
   4AD1 DD 77 F9      [19]  207 	ld	-7 (ix), a
   4AD4 DD 7E F8      [19]  208 	ld	a, -8 (ix)
   4AD7 DD 77 FA      [19]  209 	ld	-6 (ix), a
   4ADA DD 7E F9      [19]  210 	ld	a, -7 (ix)
   4ADD DD 77 FB      [19]  211 	ld	-5 (ix), a
   4AE0 DD 6E FA      [19]  212 	ld	l,-6 (ix)
   4AE3 DD 66 FB      [19]  213 	ld	h,-5 (ix)
   4AE6 11 0A 00      [10]  214 	ld	de, #0x000a
   4AE9 19            [11]  215 	add	hl, de
   4AEA 7E            [ 7]  216 	ld	a, (hl)
   4AEB DD 77 FA      [19]  217 	ld	-6 (ix), a
   4AEE B7            [ 4]  218 	or	a, a
   4AEF CA 7B 4B      [10]  219 	jp	Z, 00195$
                            220 ;src/juego.c:25: printStats(&entidad[i]);
   4AF2 DD 7E F8      [19]  221 	ld	a, -8 (ix)
   4AF5 DD 77 FA      [19]  222 	ld	-6 (ix), a
   4AF8 DD 7E F9      [19]  223 	ld	a, -7 (ix)
   4AFB DD 77 FB      [19]  224 	ld	-5 (ix), a
   4AFE DD 6E FA      [19]  225 	ld	l,-6 (ix)
   4B01 DD 66 FB      [19]  226 	ld	h,-5 (ix)
   4B04 E5            [11]  227 	push	hl
   4B05 CD EA 54      [17]  228 	call	_printStats
   4B08 F1            [10]  229 	pop	af
                            230 ;src/juego.c:26: cpct_drawSpriteMasked (entidad[i].sprite, cpct_getScreenPtr (CPCT_VMEM_START, entidad[i].pos_x, 132), 4,28);
   4B09 DD 7E F8      [19]  231 	ld	a, -8 (ix)
   4B0C C6 0F         [ 7]  232 	add	a, #0x0f
   4B0E DD 77 FA      [19]  233 	ld	-6 (ix), a
   4B11 DD 7E F9      [19]  234 	ld	a, -7 (ix)
   4B14 CE 00         [ 7]  235 	adc	a, #0x00
   4B16 DD 77 FB      [19]  236 	ld	-5 (ix), a
   4B19 DD 6E FA      [19]  237 	ld	l,-6 (ix)
   4B1C DD 66 FB      [19]  238 	ld	h,-5 (ix)
   4B1F 46            [ 7]  239 	ld	b, (hl)
   4B20 3E 84         [ 7]  240 	ld	a, #0x84
   4B22 F5            [11]  241 	push	af
   4B23 33            [ 6]  242 	inc	sp
   4B24 C5            [11]  243 	push	bc
   4B25 33            [ 6]  244 	inc	sp
   4B26 21 00 C0      [10]  245 	ld	hl, #0xc000
   4B29 E5            [11]  246 	push	hl
   4B2A CD D3 62      [17]  247 	call	_cpct_getScreenPtr
   4B2D DD 74 FD      [19]  248 	ld	-3 (ix), h
   4B30 DD 75 FC      [19]  249 	ld	-4 (ix), l
   4B33 DD 7E F8      [19]  250 	ld	a, -8 (ix)
   4B36 DD 77 FE      [19]  251 	ld	-2 (ix), a
   4B39 DD 7E F9      [19]  252 	ld	a, -7 (ix)
   4B3C DD 77 FF      [19]  253 	ld	-1 (ix), a
   4B3F DD 6E FE      [19]  254 	ld	l,-2 (ix)
   4B42 DD 66 FF      [19]  255 	ld	h,-1 (ix)
   4B45 11 12 00      [10]  256 	ld	de, #0x0012
   4B48 19            [11]  257 	add	hl, de
   4B49 7E            [ 7]  258 	ld	a, (hl)
   4B4A DD 77 FE      [19]  259 	ld	-2 (ix), a
   4B4D 23            [ 6]  260 	inc	hl
   4B4E 7E            [ 7]  261 	ld	a, (hl)
   4B4F DD 77 FF      [19]  262 	ld	-1 (ix), a
   4B52 21 04 1C      [10]  263 	ld	hl, #0x1c04
   4B55 E5            [11]  264 	push	hl
   4B56 DD 6E FC      [19]  265 	ld	l,-4 (ix)
   4B59 DD 66 FD      [19]  266 	ld	h,-3 (ix)
   4B5C E5            [11]  267 	push	hl
   4B5D DD 6E FE      [19]  268 	ld	l,-2 (ix)
   4B60 DD 66 FF      [19]  269 	ld	h,-1 (ix)
   4B63 E5            [11]  270 	push	hl
   4B64 CD B2 60      [17]  271 	call	_cpct_drawSpriteMasked
                            272 ;src/juego.c:27: entidad[i].pos_x_ant = entidad[i].pos_x;
   4B67 DD 7E F8      [19]  273 	ld	a, -8 (ix)
   4B6A C6 10         [ 7]  274 	add	a, #0x10
   4B6C 4F            [ 4]  275 	ld	c, a
   4B6D DD 7E F9      [19]  276 	ld	a, -7 (ix)
   4B70 CE 00         [ 7]  277 	adc	a, #0x00
   4B72 47            [ 4]  278 	ld	b, a
   4B73 DD 6E FA      [19]  279 	ld	l,-6 (ix)
   4B76 DD 66 FB      [19]  280 	ld	h,-5 (ix)
   4B79 7E            [ 7]  281 	ld	a, (hl)
   4B7A 02            [ 7]  282 	ld	(bc), a
   4B7B                     283 00195$:
                            284 ;src/juego.c:23: for (i = 0; i < 3; i++) {
   4B7B DD 34 F3      [23]  285 	inc	-13 (ix)
   4B7E DD 7E F3      [19]  286 	ld	a, -13 (ix)
   4B81 D6 03         [ 7]  287 	sub	a, #0x03
   4B83 DA B2 4A      [10]  288 	jp	C, 00194$
                            289 ;src/juego.c:31: if (nivel == 5 || nivel == 15 || nivel == 25) {
   4B86 FD 21 DC 6E   [14]  290 	ld	iy, #_nivel
   4B8A FD 7E 00      [19]  291 	ld	a, 0 (iy)
   4B8D D6 05         [ 7]  292 	sub	a, #0x05
   4B8F 28 0E         [12]  293 	jr	Z,00105$
   4B91 FD 7E 00      [19]  294 	ld	a, 0 (iy)
   4B94 D6 0F         [ 7]  295 	sub	a, #0x0f
   4B96 28 07         [12]  296 	jr	Z,00105$
   4B98 FD 7E 00      [19]  297 	ld	a, 0 (iy)
   4B9B D6 19         [ 7]  298 	sub	a, #0x19
   4B9D 20 03         [12]  299 	jr	NZ,00106$
   4B9F                     300 00105$:
                            301 ;src/juego.c:32: drawPotion();
   4B9F CD 89 58      [17]  302 	call	_drawPotion
   4BA2                     303 00106$:
                            304 ;src/juego.c:39: i = 0;
   4BA2 DD 36 F3 00   [19]  305 	ld	-13 (ix), #0x00
                            306 ;src/juego.c:40: do  {
   4BA6 21 03 00      [10]  307 	ld	hl, #0x0003
   4BA9 39            [11]  308 	add	hl, sp
   4BAA DD 75 F8      [19]  309 	ld	-8 (ix), l
   4BAD DD 74 F9      [19]  310 	ld	-7 (ix), h
   4BB0                     311 00121$:
                            312 ;src/juego.c:41: cpct_scanKeyboard_f();
   4BB0 CD 4E 5E      [17]  313 	call	_cpct_scanKeyboard_f
                            314 ;src/juego.c:42: sprintf(temp, "ACTION (</>/D) ?");
   4BB3 DD 7E F8      [19]  315 	ld	a, -8 (ix)
   4BB6 DD 77 FA      [19]  316 	ld	-6 (ix), a
   4BB9 DD 7E F9      [19]  317 	ld	a, -7 (ix)
   4BBC DD 77 FB      [19]  318 	ld	-5 (ix), a
   4BBF 21 E3 50      [10]  319 	ld	hl, #___str_0
   4BC2 E5            [11]  320 	push	hl
   4BC3 DD 6E FA      [19]  321 	ld	l,-6 (ix)
   4BC6 DD 66 FB      [19]  322 	ld	h,-5 (ix)
   4BC9 E5            [11]  323 	push	hl
   4BCA CD 36 61      [17]  324 	call	_sprintf
   4BCD F1            [10]  325 	pop	af
   4BCE F1            [10]  326 	pop	af
                            327 ;src/juego.c:43: if (i < 25) {
   4BCF DD 7E F3      [19]  328 	ld	a, -13 (ix)
   4BD2 D6 19         [ 7]  329 	sub	a, #0x19
   4BD4 30 1E         [12]  330 	jr	NC,00110$
                            331 ;src/juego.c:44: printConsole(temp, 2, 0);
   4BD6 DD 7E F8      [19]  332 	ld	a, -8 (ix)
   4BD9 DD 77 FA      [19]  333 	ld	-6 (ix), a
   4BDC DD 7E F9      [19]  334 	ld	a, -7 (ix)
   4BDF DD 77 FB      [19]  335 	ld	-5 (ix), a
   4BE2 21 02 00      [10]  336 	ld	hl, #0x0002
   4BE5 E5            [11]  337 	push	hl
   4BE6 DD 6E FA      [19]  338 	ld	l,-6 (ix)
   4BE9 DD 66 FB      [19]  339 	ld	h,-5 (ix)
   4BEC E5            [11]  340 	push	hl
   4BED CD 1D 56      [17]  341 	call	_printConsole
   4BF0 F1            [10]  342 	pop	af
   4BF1 F1            [10]  343 	pop	af
   4BF2 18 1C         [12]  344 	jr	00111$
   4BF4                     345 00110$:
                            346 ;src/juego.c:46: printConsole(temp, 0, 2);
   4BF4 DD 7E F8      [19]  347 	ld	a, -8 (ix)
   4BF7 DD 77 FA      [19]  348 	ld	-6 (ix), a
   4BFA DD 7E F9      [19]  349 	ld	a, -7 (ix)
   4BFD DD 77 FB      [19]  350 	ld	-5 (ix), a
   4C00 21 00 02      [10]  351 	ld	hl, #0x0200
   4C03 E5            [11]  352 	push	hl
   4C04 DD 6E FA      [19]  353 	ld	l,-6 (ix)
   4C07 DD 66 FB      [19]  354 	ld	h,-5 (ix)
   4C0A E5            [11]  355 	push	hl
   4C0B CD 1D 56      [17]  356 	call	_printConsole
   4C0E F1            [10]  357 	pop	af
   4C0F F1            [10]  358 	pop	af
   4C10                     359 00111$:
                            360 ;src/juego.c:48: i++;
   4C10 DD 34 F3      [23]  361 	inc	-13 (ix)
                            362 ;src/juego.c:49: cursorConsola -=8;
   4C13 21 DD 6E      [10]  363 	ld	hl, #_cursorConsola
   4C16 7E            [ 7]  364 	ld	a, (hl)
   4C17 C6 F8         [ 7]  365 	add	a, #0xf8
   4C19 77            [ 7]  366 	ld	(hl), a
                            367 ;src/juego.c:50: if (i == 50)
   4C1A DD 7E F3      [19]  368 	ld	a, -13 (ix)
   4C1D D6 32         [ 7]  369 	sub	a, #0x32
   4C1F 20 04         [12]  370 	jr	NZ,00122$
                            371 ;src/juego.c:51: i=0;
   4C21 DD 36 F3 00   [19]  372 	ld	-13 (ix), #0x00
   4C25                     373 00122$:
                            374 ;src/juego.c:53: while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_CursorLeft)  && !cpct_isKeyPressed(Joy0_Left) 
   4C25 21 04 04      [10]  375 	ld	hl, #0x0404
   4C28 CD 2B 5E      [17]  376 	call	_cpct_isKeyPressed
   4C2B DD 75 FA      [19]  377 	ld	-6 (ix), l
   4C2E 7D            [ 4]  378 	ld	a, l
   4C2F B7            [ 4]  379 	or	a, a
   4C30 20 4A         [12]  380 	jr	NZ,00123$
   4C32 21 01 01      [10]  381 	ld	hl, #0x0101
   4C35 CD 2B 5E      [17]  382 	call	_cpct_isKeyPressed
   4C38 DD 75 FA      [19]  383 	ld	-6 (ix), l
   4C3B 7D            [ 4]  384 	ld	a, l
   4C3C B7            [ 4]  385 	or	a, a
   4C3D 20 3D         [12]  386 	jr	NZ,00123$
   4C3F 21 09 04      [10]  387 	ld	hl, #0x0409
   4C42 CD 2B 5E      [17]  388 	call	_cpct_isKeyPressed
   4C45 7D            [ 4]  389 	ld	a, l
   4C46 B7            [ 4]  390 	or	a, a
   4C47 20 33         [12]  391 	jr	NZ,00123$
                            392 ;src/juego.c:54: && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_CursorRight) && !cpct_isKeyPressed(Joy0_Right) 
   4C49 21 03 08      [10]  393 	ld	hl, #0x0803
   4C4C CD 2B 5E      [17]  394 	call	_cpct_isKeyPressed
   4C4F 7D            [ 4]  395 	ld	a, l
   4C50 B7            [ 4]  396 	or	a, a
   4C51 20 29         [12]  397 	jr	NZ,00123$
   4C53 21 00 02      [10]  398 	ld	hl, #0x0200
   4C56 CD 2B 5E      [17]  399 	call	_cpct_isKeyPressed
   4C59 7D            [ 4]  400 	ld	a, l
   4C5A B7            [ 4]  401 	or	a, a
   4C5B 20 1F         [12]  402 	jr	NZ,00123$
   4C5D 21 09 08      [10]  403 	ld	hl, #0x0809
   4C60 CD 2B 5E      [17]  404 	call	_cpct_isKeyPressed
   4C63 7D            [ 4]  405 	ld	a, l
   4C64 B7            [ 4]  406 	or	a, a
   4C65 20 15         [12]  407 	jr	NZ,00123$
                            408 ;src/juego.c:55: && !cpct_isKeyPressed(Key_D) && !cpct_isKeyPressed(Joy0_Fire1));
   4C67 21 07 20      [10]  409 	ld	hl, #0x2007
   4C6A CD 2B 5E      [17]  410 	call	_cpct_isKeyPressed
   4C6D 7D            [ 4]  411 	ld	a, l
   4C6E B7            [ 4]  412 	or	a, a
   4C6F 20 0B         [12]  413 	jr	NZ,00123$
   4C71 21 09 10      [10]  414 	ld	hl, #0x1009
   4C74 CD 2B 5E      [17]  415 	call	_cpct_isKeyPressed
   4C77 7D            [ 4]  416 	ld	a, l
   4C78 B7            [ 4]  417 	or	a, a
   4C79 CA B0 4B      [10]  418 	jp	Z, 00121$
   4C7C                     419 00123$:
                            420 ;src/juego.c:57: nueva_pos = 0;
   4C7C DD 36 CE 00   [19]  421 	ld	-50 (ix), #0x00
                            422 ;src/juego.c:60: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
   4C80 21 04 04      [10]  423 	ld	hl, #0x0404
   4C83 CD 2B 5E      [17]  424 	call	_cpct_isKeyPressed
                            425 ;src/juego.c:64: nueva_pos = entidad[0].pos_x - 4;
                            426 ;src/juego.c:60: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
   4C86 7D            [ 4]  427 	ld	a, l
   4C87 B7            [ 4]  428 	or	a, a
   4C88 20 14         [12]  429 	jr	NZ,00124$
   4C8A 21 01 01      [10]  430 	ld	hl, #0x0101
   4C8D CD 2B 5E      [17]  431 	call	_cpct_isKeyPressed
   4C90 7D            [ 4]  432 	ld	a, l
   4C91 B7            [ 4]  433 	or	a, a
   4C92 20 0A         [12]  434 	jr	NZ,00124$
   4C94 21 09 04      [10]  435 	ld	hl, #0x0409
   4C97 CD 2B 5E      [17]  436 	call	_cpct_isKeyPressed
   4C9A 7D            [ 4]  437 	ld	a, l
   4C9B B7            [ 4]  438 	or	a, a
   4C9C 28 2F         [12]  439 	jr	Z,00125$
   4C9E                     440 00124$:
                            441 ;src/juego.c:61: sprintf(temp, "%-9s GOES <",entidad[0].name);
   4C9E 11 F4 50      [10]  442 	ld	de, #___str_1+0
   4CA1 DD 4E F8      [19]  443 	ld	c,-8 (ix)
   4CA4 DD 46 F9      [19]  444 	ld	b,-7 (ix)
   4CA7 21 A0 6E      [10]  445 	ld	hl, #_entidad
   4CAA E5            [11]  446 	push	hl
   4CAB D5            [11]  447 	push	de
   4CAC C5            [11]  448 	push	bc
   4CAD CD 36 61      [17]  449 	call	_sprintf
   4CB0 21 06 00      [10]  450 	ld	hl, #6
   4CB3 39            [11]  451 	add	hl, sp
   4CB4 F9            [ 6]  452 	ld	sp, hl
                            453 ;src/juego.c:62: printConsole(temp, 2, 0);
   4CB5 DD 4E F8      [19]  454 	ld	c,-8 (ix)
   4CB8 DD 46 F9      [19]  455 	ld	b,-7 (ix)
   4CBB 21 02 00      [10]  456 	ld	hl, #0x0002
   4CBE E5            [11]  457 	push	hl
   4CBF C5            [11]  458 	push	bc
   4CC0 CD 1D 56      [17]  459 	call	_printConsole
   4CC3 F1            [10]  460 	pop	af
   4CC4 F1            [10]  461 	pop	af
                            462 ;src/juego.c:64: nueva_pos = entidad[0].pos_x - 4;
   4CC5 3A AF 6E      [13]  463 	ld	a, (#(_entidad + 0x000f) + 0)
   4CC8 C6 FC         [ 7]  464 	add	a, #0xfc
   4CCA DD 77 CE      [19]  465 	ld	-50 (ix), a
   4CCD                     466 00125$:
                            467 ;src/juego.c:68: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
   4CCD 21 03 08      [10]  468 	ld	hl, #0x0803
   4CD0 CD 2B 5E      [17]  469 	call	_cpct_isKeyPressed
                            470 ;src/juego.c:74: if (nueva_pos == entidad[1].pos_x && entidad[1].energy)
                            471 ;src/juego.c:77: if (nueva_pos == entidad[2].pos_x && entidad[2].energy)
                            472 ;src/juego.c:68: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
   4CD3 7D            [ 4]  473 	ld	a, l
   4CD4 B7            [ 4]  474 	or	a, a
   4CD5 20 14         [12]  475 	jr	NZ,00134$
   4CD7 21 00 02      [10]  476 	ld	hl, #0x0200
   4CDA CD 2B 5E      [17]  477 	call	_cpct_isKeyPressed
   4CDD 7D            [ 4]  478 	ld	a, l
   4CDE B7            [ 4]  479 	or	a, a
   4CDF 20 0A         [12]  480 	jr	NZ,00134$
   4CE1 21 09 08      [10]  481 	ld	hl, #0x0809
   4CE4 CD 2B 5E      [17]  482 	call	_cpct_isKeyPressed
   4CE7 7D            [ 4]  483 	ld	a, l
   4CE8 B7            [ 4]  484 	or	a, a
   4CE9 28 6A         [12]  485 	jr	Z,00135$
   4CEB                     486 00134$:
                            487 ;src/juego.c:69: sprintf(temp, "%-9s GOES >",entidad[0].name);
   4CEB 11 00 51      [10]  488 	ld	de, #___str_2+0
   4CEE DD 4E F8      [19]  489 	ld	c,-8 (ix)
   4CF1 DD 46 F9      [19]  490 	ld	b,-7 (ix)
   4CF4 21 A0 6E      [10]  491 	ld	hl, #_entidad
   4CF7 E5            [11]  492 	push	hl
   4CF8 D5            [11]  493 	push	de
   4CF9 C5            [11]  494 	push	bc
   4CFA CD 36 61      [17]  495 	call	_sprintf
   4CFD 21 06 00      [10]  496 	ld	hl, #6
   4D00 39            [11]  497 	add	hl, sp
   4D01 F9            [ 6]  498 	ld	sp, hl
                            499 ;src/juego.c:70: printConsole(temp, 2 ,0);
   4D02 DD 4E F8      [19]  500 	ld	c,-8 (ix)
   4D05 DD 46 F9      [19]  501 	ld	b,-7 (ix)
   4D08 21 02 00      [10]  502 	ld	hl, #0x0002
   4D0B E5            [11]  503 	push	hl
   4D0C C5            [11]  504 	push	bc
   4D0D CD 1D 56      [17]  505 	call	_printConsole
   4D10 F1            [10]  506 	pop	af
   4D11 F1            [10]  507 	pop	af
                            508 ;src/juego.c:72: nueva_pos = entidad[0].pos_x + 4;
   4D12 3A AF 6E      [13]  509 	ld	a, (#(_entidad + 0x000f) + 0)
   4D15 C6 04         [ 7]  510 	add	a, #0x04
   4D17 DD 77 CE      [19]  511 	ld	-50 (ix), a
                            512 ;src/juego.c:74: if (nueva_pos == entidad[1].pos_x && entidad[1].energy)
   4D1A 21 C3 6E      [10]  513 	ld	hl, #(_entidad + 0x0023) + 0
   4D1D DD 7E CE      [19]  514 	ld	a,-50 (ix)
   4D20 96            [ 7]  515 	sub	a,(hl)
   4D21 20 16         [12]  516 	jr	NZ,00129$
   4D23 3A BE 6E      [13]  517 	ld	a,(#(_entidad + 0x001e) + 0)
   4D26 DD 77 FA      [19]  518 	ld	-6 (ix), a
   4D29 B7            [ 4]  519 	or	a, a
   4D2A 28 0D         [12]  520 	jr	Z,00129$
                            521 ;src/juego.c:75: atacar(&entidad[0], &entidad[1]);
   4D2C 21 B4 6E      [10]  522 	ld	hl, #(_entidad + 0x0014)
   4D2F E5            [11]  523 	push	hl
   4D30 21 A0 6E      [10]  524 	ld	hl, #_entidad
   4D33 E5            [11]  525 	push	hl
   4D34 CD 82 56      [17]  526 	call	_atacar
   4D37 F1            [10]  527 	pop	af
   4D38 F1            [10]  528 	pop	af
   4D39                     529 00129$:
                            530 ;src/juego.c:77: if (nueva_pos == entidad[2].pos_x && entidad[2].energy)
   4D39 21 D7 6E      [10]  531 	ld	hl, #(_entidad + 0x0037) + 0
   4D3C DD 7E CE      [19]  532 	ld	a,-50 (ix)
   4D3F 96            [ 7]  533 	sub	a,(hl)
   4D40 20 13         [12]  534 	jr	NZ,00135$
   4D42 3A D2 6E      [13]  535 	ld	a, (#(_entidad + 0x0032) + 0)
   4D45 B7            [ 4]  536 	or	a, a
   4D46 28 0D         [12]  537 	jr	Z,00135$
                            538 ;src/juego.c:78: atacar(&entidad[0], &entidad[2]);
   4D48 21 C8 6E      [10]  539 	ld	hl, #(_entidad + 0x0028)
   4D4B E5            [11]  540 	push	hl
   4D4C 21 A0 6E      [10]  541 	ld	hl, #_entidad
   4D4F E5            [11]  542 	push	hl
   4D50 CD 82 56      [17]  543 	call	_atacar
   4D53 F1            [10]  544 	pop	af
   4D54 F1            [10]  545 	pop	af
   4D55                     546 00135$:
                            547 ;src/juego.c:83: if (cpct_isKeyPressed(Key_D) || cpct_isKeyPressed(Joy0_Fire1)) {
   4D55 21 07 20      [10]  548 	ld	hl, #0x2007
   4D58 CD 2B 5E      [17]  549 	call	_cpct_isKeyPressed
   4D5B 7D            [ 4]  550 	ld	a, l
   4D5C B7            [ 4]  551 	or	a, a
   4D5D 20 0A         [12]  552 	jr	NZ,00138$
   4D5F 21 09 10      [10]  553 	ld	hl, #0x1009
   4D62 CD 2B 5E      [17]  554 	call	_cpct_isKeyPressed
   4D65 7D            [ 4]  555 	ld	a, l
   4D66 B7            [ 4]  556 	or	a, a
   4D67 28 08         [12]  557 	jr	Z,00139$
   4D69                     558 00138$:
                            559 ;src/juego.c:84: defender(&entidad[0]);
   4D69 21 A0 6E      [10]  560 	ld	hl, #_entidad
   4D6C E5            [11]  561 	push	hl
   4D6D CD B8 57      [17]  562 	call	_defender
   4D70 F1            [10]  563 	pop	af
   4D71                     564 00139$:
                            565 ;src/juego.c:90: && nueva_pos < 37 
   4D71 3E 03         [ 7]  566 	ld	a, #0x03
   4D73 DD 96 CE      [19]  567 	sub	a, -50 (ix)
   4D76 30 2C         [12]  568 	jr	NC,00243$
                            569 ;src/juego.c:91: && (!entidad[1].energy || nueva_pos != entidad[1].pos_x)
   4D78 DD 7E CE      [19]  570 	ld	a, -50 (ix)
   4D7B D6 25         [ 7]  571 	sub	a, #0x25
   4D7D 30 25         [12]  572 	jr	NC,00243$
   4D7F 3A BE 6E      [13]  573 	ld	a, (#(_entidad + 0x001e) + 0)
   4D82 B7            [ 4]  574 	or	a, a
   4D83 28 09         [12]  575 	jr	Z,00147$
   4D85 21 C3 6E      [10]  576 	ld	hl, #(_entidad + 0x0023) + 0
   4D88 DD 7E CE      [19]  577 	ld	a,-50 (ix)
   4D8B 96            [ 7]  578 	sub	a,(hl)
   4D8C 28 16         [12]  579 	jr	Z,00243$
   4D8E                     580 00147$:
                            581 ;src/juego.c:92: && (!entidad[2].energy || nueva_pos != entidad[2].pos_x)
   4D8E 3A D2 6E      [13]  582 	ld	a, (#(_entidad + 0x0032) + 0)
   4D91 B7            [ 4]  583 	or	a, a
   4D92 28 09         [12]  584 	jr	Z,00141$
   4D94 21 D7 6E      [10]  585 	ld	hl, #(_entidad + 0x0037) + 0
   4D97 DD 7E CE      [19]  586 	ld	a,-50 (ix)
   4D9A 96            [ 7]  587 	sub	a,(hl)
   4D9B 28 07         [12]  588 	jr	Z,00243$
   4D9D                     589 00141$:
                            590 ;src/juego.c:94: entidad[0].pos_x = nueva_pos;
   4D9D 21 AF 6E      [10]  591 	ld	hl, #(_entidad + 0x000f)
   4DA0 DD 7E CE      [19]  592 	ld	a, -50 (ix)
   4DA3 77            [ 7]  593 	ld	(hl), a
                            594 ;src/juego.c:98: for (i = 1; i < 3; i++) {
   4DA4                     595 00243$:
   4DA4 DD 7E F8      [19]  596 	ld	a, -8 (ix)
   4DA7 DD 77 FA      [19]  597 	ld	-6 (ix), a
   4DAA DD 7E F9      [19]  598 	ld	a, -7 (ix)
   4DAD DD 77 FB      [19]  599 	ld	-5 (ix), a
   4DB0 DD 7E F8      [19]  600 	ld	a, -8 (ix)
   4DB3 DD 77 FC      [19]  601 	ld	-4 (ix), a
   4DB6 DD 7E F9      [19]  602 	ld	a, -7 (ix)
   4DB9 DD 77 FD      [19]  603 	ld	-3 (ix), a
   4DBC DD 7E F8      [19]  604 	ld	a, -8 (ix)
   4DBF DD 77 FE      [19]  605 	ld	-2 (ix), a
   4DC2 DD 7E F9      [19]  606 	ld	a, -7 (ix)
   4DC5 DD 77 FF      [19]  607 	ld	-1 (ix), a
   4DC8 DD 7E F8      [19]  608 	ld	a, -8 (ix)
   4DCB DD 77 F6      [19]  609 	ld	-10 (ix), a
   4DCE DD 7E F9      [19]  610 	ld	a, -7 (ix)
   4DD1 DD 77 F7      [19]  611 	ld	-9 (ix), a
   4DD4 DD 36 F3 01   [19]  612 	ld	-13 (ix), #0x01
   4DD8                     613 00198$:
                            614 ;src/juego.c:99: if (entidad[i].energy) {
   4DD8 DD 4E F3      [19]  615 	ld	c,-13 (ix)
   4DDB 06 00         [ 7]  616 	ld	b,#0x00
   4DDD 69            [ 4]  617 	ld	l, c
   4DDE 60            [ 4]  618 	ld	h, b
   4DDF 29            [11]  619 	add	hl, hl
   4DE0 29            [11]  620 	add	hl, hl
   4DE1 09            [11]  621 	add	hl, bc
   4DE2 29            [11]  622 	add	hl, hl
   4DE3 29            [11]  623 	add	hl, hl
   4DE4 DD 75 F4      [19]  624 	ld	-12 (ix), l
   4DE7 DD 74 F5      [19]  625 	ld	-11 (ix), h
   4DEA DD 7E F4      [19]  626 	ld	a, -12 (ix)
   4DED C6 A0         [ 7]  627 	add	a, #<(_entidad)
   4DEF DD 77 F4      [19]  628 	ld	-12 (ix), a
   4DF2 DD 7E F5      [19]  629 	ld	a, -11 (ix)
   4DF5 CE 6E         [ 7]  630 	adc	a, #>(_entidad)
   4DF7 DD 77 F5      [19]  631 	ld	-11 (ix), a
   4DFA DD 6E F4      [19]  632 	ld	l,-12 (ix)
   4DFD DD 66 F5      [19]  633 	ld	h,-11 (ix)
   4E00 11 0A 00      [10]  634 	ld	de, #0x000a
   4E03 19            [11]  635 	add	hl, de
   4E04 7E            [ 7]  636 	ld	a, (hl)
   4E05 B7            [ 4]  637 	or	a, a
   4E06 CA 15 4F      [10]  638 	jp	Z, 00199$
                            639 ;src/juego.c:100: if (abs(entidad[i].pos_x - entidad[0].pos_x) == 4) //Si está en casilla contigua, atacar
   4E09 DD 7E F4      [19]  640 	ld	a, -12 (ix)
   4E0C C6 0F         [ 7]  641 	add	a, #0x0f
   4E0E 4F            [ 4]  642 	ld	c, a
   4E0F DD 7E F5      [19]  643 	ld	a, -11 (ix)
   4E12 CE 00         [ 7]  644 	adc	a, #0x00
   4E14 47            [ 4]  645 	ld	b, a
   4E15 0A            [ 7]  646 	ld	a, (bc)
   4E16 5F            [ 4]  647 	ld	e, a
   4E17 21 AF 6E      [10]  648 	ld	hl, #(_entidad + 0x000f) + 0
   4E1A 56            [ 7]  649 	ld	d, (hl)
   4E1B 7B            [ 4]  650 	ld	a, e
   4E1C 92            [ 4]  651 	sub	a, d
   4E1D 57            [ 4]  652 	ld	d, a
   4E1E C5            [11]  653 	push	bc
   4E1F D5            [11]  654 	push	de
   4E20 33            [ 6]  655 	inc	sp
   4E21 CD AD 52      [17]  656 	call	_abs
   4E24 33            [ 6]  657 	inc	sp
   4E25 C1            [10]  658 	pop	bc
   4E26 7D            [ 4]  659 	ld	a, l
   4E27 D6 04         [ 7]  660 	sub	a, #0x04
   4E29 20 15         [12]  661 	jr	NZ,00155$
                            662 ;src/juego.c:101: atacar(&entidad[i], &entidad[0]);
   4E2B 11 A0 6E      [10]  663 	ld	de, #_entidad
   4E2E DD 6E F4      [19]  664 	ld	l,-12 (ix)
   4E31 DD 66 F5      [19]  665 	ld	h,-11 (ix)
   4E34 C5            [11]  666 	push	bc
   4E35 D5            [11]  667 	push	de
   4E36 E5            [11]  668 	push	hl
   4E37 CD 82 56      [17]  669 	call	_atacar
   4E3A F1            [10]  670 	pop	af
   4E3B F1            [10]  671 	pop	af
   4E3C C1            [10]  672 	pop	bc
   4E3D C3 D3 4E      [10]  673 	jp	00240$
   4E40                     674 00155$:
                            675 ;src/juego.c:103: enemy_mov = cpct_rand()%3; //33% de moverse a izquierda, derecha o curarse
   4E40 C5            [11]  676 	push	bc
   4E41 CD 6C 60      [17]  677 	call	_cpct_getRandom_mxor_u8
   4E44 55            [ 4]  678 	ld	d, l
   4E45 3E 03         [ 7]  679 	ld	a, #0x03
   4E47 F5            [11]  680 	push	af
   4E48 33            [ 6]  681 	inc	sp
   4E49 D5            [11]  682 	push	de
   4E4A 33            [ 6]  683 	inc	sp
   4E4B CD FC 5F      [17]  684 	call	__moduchar
   4E4E F1            [10]  685 	pop	af
   4E4F 5D            [ 4]  686 	ld	e, l
   4E50 C1            [10]  687 	pop	bc
                            688 ;src/juego.c:104: if (enemy_mov == 1) {
   4E51 7B            [ 4]  689 	ld	a, e
   4E52 3D            [ 4]  690 	dec	a
   4E53 20 36         [12]  691 	jr	NZ,00152$
                            692 ;src/juego.c:105: sprintf(temp, "%-9s GOES <",entidad[i].name);
   4E55 DD 6E F4      [19]  693 	ld	l,-12 (ix)
   4E58 DD 66 F5      [19]  694 	ld	h,-11 (ix)
   4E5B DD 5E FE      [19]  695 	ld	e,-2 (ix)
   4E5E DD 56 FF      [19]  696 	ld	d,-1 (ix)
   4E61 C5            [11]  697 	push	bc
   4E62 E5            [11]  698 	push	hl
   4E63 21 F4 50      [10]  699 	ld	hl, #___str_1
   4E66 E5            [11]  700 	push	hl
   4E67 D5            [11]  701 	push	de
   4E68 CD 36 61      [17]  702 	call	_sprintf
   4E6B 21 06 00      [10]  703 	ld	hl, #6
   4E6E 39            [11]  704 	add	hl, sp
   4E6F F9            [ 6]  705 	ld	sp, hl
   4E70 C1            [10]  706 	pop	bc
                            707 ;src/juego.c:106: printConsole(temp, 0, 2);
   4E71 DD 5E F6      [19]  708 	ld	e,-10 (ix)
   4E74 DD 56 F7      [19]  709 	ld	d,-9 (ix)
   4E77 C5            [11]  710 	push	bc
   4E78 21 00 02      [10]  711 	ld	hl, #0x0200
   4E7B E5            [11]  712 	push	hl
   4E7C D5            [11]  713 	push	de
   4E7D CD 1D 56      [17]  714 	call	_printConsole
   4E80 F1            [10]  715 	pop	af
   4E81 F1            [10]  716 	pop	af
   4E82 C1            [10]  717 	pop	bc
                            718 ;src/juego.c:108: nueva_pos = entidad[i].pos_x - 4;
   4E83 0A            [ 7]  719 	ld	a, (bc)
   4E84 C6 FC         [ 7]  720 	add	a, #0xfc
   4E86 DD 77 CE      [19]  721 	ld	-50 (ix), a
   4E89 18 48         [12]  722 	jr	00240$
   4E8B                     723 00152$:
                            724 ;src/juego.c:109: } else if (enemy_mov == 2) {
   4E8B 7B            [ 4]  725 	ld	a, e
   4E8C D6 02         [ 7]  726 	sub	a, #0x02
   4E8E 20 36         [12]  727 	jr	NZ,00149$
                            728 ;src/juego.c:110: sprintf(temp, "%-9s GOES >",entidad[i].name);
   4E90 DD 5E F4      [19]  729 	ld	e,-12 (ix)
   4E93 DD 56 F5      [19]  730 	ld	d,-11 (ix)
   4E96 DD 6E FA      [19]  731 	ld	l,-6 (ix)
   4E99 DD 66 FB      [19]  732 	ld	h,-5 (ix)
   4E9C C5            [11]  733 	push	bc
   4E9D D5            [11]  734 	push	de
   4E9E 11 00 51      [10]  735 	ld	de, #___str_2
   4EA1 D5            [11]  736 	push	de
   4EA2 E5            [11]  737 	push	hl
   4EA3 CD 36 61      [17]  738 	call	_sprintf
   4EA6 21 06 00      [10]  739 	ld	hl, #6
   4EA9 39            [11]  740 	add	hl, sp
   4EAA F9            [ 6]  741 	ld	sp, hl
   4EAB C1            [10]  742 	pop	bc
                            743 ;src/juego.c:111: printConsole(temp, 0, 2);
   4EAC DD 5E FC      [19]  744 	ld	e,-4 (ix)
   4EAF DD 56 FD      [19]  745 	ld	d,-3 (ix)
   4EB2 C5            [11]  746 	push	bc
   4EB3 21 00 02      [10]  747 	ld	hl, #0x0200
   4EB6 E5            [11]  748 	push	hl
   4EB7 D5            [11]  749 	push	de
   4EB8 CD 1D 56      [17]  750 	call	_printConsole
   4EBB F1            [10]  751 	pop	af
   4EBC F1            [10]  752 	pop	af
   4EBD C1            [10]  753 	pop	bc
                            754 ;src/juego.c:113: nueva_pos = entidad[i].pos_x + 4;
   4EBE 0A            [ 7]  755 	ld	a, (bc)
   4EBF C6 04         [ 7]  756 	add	a, #0x04
   4EC1 DD 77 CE      [19]  757 	ld	-50 (ix), a
   4EC4 18 0D         [12]  758 	jr	00240$
   4EC6                     759 00149$:
                            760 ;src/juego.c:115: defender(&entidad[i]);
   4EC6 DD 5E F4      [19]  761 	ld	e,-12 (ix)
   4EC9 DD 56 F5      [19]  762 	ld	d,-11 (ix)
   4ECC C5            [11]  763 	push	bc
   4ECD D5            [11]  764 	push	de
   4ECE CD B8 57      [17]  765 	call	_defender
   4ED1 F1            [10]  766 	pop	af
   4ED2 C1            [10]  767 	pop	bc
                            768 ;src/juego.c:119: for (j = 0; j < 3; j++) {
   4ED3                     769 00240$:
   4ED3 1E 00         [ 7]  770 	ld	e, #0x00
   4ED5                     771 00196$:
                            772 ;src/juego.c:120: if (i!=j) {
   4ED5 DD 7E F3      [19]  773 	ld	a, -13 (ix)
   4ED8 93            [ 4]  774 	sub	a, e
   4ED9 28 22         [12]  775 	jr	Z,00197$
                            776 ;src/juego.c:121: if (entidad[j].pos_x == nueva_pos) {
   4EDB D5            [11]  777 	push	de
   4EDC 16 00         [ 7]  778 	ld	d,#0x00
   4EDE 6B            [ 4]  779 	ld	l, e
   4EDF 62            [ 4]  780 	ld	h, d
   4EE0 29            [11]  781 	add	hl, hl
   4EE1 29            [11]  782 	add	hl, hl
   4EE2 19            [11]  783 	add	hl, de
   4EE3 29            [11]  784 	add	hl, hl
   4EE4 29            [11]  785 	add	hl, hl
   4EE5 D1            [10]  786 	pop	de
   4EE6 C5            [11]  787 	push	bc
   4EE7 01 A0 6E      [10]  788 	ld	bc, #_entidad
   4EEA 09            [11]  789 	add	hl, bc
   4EEB 01 0F 00      [10]  790 	ld	bc, #0x000f
   4EEE 09            [11]  791 	add	hl, bc
   4EEF C1            [10]  792 	pop	bc
   4EF0 56            [ 7]  793 	ld	d, (hl)
   4EF1 DD 7E CE      [19]  794 	ld	a, -50 (ix)
   4EF4 92            [ 4]  795 	sub	a, d
   4EF5 20 06         [12]  796 	jr	NZ,00197$
                            797 ;src/juego.c:122: nueva_pos = 0;
   4EF7 DD 36 CE 00   [19]  798 	ld	-50 (ix), #0x00
                            799 ;src/juego.c:123: break;
   4EFB 18 06         [12]  800 	jr	00161$
   4EFD                     801 00197$:
                            802 ;src/juego.c:119: for (j = 0; j < 3; j++) {
   4EFD 1C            [ 4]  803 	inc	e
   4EFE 7B            [ 4]  804 	ld	a, e
   4EFF D6 03         [ 7]  805 	sub	a, #0x03
   4F01 38 D2         [12]  806 	jr	C,00196$
   4F03                     807 00161$:
                            808 ;src/juego.c:129: if (nueva_pos > 3 && nueva_pos < 37)
   4F03 3E 03         [ 7]  809 	ld	a, #0x03
   4F05 DD 96 CE      [19]  810 	sub	a, -50 (ix)
   4F08 30 0B         [12]  811 	jr	NC,00199$
   4F0A DD 7E CE      [19]  812 	ld	a, -50 (ix)
   4F0D D6 25         [ 7]  813 	sub	a, #0x25
   4F0F 30 04         [12]  814 	jr	NC,00199$
                            815 ;src/juego.c:130: entidad[i].pos_x = nueva_pos; 
   4F11 DD 7E CE      [19]  816 	ld	a, -50 (ix)
   4F14 02            [ 7]  817 	ld	(bc), a
   4F15                     818 00199$:
                            819 ;src/juego.c:98: for (i = 1; i < 3; i++) {
   4F15 DD 34 F3      [23]  820 	inc	-13 (ix)
   4F18 DD 7E F3      [19]  821 	ld	a, -13 (ix)
   4F1B D6 03         [ 7]  822 	sub	a, #0x03
   4F1D DA D8 4D      [10]  823 	jp	C, 00198$
                            824 ;src/juego.c:134: pausa(SEGUNDO);
   4F20 21 00 80      [10]  825 	ld	hl, #0x8000
   4F23 E5            [11]  826 	push	hl
   4F24 CD D5 52      [17]  827 	call	_pausa
   4F27 F1            [10]  828 	pop	af
                            829 ;src/juego.c:135: pausaTecladoLibre();
   4F28 CD 31 53      [17]  830 	call	_pausaTecladoLibre
                            831 ;src/juego.c:144: entidad[0].energy = entidad[0].max_energy;
                            832 ;src/juego.c:139: if (nivel == 5 || nivel == 15 || nivel == 25) {
   4F2B FD 21 DC 6E   [14]  833 	ld	iy, #_nivel
   4F2F FD 7E 00      [19]  834 	ld	a, 0 (iy)
   4F32 D6 05         [ 7]  835 	sub	a, #0x05
   4F34 28 0F         [12]  836 	jr	Z,00179$
   4F36 FD 7E 00      [19]  837 	ld	a, 0 (iy)
   4F39 D6 0F         [ 7]  838 	sub	a, #0x0f
   4F3B 28 08         [12]  839 	jr	Z,00179$
   4F3D FD 7E 00      [19]  840 	ld	a, 0 (iy)
   4F40 D6 19         [ 7]  841 	sub	a, #0x19
   4F42 C2 24 50      [10]  842 	jp	NZ,00180$
   4F45                     843 00179$:
                            844 ;src/juego.c:140: if (entidad[0].pos_x == 28) {
   4F45 3A AF 6E      [13]  845 	ld	a, (#(_entidad + 0x000f) + 0)
   4F48 D6 1C         [ 7]  846 	sub	a, #0x1c
   4F4A C2 38 50      [10]  847 	jp	NZ,00181$
                            848 ;src/juego.c:142: if (cpct_rand() % 2){
   4F4D CD 6C 60      [17]  849 	call	_cpct_getRandom_mxor_u8
   4F50 CB 45         [ 8]  850 	bit	0, l
   4F52 28 3C         [12]  851 	jr	Z,00172$
                            852 ;src/juego.c:144: entidad[0].energy = entidad[0].max_energy;
   4F54 3A AB 6E      [13]  853 	ld	a, (#_entidad + 11)
   4F57 32 AA 6E      [13]  854 	ld	(#(_entidad + 0x000a)),a
                            855 ;src/juego.c:145: sprintf(temp, "%-9s MAX HP",entidad[0].name);
   4F5A DD 7E F8      [19]  856 	ld	a, -8 (ix)
   4F5D DD 77 F4      [19]  857 	ld	-12 (ix), a
   4F60 DD 7E F9      [19]  858 	ld	a, -7 (ix)
   4F63 DD 77 F5      [19]  859 	ld	-11 (ix), a
   4F66 21 A0 6E      [10]  860 	ld	hl, #_entidad
   4F69 E5            [11]  861 	push	hl
   4F6A 21 0C 51      [10]  862 	ld	hl, #___str_3
   4F6D E5            [11]  863 	push	hl
   4F6E DD 6E F4      [19]  864 	ld	l,-12 (ix)
   4F71 DD 66 F5      [19]  865 	ld	h,-11 (ix)
   4F74 E5            [11]  866 	push	hl
   4F75 CD 36 61      [17]  867 	call	_sprintf
   4F78 21 06 00      [10]  868 	ld	hl, #6
   4F7B 39            [11]  869 	add	hl, sp
   4F7C F9            [ 6]  870 	ld	sp, hl
                            871 ;src/juego.c:146: printConsole(temp, 2, 0);
   4F7D DD 4E F8      [19]  872 	ld	c,-8 (ix)
   4F80 DD 46 F9      [19]  873 	ld	b,-7 (ix)
   4F83 21 02 00      [10]  874 	ld	hl, #0x0002
   4F86 E5            [11]  875 	push	hl
   4F87 C5            [11]  876 	push	bc
   4F88 CD 1D 56      [17]  877 	call	_printConsole
   4F8B F1            [10]  878 	pop	af
   4F8C F1            [10]  879 	pop	af
   4F8D C3 15 50      [10]  880 	jp	00173$
   4F90                     881 00172$:
                            882 ;src/juego.c:147: } else if (cpct_rand() % 2){
   4F90 CD 6C 60      [17]  883 	call	_cpct_getRandom_mxor_u8
   4F93 CB 45         [ 8]  884 	bit	0, l
   4F95 28 44         [12]  885 	jr	Z,00169$
                            886 ;src/juego.c:149: entidad[0].attack += 5;
   4F97 3A AC 6E      [13]  887 	ld	a, (#(_entidad + 0x000c) + 0)
   4F9A C6 05         [ 7]  888 	add	a, #0x05
   4F9C DD 77 F4      [19]  889 	ld	-12 (ix), a
   4F9F 21 AC 6E      [10]  890 	ld	hl, #(_entidad + 0x000c)
   4FA2 DD 7E F4      [19]  891 	ld	a, -12 (ix)
   4FA5 77            [ 7]  892 	ld	(hl), a
                            893 ;src/juego.c:150: sprintf(temp, "%-9s ^ ATT",entidad[0].name);
   4FA6 DD 7E F8      [19]  894 	ld	a, -8 (ix)
   4FA9 DD 77 F4      [19]  895 	ld	-12 (ix), a
   4FAC DD 7E F9      [19]  896 	ld	a, -7 (ix)
   4FAF DD 77 F5      [19]  897 	ld	-11 (ix), a
   4FB2 21 A0 6E      [10]  898 	ld	hl, #_entidad
   4FB5 E5            [11]  899 	push	hl
   4FB6 21 18 51      [10]  900 	ld	hl, #___str_4
   4FB9 E5            [11]  901 	push	hl
   4FBA DD 6E F4      [19]  902 	ld	l,-12 (ix)
   4FBD DD 66 F5      [19]  903 	ld	h,-11 (ix)
   4FC0 E5            [11]  904 	push	hl
   4FC1 CD 36 61      [17]  905 	call	_sprintf
   4FC4 21 06 00      [10]  906 	ld	hl, #6
   4FC7 39            [11]  907 	add	hl, sp
   4FC8 F9            [ 6]  908 	ld	sp, hl
                            909 ;src/juego.c:151: printConsole(temp, 2, 0);
   4FC9 DD 4E F8      [19]  910 	ld	c,-8 (ix)
   4FCC DD 46 F9      [19]  911 	ld	b,-7 (ix)
   4FCF 21 02 00      [10]  912 	ld	hl, #0x0002
   4FD2 E5            [11]  913 	push	hl
   4FD3 C5            [11]  914 	push	bc
   4FD4 CD 1D 56      [17]  915 	call	_printConsole
   4FD7 F1            [10]  916 	pop	af
   4FD8 F1            [10]  917 	pop	af
   4FD9 18 3A         [12]  918 	jr	00173$
   4FDB                     919 00169$:
                            920 ;src/juego.c:154: entidad[0].defense += 5;
   4FDB 01 AE 6E      [10]  921 	ld	bc, #_entidad + 14
   4FDE 0A            [ 7]  922 	ld	a, (bc)
   4FDF C6 05         [ 7]  923 	add	a, #0x05
   4FE1 02            [ 7]  924 	ld	(bc), a
                            925 ;src/juego.c:155: sprintf(temp, "%-9s ^ DEF",entidad[0].name);
   4FE2 DD 7E F8      [19]  926 	ld	a, -8 (ix)
   4FE5 DD 77 F4      [19]  927 	ld	-12 (ix), a
   4FE8 DD 7E F9      [19]  928 	ld	a, -7 (ix)
   4FEB DD 77 F5      [19]  929 	ld	-11 (ix), a
   4FEE 21 A0 6E      [10]  930 	ld	hl, #_entidad
   4FF1 E5            [11]  931 	push	hl
   4FF2 21 23 51      [10]  932 	ld	hl, #___str_5
   4FF5 E5            [11]  933 	push	hl
   4FF6 DD 6E F4      [19]  934 	ld	l,-12 (ix)
   4FF9 DD 66 F5      [19]  935 	ld	h,-11 (ix)
   4FFC E5            [11]  936 	push	hl
   4FFD CD 36 61      [17]  937 	call	_sprintf
   5000 21 06 00      [10]  938 	ld	hl, #6
   5003 39            [11]  939 	add	hl, sp
   5004 F9            [ 6]  940 	ld	sp, hl
                            941 ;src/juego.c:156: printConsole(temp, 2, 0);
   5005 DD 4E F8      [19]  942 	ld	c,-8 (ix)
   5008 DD 46 F9      [19]  943 	ld	b,-7 (ix)
   500B 21 02 00      [10]  944 	ld	hl, #0x0002
   500E E5            [11]  945 	push	hl
   500F C5            [11]  946 	push	bc
   5010 CD 1D 56      [17]  947 	call	_printConsole
   5013 F1            [10]  948 	pop	af
   5014 F1            [10]  949 	pop	af
   5015                     950 00173$:
                            951 ;src/juego.c:159: printStats(&entidad[0]);
   5015 21 A0 6E      [10]  952 	ld	hl, #_entidad
   5018 E5            [11]  953 	push	hl
   5019 CD EA 54      [17]  954 	call	_printStats
   501C F1            [10]  955 	pop	af
                            956 ;src/juego.c:160: sig_nivel = 1;
   501D 21 DE 6E      [10]  957 	ld	hl,#_sig_nivel + 0
   5020 36 01         [10]  958 	ld	(hl), #0x01
   5022 18 14         [12]  959 	jr	00181$
   5024                     960 00180$:
                            961 ;src/juego.c:163: } else if (!(entidad[1].energy || entidad[2].energy)) {
   5024 3A BE 6E      [13]  962 	ld	a, (#(_entidad + 0x001e) + 0)
   5027 B7            [ 4]  963 	or	a, a
   5028 20 0E         [12]  964 	jr	NZ,00181$
   502A 3A D2 6E      [13]  965 	ld	a,(#(_entidad + 0x0032) + 0)
   502D DD 77 F4      [19]  966 	ld	-12 (ix), a
   5030 B7            [ 4]  967 	or	a, a
   5031 20 05         [12]  968 	jr	NZ,00181$
                            969 ;src/juego.c:164: sig_nivel = 1;
   5033 21 DE 6E      [10]  970 	ld	hl,#_sig_nivel + 0
   5036 36 01         [10]  971 	ld	(hl), #0x01
   5038                     972 00181$:
                            973 ;src/juego.c:168: if (sig_nivel) {
   5038 3A DE 6E      [13]  974 	ld	a,(#_sig_nivel + 0)
   503B B7            [ 4]  975 	or	a, a
   503C 28 68         [12]  976 	jr	Z,00188$
                            977 ;src/juego.c:169: if (nivel == 10) {// Fin del Juego
   503E 3A DC 6E      [13]  978 	ld	a,(#_nivel + 0)
   5041 D6 0A         [ 7]  979 	sub	a, #0x0a
   5043 20 23         [12]  980 	jr	NZ,00185$
                            981 ;src/juego.c:170: sprintf(temp, "CONGRATULATIONS!");
   5045 DD 7E F8      [19]  982 	ld	a, -8 (ix)
   5048 DD 77 F4      [19]  983 	ld	-12 (ix), a
   504B DD 7E F9      [19]  984 	ld	a, -7 (ix)
   504E DD 77 F5      [19]  985 	ld	-11 (ix), a
   5051 21 2E 51      [10]  986 	ld	hl, #___str_6
   5054 E5            [11]  987 	push	hl
   5055 DD 6E F4      [19]  988 	ld	l,-12 (ix)
   5058 DD 66 F5      [19]  989 	ld	h,-11 (ix)
   505B E5            [11]  990 	push	hl
   505C CD 36 61      [17]  991 	call	_sprintf
   505F F1            [10]  992 	pop	af
   5060 F1            [10]  993 	pop	af
                            994 ;src/juego.c:171: entidad[0].energy = 0;
   5061 21 AA 6E      [10]  995 	ld	hl, #(_entidad + 0x000a)
   5064 36 00         [10]  996 	ld	(hl), #0x00
   5066 18 25         [12]  997 	jr	00186$
   5068                     998 00185$:
                            999 ;src/juego.c:173: nivel++;
   5068 21 DC 6E      [10] 1000 	ld	hl, #_nivel+0
   506B 34            [11] 1001 	inc	(hl)
                           1002 ;src/juego.c:174: entidad[0].pos_x = 8;
   506C 21 AF 6E      [10] 1003 	ld	hl, #(_entidad + 0x000f)
   506F 36 08         [10] 1004 	ld	(hl), #0x08
                           1005 ;src/juego.c:175: sprintf(temp, "   NEXT LEVEL   ");
   5071 DD 7E F8      [19] 1006 	ld	a, -8 (ix)
   5074 DD 77 F4      [19] 1007 	ld	-12 (ix), a
   5077 DD 7E F9      [19] 1008 	ld	a, -7 (ix)
   507A DD 77 F5      [19] 1009 	ld	-11 (ix), a
   507D 21 3F 51      [10] 1010 	ld	hl, #___str_7
   5080 E5            [11] 1011 	push	hl
   5081 DD 6E F4      [19] 1012 	ld	l,-12 (ix)
   5084 DD 66 F5      [19] 1013 	ld	h,-11 (ix)
   5087 E5            [11] 1014 	push	hl
   5088 CD 36 61      [17] 1015 	call	_sprintf
   508B F1            [10] 1016 	pop	af
   508C F1            [10] 1017 	pop	af
   508D                    1018 00186$:
                           1019 ;src/juego.c:177: printConsole(temp, 0, 2);
   508D DD 4E F8      [19] 1020 	ld	c,-8 (ix)
   5090 DD 46 F9      [19] 1021 	ld	b,-7 (ix)
   5093 21 00 02      [10] 1022 	ld	hl, #0x0200
   5096 E5            [11] 1023 	push	hl
   5097 C5            [11] 1024 	push	bc
   5098 CD 1D 56      [17] 1025 	call	_printConsole
   509B F1            [10] 1026 	pop	af
   509C F1            [10] 1027 	pop	af
                           1028 ;src/juego.c:178: sig_nivel = 0;
   509D 21 DE 6E      [10] 1029 	ld	hl,#_sig_nivel + 0
   50A0 36 00         [10] 1030 	ld	(hl), #0x00
                           1031 ;src/juego.c:179: return 0;
   50A2 2E 00         [ 7] 1032 	ld	l, #0x00
   50A4 18 38         [12] 1033 	jr	00200$
   50A6                    1034 00188$:
                           1035 ;src/juego.c:183: if (!entidad[0].energy) {
   50A6 3A AA 6E      [13] 1036 	ld	a, (#(_entidad + 0x000a) + 0)
   50A9 B7            [ 4] 1037 	or	a, a
   50AA 20 30         [12] 1038 	jr	NZ,00190$
                           1039 ;src/juego.c:184: sprintf(temp, "    GAME OVER   ");
   50AC DD 7E F8      [19] 1040 	ld	a, -8 (ix)
   50AF DD 77 F4      [19] 1041 	ld	-12 (ix), a
   50B2 DD 7E F9      [19] 1042 	ld	a, -7 (ix)
   50B5 DD 77 F5      [19] 1043 	ld	-11 (ix), a
   50B8 21 50 51      [10] 1044 	ld	hl, #___str_8
   50BB E5            [11] 1045 	push	hl
   50BC DD 6E F4      [19] 1046 	ld	l,-12 (ix)
   50BF DD 66 F5      [19] 1047 	ld	h,-11 (ix)
   50C2 E5            [11] 1048 	push	hl
   50C3 CD 36 61      [17] 1049 	call	_sprintf
   50C6 F1            [10] 1050 	pop	af
   50C7 F1            [10] 1051 	pop	af
                           1052 ;src/juego.c:185: printConsole(temp, 0, 2);
   50C8 DD 4E F8      [19] 1053 	ld	c,-8 (ix)
   50CB DD 46 F9      [19] 1054 	ld	b,-7 (ix)
   50CE 21 00 02      [10] 1055 	ld	hl, #0x0200
   50D1 E5            [11] 1056 	push	hl
   50D2 C5            [11] 1057 	push	bc
   50D3 CD 1D 56      [17] 1058 	call	_printConsole
   50D6 F1            [10] 1059 	pop	af
   50D7 F1            [10] 1060 	pop	af
                           1061 ;src/juego.c:186: return 0;
   50D8 2E 00         [ 7] 1062 	ld	l, #0x00
   50DA 18 02         [12] 1063 	jr	00200$
   50DC                    1064 00190$:
                           1065 ;src/juego.c:189: return 1;
   50DC 2E 01         [ 7] 1066 	ld	l, #0x01
   50DE                    1067 00200$:
   50DE DD F9         [10] 1068 	ld	sp, ix
   50E0 DD E1         [14] 1069 	pop	ix
   50E2 C9            [10] 1070 	ret
   50E3                    1071 ___str_0:
   50E3 41 43 54 49 4F 4E  1072 	.ascii "ACTION (</>/D) ?"
        20 28 3C 2F 3E 2F
        44 29 20 3F
   50F3 00                 1073 	.db 0x00
   50F4                    1074 ___str_1:
   50F4 25 2D 39 73 20 47  1075 	.ascii "%-9s GOES <"
        4F 45 53 20 3C
   50FF 00                 1076 	.db 0x00
   5100                    1077 ___str_2:
   5100 25 2D 39 73 20 47  1078 	.ascii "%-9s GOES >"
        4F 45 53 20 3E
   510B 00                 1079 	.db 0x00
   510C                    1080 ___str_3:
   510C 25 2D 39 73 20 4D  1081 	.ascii "%-9s MAX HP"
        41 58 20 48 50
   5117 00                 1082 	.db 0x00
   5118                    1083 ___str_4:
   5118 25 2D 39 73 20 5E  1084 	.ascii "%-9s ^ ATT"
        20 41 54 54
   5122 00                 1085 	.db 0x00
   5123                    1086 ___str_5:
   5123 25 2D 39 73 20 5E  1087 	.ascii "%-9s ^ DEF"
        20 44 45 46
   512D 00                 1088 	.db 0x00
   512E                    1089 ___str_6:
   512E 43 4F 4E 47 52 41  1090 	.ascii "CONGRATULATIONS!"
        54 55 4C 41 54 49
        4F 4E 53 21
   513E 00                 1091 	.db 0x00
   513F                    1092 ___str_7:
   513F 20 20 20 4E 45 58  1093 	.ascii "   NEXT LEVEL   "
        54 20 4C 45 56 45
        4C 20 20 20
   514F 00                 1094 	.db 0x00
   5150                    1095 ___str_8:
   5150 20 20 20 20 47 41  1096 	.ascii "    GAME OVER   "
        4D 45 20 4F 56 45
        52 20 20 20
   5160 00                 1097 	.db 0x00
                           1098 ;src/juego.c:192: void juego() {
                           1099 ;	---------------------------------
                           1100 ; Function juego
                           1101 ; ---------------------------------
   5161                    1102 _juego::
                           1103 ;src/juego.c:195: nivel = 1;
   5161 21 DC 6E      [10] 1104 	ld	hl,#_nivel + 0
   5164 36 01         [10] 1105 	ld	(hl), #0x01
                           1106 ;src/juego.c:196: sig_nivel = 0;
   5166 21 DE 6E      [10] 1107 	ld	hl,#_sig_nivel + 0
   5169 36 00         [10] 1108 	ld	(hl), #0x00
                           1109 ;src/juego.c:198: initPlayer();
   516B CD 66 5B      [17] 1110 	call	_initPlayer
                           1111 ;src/juego.c:200: while(entidad[0].energy) {
   516E                    1112 00116$:
   516E 3A AA 6E      [13] 1113 	ld	a, (#(_entidad + 0x000a) + 0)
   5171 B7            [ 4] 1114 	or	a, a
   5172 C8            [11] 1115 	ret	Z
                           1116 ;src/juego.c:201: i = 0;
   5173 0E 00         [ 7] 1117 	ld	c, #0x00
                           1118 ;src/juego.c:202: cpct_clearScreen(0x00);
   5175 C5            [11] 1119 	push	bc
   5176 21 00 40      [10] 1120 	ld	hl, #0x4000
   5179 E5            [11] 1121 	push	hl
   517A AF            [ 4] 1122 	xor	a, a
   517B F5            [11] 1123 	push	af
   517C 33            [ 6] 1124 	inc	sp
   517D 26 C0         [ 7] 1125 	ld	h, #0xc0
   517F E5            [11] 1126 	push	hl
   5180 CD BF 61      [17] 1127 	call	_cpct_memset
   5183 CD 3C 53      [17] 1128 	call	_dibujarMarcoExterior
   5186 C1            [10] 1129 	pop	bc
                           1130 ;src/juego.c:205: if (nivel == 1) {
   5187 3A DC 6E      [13] 1131 	ld	a,(#_nivel + 0)
   518A 3D            [ 4] 1132 	dec	a
   518B 20 18         [12] 1133 	jr	NZ,00102$
                           1134 ;src/juego.c:206: mydrawStringM1("Chapter 1", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
   518D 21 3E C3      [10] 1135 	ld	hl, #0xc33e
   5190 E5            [11] 1136 	push	hl
   5191 21 34 52      [10] 1137 	ld	hl, #___str_9
   5194 E5            [11] 1138 	push	hl
   5195 CD B4 5D      [17] 1139 	call	_mydrawStringM1
                           1140 ;src/juego.c:207: mydrawStringM1("A faraway and foreign land ...", cpctm_screenPtr(CPCT_VMEM_START, 12, 96));
   5198 21 CC C3      [10] 1141 	ld	hl, #0xc3cc
   519B E5            [11] 1142 	push	hl
   519C 21 3E 52      [10] 1143 	ld	hl, #___str_10
   519F E5            [11] 1144 	push	hl
   51A0 CD B4 5D      [17] 1145 	call	_mydrawStringM1
                           1146 ;src/juego.c:208: i = 1;
   51A3 0E 01         [ 7] 1147 	ld	c, #0x01
   51A5                    1148 00102$:
                           1149 ;src/juego.c:210: if (nivel == 11) {
   51A5 3A DC 6E      [13] 1150 	ld	a,(#_nivel + 0)
   51A8 D6 0B         [ 7] 1151 	sub	a, #0x0b
   51AA 20 18         [12] 1152 	jr	NZ,00104$
                           1153 ;src/juego.c:211: mydrawStringM1("Chapter 2", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
   51AC 21 3E C3      [10] 1154 	ld	hl, #0xc33e
   51AF E5            [11] 1155 	push	hl
   51B0 21 5D 52      [10] 1156 	ld	hl, #___str_11
   51B3 E5            [11] 1157 	push	hl
   51B4 CD B4 5D      [17] 1158 	call	_mydrawStringM1
                           1159 ;src/juego.c:212: mydrawStringM1("A hidden passage to the Castle ...", cpctm_screenPtr(CPCT_VMEM_START, 10, 96));
   51B7 21 CA C3      [10] 1160 	ld	hl, #0xc3ca
   51BA E5            [11] 1161 	push	hl
   51BB 21 67 52      [10] 1162 	ld	hl, #___str_12
   51BE E5            [11] 1163 	push	hl
   51BF CD B4 5D      [17] 1164 	call	_mydrawStringM1
                           1165 ;src/juego.c:213: i = 1;
   51C2 0E 01         [ 7] 1166 	ld	c, #0x01
   51C4                    1167 00104$:
                           1168 ;src/juego.c:215: if (nivel == 21) {
   51C4 3A DC 6E      [13] 1169 	ld	a,(#_nivel + 0)
   51C7 D6 15         [ 7] 1170 	sub	a, #0x15
   51C9 20 18         [12] 1171 	jr	NZ,00106$
                           1172 ;src/juego.c:216: mydrawStringM1("Chapter 3", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
   51CB 21 3E C3      [10] 1173 	ld	hl, #0xc33e
   51CE E5            [11] 1174 	push	hl
   51CF 21 8A 52      [10] 1175 	ld	hl, #___str_13
   51D2 E5            [11] 1176 	push	hl
   51D3 CD B4 5D      [17] 1177 	call	_mydrawStringM1
                           1178 ;src/juego.c:217: mydrawStringM1("don Ricardo's Castle ...", cpctm_screenPtr(CPCT_VMEM_START, 15, 96));
   51D6 21 CF C3      [10] 1179 	ld	hl, #0xc3cf
   51D9 E5            [11] 1180 	push	hl
   51DA 21 94 52      [10] 1181 	ld	hl, #___str_14
   51DD E5            [11] 1182 	push	hl
   51DE CD B4 5D      [17] 1183 	call	_mydrawStringM1
                           1184 ;src/juego.c:218: i = 1;
   51E1 0E 01         [ 7] 1185 	ld	c, #0x01
   51E3                    1186 00106$:
                           1187 ;src/juego.c:221: if (i) {
   51E3 79            [ 4] 1188 	ld	a, c
   51E4 B7            [ 4] 1189 	or	a, a
   51E5 28 19         [12] 1190 	jr	Z,00109$
                           1191 ;src/juego.c:222: for (i=0; i< 5; i++)
   51E7 0E 00         [ 7] 1192 	ld	c, #0x00
   51E9                    1193 00119$:
                           1194 ;src/juego.c:223: pausa(SEGUNDO);
   51E9 C5            [11] 1195 	push	bc
   51EA 21 00 80      [10] 1196 	ld	hl, #0x8000
   51ED E5            [11] 1197 	push	hl
   51EE CD D5 52      [17] 1198 	call	_pausa
   51F1 F1            [10] 1199 	pop	af
   51F2 C1            [10] 1200 	pop	bc
                           1201 ;src/juego.c:222: for (i=0; i< 5; i++)
   51F3 0C            [ 4] 1202 	inc	c
   51F4 79            [ 4] 1203 	ld	a, c
   51F5 D6 05         [ 7] 1204 	sub	a, #0x05
   51F7 38 F0         [12] 1205 	jr	C,00119$
                           1206 ;src/juego.c:225: efecto_pliegue(PLIEGUE);
   51F9 AF            [ 4] 1207 	xor	a, a
   51FA F5            [11] 1208 	push	af
   51FB 33            [ 6] 1209 	inc	sp
   51FC CD E5 52      [17] 1210 	call	_efecto_pliegue
   51FF 33            [ 6] 1211 	inc	sp
   5200                    1212 00109$:
                           1213 ;src/juego.c:228: cursorConsola = 64;
   5200 21 DD 6E      [10] 1214 	ld	hl,#_cursorConsola + 0
   5203 36 40         [10] 1215 	ld	(hl), #0x40
                           1216 ;src/juego.c:230: initNivel();
   5205 CD AB 5B      [17] 1217 	call	_initNivel
                           1218 ;src/juego.c:231: dibujarMarcoInterior();
   5208 CD 0B 54      [17] 1219 	call	_dibujarMarcoInterior
                           1220 ;src/juego.c:232: dibujarEscenario();
   520B CD A6 54      [17] 1221 	call	_dibujarEscenario
                           1222 ;src/juego.c:233: printLevel();
   520E CD D4 55      [17] 1223 	call	_printLevel
                           1224 ;src/juego.c:235: efecto_pliegue(DESPLIEGUE);
   5211 3E 01         [ 7] 1225 	ld	a, #0x01
   5213 F5            [11] 1226 	push	af
   5214 33            [ 6] 1227 	inc	sp
   5215 CD E5 52      [17] 1228 	call	_efecto_pliegue
   5218 33            [ 6] 1229 	inc	sp
                           1230 ;src/juego.c:236: while (turno())
   5219                    1231 00110$:
   5219 CD C6 49      [17] 1232 	call	_turno
   521C 7D            [ 4] 1233 	ld	a, l
   521D B7            [ 4] 1234 	or	a, a
   521E 20 F9         [12] 1235 	jr	NZ,00110$
                           1236 ;src/juego.c:239: do {
   5220                    1237 00113$:
                           1238 ;src/juego.c:240: cpct_scanKeyboard_f();
   5220 CD 4E 5E      [17] 1239 	call	_cpct_scanKeyboard_f
                           1240 ;src/juego.c:241: } while (!cpct_isAnyKeyPressed_f());
   5223 CD A4 61      [17] 1241 	call	_cpct_isAnyKeyPressed_f
   5226 7D            [ 4] 1242 	ld	a, l
   5227 B7            [ 4] 1243 	or	a, a
   5228 28 F6         [12] 1244 	jr	Z,00113$
                           1245 ;src/juego.c:242: efecto_pliegue(PLIEGUE);
   522A AF            [ 4] 1246 	xor	a, a
   522B F5            [11] 1247 	push	af
   522C 33            [ 6] 1248 	inc	sp
   522D CD E5 52      [17] 1249 	call	_efecto_pliegue
   5230 33            [ 6] 1250 	inc	sp
   5231 C3 6E 51      [10] 1251 	jp	00116$
   5234                    1252 ___str_9:
   5234 43 68 61 70 74 65  1253 	.ascii "Chapter 1"
        72 20 31
   523D 00                 1254 	.db 0x00
   523E                    1255 ___str_10:
   523E 41 20 66 61 72 61  1256 	.ascii "A faraway and foreign land ..."
        77 61 79 20 61 6E
        64 20 66 6F 72 65
        69 67 6E 20 6C 61
        6E 64 20 2E 2E 2E
   525C 00                 1257 	.db 0x00
   525D                    1258 ___str_11:
   525D 43 68 61 70 74 65  1259 	.ascii "Chapter 2"
        72 20 32
   5266 00                 1260 	.db 0x00
   5267                    1261 ___str_12:
   5267 41 20 68 69 64 64  1262 	.ascii "A hidden passage to the Castle ..."
        65 6E 20 70 61 73
        73 61 67 65 20 74
        6F 20 74 68 65 20
        43 61 73 74 6C 65
        20 2E 2E 2E
   5289 00                 1263 	.db 0x00
   528A                    1264 ___str_13:
   528A 43 68 61 70 74 65  1265 	.ascii "Chapter 3"
        72 20 33
   5293 00                 1266 	.db 0x00
   5294                    1267 ___str_14:
   5294 64 6F 6E 20 52 69  1268 	.ascii "don Ricardo's Castle ..."
        63 61 72 64 6F 27
        73 20 43 61 73 74
        6C 65 20 2E 2E 2E
   52AC 00                 1269 	.db 0x00
                           1270 	.area _CODE
                           1271 	.area _INITIALIZER
                           1272 	.area _CABS (ABS)
