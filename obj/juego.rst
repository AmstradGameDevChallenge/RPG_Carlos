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
                             28 	.globl _sprintf
                             29 	.globl _cpct_etm_drawTileBox2x4
                             30 	.globl _cpct_getRandom_mxor_u8
                             31 	.globl _cpct_getScreenPtr
                             32 	.globl _cpct_waitVSYNC
                             33 	.globl _cpct_drawStringM1
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
   5EA6                      74 _turno::
   5EA6 DD E5         [15]   75 	push	ix
   5EA8 DD 21 00 00   [14]   76 	ld	ix,#0
   5EAC DD 39         [15]   77 	add	ix,sp
   5EAE 21 CC FF      [10]   78 	ld	hl, #-52
   5EB1 39            [11]   79 	add	hl, sp
   5EB2 F9            [ 6]   80 	ld	sp, hl
                             81 ;src/juego.c:16: for (i = 0; i < 3; i++) {
   5EB3 DD 36 F3 00   [19]   82 	ld	-13 (ix), #0x00
   5EB7                      83 00192$:
                             84 ;src/juego.c:17: mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
   5EB7 3A AC 87      [13]   85 	ld	a,(#_nivel + 0)
   5EBA DD 77 FE      [19]   86 	ld	-2 (ix), a
   5EBD DD 36 FF 00   [19]   87 	ld	-1 (ix), #0x00
   5EC1 6F            [ 4]   88 	ld	l, a
   5EC2 26 00         [ 7]   89 	ld	h, #0x00
   5EC4 2B            [ 6]   90 	dec	hl
   5EC5 DD 75 FE      [19]   91 	ld	-2 (ix), l
   5EC8 DD 74 FF      [19]   92 	ld	-1 (ix), h
   5ECB 4D            [ 4]   93 	ld	c,l
   5ECC 44            [ 4]   94 	ld	b,h
   5ECD 29            [11]   95 	add	hl, hl
   5ECE 09            [11]   96 	add	hl, bc
   5ECF 29            [11]   97 	add	hl, hl
   5ED0 09            [11]   98 	add	hl, bc
   5ED1 29            [11]   99 	add	hl, hl
   5ED2 09            [11]  100 	add	hl, bc
   5ED3 29            [11]  101 	add	hl, hl
   5ED4 09            [11]  102 	add	hl, bc
   5ED5 29            [11]  103 	add	hl, hl
   5ED6 09            [11]  104 	add	hl, bc
   5ED7 29            [11]  105 	add	hl, hl
   5ED8 29            [11]  106 	add	hl, hl
   5ED9 29            [11]  107 	add	hl, hl
   5EDA DD 75 FE      [19]  108 	ld	-2 (ix), l
   5EDD DD 74 FF      [19]  109 	ld	-1 (ix), h
   5EE0 3E 00         [ 7]  110 	ld	a, #<(_g_mapa01)
   5EE2 DD 86 FE      [19]  111 	add	a, -2 (ix)
   5EE5 DD 77 FE      [19]  112 	ld	-2 (ix), a
   5EE8 3E 40         [ 7]  113 	ld	a, #>(_g_mapa01)
   5EEA DD 8E FF      [19]  114 	adc	a, -1 (ix)
   5EED DD 77 FF      [19]  115 	ld	-1 (ix), a
   5EF0 DD 7E FE      [19]  116 	ld	a, -2 (ix)
   5EF3 DD 77 CC      [19]  117 	ld	-52 (ix), a
   5EF6 DD 7E FF      [19]  118 	ld	a, -1 (ix)
   5EF9 DD 77 CD      [19]  119 	ld	-51 (ix), a
                            120 ;src/juego.c:18: cpct_etm_drawTileBox2x4 ((entidad[i].pos_x_ant - 4)/2, 17, 2, 7, 18, INICIO_AREA_JUEGO, mapa );
   5EFC DD 7E CC      [19]  121 	ld	a, -52 (ix)
   5EFF DD 77 FE      [19]  122 	ld	-2 (ix), a
   5F02 DD 7E CD      [19]  123 	ld	a, -51 (ix)
   5F05 DD 77 FF      [19]  124 	ld	-1 (ix), a
   5F08 DD 36 FC 84   [19]  125 	ld	-4 (ix), #0x84
   5F0C DD 36 FD C2   [19]  126 	ld	-3 (ix), #0xc2
   5F10 DD 4E F3      [19]  127 	ld	c,-13 (ix)
   5F13 06 00         [ 7]  128 	ld	b,#0x00
   5F15 69            [ 4]  129 	ld	l, c
   5F16 60            [ 4]  130 	ld	h, b
   5F17 29            [11]  131 	add	hl, hl
   5F18 29            [11]  132 	add	hl, hl
   5F19 09            [11]  133 	add	hl, bc
   5F1A 29            [11]  134 	add	hl, hl
   5F1B 29            [11]  135 	add	hl, hl
   5F1C 01 70 87      [10]  136 	ld	bc,#_entidad
   5F1F 09            [11]  137 	add	hl,bc
   5F20 DD 75 FA      [19]  138 	ld	-6 (ix), l
   5F23 DD 74 FB      [19]  139 	ld	-5 (ix), h
   5F26 11 10 00      [10]  140 	ld	de, #0x0010
   5F29 19            [11]  141 	add	hl, de
   5F2A 7E            [ 7]  142 	ld	a, (hl)
   5F2B DD 77 FA      [19]  143 	ld	-6 (ix), a
   5F2E DD 77 FA      [19]  144 	ld	-6 (ix), a
   5F31 DD 36 FB 00   [19]  145 	ld	-5 (ix), #0x00
   5F35 DD 7E FA      [19]  146 	ld	a, -6 (ix)
   5F38 C6 FC         [ 7]  147 	add	a, #0xfc
   5F3A 4F            [ 4]  148 	ld	c, a
   5F3B DD 7E FB      [19]  149 	ld	a, -5 (ix)
   5F3E CE FF         [ 7]  150 	adc	a, #0xff
   5F40 47            [ 4]  151 	ld	b, a
   5F41 DD 71 F8      [19]  152 	ld	-8 (ix), c
   5F44 DD 70 F9      [19]  153 	ld	-7 (ix), b
   5F47 CB 78         [ 8]  154 	bit	7, b
   5F49 28 10         [12]  155 	jr	Z,00202$
   5F4B DD 7E FA      [19]  156 	ld	a, -6 (ix)
   5F4E C6 FD         [ 7]  157 	add	a, #0xfd
   5F50 DD 77 F8      [19]  158 	ld	-8 (ix), a
   5F53 DD 7E FB      [19]  159 	ld	a, -5 (ix)
   5F56 CE FF         [ 7]  160 	adc	a, #0xff
   5F58 DD 77 F9      [19]  161 	ld	-7 (ix), a
   5F5B                     162 00202$:
   5F5B DD 46 F8      [19]  163 	ld	b, -8 (ix)
   5F5E DD 4E F9      [19]  164 	ld	c, -7 (ix)
   5F61 CB 29         [ 8]  165 	sra	c
   5F63 CB 18         [ 8]  166 	rr	b
   5F65 DD 6E FE      [19]  167 	ld	l,-2 (ix)
   5F68 DD 66 FF      [19]  168 	ld	h,-1 (ix)
   5F6B E5            [11]  169 	push	hl
   5F6C DD 6E FC      [19]  170 	ld	l,-4 (ix)
   5F6F DD 66 FD      [19]  171 	ld	h,-3 (ix)
   5F72 E5            [11]  172 	push	hl
   5F73 21 07 12      [10]  173 	ld	hl, #0x1207
   5F76 E5            [11]  174 	push	hl
   5F77 21 11 02      [10]  175 	ld	hl, #0x0211
   5F7A E5            [11]  176 	push	hl
   5F7B C5            [11]  177 	push	bc
   5F7C 33            [ 6]  178 	inc	sp
   5F7D CD 2A 78      [17]  179 	call	_cpct_etm_drawTileBox2x4
                            180 ;src/juego.c:16: for (i = 0; i < 3; i++) {
   5F80 DD 34 F3      [23]  181 	inc	-13 (ix)
   5F83 DD 7E F3      [19]  182 	ld	a, -13 (ix)
   5F86 D6 03         [ 7]  183 	sub	a, #0x03
   5F88 DA B7 5E      [10]  184 	jp	C, 00192$
                            185 ;src/juego.c:21: cpct_waitVSYNC();
   5F8B CD 4F 7A      [17]  186 	call	_cpct_waitVSYNC
                            187 ;src/juego.c:23: for (i = 0; i < 3; i++) {
   5F8E DD 36 F3 00   [19]  188 	ld	-13 (ix), #0x00
   5F92                     189 00194$:
                            190 ;src/juego.c:24: if (entidad[i].energy) {
   5F92 DD 4E F3      [19]  191 	ld	c,-13 (ix)
   5F95 06 00         [ 7]  192 	ld	b,#0x00
   5F97 69            [ 4]  193 	ld	l, c
   5F98 60            [ 4]  194 	ld	h, b
   5F99 29            [11]  195 	add	hl, hl
   5F9A 29            [11]  196 	add	hl, hl
   5F9B 09            [11]  197 	add	hl, bc
   5F9C 29            [11]  198 	add	hl, hl
   5F9D 29            [11]  199 	add	hl, hl
   5F9E DD 75 F8      [19]  200 	ld	-8 (ix), l
   5FA1 DD 74 F9      [19]  201 	ld	-7 (ix), h
   5FA4 DD 7E F8      [19]  202 	ld	a, -8 (ix)
   5FA7 C6 70         [ 7]  203 	add	a, #<(_entidad)
   5FA9 DD 77 F8      [19]  204 	ld	-8 (ix), a
   5FAC DD 7E F9      [19]  205 	ld	a, -7 (ix)
   5FAF CE 87         [ 7]  206 	adc	a, #>(_entidad)
   5FB1 DD 77 F9      [19]  207 	ld	-7 (ix), a
   5FB4 DD 7E F8      [19]  208 	ld	a, -8 (ix)
   5FB7 DD 77 FA      [19]  209 	ld	-6 (ix), a
   5FBA DD 7E F9      [19]  210 	ld	a, -7 (ix)
   5FBD DD 77 FB      [19]  211 	ld	-5 (ix), a
   5FC0 DD 6E FA      [19]  212 	ld	l,-6 (ix)
   5FC3 DD 66 FB      [19]  213 	ld	h,-5 (ix)
   5FC6 11 0A 00      [10]  214 	ld	de, #0x000a
   5FC9 19            [11]  215 	add	hl, de
   5FCA 7E            [ 7]  216 	ld	a, (hl)
   5FCB DD 77 FA      [19]  217 	ld	-6 (ix), a
   5FCE B7            [ 4]  218 	or	a, a
   5FCF CA 5B 60      [10]  219 	jp	Z, 00195$
                            220 ;src/juego.c:25: printStats(&entidad[i]);
   5FD2 DD 7E F8      [19]  221 	ld	a, -8 (ix)
   5FD5 DD 77 FA      [19]  222 	ld	-6 (ix), a
   5FD8 DD 7E F9      [19]  223 	ld	a, -7 (ix)
   5FDB DD 77 FB      [19]  224 	ld	-5 (ix), a
   5FDE DD 6E FA      [19]  225 	ld	l,-6 (ix)
   5FE1 DD 66 FB      [19]  226 	ld	h,-5 (ix)
   5FE4 E5            [11]  227 	push	hl
   5FE5 CD F8 6F      [17]  228 	call	_printStats
   5FE8 F1            [10]  229 	pop	af
                            230 ;src/juego.c:26: cpct_drawSpriteMasked (entidad[i].sprite, cpct_getScreenPtr (CPCT_VMEM_START, entidad[i].pos_x, 132), 4,28);
   5FE9 DD 7E F8      [19]  231 	ld	a, -8 (ix)
   5FEC C6 0F         [ 7]  232 	add	a, #0x0f
   5FEE DD 77 FA      [19]  233 	ld	-6 (ix), a
   5FF1 DD 7E F9      [19]  234 	ld	a, -7 (ix)
   5FF4 CE 00         [ 7]  235 	adc	a, #0x00
   5FF6 DD 77 FB      [19]  236 	ld	-5 (ix), a
   5FF9 DD 6E FA      [19]  237 	ld	l,-6 (ix)
   5FFC DD 66 FB      [19]  238 	ld	h,-5 (ix)
   5FFF 46            [ 7]  239 	ld	b, (hl)
   6000 3E 84         [ 7]  240 	ld	a, #0x84
   6002 F5            [11]  241 	push	af
   6003 33            [ 6]  242 	inc	sp
   6004 C5            [11]  243 	push	bc
   6005 33            [ 6]  244 	inc	sp
   6006 21 00 C0      [10]  245 	ld	hl, #0xc000
   6009 E5            [11]  246 	push	hl
   600A CD A3 7B      [17]  247 	call	_cpct_getScreenPtr
   600D DD 74 FD      [19]  248 	ld	-3 (ix), h
   6010 DD 75 FC      [19]  249 	ld	-4 (ix), l
   6013 DD 7E F8      [19]  250 	ld	a, -8 (ix)
   6016 DD 77 FE      [19]  251 	ld	-2 (ix), a
   6019 DD 7E F9      [19]  252 	ld	a, -7 (ix)
   601C DD 77 FF      [19]  253 	ld	-1 (ix), a
   601F DD 6E FE      [19]  254 	ld	l,-2 (ix)
   6022 DD 66 FF      [19]  255 	ld	h,-1 (ix)
   6025 11 12 00      [10]  256 	ld	de, #0x0012
   6028 19            [11]  257 	add	hl, de
   6029 7E            [ 7]  258 	ld	a, (hl)
   602A DD 77 FE      [19]  259 	ld	-2 (ix), a
   602D 23            [ 6]  260 	inc	hl
   602E 7E            [ 7]  261 	ld	a, (hl)
   602F DD 77 FF      [19]  262 	ld	-1 (ix), a
   6032 21 04 1C      [10]  263 	ld	hl, #0x1c04
   6035 E5            [11]  264 	push	hl
   6036 DD 6E FC      [19]  265 	ld	l,-4 (ix)
   6039 DD 66 FD      [19]  266 	ld	h,-3 (ix)
   603C E5            [11]  267 	push	hl
   603D DD 6E FE      [19]  268 	ld	l,-2 (ix)
   6040 DD 66 FF      [19]  269 	ld	h,-1 (ix)
   6043 E5            [11]  270 	push	hl
   6044 CD 73 79      [17]  271 	call	_cpct_drawSpriteMasked
                            272 ;src/juego.c:27: entidad[i].pos_x_ant = entidad[i].pos_x;
   6047 DD 7E F8      [19]  273 	ld	a, -8 (ix)
   604A C6 10         [ 7]  274 	add	a, #0x10
   604C 4F            [ 4]  275 	ld	c, a
   604D DD 7E F9      [19]  276 	ld	a, -7 (ix)
   6050 CE 00         [ 7]  277 	adc	a, #0x00
   6052 47            [ 4]  278 	ld	b, a
   6053 DD 6E FA      [19]  279 	ld	l,-6 (ix)
   6056 DD 66 FB      [19]  280 	ld	h,-5 (ix)
   6059 7E            [ 7]  281 	ld	a, (hl)
   605A 02            [ 7]  282 	ld	(bc), a
   605B                     283 00195$:
                            284 ;src/juego.c:23: for (i = 0; i < 3; i++) {
   605B DD 34 F3      [23]  285 	inc	-13 (ix)
   605E DD 7E F3      [19]  286 	ld	a, -13 (ix)
   6061 D6 03         [ 7]  287 	sub	a, #0x03
   6063 DA 92 5F      [10]  288 	jp	C, 00194$
                            289 ;src/juego.c:31: if (nivel == 5 || nivel == 15 || nivel == 25) {
   6066 FD 21 AC 87   [14]  290 	ld	iy, #_nivel
   606A FD 7E 00      [19]  291 	ld	a, 0 (iy)
   606D D6 05         [ 7]  292 	sub	a, #0x05
   606F 28 0E         [12]  293 	jr	Z,00105$
   6071 FD 7E 00      [19]  294 	ld	a, 0 (iy)
   6074 D6 0F         [ 7]  295 	sub	a, #0x0f
   6076 28 07         [12]  296 	jr	Z,00105$
   6078 FD 7E 00      [19]  297 	ld	a, 0 (iy)
   607B D6 19         [ 7]  298 	sub	a, #0x19
   607D 20 03         [12]  299 	jr	NZ,00106$
   607F                     300 00105$:
                            301 ;src/juego.c:32: drawPotion();
   607F CD 9C 73      [17]  302 	call	_drawPotion
   6082                     303 00106$:
                            304 ;src/juego.c:39: i = 0;
   6082 DD 36 F3 00   [19]  305 	ld	-13 (ix), #0x00
                            306 ;src/juego.c:40: do  {
   6086 21 03 00      [10]  307 	ld	hl, #0x0003
   6089 39            [11]  308 	add	hl, sp
   608A DD 75 F8      [19]  309 	ld	-8 (ix), l
   608D DD 74 F9      [19]  310 	ld	-7 (ix), h
   6090                     311 00121$:
                            312 ;src/juego.c:41: cpct_scanKeyboard_f();
   6090 CD 8F 76      [17]  313 	call	_cpct_scanKeyboard_f
                            314 ;src/juego.c:42: sprintf(temp, "ACTION (%c/%c/D) ?",242,243);
   6093 DD 7E F8      [19]  315 	ld	a, -8 (ix)
   6096 DD 77 FA      [19]  316 	ld	-6 (ix), a
   6099 DD 7E F9      [19]  317 	ld	a, -7 (ix)
   609C DD 77 FB      [19]  318 	ld	-5 (ix), a
   609F 21 F3 00      [10]  319 	ld	hl, #0x00f3
   60A2 E5            [11]  320 	push	hl
   60A3 2E F2         [ 7]  321 	ld	l, #0xf2
   60A5 E5            [11]  322 	push	hl
   60A6 21 ED 65      [10]  323 	ld	hl, #___str_0
   60A9 E5            [11]  324 	push	hl
   60AA DD 6E FA      [19]  325 	ld	l,-6 (ix)
   60AD DD 66 FB      [19]  326 	ld	h,-5 (ix)
   60B0 E5            [11]  327 	push	hl
   60B1 CD F7 79      [17]  328 	call	_sprintf
   60B4 21 08 00      [10]  329 	ld	hl, #8
   60B7 39            [11]  330 	add	hl, sp
   60B8 F9            [ 6]  331 	ld	sp, hl
                            332 ;src/juego.c:43: if (i < 25) {
   60B9 DD 7E F3      [19]  333 	ld	a, -13 (ix)
   60BC D6 19         [ 7]  334 	sub	a, #0x19
   60BE 30 1E         [12]  335 	jr	NC,00110$
                            336 ;src/juego.c:44: printConsole(temp, 2, 0);
   60C0 DD 7E F8      [19]  337 	ld	a, -8 (ix)
   60C3 DD 77 FA      [19]  338 	ld	-6 (ix), a
   60C6 DD 7E F9      [19]  339 	ld	a, -7 (ix)
   60C9 DD 77 FB      [19]  340 	ld	-5 (ix), a
   60CC 21 02 00      [10]  341 	ld	hl, #0x0002
   60CF E5            [11]  342 	push	hl
   60D0 DD 6E FA      [19]  343 	ld	l,-6 (ix)
   60D3 DD 66 FB      [19]  344 	ld	h,-5 (ix)
   60D6 E5            [11]  345 	push	hl
   60D7 CD 2B 71      [17]  346 	call	_printConsole
   60DA F1            [10]  347 	pop	af
   60DB F1            [10]  348 	pop	af
   60DC 18 1C         [12]  349 	jr	00111$
   60DE                     350 00110$:
                            351 ;src/juego.c:46: printConsole(temp, 0, 2);
   60DE DD 7E F8      [19]  352 	ld	a, -8 (ix)
   60E1 DD 77 FA      [19]  353 	ld	-6 (ix), a
   60E4 DD 7E F9      [19]  354 	ld	a, -7 (ix)
   60E7 DD 77 FB      [19]  355 	ld	-5 (ix), a
   60EA 21 00 02      [10]  356 	ld	hl, #0x0200
   60ED E5            [11]  357 	push	hl
   60EE DD 6E FA      [19]  358 	ld	l,-6 (ix)
   60F1 DD 66 FB      [19]  359 	ld	h,-5 (ix)
   60F4 E5            [11]  360 	push	hl
   60F5 CD 2B 71      [17]  361 	call	_printConsole
   60F8 F1            [10]  362 	pop	af
   60F9 F1            [10]  363 	pop	af
   60FA                     364 00111$:
                            365 ;src/juego.c:48: i++;
   60FA DD 34 F3      [23]  366 	inc	-13 (ix)
                            367 ;src/juego.c:49: cursorConsola -=8;
   60FD 21 AD 87      [10]  368 	ld	hl, #_cursorConsola
   6100 7E            [ 7]  369 	ld	a, (hl)
   6101 C6 F8         [ 7]  370 	add	a, #0xf8
   6103 77            [ 7]  371 	ld	(hl), a
                            372 ;src/juego.c:50: if (i == 50)
   6104 DD 7E F3      [19]  373 	ld	a, -13 (ix)
   6107 D6 32         [ 7]  374 	sub	a, #0x32
   6109 20 04         [12]  375 	jr	NZ,00122$
                            376 ;src/juego.c:51: i=0;
   610B DD 36 F3 00   [19]  377 	ld	-13 (ix), #0x00
   610F                     378 00122$:
                            379 ;src/juego.c:53: while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_CursorLeft)  && !cpct_isKeyPressed(Joy0_Left) 
   610F 21 04 04      [10]  380 	ld	hl, #0x0404
   6112 CD 6C 76      [17]  381 	call	_cpct_isKeyPressed
   6115 DD 75 FA      [19]  382 	ld	-6 (ix), l
   6118 7D            [ 4]  383 	ld	a, l
   6119 B7            [ 4]  384 	or	a, a
   611A 20 4A         [12]  385 	jr	NZ,00123$
   611C 21 01 01      [10]  386 	ld	hl, #0x0101
   611F CD 6C 76      [17]  387 	call	_cpct_isKeyPressed
   6122 DD 75 FA      [19]  388 	ld	-6 (ix), l
   6125 7D            [ 4]  389 	ld	a, l
   6126 B7            [ 4]  390 	or	a, a
   6127 20 3D         [12]  391 	jr	NZ,00123$
   6129 21 09 04      [10]  392 	ld	hl, #0x0409
   612C CD 6C 76      [17]  393 	call	_cpct_isKeyPressed
   612F 7D            [ 4]  394 	ld	a, l
   6130 B7            [ 4]  395 	or	a, a
   6131 20 33         [12]  396 	jr	NZ,00123$
                            397 ;src/juego.c:54: && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_CursorRight) && !cpct_isKeyPressed(Joy0_Right) 
   6133 21 03 08      [10]  398 	ld	hl, #0x0803
   6136 CD 6C 76      [17]  399 	call	_cpct_isKeyPressed
   6139 7D            [ 4]  400 	ld	a, l
   613A B7            [ 4]  401 	or	a, a
   613B 20 29         [12]  402 	jr	NZ,00123$
   613D 21 00 02      [10]  403 	ld	hl, #0x0200
   6140 CD 6C 76      [17]  404 	call	_cpct_isKeyPressed
   6143 7D            [ 4]  405 	ld	a, l
   6144 B7            [ 4]  406 	or	a, a
   6145 20 1F         [12]  407 	jr	NZ,00123$
   6147 21 09 08      [10]  408 	ld	hl, #0x0809
   614A CD 6C 76      [17]  409 	call	_cpct_isKeyPressed
   614D 7D            [ 4]  410 	ld	a, l
   614E B7            [ 4]  411 	or	a, a
   614F 20 15         [12]  412 	jr	NZ,00123$
                            413 ;src/juego.c:55: && !cpct_isKeyPressed(Key_D) && !cpct_isKeyPressed(Joy0_Fire1));
   6151 21 07 20      [10]  414 	ld	hl, #0x2007
   6154 CD 6C 76      [17]  415 	call	_cpct_isKeyPressed
   6157 7D            [ 4]  416 	ld	a, l
   6158 B7            [ 4]  417 	or	a, a
   6159 20 0B         [12]  418 	jr	NZ,00123$
   615B 21 09 10      [10]  419 	ld	hl, #0x1009
   615E CD 6C 76      [17]  420 	call	_cpct_isKeyPressed
   6161 7D            [ 4]  421 	ld	a, l
   6162 B7            [ 4]  422 	or	a, a
   6163 CA 90 60      [10]  423 	jp	Z, 00121$
   6166                     424 00123$:
                            425 ;src/juego.c:57: nueva_pos = 0;
   6166 DD 36 CE 00   [19]  426 	ld	-50 (ix), #0x00
                            427 ;src/juego.c:60: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
   616A 21 04 04      [10]  428 	ld	hl, #0x0404
   616D CD 6C 76      [17]  429 	call	_cpct_isKeyPressed
                            430 ;src/juego.c:64: nueva_pos = entidad[0].pos_x - 4;
                            431 ;src/juego.c:60: if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
   6170 7D            [ 4]  432 	ld	a, l
   6171 B7            [ 4]  433 	or	a, a
   6172 20 14         [12]  434 	jr	NZ,00124$
   6174 21 01 01      [10]  435 	ld	hl, #0x0101
   6177 CD 6C 76      [17]  436 	call	_cpct_isKeyPressed
   617A 7D            [ 4]  437 	ld	a, l
   617B B7            [ 4]  438 	or	a, a
   617C 20 0A         [12]  439 	jr	NZ,00124$
   617E 21 09 04      [10]  440 	ld	hl, #0x0409
   6181 CD 6C 76      [17]  441 	call	_cpct_isKeyPressed
   6184 7D            [ 4]  442 	ld	a, l
   6185 B7            [ 4]  443 	or	a, a
   6186 28 33         [12]  444 	jr	Z,00125$
   6188                     445 00124$:
                            446 ;src/juego.c:61: sprintf(temp, "%-9s GOES %c",entidad[0].name,242);
   6188 11 00 66      [10]  447 	ld	de, #___str_1+0
   618B DD 4E F8      [19]  448 	ld	c,-8 (ix)
   618E DD 46 F9      [19]  449 	ld	b,-7 (ix)
   6191 21 F2 00      [10]  450 	ld	hl, #0x00f2
   6194 E5            [11]  451 	push	hl
   6195 21 70 87      [10]  452 	ld	hl, #_entidad
   6198 E5            [11]  453 	push	hl
   6199 D5            [11]  454 	push	de
   619A C5            [11]  455 	push	bc
   619B CD F7 79      [17]  456 	call	_sprintf
   619E 21 08 00      [10]  457 	ld	hl, #8
   61A1 39            [11]  458 	add	hl, sp
   61A2 F9            [ 6]  459 	ld	sp, hl
                            460 ;src/juego.c:62: printConsole(temp, 2, 0);
   61A3 DD 4E F8      [19]  461 	ld	c,-8 (ix)
   61A6 DD 46 F9      [19]  462 	ld	b,-7 (ix)
   61A9 21 02 00      [10]  463 	ld	hl, #0x0002
   61AC E5            [11]  464 	push	hl
   61AD C5            [11]  465 	push	bc
   61AE CD 2B 71      [17]  466 	call	_printConsole
   61B1 F1            [10]  467 	pop	af
   61B2 F1            [10]  468 	pop	af
                            469 ;src/juego.c:64: nueva_pos = entidad[0].pos_x - 4;
   61B3 3A 7F 87      [13]  470 	ld	a, (#(_entidad + 0x000f) + 0)
   61B6 C6 FC         [ 7]  471 	add	a, #0xfc
   61B8 DD 77 CE      [19]  472 	ld	-50 (ix), a
   61BB                     473 00125$:
                            474 ;src/juego.c:68: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
   61BB 21 03 08      [10]  475 	ld	hl, #0x0803
   61BE CD 6C 76      [17]  476 	call	_cpct_isKeyPressed
                            477 ;src/juego.c:74: if (nueva_pos == entidad[1].pos_x && entidad[1].energy)
                            478 ;src/juego.c:77: if (nueva_pos == entidad[2].pos_x && entidad[2].energy)
                            479 ;src/juego.c:68: if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
   61C1 7D            [ 4]  480 	ld	a, l
   61C2 B7            [ 4]  481 	or	a, a
   61C3 20 14         [12]  482 	jr	NZ,00134$
   61C5 21 00 02      [10]  483 	ld	hl, #0x0200
   61C8 CD 6C 76      [17]  484 	call	_cpct_isKeyPressed
   61CB 7D            [ 4]  485 	ld	a, l
   61CC B7            [ 4]  486 	or	a, a
   61CD 20 0A         [12]  487 	jr	NZ,00134$
   61CF 21 09 08      [10]  488 	ld	hl, #0x0809
   61D2 CD 6C 76      [17]  489 	call	_cpct_isKeyPressed
   61D5 7D            [ 4]  490 	ld	a, l
   61D6 B7            [ 4]  491 	or	a, a
   61D7 28 6E         [12]  492 	jr	Z,00135$
   61D9                     493 00134$:
                            494 ;src/juego.c:69: sprintf(temp, "%-9s GOES %c",entidad[0].name,243);
   61D9 11 00 66      [10]  495 	ld	de, #___str_1+0
   61DC DD 4E F8      [19]  496 	ld	c,-8 (ix)
   61DF DD 46 F9      [19]  497 	ld	b,-7 (ix)
   61E2 21 F3 00      [10]  498 	ld	hl, #0x00f3
   61E5 E5            [11]  499 	push	hl
   61E6 21 70 87      [10]  500 	ld	hl, #_entidad
   61E9 E5            [11]  501 	push	hl
   61EA D5            [11]  502 	push	de
   61EB C5            [11]  503 	push	bc
   61EC CD F7 79      [17]  504 	call	_sprintf
   61EF 21 08 00      [10]  505 	ld	hl, #8
   61F2 39            [11]  506 	add	hl, sp
   61F3 F9            [ 6]  507 	ld	sp, hl
                            508 ;src/juego.c:70: printConsole(temp, 2 ,0);
   61F4 DD 4E F8      [19]  509 	ld	c,-8 (ix)
   61F7 DD 46 F9      [19]  510 	ld	b,-7 (ix)
   61FA 21 02 00      [10]  511 	ld	hl, #0x0002
   61FD E5            [11]  512 	push	hl
   61FE C5            [11]  513 	push	bc
   61FF CD 2B 71      [17]  514 	call	_printConsole
   6202 F1            [10]  515 	pop	af
   6203 F1            [10]  516 	pop	af
                            517 ;src/juego.c:72: nueva_pos = entidad[0].pos_x + 4;
   6204 3A 7F 87      [13]  518 	ld	a, (#(_entidad + 0x000f) + 0)
   6207 C6 04         [ 7]  519 	add	a, #0x04
   6209 DD 77 CE      [19]  520 	ld	-50 (ix), a
                            521 ;src/juego.c:74: if (nueva_pos == entidad[1].pos_x && entidad[1].energy)
   620C 21 93 87      [10]  522 	ld	hl, #(_entidad + 0x0023) + 0
   620F DD 7E CE      [19]  523 	ld	a,-50 (ix)
   6212 96            [ 7]  524 	sub	a,(hl)
   6213 20 16         [12]  525 	jr	NZ,00129$
   6215 3A 8E 87      [13]  526 	ld	a,(#(_entidad + 0x001e) + 0)
   6218 DD 77 FA      [19]  527 	ld	-6 (ix), a
   621B B7            [ 4]  528 	or	a, a
   621C 28 0D         [12]  529 	jr	Z,00129$
                            530 ;src/juego.c:75: atacar(&entidad[0], &entidad[1]);
   621E 21 84 87      [10]  531 	ld	hl, #(_entidad + 0x0014)
   6221 E5            [11]  532 	push	hl
   6222 21 70 87      [10]  533 	ld	hl, #_entidad
   6225 E5            [11]  534 	push	hl
   6226 CD 90 71      [17]  535 	call	_atacar
   6229 F1            [10]  536 	pop	af
   622A F1            [10]  537 	pop	af
   622B                     538 00129$:
                            539 ;src/juego.c:77: if (nueva_pos == entidad[2].pos_x && entidad[2].energy)
   622B 21 A7 87      [10]  540 	ld	hl, #(_entidad + 0x0037) + 0
   622E DD 7E CE      [19]  541 	ld	a,-50 (ix)
   6231 96            [ 7]  542 	sub	a,(hl)
   6232 20 13         [12]  543 	jr	NZ,00135$
   6234 3A A2 87      [13]  544 	ld	a, (#(_entidad + 0x0032) + 0)
   6237 B7            [ 4]  545 	or	a, a
   6238 28 0D         [12]  546 	jr	Z,00135$
                            547 ;src/juego.c:78: atacar(&entidad[0], &entidad[2]);
   623A 21 98 87      [10]  548 	ld	hl, #(_entidad + 0x0028)
   623D E5            [11]  549 	push	hl
   623E 21 70 87      [10]  550 	ld	hl, #_entidad
   6241 E5            [11]  551 	push	hl
   6242 CD 90 71      [17]  552 	call	_atacar
   6245 F1            [10]  553 	pop	af
   6246 F1            [10]  554 	pop	af
   6247                     555 00135$:
                            556 ;src/juego.c:83: if (cpct_isKeyPressed(Key_D) || cpct_isKeyPressed(Joy0_Fire1)) {
   6247 21 07 20      [10]  557 	ld	hl, #0x2007
   624A CD 6C 76      [17]  558 	call	_cpct_isKeyPressed
   624D 7D            [ 4]  559 	ld	a, l
   624E B7            [ 4]  560 	or	a, a
   624F 20 0A         [12]  561 	jr	NZ,00138$
   6251 21 09 10      [10]  562 	ld	hl, #0x1009
   6254 CD 6C 76      [17]  563 	call	_cpct_isKeyPressed
   6257 7D            [ 4]  564 	ld	a, l
   6258 B7            [ 4]  565 	or	a, a
   6259 28 08         [12]  566 	jr	Z,00139$
   625B                     567 00138$:
                            568 ;src/juego.c:84: defender(&entidad[0]);
   625B 21 70 87      [10]  569 	ld	hl, #_entidad
   625E E5            [11]  570 	push	hl
   625F CD C6 72      [17]  571 	call	_defender
   6262 F1            [10]  572 	pop	af
   6263                     573 00139$:
                            574 ;src/juego.c:90: && nueva_pos < 37 
   6263 3E 03         [ 7]  575 	ld	a, #0x03
   6265 DD 96 CE      [19]  576 	sub	a, -50 (ix)
   6268 30 2C         [12]  577 	jr	NC,00243$
                            578 ;src/juego.c:91: && (!entidad[1].energy || nueva_pos != entidad[1].pos_x)
   626A DD 7E CE      [19]  579 	ld	a, -50 (ix)
   626D D6 25         [ 7]  580 	sub	a, #0x25
   626F 30 25         [12]  581 	jr	NC,00243$
   6271 3A 8E 87      [13]  582 	ld	a, (#(_entidad + 0x001e) + 0)
   6274 B7            [ 4]  583 	or	a, a
   6275 28 09         [12]  584 	jr	Z,00147$
   6277 21 93 87      [10]  585 	ld	hl, #(_entidad + 0x0023) + 0
   627A DD 7E CE      [19]  586 	ld	a,-50 (ix)
   627D 96            [ 7]  587 	sub	a,(hl)
   627E 28 16         [12]  588 	jr	Z,00243$
   6280                     589 00147$:
                            590 ;src/juego.c:92: && (!entidad[2].energy || nueva_pos != entidad[2].pos_x)
   6280 3A A2 87      [13]  591 	ld	a, (#(_entidad + 0x0032) + 0)
   6283 B7            [ 4]  592 	or	a, a
   6284 28 09         [12]  593 	jr	Z,00141$
   6286 21 A7 87      [10]  594 	ld	hl, #(_entidad + 0x0037) + 0
   6289 DD 7E CE      [19]  595 	ld	a,-50 (ix)
   628C 96            [ 7]  596 	sub	a,(hl)
   628D 28 07         [12]  597 	jr	Z,00243$
   628F                     598 00141$:
                            599 ;src/juego.c:94: entidad[0].pos_x = nueva_pos;
   628F 21 7F 87      [10]  600 	ld	hl, #(_entidad + 0x000f)
   6292 DD 7E CE      [19]  601 	ld	a, -50 (ix)
   6295 77            [ 7]  602 	ld	(hl), a
                            603 ;src/juego.c:98: for (i = 1; i < 3; i++) {
   6296                     604 00243$:
   6296 DD 7E F8      [19]  605 	ld	a, -8 (ix)
   6299 DD 77 FA      [19]  606 	ld	-6 (ix), a
   629C DD 7E F9      [19]  607 	ld	a, -7 (ix)
   629F DD 77 FB      [19]  608 	ld	-5 (ix), a
   62A2 DD 7E F8      [19]  609 	ld	a, -8 (ix)
   62A5 DD 77 FC      [19]  610 	ld	-4 (ix), a
   62A8 DD 7E F9      [19]  611 	ld	a, -7 (ix)
   62AB DD 77 FD      [19]  612 	ld	-3 (ix), a
   62AE DD 7E F8      [19]  613 	ld	a, -8 (ix)
   62B1 DD 77 FE      [19]  614 	ld	-2 (ix), a
   62B4 DD 7E F9      [19]  615 	ld	a, -7 (ix)
   62B7 DD 77 FF      [19]  616 	ld	-1 (ix), a
   62BA DD 7E F8      [19]  617 	ld	a, -8 (ix)
   62BD DD 77 F6      [19]  618 	ld	-10 (ix), a
   62C0 DD 7E F9      [19]  619 	ld	a, -7 (ix)
   62C3 DD 77 F7      [19]  620 	ld	-9 (ix), a
   62C6 DD 36 F3 01   [19]  621 	ld	-13 (ix), #0x01
   62CA                     622 00198$:
                            623 ;src/juego.c:99: if (entidad[i].energy) {
   62CA DD 4E F3      [19]  624 	ld	c,-13 (ix)
   62CD 06 00         [ 7]  625 	ld	b,#0x00
   62CF 69            [ 4]  626 	ld	l, c
   62D0 60            [ 4]  627 	ld	h, b
   62D1 29            [11]  628 	add	hl, hl
   62D2 29            [11]  629 	add	hl, hl
   62D3 09            [11]  630 	add	hl, bc
   62D4 29            [11]  631 	add	hl, hl
   62D5 29            [11]  632 	add	hl, hl
   62D6 DD 75 F4      [19]  633 	ld	-12 (ix), l
   62D9 DD 74 F5      [19]  634 	ld	-11 (ix), h
   62DC DD 7E F4      [19]  635 	ld	a, -12 (ix)
   62DF C6 70         [ 7]  636 	add	a, #<(_entidad)
   62E1 DD 77 F4      [19]  637 	ld	-12 (ix), a
   62E4 DD 7E F5      [19]  638 	ld	a, -11 (ix)
   62E7 CE 87         [ 7]  639 	adc	a, #>(_entidad)
   62E9 DD 77 F5      [19]  640 	ld	-11 (ix), a
   62EC DD 6E F4      [19]  641 	ld	l,-12 (ix)
   62EF DD 66 F5      [19]  642 	ld	h,-11 (ix)
   62F2 11 0A 00      [10]  643 	ld	de, #0x000a
   62F5 19            [11]  644 	add	hl, de
   62F6 7E            [ 7]  645 	ld	a, (hl)
   62F7 B7            [ 4]  646 	or	a, a
   62F8 CA 17 64      [10]  647 	jp	Z, 00199$
                            648 ;src/juego.c:100: if (abs(entidad[i].pos_x - entidad[0].pos_x) == 4) //Si está en casilla contigua, atacar
   62FB DD 7E F4      [19]  649 	ld	a, -12 (ix)
   62FE C6 0F         [ 7]  650 	add	a, #0x0f
   6300 4F            [ 4]  651 	ld	c, a
   6301 DD 7E F5      [19]  652 	ld	a, -11 (ix)
   6304 CE 00         [ 7]  653 	adc	a, #0x00
   6306 47            [ 4]  654 	ld	b, a
   6307 0A            [ 7]  655 	ld	a, (bc)
   6308 5F            [ 4]  656 	ld	e, a
   6309 21 7F 87      [10]  657 	ld	hl, #(_entidad + 0x000f) + 0
   630C 56            [ 7]  658 	ld	d, (hl)
   630D 7B            [ 4]  659 	ld	a, e
   630E 92            [ 4]  660 	sub	a, d
   630F 57            [ 4]  661 	ld	d, a
   6310 C5            [11]  662 	push	bc
   6311 D5            [11]  663 	push	de
   6312 33            [ 6]  664 	inc	sp
   6313 CD C2 6D      [17]  665 	call	_abs
   6316 33            [ 6]  666 	inc	sp
   6317 C1            [10]  667 	pop	bc
   6318 7D            [ 4]  668 	ld	a, l
   6319 D6 04         [ 7]  669 	sub	a, #0x04
   631B 20 15         [12]  670 	jr	NZ,00155$
                            671 ;src/juego.c:101: atacar(&entidad[i], &entidad[0]);
   631D 11 70 87      [10]  672 	ld	de, #_entidad
   6320 DD 6E F4      [19]  673 	ld	l,-12 (ix)
   6323 DD 66 F5      [19]  674 	ld	h,-11 (ix)
   6326 C5            [11]  675 	push	bc
   6327 D5            [11]  676 	push	de
   6328 E5            [11]  677 	push	hl
   6329 CD 90 71      [17]  678 	call	_atacar
   632C F1            [10]  679 	pop	af
   632D F1            [10]  680 	pop	af
   632E C1            [10]  681 	pop	bc
   632F C3 D5 63      [10]  682 	jp	00240$
   6332                     683 00155$:
                            684 ;src/juego.c:103: enemy_mov = cpct_rand()%3; //33% de moverse a izquierda, derecha o curarse
   6332 C5            [11]  685 	push	bc
   6333 CD 2D 79      [17]  686 	call	_cpct_getRandom_mxor_u8
   6336 55            [ 4]  687 	ld	d, l
   6337 3E 03         [ 7]  688 	ld	a, #0x03
   6339 F5            [11]  689 	push	af
   633A 33            [ 6]  690 	inc	sp
   633B D5            [11]  691 	push	de
   633C 33            [ 6]  692 	inc	sp
   633D CD BD 78      [17]  693 	call	__moduchar
   6340 F1            [10]  694 	pop	af
   6341 5D            [ 4]  695 	ld	e, l
   6342 C1            [10]  696 	pop	bc
                            697 ;src/juego.c:104: if (enemy_mov == 1) {
   6343 7B            [ 4]  698 	ld	a, e
   6344 3D            [ 4]  699 	dec	a
   6345 20 3E         [12]  700 	jr	NZ,00152$
                            701 ;src/juego.c:105: sprintf(temp, "%-9s GOES %c",entidad[i].name,242);
   6347 DD 5E F4      [19]  702 	ld	e,-12 (ix)
   634A DD 56 F5      [19]  703 	ld	d,-11 (ix)
   634D D5            [11]  704 	push	de
   634E FD E1         [14]  705 	pop	iy
   6350 DD 5E FE      [19]  706 	ld	e,-2 (ix)
   6353 DD 56 FF      [19]  707 	ld	d,-1 (ix)
   6356 C5            [11]  708 	push	bc
   6357 21 F2 00      [10]  709 	ld	hl, #0x00f2
   635A E5            [11]  710 	push	hl
   635B FD E5         [15]  711 	push	iy
   635D 21 00 66      [10]  712 	ld	hl, #___str_1
   6360 E5            [11]  713 	push	hl
   6361 D5            [11]  714 	push	de
   6362 CD F7 79      [17]  715 	call	_sprintf
   6365 21 08 00      [10]  716 	ld	hl, #8
   6368 39            [11]  717 	add	hl, sp
   6369 F9            [ 6]  718 	ld	sp, hl
   636A C1            [10]  719 	pop	bc
                            720 ;src/juego.c:106: printConsole(temp, 0, 2);
   636B DD 5E F6      [19]  721 	ld	e,-10 (ix)
   636E DD 56 F7      [19]  722 	ld	d,-9 (ix)
   6371 C5            [11]  723 	push	bc
   6372 21 00 02      [10]  724 	ld	hl, #0x0200
   6375 E5            [11]  725 	push	hl
   6376 D5            [11]  726 	push	de
   6377 CD 2B 71      [17]  727 	call	_printConsole
   637A F1            [10]  728 	pop	af
   637B F1            [10]  729 	pop	af
   637C C1            [10]  730 	pop	bc
                            731 ;src/juego.c:108: nueva_pos = entidad[i].pos_x - 4;
   637D 0A            [ 7]  732 	ld	a, (bc)
   637E C6 FC         [ 7]  733 	add	a, #0xfc
   6380 DD 77 CE      [19]  734 	ld	-50 (ix), a
   6383 18 50         [12]  735 	jr	00240$
   6385                     736 00152$:
                            737 ;src/juego.c:109: } else if (enemy_mov == 2) {
   6385 7B            [ 4]  738 	ld	a, e
   6386 D6 02         [ 7]  739 	sub	a, #0x02
   6388 20 3E         [12]  740 	jr	NZ,00149$
                            741 ;src/juego.c:110: sprintf(temp, "%-9s GOES %c",entidad[i].name,243);
   638A DD 5E F4      [19]  742 	ld	e,-12 (ix)
   638D DD 56 F5      [19]  743 	ld	d,-11 (ix)
   6390 D5            [11]  744 	push	de
   6391 FD E1         [14]  745 	pop	iy
   6393 DD 5E FA      [19]  746 	ld	e,-6 (ix)
   6396 DD 56 FB      [19]  747 	ld	d,-5 (ix)
   6399 C5            [11]  748 	push	bc
   639A 21 F3 00      [10]  749 	ld	hl, #0x00f3
   639D E5            [11]  750 	push	hl
   639E FD E5         [15]  751 	push	iy
   63A0 21 00 66      [10]  752 	ld	hl, #___str_1
   63A3 E5            [11]  753 	push	hl
   63A4 D5            [11]  754 	push	de
   63A5 CD F7 79      [17]  755 	call	_sprintf
   63A8 21 08 00      [10]  756 	ld	hl, #8
   63AB 39            [11]  757 	add	hl, sp
   63AC F9            [ 6]  758 	ld	sp, hl
   63AD C1            [10]  759 	pop	bc
                            760 ;src/juego.c:111: printConsole(temp, 0, 2);
   63AE DD 5E FC      [19]  761 	ld	e,-4 (ix)
   63B1 DD 56 FD      [19]  762 	ld	d,-3 (ix)
   63B4 C5            [11]  763 	push	bc
   63B5 21 00 02      [10]  764 	ld	hl, #0x0200
   63B8 E5            [11]  765 	push	hl
   63B9 D5            [11]  766 	push	de
   63BA CD 2B 71      [17]  767 	call	_printConsole
   63BD F1            [10]  768 	pop	af
   63BE F1            [10]  769 	pop	af
   63BF C1            [10]  770 	pop	bc
                            771 ;src/juego.c:113: nueva_pos = entidad[i].pos_x + 4;
   63C0 0A            [ 7]  772 	ld	a, (bc)
   63C1 C6 04         [ 7]  773 	add	a, #0x04
   63C3 DD 77 CE      [19]  774 	ld	-50 (ix), a
   63C6 18 0D         [12]  775 	jr	00240$
   63C8                     776 00149$:
                            777 ;src/juego.c:115: defender(&entidad[i]);
   63C8 DD 5E F4      [19]  778 	ld	e,-12 (ix)
   63CB DD 56 F5      [19]  779 	ld	d,-11 (ix)
   63CE C5            [11]  780 	push	bc
   63CF D5            [11]  781 	push	de
   63D0 CD C6 72      [17]  782 	call	_defender
   63D3 F1            [10]  783 	pop	af
   63D4 C1            [10]  784 	pop	bc
                            785 ;src/juego.c:119: for (j = 0; j < 3; j++) {
   63D5                     786 00240$:
   63D5 1E 00         [ 7]  787 	ld	e, #0x00
   63D7                     788 00196$:
                            789 ;src/juego.c:120: if (i!=j) {
   63D7 DD 7E F3      [19]  790 	ld	a, -13 (ix)
   63DA 93            [ 4]  791 	sub	a, e
   63DB 28 22         [12]  792 	jr	Z,00197$
                            793 ;src/juego.c:121: if (entidad[j].pos_x == nueva_pos) {
   63DD D5            [11]  794 	push	de
   63DE 16 00         [ 7]  795 	ld	d,#0x00
   63E0 6B            [ 4]  796 	ld	l, e
   63E1 62            [ 4]  797 	ld	h, d
   63E2 29            [11]  798 	add	hl, hl
   63E3 29            [11]  799 	add	hl, hl
   63E4 19            [11]  800 	add	hl, de
   63E5 29            [11]  801 	add	hl, hl
   63E6 29            [11]  802 	add	hl, hl
   63E7 D1            [10]  803 	pop	de
   63E8 C5            [11]  804 	push	bc
   63E9 01 70 87      [10]  805 	ld	bc, #_entidad
   63EC 09            [11]  806 	add	hl, bc
   63ED 01 0F 00      [10]  807 	ld	bc, #0x000f
   63F0 09            [11]  808 	add	hl, bc
   63F1 C1            [10]  809 	pop	bc
   63F2 56            [ 7]  810 	ld	d, (hl)
   63F3 DD 7E CE      [19]  811 	ld	a, -50 (ix)
   63F6 92            [ 4]  812 	sub	a, d
   63F7 20 06         [12]  813 	jr	NZ,00197$
                            814 ;src/juego.c:122: nueva_pos = 0;
   63F9 DD 36 CE 00   [19]  815 	ld	-50 (ix), #0x00
                            816 ;src/juego.c:123: break;
   63FD 18 06         [12]  817 	jr	00161$
   63FF                     818 00197$:
                            819 ;src/juego.c:119: for (j = 0; j < 3; j++) {
   63FF 1C            [ 4]  820 	inc	e
   6400 7B            [ 4]  821 	ld	a, e
   6401 D6 03         [ 7]  822 	sub	a, #0x03
   6403 38 D2         [12]  823 	jr	C,00196$
   6405                     824 00161$:
                            825 ;src/juego.c:129: if (nueva_pos > 3 && nueva_pos < 37)
   6405 3E 03         [ 7]  826 	ld	a, #0x03
   6407 DD 96 CE      [19]  827 	sub	a, -50 (ix)
   640A 30 0B         [12]  828 	jr	NC,00199$
   640C DD 7E CE      [19]  829 	ld	a, -50 (ix)
   640F D6 25         [ 7]  830 	sub	a, #0x25
   6411 30 04         [12]  831 	jr	NC,00199$
                            832 ;src/juego.c:130: entidad[i].pos_x = nueva_pos; 
   6413 DD 7E CE      [19]  833 	ld	a, -50 (ix)
   6416 02            [ 7]  834 	ld	(bc), a
   6417                     835 00199$:
                            836 ;src/juego.c:98: for (i = 1; i < 3; i++) {
   6417 DD 34 F3      [23]  837 	inc	-13 (ix)
   641A DD 7E F3      [19]  838 	ld	a, -13 (ix)
   641D D6 03         [ 7]  839 	sub	a, #0x03
   641F DA CA 62      [10]  840 	jp	C, 00198$
                            841 ;src/juego.c:134: pausa(SEGUNDO);
   6422 21 00 80      [10]  842 	ld	hl, #0x8000
   6425 E5            [11]  843 	push	hl
   6426 CD EA 6D      [17]  844 	call	_pausa
   6429 F1            [10]  845 	pop	af
                            846 ;src/juego.c:135: pausaTecladoLibre();
   642A CD 46 6E      [17]  847 	call	_pausaTecladoLibre
                            848 ;src/juego.c:144: entidad[0].energy = entidad[0].max_energy;
                            849 ;src/juego.c:139: if (nivel == 5 || nivel == 15 || nivel == 25) {
   642D FD 21 AC 87   [14]  850 	ld	iy, #_nivel
   6431 FD 7E 00      [19]  851 	ld	a, 0 (iy)
   6434 D6 05         [ 7]  852 	sub	a, #0x05
   6436 28 0F         [12]  853 	jr	Z,00179$
   6438 FD 7E 00      [19]  854 	ld	a, 0 (iy)
   643B D6 0F         [ 7]  855 	sub	a, #0x0f
   643D 28 08         [12]  856 	jr	Z,00179$
   643F FD 7E 00      [19]  857 	ld	a, 0 (iy)
   6442 D6 19         [ 7]  858 	sub	a, #0x19
   6444 C2 2E 65      [10]  859 	jp	NZ,00180$
   6447                     860 00179$:
                            861 ;src/juego.c:140: if (entidad[0].pos_x == 28) {
   6447 3A 7F 87      [13]  862 	ld	a, (#(_entidad + 0x000f) + 0)
   644A D6 1C         [ 7]  863 	sub	a, #0x1c
   644C C2 42 65      [10]  864 	jp	NZ,00181$
                            865 ;src/juego.c:142: if (cpct_rand() % 2){
   644F CD 2D 79      [17]  866 	call	_cpct_getRandom_mxor_u8
   6452 CB 45         [ 8]  867 	bit	0, l
   6454 28 3C         [12]  868 	jr	Z,00172$
                            869 ;src/juego.c:144: entidad[0].energy = entidad[0].max_energy;
   6456 3A 7B 87      [13]  870 	ld	a, (#_entidad + 11)
   6459 32 7A 87      [13]  871 	ld	(#(_entidad + 0x000a)),a
                            872 ;src/juego.c:145: sprintf(temp, "%-9s MAX HP",entidad[0].name);
   645C DD 7E F8      [19]  873 	ld	a, -8 (ix)
   645F DD 77 F4      [19]  874 	ld	-12 (ix), a
   6462 DD 7E F9      [19]  875 	ld	a, -7 (ix)
   6465 DD 77 F5      [19]  876 	ld	-11 (ix), a
   6468 21 70 87      [10]  877 	ld	hl, #_entidad
   646B E5            [11]  878 	push	hl
   646C 21 0D 66      [10]  879 	ld	hl, #___str_2
   646F E5            [11]  880 	push	hl
   6470 DD 6E F4      [19]  881 	ld	l,-12 (ix)
   6473 DD 66 F5      [19]  882 	ld	h,-11 (ix)
   6476 E5            [11]  883 	push	hl
   6477 CD F7 79      [17]  884 	call	_sprintf
   647A 21 06 00      [10]  885 	ld	hl, #6
   647D 39            [11]  886 	add	hl, sp
   647E F9            [ 6]  887 	ld	sp, hl
                            888 ;src/juego.c:146: printConsole(temp, 2, 0);
   647F DD 4E F8      [19]  889 	ld	c,-8 (ix)
   6482 DD 46 F9      [19]  890 	ld	b,-7 (ix)
   6485 21 02 00      [10]  891 	ld	hl, #0x0002
   6488 E5            [11]  892 	push	hl
   6489 C5            [11]  893 	push	bc
   648A CD 2B 71      [17]  894 	call	_printConsole
   648D F1            [10]  895 	pop	af
   648E F1            [10]  896 	pop	af
   648F C3 1F 65      [10]  897 	jp	00173$
   6492                     898 00172$:
                            899 ;src/juego.c:147: } else if (cpct_rand() % 2){
   6492 CD 2D 79      [17]  900 	call	_cpct_getRandom_mxor_u8
   6495 CB 45         [ 8]  901 	bit	0, l
   6497 28 48         [12]  902 	jr	Z,00169$
                            903 ;src/juego.c:149: entidad[0].attack += 5;
   6499 3A 7C 87      [13]  904 	ld	a, (#(_entidad + 0x000c) + 0)
   649C C6 05         [ 7]  905 	add	a, #0x05
   649E DD 77 F4      [19]  906 	ld	-12 (ix), a
   64A1 21 7C 87      [10]  907 	ld	hl, #(_entidad + 0x000c)
   64A4 DD 7E F4      [19]  908 	ld	a, -12 (ix)
   64A7 77            [ 7]  909 	ld	(hl), a
                            910 ;src/juego.c:150: sprintf(temp, "%-9s %c ATT",entidad[0].name,240);
   64A8 DD 7E F8      [19]  911 	ld	a, -8 (ix)
   64AB DD 77 F4      [19]  912 	ld	-12 (ix), a
   64AE DD 7E F9      [19]  913 	ld	a, -7 (ix)
   64B1 DD 77 F5      [19]  914 	ld	-11 (ix), a
   64B4 21 F0 00      [10]  915 	ld	hl, #0x00f0
   64B7 E5            [11]  916 	push	hl
   64B8 21 70 87      [10]  917 	ld	hl, #_entidad
   64BB E5            [11]  918 	push	hl
   64BC 21 19 66      [10]  919 	ld	hl, #___str_3
   64BF E5            [11]  920 	push	hl
   64C0 DD 6E F4      [19]  921 	ld	l,-12 (ix)
   64C3 DD 66 F5      [19]  922 	ld	h,-11 (ix)
   64C6 E5            [11]  923 	push	hl
   64C7 CD F7 79      [17]  924 	call	_sprintf
   64CA 21 08 00      [10]  925 	ld	hl, #8
   64CD 39            [11]  926 	add	hl, sp
   64CE F9            [ 6]  927 	ld	sp, hl
                            928 ;src/juego.c:151: printConsole(temp, 2, 0);
   64CF DD 4E F8      [19]  929 	ld	c,-8 (ix)
   64D2 DD 46 F9      [19]  930 	ld	b,-7 (ix)
   64D5 21 02 00      [10]  931 	ld	hl, #0x0002
   64D8 E5            [11]  932 	push	hl
   64D9 C5            [11]  933 	push	bc
   64DA CD 2B 71      [17]  934 	call	_printConsole
   64DD F1            [10]  935 	pop	af
   64DE F1            [10]  936 	pop	af
   64DF 18 3E         [12]  937 	jr	00173$
   64E1                     938 00169$:
                            939 ;src/juego.c:154: entidad[0].defense += 5;
   64E1 01 7E 87      [10]  940 	ld	bc, #_entidad + 14
   64E4 0A            [ 7]  941 	ld	a, (bc)
   64E5 C6 05         [ 7]  942 	add	a, #0x05
   64E7 02            [ 7]  943 	ld	(bc), a
                            944 ;src/juego.c:155: sprintf(temp, "%-9s %c DEF",entidad[0].name,240);
   64E8 DD 7E F8      [19]  945 	ld	a, -8 (ix)
   64EB DD 77 F4      [19]  946 	ld	-12 (ix), a
   64EE DD 7E F9      [19]  947 	ld	a, -7 (ix)
   64F1 DD 77 F5      [19]  948 	ld	-11 (ix), a
   64F4 21 F0 00      [10]  949 	ld	hl, #0x00f0
   64F7 E5            [11]  950 	push	hl
   64F8 21 70 87      [10]  951 	ld	hl, #_entidad
   64FB E5            [11]  952 	push	hl
   64FC 21 25 66      [10]  953 	ld	hl, #___str_4
   64FF E5            [11]  954 	push	hl
   6500 DD 6E F4      [19]  955 	ld	l,-12 (ix)
   6503 DD 66 F5      [19]  956 	ld	h,-11 (ix)
   6506 E5            [11]  957 	push	hl
   6507 CD F7 79      [17]  958 	call	_sprintf
   650A 21 08 00      [10]  959 	ld	hl, #8
   650D 39            [11]  960 	add	hl, sp
   650E F9            [ 6]  961 	ld	sp, hl
                            962 ;src/juego.c:156: printConsole(temp, 2, 0);
   650F DD 4E F8      [19]  963 	ld	c,-8 (ix)
   6512 DD 46 F9      [19]  964 	ld	b,-7 (ix)
   6515 21 02 00      [10]  965 	ld	hl, #0x0002
   6518 E5            [11]  966 	push	hl
   6519 C5            [11]  967 	push	bc
   651A CD 2B 71      [17]  968 	call	_printConsole
   651D F1            [10]  969 	pop	af
   651E F1            [10]  970 	pop	af
   651F                     971 00173$:
                            972 ;src/juego.c:159: printStats(&entidad[0]);
   651F 21 70 87      [10]  973 	ld	hl, #_entidad
   6522 E5            [11]  974 	push	hl
   6523 CD F8 6F      [17]  975 	call	_printStats
   6526 F1            [10]  976 	pop	af
                            977 ;src/juego.c:160: sig_nivel = 1;
   6527 21 AE 87      [10]  978 	ld	hl,#_sig_nivel + 0
   652A 36 01         [10]  979 	ld	(hl), #0x01
   652C 18 14         [12]  980 	jr	00181$
   652E                     981 00180$:
                            982 ;src/juego.c:163: } else if (!(entidad[1].energy || entidad[2].energy)) {
   652E 3A 8E 87      [13]  983 	ld	a, (#(_entidad + 0x001e) + 0)
   6531 B7            [ 4]  984 	or	a, a
   6532 20 0E         [12]  985 	jr	NZ,00181$
   6534 3A A2 87      [13]  986 	ld	a,(#(_entidad + 0x0032) + 0)
   6537 DD 77 F4      [19]  987 	ld	-12 (ix), a
   653A B7            [ 4]  988 	or	a, a
   653B 20 05         [12]  989 	jr	NZ,00181$
                            990 ;src/juego.c:164: sig_nivel = 1;
   653D 21 AE 87      [10]  991 	ld	hl,#_sig_nivel + 0
   6540 36 01         [10]  992 	ld	(hl), #0x01
   6542                     993 00181$:
                            994 ;src/juego.c:168: if (sig_nivel) {
   6542 3A AE 87      [13]  995 	ld	a,(#_sig_nivel + 0)
   6545 B7            [ 4]  996 	or	a, a
   6546 28 68         [12]  997 	jr	Z,00188$
                            998 ;src/juego.c:169: if (nivel == 10) {// Fin del Juego
   6548 3A AC 87      [13]  999 	ld	a,(#_nivel + 0)
   654B D6 0A         [ 7] 1000 	sub	a, #0x0a
   654D 20 23         [12] 1001 	jr	NZ,00185$
                           1002 ;src/juego.c:170: sprintf(temp, "CONGRATULATIONS!");
   654F DD 7E F8      [19] 1003 	ld	a, -8 (ix)
   6552 DD 77 F4      [19] 1004 	ld	-12 (ix), a
   6555 DD 7E F9      [19] 1005 	ld	a, -7 (ix)
   6558 DD 77 F5      [19] 1006 	ld	-11 (ix), a
   655B 21 31 66      [10] 1007 	ld	hl, #___str_5
   655E E5            [11] 1008 	push	hl
   655F DD 6E F4      [19] 1009 	ld	l,-12 (ix)
   6562 DD 66 F5      [19] 1010 	ld	h,-11 (ix)
   6565 E5            [11] 1011 	push	hl
   6566 CD F7 79      [17] 1012 	call	_sprintf
   6569 F1            [10] 1013 	pop	af
   656A F1            [10] 1014 	pop	af
                           1015 ;src/juego.c:171: entidad[0].energy = 0;
   656B 21 7A 87      [10] 1016 	ld	hl, #(_entidad + 0x000a)
   656E 36 00         [10] 1017 	ld	(hl), #0x00
   6570 18 25         [12] 1018 	jr	00186$
   6572                    1019 00185$:
                           1020 ;src/juego.c:173: nivel++;
   6572 21 AC 87      [10] 1021 	ld	hl, #_nivel+0
   6575 34            [11] 1022 	inc	(hl)
                           1023 ;src/juego.c:174: entidad[0].pos_x = 8;
   6576 21 7F 87      [10] 1024 	ld	hl, #(_entidad + 0x000f)
   6579 36 08         [10] 1025 	ld	(hl), #0x08
                           1026 ;src/juego.c:175: sprintf(temp, "   NEXT LEVEL   ");
   657B DD 7E F8      [19] 1027 	ld	a, -8 (ix)
   657E DD 77 F4      [19] 1028 	ld	-12 (ix), a
   6581 DD 7E F9      [19] 1029 	ld	a, -7 (ix)
   6584 DD 77 F5      [19] 1030 	ld	-11 (ix), a
   6587 21 42 66      [10] 1031 	ld	hl, #___str_6
   658A E5            [11] 1032 	push	hl
   658B DD 6E F4      [19] 1033 	ld	l,-12 (ix)
   658E DD 66 F5      [19] 1034 	ld	h,-11 (ix)
   6591 E5            [11] 1035 	push	hl
   6592 CD F7 79      [17] 1036 	call	_sprintf
   6595 F1            [10] 1037 	pop	af
   6596 F1            [10] 1038 	pop	af
   6597                    1039 00186$:
                           1040 ;src/juego.c:177: printConsole(temp, 0, 2);
   6597 DD 4E F8      [19] 1041 	ld	c,-8 (ix)
   659A DD 46 F9      [19] 1042 	ld	b,-7 (ix)
   659D 21 00 02      [10] 1043 	ld	hl, #0x0200
   65A0 E5            [11] 1044 	push	hl
   65A1 C5            [11] 1045 	push	bc
   65A2 CD 2B 71      [17] 1046 	call	_printConsole
   65A5 F1            [10] 1047 	pop	af
   65A6 F1            [10] 1048 	pop	af
                           1049 ;src/juego.c:178: sig_nivel = 0;
   65A7 21 AE 87      [10] 1050 	ld	hl,#_sig_nivel + 0
   65AA 36 00         [10] 1051 	ld	(hl), #0x00
                           1052 ;src/juego.c:179: return 0;
   65AC 2E 00         [ 7] 1053 	ld	l, #0x00
   65AE 18 38         [12] 1054 	jr	00200$
   65B0                    1055 00188$:
                           1056 ;src/juego.c:183: if (!entidad[0].energy) {
   65B0 3A 7A 87      [13] 1057 	ld	a, (#(_entidad + 0x000a) + 0)
   65B3 B7            [ 4] 1058 	or	a, a
   65B4 20 30         [12] 1059 	jr	NZ,00190$
                           1060 ;src/juego.c:184: sprintf(temp, "    GAME OVER   ");
   65B6 DD 7E F8      [19] 1061 	ld	a, -8 (ix)
   65B9 DD 77 F4      [19] 1062 	ld	-12 (ix), a
   65BC DD 7E F9      [19] 1063 	ld	a, -7 (ix)
   65BF DD 77 F5      [19] 1064 	ld	-11 (ix), a
   65C2 21 53 66      [10] 1065 	ld	hl, #___str_7
   65C5 E5            [11] 1066 	push	hl
   65C6 DD 6E F4      [19] 1067 	ld	l,-12 (ix)
   65C9 DD 66 F5      [19] 1068 	ld	h,-11 (ix)
   65CC E5            [11] 1069 	push	hl
   65CD CD F7 79      [17] 1070 	call	_sprintf
   65D0 F1            [10] 1071 	pop	af
   65D1 F1            [10] 1072 	pop	af
                           1073 ;src/juego.c:185: printConsole(temp, 0, 2);
   65D2 DD 4E F8      [19] 1074 	ld	c,-8 (ix)
   65D5 DD 46 F9      [19] 1075 	ld	b,-7 (ix)
   65D8 21 00 02      [10] 1076 	ld	hl, #0x0200
   65DB E5            [11] 1077 	push	hl
   65DC C5            [11] 1078 	push	bc
   65DD CD 2B 71      [17] 1079 	call	_printConsole
   65E0 F1            [10] 1080 	pop	af
   65E1 F1            [10] 1081 	pop	af
                           1082 ;src/juego.c:186: return 0;
   65E2 2E 00         [ 7] 1083 	ld	l, #0x00
   65E4 18 02         [12] 1084 	jr	00200$
   65E6                    1085 00190$:
                           1086 ;src/juego.c:189: return 1;
   65E6 2E 01         [ 7] 1087 	ld	l, #0x01
   65E8                    1088 00200$:
   65E8 DD F9         [10] 1089 	ld	sp, ix
   65EA DD E1         [14] 1090 	pop	ix
   65EC C9            [10] 1091 	ret
   65ED                    1092 ___str_0:
   65ED 41 43 54 49 4F 4E  1093 	.ascii "ACTION (%c/%c/D) ?"
        20 28 25 63 2F 25
        63 2F 44 29 20 3F
   65FF 00                 1094 	.db 0x00
   6600                    1095 ___str_1:
   6600 25 2D 39 73 20 47  1096 	.ascii "%-9s GOES %c"
        4F 45 53 20 25 63
   660C 00                 1097 	.db 0x00
   660D                    1098 ___str_2:
   660D 25 2D 39 73 20 4D  1099 	.ascii "%-9s MAX HP"
        41 58 20 48 50
   6618 00                 1100 	.db 0x00
   6619                    1101 ___str_3:
   6619 25 2D 39 73 20 25  1102 	.ascii "%-9s %c ATT"
        63 20 41 54 54
   6624 00                 1103 	.db 0x00
   6625                    1104 ___str_4:
   6625 25 2D 39 73 20 25  1105 	.ascii "%-9s %c DEF"
        63 20 44 45 46
   6630 00                 1106 	.db 0x00
   6631                    1107 ___str_5:
   6631 43 4F 4E 47 52 41  1108 	.ascii "CONGRATULATIONS!"
        54 55 4C 41 54 49
        4F 4E 53 21
   6641 00                 1109 	.db 0x00
   6642                    1110 ___str_6:
   6642 20 20 20 4E 45 58  1111 	.ascii "   NEXT LEVEL   "
        54 20 4C 45 56 45
        4C 20 20 20
   6652 00                 1112 	.db 0x00
   6653                    1113 ___str_7:
   6653 20 20 20 20 47 41  1114 	.ascii "    GAME OVER   "
        4D 45 20 4F 56 45
        52 20 20 20
   6663 00                 1115 	.db 0x00
                           1116 ;src/juego.c:192: void juego() {
                           1117 ;	---------------------------------
                           1118 ; Function juego
                           1119 ; ---------------------------------
   6664                    1120 _juego::
                           1121 ;src/juego.c:195: nivel = 1;
   6664 21 AC 87      [10] 1122 	ld	hl,#_nivel + 0
   6667 36 01         [10] 1123 	ld	(hl), #0x01
                           1124 ;src/juego.c:196: sig_nivel = 0;
   6669 21 AE 87      [10] 1125 	ld	hl,#_sig_nivel + 0
   666C 36 00         [10] 1126 	ld	(hl), #0x00
                           1127 ;src/juego.c:198: initPlayer();
   666E CD 14 75      [17] 1128 	call	_initPlayer
                           1129 ;src/juego.c:200: while(entidad[0].energy) {
   6671                    1130 00112$:
   6671 3A 7A 87      [13] 1131 	ld	a, (#(_entidad + 0x000a) + 0)
   6674 B7            [ 4] 1132 	or	a, a
   6675 C8            [11] 1133 	ret	Z
                           1134 ;src/juego.c:201: i = 0;
   6676 0E 00         [ 7] 1135 	ld	c, #0x00
                           1136 ;src/juego.c:202: cpct_clearScreen(0x00);
   6678 C5            [11] 1137 	push	bc
   6679 21 00 40      [10] 1138 	ld	hl, #0x4000
   667C E5            [11] 1139 	push	hl
   667D AF            [ 4] 1140 	xor	a, a
   667E F5            [11] 1141 	push	af
   667F 33            [ 6] 1142 	inc	sp
   6680 26 C0         [ 7] 1143 	ld	h, #0xc0
   6682 E5            [11] 1144 	push	hl
   6683 CD 80 7A      [17] 1145 	call	_cpct_memset
   6686 CD 51 6E      [17] 1146 	call	_dibujarMarcoExterior
   6689 C1            [10] 1147 	pop	bc
                           1148 ;src/juego.c:205: if (nivel == 1) {
   668A 3A AC 87      [13] 1149 	ld	a,(#_nivel + 0)
   668D 3D            [ 4] 1150 	dec	a
   668E 20 18         [12] 1151 	jr	NZ,00102$
                           1152 ;src/juego.c:206: cpct_drawStringM1("Chapter 1", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
   6690 21 3E C3      [10] 1153 	ld	hl, #0xc33e
   6693 E5            [11] 1154 	push	hl
   6694 21 F9 66      [10] 1155 	ld	hl, #___str_8
   6697 E5            [11] 1156 	push	hl
   6698 CD 05 77      [17] 1157 	call	_cpct_drawStringM1
                           1158 ;src/juego.c:207: cpct_drawStringM1("A faraway and foreign land ...", cpctm_screenPtr(CPCT_VMEM_START, 12, 96));
   669B 21 CC C3      [10] 1159 	ld	hl, #0xc3cc
   669E E5            [11] 1160 	push	hl
   669F 21 03 67      [10] 1161 	ld	hl, #___str_9
   66A2 E5            [11] 1162 	push	hl
   66A3 CD 05 77      [17] 1163 	call	_cpct_drawStringM1
                           1164 ;src/juego.c:208: i = 1;
   66A6 0E 01         [ 7] 1165 	ld	c, #0x01
   66A8                    1166 00102$:
                           1167 ;src/juego.c:211: if (i) {
   66A8 79            [ 4] 1168 	ld	a, c
   66A9 B7            [ 4] 1169 	or	a, a
   66AA 28 19         [12] 1170 	jr	Z,00105$
                           1171 ;src/juego.c:212: for (i=0; i< 5; i++)
   66AC 0E 00         [ 7] 1172 	ld	c, #0x00
   66AE                    1173 00115$:
                           1174 ;src/juego.c:213: pausa(SEGUNDO);
   66AE C5            [11] 1175 	push	bc
   66AF 21 00 80      [10] 1176 	ld	hl, #0x8000
   66B2 E5            [11] 1177 	push	hl
   66B3 CD EA 6D      [17] 1178 	call	_pausa
   66B6 F1            [10] 1179 	pop	af
   66B7 C1            [10] 1180 	pop	bc
                           1181 ;src/juego.c:212: for (i=0; i< 5; i++)
   66B8 0C            [ 4] 1182 	inc	c
   66B9 79            [ 4] 1183 	ld	a, c
   66BA D6 05         [ 7] 1184 	sub	a, #0x05
   66BC 38 F0         [12] 1185 	jr	C,00115$
                           1186 ;src/juego.c:215: efecto_pliegue(PLIEGUE);
   66BE AF            [ 4] 1187 	xor	a, a
   66BF F5            [11] 1188 	push	af
   66C0 33            [ 6] 1189 	inc	sp
   66C1 CD FA 6D      [17] 1190 	call	_efecto_pliegue
   66C4 33            [ 6] 1191 	inc	sp
   66C5                    1192 00105$:
                           1193 ;src/juego.c:218: cursorConsola = 64;
   66C5 21 AD 87      [10] 1194 	ld	hl,#_cursorConsola + 0
   66C8 36 40         [10] 1195 	ld	(hl), #0x40
                           1196 ;src/juego.c:220: initNivel();
   66CA CD 59 75      [17] 1197 	call	_initNivel
                           1198 ;src/juego.c:221: dibujarMarcoInterior();
   66CD CD 19 6F      [17] 1199 	call	_dibujarMarcoInterior
                           1200 ;src/juego.c:222: dibujarEscenario();
   66D0 CD B4 6F      [17] 1201 	call	_dibujarEscenario
                           1202 ;src/juego.c:223: printLevel();
   66D3 CD E2 70      [17] 1203 	call	_printLevel
                           1204 ;src/juego.c:225: efecto_pliegue(DESPLIEGUE);
   66D6 3E 01         [ 7] 1205 	ld	a, #0x01
   66D8 F5            [11] 1206 	push	af
   66D9 33            [ 6] 1207 	inc	sp
   66DA CD FA 6D      [17] 1208 	call	_efecto_pliegue
   66DD 33            [ 6] 1209 	inc	sp
                           1210 ;src/juego.c:226: while (turno())
   66DE                    1211 00106$:
   66DE CD A6 5E      [17] 1212 	call	_turno
   66E1 7D            [ 4] 1213 	ld	a, l
   66E2 B7            [ 4] 1214 	or	a, a
   66E3 20 F9         [12] 1215 	jr	NZ,00106$
                           1216 ;src/juego.c:229: do {
   66E5                    1217 00109$:
                           1218 ;src/juego.c:230: cpct_scanKeyboard_f();
   66E5 CD 8F 76      [17] 1219 	call	_cpct_scanKeyboard_f
                           1220 ;src/juego.c:231: } while (!cpct_isAnyKeyPressed_f());
   66E8 CD 65 7A      [17] 1221 	call	_cpct_isAnyKeyPressed_f
   66EB 7D            [ 4] 1222 	ld	a, l
   66EC B7            [ 4] 1223 	or	a, a
   66ED 28 F6         [12] 1224 	jr	Z,00109$
                           1225 ;src/juego.c:232: efecto_pliegue(PLIEGUE);
   66EF AF            [ 4] 1226 	xor	a, a
   66F0 F5            [11] 1227 	push	af
   66F1 33            [ 6] 1228 	inc	sp
   66F2 CD FA 6D      [17] 1229 	call	_efecto_pliegue
   66F5 33            [ 6] 1230 	inc	sp
   66F6 C3 71 66      [10] 1231 	jp	00112$
   66F9                    1232 ___str_8:
   66F9 43 68 61 70 74 65  1233 	.ascii "Chapter 1"
        72 20 31
   6702 00                 1234 	.db 0x00
   6703                    1235 ___str_9:
   6703 41 20 66 61 72 61  1236 	.ascii "A faraway and foreign land ..."
        77 61 79 20 61 6E
        64 20 66 6F 72 65
        69 67 6E 20 6C 61
        6E 64 20 2E 2E 2E
   6721 00                 1237 	.db 0x00
                           1238 	.area _CODE
                           1239 	.area _INITIALIZER
                           1240 	.area _CABS (ABS)
