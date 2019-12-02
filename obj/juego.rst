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
                             14 	.globl _IA
                             15 	.globl _defender
                             16 	.globl _moverDcha
                             17 	.globl _moverIzq
                             18 	.globl _printConsole
                             19 	.globl _printLevel
                             20 	.globl _printStats
                             21 	.globl _dibujarEscenario
                             22 	.globl _dibujarMarcoInterior
                             23 	.globl _dibujarMarcoExterior
                             24 	.globl _pausaTecladoLibre
                             25 	.globl _efecto_pliegue
                             26 	.globl _pausa
                             27 	.globl _initNivel
                             28 	.globl _initPlayer
                             29 	.globl _mydrawStringM1
                             30 	.globl _sprintf
                             31 	.globl _cpct_etm_drawTileBox2x4
                             32 	.globl _cpct_getRandom_mxor_u8
                             33 	.globl _cpct_getScreenPtr
                             34 	.globl _cpct_waitVSYNC
                             35 	.globl _cpct_setDrawCharM1
                             36 	.globl _cpct_drawSpriteMasked
                             37 	.globl _cpct_isAnyKeyPressed_f
                             38 	.globl _cpct_isKeyPressed
                             39 	.globl _cpct_memset
                             40 ;--------------------------------------------------------
                             41 ; special function registers
                             42 ;--------------------------------------------------------
                             43 ;--------------------------------------------------------
                             44 ; ram data
                             45 ;--------------------------------------------------------
                             46 	.area _DATA
                             47 ;--------------------------------------------------------
                             48 ; ram data
                             49 ;--------------------------------------------------------
                             50 	.area _INITIALIZED
                             51 ;--------------------------------------------------------
                             52 ; absolute external ram data
                             53 ;--------------------------------------------------------
                             54 	.area _DABS (ABS)
                             55 ;--------------------------------------------------------
                             56 ; global & static initialisations
                             57 ;--------------------------------------------------------
                             58 	.area _HOME
                             59 	.area _GSINIT
                             60 	.area _GSFINAL
                             61 	.area _GSINIT
                             62 ;--------------------------------------------------------
                             63 ; Home
                             64 ;--------------------------------------------------------
                             65 	.area _HOME
                             66 	.area _HOME
                             67 ;--------------------------------------------------------
                             68 ; code
                             69 ;--------------------------------------------------------
                             70 	.area _CODE
                             71 ;src/juego.c:11: u8 turno() { //devuelve valor 0 cuando muere personaje o se termina nivel
                             72 ;	---------------------------------
                             73 ; Function turno
                             74 ; ---------------------------------
   5D3C                      75 _turno::
   5D3C DD E5         [15]   76 	push	ix
   5D3E DD 21 00 00   [14]   77 	ld	ix,#0
   5D42 DD 39         [15]   78 	add	ix,sp
   5D44 21 D3 FF      [10]   79 	ld	hl, #-45
   5D47 39            [11]   80 	add	hl, sp
   5D48 F9            [ 6]   81 	ld	sp, hl
                             82 ;src/juego.c:16: for (i = 0; i < 3; i++) {
   5D49 DD 36 F7 00   [19]   83 	ld	-9 (ix), #0x00
   5D4D                      84 00163$:
                             85 ;src/juego.c:17: mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
   5D4D 21 60 A2      [10]   86 	ld	hl,#_nivel + 0
   5D50 4E            [ 7]   87 	ld	c, (hl)
   5D51 06 00         [ 7]   88 	ld	b, #0x00
   5D53 0B            [ 6]   89 	dec	bc
   5D54 69            [ 4]   90 	ld	l, c
   5D55 60            [ 4]   91 	ld	h, b
   5D56 29            [11]   92 	add	hl, hl
   5D57 09            [11]   93 	add	hl, bc
   5D58 29            [11]   94 	add	hl, hl
   5D59 09            [11]   95 	add	hl, bc
   5D5A 29            [11]   96 	add	hl, hl
   5D5B 09            [11]   97 	add	hl, bc
   5D5C 29            [11]   98 	add	hl, hl
   5D5D 09            [11]   99 	add	hl, bc
   5D5E 29            [11]  100 	add	hl, hl
   5D5F 09            [11]  101 	add	hl, bc
   5D60 29            [11]  102 	add	hl, hl
   5D61 29            [11]  103 	add	hl, hl
   5D62 29            [11]  104 	add	hl, hl
   5D63 11 0F 05      [10]  105 	ld	de, #_g_mapa01
   5D66 19            [11]  106 	add	hl, de
                            107 ;src/juego.c:18: cpct_etm_drawTileBox2x4 ((entidad[i].pos_x_ant - 4)/2, 17, 2, 7, 18, INICIO_AREA_JUEGO, mapa );
   5D67 DD 75 FE      [19]  108 	ld	-2 (ix), l
   5D6A DD 74 FF      [19]  109 	ld	-1 (ix), h
   5D6D DD 36 FC 84   [19]  110 	ld	-4 (ix), #0x84
   5D71 DD 36 FD C2   [19]  111 	ld	-3 (ix), #0xc2
   5D75 DD 4E F7      [19]  112 	ld	c,-9 (ix)
   5D78 06 00         [ 7]  113 	ld	b,#0x00
   5D7A 69            [ 4]  114 	ld	l, c
   5D7B 60            [ 4]  115 	ld	h, b
   5D7C 29            [11]  116 	add	hl, hl
   5D7D 29            [11]  117 	add	hl, hl
   5D7E 09            [11]  118 	add	hl, bc
   5D7F 29            [11]  119 	add	hl, hl
   5D80 29            [11]  120 	add	hl, hl
   5D81 09            [11]  121 	add	hl, bc
   5D82 11 21 A2      [10]  122 	ld	de, #_entidad
   5D85 19            [11]  123 	add	hl, de
   5D86 11 11 00      [10]  124 	ld	de, #0x0011
   5D89 19            [11]  125 	add	hl, de
   5D8A 4E            [ 7]  126 	ld	c, (hl)
   5D8B DD 71 FA      [19]  127 	ld	-6 (ix), c
   5D8E DD 36 FB 00   [19]  128 	ld	-5 (ix), #0x00
   5D92 DD 7E FA      [19]  129 	ld	a, -6 (ix)
   5D95 C6 FC         [ 7]  130 	add	a, #0xfc
   5D97 4F            [ 4]  131 	ld	c, a
   5D98 DD 7E FB      [19]  132 	ld	a, -5 (ix)
   5D9B CE FF         [ 7]  133 	adc	a, #0xff
   5D9D 47            [ 4]  134 	ld	b, a
   5D9E DD 71 F8      [19]  135 	ld	-8 (ix), c
   5DA1 DD 70 F9      [19]  136 	ld	-7 (ix), b
   5DA4 CB 78         [ 8]  137 	bit	7, b
   5DA6 28 10         [12]  138 	jr	Z,00171$
   5DA8 DD 7E FA      [19]  139 	ld	a, -6 (ix)
   5DAB C6 FD         [ 7]  140 	add	a, #0xfd
   5DAD DD 77 F8      [19]  141 	ld	-8 (ix), a
   5DB0 DD 7E FB      [19]  142 	ld	a, -5 (ix)
   5DB3 CE FF         [ 7]  143 	adc	a, #0xff
   5DB5 DD 77 F9      [19]  144 	ld	-7 (ix), a
   5DB8                     145 00171$:
   5DB8 DD 46 F8      [19]  146 	ld	b, -8 (ix)
   5DBB DD 4E F9      [19]  147 	ld	c, -7 (ix)
   5DBE CB 29         [ 8]  148 	sra	c
   5DC0 CB 18         [ 8]  149 	rr	b
   5DC2 DD 6E FE      [19]  150 	ld	l,-2 (ix)
   5DC5 DD 66 FF      [19]  151 	ld	h,-1 (ix)
   5DC8 E5            [11]  152 	push	hl
   5DC9 DD 6E FC      [19]  153 	ld	l,-4 (ix)
   5DCC DD 66 FD      [19]  154 	ld	h,-3 (ix)
   5DCF E5            [11]  155 	push	hl
   5DD0 21 07 12      [10]  156 	ld	hl, #0x1207
   5DD3 E5            [11]  157 	push	hl
   5DD4 21 11 02      [10]  158 	ld	hl, #0x0211
   5DD7 E5            [11]  159 	push	hl
   5DD8 C5            [11]  160 	push	bc
   5DD9 33            [ 6]  161 	inc	sp
   5DDA CD 2E 92      [17]  162 	call	_cpct_etm_drawTileBox2x4
                            163 ;src/juego.c:16: for (i = 0; i < 3; i++) {
   5DDD DD 34 F7      [23]  164 	inc	-9 (ix)
   5DE0 DD 7E F7      [19]  165 	ld	a, -9 (ix)
   5DE3 D6 03         [ 7]  166 	sub	a, #0x03
   5DE5 DA 4D 5D      [10]  167 	jp	C, 00163$
                            168 ;src/juego.c:21: cpct_waitVSYNC();
   5DE8 CD E7 94      [17]  169 	call	_cpct_waitVSYNC
                            170 ;src/juego.c:23: for (i = 0; i < 3; i++) {
   5DEB 0E 00         [ 7]  171 	ld	c, #0x00
   5DED                     172 00165$:
                            173 ;src/juego.c:24: if (entidad[i].energy) {
   5DED 06 00         [ 7]  174 	ld	b,#0x00
   5DEF 69            [ 4]  175 	ld	l, c
   5DF0 60            [ 4]  176 	ld	h, b
   5DF1 29            [11]  177 	add	hl, hl
   5DF2 29            [11]  178 	add	hl, hl
   5DF3 09            [11]  179 	add	hl, bc
   5DF4 29            [11]  180 	add	hl, hl
   5DF5 29            [11]  181 	add	hl, hl
   5DF6 09            [11]  182 	add	hl, bc
   5DF7 EB            [ 4]  183 	ex	de,hl
   5DF8 21 21 A2      [10]  184 	ld	hl, #_entidad
   5DFB 19            [11]  185 	add	hl,de
   5DFC EB            [ 4]  186 	ex	de,hl
   5DFD D5            [11]  187 	push	de
   5DFE FD E1         [14]  188 	pop	iy
   5E00 FD 46 0B      [19]  189 	ld	b, 11 (iy)
   5E03 78            [ 4]  190 	ld	a, b
   5E04 B7            [ 4]  191 	or	a, a
   5E05 28 5A         [12]  192 	jr	Z,00166$
                            193 ;src/juego.c:25: printStats(&entidad[i]);
   5E07 6B            [ 4]  194 	ld	l, e
   5E08 62            [ 4]  195 	ld	h, d
   5E09 C5            [11]  196 	push	bc
   5E0A D5            [11]  197 	push	de
   5E0B E5            [11]  198 	push	hl
   5E0C CD 84 78      [17]  199 	call	_printStats
   5E0F F1            [10]  200 	pop	af
   5E10 D1            [10]  201 	pop	de
   5E11 C1            [10]  202 	pop	bc
                            203 ;src/juego.c:26: cpct_drawSpriteMasked (entidad[i].sprite, cpct_getScreenPtr (CPCT_VMEM_START, entidad[i].pos_x, 132), 4,28);
   5E12 21 10 00      [10]  204 	ld	hl, #0x0010
   5E15 19            [11]  205 	add	hl,de
   5E16 DD 75 F8      [19]  206 	ld	-8 (ix), l
   5E19 DD 74 F9      [19]  207 	ld	-7 (ix), h
   5E1C 46            [ 7]  208 	ld	b, (hl)
   5E1D C5            [11]  209 	push	bc
   5E1E D5            [11]  210 	push	de
   5E1F 3E 84         [ 7]  211 	ld	a, #0x84
   5E21 F5            [11]  212 	push	af
   5E22 33            [ 6]  213 	inc	sp
   5E23 C5            [11]  214 	push	bc
   5E24 33            [ 6]  215 	inc	sp
   5E25 21 00 C0      [10]  216 	ld	hl, #0xc000
   5E28 E5            [11]  217 	push	hl
   5E29 CD 2C 96      [17]  218 	call	_cpct_getScreenPtr
   5E2C D1            [10]  219 	pop	de
   5E2D C1            [10]  220 	pop	bc
   5E2E DD 75 FA      [19]  221 	ld	-6 (ix), l
   5E31 DD 74 FB      [19]  222 	ld	-5 (ix), h
   5E34 D5            [11]  223 	push	de
   5E35 FD E1         [14]  224 	pop	iy
   5E37 FD 6E 13      [19]  225 	ld	l, 19 (iy)
   5E3A FD 66 14      [19]  226 	ld	h, 20 (iy)
   5E3D E5            [11]  227 	push	hl
   5E3E FD E1         [14]  228 	pop	iy
   5E40 C5            [11]  229 	push	bc
   5E41 D5            [11]  230 	push	de
   5E42 21 04 1C      [10]  231 	ld	hl, #0x1c04
   5E45 E5            [11]  232 	push	hl
   5E46 DD 6E FA      [19]  233 	ld	l,-6 (ix)
   5E49 DD 66 FB      [19]  234 	ld	h,-5 (ix)
   5E4C E5            [11]  235 	push	hl
   5E4D FD E5         [15]  236 	push	iy
   5E4F CD 77 93      [17]  237 	call	_cpct_drawSpriteMasked
   5E52 D1            [10]  238 	pop	de
   5E53 C1            [10]  239 	pop	bc
                            240 ;src/juego.c:27: entidad[i].pos_x_ant = entidad[i].pos_x;
   5E54 21 11 00      [10]  241 	ld	hl, #0x0011
   5E57 19            [11]  242 	add	hl,de
   5E58 EB            [ 4]  243 	ex	de,hl
   5E59 DD 6E F8      [19]  244 	ld	l,-8 (ix)
   5E5C DD 66 F9      [19]  245 	ld	h,-7 (ix)
   5E5F 7E            [ 7]  246 	ld	a, (hl)
   5E60 12            [ 7]  247 	ld	(de), a
   5E61                     248 00166$:
                            249 ;src/juego.c:23: for (i = 0; i < 3; i++) {
   5E61 0C            [ 4]  250 	inc	c
   5E62 79            [ 4]  251 	ld	a, c
   5E63 D6 03         [ 7]  252 	sub	a, #0x03
   5E65 38 86         [12]  253 	jr	C,00165$
                            254 ;src/juego.c:39: entidad[0].energy = 0;
                            255 ;src/juego.c:32: if (nivel == 31) {
   5E67 3A 60 A2      [13]  256 	ld	a,(#_nivel + 0)
   5E6A D6 1F         [ 7]  257 	sub	a, #0x1f
   5E6C 20 5D         [12]  258 	jr	NZ,00108$
                            259 ;src/juego.c:33: printConsole("Don Mendo", 2, 0);
   5E6E 21 02 00      [10]  260 	ld	hl, #0x0002
   5E71 E5            [11]  261 	push	hl
   5E72 21 DE 61      [10]  262 	ld	hl, #___str_0
   5E75 E5            [11]  263 	push	hl
   5E76 CD C5 79      [17]  264 	call	_printConsole
   5E79 F1            [10]  265 	pop	af
                            266 ;src/juego.c:34: printConsole("&", 2, 0);
   5E7A 21 02 00      [10]  267 	ld	hl, #0x0002
   5E7D E3            [19]  268 	ex	(sp),hl
   5E7E 21 E8 61      [10]  269 	ld	hl, #___str_1
   5E81 E5            [11]  270 	push	hl
   5E82 CD C5 79      [17]  271 	call	_printConsole
   5E85 F1            [10]  272 	pop	af
                            273 ;src/juego.c:35: printConsole("Lady Sol", 2, 0);
   5E86 21 02 00      [10]  274 	ld	hl, #0x0002
   5E89 E3            [19]  275 	ex	(sp),hl
   5E8A 21 EA 61      [10]  276 	ld	hl, #___str_2
   5E8D E5            [11]  277 	push	hl
   5E8E CD C5 79      [17]  278 	call	_printConsole
   5E91 F1            [10]  279 	pop	af
                            280 ;src/juego.c:36: printConsole(" ", 2, 0);
   5E92 21 02 00      [10]  281 	ld	hl, #0x0002
   5E95 E3            [19]  282 	ex	(sp),hl
   5E96 21 F3 61      [10]  283 	ld	hl, #___str_3
   5E99 E5            [11]  284 	push	hl
   5E9A CD C5 79      [17]  285 	call	_printConsole
   5E9D F1            [10]  286 	pop	af
                            287 ;src/juego.c:37: printConsole("together at last", 2, 0);
   5E9E 21 02 00      [10]  288 	ld	hl, #0x0002
   5EA1 E3            [19]  289 	ex	(sp),hl
   5EA2 21 F5 61      [10]  290 	ld	hl, #___str_4
   5EA5 E5            [11]  291 	push	hl
   5EA6 CD C5 79      [17]  292 	call	_printConsole
   5EA9 F1            [10]  293 	pop	af
                            294 ;src/juego.c:38: printConsole("CONGRATULATIONS!", 0, 2);
   5EAA 21 00 02      [10]  295 	ld	hl, #0x0200
   5EAD E3            [19]  296 	ex	(sp),hl
   5EAE 21 06 62      [10]  297 	ld	hl, #___str_5
   5EB1 E5            [11]  298 	push	hl
   5EB2 CD C5 79      [17]  299 	call	_printConsole
   5EB5 F1            [10]  300 	pop	af
   5EB6 F1            [10]  301 	pop	af
                            302 ;src/juego.c:39: entidad[0].energy = 0;
   5EB7 21 2C A2      [10]  303 	ld	hl, #(_entidad + 0x000b)
   5EBA 36 00         [10]  304 	ld	(hl), #0x00
                            305 ;src/juego.c:41: pausaTecladoLibre();
   5EBC CD B9 76      [17]  306 	call	_pausaTecladoLibre
                            307 ;src/juego.c:42: do {
   5EBF                     308 00105$:
                            309 ;src/juego.c:44: } while (!cpct_isAnyKeyPressed_f());
   5EBF CD FD 94      [17]  310 	call	_cpct_isAnyKeyPressed_f
   5EC2 7D            [ 4]  311 	ld	a, l
   5EC3 B7            [ 4]  312 	or	a, a
   5EC4 28 F9         [12]  313 	jr	Z,00105$
                            314 ;src/juego.c:45: return 0;
   5EC6 2E 00         [ 7]  315 	ld	l, #0x00
   5EC8 C3 D9 61      [10]  316 	jp	00169$
   5ECB                     317 00108$:
                            318 ;src/juego.c:49: if (nivel == 5 || nivel == 15 || nivel == 25) {
   5ECB FD 21 60 A2   [14]  319 	ld	iy, #_nivel
   5ECF FD 7E 00      [19]  320 	ld	a, 0 (iy)
   5ED2 D6 05         [ 7]  321 	sub	a, #0x05
   5ED4 28 0E         [12]  322 	jr	Z,00109$
   5ED6 FD 7E 00      [19]  323 	ld	a, 0 (iy)
   5ED9 D6 0F         [ 7]  324 	sub	a, #0x0f
   5EDB 28 07         [12]  325 	jr	Z,00109$
   5EDD FD 7E 00      [19]  326 	ld	a, 0 (iy)
   5EE0 D6 19         [ 7]  327 	sub	a, #0x19
   5EE2 20 03         [12]  328 	jr	NZ,00110$
   5EE4                     329 00109$:
                            330 ;src/juego.c:50: drawPotion();
   5EE4 CD F2 80      [17]  331 	call	_drawPotion
   5EE7                     332 00110$:
                            333 ;src/juego.c:56: i = 0;
   5EE7 DD 36 F7 00   [19]  334 	ld	-9 (ix), #0x00
                            335 ;src/juego.c:57: do  {
   5EEB 21 00 00      [10]  336 	ld	hl, #0x0000
   5EEE 39            [11]  337 	add	hl, sp
   5EEF DD 75 F8      [19]  338 	ld	-8 (ix), l
   5EF2 DD 74 F9      [19]  339 	ld	-7 (ix), h
   5EF5                     340 00125$:
                            341 ;src/juego.c:59: sprintf(temp, "ACTION (</>/D) ?");
   5EF5 DD 7E F8      [19]  342 	ld	a, -8 (ix)
   5EF8 DD 77 FA      [19]  343 	ld	-6 (ix), a
   5EFB DD 7E F9      [19]  344 	ld	a, -7 (ix)
   5EFE DD 77 FB      [19]  345 	ld	-5 (ix), a
   5F01 21 17 62      [10]  346 	ld	hl, #___str_6
   5F04 E5            [11]  347 	push	hl
   5F05 DD 6E FA      [19]  348 	ld	l,-6 (ix)
   5F08 DD 66 FB      [19]  349 	ld	h,-5 (ix)
   5F0B E5            [11]  350 	push	hl
   5F0C CD FB 93      [17]  351 	call	_sprintf
   5F0F F1            [10]  352 	pop	af
   5F10 F1            [10]  353 	pop	af
                            354 ;src/juego.c:60: if (i < 25) {
   5F11 DD 7E F7      [19]  355 	ld	a, -9 (ix)
   5F14 D6 19         [ 7]  356 	sub	a, #0x19
   5F16 30 1E         [12]  357 	jr	NC,00114$
                            358 ;src/juego.c:61: printConsole(temp, 2, 0);
   5F18 DD 7E F8      [19]  359 	ld	a, -8 (ix)
   5F1B DD 77 FA      [19]  360 	ld	-6 (ix), a
   5F1E DD 7E F9      [19]  361 	ld	a, -7 (ix)
   5F21 DD 77 FB      [19]  362 	ld	-5 (ix), a
   5F24 21 02 00      [10]  363 	ld	hl, #0x0002
   5F27 E5            [11]  364 	push	hl
   5F28 DD 6E FA      [19]  365 	ld	l,-6 (ix)
   5F2B DD 66 FB      [19]  366 	ld	h,-5 (ix)
   5F2E E5            [11]  367 	push	hl
   5F2F CD C5 79      [17]  368 	call	_printConsole
   5F32 F1            [10]  369 	pop	af
   5F33 F1            [10]  370 	pop	af
   5F34 18 1C         [12]  371 	jr	00115$
   5F36                     372 00114$:
                            373 ;src/juego.c:63: printConsole(temp, 0, 2);
   5F36 DD 7E F8      [19]  374 	ld	a, -8 (ix)
   5F39 DD 77 FA      [19]  375 	ld	-6 (ix), a
   5F3C DD 7E F9      [19]  376 	ld	a, -7 (ix)
   5F3F DD 77 FB      [19]  377 	ld	-5 (ix), a
   5F42 21 00 02      [10]  378 	ld	hl, #0x0200
   5F45 E5            [11]  379 	push	hl
   5F46 DD 6E FA      [19]  380 	ld	l,-6 (ix)
   5F49 DD 66 FB      [19]  381 	ld	h,-5 (ix)
   5F4C E5            [11]  382 	push	hl
   5F4D CD C5 79      [17]  383 	call	_printConsole
   5F50 F1            [10]  384 	pop	af
   5F51 F1            [10]  385 	pop	af
   5F52                     386 00115$:
                            387 ;src/juego.c:65: i++;
   5F52 DD 34 F7      [23]  388 	inc	-9 (ix)
                            389 ;src/juego.c:66: cursorConsola -=8;
   5F55 21 61 A2      [10]  390 	ld	hl, #_cursorConsola
   5F58 7E            [ 7]  391 	ld	a, (hl)
   5F59 C6 F8         [ 7]  392 	add	a, #0xf8
   5F5B 77            [ 7]  393 	ld	(hl), a
                            394 ;src/juego.c:67: if (i == 50)
   5F5C DD 7E F7      [19]  395 	ld	a, -9 (ix)
   5F5F D6 32         [ 7]  396 	sub	a, #0x32
   5F61 20 04         [12]  397 	jr	NZ,00126$
                            398 ;src/juego.c:68: i=0;
   5F63 DD 36 F7 00   [19]  399 	ld	-9 (ix), #0x00
   5F67                     400 00126$:
                            401 ;src/juego.c:70: while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_CursorLeft)  && !cpct_isKeyPressed(Joy0_Left) 
   5F67 21 04 04      [10]  402 	ld	hl, #0x0404
   5F6A CD 31 89      [17]  403 	call	_cpct_isKeyPressed
   5F6D DD 75 FA      [19]  404 	ld	-6 (ix), l
   5F70 7D            [ 4]  405 	ld	a, l
   5F71 B7            [ 4]  406 	or	a, a
   5F72 20 4A         [12]  407 	jr	NZ,00127$
   5F74 21 01 01      [10]  408 	ld	hl, #0x0101
   5F77 CD 31 89      [17]  409 	call	_cpct_isKeyPressed
   5F7A DD 75 FA      [19]  410 	ld	-6 (ix), l
   5F7D 7D            [ 4]  411 	ld	a, l
   5F7E B7            [ 4]  412 	or	a, a
   5F7F 20 3D         [12]  413 	jr	NZ,00127$
   5F81 21 09 04      [10]  414 	ld	hl, #0x0409
   5F84 CD 31 89      [17]  415 	call	_cpct_isKeyPressed
   5F87 7D            [ 4]  416 	ld	a, l
   5F88 B7            [ 4]  417 	or	a, a
   5F89 20 33         [12]  418 	jr	NZ,00127$
                            419 ;src/juego.c:71: && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_CursorRight) && !cpct_isKeyPressed(Joy0_Right) 
   5F8B 21 03 08      [10]  420 	ld	hl, #0x0803
   5F8E CD 31 89      [17]  421 	call	_cpct_isKeyPressed
   5F91 7D            [ 4]  422 	ld	a, l
   5F92 B7            [ 4]  423 	or	a, a
   5F93 20 29         [12]  424 	jr	NZ,00127$
   5F95 21 00 02      [10]  425 	ld	hl, #0x0200
   5F98 CD 31 89      [17]  426 	call	_cpct_isKeyPressed
   5F9B 7D            [ 4]  427 	ld	a, l
   5F9C B7            [ 4]  428 	or	a, a
   5F9D 20 1F         [12]  429 	jr	NZ,00127$
   5F9F 21 09 08      [10]  430 	ld	hl, #0x0809
   5FA2 CD 31 89      [17]  431 	call	_cpct_isKeyPressed
   5FA5 7D            [ 4]  432 	ld	a, l
   5FA6 B7            [ 4]  433 	or	a, a
   5FA7 20 15         [12]  434 	jr	NZ,00127$
                            435 ;src/juego.c:72: && !cpct_isKeyPressed(Key_D) && !cpct_isKeyPressed(Joy0_Fire1));
   5FA9 21 07 20      [10]  436 	ld	hl, #0x2007
   5FAC CD 31 89      [17]  437 	call	_cpct_isKeyPressed
   5FAF 7D            [ 4]  438 	ld	a, l
   5FB0 B7            [ 4]  439 	or	a, a
   5FB1 20 0B         [12]  440 	jr	NZ,00127$
   5FB3 21 09 10      [10]  441 	ld	hl, #0x1009
   5FB6 CD 31 89      [17]  442 	call	_cpct_isKeyPressed
   5FB9 7D            [ 4]  443 	ld	a, l
   5FBA B7            [ 4]  444 	or	a, a
   5FBB CA F5 5E      [10]  445 	jp	Z, 00125$
   5FBE                     446 00127$:
                            447 ;src/juego.c:75: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
   5FBE 21 04 04      [10]  448 	ld	hl, #0x0404
   5FC1 CD 31 89      [17]  449 	call	_cpct_isKeyPressed
   5FC4 DD 75 FA      [19]  450 	ld	-6 (ix), l
   5FC7 7D            [ 4]  451 	ld	a, l
   5FC8 B7            [ 4]  452 	or	a, a
   5FC9 20 17         [12]  453 	jr	NZ,00128$
   5FCB 21 01 01      [10]  454 	ld	hl, #0x0101
   5FCE CD 31 89      [17]  455 	call	_cpct_isKeyPressed
   5FD1 DD 75 FA      [19]  456 	ld	-6 (ix), l
   5FD4 7D            [ 4]  457 	ld	a, l
   5FD5 B7            [ 4]  458 	or	a, a
   5FD6 20 0A         [12]  459 	jr	NZ,00128$
   5FD8 21 09 04      [10]  460 	ld	hl, #0x0409
   5FDB CD 31 89      [17]  461 	call	_cpct_isKeyPressed
   5FDE 7D            [ 4]  462 	ld	a, l
   5FDF B7            [ 4]  463 	or	a, a
   5FE0 28 08         [12]  464 	jr	Z,00129$
   5FE2                     465 00128$:
                            466 ;src/juego.c:76: moverIzq(&entidad[0]);
   5FE2 21 21 A2      [10]  467 	ld	hl, #_entidad
   5FE5 E5            [11]  468 	push	hl
   5FE6 CD AA 7C      [17]  469 	call	_moverIzq
   5FE9 F1            [10]  470 	pop	af
   5FEA                     471 00129$:
                            472 ;src/juego.c:80: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
   5FEA 21 03 08      [10]  473 	ld	hl, #0x0803
   5FED CD 31 89      [17]  474 	call	_cpct_isKeyPressed
   5FF0 DD 75 FA      [19]  475 	ld	-6 (ix), l
   5FF3 7D            [ 4]  476 	ld	a, l
   5FF4 B7            [ 4]  477 	or	a, a
   5FF5 20 14         [12]  478 	jr	NZ,00132$
   5FF7 21 00 02      [10]  479 	ld	hl, #0x0200
   5FFA CD 31 89      [17]  480 	call	_cpct_isKeyPressed
   5FFD 7D            [ 4]  481 	ld	a, l
   5FFE B7            [ 4]  482 	or	a, a
   5FFF 20 0A         [12]  483 	jr	NZ,00132$
   6001 21 09 08      [10]  484 	ld	hl, #0x0809
   6004 CD 31 89      [17]  485 	call	_cpct_isKeyPressed
   6007 7D            [ 4]  486 	ld	a, l
   6008 B7            [ 4]  487 	or	a, a
   6009 28 08         [12]  488 	jr	Z,00133$
   600B                     489 00132$:
                            490 ;src/juego.c:81: moverDcha(&entidad[0]);
   600B 21 21 A2      [10]  491 	ld	hl, #_entidad
   600E E5            [11]  492 	push	hl
   600F CD 37 7D      [17]  493 	call	_moverDcha
   6012 F1            [10]  494 	pop	af
   6013                     495 00133$:
                            496 ;src/juego.c:85: if (cpct_isKeyPressed(Key_D) || cpct_isKeyPressed(Joy0_Fire1)) {
   6013 21 07 20      [10]  497 	ld	hl, #0x2007
   6016 CD 31 89      [17]  498 	call	_cpct_isKeyPressed
   6019 DD 75 FA      [19]  499 	ld	-6 (ix), l
   601C 7D            [ 4]  500 	ld	a, l
   601D B7            [ 4]  501 	or	a, a
   601E 20 0A         [12]  502 	jr	NZ,00136$
   6020 21 09 10      [10]  503 	ld	hl, #0x1009
   6023 CD 31 89      [17]  504 	call	_cpct_isKeyPressed
   6026 7D            [ 4]  505 	ld	a, l
   6027 B7            [ 4]  506 	or	a, a
   6028 28 08         [12]  507 	jr	Z,00199$
   602A                     508 00136$:
                            509 ;src/juego.c:86: defender(&entidad[0]);
   602A 21 21 A2      [10]  510 	ld	hl, #_entidad
   602D E5            [11]  511 	push	hl
   602E CD C3 7D      [17]  512 	call	_defender
   6031 F1            [10]  513 	pop	af
                            514 ;src/juego.c:91: for (i = 1; i < 3; i++) {
   6032                     515 00199$:
   6032 DD 36 F7 01   [19]  516 	ld	-9 (ix), #0x01
   6036                     517 00167$:
                            518 ;src/juego.c:92: if (entidad[i].energy) {
   6036 DD 4E F7      [19]  519 	ld	c,-9 (ix)
   6039 06 00         [ 7]  520 	ld	b,#0x00
   603B 69            [ 4]  521 	ld	l, c
   603C 60            [ 4]  522 	ld	h, b
   603D 29            [11]  523 	add	hl, hl
   603E 29            [11]  524 	add	hl, hl
   603F 09            [11]  525 	add	hl, bc
   6040 29            [11]  526 	add	hl, hl
   6041 29            [11]  527 	add	hl, hl
   6042 09            [11]  528 	add	hl, bc
   6043 DD 75 FA      [19]  529 	ld	-6 (ix), l
   6046 DD 74 FB      [19]  530 	ld	-5 (ix), h
   6049 3E 21         [ 7]  531 	ld	a, #<(_entidad)
   604B DD 86 FA      [19]  532 	add	a, -6 (ix)
   604E DD 77 FA      [19]  533 	ld	-6 (ix), a
   6051 3E A2         [ 7]  534 	ld	a, #>(_entidad)
   6053 DD 8E FB      [19]  535 	adc	a, -5 (ix)
   6056 DD 77 FB      [19]  536 	ld	-5 (ix), a
   6059 DD 7E FA      [19]  537 	ld	a, -6 (ix)
   605C DD 77 FC      [19]  538 	ld	-4 (ix), a
   605F DD 7E FB      [19]  539 	ld	a, -5 (ix)
   6062 DD 77 FD      [19]  540 	ld	-3 (ix), a
   6065 DD 6E FC      [19]  541 	ld	l,-4 (ix)
   6068 DD 66 FD      [19]  542 	ld	h,-3 (ix)
   606B 11 0B 00      [10]  543 	ld	de, #0x000b
   606E 19            [11]  544 	add	hl, de
   606F 7E            [ 7]  545 	ld	a, (hl)
   6070 B7            [ 4]  546 	or	a, a
   6071 28 0B         [12]  547 	jr	Z,00168$
                            548 ;src/juego.c:93: IA (&entidad[i]);
   6073 DD 6E FA      [19]  549 	ld	l,-6 (ix)
   6076 DD 66 FB      [19]  550 	ld	h,-5 (ix)
   6079 E5            [11]  551 	push	hl
   607A CD B6 7E      [17]  552 	call	_IA
   607D F1            [10]  553 	pop	af
   607E                     554 00168$:
                            555 ;src/juego.c:91: for (i = 1; i < 3; i++) {
   607E DD 34 F7      [23]  556 	inc	-9 (ix)
   6081 DD 7E F7      [19]  557 	ld	a, -9 (ix)
   6084 D6 03         [ 7]  558 	sub	a, #0x03
   6086 38 AE         [12]  559 	jr	C,00167$
                            560 ;src/juego.c:97: pausa(SEGUNDO);
   6088 21 00 80      [10]  561 	ld	hl, #0x8000
   608B E5            [11]  562 	push	hl
   608C CD 71 76      [17]  563 	call	_pausa
   608F F1            [10]  564 	pop	af
                            565 ;src/juego.c:98: pausaTecladoLibre();
   6090 CD B9 76      [17]  566 	call	_pausaTecladoLibre
                            567 ;src/juego.c:103: if (entidad[0].pos_x == 28) {
                            568 ;src/juego.c:102: if (nivel == 5 || nivel == 15 || nivel == 25) {
   6093 FD 21 60 A2   [14]  569 	ld	iy, #_nivel
   6097 FD 7E 00      [19]  570 	ld	a, 0 (iy)
   609A D6 05         [ 7]  571 	sub	a, #0x05
   609C 28 0F         [12]  572 	jr	Z,00153$
   609E FD 7E 00      [19]  573 	ld	a, 0 (iy)
   60A1 D6 0F         [ 7]  574 	sub	a, #0x0f
   60A3 28 08         [12]  575 	jr	Z,00153$
   60A5 FD 7E 00      [19]  576 	ld	a, 0 (iy)
   60A8 D6 19         [ 7]  577 	sub	a, #0x19
   60AA C2 64 61      [10]  578 	jp	NZ,00154$
   60AD                     579 00153$:
                            580 ;src/juego.c:103: if (entidad[0].pos_x == 28) {
   60AD 3A 31 A2      [13]  581 	ld	a, (#(_entidad + 0x0010) + 0)
   60B0 D6 1C         [ 7]  582 	sub	a, #0x1c
   60B2 C2 75 61      [10]  583 	jp	NZ,00155$
                            584 ;src/juego.c:105: if (cpct_rand() % 2){
   60B5 CD 31 93      [17]  585 	call	_cpct_getRandom_mxor_u8
   60B8 7D            [ 4]  586 	ld	a, l
                            587 ;src/juego.c:109: sprintf(temp, "%-9s ^ HP",entidad[0].name);
                            588 ;src/juego.c:105: if (cpct_rand() % 2){
   60B9 E6 01         [ 7]  589 	and	a,#0x01
   60BB 28 33         [12]  590 	jr	Z,00146$
                            591 ;src/juego.c:107: entidad[0].max_energy +=10;
   60BD 01 2D A2      [10]  592 	ld	bc, #_entidad + 12
   60C0 0A            [ 7]  593 	ld	a, (bc)
   60C1 C6 0A         [ 7]  594 	add	a, #0x0a
   60C3 02            [ 7]  595 	ld	(bc), a
                            596 ;src/juego.c:108: entidad[0].energy = entidad[0].max_energy;
   60C4 32 2C A2      [13]  597 	ld	(#(_entidad + 0x000b)),a
                            598 ;src/juego.c:109: sprintf(temp, "%-9s ^ HP",entidad[0].name);
   60C7 DD 4E F8      [19]  599 	ld	c,-8 (ix)
   60CA DD 46 F9      [19]  600 	ld	b,-7 (ix)
   60CD 21 22 A2      [10]  601 	ld	hl, #(_entidad + 0x0001)
   60D0 E5            [11]  602 	push	hl
   60D1 21 28 62      [10]  603 	ld	hl, #___str_7
   60D4 E5            [11]  604 	push	hl
   60D5 C5            [11]  605 	push	bc
   60D6 CD FB 93      [17]  606 	call	_sprintf
   60D9 21 06 00      [10]  607 	ld	hl, #6
   60DC 39            [11]  608 	add	hl, sp
   60DD F9            [ 6]  609 	ld	sp, hl
                            610 ;src/juego.c:110: printConsole(temp, 2, 0);
   60DE DD 4E F8      [19]  611 	ld	c,-8 (ix)
   60E1 DD 46 F9      [19]  612 	ld	b,-7 (ix)
   60E4 21 02 00      [10]  613 	ld	hl, #0x0002
   60E7 E5            [11]  614 	push	hl
   60E8 C5            [11]  615 	push	bc
   60E9 CD C5 79      [17]  616 	call	_printConsole
   60EC F1            [10]  617 	pop	af
   60ED F1            [10]  618 	pop	af
   60EE 18 65         [12]  619 	jr	00147$
   60F0                     620 00146$:
                            621 ;src/juego.c:111: } else if (cpct_rand() % 2){
   60F0 CD 31 93      [17]  622 	call	_cpct_getRandom_mxor_u8
   60F3 CB 45         [ 8]  623 	bit	0, l
   60F5 28 30         [12]  624 	jr	Z,00143$
                            625 ;src/juego.c:113: entidad[0].attack += 5;
   60F7 01 2E A2      [10]  626 	ld	bc, #_entidad + 13
   60FA 0A            [ 7]  627 	ld	a, (bc)
   60FB C6 05         [ 7]  628 	add	a, #0x05
   60FD 02            [ 7]  629 	ld	(bc), a
                            630 ;src/juego.c:114: sprintf(temp, "%-9s ^ ATT",entidad[0].name);
   60FE 11 32 62      [10]  631 	ld	de, #___str_8+0
   6101 DD 4E F8      [19]  632 	ld	c,-8 (ix)
   6104 DD 46 F9      [19]  633 	ld	b,-7 (ix)
   6107 21 22 A2      [10]  634 	ld	hl, #(_entidad + 0x0001)
   610A E5            [11]  635 	push	hl
   610B D5            [11]  636 	push	de
   610C C5            [11]  637 	push	bc
   610D CD FB 93      [17]  638 	call	_sprintf
   6110 21 06 00      [10]  639 	ld	hl, #6
   6113 39            [11]  640 	add	hl, sp
   6114 F9            [ 6]  641 	ld	sp, hl
                            642 ;src/juego.c:115: printConsole(temp, 2, 0);
   6115 DD 4E F8      [19]  643 	ld	c,-8 (ix)
   6118 DD 46 F9      [19]  644 	ld	b,-7 (ix)
   611B 21 02 00      [10]  645 	ld	hl, #0x0002
   611E E5            [11]  646 	push	hl
   611F C5            [11]  647 	push	bc
   6120 CD C5 79      [17]  648 	call	_printConsole
   6123 F1            [10]  649 	pop	af
   6124 F1            [10]  650 	pop	af
   6125 18 2E         [12]  651 	jr	00147$
   6127                     652 00143$:
                            653 ;src/juego.c:118: entidad[0].defense += 5;
   6127 01 30 A2      [10]  654 	ld	bc, #_entidad + 15
   612A 0A            [ 7]  655 	ld	a, (bc)
   612B C6 05         [ 7]  656 	add	a, #0x05
   612D 02            [ 7]  657 	ld	(bc), a
                            658 ;src/juego.c:119: sprintf(temp, "%-9s ^ DEF",entidad[0].name);
   612E DD 4E F8      [19]  659 	ld	c,-8 (ix)
   6131 DD 46 F9      [19]  660 	ld	b,-7 (ix)
   6134 21 22 A2      [10]  661 	ld	hl, #(_entidad + 0x0001)
   6137 E5            [11]  662 	push	hl
   6138 21 3D 62      [10]  663 	ld	hl, #___str_9
   613B E5            [11]  664 	push	hl
   613C C5            [11]  665 	push	bc
   613D CD FB 93      [17]  666 	call	_sprintf
   6140 21 06 00      [10]  667 	ld	hl, #6
   6143 39            [11]  668 	add	hl, sp
   6144 F9            [ 6]  669 	ld	sp, hl
                            670 ;src/juego.c:120: printConsole(temp, 2, 0);
   6145 DD 4E F8      [19]  671 	ld	c,-8 (ix)
   6148 DD 46 F9      [19]  672 	ld	b,-7 (ix)
   614B 21 02 00      [10]  673 	ld	hl, #0x0002
   614E E5            [11]  674 	push	hl
   614F C5            [11]  675 	push	bc
   6150 CD C5 79      [17]  676 	call	_printConsole
   6153 F1            [10]  677 	pop	af
   6154 F1            [10]  678 	pop	af
   6155                     679 00147$:
                            680 ;src/juego.c:123: printStats(&entidad[0]);
   6155 21 21 A2      [10]  681 	ld	hl, #_entidad
   6158 E5            [11]  682 	push	hl
   6159 CD 84 78      [17]  683 	call	_printStats
   615C F1            [10]  684 	pop	af
                            685 ;src/juego.c:124: sig_nivel = 1;
   615D 21 62 A2      [10]  686 	ld	hl,#_sig_nivel + 0
   6160 36 01         [10]  687 	ld	(hl), #0x01
   6162 18 11         [12]  688 	jr	00155$
   6164                     689 00154$:
                            690 ;src/juego.c:127: } else if (!(entidad[1].energy || entidad[2].energy)) {
   6164 3A 41 A2      [13]  691 	ld	a, (#_entidad + 32)
   6167 B7            [ 4]  692 	or	a, a
   6168 20 0B         [12]  693 	jr	NZ,00155$
   616A 3A 56 A2      [13]  694 	ld	a, (#_entidad + 53)
   616D B7            [ 4]  695 	or	a, a
   616E 20 05         [12]  696 	jr	NZ,00155$
                            697 ;src/juego.c:128: sig_nivel = 1;
   6170 21 62 A2      [10]  698 	ld	hl,#_sig_nivel + 0
   6173 36 01         [10]  699 	ld	(hl), #0x01
   6175                     700 00155$:
                            701 ;src/juego.c:132: if (sig_nivel) {
   6175 3A 62 A2      [13]  702 	ld	a,(#_sig_nivel + 0)
   6178 B7            [ 4]  703 	or	a, a
   6179 28 32         [12]  704 	jr	Z,00159$
                            705 ;src/juego.c:133: nivel++;
   617B 21 60 A2      [10]  706 	ld	hl, #_nivel+0
   617E 34            [11]  707 	inc	(hl)
                            708 ;src/juego.c:134: entidad[0].pos_x = 8;
   617F 21 31 A2      [10]  709 	ld	hl, #(_entidad + 0x0010)
   6182 36 08         [10]  710 	ld	(hl), #0x08
                            711 ;src/juego.c:135: sprintf(temp, "   NEXT LEVEL   ");
   6184 DD 4E F8      [19]  712 	ld	c,-8 (ix)
   6187 DD 46 F9      [19]  713 	ld	b,-7 (ix)
   618A 21 48 62      [10]  714 	ld	hl, #___str_10
   618D E5            [11]  715 	push	hl
   618E C5            [11]  716 	push	bc
   618F CD FB 93      [17]  717 	call	_sprintf
   6192 F1            [10]  718 	pop	af
   6193 F1            [10]  719 	pop	af
                            720 ;src/juego.c:137: printConsole(temp, 0, 2);
   6194 DD 4E F8      [19]  721 	ld	c,-8 (ix)
   6197 DD 46 F9      [19]  722 	ld	b,-7 (ix)
   619A 21 00 02      [10]  723 	ld	hl, #0x0200
   619D E5            [11]  724 	push	hl
   619E C5            [11]  725 	push	bc
   619F CD C5 79      [17]  726 	call	_printConsole
   61A2 F1            [10]  727 	pop	af
   61A3 F1            [10]  728 	pop	af
                            729 ;src/juego.c:138: sig_nivel = 0;
   61A4 21 62 A2      [10]  730 	ld	hl,#_sig_nivel + 0
   61A7 36 00         [10]  731 	ld	(hl), #0x00
                            732 ;src/juego.c:139: return 0;
   61A9 2E 00         [ 7]  733 	ld	l, #0x00
   61AB 18 2C         [12]  734 	jr	00169$
   61AD                     735 00159$:
                            736 ;src/juego.c:143: if (!entidad[0].energy) {
   61AD 3A 2C A2      [13]  737 	ld	a, (#(_entidad + 0x000b) + 0)
   61B0 B7            [ 4]  738 	or	a, a
   61B1 20 24         [12]  739 	jr	NZ,00161$
                            740 ;src/juego.c:144: sprintf(temp, "    GAME OVER   ");
   61B3 DD 4E F8      [19]  741 	ld	c,-8 (ix)
   61B6 DD 46 F9      [19]  742 	ld	b,-7 (ix)
   61B9 21 59 62      [10]  743 	ld	hl, #___str_11
   61BC E5            [11]  744 	push	hl
   61BD C5            [11]  745 	push	bc
   61BE CD FB 93      [17]  746 	call	_sprintf
   61C1 F1            [10]  747 	pop	af
   61C2 F1            [10]  748 	pop	af
                            749 ;src/juego.c:145: printConsole(temp, 0, 2);
   61C3 DD 4E F8      [19]  750 	ld	c,-8 (ix)
   61C6 DD 46 F9      [19]  751 	ld	b,-7 (ix)
   61C9 21 00 02      [10]  752 	ld	hl, #0x0200
   61CC E5            [11]  753 	push	hl
   61CD C5            [11]  754 	push	bc
   61CE CD C5 79      [17]  755 	call	_printConsole
   61D1 F1            [10]  756 	pop	af
   61D2 F1            [10]  757 	pop	af
                            758 ;src/juego.c:146: return 0;
   61D3 2E 00         [ 7]  759 	ld	l, #0x00
   61D5 18 02         [12]  760 	jr	00169$
   61D7                     761 00161$:
                            762 ;src/juego.c:149: return 1;
   61D7 2E 01         [ 7]  763 	ld	l, #0x01
   61D9                     764 00169$:
   61D9 DD F9         [10]  765 	ld	sp, ix
   61DB DD E1         [14]  766 	pop	ix
   61DD C9            [10]  767 	ret
   61DE                     768 ___str_0:
   61DE 44 6F 6E 20 4D 65   769 	.ascii "Don Mendo"
        6E 64 6F
   61E7 00                  770 	.db 0x00
   61E8                     771 ___str_1:
   61E8 26                  772 	.ascii "&"
   61E9 00                  773 	.db 0x00
   61EA                     774 ___str_2:
   61EA 4C 61 64 79 20 53   775 	.ascii "Lady Sol"
        6F 6C
   61F2 00                  776 	.db 0x00
   61F3                     777 ___str_3:
   61F3 20                  778 	.ascii " "
   61F4 00                  779 	.db 0x00
   61F5                     780 ___str_4:
   61F5 74 6F 67 65 74 68   781 	.ascii "together at last"
        65 72 20 61 74 20
        6C 61 73 74
   6205 00                  782 	.db 0x00
   6206                     783 ___str_5:
   6206 43 4F 4E 47 52 41   784 	.ascii "CONGRATULATIONS!"
        54 55 4C 41 54 49
        4F 4E 53 21
   6216 00                  785 	.db 0x00
   6217                     786 ___str_6:
   6217 41 43 54 49 4F 4E   787 	.ascii "ACTION (</>/D) ?"
        20 28 3C 2F 3E 2F
        44 29 20 3F
   6227 00                  788 	.db 0x00
   6228                     789 ___str_7:
   6228 25 2D 39 73 20 5E   790 	.ascii "%-9s ^ HP"
        20 48 50
   6231 00                  791 	.db 0x00
   6232                     792 ___str_8:
   6232 25 2D 39 73 20 5E   793 	.ascii "%-9s ^ ATT"
        20 41 54 54
   623C 00                  794 	.db 0x00
   623D                     795 ___str_9:
   623D 25 2D 39 73 20 5E   796 	.ascii "%-9s ^ DEF"
        20 44 45 46
   6247 00                  797 	.db 0x00
   6248                     798 ___str_10:
   6248 20 20 20 4E 45 58   799 	.ascii "   NEXT LEVEL   "
        54 20 4C 45 56 45
        4C 20 20 20
   6258 00                  800 	.db 0x00
   6259                     801 ___str_11:
   6259 20 20 20 20 47 41   802 	.ascii "    GAME OVER   "
        4D 45 20 4F 56 45
        52 20 20 20
   6269 00                  803 	.db 0x00
                            804 ;src/juego.c:152: void juego() {
                            805 ;	---------------------------------
                            806 ; Function juego
                            807 ; ---------------------------------
   626A                     808 _juego::
                            809 ;src/juego.c:155: nivel = 1;
   626A 21 60 A2      [10]  810 	ld	hl,#_nivel + 0
   626D 36 01         [10]  811 	ld	(hl), #0x01
                            812 ;src/juego.c:156: sig_nivel = 0;
   626F 21 62 A2      [10]  813 	ld	hl,#_sig_nivel + 0
   6272 36 00         [10]  814 	ld	(hl), #0x00
                            815 ;src/juego.c:158: initPlayer();
   6274 CD 48 85      [17]  816 	call	_initPlayer
                            817 ;src/juego.c:159: efecto_pliegue(PLIEGUE);
   6277 AF            [ 4]  818 	xor	a, a
   6278 F5            [11]  819 	push	af
   6279 33            [ 6]  820 	inc	sp
   627A CD 81 76      [17]  821 	call	_efecto_pliegue
   627D 33            [ 6]  822 	inc	sp
                            823 ;src/juego.c:160: while(entidad[0].energy) {
   627E                     824 00115$:
   627E 3A 2C A2      [13]  825 	ld	a, (#(_entidad + 0x000b) + 0)
   6281 B7            [ 4]  826 	or	a, a
   6282 C8            [11]  827 	ret	Z
                            828 ;src/juego.c:161: i = 0;
   6283 0E 00         [ 7]  829 	ld	c, #0x00
                            830 ;src/juego.c:162: cpct_clearScreen(0x00);
   6285 C5            [11]  831 	push	bc
   6286 21 00 40      [10]  832 	ld	hl, #0x4000
   6289 E5            [11]  833 	push	hl
   628A AF            [ 4]  834 	xor	a, a
   628B F5            [11]  835 	push	af
   628C 33            [ 6]  836 	inc	sp
   628D 26 C0         [ 7]  837 	ld	h, #0xc0
   628F E5            [11]  838 	push	hl
   6290 CD 18 95      [17]  839 	call	_cpct_memset
   6293 CD C1 76      [17]  840 	call	_dibujarMarcoExterior
   6296 21 02 00      [10]  841 	ld	hl, #0x0002
   6299 E5            [11]  842 	push	hl
   629A CD 4C 96      [17]  843 	call	_cpct_setDrawCharM1
   629D C1            [10]  844 	pop	bc
                            845 ;src/juego.c:166: if (nivel == 1) {
   629E 3A 60 A2      [13]  846 	ld	a,(#_nivel + 0)
   62A1 3D            [ 4]  847 	dec	a
   62A2 20 18         [12]  848 	jr	NZ,00102$
                            849 ;src/juego.c:167: mydrawStringM1("Chapter 1", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
   62A4 21 3E C3      [10]  850 	ld	hl, #0xc33e
   62A7 E5            [11]  851 	push	hl
   62A8 21 50 63      [10]  852 	ld	hl, #___str_12
   62AB E5            [11]  853 	push	hl
   62AC CD BA 88      [17]  854 	call	_mydrawStringM1
                            855 ;src/juego.c:168: mydrawStringM1("A faraway and foreign land ...", cpctm_screenPtr(CPCT_VMEM_START, 12, 96));
   62AF 21 CC C3      [10]  856 	ld	hl, #0xc3cc
   62B2 E5            [11]  857 	push	hl
   62B3 21 5A 63      [10]  858 	ld	hl, #___str_13
   62B6 E5            [11]  859 	push	hl
   62B7 CD BA 88      [17]  860 	call	_mydrawStringM1
                            861 ;src/juego.c:169: i = 1;
   62BA 0E 01         [ 7]  862 	ld	c, #0x01
   62BC                     863 00102$:
                            864 ;src/juego.c:171: if (nivel == 11) {
   62BC 3A 60 A2      [13]  865 	ld	a,(#_nivel + 0)
   62BF D6 0B         [ 7]  866 	sub	a, #0x0b
   62C1 20 18         [12]  867 	jr	NZ,00104$
                            868 ;src/juego.c:172: mydrawStringM1("Chapter 2", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
   62C3 21 3E C3      [10]  869 	ld	hl, #0xc33e
   62C6 E5            [11]  870 	push	hl
   62C7 21 79 63      [10]  871 	ld	hl, #___str_14
   62CA E5            [11]  872 	push	hl
   62CB CD BA 88      [17]  873 	call	_mydrawStringM1
                            874 ;src/juego.c:173: mydrawStringM1("A hidden passage to the Castle ...", cpctm_screenPtr(CPCT_VMEM_START, 6, 96));
   62CE 21 C6 C3      [10]  875 	ld	hl, #0xc3c6
   62D1 E5            [11]  876 	push	hl
   62D2 21 83 63      [10]  877 	ld	hl, #___str_15
   62D5 E5            [11]  878 	push	hl
   62D6 CD BA 88      [17]  879 	call	_mydrawStringM1
                            880 ;src/juego.c:174: i = 1;
   62D9 0E 01         [ 7]  881 	ld	c, #0x01
   62DB                     882 00104$:
                            883 ;src/juego.c:176: if (nivel == 21) {
   62DB 3A 60 A2      [13]  884 	ld	a,(#_nivel + 0)
   62DE D6 15         [ 7]  885 	sub	a, #0x15
   62E0 20 18         [12]  886 	jr	NZ,00106$
                            887 ;src/juego.c:177: mydrawStringM1("Chapter 3", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
   62E2 21 3E C3      [10]  888 	ld	hl, #0xc33e
   62E5 E5            [11]  889 	push	hl
   62E6 21 A6 63      [10]  890 	ld	hl, #___str_16
   62E9 E5            [11]  891 	push	hl
   62EA CD BA 88      [17]  892 	call	_mydrawStringM1
                            893 ;src/juego.c:178: mydrawStringM1("don Ricardo's Castle ...", cpctm_screenPtr(CPCT_VMEM_START, 15, 96));
   62ED 21 CF C3      [10]  894 	ld	hl, #0xc3cf
   62F0 E5            [11]  895 	push	hl
   62F1 21 B0 63      [10]  896 	ld	hl, #___str_17
   62F4 E5            [11]  897 	push	hl
   62F5 CD BA 88      [17]  898 	call	_mydrawStringM1
                            899 ;src/juego.c:179: i = 1;
   62F8 0E 01         [ 7]  900 	ld	c, #0x01
   62FA                     901 00106$:
                            902 ;src/juego.c:182: if (i) {
   62FA 79            [ 4]  903 	ld	a, c
   62FB B7            [ 4]  904 	or	a, a
   62FC 28 21         [12]  905 	jr	Z,00109$
                            906 ;src/juego.c:183: efecto_pliegue(DESPLIEGUE);
   62FE 3E 01         [ 7]  907 	ld	a, #0x01
   6300 F5            [11]  908 	push	af
   6301 33            [ 6]  909 	inc	sp
   6302 CD 81 76      [17]  910 	call	_efecto_pliegue
   6305 33            [ 6]  911 	inc	sp
                            912 ;src/juego.c:184: for (i=0; i< 5; i++)
   6306 0E 00         [ 7]  913 	ld	c, #0x00
   6308                     914 00118$:
                            915 ;src/juego.c:185: pausa(SEGUNDO);
   6308 C5            [11]  916 	push	bc
   6309 21 00 80      [10]  917 	ld	hl, #0x8000
   630C E5            [11]  918 	push	hl
   630D CD 71 76      [17]  919 	call	_pausa
   6310 F1            [10]  920 	pop	af
   6311 C1            [10]  921 	pop	bc
                            922 ;src/juego.c:184: for (i=0; i< 5; i++)
   6312 0C            [ 4]  923 	inc	c
   6313 79            [ 4]  924 	ld	a, c
   6314 D6 05         [ 7]  925 	sub	a, #0x05
   6316 38 F0         [12]  926 	jr	C,00118$
                            927 ;src/juego.c:187: efecto_pliegue(PLIEGUE);
   6318 AF            [ 4]  928 	xor	a, a
   6319 F5            [11]  929 	push	af
   631A 33            [ 6]  930 	inc	sp
   631B CD 81 76      [17]  931 	call	_efecto_pliegue
   631E 33            [ 6]  932 	inc	sp
   631F                     933 00109$:
                            934 ;src/juego.c:190: cursorConsola = 64;
   631F 21 61 A2      [10]  935 	ld	hl,#_cursorConsola + 0
   6322 36 40         [10]  936 	ld	(hl), #0x40
                            937 ;src/juego.c:192: initNivel();
   6324 CD 92 85      [17]  938 	call	_initNivel
                            939 ;src/juego.c:193: dibujarMarcoInterior();
   6327 CD 8E 77      [17]  940 	call	_dibujarMarcoInterior
                            941 ;src/juego.c:194: dibujarEscenario();
   632A CD 30 78      [17]  942 	call	_dibujarEscenario
                            943 ;src/juego.c:195: printLevel();
   632D CD 7C 79      [17]  944 	call	_printLevel
                            945 ;src/juego.c:197: efecto_pliegue(DESPLIEGUE);
   6330 3E 01         [ 7]  946 	ld	a, #0x01
   6332 F5            [11]  947 	push	af
   6333 33            [ 6]  948 	inc	sp
   6334 CD 81 76      [17]  949 	call	_efecto_pliegue
   6337 33            [ 6]  950 	inc	sp
                            951 ;src/juego.c:198: while (turno())
   6338                     952 00110$:
   6338 CD 3C 5D      [17]  953 	call	_turno
   633B 7D            [ 4]  954 	ld	a, l
   633C B7            [ 4]  955 	or	a, a
   633D 20 F9         [12]  956 	jr	NZ,00110$
                            957 ;src/juego.c:201: do {
   633F                     958 00113$:
                            959 ;src/juego.c:203: } while (!cpct_isAnyKeyPressed_f());
   633F CD FD 94      [17]  960 	call	_cpct_isAnyKeyPressed_f
   6342 7D            [ 4]  961 	ld	a, l
   6343 B7            [ 4]  962 	or	a, a
   6344 28 F9         [12]  963 	jr	Z,00113$
                            964 ;src/juego.c:204: efecto_pliegue(PLIEGUE);
   6346 AF            [ 4]  965 	xor	a, a
   6347 F5            [11]  966 	push	af
   6348 33            [ 6]  967 	inc	sp
   6349 CD 81 76      [17]  968 	call	_efecto_pliegue
   634C 33            [ 6]  969 	inc	sp
   634D C3 7E 62      [10]  970 	jp	00115$
   6350                     971 ___str_12:
   6350 43 68 61 70 74 65   972 	.ascii "Chapter 1"
        72 20 31
   6359 00                  973 	.db 0x00
   635A                     974 ___str_13:
   635A 41 20 66 61 72 61   975 	.ascii "A faraway and foreign land ..."
        77 61 79 20 61 6E
        64 20 66 6F 72 65
        69 67 6E 20 6C 61
        6E 64 20 2E 2E 2E
   6378 00                  976 	.db 0x00
   6379                     977 ___str_14:
   6379 43 68 61 70 74 65   978 	.ascii "Chapter 2"
        72 20 32
   6382 00                  979 	.db 0x00
   6383                     980 ___str_15:
   6383 41 20 68 69 64 64   981 	.ascii "A hidden passage to the Castle ..."
        65 6E 20 70 61 73
        73 61 67 65 20 74
        6F 20 74 68 65 20
        43 61 73 74 6C 65
        20 2E 2E 2E
   63A5 00                  982 	.db 0x00
   63A6                     983 ___str_16:
   63A6 43 68 61 70 74 65   984 	.ascii "Chapter 3"
        72 20 33
   63AF 00                  985 	.db 0x00
   63B0                     986 ___str_17:
   63B0 64 6F 6E 20 52 69   987 	.ascii "don Ricardo's Castle ..."
        63 61 72 64 6F 27
        73 20 43 61 73 74
        6C 65 20 2E 2E 2E
   63C8 00                  988 	.db 0x00
                            989 	.area _CODE
                            990 	.area _INITIALIZER
                            991 	.area _CABS (ABS)
