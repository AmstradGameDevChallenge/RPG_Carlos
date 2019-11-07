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
                             13 	.globl _initGoblin
                             14 	.globl _initSpider
                             15 	.globl _initGusano
                             16 	.globl _initEsqueleto
                             17 	.globl _initMurcielago
                             18 	.globl _initAbeja
                             19 	.globl _initFakir
                             20 	.globl _initSoldadoArabe3
                             21 	.globl _initSoldadoArabe2
                             22 	.globl _initSoldadoArabe1
                             23 ;--------------------------------------------------------
                             24 ; special function registers
                             25 ;--------------------------------------------------------
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DATA
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _INITIALIZED
                             34 ;--------------------------------------------------------
                             35 ; absolute external ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DABS (ABS)
                             38 ;--------------------------------------------------------
                             39 ; global & static initialisations
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _GSINIT
                             43 	.area _GSFINAL
                             44 	.area _GSINIT
                             45 ;--------------------------------------------------------
                             46 ; Home
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _HOME
                             50 ;--------------------------------------------------------
                             51 ; code
                             52 ;--------------------------------------------------------
                             53 	.area _CODE
                             54 ;src/niveles.c:7: void initSoldadoArabe1(TStats *entidad) {
                             55 ;	---------------------------------
                             56 ; Function initSoldadoArabe1
                             57 ; ---------------------------------
   5899                      58 _initSoldadoArabe1::
   5899 DD E5         [15]   59 	push	ix
   589B DD 21 00 00   [14]   60 	ld	ix,#0
   589F DD 39         [15]   61 	add	ix,sp
                             62 ;src/niveles.c:8: strcpy(entidad->name,"Soldier 1");
   58A1 DD 4E 04      [19]   63 	ld	c,4 (ix)
   58A4 DD 46 05      [19]   64 	ld	b,5 (ix)
   58A7 59            [ 4]   65 	ld	e, c
   58A8 50            [ 4]   66 	ld	d, b
   58A9 C5            [11]   67 	push	bc
   58AA 21 D9 58      [10]   68 	ld	hl, #___str_0
   58AD AF            [ 4]   69 	xor	a, a
   58AE                      70 00103$:
   58AE BE            [ 7]   71 	cp	a, (hl)
   58AF ED A0         [16]   72 	ldi
   58B1 20 FB         [12]   73 	jr	NZ, 00103$
   58B3 C1            [10]   74 	pop	bc
                             75 ;src/niveles.c:9: entidad->max_energy = 60;
   58B4 21 0B 00      [10]   76 	ld	hl, #0x000b
   58B7 09            [11]   77 	add	hl, bc
   58B8 36 3C         [10]   78 	ld	(hl), #0x3c
                             79 ;src/niveles.c:10: entidad->attack = 20;
   58BA 21 0C 00      [10]   80 	ld	hl, #0x000c
   58BD 09            [11]   81 	add	hl, bc
   58BE 36 14         [10]   82 	ld	(hl), #0x14
                             83 ;src/niveles.c:11: entidad->force = 5;
   58C0 21 0D 00      [10]   84 	ld	hl, #0x000d
   58C3 09            [11]   85 	add	hl, bc
   58C4 36 05         [10]   86 	ld	(hl), #0x05
                             87 ;src/niveles.c:12: entidad->defense = 10;
   58C6 21 0E 00      [10]   88 	ld	hl, #0x000e
   58C9 09            [11]   89 	add	hl, bc
   58CA 36 0A         [10]   90 	ld	(hl), #0x0a
                             91 ;src/niveles.c:13: entidad->sprite = (u8*) &G_arabe_1[0];
   58CC 21 12 00      [10]   92 	ld	hl, #0x0012
   58CF 09            [11]   93 	add	hl, bc
   58D0 01 06 3F      [10]   94 	ld	bc, #_G_arabe_1+0
   58D3 71            [ 7]   95 	ld	(hl), c
   58D4 23            [ 6]   96 	inc	hl
   58D5 70            [ 7]   97 	ld	(hl), b
   58D6 DD E1         [14]   98 	pop	ix
   58D8 C9            [10]   99 	ret
   58D9                     100 ___str_0:
   58D9 53 6F 6C 64 69 65   101 	.ascii "Soldier 1"
        72 20 31
   58E2 00                  102 	.db 0x00
                            103 ;src/niveles.c:16: void initSoldadoArabe2(TStats *entidad) {
                            104 ;	---------------------------------
                            105 ; Function initSoldadoArabe2
                            106 ; ---------------------------------
   58E3                     107 _initSoldadoArabe2::
   58E3 DD E5         [15]  108 	push	ix
   58E5 DD 21 00 00   [14]  109 	ld	ix,#0
   58E9 DD 39         [15]  110 	add	ix,sp
                            111 ;src/niveles.c:17: strcpy(entidad->name,"Soldier 2");
   58EB DD 4E 04      [19]  112 	ld	c,4 (ix)
   58EE DD 46 05      [19]  113 	ld	b,5 (ix)
   58F1 59            [ 4]  114 	ld	e, c
   58F2 50            [ 4]  115 	ld	d, b
   58F3 C5            [11]  116 	push	bc
   58F4 21 23 59      [10]  117 	ld	hl, #___str_1
   58F7 AF            [ 4]  118 	xor	a, a
   58F8                     119 00103$:
   58F8 BE            [ 7]  120 	cp	a, (hl)
   58F9 ED A0         [16]  121 	ldi
   58FB 20 FB         [12]  122 	jr	NZ, 00103$
   58FD C1            [10]  123 	pop	bc
                            124 ;src/niveles.c:18: entidad->max_energy = 75;
   58FE 21 0B 00      [10]  125 	ld	hl, #0x000b
   5901 09            [11]  126 	add	hl, bc
   5902 36 4B         [10]  127 	ld	(hl), #0x4b
                            128 ;src/niveles.c:19: entidad->attack = 30;
   5904 21 0C 00      [10]  129 	ld	hl, #0x000c
   5907 09            [11]  130 	add	hl, bc
   5908 36 1E         [10]  131 	ld	(hl), #0x1e
                            132 ;src/niveles.c:20: entidad->force = 10;
   590A 21 0D 00      [10]  133 	ld	hl, #0x000d
   590D 09            [11]  134 	add	hl, bc
   590E 36 0A         [10]  135 	ld	(hl), #0x0a
                            136 ;src/niveles.c:21: entidad->defense = 20;
   5910 21 0E 00      [10]  137 	ld	hl, #0x000e
   5913 09            [11]  138 	add	hl, bc
   5914 36 14         [10]  139 	ld	(hl), #0x14
                            140 ;src/niveles.c:22: entidad->sprite = (u8*) &G_arabe_2[0];
   5916 21 12 00      [10]  141 	ld	hl, #0x0012
   5919 09            [11]  142 	add	hl, bc
   591A 01 E6 3F      [10]  143 	ld	bc, #_G_arabe_2+0
   591D 71            [ 7]  144 	ld	(hl), c
   591E 23            [ 6]  145 	inc	hl
   591F 70            [ 7]  146 	ld	(hl), b
   5920 DD E1         [14]  147 	pop	ix
   5922 C9            [10]  148 	ret
   5923                     149 ___str_1:
   5923 53 6F 6C 64 69 65   150 	.ascii "Soldier 2"
        72 20 32
   592C 00                  151 	.db 0x00
                            152 ;src/niveles.c:25: void initSoldadoArabe3(TStats *entidad) {
                            153 ;	---------------------------------
                            154 ; Function initSoldadoArabe3
                            155 ; ---------------------------------
   592D                     156 _initSoldadoArabe3::
   592D DD E5         [15]  157 	push	ix
   592F DD 21 00 00   [14]  158 	ld	ix,#0
   5933 DD 39         [15]  159 	add	ix,sp
                            160 ;src/niveles.c:26: strcpy(entidad->name,"Soldier 3");
   5935 DD 4E 04      [19]  161 	ld	c,4 (ix)
   5938 DD 46 05      [19]  162 	ld	b,5 (ix)
   593B 59            [ 4]  163 	ld	e, c
   593C 50            [ 4]  164 	ld	d, b
   593D C5            [11]  165 	push	bc
   593E 21 6D 59      [10]  166 	ld	hl, #___str_2
   5941 AF            [ 4]  167 	xor	a, a
   5942                     168 00103$:
   5942 BE            [ 7]  169 	cp	a, (hl)
   5943 ED A0         [16]  170 	ldi
   5945 20 FB         [12]  171 	jr	NZ, 00103$
   5947 C1            [10]  172 	pop	bc
                            173 ;src/niveles.c:27: entidad->max_energy = 90;
   5948 21 0B 00      [10]  174 	ld	hl, #0x000b
   594B 09            [11]  175 	add	hl, bc
   594C 36 5A         [10]  176 	ld	(hl), #0x5a
                            177 ;src/niveles.c:28: entidad->attack = 30;
   594E 21 0C 00      [10]  178 	ld	hl, #0x000c
   5951 09            [11]  179 	add	hl, bc
   5952 36 1E         [10]  180 	ld	(hl), #0x1e
                            181 ;src/niveles.c:29: entidad->force = 20;
   5954 21 0D 00      [10]  182 	ld	hl, #0x000d
   5957 09            [11]  183 	add	hl, bc
   5958 36 14         [10]  184 	ld	(hl), #0x14
                            185 ;src/niveles.c:30: entidad->defense = 30;
   595A 21 0E 00      [10]  186 	ld	hl, #0x000e
   595D 09            [11]  187 	add	hl, bc
   595E 36 1E         [10]  188 	ld	(hl), #0x1e
                            189 ;src/niveles.c:31: entidad->sprite = (u8*) &G_arabe_3[0];
   5960 21 12 00      [10]  190 	ld	hl, #0x0012
   5963 09            [11]  191 	add	hl, bc
   5964 01 C6 40      [10]  192 	ld	bc, #_G_arabe_3+0
   5967 71            [ 7]  193 	ld	(hl), c
   5968 23            [ 6]  194 	inc	hl
   5969 70            [ 7]  195 	ld	(hl), b
   596A DD E1         [14]  196 	pop	ix
   596C C9            [10]  197 	ret
   596D                     198 ___str_2:
   596D 53 6F 6C 64 69 65   199 	.ascii "Soldier 3"
        72 20 33
   5976 00                  200 	.db 0x00
                            201 ;src/niveles.c:34: void initFakir(TStats *entidad) {
                            202 ;	---------------------------------
                            203 ; Function initFakir
                            204 ; ---------------------------------
   5977                     205 _initFakir::
   5977 DD E5         [15]  206 	push	ix
   5979 DD 21 00 00   [14]  207 	ld	ix,#0
   597D DD 39         [15]  208 	add	ix,sp
                            209 ;src/niveles.c:35: strcpy(entidad->name,"Fakir");
   597F DD 4E 04      [19]  210 	ld	c,4 (ix)
   5982 DD 46 05      [19]  211 	ld	b,5 (ix)
   5985 59            [ 4]  212 	ld	e, c
   5986 50            [ 4]  213 	ld	d, b
   5987 C5            [11]  214 	push	bc
   5988 21 B7 59      [10]  215 	ld	hl, #___str_3
   598B AF            [ 4]  216 	xor	a, a
   598C                     217 00103$:
   598C BE            [ 7]  218 	cp	a, (hl)
   598D ED A0         [16]  219 	ldi
   598F 20 FB         [12]  220 	jr	NZ, 00103$
   5991 C1            [10]  221 	pop	bc
                            222 ;src/niveles.c:36: entidad->max_energy = 60;
   5992 21 0B 00      [10]  223 	ld	hl, #0x000b
   5995 09            [11]  224 	add	hl, bc
   5996 36 3C         [10]  225 	ld	(hl), #0x3c
                            226 ;src/niveles.c:37: entidad->attack = 40;
   5998 21 0C 00      [10]  227 	ld	hl, #0x000c
   599B 09            [11]  228 	add	hl, bc
   599C 36 28         [10]  229 	ld	(hl), #0x28
                            230 ;src/niveles.c:38: entidad->force = 0;
   599E 21 0D 00      [10]  231 	ld	hl, #0x000d
   59A1 09            [11]  232 	add	hl, bc
   59A2 36 00         [10]  233 	ld	(hl), #0x00
                            234 ;src/niveles.c:39: entidad->defense = 5;
   59A4 21 0E 00      [10]  235 	ld	hl, #0x000e
   59A7 09            [11]  236 	add	hl, bc
   59A8 36 05         [10]  237 	ld	(hl), #0x05
                            238 ;src/niveles.c:40: entidad->sprite = (u8*) &G_fakir[0];
   59AA 21 12 00      [10]  239 	ld	hl, #0x0012
   59AD 09            [11]  240 	add	hl, bc
   59AE 01 A6 41      [10]  241 	ld	bc, #_G_fakir+0
   59B1 71            [ 7]  242 	ld	(hl), c
   59B2 23            [ 6]  243 	inc	hl
   59B3 70            [ 7]  244 	ld	(hl), b
   59B4 DD E1         [14]  245 	pop	ix
   59B6 C9            [10]  246 	ret
   59B7                     247 ___str_3:
   59B7 46 61 6B 69 72      248 	.ascii "Fakir"
   59BC 00                  249 	.db 0x00
                            250 ;src/niveles.c:43: void initAbeja(TStats *entidad) {
                            251 ;	---------------------------------
                            252 ; Function initAbeja
                            253 ; ---------------------------------
   59BD                     254 _initAbeja::
   59BD DD E5         [15]  255 	push	ix
   59BF DD 21 00 00   [14]  256 	ld	ix,#0
   59C3 DD 39         [15]  257 	add	ix,sp
                            258 ;src/niveles.c:44: strcpy(entidad->name,"Bee");
   59C5 DD 4E 04      [19]  259 	ld	c,4 (ix)
   59C8 DD 46 05      [19]  260 	ld	b,5 (ix)
   59CB 59            [ 4]  261 	ld	e, c
   59CC 50            [ 4]  262 	ld	d, b
   59CD C5            [11]  263 	push	bc
   59CE 21 FD 59      [10]  264 	ld	hl, #___str_4
   59D1 AF            [ 4]  265 	xor	a, a
   59D2                     266 00103$:
   59D2 BE            [ 7]  267 	cp	a, (hl)
   59D3 ED A0         [16]  268 	ldi
   59D5 20 FB         [12]  269 	jr	NZ, 00103$
   59D7 C1            [10]  270 	pop	bc
                            271 ;src/niveles.c:45: entidad->max_energy = 60;
   59D8 21 0B 00      [10]  272 	ld	hl, #0x000b
   59DB 09            [11]  273 	add	hl, bc
   59DC 36 3C         [10]  274 	ld	(hl), #0x3c
                            275 ;src/niveles.c:46: entidad->attack = 30;
   59DE 21 0C 00      [10]  276 	ld	hl, #0x000c
   59E1 09            [11]  277 	add	hl, bc
   59E2 36 1E         [10]  278 	ld	(hl), #0x1e
                            279 ;src/niveles.c:47: entidad->force = 10;
   59E4 21 0D 00      [10]  280 	ld	hl, #0x000d
   59E7 09            [11]  281 	add	hl, bc
   59E8 36 0A         [10]  282 	ld	(hl), #0x0a
                            283 ;src/niveles.c:48: entidad->defense = 5;
   59EA 21 0E 00      [10]  284 	ld	hl, #0x000e
   59ED 09            [11]  285 	add	hl, bc
   59EE 36 05         [10]  286 	ld	(hl), #0x05
                            287 ;src/niveles.c:49: entidad->sprite = (u8*) &G_abeja[0];
   59F0 21 12 00      [10]  288 	ld	hl, #0x0012
   59F3 09            [11]  289 	add	hl, bc
   59F4 01 66 43      [10]  290 	ld	bc, #_G_abeja+0
   59F7 71            [ 7]  291 	ld	(hl), c
   59F8 23            [ 6]  292 	inc	hl
   59F9 70            [ 7]  293 	ld	(hl), b
   59FA DD E1         [14]  294 	pop	ix
   59FC C9            [10]  295 	ret
   59FD                     296 ___str_4:
   59FD 42 65 65            297 	.ascii "Bee"
   5A00 00                  298 	.db 0x00
                            299 ;src/niveles.c:52: void initMurcielago(TStats *entidad) {
                            300 ;	---------------------------------
                            301 ; Function initMurcielago
                            302 ; ---------------------------------
   5A01                     303 _initMurcielago::
   5A01 DD E5         [15]  304 	push	ix
   5A03 DD 21 00 00   [14]  305 	ld	ix,#0
   5A07 DD 39         [15]  306 	add	ix,sp
                            307 ;src/niveles.c:53: strcpy(entidad->name,"Evil Bat");
   5A09 DD 4E 04      [19]  308 	ld	c,4 (ix)
   5A0C DD 46 05      [19]  309 	ld	b,5 (ix)
   5A0F 59            [ 4]  310 	ld	e, c
   5A10 50            [ 4]  311 	ld	d, b
   5A11 C5            [11]  312 	push	bc
   5A12 21 41 5A      [10]  313 	ld	hl, #___str_5
   5A15 AF            [ 4]  314 	xor	a, a
   5A16                     315 00103$:
   5A16 BE            [ 7]  316 	cp	a, (hl)
   5A17 ED A0         [16]  317 	ldi
   5A19 20 FB         [12]  318 	jr	NZ, 00103$
   5A1B C1            [10]  319 	pop	bc
                            320 ;src/niveles.c:54: entidad->max_energy = 60;
   5A1C 21 0B 00      [10]  321 	ld	hl, #0x000b
   5A1F 09            [11]  322 	add	hl, bc
   5A20 36 3C         [10]  323 	ld	(hl), #0x3c
                            324 ;src/niveles.c:55: entidad->attack = 20;
   5A22 21 0C 00      [10]  325 	ld	hl, #0x000c
   5A25 09            [11]  326 	add	hl, bc
   5A26 36 14         [10]  327 	ld	(hl), #0x14
                            328 ;src/niveles.c:56: entidad->force = 5;
   5A28 21 0D 00      [10]  329 	ld	hl, #0x000d
   5A2B 09            [11]  330 	add	hl, bc
   5A2C 36 05         [10]  331 	ld	(hl), #0x05
                            332 ;src/niveles.c:57: entidad->defense = 10;
   5A2E 21 0E 00      [10]  333 	ld	hl, #0x000e
   5A31 09            [11]  334 	add	hl, bc
   5A32 36 0A         [10]  335 	ld	(hl), #0x0a
                            336 ;src/niveles.c:58: entidad->sprite = (u8*) &G_murcielago[0];
   5A34 21 12 00      [10]  337 	ld	hl, #0x0012
   5A37 09            [11]  338 	add	hl, bc
   5A38 01 86 44      [10]  339 	ld	bc, #_G_murcielago+0
   5A3B 71            [ 7]  340 	ld	(hl), c
   5A3C 23            [ 6]  341 	inc	hl
   5A3D 70            [ 7]  342 	ld	(hl), b
   5A3E DD E1         [14]  343 	pop	ix
   5A40 C9            [10]  344 	ret
   5A41                     345 ___str_5:
   5A41 45 76 69 6C 20 42   346 	.ascii "Evil Bat"
        61 74
   5A49 00                  347 	.db 0x00
                            348 ;src/niveles.c:61: void initEsqueleto(TStats *entidad) {
                            349 ;	---------------------------------
                            350 ; Function initEsqueleto
                            351 ; ---------------------------------
   5A4A                     352 _initEsqueleto::
   5A4A DD E5         [15]  353 	push	ix
   5A4C DD 21 00 00   [14]  354 	ld	ix,#0
   5A50 DD 39         [15]  355 	add	ix,sp
                            356 ;src/niveles.c:62: strcpy(entidad->name,"Skeleton");
   5A52 DD 4E 04      [19]  357 	ld	c,4 (ix)
   5A55 DD 46 05      [19]  358 	ld	b,5 (ix)
   5A58 59            [ 4]  359 	ld	e, c
   5A59 50            [ 4]  360 	ld	d, b
   5A5A C5            [11]  361 	push	bc
   5A5B 21 8A 5A      [10]  362 	ld	hl, #___str_6
   5A5E AF            [ 4]  363 	xor	a, a
   5A5F                     364 00103$:
   5A5F BE            [ 7]  365 	cp	a, (hl)
   5A60 ED A0         [16]  366 	ldi
   5A62 20 FB         [12]  367 	jr	NZ, 00103$
   5A64 C1            [10]  368 	pop	bc
                            369 ;src/niveles.c:63: entidad->max_energy = 75;
   5A65 21 0B 00      [10]  370 	ld	hl, #0x000b
   5A68 09            [11]  371 	add	hl, bc
   5A69 36 4B         [10]  372 	ld	(hl), #0x4b
                            373 ;src/niveles.c:64: entidad->attack = 30;
   5A6B 21 0C 00      [10]  374 	ld	hl, #0x000c
   5A6E 09            [11]  375 	add	hl, bc
   5A6F 36 1E         [10]  376 	ld	(hl), #0x1e
                            377 ;src/niveles.c:65: entidad->force = 10;
   5A71 21 0D 00      [10]  378 	ld	hl, #0x000d
   5A74 09            [11]  379 	add	hl, bc
   5A75 36 0A         [10]  380 	ld	(hl), #0x0a
                            381 ;src/niveles.c:66: entidad->defense = 20;
   5A77 21 0E 00      [10]  382 	ld	hl, #0x000e
   5A7A 09            [11]  383 	add	hl, bc
   5A7B 36 14         [10]  384 	ld	(hl), #0x14
                            385 ;src/niveles.c:67: entidad->sprite = (u8*) &G_esqueleto[0];
   5A7D 21 12 00      [10]  386 	ld	hl, #0x0012
   5A80 09            [11]  387 	add	hl, bc
   5A81 01 66 45      [10]  388 	ld	bc, #_G_esqueleto+0
   5A84 71            [ 7]  389 	ld	(hl), c
   5A85 23            [ 6]  390 	inc	hl
   5A86 70            [ 7]  391 	ld	(hl), b
   5A87 DD E1         [14]  392 	pop	ix
   5A89 C9            [10]  393 	ret
   5A8A                     394 ___str_6:
   5A8A 53 6B 65 6C 65 74   395 	.ascii "Skeleton"
        6F 6E
   5A92 00                  396 	.db 0x00
                            397 ;src/niveles.c:70: void initGusano(TStats *entidad) {
                            398 ;	---------------------------------
                            399 ; Function initGusano
                            400 ; ---------------------------------
   5A93                     401 _initGusano::
   5A93 DD E5         [15]  402 	push	ix
   5A95 DD 21 00 00   [14]  403 	ld	ix,#0
   5A99 DD 39         [15]  404 	add	ix,sp
                            405 ;src/niveles.c:71: strcpy(entidad->name,"Worm");
   5A9B DD 4E 04      [19]  406 	ld	c,4 (ix)
   5A9E DD 46 05      [19]  407 	ld	b,5 (ix)
   5AA1 59            [ 4]  408 	ld	e, c
   5AA2 50            [ 4]  409 	ld	d, b
   5AA3 C5            [11]  410 	push	bc
   5AA4 21 D3 5A      [10]  411 	ld	hl, #___str_7
   5AA7 AF            [ 4]  412 	xor	a, a
   5AA8                     413 00103$:
   5AA8 BE            [ 7]  414 	cp	a, (hl)
   5AA9 ED A0         [16]  415 	ldi
   5AAB 20 FB         [12]  416 	jr	NZ, 00103$
   5AAD C1            [10]  417 	pop	bc
                            418 ;src/niveles.c:72: entidad->max_energy = 60;
   5AAE 21 0B 00      [10]  419 	ld	hl, #0x000b
   5AB1 09            [11]  420 	add	hl, bc
   5AB2 36 3C         [10]  421 	ld	(hl), #0x3c
                            422 ;src/niveles.c:73: entidad->attack = 40;
   5AB4 21 0C 00      [10]  423 	ld	hl, #0x000c
   5AB7 09            [11]  424 	add	hl, bc
   5AB8 36 28         [10]  425 	ld	(hl), #0x28
                            426 ;src/niveles.c:74: entidad->force = 0;
   5ABA 21 0D 00      [10]  427 	ld	hl, #0x000d
   5ABD 09            [11]  428 	add	hl, bc
   5ABE 36 00         [10]  429 	ld	(hl), #0x00
                            430 ;src/niveles.c:75: entidad->defense = 5;
   5AC0 21 0E 00      [10]  431 	ld	hl, #0x000e
   5AC3 09            [11]  432 	add	hl, bc
   5AC4 36 05         [10]  433 	ld	(hl), #0x05
                            434 ;src/niveles.c:76: entidad->sprite = (u8*) &G_gusano[0];
   5AC6 21 12 00      [10]  435 	ld	hl, #0x0012
   5AC9 09            [11]  436 	add	hl, bc
   5ACA 01 46 46      [10]  437 	ld	bc, #_G_gusano+0
   5ACD 71            [ 7]  438 	ld	(hl), c
   5ACE 23            [ 6]  439 	inc	hl
   5ACF 70            [ 7]  440 	ld	(hl), b
   5AD0 DD E1         [14]  441 	pop	ix
   5AD2 C9            [10]  442 	ret
   5AD3                     443 ___str_7:
   5AD3 57 6F 72 6D         444 	.ascii "Worm"
   5AD7 00                  445 	.db 0x00
                            446 ;src/niveles.c:79: void initSpider(TStats *entidad) {
                            447 ;	---------------------------------
                            448 ; Function initSpider
                            449 ; ---------------------------------
   5AD8                     450 _initSpider::
   5AD8 DD E5         [15]  451 	push	ix
   5ADA DD 21 00 00   [14]  452 	ld	ix,#0
   5ADE DD 39         [15]  453 	add	ix,sp
                            454 ;src/niveles.c:80: strcpy(entidad->name,"Spider");
   5AE0 DD 4E 04      [19]  455 	ld	c,4 (ix)
   5AE3 DD 46 05      [19]  456 	ld	b,5 (ix)
   5AE6 59            [ 4]  457 	ld	e, c
   5AE7 50            [ 4]  458 	ld	d, b
   5AE8 C5            [11]  459 	push	bc
   5AE9 21 18 5B      [10]  460 	ld	hl, #___str_8
   5AEC AF            [ 4]  461 	xor	a, a
   5AED                     462 00103$:
   5AED BE            [ 7]  463 	cp	a, (hl)
   5AEE ED A0         [16]  464 	ldi
   5AF0 20 FB         [12]  465 	jr	NZ, 00103$
   5AF2 C1            [10]  466 	pop	bc
                            467 ;src/niveles.c:81: entidad->max_energy = 90;
   5AF3 21 0B 00      [10]  468 	ld	hl, #0x000b
   5AF6 09            [11]  469 	add	hl, bc
   5AF7 36 5A         [10]  470 	ld	(hl), #0x5a
                            471 ;src/niveles.c:82: entidad->attack = 30;
   5AF9 21 0C 00      [10]  472 	ld	hl, #0x000c
   5AFC 09            [11]  473 	add	hl, bc
   5AFD 36 1E         [10]  474 	ld	(hl), #0x1e
                            475 ;src/niveles.c:83: entidad->force = 20;
   5AFF 21 0D 00      [10]  476 	ld	hl, #0x000d
   5B02 09            [11]  477 	add	hl, bc
   5B03 36 14         [10]  478 	ld	(hl), #0x14
                            479 ;src/niveles.c:84: entidad->defense = 30;
   5B05 21 0E 00      [10]  480 	ld	hl, #0x000e
   5B08 09            [11]  481 	add	hl, bc
   5B09 36 1E         [10]  482 	ld	(hl), #0x1e
                            483 ;src/niveles.c:85: entidad->sprite = (u8*) &G_spider[0];
   5B0B 21 12 00      [10]  484 	ld	hl, #0x0012
   5B0E 09            [11]  485 	add	hl, bc
   5B0F 01 26 47      [10]  486 	ld	bc, #_G_spider+0
   5B12 71            [ 7]  487 	ld	(hl), c
   5B13 23            [ 6]  488 	inc	hl
   5B14 70            [ 7]  489 	ld	(hl), b
   5B15 DD E1         [14]  490 	pop	ix
   5B17 C9            [10]  491 	ret
   5B18                     492 ___str_8:
   5B18 53 70 69 64 65 72   493 	.ascii "Spider"
   5B1E 00                  494 	.db 0x00
                            495 ;src/niveles.c:88: void initGoblin(TStats *entidad) {
                            496 ;	---------------------------------
                            497 ; Function initGoblin
                            498 ; ---------------------------------
   5B1F                     499 _initGoblin::
   5B1F DD E5         [15]  500 	push	ix
   5B21 DD 21 00 00   [14]  501 	ld	ix,#0
   5B25 DD 39         [15]  502 	add	ix,sp
                            503 ;src/niveles.c:89: strcpy(entidad->name,"Goblin");
   5B27 DD 4E 04      [19]  504 	ld	c,4 (ix)
   5B2A DD 46 05      [19]  505 	ld	b,5 (ix)
   5B2D 59            [ 4]  506 	ld	e, c
   5B2E 50            [ 4]  507 	ld	d, b
   5B2F C5            [11]  508 	push	bc
   5B30 21 5F 5B      [10]  509 	ld	hl, #___str_9
   5B33 AF            [ 4]  510 	xor	a, a
   5B34                     511 00103$:
   5B34 BE            [ 7]  512 	cp	a, (hl)
   5B35 ED A0         [16]  513 	ldi
   5B37 20 FB         [12]  514 	jr	NZ, 00103$
   5B39 C1            [10]  515 	pop	bc
                            516 ;src/niveles.c:90: entidad->max_energy = 60;
   5B3A 21 0B 00      [10]  517 	ld	hl, #0x000b
   5B3D 09            [11]  518 	add	hl, bc
   5B3E 36 3C         [10]  519 	ld	(hl), #0x3c
                            520 ;src/niveles.c:91: entidad->attack = 30;
   5B40 21 0C 00      [10]  521 	ld	hl, #0x000c
   5B43 09            [11]  522 	add	hl, bc
   5B44 36 1E         [10]  523 	ld	(hl), #0x1e
                            524 ;src/niveles.c:92: entidad->force = 10;
   5B46 21 0D 00      [10]  525 	ld	hl, #0x000d
   5B49 09            [11]  526 	add	hl, bc
   5B4A 36 0A         [10]  527 	ld	(hl), #0x0a
                            528 ;src/niveles.c:93: entidad->defense = 5;
   5B4C 21 0E 00      [10]  529 	ld	hl, #0x000e
   5B4F 09            [11]  530 	add	hl, bc
   5B50 36 05         [10]  531 	ld	(hl), #0x05
                            532 ;src/niveles.c:94: entidad->sprite = (u8*) &G_goblin[0];
   5B52 21 12 00      [10]  533 	ld	hl, #0x0012
   5B55 09            [11]  534 	add	hl, bc
   5B56 01 06 48      [10]  535 	ld	bc, #_G_goblin+0
   5B59 71            [ 7]  536 	ld	(hl), c
   5B5A 23            [ 6]  537 	inc	hl
   5B5B 70            [ 7]  538 	ld	(hl), b
   5B5C DD E1         [14]  539 	pop	ix
   5B5E C9            [10]  540 	ret
   5B5F                     541 ___str_9:
   5B5F 47 6F 62 6C 69 6E   542 	.ascii "Goblin"
   5B65 00                  543 	.db 0x00
                            544 ;src/niveles.c:97: void initPlayer(){
                            545 ;	---------------------------------
                            546 ; Function initPlayer
                            547 ; ---------------------------------
   5B66                     548 _initPlayer::
                            549 ;src/niveles.c:98: strcpy(entidad[0].name,"Don Mendo");
   5B66 11 A0 6E      [10]  550 	ld	de, #_entidad
   5B69 21 A1 5B      [10]  551 	ld	hl, #___str_10
   5B6C AF            [ 4]  552 	xor	a, a
   5B6D                     553 00103$:
   5B6D BE            [ 7]  554 	cp	a, (hl)
   5B6E ED A0         [16]  555 	ldi
   5B70 20 FB         [12]  556 	jr	NZ, 00103$
                            557 ;src/niveles.c:99: entidad[0].max_energy = entidad[0].energy = 99;
   5B72 21 AA 6E      [10]  558 	ld	hl, #(_entidad + 0x000a)
   5B75 36 63         [10]  559 	ld	(hl), #0x63
   5B77 21 AB 6E      [10]  560 	ld	hl, #(_entidad + 0x000b)
   5B7A 36 63         [10]  561 	ld	(hl), #0x63
                            562 ;src/niveles.c:100: entidad[0].attack = 30;
   5B7C 21 AC 6E      [10]  563 	ld	hl, #(_entidad + 0x000c)
   5B7F 36 1E         [10]  564 	ld	(hl), #0x1e
                            565 ;src/niveles.c:101: entidad[0].force = 6;
   5B81 21 AD 6E      [10]  566 	ld	hl, #(_entidad + 0x000d)
   5B84 36 06         [10]  567 	ld	(hl), #0x06
                            568 ;src/niveles.c:102: entidad[0].defense = 15;
   5B86 21 AE 6E      [10]  569 	ld	hl, #(_entidad + 0x000e)
   5B89 36 0F         [10]  570 	ld	(hl), #0x0f
                            571 ;src/niveles.c:103: entidad[0].pos_x = 8;
   5B8B 21 AF 6E      [10]  572 	ld	hl, #(_entidad + 0x000f)
   5B8E 36 08         [10]  573 	ld	(hl), #0x08
                            574 ;src/niveles.c:104: entidad[0].pos_x_ant = 8;
   5B90 21 B0 6E      [10]  575 	ld	hl, #(_entidad + 0x0010)
   5B93 36 08         [10]  576 	ld	(hl), #0x08
                            577 ;src/niveles.c:105: entidad[0].pos_y = 24;
   5B95 21 B1 6E      [10]  578 	ld	hl, #(_entidad + 0x0011)
   5B98 36 18         [10]  579 	ld	(hl), #0x18
                            580 ;src/niveles.c:106: entidad[0].sprite = (u8*) &G_mendo[0];
   5B9A 21 26 3E      [10]  581 	ld	hl, #_G_mendo
   5B9D 22 B2 6E      [16]  582 	ld	((_entidad + 0x0012)), hl
   5BA0 C9            [10]  583 	ret
   5BA1                     584 ___str_10:
   5BA1 44 6F 6E 20 4D 65   585 	.ascii "Don Mendo"
        6E 64 6F
   5BAA 00                  586 	.db 0x00
                            587 ;src/niveles.c:109: void initNivel(){
                            588 ;	---------------------------------
                            589 ; Function initNivel
                            590 ; ---------------------------------
   5BAB                     591 _initNivel::
                            592 ;src/niveles.c:111: entidad[1].max_energy = 0;
   5BAB 21 BF 6E      [10]  593 	ld	hl, #(_entidad + 0x001f)
   5BAE 36 00         [10]  594 	ld	(hl), #0x00
                            595 ;src/niveles.c:112: entidad[1].pos_x_ant = 4;
   5BB0 21 C4 6E      [10]  596 	ld	hl, #(_entidad + 0x0024)
   5BB3 36 04         [10]  597 	ld	(hl), #0x04
                            598 ;src/niveles.c:113: entidad[2].max_energy = 0;
   5BB5 21 D3 6E      [10]  599 	ld	hl, #(_entidad + 0x0033)
   5BB8 36 00         [10]  600 	ld	(hl), #0x00
                            601 ;src/niveles.c:114: entidad[2].pos_x_ant = 4;
   5BBA 21 D8 6E      [10]  602 	ld	hl, #(_entidad + 0x0038)
   5BBD 36 04         [10]  603 	ld	(hl), #0x04
                            604 ;src/niveles.c:117: if (nivel == 1) {
   5BBF 3A DC 6E      [13]  605 	ld	a,(#_nivel + 0)
   5BC2 3D            [ 4]  606 	dec	a
   5BC3 20 08         [12]  607 	jr	NZ,00102$
                            608 ;src/niveles.c:118: initSoldadoArabe1(&entidad[1]);
   5BC5 21 B4 6E      [10]  609 	ld	hl, #(_entidad + 0x0014)
   5BC8 E5            [11]  610 	push	hl
   5BC9 CD 99 58      [17]  611 	call	_initSoldadoArabe1
   5BCC F1            [10]  612 	pop	af
   5BCD                     613 00102$:
                            614 ;src/niveles.c:120: if (nivel == 2) {
   5BCD 3A DC 6E      [13]  615 	ld	a,(#_nivel + 0)
   5BD0 D6 02         [ 7]  616 	sub	a, #0x02
   5BD2 20 0F         [12]  617 	jr	NZ,00104$
                            618 ;src/niveles.c:121: initSoldadoArabe1(&entidad[1]);
   5BD4 21 B4 6E      [10]  619 	ld	hl, #(_entidad + 0x0014)
   5BD7 E5            [11]  620 	push	hl
   5BD8 CD 99 58      [17]  621 	call	_initSoldadoArabe1
                            622 ;src/niveles.c:122: initSoldadoArabe1(&entidad[2]);
   5BDB 21 C8 6E      [10]  623 	ld	hl, #(_entidad + 0x0028)
   5BDE E3            [19]  624 	ex	(sp),hl
   5BDF CD 99 58      [17]  625 	call	_initSoldadoArabe1
   5BE2 F1            [10]  626 	pop	af
   5BE3                     627 00104$:
                            628 ;src/niveles.c:124: if (nivel == 3){
   5BE3 3A DC 6E      [13]  629 	ld	a,(#_nivel + 0)
   5BE6 D6 03         [ 7]  630 	sub	a, #0x03
   5BE8 20 0F         [12]  631 	jr	NZ,00106$
                            632 ;src/niveles.c:125: initAbeja(&entidad[1]);
   5BEA 21 B4 6E      [10]  633 	ld	hl, #(_entidad + 0x0014)
   5BED E5            [11]  634 	push	hl
   5BEE CD BD 59      [17]  635 	call	_initAbeja
                            636 ;src/niveles.c:126: initSoldadoArabe1(&entidad[2]);
   5BF1 21 C8 6E      [10]  637 	ld	hl, #(_entidad + 0x0028)
   5BF4 E3            [19]  638 	ex	(sp),hl
   5BF5 CD 99 58      [17]  639 	call	_initSoldadoArabe1
   5BF8 F1            [10]  640 	pop	af
   5BF9                     641 00106$:
                            642 ;src/niveles.c:128: if (nivel == 4){
   5BF9 3A DC 6E      [13]  643 	ld	a,(#_nivel + 0)
   5BFC D6 04         [ 7]  644 	sub	a, #0x04
   5BFE 20 08         [12]  645 	jr	NZ,00108$
                            646 ;src/niveles.c:129: initSoldadoArabe2(&entidad[1]);
   5C00 21 B4 6E      [10]  647 	ld	hl, #(_entidad + 0x0014)
   5C03 E5            [11]  648 	push	hl
   5C04 CD E3 58      [17]  649 	call	_initSoldadoArabe2
   5C07 F1            [10]  650 	pop	af
   5C08                     651 00108$:
                            652 ;src/niveles.c:131: if (nivel == 6){
   5C08 3A DC 6E      [13]  653 	ld	a,(#_nivel + 0)
   5C0B D6 06         [ 7]  654 	sub	a, #0x06
   5C0D 20 0F         [12]  655 	jr	NZ,00110$
                            656 ;src/niveles.c:132: initAbeja(&entidad[1]);
   5C0F 21 B4 6E      [10]  657 	ld	hl, #(_entidad + 0x0014)
   5C12 E5            [11]  658 	push	hl
   5C13 CD BD 59      [17]  659 	call	_initAbeja
                            660 ;src/niveles.c:133: initFakir(&entidad[2]);
   5C16 21 C8 6E      [10]  661 	ld	hl, #(_entidad + 0x0028)
   5C19 E3            [19]  662 	ex	(sp),hl
   5C1A CD 77 59      [17]  663 	call	_initFakir
   5C1D F1            [10]  664 	pop	af
   5C1E                     665 00110$:
                            666 ;src/niveles.c:135: if (nivel == 7){
   5C1E 3A DC 6E      [13]  667 	ld	a,(#_nivel + 0)
   5C21 D6 07         [ 7]  668 	sub	a, #0x07
   5C23 20 0F         [12]  669 	jr	NZ,00112$
                            670 ;src/niveles.c:136: initSoldadoArabe2(&entidad[1]);
   5C25 21 B4 6E      [10]  671 	ld	hl, #(_entidad + 0x0014)
   5C28 E5            [11]  672 	push	hl
   5C29 CD E3 58      [17]  673 	call	_initSoldadoArabe2
                            674 ;src/niveles.c:137: initSoldadoArabe3(&entidad[2]);
   5C2C 21 C8 6E      [10]  675 	ld	hl, #(_entidad + 0x0028)
   5C2F E3            [19]  676 	ex	(sp),hl
   5C30 CD 2D 59      [17]  677 	call	_initSoldadoArabe3
   5C33 F1            [10]  678 	pop	af
   5C34                     679 00112$:
                            680 ;src/niveles.c:139: if (nivel == 8){
   5C34 3A DC 6E      [13]  681 	ld	a,(#_nivel + 0)
   5C37 D6 08         [ 7]  682 	sub	a, #0x08
   5C39 20 0F         [12]  683 	jr	NZ,00114$
                            684 ;src/niveles.c:140: initFakir(&entidad[1]);
   5C3B 21 B4 6E      [10]  685 	ld	hl, #(_entidad + 0x0014)
   5C3E E5            [11]  686 	push	hl
   5C3F CD 77 59      [17]  687 	call	_initFakir
                            688 ;src/niveles.c:141: initSoldadoArabe2(&entidad[2]);
   5C42 21 C8 6E      [10]  689 	ld	hl, #(_entidad + 0x0028)
   5C45 E3            [19]  690 	ex	(sp),hl
   5C46 CD E3 58      [17]  691 	call	_initSoldadoArabe2
   5C49 F1            [10]  692 	pop	af
   5C4A                     693 00114$:
                            694 ;src/niveles.c:143: if (nivel == 9){
   5C4A 3A DC 6E      [13]  695 	ld	a,(#_nivel + 0)
   5C4D D6 09         [ 7]  696 	sub	a, #0x09
   5C4F 20 0F         [12]  697 	jr	NZ,00116$
                            698 ;src/niveles.c:144: initSoldadoArabe3(&entidad[1]);
   5C51 21 B4 6E      [10]  699 	ld	hl, #(_entidad + 0x0014)
   5C54 E5            [11]  700 	push	hl
   5C55 CD 2D 59      [17]  701 	call	_initSoldadoArabe3
                            702 ;src/niveles.c:145: initSoldadoArabe3(&entidad[2]);
   5C58 21 C8 6E      [10]  703 	ld	hl, #(_entidad + 0x0028)
   5C5B E3            [19]  704 	ex	(sp),hl
   5C5C CD 2D 59      [17]  705 	call	_initSoldadoArabe3
   5C5F F1            [10]  706 	pop	af
   5C60                     707 00116$:
                            708 ;src/niveles.c:150: entidad[2].attack = 40;
                            709 ;src/niveles.c:151: entidad[2].force = 10;
                            710 ;src/niveles.c:152: entidad[2].defense = 25;
                            711 ;src/niveles.c:153: entidad[2].sprite = (u8*) &G_arabe_boss[0];
                            712 ;src/niveles.c:147: if (nivel == 10){
   5C60 FD 21 DC 6E   [14]  713 	ld	iy, #_nivel
   5C64 FD 7E 00      [19]  714 	ld	a, 0 (iy)
   5C67 D6 0A         [ 7]  715 	sub	a, #0x0a
   5C69 20 26         [12]  716 	jr	NZ,00118$
                            717 ;src/niveles.c:148: strcpy(entidad[2].name,"Boss Lvl1");
   5C6B 11 C8 6E      [10]  718 	ld	de, #(_entidad + 0x0028)
   5C6E 21 8E 5D      [10]  719 	ld	hl, #___str_11
   5C71 AF            [ 4]  720 	xor	a, a
   5C72                     721 00229$:
   5C72 BE            [ 7]  722 	cp	a, (hl)
   5C73 ED A0         [16]  723 	ldi
   5C75 20 FB         [12]  724 	jr	NZ, 00229$
                            725 ;src/niveles.c:149: entidad[2].max_energy = 99;
   5C77 21 D3 6E      [10]  726 	ld	hl, #(_entidad + 0x0033)
   5C7A 36 63         [10]  727 	ld	(hl), #0x63
                            728 ;src/niveles.c:150: entidad[2].attack = 40;
   5C7C 21 D4 6E      [10]  729 	ld	hl, #(_entidad + 0x0034)
   5C7F 36 28         [10]  730 	ld	(hl), #0x28
                            731 ;src/niveles.c:151: entidad[2].force = 10;
   5C81 21 D5 6E      [10]  732 	ld	hl, #(_entidad + 0x0035)
   5C84 36 0A         [10]  733 	ld	(hl), #0x0a
                            734 ;src/niveles.c:152: entidad[2].defense = 25;
   5C86 21 D6 6E      [10]  735 	ld	hl, #(_entidad + 0x0036)
   5C89 36 19         [10]  736 	ld	(hl), #0x19
                            737 ;src/niveles.c:153: entidad[2].sprite = (u8*) &G_arabe_boss[0];
   5C8B 21 86 42      [10]  738 	ld	hl, #_G_arabe_boss
   5C8E 22 DA 6E      [16]  739 	ld	((_entidad + 0x003a)), hl
   5C91                     740 00118$:
                            741 ;src/niveles.c:156: if (nivel == 11) {
   5C91 3A DC 6E      [13]  742 	ld	a,(#_nivel + 0)
   5C94 D6 0B         [ 7]  743 	sub	a, #0x0b
   5C96 20 08         [12]  744 	jr	NZ,00120$
                            745 ;src/niveles.c:157: initMurcielago(&entidad[1]);
   5C98 21 B4 6E      [10]  746 	ld	hl, #(_entidad + 0x0014)
   5C9B E5            [11]  747 	push	hl
   5C9C CD 01 5A      [17]  748 	call	_initMurcielago
   5C9F F1            [10]  749 	pop	af
   5CA0                     750 00120$:
                            751 ;src/niveles.c:159: if (nivel == 12) {
   5CA0 3A DC 6E      [13]  752 	ld	a,(#_nivel + 0)
   5CA3 D6 0C         [ 7]  753 	sub	a, #0x0c
   5CA5 20 0F         [12]  754 	jr	NZ,00122$
                            755 ;src/niveles.c:160: initMurcielago(&entidad[1]);
   5CA7 21 B4 6E      [10]  756 	ld	hl, #(_entidad + 0x0014)
   5CAA E5            [11]  757 	push	hl
   5CAB CD 01 5A      [17]  758 	call	_initMurcielago
                            759 ;src/niveles.c:161: initEsqueleto(&entidad[2]);
   5CAE 21 C8 6E      [10]  760 	ld	hl, #(_entidad + 0x0028)
   5CB1 E3            [19]  761 	ex	(sp),hl
   5CB2 CD 4A 5A      [17]  762 	call	_initEsqueleto
   5CB5 F1            [10]  763 	pop	af
   5CB6                     764 00122$:
                            765 ;src/niveles.c:163: if (nivel == 13){
   5CB6 3A DC 6E      [13]  766 	ld	a,(#_nivel + 0)
   5CB9 D6 0D         [ 7]  767 	sub	a, #0x0d
   5CBB 20 0F         [12]  768 	jr	NZ,00124$
                            769 ;src/niveles.c:164: initEsqueleto(&entidad[1]);
   5CBD 21 B4 6E      [10]  770 	ld	hl, #(_entidad + 0x0014)
   5CC0 E5            [11]  771 	push	hl
   5CC1 CD 4A 5A      [17]  772 	call	_initEsqueleto
                            773 ;src/niveles.c:165: initEsqueleto(&entidad[2]);
   5CC4 21 C8 6E      [10]  774 	ld	hl, #(_entidad + 0x0028)
   5CC7 E3            [19]  775 	ex	(sp),hl
   5CC8 CD 4A 5A      [17]  776 	call	_initEsqueleto
   5CCB F1            [10]  777 	pop	af
   5CCC                     778 00124$:
                            779 ;src/niveles.c:167: if (nivel == 14){
   5CCC 3A DC 6E      [13]  780 	ld	a,(#_nivel + 0)
   5CCF D6 0E         [ 7]  781 	sub	a, #0x0e
   5CD1 20 0F         [12]  782 	jr	NZ,00126$
                            783 ;src/niveles.c:168: initMurcielago(&entidad[1]);
   5CD3 21 B4 6E      [10]  784 	ld	hl, #(_entidad + 0x0014)
   5CD6 E5            [11]  785 	push	hl
   5CD7 CD 01 5A      [17]  786 	call	_initMurcielago
                            787 ;src/niveles.c:169: initGusano(&entidad[2]);
   5CDA 21 C8 6E      [10]  788 	ld	hl, #(_entidad + 0x0028)
   5CDD E3            [19]  789 	ex	(sp),hl
   5CDE CD 93 5A      [17]  790 	call	_initGusano
   5CE1 F1            [10]  791 	pop	af
   5CE2                     792 00126$:
                            793 ;src/niveles.c:171: if (nivel == 16){
   5CE2 3A DC 6E      [13]  794 	ld	a,(#_nivel + 0)
   5CE5 D6 10         [ 7]  795 	sub	a, #0x10
   5CE7 20 0F         [12]  796 	jr	NZ,00128$
                            797 ;src/niveles.c:172: initEsqueleto(&entidad[1]);
   5CE9 21 B4 6E      [10]  798 	ld	hl, #(_entidad + 0x0014)
   5CEC E5            [11]  799 	push	hl
   5CED CD 4A 5A      [17]  800 	call	_initEsqueleto
                            801 ;src/niveles.c:173: initGusano(&entidad[2]);
   5CF0 21 C8 6E      [10]  802 	ld	hl, #(_entidad + 0x0028)
   5CF3 E3            [19]  803 	ex	(sp),hl
   5CF4 CD 93 5A      [17]  804 	call	_initGusano
   5CF7 F1            [10]  805 	pop	af
   5CF8                     806 00128$:
                            807 ;src/niveles.c:175: if (nivel == 17){
   5CF8 3A DC 6E      [13]  808 	ld	a,(#_nivel + 0)
   5CFB D6 11         [ 7]  809 	sub	a, #0x11
   5CFD 20 0F         [12]  810 	jr	NZ,00130$
                            811 ;src/niveles.c:176: initSpider(&entidad[1]);
   5CFF 21 B4 6E      [10]  812 	ld	hl, #(_entidad + 0x0014)
   5D02 E5            [11]  813 	push	hl
   5D03 CD D8 5A      [17]  814 	call	_initSpider
                            815 ;src/niveles.c:177: initSpider(&entidad[2]);
   5D06 21 C8 6E      [10]  816 	ld	hl, #(_entidad + 0x0028)
   5D09 E3            [19]  817 	ex	(sp),hl
   5D0A CD D8 5A      [17]  818 	call	_initSpider
   5D0D F1            [10]  819 	pop	af
   5D0E                     820 00130$:
                            821 ;src/niveles.c:179: if (nivel == 18){
   5D0E 3A DC 6E      [13]  822 	ld	a,(#_nivel + 0)
   5D11 D6 12         [ 7]  823 	sub	a, #0x12
   5D13 20 0F         [12]  824 	jr	NZ,00132$
                            825 ;src/niveles.c:180: initGoblin(&entidad[1]);
   5D15 21 B4 6E      [10]  826 	ld	hl, #(_entidad + 0x0014)
   5D18 E5            [11]  827 	push	hl
   5D19 CD 1F 5B      [17]  828 	call	_initGoblin
                            829 ;src/niveles.c:181: initGoblin(&entidad[2]);
   5D1C 21 C8 6E      [10]  830 	ld	hl, #(_entidad + 0x0028)
   5D1F E3            [19]  831 	ex	(sp),hl
   5D20 CD 1F 5B      [17]  832 	call	_initGoblin
   5D23 F1            [10]  833 	pop	af
   5D24                     834 00132$:
                            835 ;src/niveles.c:183: if (nivel == 19){
   5D24 3A DC 6E      [13]  836 	ld	a,(#_nivel + 0)
   5D27 D6 13         [ 7]  837 	sub	a, #0x13
   5D29 20 0F         [12]  838 	jr	NZ,00134$
                            839 ;src/niveles.c:184: initGoblin(&entidad[1]);
   5D2B 21 B4 6E      [10]  840 	ld	hl, #(_entidad + 0x0014)
   5D2E E5            [11]  841 	push	hl
   5D2F CD 1F 5B      [17]  842 	call	_initGoblin
                            843 ;src/niveles.c:185: initSpider(&entidad[2]);
   5D32 21 C8 6E      [10]  844 	ld	hl, #(_entidad + 0x0028)
   5D35 E3            [19]  845 	ex	(sp),hl
   5D36 CD D8 5A      [17]  846 	call	_initSpider
   5D39 F1            [10]  847 	pop	af
   5D3A                     848 00134$:
                            849 ;src/niveles.c:187: if (nivel == 20){
   5D3A FD 21 DC 6E   [14]  850 	ld	iy, #_nivel
   5D3E FD 7E 00      [19]  851 	ld	a, 0 (iy)
   5D41 D6 14         [ 7]  852 	sub	a, #0x14
   5D43 20 26         [12]  853 	jr	NZ,00136$
                            854 ;src/niveles.c:188: strcpy(entidad[2].name,"Boss Lvl2");
   5D45 11 C8 6E      [10]  855 	ld	de, #(_entidad + 0x0028)
   5D48 21 98 5D      [10]  856 	ld	hl, #___str_12
   5D4B AF            [ 4]  857 	xor	a, a
   5D4C                     858 00248$:
   5D4C BE            [ 7]  859 	cp	a, (hl)
   5D4D ED A0         [16]  860 	ldi
   5D4F 20 FB         [12]  861 	jr	NZ, 00248$
                            862 ;src/niveles.c:189: entidad[2].max_energy = 99;
   5D51 21 D3 6E      [10]  863 	ld	hl, #(_entidad + 0x0033)
   5D54 36 63         [10]  864 	ld	(hl), #0x63
                            865 ;src/niveles.c:190: entidad[2].attack = 40;
   5D56 21 D4 6E      [10]  866 	ld	hl, #(_entidad + 0x0034)
   5D59 36 28         [10]  867 	ld	(hl), #0x28
                            868 ;src/niveles.c:191: entidad[2].force = 10;
   5D5B 21 D5 6E      [10]  869 	ld	hl, #(_entidad + 0x0035)
   5D5E 36 0A         [10]  870 	ld	(hl), #0x0a
                            871 ;src/niveles.c:192: entidad[2].defense = 25;
   5D60 21 D6 6E      [10]  872 	ld	hl, #(_entidad + 0x0036)
   5D63 36 19         [10]  873 	ld	(hl), #0x19
                            874 ;src/niveles.c:193: entidad[2].sprite = (u8*) &G_cavern_boss[0];
   5D65 21 E6 48      [10]  875 	ld	hl, #_G_cavern_boss
   5D68 22 DA 6E      [16]  876 	ld	((_entidad + 0x003a)), hl
   5D6B                     877 00136$:
                            878 ;src/niveles.c:196: entidad[1].pos_x = 28;  //Posición del sprite en pantalla
   5D6B 21 C3 6E      [10]  879 	ld	hl, #(_entidad + 0x0023)
   5D6E 36 1C         [10]  880 	ld	(hl), #0x1c
                            881 ;src/niveles.c:197: entidad[2].pos_x = 36;
   5D70 21 D7 6E      [10]  882 	ld	hl, #(_entidad + 0x0037)
   5D73 36 24         [10]  883 	ld	(hl), #0x24
                            884 ;src/niveles.c:198: entidad[1].pos_y = 32;  //Posición en el marcador
   5D75 21 C5 6E      [10]  885 	ld	hl, #(_entidad + 0x0025)
   5D78 36 20         [10]  886 	ld	(hl), #0x20
                            887 ;src/niveles.c:199: entidad[2].pos_y = 40;  //
   5D7A 21 D9 6E      [10]  888 	ld	hl, #(_entidad + 0x0039)
   5D7D 36 28         [10]  889 	ld	(hl), #0x28
                            890 ;src/niveles.c:200: entidad[1].energy = entidad[1].max_energy;
   5D7F 01 BE 6E      [10]  891 	ld	bc, #_entidad + 30
   5D82 3A BF 6E      [13]  892 	ld	a, (#(_entidad + 0x001f) + 0)
   5D85 02            [ 7]  893 	ld	(bc), a
                            894 ;src/niveles.c:201: entidad[2].energy = entidad[2].max_energy;
   5D86 01 D2 6E      [10]  895 	ld	bc, #_entidad + 50
   5D89 3A D3 6E      [13]  896 	ld	a, (#(_entidad + 0x0033) + 0)
   5D8C 02            [ 7]  897 	ld	(bc), a
   5D8D C9            [10]  898 	ret
   5D8E                     899 ___str_11:
   5D8E 42 6F 73 73 20 4C   900 	.ascii "Boss Lvl1"
        76 6C 31
   5D97 00                  901 	.db 0x00
   5D98                     902 ___str_12:
   5D98 42 6F 73 73 20 4C   903 	.ascii "Boss Lvl2"
        76 6C 32
   5DA1 00                  904 	.db 0x00
                            905 	.area _CODE
                            906 	.area _INITIALIZER
                            907 	.area _CABS (ABS)
