                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (CYGWIN)
                              4 ;--------------------------------------------------------
                              5 	.module niveles
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _initNivel
                             12 	.globl _initPlayer
                             13 	.globl _initAbeja
                             14 	.globl _initFakir
                             15 	.globl _initSoldadoArabe3
                             16 	.globl _initSoldadoArabe2
                             17 	.globl _initSoldadoArabe1
                             18 ;--------------------------------------------------------
                             19 ; special function registers
                             20 ;--------------------------------------------------------
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _DATA
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _INITIALIZED
                             29 ;--------------------------------------------------------
                             30 ; absolute external ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DABS (ABS)
                             33 ;--------------------------------------------------------
                             34 ; global & static initialisations
                             35 ;--------------------------------------------------------
                             36 	.area _HOME
                             37 	.area _GSINIT
                             38 	.area _GSFINAL
                             39 	.area _GSINIT
                             40 ;--------------------------------------------------------
                             41 ; Home
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _HOME
                             45 ;--------------------------------------------------------
                             46 ; code
                             47 ;--------------------------------------------------------
                             48 	.area _CODE
                             49 ;src/niveles.c:7: void initSoldadoArabe1(TStats *entidad) {
                             50 ;	---------------------------------
                             51 ; Function initSoldadoArabe1
                             52 ; ---------------------------------
   73AC                      53 _initSoldadoArabe1::
   73AC DD E5         [15]   54 	push	ix
   73AE DD 21 00 00   [14]   55 	ld	ix,#0
   73B2 DD 39         [15]   56 	add	ix,sp
                             57 ;src/niveles.c:8: strcpy(entidad->name,"Soldier 1");
   73B4 DD 4E 04      [19]   58 	ld	c,4 (ix)
   73B7 DD 46 05      [19]   59 	ld	b,5 (ix)
   73BA 59            [ 4]   60 	ld	e, c
   73BB 50            [ 4]   61 	ld	d, b
   73BC C5            [11]   62 	push	bc
   73BD 21 EC 73      [10]   63 	ld	hl, #___str_0
   73C0 AF            [ 4]   64 	xor	a, a
   73C1                      65 00103$:
   73C1 BE            [ 7]   66 	cp	a, (hl)
   73C2 ED A0         [16]   67 	ldi
   73C4 20 FB         [12]   68 	jr	NZ, 00103$
   73C6 C1            [10]   69 	pop	bc
                             70 ;src/niveles.c:9: entidad->max_energy = 60;
   73C7 21 0B 00      [10]   71 	ld	hl, #0x000b
   73CA 09            [11]   72 	add	hl, bc
   73CB 36 3C         [10]   73 	ld	(hl), #0x3c
                             74 ;src/niveles.c:10: entidad->attack = 20;
   73CD 21 0C 00      [10]   75 	ld	hl, #0x000c
   73D0 09            [11]   76 	add	hl, bc
   73D1 36 14         [10]   77 	ld	(hl), #0x14
                             78 ;src/niveles.c:11: entidad->force = 5;
   73D3 21 0D 00      [10]   79 	ld	hl, #0x000d
   73D6 09            [11]   80 	add	hl, bc
   73D7 36 05         [10]   81 	ld	(hl), #0x05
                             82 ;src/niveles.c:12: entidad->defense = 10;
   73D9 21 0E 00      [10]   83 	ld	hl, #0x000e
   73DC 09            [11]   84 	add	hl, bc
   73DD 36 0A         [10]   85 	ld	(hl), #0x0a
                             86 ;src/niveles.c:13: entidad->sprite = (u8*) &G_arabe_1[0];
   73DF 21 12 00      [10]   87 	ld	hl, #0x0012
   73E2 09            [11]   88 	add	hl, bc
   73E3 01 42 68      [10]   89 	ld	bc, #_G_arabe_1+0
   73E6 71            [ 7]   90 	ld	(hl), c
   73E7 23            [ 6]   91 	inc	hl
   73E8 70            [ 7]   92 	ld	(hl), b
   73E9 DD E1         [14]   93 	pop	ix
   73EB C9            [10]   94 	ret
   73EC                      95 ___str_0:
   73EC 53 6F 6C 64 69 65    96 	.ascii "Soldier 1"
        72 20 31
   73F5 00                   97 	.db 0x00
                             98 ;src/niveles.c:16: void initSoldadoArabe2(TStats *entidad) {
                             99 ;	---------------------------------
                            100 ; Function initSoldadoArabe2
                            101 ; ---------------------------------
   73F6                     102 _initSoldadoArabe2::
   73F6 DD E5         [15]  103 	push	ix
   73F8 DD 21 00 00   [14]  104 	ld	ix,#0
   73FC DD 39         [15]  105 	add	ix,sp
                            106 ;src/niveles.c:17: strcpy(entidad->name,"Soldier 2");
   73FE DD 4E 04      [19]  107 	ld	c,4 (ix)
   7401 DD 46 05      [19]  108 	ld	b,5 (ix)
   7404 59            [ 4]  109 	ld	e, c
   7405 50            [ 4]  110 	ld	d, b
   7406 C5            [11]  111 	push	bc
   7407 21 36 74      [10]  112 	ld	hl, #___str_1
   740A AF            [ 4]  113 	xor	a, a
   740B                     114 00103$:
   740B BE            [ 7]  115 	cp	a, (hl)
   740C ED A0         [16]  116 	ldi
   740E 20 FB         [12]  117 	jr	NZ, 00103$
   7410 C1            [10]  118 	pop	bc
                            119 ;src/niveles.c:18: entidad->max_energy = 75;
   7411 21 0B 00      [10]  120 	ld	hl, #0x000b
   7414 09            [11]  121 	add	hl, bc
   7415 36 4B         [10]  122 	ld	(hl), #0x4b
                            123 ;src/niveles.c:19: entidad->attack = 30;
   7417 21 0C 00      [10]  124 	ld	hl, #0x000c
   741A 09            [11]  125 	add	hl, bc
   741B 36 1E         [10]  126 	ld	(hl), #0x1e
                            127 ;src/niveles.c:20: entidad->force = 10;
   741D 21 0D 00      [10]  128 	ld	hl, #0x000d
   7420 09            [11]  129 	add	hl, bc
   7421 36 0A         [10]  130 	ld	(hl), #0x0a
                            131 ;src/niveles.c:21: entidad->defense = 20;
   7423 21 0E 00      [10]  132 	ld	hl, #0x000e
   7426 09            [11]  133 	add	hl, bc
   7427 36 14         [10]  134 	ld	(hl), #0x14
                            135 ;src/niveles.c:22: entidad->sprite = (u8*) &G_arabe_2[0];
   7429 21 12 00      [10]  136 	ld	hl, #0x0012
   742C 09            [11]  137 	add	hl, bc
   742D 01 22 69      [10]  138 	ld	bc, #_G_arabe_2+0
   7430 71            [ 7]  139 	ld	(hl), c
   7431 23            [ 6]  140 	inc	hl
   7432 70            [ 7]  141 	ld	(hl), b
   7433 DD E1         [14]  142 	pop	ix
   7435 C9            [10]  143 	ret
   7436                     144 ___str_1:
   7436 53 6F 6C 64 69 65   145 	.ascii "Soldier 2"
        72 20 32
   743F 00                  146 	.db 0x00
                            147 ;src/niveles.c:25: void initSoldadoArabe3(TStats *entidad) {
                            148 ;	---------------------------------
                            149 ; Function initSoldadoArabe3
                            150 ; ---------------------------------
   7440                     151 _initSoldadoArabe3::
   7440 DD E5         [15]  152 	push	ix
   7442 DD 21 00 00   [14]  153 	ld	ix,#0
   7446 DD 39         [15]  154 	add	ix,sp
                            155 ;src/niveles.c:26: strcpy(entidad->name,"Soldier 3");
   7448 DD 4E 04      [19]  156 	ld	c,4 (ix)
   744B DD 46 05      [19]  157 	ld	b,5 (ix)
   744E 59            [ 4]  158 	ld	e, c
   744F 50            [ 4]  159 	ld	d, b
   7450 C5            [11]  160 	push	bc
   7451 21 80 74      [10]  161 	ld	hl, #___str_2
   7454 AF            [ 4]  162 	xor	a, a
   7455                     163 00103$:
   7455 BE            [ 7]  164 	cp	a, (hl)
   7456 ED A0         [16]  165 	ldi
   7458 20 FB         [12]  166 	jr	NZ, 00103$
   745A C1            [10]  167 	pop	bc
                            168 ;src/niveles.c:27: entidad->max_energy = 90;
   745B 21 0B 00      [10]  169 	ld	hl, #0x000b
   745E 09            [11]  170 	add	hl, bc
   745F 36 5A         [10]  171 	ld	(hl), #0x5a
                            172 ;src/niveles.c:28: entidad->attack = 30;
   7461 21 0C 00      [10]  173 	ld	hl, #0x000c
   7464 09            [11]  174 	add	hl, bc
   7465 36 1E         [10]  175 	ld	(hl), #0x1e
                            176 ;src/niveles.c:29: entidad->force = 20;
   7467 21 0D 00      [10]  177 	ld	hl, #0x000d
   746A 09            [11]  178 	add	hl, bc
   746B 36 14         [10]  179 	ld	(hl), #0x14
                            180 ;src/niveles.c:30: entidad->defense = 30;
   746D 21 0E 00      [10]  181 	ld	hl, #0x000e
   7470 09            [11]  182 	add	hl, bc
   7471 36 1E         [10]  183 	ld	(hl), #0x1e
                            184 ;src/niveles.c:31: entidad->sprite = (u8*) &G_arabe_3[0];
   7473 21 12 00      [10]  185 	ld	hl, #0x0012
   7476 09            [11]  186 	add	hl, bc
   7477 01 02 6A      [10]  187 	ld	bc, #_G_arabe_3+0
   747A 71            [ 7]  188 	ld	(hl), c
   747B 23            [ 6]  189 	inc	hl
   747C 70            [ 7]  190 	ld	(hl), b
   747D DD E1         [14]  191 	pop	ix
   747F C9            [10]  192 	ret
   7480                     193 ___str_2:
   7480 53 6F 6C 64 69 65   194 	.ascii "Soldier 3"
        72 20 33
   7489 00                  195 	.db 0x00
                            196 ;src/niveles.c:34: void initFakir(TStats *entidad) {
                            197 ;	---------------------------------
                            198 ; Function initFakir
                            199 ; ---------------------------------
   748A                     200 _initFakir::
   748A DD E5         [15]  201 	push	ix
   748C DD 21 00 00   [14]  202 	ld	ix,#0
   7490 DD 39         [15]  203 	add	ix,sp
                            204 ;src/niveles.c:35: strcpy(entidad->name,"Fakir");
   7492 DD 4E 04      [19]  205 	ld	c,4 (ix)
   7495 DD 46 05      [19]  206 	ld	b,5 (ix)
   7498 59            [ 4]  207 	ld	e, c
   7499 50            [ 4]  208 	ld	d, b
   749A C5            [11]  209 	push	bc
   749B 21 CA 74      [10]  210 	ld	hl, #___str_3
   749E AF            [ 4]  211 	xor	a, a
   749F                     212 00103$:
   749F BE            [ 7]  213 	cp	a, (hl)
   74A0 ED A0         [16]  214 	ldi
   74A2 20 FB         [12]  215 	jr	NZ, 00103$
   74A4 C1            [10]  216 	pop	bc
                            217 ;src/niveles.c:36: entidad->max_energy = 60;
   74A5 21 0B 00      [10]  218 	ld	hl, #0x000b
   74A8 09            [11]  219 	add	hl, bc
   74A9 36 3C         [10]  220 	ld	(hl), #0x3c
                            221 ;src/niveles.c:37: entidad->attack = 40;
   74AB 21 0C 00      [10]  222 	ld	hl, #0x000c
   74AE 09            [11]  223 	add	hl, bc
   74AF 36 28         [10]  224 	ld	(hl), #0x28
                            225 ;src/niveles.c:38: entidad->force = 0;
   74B1 21 0D 00      [10]  226 	ld	hl, #0x000d
   74B4 09            [11]  227 	add	hl, bc
   74B5 36 00         [10]  228 	ld	(hl), #0x00
                            229 ;src/niveles.c:39: entidad->defense = 5;
   74B7 21 0E 00      [10]  230 	ld	hl, #0x000e
   74BA 09            [11]  231 	add	hl, bc
   74BB 36 05         [10]  232 	ld	(hl), #0x05
                            233 ;src/niveles.c:40: entidad->sprite = (u8*) &G_fakir[0];
   74BD 21 12 00      [10]  234 	ld	hl, #0x0012
   74C0 09            [11]  235 	add	hl, bc
   74C1 01 E2 6A      [10]  236 	ld	bc, #_G_fakir+0
   74C4 71            [ 7]  237 	ld	(hl), c
   74C5 23            [ 6]  238 	inc	hl
   74C6 70            [ 7]  239 	ld	(hl), b
   74C7 DD E1         [14]  240 	pop	ix
   74C9 C9            [10]  241 	ret
   74CA                     242 ___str_3:
   74CA 46 61 6B 69 72      243 	.ascii "Fakir"
   74CF 00                  244 	.db 0x00
                            245 ;src/niveles.c:43: void initAbeja(TStats *entidad) {
                            246 ;	---------------------------------
                            247 ; Function initAbeja
                            248 ; ---------------------------------
   74D0                     249 _initAbeja::
   74D0 DD E5         [15]  250 	push	ix
   74D2 DD 21 00 00   [14]  251 	ld	ix,#0
   74D6 DD 39         [15]  252 	add	ix,sp
                            253 ;src/niveles.c:44: strcpy(entidad->name,"Bee");
   74D8 DD 4E 04      [19]  254 	ld	c,4 (ix)
   74DB DD 46 05      [19]  255 	ld	b,5 (ix)
   74DE 59            [ 4]  256 	ld	e, c
   74DF 50            [ 4]  257 	ld	d, b
   74E0 C5            [11]  258 	push	bc
   74E1 21 10 75      [10]  259 	ld	hl, #___str_4
   74E4 AF            [ 4]  260 	xor	a, a
   74E5                     261 00103$:
   74E5 BE            [ 7]  262 	cp	a, (hl)
   74E6 ED A0         [16]  263 	ldi
   74E8 20 FB         [12]  264 	jr	NZ, 00103$
   74EA C1            [10]  265 	pop	bc
                            266 ;src/niveles.c:45: entidad->max_energy = 60;
   74EB 21 0B 00      [10]  267 	ld	hl, #0x000b
   74EE 09            [11]  268 	add	hl, bc
   74EF 36 3C         [10]  269 	ld	(hl), #0x3c
                            270 ;src/niveles.c:46: entidad->attack = 30;
   74F1 21 0C 00      [10]  271 	ld	hl, #0x000c
   74F4 09            [11]  272 	add	hl, bc
   74F5 36 1E         [10]  273 	ld	(hl), #0x1e
                            274 ;src/niveles.c:47: entidad->force = 10;
   74F7 21 0D 00      [10]  275 	ld	hl, #0x000d
   74FA 09            [11]  276 	add	hl, bc
   74FB 36 0A         [10]  277 	ld	(hl), #0x0a
                            278 ;src/niveles.c:48: entidad->defense = 5;
   74FD 21 0E 00      [10]  279 	ld	hl, #0x000e
   7500 09            [11]  280 	add	hl, bc
   7501 36 05         [10]  281 	ld	(hl), #0x05
                            282 ;src/niveles.c:49: entidad->sprite = (u8*) &G_abeja[0];
   7503 21 12 00      [10]  283 	ld	hl, #0x0012
   7506 09            [11]  284 	add	hl, bc
   7507 01 A2 6C      [10]  285 	ld	bc, #_G_abeja+0
   750A 71            [ 7]  286 	ld	(hl), c
   750B 23            [ 6]  287 	inc	hl
   750C 70            [ 7]  288 	ld	(hl), b
   750D DD E1         [14]  289 	pop	ix
   750F C9            [10]  290 	ret
   7510                     291 ___str_4:
   7510 42 65 65            292 	.ascii "Bee"
   7513 00                  293 	.db 0x00
                            294 ;src/niveles.c:52: void initPlayer(){
                            295 ;	---------------------------------
                            296 ; Function initPlayer
                            297 ; ---------------------------------
   7514                     298 _initPlayer::
                            299 ;src/niveles.c:53: strcpy(entidad[0].name,"Don Mendo");
   7514 11 70 87      [10]  300 	ld	de, #_entidad
   7517 21 4F 75      [10]  301 	ld	hl, #___str_5
   751A AF            [ 4]  302 	xor	a, a
   751B                     303 00103$:
   751B BE            [ 7]  304 	cp	a, (hl)
   751C ED A0         [16]  305 	ldi
   751E 20 FB         [12]  306 	jr	NZ, 00103$
                            307 ;src/niveles.c:54: entidad[0].max_energy = entidad[0].energy = 99;
   7520 21 7A 87      [10]  308 	ld	hl, #(_entidad + 0x000a)
   7523 36 63         [10]  309 	ld	(hl), #0x63
   7525 21 7B 87      [10]  310 	ld	hl, #(_entidad + 0x000b)
   7528 36 63         [10]  311 	ld	(hl), #0x63
                            312 ;src/niveles.c:55: entidad[0].attack = 30;
   752A 21 7C 87      [10]  313 	ld	hl, #(_entidad + 0x000c)
   752D 36 1E         [10]  314 	ld	(hl), #0x1e
                            315 ;src/niveles.c:56: entidad[0].force = 6;
   752F 21 7D 87      [10]  316 	ld	hl, #(_entidad + 0x000d)
   7532 36 06         [10]  317 	ld	(hl), #0x06
                            318 ;src/niveles.c:57: entidad[0].defense = 15;
   7534 21 7E 87      [10]  319 	ld	hl, #(_entidad + 0x000e)
   7537 36 0F         [10]  320 	ld	(hl), #0x0f
                            321 ;src/niveles.c:58: entidad[0].pos_x = 8;
   7539 21 7F 87      [10]  322 	ld	hl, #(_entidad + 0x000f)
   753C 36 08         [10]  323 	ld	(hl), #0x08
                            324 ;src/niveles.c:59: entidad[0].pos_x_ant = 8;
   753E 21 80 87      [10]  325 	ld	hl, #(_entidad + 0x0010)
   7541 36 08         [10]  326 	ld	(hl), #0x08
                            327 ;src/niveles.c:60: entidad[0].pos_y = 24;
   7543 21 81 87      [10]  328 	ld	hl, #(_entidad + 0x0011)
   7546 36 18         [10]  329 	ld	(hl), #0x18
                            330 ;src/niveles.c:61: entidad[0].sprite = (u8*) &G_mendo[0];
   7548 21 62 67      [10]  331 	ld	hl, #_G_mendo
   754B 22 82 87      [16]  332 	ld	((_entidad + 0x0012)), hl
   754E C9            [10]  333 	ret
   754F                     334 ___str_5:
   754F 44 6F 6E 20 4D 65   335 	.ascii "Don Mendo"
        6E 64 6F
   7558 00                  336 	.db 0x00
                            337 ;src/niveles.c:64: void initNivel(){
                            338 ;	---------------------------------
                            339 ; Function initNivel
                            340 ; ---------------------------------
   7559                     341 _initNivel::
                            342 ;src/niveles.c:66: entidad[1].max_energy = 0;
   7559 21 8F 87      [10]  343 	ld	hl, #(_entidad + 0x001f)
   755C 36 00         [10]  344 	ld	(hl), #0x00
                            345 ;src/niveles.c:67: entidad[1].pos_x_ant = 4;
   755E 21 94 87      [10]  346 	ld	hl, #(_entidad + 0x0024)
   7561 36 04         [10]  347 	ld	(hl), #0x04
                            348 ;src/niveles.c:68: entidad[2].max_energy = 0;
   7563 21 A3 87      [10]  349 	ld	hl, #(_entidad + 0x0033)
   7566 36 00         [10]  350 	ld	(hl), #0x00
                            351 ;src/niveles.c:69: entidad[2].pos_x_ant = 4;
   7568 21 A8 87      [10]  352 	ld	hl, #(_entidad + 0x0038)
   756B 36 04         [10]  353 	ld	(hl), #0x04
                            354 ;src/niveles.c:72: if (nivel == 1) {
   756D 3A AC 87      [13]  355 	ld	a,(#_nivel + 0)
   7570 3D            [ 4]  356 	dec	a
   7571 20 08         [12]  357 	jr	NZ,00102$
                            358 ;src/niveles.c:73: initSoldadoArabe1(&entidad[1]);
   7573 21 84 87      [10]  359 	ld	hl, #(_entidad + 0x0014)
   7576 E5            [11]  360 	push	hl
   7577 CD AC 73      [17]  361 	call	_initSoldadoArabe1
   757A F1            [10]  362 	pop	af
   757B                     363 00102$:
                            364 ;src/niveles.c:75: if (nivel == 2) {
   757B 3A AC 87      [13]  365 	ld	a,(#_nivel + 0)
   757E D6 02         [ 7]  366 	sub	a, #0x02
   7580 20 0F         [12]  367 	jr	NZ,00104$
                            368 ;src/niveles.c:76: initSoldadoArabe1(&entidad[1]);
   7582 21 84 87      [10]  369 	ld	hl, #(_entidad + 0x0014)
   7585 E5            [11]  370 	push	hl
   7586 CD AC 73      [17]  371 	call	_initSoldadoArabe1
                            372 ;src/niveles.c:77: initSoldadoArabe1(&entidad[2]);
   7589 21 98 87      [10]  373 	ld	hl, #(_entidad + 0x0028)
   758C E3            [19]  374 	ex	(sp),hl
   758D CD AC 73      [17]  375 	call	_initSoldadoArabe1
   7590 F1            [10]  376 	pop	af
   7591                     377 00104$:
                            378 ;src/niveles.c:79: if (nivel == 3){
   7591 3A AC 87      [13]  379 	ld	a,(#_nivel + 0)
   7594 D6 03         [ 7]  380 	sub	a, #0x03
   7596 20 0F         [12]  381 	jr	NZ,00106$
                            382 ;src/niveles.c:80: initAbeja(&entidad[1]);
   7598 21 84 87      [10]  383 	ld	hl, #(_entidad + 0x0014)
   759B E5            [11]  384 	push	hl
   759C CD D0 74      [17]  385 	call	_initAbeja
                            386 ;src/niveles.c:81: initSoldadoArabe1(&entidad[2]);
   759F 21 98 87      [10]  387 	ld	hl, #(_entidad + 0x0028)
   75A2 E3            [19]  388 	ex	(sp),hl
   75A3 CD AC 73      [17]  389 	call	_initSoldadoArabe1
   75A6 F1            [10]  390 	pop	af
   75A7                     391 00106$:
                            392 ;src/niveles.c:83: if (nivel == 4){
   75A7 3A AC 87      [13]  393 	ld	a,(#_nivel + 0)
   75AA D6 04         [ 7]  394 	sub	a, #0x04
   75AC 20 08         [12]  395 	jr	NZ,00108$
                            396 ;src/niveles.c:84: initSoldadoArabe2(&entidad[1]);
   75AE 21 84 87      [10]  397 	ld	hl, #(_entidad + 0x0014)
   75B1 E5            [11]  398 	push	hl
   75B2 CD F6 73      [17]  399 	call	_initSoldadoArabe2
   75B5 F1            [10]  400 	pop	af
   75B6                     401 00108$:
                            402 ;src/niveles.c:86: if (nivel == 6){
   75B6 3A AC 87      [13]  403 	ld	a,(#_nivel + 0)
   75B9 D6 06         [ 7]  404 	sub	a, #0x06
   75BB 20 0F         [12]  405 	jr	NZ,00110$
                            406 ;src/niveles.c:87: initAbeja(&entidad[1]);
   75BD 21 84 87      [10]  407 	ld	hl, #(_entidad + 0x0014)
   75C0 E5            [11]  408 	push	hl
   75C1 CD D0 74      [17]  409 	call	_initAbeja
                            410 ;src/niveles.c:88: initFakir(&entidad[2]);
   75C4 21 98 87      [10]  411 	ld	hl, #(_entidad + 0x0028)
   75C7 E3            [19]  412 	ex	(sp),hl
   75C8 CD 8A 74      [17]  413 	call	_initFakir
   75CB F1            [10]  414 	pop	af
   75CC                     415 00110$:
                            416 ;src/niveles.c:90: if (nivel == 7){
   75CC 3A AC 87      [13]  417 	ld	a,(#_nivel + 0)
   75CF D6 07         [ 7]  418 	sub	a, #0x07
   75D1 20 0F         [12]  419 	jr	NZ,00112$
                            420 ;src/niveles.c:91: initSoldadoArabe2(&entidad[1]);
   75D3 21 84 87      [10]  421 	ld	hl, #(_entidad + 0x0014)
   75D6 E5            [11]  422 	push	hl
   75D7 CD F6 73      [17]  423 	call	_initSoldadoArabe2
                            424 ;src/niveles.c:92: initSoldadoArabe3(&entidad[2]);
   75DA 21 98 87      [10]  425 	ld	hl, #(_entidad + 0x0028)
   75DD E3            [19]  426 	ex	(sp),hl
   75DE CD 40 74      [17]  427 	call	_initSoldadoArabe3
   75E1 F1            [10]  428 	pop	af
   75E2                     429 00112$:
                            430 ;src/niveles.c:94: if (nivel == 8){
   75E2 3A AC 87      [13]  431 	ld	a,(#_nivel + 0)
   75E5 D6 08         [ 7]  432 	sub	a, #0x08
   75E7 20 0F         [12]  433 	jr	NZ,00114$
                            434 ;src/niveles.c:95: initFakir(&entidad[1]);
   75E9 21 84 87      [10]  435 	ld	hl, #(_entidad + 0x0014)
   75EC E5            [11]  436 	push	hl
   75ED CD 8A 74      [17]  437 	call	_initFakir
                            438 ;src/niveles.c:96: initSoldadoArabe2(&entidad[2]);
   75F0 21 98 87      [10]  439 	ld	hl, #(_entidad + 0x0028)
   75F3 E3            [19]  440 	ex	(sp),hl
   75F4 CD F6 73      [17]  441 	call	_initSoldadoArabe2
   75F7 F1            [10]  442 	pop	af
   75F8                     443 00114$:
                            444 ;src/niveles.c:98: if (nivel == 9){
   75F8 3A AC 87      [13]  445 	ld	a,(#_nivel + 0)
   75FB D6 09         [ 7]  446 	sub	a, #0x09
   75FD 20 0F         [12]  447 	jr	NZ,00116$
                            448 ;src/niveles.c:99: initSoldadoArabe3(&entidad[1]);
   75FF 21 84 87      [10]  449 	ld	hl, #(_entidad + 0x0014)
   7602 E5            [11]  450 	push	hl
   7603 CD 40 74      [17]  451 	call	_initSoldadoArabe3
                            452 ;src/niveles.c:100: initSoldadoArabe3(&entidad[2]);
   7606 21 98 87      [10]  453 	ld	hl, #(_entidad + 0x0028)
   7609 E3            [19]  454 	ex	(sp),hl
   760A CD 40 74      [17]  455 	call	_initSoldadoArabe3
   760D F1            [10]  456 	pop	af
   760E                     457 00116$:
                            458 ;src/niveles.c:102: if (nivel == 10){
   760E FD 21 AC 87   [14]  459 	ld	iy, #_nivel
   7612 FD 7E 00      [19]  460 	ld	a, 0 (iy)
   7615 D6 0A         [ 7]  461 	sub	a, #0x0a
   7617 20 26         [12]  462 	jr	NZ,00118$
                            463 ;src/niveles.c:103: strcpy(entidad[2].name,"Boss Lvl1");
   7619 11 98 87      [10]  464 	ld	de, #(_entidad + 0x0028)
   761C 21 62 76      [10]  465 	ld	hl, #___str_6
   761F AF            [ 4]  466 	xor	a, a
   7620                     467 00175$:
   7620 BE            [ 7]  468 	cp	a, (hl)
   7621 ED A0         [16]  469 	ldi
   7623 20 FB         [12]  470 	jr	NZ, 00175$
                            471 ;src/niveles.c:104: entidad[2].max_energy = 99;
   7625 21 A3 87      [10]  472 	ld	hl, #(_entidad + 0x0033)
   7628 36 63         [10]  473 	ld	(hl), #0x63
                            474 ;src/niveles.c:105: entidad[2].attack = 40;
   762A 21 A4 87      [10]  475 	ld	hl, #(_entidad + 0x0034)
   762D 36 28         [10]  476 	ld	(hl), #0x28
                            477 ;src/niveles.c:106: entidad[2].force = 10;
   762F 21 A5 87      [10]  478 	ld	hl, #(_entidad + 0x0035)
   7632 36 0A         [10]  479 	ld	(hl), #0x0a
                            480 ;src/niveles.c:107: entidad[2].defense = 25;
   7634 21 A6 87      [10]  481 	ld	hl, #(_entidad + 0x0036)
   7637 36 19         [10]  482 	ld	(hl), #0x19
                            483 ;src/niveles.c:108: entidad[2].sprite = (u8*) &G_arabe_boss[0];
   7639 21 C2 6B      [10]  484 	ld	hl, #_G_arabe_boss
   763C 22 AA 87      [16]  485 	ld	((_entidad + 0x003a)), hl
   763F                     486 00118$:
                            487 ;src/niveles.c:111: entidad[1].pos_x = 28;  //Posición del sprite en pantalla
   763F 21 93 87      [10]  488 	ld	hl, #(_entidad + 0x0023)
   7642 36 1C         [10]  489 	ld	(hl), #0x1c
                            490 ;src/niveles.c:112: entidad[2].pos_x = 36;
   7644 21 A7 87      [10]  491 	ld	hl, #(_entidad + 0x0037)
   7647 36 24         [10]  492 	ld	(hl), #0x24
                            493 ;src/niveles.c:113: entidad[1].pos_y = 32;  //Posición en el marcador
   7649 21 95 87      [10]  494 	ld	hl, #(_entidad + 0x0025)
   764C 36 20         [10]  495 	ld	(hl), #0x20
                            496 ;src/niveles.c:114: entidad[2].pos_y = 40;  //
   764E 21 A9 87      [10]  497 	ld	hl, #(_entidad + 0x0039)
   7651 36 28         [10]  498 	ld	(hl), #0x28
                            499 ;src/niveles.c:115: entidad[1].energy = entidad[1].max_energy;
   7653 01 8E 87      [10]  500 	ld	bc, #_entidad + 30
   7656 3A 8F 87      [13]  501 	ld	a, (#(_entidad + 0x001f) + 0)
   7659 02            [ 7]  502 	ld	(bc), a
                            503 ;src/niveles.c:116: entidad[2].energy = entidad[2].max_energy;
   765A 01 A2 87      [10]  504 	ld	bc, #_entidad + 50
   765D 3A A3 87      [13]  505 	ld	a, (#(_entidad + 0x0033) + 0)
   7660 02            [ 7]  506 	ld	(bc), a
   7661 C9            [10]  507 	ret
   7662                     508 ___str_6:
   7662 42 6F 73 73 20 4C   509 	.ascii "Boss Lvl1"
        76 6C 31
   766B 00                  510 	.db 0x00
                            511 	.area _CODE
                            512 	.area _INITIALIZER
                            513 	.area _CABS (ABS)
