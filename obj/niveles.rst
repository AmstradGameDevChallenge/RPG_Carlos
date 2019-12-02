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
                             13 	.globl _initMago
                             14 	.globl _initCarcelero
                             15 	.globl _initCaballero
                             16 	.globl _initSoldado2
                             17 	.globl _initSoldado1
                             18 	.globl _initGoblin
                             19 	.globl _initSpider
                             20 	.globl _initGusano
                             21 	.globl _initEsqueleto
                             22 	.globl _initMurcielago
                             23 	.globl _initAbeja
                             24 	.globl _initFakir
                             25 	.globl _initSoldadoArabe3
                             26 	.globl _initSoldadoArabe2
                             27 	.globl _initSoldadoArabe1
                             28 ;--------------------------------------------------------
                             29 ; special function registers
                             30 ;--------------------------------------------------------
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DATA
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _INITIALIZED
                             39 ;--------------------------------------------------------
                             40 ; absolute external ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DABS (ABS)
                             43 ;--------------------------------------------------------
                             44 ; global & static initialisations
                             45 ;--------------------------------------------------------
                             46 	.area _HOME
                             47 	.area _GSINIT
                             48 	.area _GSFINAL
                             49 	.area _GSINIT
                             50 ;--------------------------------------------------------
                             51 ; Home
                             52 ;--------------------------------------------------------
                             53 	.area _HOME
                             54 	.area _HOME
                             55 ;--------------------------------------------------------
                             56 ; code
                             57 ;--------------------------------------------------------
                             58 	.area _CODE
                             59 ;src/niveles.c:7: void initSoldadoArabe1(TStats *entidad) {
                             60 ;	---------------------------------
                             61 ; Function initSoldadoArabe1
                             62 ; ---------------------------------
   8102                      63 _initSoldadoArabe1::
   8102 DD E5         [15]   64 	push	ix
   8104 DD 21 00 00   [14]   65 	ld	ix,#0
   8108 DD 39         [15]   66 	add	ix,sp
                             67 ;src/niveles.c:8: strcpy(entidad->name,"Soldier 1");
   810A DD 4E 04      [19]   68 	ld	c,4 (ix)
   810D DD 46 05      [19]   69 	ld	b,5 (ix)
   8110 59            [ 4]   70 	ld	e, c
   8111 50            [ 4]   71 	ld	d, b
   8112 13            [ 6]   72 	inc	de
   8113 C5            [11]   73 	push	bc
   8114 21 43 81      [10]   74 	ld	hl, #___str_0
   8117 AF            [ 4]   75 	xor	a, a
   8118                      76 00103$:
   8118 BE            [ 7]   77 	cp	a, (hl)
   8119 ED A0         [16]   78 	ldi
   811B 20 FB         [12]   79 	jr	NZ, 00103$
   811D C1            [10]   80 	pop	bc
                             81 ;src/niveles.c:9: entidad->max_energy = 60;
   811E 21 0C 00      [10]   82 	ld	hl, #0x000c
   8121 09            [11]   83 	add	hl, bc
   8122 36 3C         [10]   84 	ld	(hl), #0x3c
                             85 ;src/niveles.c:10: entidad->attack = 10;
   8124 21 0D 00      [10]   86 	ld	hl, #0x000d
   8127 09            [11]   87 	add	hl, bc
   8128 36 0A         [10]   88 	ld	(hl), #0x0a
                             89 ;src/niveles.c:11: entidad->force = 5;
   812A 21 0E 00      [10]   90 	ld	hl, #0x000e
   812D 09            [11]   91 	add	hl, bc
   812E 36 05         [10]   92 	ld	(hl), #0x05
                             93 ;src/niveles.c:12: entidad->defense = 10;
   8130 21 0F 00      [10]   94 	ld	hl, #0x000f
   8133 09            [11]   95 	add	hl, bc
   8134 36 0A         [10]   96 	ld	(hl), #0x0a
                             97 ;src/niveles.c:13: entidad->sprite = (u8*) &G_arabe_1[0];
   8136 21 13 00      [10]   98 	ld	hl, #0x0013
   8139 09            [11]   99 	add	hl, bc
   813A 01 69 65      [10]  100 	ld	bc, #_G_arabe_1+0
   813D 71            [ 7]  101 	ld	(hl), c
   813E 23            [ 6]  102 	inc	hl
   813F 70            [ 7]  103 	ld	(hl), b
   8140 DD E1         [14]  104 	pop	ix
   8142 C9            [10]  105 	ret
   8143                     106 ___str_0:
   8143 53 6F 6C 64 69 65   107 	.ascii "Soldier 1"
        72 20 31
   814C 00                  108 	.db 0x00
                            109 ;src/niveles.c:16: void initSoldadoArabe2(TStats *entidad) {
                            110 ;	---------------------------------
                            111 ; Function initSoldadoArabe2
                            112 ; ---------------------------------
   814D                     113 _initSoldadoArabe2::
   814D DD E5         [15]  114 	push	ix
   814F DD 21 00 00   [14]  115 	ld	ix,#0
   8153 DD 39         [15]  116 	add	ix,sp
                            117 ;src/niveles.c:17: strcpy(entidad->name,"Soldier 2");
   8155 DD 4E 04      [19]  118 	ld	c,4 (ix)
   8158 DD 46 05      [19]  119 	ld	b,5 (ix)
   815B 59            [ 4]  120 	ld	e, c
   815C 50            [ 4]  121 	ld	d, b
   815D 13            [ 6]  122 	inc	de
   815E C5            [11]  123 	push	bc
   815F 21 8E 81      [10]  124 	ld	hl, #___str_1
   8162 AF            [ 4]  125 	xor	a, a
   8163                     126 00103$:
   8163 BE            [ 7]  127 	cp	a, (hl)
   8164 ED A0         [16]  128 	ldi
   8166 20 FB         [12]  129 	jr	NZ, 00103$
   8168 C1            [10]  130 	pop	bc
                            131 ;src/niveles.c:18: entidad->max_energy = 60;
   8169 21 0C 00      [10]  132 	ld	hl, #0x000c
   816C 09            [11]  133 	add	hl, bc
   816D 36 3C         [10]  134 	ld	(hl), #0x3c
                            135 ;src/niveles.c:19: entidad->attack = 15;
   816F 21 0D 00      [10]  136 	ld	hl, #0x000d
   8172 09            [11]  137 	add	hl, bc
   8173 36 0F         [10]  138 	ld	(hl), #0x0f
                            139 ;src/niveles.c:20: entidad->force = 10;
   8175 21 0E 00      [10]  140 	ld	hl, #0x000e
   8178 09            [11]  141 	add	hl, bc
   8179 36 0A         [10]  142 	ld	(hl), #0x0a
                            143 ;src/niveles.c:21: entidad->defense = 5;
   817B 21 0F 00      [10]  144 	ld	hl, #0x000f
   817E 09            [11]  145 	add	hl, bc
   817F 36 05         [10]  146 	ld	(hl), #0x05
                            147 ;src/niveles.c:22: entidad->sprite = (u8*) &G_arabe_2[0];
   8181 21 13 00      [10]  148 	ld	hl, #0x0013
   8184 09            [11]  149 	add	hl, bc
   8185 01 49 66      [10]  150 	ld	bc, #_G_arabe_2+0
   8188 71            [ 7]  151 	ld	(hl), c
   8189 23            [ 6]  152 	inc	hl
   818A 70            [ 7]  153 	ld	(hl), b
   818B DD E1         [14]  154 	pop	ix
   818D C9            [10]  155 	ret
   818E                     156 ___str_1:
   818E 53 6F 6C 64 69 65   157 	.ascii "Soldier 2"
        72 20 32
   8197 00                  158 	.db 0x00
                            159 ;src/niveles.c:25: void initSoldadoArabe3(TStats *entidad) {
                            160 ;	---------------------------------
                            161 ; Function initSoldadoArabe3
                            162 ; ---------------------------------
   8198                     163 _initSoldadoArabe3::
   8198 DD E5         [15]  164 	push	ix
   819A DD 21 00 00   [14]  165 	ld	ix,#0
   819E DD 39         [15]  166 	add	ix,sp
                            167 ;src/niveles.c:26: strcpy(entidad->name,"Soldier 3");
   81A0 DD 4E 04      [19]  168 	ld	c,4 (ix)
   81A3 DD 46 05      [19]  169 	ld	b,5 (ix)
   81A6 59            [ 4]  170 	ld	e, c
   81A7 50            [ 4]  171 	ld	d, b
   81A8 13            [ 6]  172 	inc	de
   81A9 C5            [11]  173 	push	bc
   81AA 21 D9 81      [10]  174 	ld	hl, #___str_2
   81AD AF            [ 4]  175 	xor	a, a
   81AE                     176 00103$:
   81AE BE            [ 7]  177 	cp	a, (hl)
   81AF ED A0         [16]  178 	ldi
   81B1 20 FB         [12]  179 	jr	NZ, 00103$
   81B3 C1            [10]  180 	pop	bc
                            181 ;src/niveles.c:27: entidad->max_energy = 40;
   81B4 21 0C 00      [10]  182 	ld	hl, #0x000c
   81B7 09            [11]  183 	add	hl, bc
   81B8 36 28         [10]  184 	ld	(hl), #0x28
                            185 ;src/niveles.c:28: entidad->attack = 3;
   81BA 21 0D 00      [10]  186 	ld	hl, #0x000d
   81BD 09            [11]  187 	add	hl, bc
   81BE 36 03         [10]  188 	ld	(hl), #0x03
                            189 ;src/niveles.c:29: entidad->force = 2;
   81C0 21 0E 00      [10]  190 	ld	hl, #0x000e
   81C3 09            [11]  191 	add	hl, bc
   81C4 36 02         [10]  192 	ld	(hl), #0x02
                            193 ;src/niveles.c:30: entidad->defense = 0;
   81C6 21 0F 00      [10]  194 	ld	hl, #0x000f
   81C9 09            [11]  195 	add	hl, bc
   81CA 36 00         [10]  196 	ld	(hl), #0x00
                            197 ;src/niveles.c:31: entidad->sprite = (u8*) &G_arabe_3[0];
   81CC 21 13 00      [10]  198 	ld	hl, #0x0013
   81CF 09            [11]  199 	add	hl, bc
   81D0 01 29 67      [10]  200 	ld	bc, #_G_arabe_3+0
   81D3 71            [ 7]  201 	ld	(hl), c
   81D4 23            [ 6]  202 	inc	hl
   81D5 70            [ 7]  203 	ld	(hl), b
   81D6 DD E1         [14]  204 	pop	ix
   81D8 C9            [10]  205 	ret
   81D9                     206 ___str_2:
   81D9 53 6F 6C 64 69 65   207 	.ascii "Soldier 3"
        72 20 33
   81E2 00                  208 	.db 0x00
                            209 ;src/niveles.c:34: void initFakir(TStats *entidad) {
                            210 ;	---------------------------------
                            211 ; Function initFakir
                            212 ; ---------------------------------
   81E3                     213 _initFakir::
   81E3 DD E5         [15]  214 	push	ix
   81E5 DD 21 00 00   [14]  215 	ld	ix,#0
   81E9 DD 39         [15]  216 	add	ix,sp
                            217 ;src/niveles.c:35: strcpy(entidad->name,"Fakir");
   81EB DD 4E 04      [19]  218 	ld	c,4 (ix)
   81EE DD 46 05      [19]  219 	ld	b,5 (ix)
   81F1 59            [ 4]  220 	ld	e, c
   81F2 50            [ 4]  221 	ld	d, b
   81F3 13            [ 6]  222 	inc	de
   81F4 C5            [11]  223 	push	bc
   81F5 21 24 82      [10]  224 	ld	hl, #___str_3
   81F8 AF            [ 4]  225 	xor	a, a
   81F9                     226 00103$:
   81F9 BE            [ 7]  227 	cp	a, (hl)
   81FA ED A0         [16]  228 	ldi
   81FC 20 FB         [12]  229 	jr	NZ, 00103$
   81FE C1            [10]  230 	pop	bc
                            231 ;src/niveles.c:36: entidad->max_energy = 30;
   81FF 21 0C 00      [10]  232 	ld	hl, #0x000c
   8202 09            [11]  233 	add	hl, bc
   8203 36 1E         [10]  234 	ld	(hl), #0x1e
                            235 ;src/niveles.c:37: entidad->attack = 30;
   8205 21 0D 00      [10]  236 	ld	hl, #0x000d
   8208 09            [11]  237 	add	hl, bc
   8209 36 1E         [10]  238 	ld	(hl), #0x1e
                            239 ;src/niveles.c:38: entidad->force = 5;
   820B 21 0E 00      [10]  240 	ld	hl, #0x000e
   820E 09            [11]  241 	add	hl, bc
   820F 36 05         [10]  242 	ld	(hl), #0x05
                            243 ;src/niveles.c:39: entidad->defense = 0;
   8211 21 0F 00      [10]  244 	ld	hl, #0x000f
   8214 09            [11]  245 	add	hl, bc
   8215 36 00         [10]  246 	ld	(hl), #0x00
                            247 ;src/niveles.c:40: entidad->sprite = (u8*) &G_fakir[0];
   8217 21 13 00      [10]  248 	ld	hl, #0x0013
   821A 09            [11]  249 	add	hl, bc
   821B 01 09 68      [10]  250 	ld	bc, #_G_fakir+0
   821E 71            [ 7]  251 	ld	(hl), c
   821F 23            [ 6]  252 	inc	hl
   8220 70            [ 7]  253 	ld	(hl), b
   8221 DD E1         [14]  254 	pop	ix
   8223 C9            [10]  255 	ret
   8224                     256 ___str_3:
   8224 46 61 6B 69 72      257 	.ascii "Fakir"
   8229 00                  258 	.db 0x00
                            259 ;src/niveles.c:43: void initAbeja(TStats *entidad) {
                            260 ;	---------------------------------
                            261 ; Function initAbeja
                            262 ; ---------------------------------
   822A                     263 _initAbeja::
   822A DD E5         [15]  264 	push	ix
   822C DD 21 00 00   [14]  265 	ld	ix,#0
   8230 DD 39         [15]  266 	add	ix,sp
                            267 ;src/niveles.c:44: strcpy(entidad->name,"Bee");
   8232 DD 4E 04      [19]  268 	ld	c,4 (ix)
   8235 DD 46 05      [19]  269 	ld	b,5 (ix)
   8238 59            [ 4]  270 	ld	e, c
   8239 50            [ 4]  271 	ld	d, b
   823A 13            [ 6]  272 	inc	de
   823B C5            [11]  273 	push	bc
   823C 21 6B 82      [10]  274 	ld	hl, #___str_4
   823F AF            [ 4]  275 	xor	a, a
   8240                     276 00103$:
   8240 BE            [ 7]  277 	cp	a, (hl)
   8241 ED A0         [16]  278 	ldi
   8243 20 FB         [12]  279 	jr	NZ, 00103$
   8245 C1            [10]  280 	pop	bc
                            281 ;src/niveles.c:45: entidad->max_energy = 50;
   8246 21 0C 00      [10]  282 	ld	hl, #0x000c
   8249 09            [11]  283 	add	hl, bc
   824A 36 32         [10]  284 	ld	(hl), #0x32
                            285 ;src/niveles.c:46: entidad->attack = 10;
   824C 21 0D 00      [10]  286 	ld	hl, #0x000d
   824F 09            [11]  287 	add	hl, bc
   8250 36 0A         [10]  288 	ld	(hl), #0x0a
                            289 ;src/niveles.c:47: entidad->force = 5;
   8252 21 0E 00      [10]  290 	ld	hl, #0x000e
   8255 09            [11]  291 	add	hl, bc
   8256 36 05         [10]  292 	ld	(hl), #0x05
                            293 ;src/niveles.c:48: entidad->defense = 20;
   8258 21 0F 00      [10]  294 	ld	hl, #0x000f
   825B 09            [11]  295 	add	hl, bc
   825C 36 14         [10]  296 	ld	(hl), #0x14
                            297 ;src/niveles.c:49: entidad->sprite = (u8*) &G_abeja[0];
   825E 21 13 00      [10]  298 	ld	hl, #0x0013
   8261 09            [11]  299 	add	hl, bc
   8262 01 C9 69      [10]  300 	ld	bc, #_G_abeja+0
   8265 71            [ 7]  301 	ld	(hl), c
   8266 23            [ 6]  302 	inc	hl
   8267 70            [ 7]  303 	ld	(hl), b
   8268 DD E1         [14]  304 	pop	ix
   826A C9            [10]  305 	ret
   826B                     306 ___str_4:
   826B 42 65 65            307 	.ascii "Bee"
   826E 00                  308 	.db 0x00
                            309 ;src/niveles.c:52: void initMurcielago(TStats *entidad) {
                            310 ;	---------------------------------
                            311 ; Function initMurcielago
                            312 ; ---------------------------------
   826F                     313 _initMurcielago::
   826F DD E5         [15]  314 	push	ix
   8271 DD 21 00 00   [14]  315 	ld	ix,#0
   8275 DD 39         [15]  316 	add	ix,sp
                            317 ;src/niveles.c:53: strcpy(entidad->name,"Evil Bat");
   8277 DD 4E 04      [19]  318 	ld	c,4 (ix)
   827A DD 46 05      [19]  319 	ld	b,5 (ix)
   827D 59            [ 4]  320 	ld	e, c
   827E 50            [ 4]  321 	ld	d, b
   827F 13            [ 6]  322 	inc	de
   8280 C5            [11]  323 	push	bc
   8281 21 B0 82      [10]  324 	ld	hl, #___str_5
   8284 AF            [ 4]  325 	xor	a, a
   8285                     326 00103$:
   8285 BE            [ 7]  327 	cp	a, (hl)
   8286 ED A0         [16]  328 	ldi
   8288 20 FB         [12]  329 	jr	NZ, 00103$
   828A C1            [10]  330 	pop	bc
                            331 ;src/niveles.c:54: entidad->max_energy = 60;
   828B 21 0C 00      [10]  332 	ld	hl, #0x000c
   828E 09            [11]  333 	add	hl, bc
   828F 36 3C         [10]  334 	ld	(hl), #0x3c
                            335 ;src/niveles.c:55: entidad->attack = 15;
   8291 21 0D 00      [10]  336 	ld	hl, #0x000d
   8294 09            [11]  337 	add	hl, bc
   8295 36 0F         [10]  338 	ld	(hl), #0x0f
                            339 ;src/niveles.c:56: entidad->force = 5;
   8297 21 0E 00      [10]  340 	ld	hl, #0x000e
   829A 09            [11]  341 	add	hl, bc
   829B 36 05         [10]  342 	ld	(hl), #0x05
                            343 ;src/niveles.c:57: entidad->defense = 20;
   829D 21 0F 00      [10]  344 	ld	hl, #0x000f
   82A0 09            [11]  345 	add	hl, bc
   82A1 36 14         [10]  346 	ld	(hl), #0x14
                            347 ;src/niveles.c:58: entidad->sprite = (u8*) &G_murcielago[0];
   82A3 21 13 00      [10]  348 	ld	hl, #0x0013
   82A6 09            [11]  349 	add	hl, bc
   82A7 01 E9 6A      [10]  350 	ld	bc, #_G_murcielago+0
   82AA 71            [ 7]  351 	ld	(hl), c
   82AB 23            [ 6]  352 	inc	hl
   82AC 70            [ 7]  353 	ld	(hl), b
   82AD DD E1         [14]  354 	pop	ix
   82AF C9            [10]  355 	ret
   82B0                     356 ___str_5:
   82B0 45 76 69 6C 20 42   357 	.ascii "Evil Bat"
        61 74
   82B8 00                  358 	.db 0x00
                            359 ;src/niveles.c:61: void initEsqueleto(TStats *entidad) {
                            360 ;	---------------------------------
                            361 ; Function initEsqueleto
                            362 ; ---------------------------------
   82B9                     363 _initEsqueleto::
   82B9 DD E5         [15]  364 	push	ix
   82BB DD 21 00 00   [14]  365 	ld	ix,#0
   82BF DD 39         [15]  366 	add	ix,sp
                            367 ;src/niveles.c:62: strcpy(entidad->name,"Skeleton");
   82C1 DD 4E 04      [19]  368 	ld	c,4 (ix)
   82C4 DD 46 05      [19]  369 	ld	b,5 (ix)
   82C7 59            [ 4]  370 	ld	e, c
   82C8 50            [ 4]  371 	ld	d, b
   82C9 13            [ 6]  372 	inc	de
   82CA C5            [11]  373 	push	bc
   82CB 21 FA 82      [10]  374 	ld	hl, #___str_6
   82CE AF            [ 4]  375 	xor	a, a
   82CF                     376 00103$:
   82CF BE            [ 7]  377 	cp	a, (hl)
   82D0 ED A0         [16]  378 	ldi
   82D2 20 FB         [12]  379 	jr	NZ, 00103$
   82D4 C1            [10]  380 	pop	bc
                            381 ;src/niveles.c:63: entidad->max_energy = 70;
   82D5 21 0C 00      [10]  382 	ld	hl, #0x000c
   82D8 09            [11]  383 	add	hl, bc
   82D9 36 46         [10]  384 	ld	(hl), #0x46
                            385 ;src/niveles.c:64: entidad->attack = 10;
   82DB 21 0D 00      [10]  386 	ld	hl, #0x000d
   82DE 09            [11]  387 	add	hl, bc
   82DF 36 0A         [10]  388 	ld	(hl), #0x0a
                            389 ;src/niveles.c:65: entidad->force = 7;
   82E1 21 0E 00      [10]  390 	ld	hl, #0x000e
   82E4 09            [11]  391 	add	hl, bc
   82E5 36 07         [10]  392 	ld	(hl), #0x07
                            393 ;src/niveles.c:66: entidad->defense = 5;
   82E7 21 0F 00      [10]  394 	ld	hl, #0x000f
   82EA 09            [11]  395 	add	hl, bc
   82EB 36 05         [10]  396 	ld	(hl), #0x05
                            397 ;src/niveles.c:67: entidad->sprite = (u8*) &G_esqueleto[0];
   82ED 21 13 00      [10]  398 	ld	hl, #0x0013
   82F0 09            [11]  399 	add	hl, bc
   82F1 01 C9 6B      [10]  400 	ld	bc, #_G_esqueleto+0
   82F4 71            [ 7]  401 	ld	(hl), c
   82F5 23            [ 6]  402 	inc	hl
   82F6 70            [ 7]  403 	ld	(hl), b
   82F7 DD E1         [14]  404 	pop	ix
   82F9 C9            [10]  405 	ret
   82FA                     406 ___str_6:
   82FA 53 6B 65 6C 65 74   407 	.ascii "Skeleton"
        6F 6E
   8302 00                  408 	.db 0x00
                            409 ;src/niveles.c:70: void initGusano(TStats *entidad) {
                            410 ;	---------------------------------
                            411 ; Function initGusano
                            412 ; ---------------------------------
   8303                     413 _initGusano::
   8303 DD E5         [15]  414 	push	ix
   8305 DD 21 00 00   [14]  415 	ld	ix,#0
   8309 DD 39         [15]  416 	add	ix,sp
                            417 ;src/niveles.c:71: strcpy(entidad->name,"Worm");
   830B DD 4E 04      [19]  418 	ld	c,4 (ix)
   830E DD 46 05      [19]  419 	ld	b,5 (ix)
   8311 59            [ 4]  420 	ld	e, c
   8312 50            [ 4]  421 	ld	d, b
   8313 13            [ 6]  422 	inc	de
   8314 C5            [11]  423 	push	bc
   8315 21 44 83      [10]  424 	ld	hl, #___str_7
   8318 AF            [ 4]  425 	xor	a, a
   8319                     426 00103$:
   8319 BE            [ 7]  427 	cp	a, (hl)
   831A ED A0         [16]  428 	ldi
   831C 20 FB         [12]  429 	jr	NZ, 00103$
   831E C1            [10]  430 	pop	bc
                            431 ;src/niveles.c:72: entidad->max_energy = 40;
   831F 21 0C 00      [10]  432 	ld	hl, #0x000c
   8322 09            [11]  433 	add	hl, bc
   8323 36 28         [10]  434 	ld	(hl), #0x28
                            435 ;src/niveles.c:73: entidad->attack = 30;
   8325 21 0D 00      [10]  436 	ld	hl, #0x000d
   8328 09            [11]  437 	add	hl, bc
   8329 36 1E         [10]  438 	ld	(hl), #0x1e
                            439 ;src/niveles.c:74: entidad->force = 5;
   832B 21 0E 00      [10]  440 	ld	hl, #0x000e
   832E 09            [11]  441 	add	hl, bc
   832F 36 05         [10]  442 	ld	(hl), #0x05
                            443 ;src/niveles.c:75: entidad->defense = 0;
   8331 21 0F 00      [10]  444 	ld	hl, #0x000f
   8334 09            [11]  445 	add	hl, bc
   8335 36 00         [10]  446 	ld	(hl), #0x00
                            447 ;src/niveles.c:76: entidad->sprite = (u8*) &G_gusano[0];
   8337 21 13 00      [10]  448 	ld	hl, #0x0013
   833A 09            [11]  449 	add	hl, bc
   833B 01 A9 6C      [10]  450 	ld	bc, #_G_gusano+0
   833E 71            [ 7]  451 	ld	(hl), c
   833F 23            [ 6]  452 	inc	hl
   8340 70            [ 7]  453 	ld	(hl), b
   8341 DD E1         [14]  454 	pop	ix
   8343 C9            [10]  455 	ret
   8344                     456 ___str_7:
   8344 57 6F 72 6D         457 	.ascii "Worm"
   8348 00                  458 	.db 0x00
                            459 ;src/niveles.c:79: void initSpider(TStats *entidad) {
                            460 ;	---------------------------------
                            461 ; Function initSpider
                            462 ; ---------------------------------
   8349                     463 _initSpider::
   8349 DD E5         [15]  464 	push	ix
   834B DD 21 00 00   [14]  465 	ld	ix,#0
   834F DD 39         [15]  466 	add	ix,sp
                            467 ;src/niveles.c:80: strcpy(entidad->name,"Spider");
   8351 DD 4E 04      [19]  468 	ld	c,4 (ix)
   8354 DD 46 05      [19]  469 	ld	b,5 (ix)
   8357 59            [ 4]  470 	ld	e, c
   8358 50            [ 4]  471 	ld	d, b
   8359 13            [ 6]  472 	inc	de
   835A C5            [11]  473 	push	bc
   835B 21 8A 83      [10]  474 	ld	hl, #___str_8
   835E AF            [ 4]  475 	xor	a, a
   835F                     476 00103$:
   835F BE            [ 7]  477 	cp	a, (hl)
   8360 ED A0         [16]  478 	ldi
   8362 20 FB         [12]  479 	jr	NZ, 00103$
   8364 C1            [10]  480 	pop	bc
                            481 ;src/niveles.c:81: entidad->max_energy = 70;
   8365 21 0C 00      [10]  482 	ld	hl, #0x000c
   8368 09            [11]  483 	add	hl, bc
   8369 36 46         [10]  484 	ld	(hl), #0x46
                            485 ;src/niveles.c:82: entidad->attack = 15;
   836B 21 0D 00      [10]  486 	ld	hl, #0x000d
   836E 09            [11]  487 	add	hl, bc
   836F 36 0F         [10]  488 	ld	(hl), #0x0f
                            489 ;src/niveles.c:83: entidad->force = 10;
   8371 21 0E 00      [10]  490 	ld	hl, #0x000e
   8374 09            [11]  491 	add	hl, bc
   8375 36 0A         [10]  492 	ld	(hl), #0x0a
                            493 ;src/niveles.c:84: entidad->defense = 10;
   8377 21 0F 00      [10]  494 	ld	hl, #0x000f
   837A 09            [11]  495 	add	hl, bc
   837B 36 0A         [10]  496 	ld	(hl), #0x0a
                            497 ;src/niveles.c:85: entidad->sprite = (u8*) &G_spider[0];
   837D 21 13 00      [10]  498 	ld	hl, #0x0013
   8380 09            [11]  499 	add	hl, bc
   8381 01 89 6D      [10]  500 	ld	bc, #_G_spider+0
   8384 71            [ 7]  501 	ld	(hl), c
   8385 23            [ 6]  502 	inc	hl
   8386 70            [ 7]  503 	ld	(hl), b
   8387 DD E1         [14]  504 	pop	ix
   8389 C9            [10]  505 	ret
   838A                     506 ___str_8:
   838A 53 70 69 64 65 72   507 	.ascii "Spider"
   8390 00                  508 	.db 0x00
                            509 ;src/niveles.c:88: void initGoblin(TStats *entidad) {
                            510 ;	---------------------------------
                            511 ; Function initGoblin
                            512 ; ---------------------------------
   8391                     513 _initGoblin::
   8391 DD E5         [15]  514 	push	ix
   8393 DD 21 00 00   [14]  515 	ld	ix,#0
   8397 DD 39         [15]  516 	add	ix,sp
                            517 ;src/niveles.c:89: strcpy(entidad->name,"Goblin");
   8399 DD 4E 04      [19]  518 	ld	c,4 (ix)
   839C DD 46 05      [19]  519 	ld	b,5 (ix)
   839F 59            [ 4]  520 	ld	e, c
   83A0 50            [ 4]  521 	ld	d, b
   83A1 13            [ 6]  522 	inc	de
   83A2 C5            [11]  523 	push	bc
   83A3 21 D2 83      [10]  524 	ld	hl, #___str_9
   83A6 AF            [ 4]  525 	xor	a, a
   83A7                     526 00103$:
   83A7 BE            [ 7]  527 	cp	a, (hl)
   83A8 ED A0         [16]  528 	ldi
   83AA 20 FB         [12]  529 	jr	NZ, 00103$
   83AC C1            [10]  530 	pop	bc
                            531 ;src/niveles.c:90: entidad->max_energy = 45;
   83AD 21 0C 00      [10]  532 	ld	hl, #0x000c
   83B0 09            [11]  533 	add	hl, bc
   83B1 36 2D         [10]  534 	ld	(hl), #0x2d
                            535 ;src/niveles.c:91: entidad->attack = 20;
   83B3 21 0D 00      [10]  536 	ld	hl, #0x000d
   83B6 09            [11]  537 	add	hl, bc
   83B7 36 14         [10]  538 	ld	(hl), #0x14
                            539 ;src/niveles.c:92: entidad->force = 10;
   83B9 21 0E 00      [10]  540 	ld	hl, #0x000e
   83BC 09            [11]  541 	add	hl, bc
   83BD 36 0A         [10]  542 	ld	(hl), #0x0a
                            543 ;src/niveles.c:93: entidad->defense = 5;
   83BF 21 0F 00      [10]  544 	ld	hl, #0x000f
   83C2 09            [11]  545 	add	hl, bc
   83C3 36 05         [10]  546 	ld	(hl), #0x05
                            547 ;src/niveles.c:94: entidad->sprite = (u8*) &G_goblin[0];
   83C5 21 13 00      [10]  548 	ld	hl, #0x0013
   83C8 09            [11]  549 	add	hl, bc
   83C9 01 69 6E      [10]  550 	ld	bc, #_G_goblin+0
   83CC 71            [ 7]  551 	ld	(hl), c
   83CD 23            [ 6]  552 	inc	hl
   83CE 70            [ 7]  553 	ld	(hl), b
   83CF DD E1         [14]  554 	pop	ix
   83D1 C9            [10]  555 	ret
   83D2                     556 ___str_9:
   83D2 47 6F 62 6C 69 6E   557 	.ascii "Goblin"
   83D8 00                  558 	.db 0x00
                            559 ;src/niveles.c:97: void initSoldado1(TStats *entidad) {
                            560 ;	---------------------------------
                            561 ; Function initSoldado1
                            562 ; ---------------------------------
   83D9                     563 _initSoldado1::
   83D9 DD E5         [15]  564 	push	ix
   83DB DD 21 00 00   [14]  565 	ld	ix,#0
   83DF DD 39         [15]  566 	add	ix,sp
                            567 ;src/niveles.c:98: strcpy(entidad->name,"Soldier 1");
   83E1 DD 4E 04      [19]  568 	ld	c,4 (ix)
   83E4 DD 46 05      [19]  569 	ld	b,5 (ix)
   83E7 59            [ 4]  570 	ld	e, c
   83E8 50            [ 4]  571 	ld	d, b
   83E9 13            [ 6]  572 	inc	de
   83EA C5            [11]  573 	push	bc
   83EB 21 1A 84      [10]  574 	ld	hl, #___str_10
   83EE AF            [ 4]  575 	xor	a, a
   83EF                     576 00103$:
   83EF BE            [ 7]  577 	cp	a, (hl)
   83F0 ED A0         [16]  578 	ldi
   83F2 20 FB         [12]  579 	jr	NZ, 00103$
   83F4 C1            [10]  580 	pop	bc
                            581 ;src/niveles.c:99: entidad->max_energy = 60;
   83F5 21 0C 00      [10]  582 	ld	hl, #0x000c
   83F8 09            [11]  583 	add	hl, bc
   83F9 36 3C         [10]  584 	ld	(hl), #0x3c
                            585 ;src/niveles.c:100: entidad->attack = 12;
   83FB 21 0D 00      [10]  586 	ld	hl, #0x000d
   83FE 09            [11]  587 	add	hl, bc
   83FF 36 0C         [10]  588 	ld	(hl), #0x0c
                            589 ;src/niveles.c:101: entidad->force = 5;
   8401 21 0E 00      [10]  590 	ld	hl, #0x000e
   8404 09            [11]  591 	add	hl, bc
   8405 36 05         [10]  592 	ld	(hl), #0x05
                            593 ;src/niveles.c:102: entidad->defense = 10;
   8407 21 0F 00      [10]  594 	ld	hl, #0x000f
   840A 09            [11]  595 	add	hl, bc
   840B 36 0A         [10]  596 	ld	(hl), #0x0a
                            597 ;src/niveles.c:103: entidad->sprite = (u8*) &G_soldado_1[0];
   840D 21 13 00      [10]  598 	ld	hl, #0x0013
   8410 09            [11]  599 	add	hl, bc
   8411 01 29 70      [10]  600 	ld	bc, #_G_soldado_1+0
   8414 71            [ 7]  601 	ld	(hl), c
   8415 23            [ 6]  602 	inc	hl
   8416 70            [ 7]  603 	ld	(hl), b
   8417 DD E1         [14]  604 	pop	ix
   8419 C9            [10]  605 	ret
   841A                     606 ___str_10:
   841A 53 6F 6C 64 69 65   607 	.ascii "Soldier 1"
        72 20 31
   8423 00                  608 	.db 0x00
                            609 ;src/niveles.c:106: void initSoldado2(TStats *entidad) {
                            610 ;	---------------------------------
                            611 ; Function initSoldado2
                            612 ; ---------------------------------
   8424                     613 _initSoldado2::
   8424 DD E5         [15]  614 	push	ix
   8426 DD 21 00 00   [14]  615 	ld	ix,#0
   842A DD 39         [15]  616 	add	ix,sp
                            617 ;src/niveles.c:107: strcpy(entidad->name,"Soldier 2");
   842C DD 4E 04      [19]  618 	ld	c,4 (ix)
   842F DD 46 05      [19]  619 	ld	b,5 (ix)
   8432 59            [ 4]  620 	ld	e, c
   8433 50            [ 4]  621 	ld	d, b
   8434 13            [ 6]  622 	inc	de
   8435 C5            [11]  623 	push	bc
   8436 21 65 84      [10]  624 	ld	hl, #___str_11
   8439 AF            [ 4]  625 	xor	a, a
   843A                     626 00103$:
   843A BE            [ 7]  627 	cp	a, (hl)
   843B ED A0         [16]  628 	ldi
   843D 20 FB         [12]  629 	jr	NZ, 00103$
   843F C1            [10]  630 	pop	bc
                            631 ;src/niveles.c:108: entidad->max_energy = 50;
   8440 21 0C 00      [10]  632 	ld	hl, #0x000c
   8443 09            [11]  633 	add	hl, bc
   8444 36 32         [10]  634 	ld	(hl), #0x32
                            635 ;src/niveles.c:109: entidad->attack = 25;
   8446 21 0D 00      [10]  636 	ld	hl, #0x000d
   8449 09            [11]  637 	add	hl, bc
   844A 36 19         [10]  638 	ld	(hl), #0x19
                            639 ;src/niveles.c:110: entidad->force = 10;
   844C 21 0E 00      [10]  640 	ld	hl, #0x000e
   844F 09            [11]  641 	add	hl, bc
   8450 36 0A         [10]  642 	ld	(hl), #0x0a
                            643 ;src/niveles.c:111: entidad->defense = 0;
   8452 21 0F 00      [10]  644 	ld	hl, #0x000f
   8455 09            [11]  645 	add	hl, bc
   8456 36 00         [10]  646 	ld	(hl), #0x00
                            647 ;src/niveles.c:112: entidad->sprite = (u8*) &G_soldado_2[0];
   8458 21 13 00      [10]  648 	ld	hl, #0x0013
   845B 09            [11]  649 	add	hl, bc
   845C 01 C9 72      [10]  650 	ld	bc, #_G_soldado_2+0
   845F 71            [ 7]  651 	ld	(hl), c
   8460 23            [ 6]  652 	inc	hl
   8461 70            [ 7]  653 	ld	(hl), b
   8462 DD E1         [14]  654 	pop	ix
   8464 C9            [10]  655 	ret
   8465                     656 ___str_11:
   8465 53 6F 6C 64 69 65   657 	.ascii "Soldier 2"
        72 20 32
   846E 00                  658 	.db 0x00
                            659 ;src/niveles.c:115: void initCaballero(TStats *entidad) {
                            660 ;	---------------------------------
                            661 ; Function initCaballero
                            662 ; ---------------------------------
   846F                     663 _initCaballero::
   846F DD E5         [15]  664 	push	ix
   8471 DD 21 00 00   [14]  665 	ld	ix,#0
   8475 DD 39         [15]  666 	add	ix,sp
                            667 ;src/niveles.c:116: strcpy(entidad->name,"Knight");
   8477 DD 4E 04      [19]  668 	ld	c,4 (ix)
   847A DD 46 05      [19]  669 	ld	b,5 (ix)
   847D 59            [ 4]  670 	ld	e, c
   847E 50            [ 4]  671 	ld	d, b
   847F 13            [ 6]  672 	inc	de
   8480 C5            [11]  673 	push	bc
   8481 21 B0 84      [10]  674 	ld	hl, #___str_12
   8484 AF            [ 4]  675 	xor	a, a
   8485                     676 00103$:
   8485 BE            [ 7]  677 	cp	a, (hl)
   8486 ED A0         [16]  678 	ldi
   8488 20 FB         [12]  679 	jr	NZ, 00103$
   848A C1            [10]  680 	pop	bc
                            681 ;src/niveles.c:117: entidad->max_energy = 75;
   848B 21 0C 00      [10]  682 	ld	hl, #0x000c
   848E 09            [11]  683 	add	hl, bc
   848F 36 4B         [10]  684 	ld	(hl), #0x4b
                            685 ;src/niveles.c:118: entidad->attack = 15;
   8491 21 0D 00      [10]  686 	ld	hl, #0x000d
   8494 09            [11]  687 	add	hl, bc
   8495 36 0F         [10]  688 	ld	(hl), #0x0f
                            689 ;src/niveles.c:119: entidad->force = 10;
   8497 21 0E 00      [10]  690 	ld	hl, #0x000e
   849A 09            [11]  691 	add	hl, bc
   849B 36 0A         [10]  692 	ld	(hl), #0x0a
                            693 ;src/niveles.c:120: entidad->defense = 15;
   849D 21 0F 00      [10]  694 	ld	hl, #0x000f
   84A0 09            [11]  695 	add	hl, bc
   84A1 36 0F         [10]  696 	ld	(hl), #0x0f
                            697 ;src/niveles.c:121: entidad->sprite = (u8*) &G_caballero[0];
   84A3 21 13 00      [10]  698 	ld	hl, #0x0013
   84A6 09            [11]  699 	add	hl, bc
   84A7 01 E9 71      [10]  700 	ld	bc, #_G_caballero+0
   84AA 71            [ 7]  701 	ld	(hl), c
   84AB 23            [ 6]  702 	inc	hl
   84AC 70            [ 7]  703 	ld	(hl), b
   84AD DD E1         [14]  704 	pop	ix
   84AF C9            [10]  705 	ret
   84B0                     706 ___str_12:
   84B0 4B 6E 69 67 68 74   707 	.ascii "Knight"
   84B6 00                  708 	.db 0x00
                            709 ;src/niveles.c:124: void initCarcelero(TStats *entidad) {
                            710 ;	---------------------------------
                            711 ; Function initCarcelero
                            712 ; ---------------------------------
   84B7                     713 _initCarcelero::
   84B7 DD E5         [15]  714 	push	ix
   84B9 DD 21 00 00   [14]  715 	ld	ix,#0
   84BD DD 39         [15]  716 	add	ix,sp
                            717 ;src/niveles.c:125: strcpy(entidad->name,"Guard");
   84BF DD 4E 04      [19]  718 	ld	c,4 (ix)
   84C2 DD 46 05      [19]  719 	ld	b,5 (ix)
   84C5 59            [ 4]  720 	ld	e, c
   84C6 50            [ 4]  721 	ld	d, b
   84C7 13            [ 6]  722 	inc	de
   84C8 C5            [11]  723 	push	bc
   84C9 21 F8 84      [10]  724 	ld	hl, #___str_13
   84CC AF            [ 4]  725 	xor	a, a
   84CD                     726 00103$:
   84CD BE            [ 7]  727 	cp	a, (hl)
   84CE ED A0         [16]  728 	ldi
   84D0 20 FB         [12]  729 	jr	NZ, 00103$
   84D2 C1            [10]  730 	pop	bc
                            731 ;src/niveles.c:126: entidad->max_energy = 60;
   84D3 21 0C 00      [10]  732 	ld	hl, #0x000c
   84D6 09            [11]  733 	add	hl, bc
   84D7 36 3C         [10]  734 	ld	(hl), #0x3c
                            735 ;src/niveles.c:127: entidad->attack = 20;
   84D9 21 0D 00      [10]  736 	ld	hl, #0x000d
   84DC 09            [11]  737 	add	hl, bc
   84DD 36 14         [10]  738 	ld	(hl), #0x14
                            739 ;src/niveles.c:128: entidad->force = 10;
   84DF 21 0E 00      [10]  740 	ld	hl, #0x000e
   84E2 09            [11]  741 	add	hl, bc
   84E3 36 0A         [10]  742 	ld	(hl), #0x0a
                            743 ;src/niveles.c:129: entidad->defense = 10;
   84E5 21 0F 00      [10]  744 	ld	hl, #0x000f
   84E8 09            [11]  745 	add	hl, bc
   84E9 36 0A         [10]  746 	ld	(hl), #0x0a
                            747 ;src/niveles.c:130: entidad->sprite = (u8*) &G_carcelero[0];
   84EB 21 13 00      [10]  748 	ld	hl, #0x0013
   84EE 09            [11]  749 	add	hl, bc
   84EF 01 09 71      [10]  750 	ld	bc, #_G_carcelero+0
   84F2 71            [ 7]  751 	ld	(hl), c
   84F3 23            [ 6]  752 	inc	hl
   84F4 70            [ 7]  753 	ld	(hl), b
   84F5 DD E1         [14]  754 	pop	ix
   84F7 C9            [10]  755 	ret
   84F8                     756 ___str_13:
   84F8 47 75 61 72 64      757 	.ascii "Guard"
   84FD 00                  758 	.db 0x00
                            759 ;src/niveles.c:133: void initMago(TStats *entidad) {
                            760 ;	---------------------------------
                            761 ; Function initMago
                            762 ; ---------------------------------
   84FE                     763 _initMago::
   84FE DD E5         [15]  764 	push	ix
   8500 DD 21 00 00   [14]  765 	ld	ix,#0
   8504 DD 39         [15]  766 	add	ix,sp
                            767 ;src/niveles.c:134: strcpy(entidad->name,"Magician");
   8506 DD 4E 04      [19]  768 	ld	c,4 (ix)
   8509 DD 46 05      [19]  769 	ld	b,5 (ix)
   850C 59            [ 4]  770 	ld	e, c
   850D 50            [ 4]  771 	ld	d, b
   850E 13            [ 6]  772 	inc	de
   850F C5            [11]  773 	push	bc
   8510 21 3F 85      [10]  774 	ld	hl, #___str_14
   8513 AF            [ 4]  775 	xor	a, a
   8514                     776 00103$:
   8514 BE            [ 7]  777 	cp	a, (hl)
   8515 ED A0         [16]  778 	ldi
   8517 20 FB         [12]  779 	jr	NZ, 00103$
   8519 C1            [10]  780 	pop	bc
                            781 ;src/niveles.c:135: entidad->max_energy = 60;
   851A 21 0C 00      [10]  782 	ld	hl, #0x000c
   851D 09            [11]  783 	add	hl, bc
   851E 36 3C         [10]  784 	ld	(hl), #0x3c
                            785 ;src/niveles.c:136: entidad->attack = 14;
   8520 21 0D 00      [10]  786 	ld	hl, #0x000d
   8523 09            [11]  787 	add	hl, bc
   8524 36 0E         [10]  788 	ld	(hl), #0x0e
                            789 ;src/niveles.c:137: entidad->force = 2;
   8526 21 0E 00      [10]  790 	ld	hl, #0x000e
   8529 09            [11]  791 	add	hl, bc
   852A 36 02         [10]  792 	ld	(hl), #0x02
                            793 ;src/niveles.c:138: entidad->defense = 0;
   852C 21 0F 00      [10]  794 	ld	hl, #0x000f
   852F 09            [11]  795 	add	hl, bc
   8530 36 00         [10]  796 	ld	(hl), #0x00
                            797 ;src/niveles.c:139: entidad->sprite = (u8*) &G_mago[0];
   8532 21 13 00      [10]  798 	ld	hl, #0x0013
   8535 09            [11]  799 	add	hl, bc
   8536 01 A9 73      [10]  800 	ld	bc, #_G_mago+0
   8539 71            [ 7]  801 	ld	(hl), c
   853A 23            [ 6]  802 	inc	hl
   853B 70            [ 7]  803 	ld	(hl), b
   853C DD E1         [14]  804 	pop	ix
   853E C9            [10]  805 	ret
   853F                     806 ___str_14:
   853F 4D 61 67 69 63 69   807 	.ascii "Magician"
        61 6E
   8547 00                  808 	.db 0x00
                            809 ;src/niveles.c:142: void initPlayer(){
                            810 ;	---------------------------------
                            811 ; Function initPlayer
                            812 ; ---------------------------------
   8548                     813 _initPlayer::
                            814 ;src/niveles.c:143: entidad[0].id =0;
   8548 21 21 A2      [10]  815 	ld	hl, #_entidad
   854B 36 00         [10]  816 	ld	(hl), #0x00
                            817 ;src/niveles.c:144: strcpy(entidad[0].name,"Don Mendo");
   854D 11 22 A2      [10]  818 	ld	de, #(_entidad + 0x0001)
   8550 21 88 85      [10]  819 	ld	hl, #___str_15
   8553 AF            [ 4]  820 	xor	a, a
   8554                     821 00103$:
   8554 BE            [ 7]  822 	cp	a, (hl)
   8555 ED A0         [16]  823 	ldi
   8557 20 FB         [12]  824 	jr	NZ, 00103$
                            825 ;src/niveles.c:145: entidad[0].max_energy = entidad[0].energy = 60;
   8559 21 2C A2      [10]  826 	ld	hl, #(_entidad + 0x000b)
   855C 36 3C         [10]  827 	ld	(hl), #0x3c
   855E 21 2D A2      [10]  828 	ld	hl, #(_entidad + 0x000c)
   8561 36 3C         [10]  829 	ld	(hl), #0x3c
                            830 ;src/niveles.c:146: entidad[0].attack = 20;
   8563 21 2E A2      [10]  831 	ld	hl, #(_entidad + 0x000d)
   8566 36 14         [10]  832 	ld	(hl), #0x14
                            833 ;src/niveles.c:147: entidad[0].force = 5;
   8568 21 2F A2      [10]  834 	ld	hl, #(_entidad + 0x000e)
   856B 36 05         [10]  835 	ld	(hl), #0x05
                            836 ;src/niveles.c:148: entidad[0].defense = 15;
   856D 21 30 A2      [10]  837 	ld	hl, #(_entidad + 0x000f)
   8570 36 0F         [10]  838 	ld	(hl), #0x0f
                            839 ;src/niveles.c:149: entidad[0].pos_x = 8;
   8572 21 31 A2      [10]  840 	ld	hl, #(_entidad + 0x0010)
   8575 36 08         [10]  841 	ld	(hl), #0x08
                            842 ;src/niveles.c:150: entidad[0].pos_x_ant = 8;
   8577 21 32 A2      [10]  843 	ld	hl, #(_entidad + 0x0011)
   857A 36 08         [10]  844 	ld	(hl), #0x08
                            845 ;src/niveles.c:151: entidad[0].pos_y = 24;
   857C 21 33 A2      [10]  846 	ld	hl, #(_entidad + 0x0012)
   857F 36 18         [10]  847 	ld	(hl), #0x18
                            848 ;src/niveles.c:152: entidad[0].sprite = (u8*) &G_mendo[0];
   8581 21 89 64      [10]  849 	ld	hl, #_G_mendo
   8584 22 34 A2      [16]  850 	ld	((_entidad + 0x0013)), hl
   8587 C9            [10]  851 	ret
   8588                     852 ___str_15:
   8588 44 6F 6E 20 4D 65   853 	.ascii "Don Mendo"
        6E 64 6F
   8591 00                  854 	.db 0x00
                            855 ;src/niveles.c:155: void initNivel(){
                            856 ;	---------------------------------
                            857 ; Function initNivel
                            858 ; ---------------------------------
   8592                     859 _initNivel::
                            860 ;src/niveles.c:157: entidad[1].id = 1;
   8592 21 36 A2      [10]  861 	ld	hl, #(_entidad + 0x0015)
   8595 36 01         [10]  862 	ld	(hl), #0x01
                            863 ;src/niveles.c:158: entidad[1].max_energy = 0;
   8597 21 42 A2      [10]  864 	ld	hl, #(_entidad + 0x0021)
   859A 36 00         [10]  865 	ld	(hl), #0x00
                            866 ;src/niveles.c:159: entidad[1].pos_x_ant = 4;
   859C 21 47 A2      [10]  867 	ld	hl, #(_entidad + 0x0026)
   859F 36 04         [10]  868 	ld	(hl), #0x04
                            869 ;src/niveles.c:160: entidad[2].id = 2;
   85A1 21 4B A2      [10]  870 	ld	hl, #(_entidad + 0x002a)
   85A4 36 02         [10]  871 	ld	(hl), #0x02
                            872 ;src/niveles.c:161: entidad[2].max_energy = 0;
   85A6 21 57 A2      [10]  873 	ld	hl, #(_entidad + 0x0036)
   85A9 36 00         [10]  874 	ld	(hl), #0x00
                            875 ;src/niveles.c:162: entidad[2].pos_x_ant = 4;
   85AB 21 5C A2      [10]  876 	ld	hl, #(_entidad + 0x003b)
   85AE 36 04         [10]  877 	ld	(hl), #0x04
                            878 ;src/niveles.c:165: if (nivel == 1) {
   85B0 3A 60 A2      [13]  879 	ld	a,(#_nivel + 0)
   85B3 3D            [ 4]  880 	dec	a
   85B4 20 08         [12]  881 	jr	NZ,00102$
                            882 ;src/niveles.c:166: initSoldadoArabe1(&entidad[1]);
   85B6 21 36 A2      [10]  883 	ld	hl, #(_entidad + 0x0015)
   85B9 E5            [11]  884 	push	hl
   85BA CD 02 81      [17]  885 	call	_initSoldadoArabe1
   85BD F1            [10]  886 	pop	af
   85BE                     887 00102$:
                            888 ;src/niveles.c:168: if (nivel == 2) {
   85BE 3A 60 A2      [13]  889 	ld	a,(#_nivel + 0)
   85C1 D6 02         [ 7]  890 	sub	a, #0x02
   85C3 20 08         [12]  891 	jr	NZ,00104$
                            892 ;src/niveles.c:169: initSoldadoArabe1(&entidad[2]);
   85C5 21 4B A2      [10]  893 	ld	hl, #(_entidad + 0x002a)
   85C8 E5            [11]  894 	push	hl
   85C9 CD 02 81      [17]  895 	call	_initSoldadoArabe1
   85CC F1            [10]  896 	pop	af
   85CD                     897 00104$:
                            898 ;src/niveles.c:171: if (nivel == 3){
   85CD 3A 60 A2      [13]  899 	ld	a,(#_nivel + 0)
   85D0 D6 03         [ 7]  900 	sub	a, #0x03
   85D2 20 0F         [12]  901 	jr	NZ,00106$
                            902 ;src/niveles.c:172: initAbeja(&entidad[1]);
   85D4 21 36 A2      [10]  903 	ld	hl, #(_entidad + 0x0015)
   85D7 E5            [11]  904 	push	hl
   85D8 CD 2A 82      [17]  905 	call	_initAbeja
                            906 ;src/niveles.c:173: initSoldadoArabe1(&entidad[2]);
   85DB 21 4B A2      [10]  907 	ld	hl, #(_entidad + 0x002a)
   85DE E3            [19]  908 	ex	(sp),hl
   85DF CD 02 81      [17]  909 	call	_initSoldadoArabe1
   85E2 F1            [10]  910 	pop	af
   85E3                     911 00106$:
                            912 ;src/niveles.c:175: if (nivel == 4){
   85E3 3A 60 A2      [13]  913 	ld	a,(#_nivel + 0)
   85E6 D6 04         [ 7]  914 	sub	a, #0x04
   85E8 20 08         [12]  915 	jr	NZ,00108$
                            916 ;src/niveles.c:176: initSoldadoArabe2(&entidad[1]);
   85EA 21 36 A2      [10]  917 	ld	hl, #(_entidad + 0x0015)
   85ED E5            [11]  918 	push	hl
   85EE CD 4D 81      [17]  919 	call	_initSoldadoArabe2
   85F1 F1            [10]  920 	pop	af
   85F2                     921 00108$:
                            922 ;src/niveles.c:178: if (nivel == 6){
   85F2 3A 60 A2      [13]  923 	ld	a,(#_nivel + 0)
   85F5 D6 06         [ 7]  924 	sub	a, #0x06
   85F7 20 0F         [12]  925 	jr	NZ,00110$
                            926 ;src/niveles.c:179: initAbeja(&entidad[1]);
   85F9 21 36 A2      [10]  927 	ld	hl, #(_entidad + 0x0015)
   85FC E5            [11]  928 	push	hl
   85FD CD 2A 82      [17]  929 	call	_initAbeja
                            930 ;src/niveles.c:180: initFakir(&entidad[2]);
   8600 21 4B A2      [10]  931 	ld	hl, #(_entidad + 0x002a)
   8603 E3            [19]  932 	ex	(sp),hl
   8604 CD E3 81      [17]  933 	call	_initFakir
   8607 F1            [10]  934 	pop	af
   8608                     935 00110$:
                            936 ;src/niveles.c:182: if (nivel == 7){
   8608 3A 60 A2      [13]  937 	ld	a,(#_nivel + 0)
   860B D6 07         [ 7]  938 	sub	a, #0x07
   860D 20 0F         [12]  939 	jr	NZ,00112$
                            940 ;src/niveles.c:183: initSoldadoArabe2(&entidad[1]);
   860F 21 36 A2      [10]  941 	ld	hl, #(_entidad + 0x0015)
   8612 E5            [11]  942 	push	hl
   8613 CD 4D 81      [17]  943 	call	_initSoldadoArabe2
                            944 ;src/niveles.c:184: initSoldadoArabe3(&entidad[2]);
   8616 21 4B A2      [10]  945 	ld	hl, #(_entidad + 0x002a)
   8619 E3            [19]  946 	ex	(sp),hl
   861A CD 98 81      [17]  947 	call	_initSoldadoArabe3
   861D F1            [10]  948 	pop	af
   861E                     949 00112$:
                            950 ;src/niveles.c:186: if (nivel == 8){
   861E 3A 60 A2      [13]  951 	ld	a,(#_nivel + 0)
   8621 D6 08         [ 7]  952 	sub	a, #0x08
   8623 20 0F         [12]  953 	jr	NZ,00114$
                            954 ;src/niveles.c:187: initFakir(&entidad[1]);
   8625 21 36 A2      [10]  955 	ld	hl, #(_entidad + 0x0015)
   8628 E5            [11]  956 	push	hl
   8629 CD E3 81      [17]  957 	call	_initFakir
                            958 ;src/niveles.c:188: initSoldadoArabe2(&entidad[2]);
   862C 21 4B A2      [10]  959 	ld	hl, #(_entidad + 0x002a)
   862F E3            [19]  960 	ex	(sp),hl
   8630 CD 4D 81      [17]  961 	call	_initSoldadoArabe2
   8633 F1            [10]  962 	pop	af
   8634                     963 00114$:
                            964 ;src/niveles.c:190: if (nivel == 9){
   8634 3A 60 A2      [13]  965 	ld	a,(#_nivel + 0)
   8637 D6 09         [ 7]  966 	sub	a, #0x09
   8639 20 0F         [12]  967 	jr	NZ,00116$
                            968 ;src/niveles.c:191: initSoldadoArabe3(&entidad[1]);
   863B 21 36 A2      [10]  969 	ld	hl, #(_entidad + 0x0015)
   863E E5            [11]  970 	push	hl
   863F CD 98 81      [17]  971 	call	_initSoldadoArabe3
                            972 ;src/niveles.c:192: initSoldadoArabe3(&entidad[2]);
   8642 21 4B A2      [10]  973 	ld	hl, #(_entidad + 0x002a)
   8645 E3            [19]  974 	ex	(sp),hl
   8646 CD 98 81      [17]  975 	call	_initSoldadoArabe3
   8649 F1            [10]  976 	pop	af
   864A                     977 00116$:
                            978 ;src/niveles.c:195: strcpy(entidad[2].name,"Boss Lvl1");
                            979 ;src/niveles.c:197: entidad[2].attack = 20;
                            980 ;src/niveles.c:198: entidad[2].force = 10;
                            981 ;src/niveles.c:199: entidad[2].defense = 10;
                            982 ;src/niveles.c:200: entidad[2].sprite = (u8*) &G_arabe_boss[0];
                            983 ;src/niveles.c:195: strcpy(entidad[2].name,"Boss Lvl1");
                            984 ;src/niveles.c:194: if (nivel == 10){
   864A FD 21 60 A2   [14]  985 	ld	iy, #_nivel
   864E FD 7E 00      [19]  986 	ld	a, 0 (iy)
   8651 D6 0A         [ 7]  987 	sub	a, #0x0a
   8653 20 26         [12]  988 	jr	NZ,00118$
                            989 ;src/niveles.c:195: strcpy(entidad[2].name,"Boss Lvl1");
   8655 11 4C A2      [10]  990 	ld	de, #(_entidad + 0x002b)
   8658 21 83 88      [10]  991 	ld	hl, #___str_16
   865B AF            [ 4]  992 	xor	a, a
   865C                     993 00301$:
   865C BE            [ 7]  994 	cp	a, (hl)
   865D ED A0         [16]  995 	ldi
   865F 20 FB         [12]  996 	jr	NZ, 00301$
                            997 ;src/niveles.c:196: entidad[2].max_energy = 99;
   8661 21 57 A2      [10]  998 	ld	hl, #(_entidad + 0x0036)
   8664 36 63         [10]  999 	ld	(hl), #0x63
                           1000 ;src/niveles.c:197: entidad[2].attack = 20;
   8666 21 58 A2      [10] 1001 	ld	hl, #(_entidad + 0x0037)
   8669 36 14         [10] 1002 	ld	(hl), #0x14
                           1003 ;src/niveles.c:198: entidad[2].force = 10;
   866B 21 59 A2      [10] 1004 	ld	hl, #(_entidad + 0x0038)
   866E 36 0A         [10] 1005 	ld	(hl), #0x0a
                           1006 ;src/niveles.c:199: entidad[2].defense = 10;
   8670 21 5A A2      [10] 1007 	ld	hl, #(_entidad + 0x0039)
   8673 36 0A         [10] 1008 	ld	(hl), #0x0a
                           1009 ;src/niveles.c:200: entidad[2].sprite = (u8*) &G_arabe_boss[0];
   8675 21 E9 68      [10] 1010 	ld	hl, #_G_arabe_boss
   8678 22 5E A2      [16] 1011 	ld	((_entidad + 0x003d)), hl
   867B                    1012 00118$:
                           1013 ;src/niveles.c:203: if (nivel == 11) {
   867B 3A 60 A2      [13] 1014 	ld	a,(#_nivel + 0)
   867E D6 0B         [ 7] 1015 	sub	a, #0x0b
   8680 20 08         [12] 1016 	jr	NZ,00120$
                           1017 ;src/niveles.c:204: initMurcielago(&entidad[1]);
   8682 21 36 A2      [10] 1018 	ld	hl, #(_entidad + 0x0015)
   8685 E5            [11] 1019 	push	hl
   8686 CD 6F 82      [17] 1020 	call	_initMurcielago
   8689 F1            [10] 1021 	pop	af
   868A                    1022 00120$:
                           1023 ;src/niveles.c:206: if (nivel == 12) {
   868A 3A 60 A2      [13] 1024 	ld	a,(#_nivel + 0)
   868D D6 0C         [ 7] 1025 	sub	a, #0x0c
   868F 20 08         [12] 1026 	jr	NZ,00122$
                           1027 ;src/niveles.c:207: initEsqueleto(&entidad[2]);
   8691 21 4B A2      [10] 1028 	ld	hl, #(_entidad + 0x002a)
   8694 E5            [11] 1029 	push	hl
   8695 CD B9 82      [17] 1030 	call	_initEsqueleto
   8698 F1            [10] 1031 	pop	af
   8699                    1032 00122$:
                           1033 ;src/niveles.c:209: if (nivel == 13){
   8699 3A 60 A2      [13] 1034 	ld	a,(#_nivel + 0)
   869C D6 0D         [ 7] 1035 	sub	a, #0x0d
   869E 20 0F         [12] 1036 	jr	NZ,00124$
                           1037 ;src/niveles.c:210: initMurcielago(&entidad[1]);
   86A0 21 36 A2      [10] 1038 	ld	hl, #(_entidad + 0x0015)
   86A3 E5            [11] 1039 	push	hl
   86A4 CD 6F 82      [17] 1040 	call	_initMurcielago
                           1041 ;src/niveles.c:211: initEsqueleto(&entidad[2]);
   86A7 21 4B A2      [10] 1042 	ld	hl, #(_entidad + 0x002a)
   86AA E3            [19] 1043 	ex	(sp),hl
   86AB CD B9 82      [17] 1044 	call	_initEsqueleto
   86AE F1            [10] 1045 	pop	af
   86AF                    1046 00124$:
                           1047 ;src/niveles.c:213: if (nivel == 14){
   86AF 3A 60 A2      [13] 1048 	ld	a,(#_nivel + 0)
   86B2 D6 0E         [ 7] 1049 	sub	a, #0x0e
   86B4 20 0F         [12] 1050 	jr	NZ,00126$
                           1051 ;src/niveles.c:214: initMurcielago(&entidad[1]);
   86B6 21 36 A2      [10] 1052 	ld	hl, #(_entidad + 0x0015)
   86B9 E5            [11] 1053 	push	hl
   86BA CD 6F 82      [17] 1054 	call	_initMurcielago
                           1055 ;src/niveles.c:215: initGusano(&entidad[2]);
   86BD 21 4B A2      [10] 1056 	ld	hl, #(_entidad + 0x002a)
   86C0 E3            [19] 1057 	ex	(sp),hl
   86C1 CD 03 83      [17] 1058 	call	_initGusano
   86C4 F1            [10] 1059 	pop	af
   86C5                    1060 00126$:
                           1061 ;src/niveles.c:217: if (nivel == 16){
   86C5 3A 60 A2      [13] 1062 	ld	a,(#_nivel + 0)
   86C8 D6 10         [ 7] 1063 	sub	a, #0x10
   86CA 20 0F         [12] 1064 	jr	NZ,00128$
                           1065 ;src/niveles.c:218: initEsqueleto(&entidad[1]);
   86CC 21 36 A2      [10] 1066 	ld	hl, #(_entidad + 0x0015)
   86CF E5            [11] 1067 	push	hl
   86D0 CD B9 82      [17] 1068 	call	_initEsqueleto
                           1069 ;src/niveles.c:219: initGusano(&entidad[2]);
   86D3 21 4B A2      [10] 1070 	ld	hl, #(_entidad + 0x002a)
   86D6 E3            [19] 1071 	ex	(sp),hl
   86D7 CD 03 83      [17] 1072 	call	_initGusano
   86DA F1            [10] 1073 	pop	af
   86DB                    1074 00128$:
                           1075 ;src/niveles.c:221: if (nivel == 17){
   86DB 3A 60 A2      [13] 1076 	ld	a,(#_nivel + 0)
   86DE D6 11         [ 7] 1077 	sub	a, #0x11
   86E0 20 0F         [12] 1078 	jr	NZ,00130$
                           1079 ;src/niveles.c:222: initSpider(&entidad[1]);
   86E2 21 36 A2      [10] 1080 	ld	hl, #(_entidad + 0x0015)
   86E5 E5            [11] 1081 	push	hl
   86E6 CD 49 83      [17] 1082 	call	_initSpider
                           1083 ;src/niveles.c:223: initSpider(&entidad[2]);
   86E9 21 4B A2      [10] 1084 	ld	hl, #(_entidad + 0x002a)
   86EC E3            [19] 1085 	ex	(sp),hl
   86ED CD 49 83      [17] 1086 	call	_initSpider
   86F0 F1            [10] 1087 	pop	af
   86F1                    1088 00130$:
                           1089 ;src/niveles.c:225: if (nivel == 18){
   86F1 3A 60 A2      [13] 1090 	ld	a,(#_nivel + 0)
   86F4 D6 12         [ 7] 1091 	sub	a, #0x12
   86F6 20 0F         [12] 1092 	jr	NZ,00132$
                           1093 ;src/niveles.c:226: initGoblin(&entidad[1]);
   86F8 21 36 A2      [10] 1094 	ld	hl, #(_entidad + 0x0015)
   86FB E5            [11] 1095 	push	hl
   86FC CD 91 83      [17] 1096 	call	_initGoblin
                           1097 ;src/niveles.c:227: initGoblin(&entidad[2]);
   86FF 21 4B A2      [10] 1098 	ld	hl, #(_entidad + 0x002a)
   8702 E3            [19] 1099 	ex	(sp),hl
   8703 CD 91 83      [17] 1100 	call	_initGoblin
   8706 F1            [10] 1101 	pop	af
   8707                    1102 00132$:
                           1103 ;src/niveles.c:229: if (nivel == 19){
   8707 3A 60 A2      [13] 1104 	ld	a,(#_nivel + 0)
   870A D6 13         [ 7] 1105 	sub	a, #0x13
   870C 20 0F         [12] 1106 	jr	NZ,00134$
                           1107 ;src/niveles.c:230: initGoblin(&entidad[1]);
   870E 21 36 A2      [10] 1108 	ld	hl, #(_entidad + 0x0015)
   8711 E5            [11] 1109 	push	hl
   8712 CD 91 83      [17] 1110 	call	_initGoblin
                           1111 ;src/niveles.c:231: initSpider(&entidad[2]);
   8715 21 4B A2      [10] 1112 	ld	hl, #(_entidad + 0x002a)
   8718 E3            [19] 1113 	ex	(sp),hl
   8719 CD 49 83      [17] 1114 	call	_initSpider
   871C F1            [10] 1115 	pop	af
   871D                    1116 00134$:
                           1117 ;src/niveles.c:233: if (nivel == 20){
   871D FD 21 60 A2   [14] 1118 	ld	iy, #_nivel
   8721 FD 7E 00      [19] 1119 	ld	a, 0 (iy)
   8724 D6 14         [ 7] 1120 	sub	a, #0x14
   8726 20 26         [12] 1121 	jr	NZ,00136$
                           1122 ;src/niveles.c:234: strcpy(entidad[2].name,"Boss Lvl2");
   8728 11 4C A2      [10] 1123 	ld	de, #(_entidad + 0x002b)
   872B 21 8D 88      [10] 1124 	ld	hl, #___str_17
   872E AF            [ 4] 1125 	xor	a, a
   872F                    1126 00320$:
   872F BE            [ 7] 1127 	cp	a, (hl)
   8730 ED A0         [16] 1128 	ldi
   8732 20 FB         [12] 1129 	jr	NZ, 00320$
                           1130 ;src/niveles.c:235: entidad[2].max_energy = 99;
   8734 21 57 A2      [10] 1131 	ld	hl, #(_entidad + 0x0036)
   8737 36 63         [10] 1132 	ld	(hl), #0x63
                           1133 ;src/niveles.c:236: entidad[2].attack = 30;
   8739 21 58 A2      [10] 1134 	ld	hl, #(_entidad + 0x0037)
   873C 36 1E         [10] 1135 	ld	(hl), #0x1e
                           1136 ;src/niveles.c:237: entidad[2].force = 5;
   873E 21 59 A2      [10] 1137 	ld	hl, #(_entidad + 0x0038)
   8741 36 05         [10] 1138 	ld	(hl), #0x05
                           1139 ;src/niveles.c:238: entidad[2].defense = 10;
   8743 21 5A A2      [10] 1140 	ld	hl, #(_entidad + 0x0039)
   8746 36 0A         [10] 1141 	ld	(hl), #0x0a
                           1142 ;src/niveles.c:239: entidad[2].sprite = (u8*) &G_cavern_boss[0];
   8748 21 49 6F      [10] 1143 	ld	hl, #_G_cavern_boss
   874B 22 5E A2      [16] 1144 	ld	((_entidad + 0x003d)), hl
   874E                    1145 00136$:
                           1146 ;src/niveles.c:242: if (nivel == 21) {
   874E 3A 60 A2      [13] 1147 	ld	a,(#_nivel + 0)
   8751 D6 15         [ 7] 1148 	sub	a, #0x15
   8753 20 08         [12] 1149 	jr	NZ,00138$
                           1150 ;src/niveles.c:243: initSoldado1(&entidad[1]);
   8755 21 36 A2      [10] 1151 	ld	hl, #(_entidad + 0x0015)
   8758 E5            [11] 1152 	push	hl
   8759 CD D9 83      [17] 1153 	call	_initSoldado1
   875C F1            [10] 1154 	pop	af
   875D                    1155 00138$:
                           1156 ;src/niveles.c:245: if (nivel == 22) {
   875D 3A 60 A2      [13] 1157 	ld	a,(#_nivel + 0)
   8760 D6 16         [ 7] 1158 	sub	a, #0x16
   8762 20 08         [12] 1159 	jr	NZ,00140$
                           1160 ;src/niveles.c:246: initCarcelero(&entidad[1]);
   8764 21 36 A2      [10] 1161 	ld	hl, #(_entidad + 0x0015)
   8767 E5            [11] 1162 	push	hl
   8768 CD B7 84      [17] 1163 	call	_initCarcelero
   876B F1            [10] 1164 	pop	af
   876C                    1165 00140$:
                           1166 ;src/niveles.c:248: if (nivel == 23){
   876C 3A 60 A2      [13] 1167 	ld	a,(#_nivel + 0)
   876F D6 17         [ 7] 1168 	sub	a, #0x17
   8771 20 0F         [12] 1169 	jr	NZ,00142$
                           1170 ;src/niveles.c:249: initSoldado1(&entidad[1]);
   8773 21 36 A2      [10] 1171 	ld	hl, #(_entidad + 0x0015)
   8776 E5            [11] 1172 	push	hl
   8777 CD D9 83      [17] 1173 	call	_initSoldado1
                           1174 ;src/niveles.c:250: initCarcelero(&entidad[2]);
   877A 21 4B A2      [10] 1175 	ld	hl, #(_entidad + 0x002a)
   877D E3            [19] 1176 	ex	(sp),hl
   877E CD B7 84      [17] 1177 	call	_initCarcelero
   8781 F1            [10] 1178 	pop	af
   8782                    1179 00142$:
                           1180 ;src/niveles.c:252: if (nivel == 24){
   8782 3A 60 A2      [13] 1181 	ld	a,(#_nivel + 0)
   8785 D6 18         [ 7] 1182 	sub	a, #0x18
   8787 20 0F         [12] 1183 	jr	NZ,00144$
                           1184 ;src/niveles.c:253: initSoldado1(&entidad[1]);
   8789 21 36 A2      [10] 1185 	ld	hl, #(_entidad + 0x0015)
   878C E5            [11] 1186 	push	hl
   878D CD D9 83      [17] 1187 	call	_initSoldado1
                           1188 ;src/niveles.c:254: initCaballero(&entidad[2]);
   8790 21 4B A2      [10] 1189 	ld	hl, #(_entidad + 0x002a)
   8793 E3            [19] 1190 	ex	(sp),hl
   8794 CD 6F 84      [17] 1191 	call	_initCaballero
   8797 F1            [10] 1192 	pop	af
   8798                    1193 00144$:
                           1194 ;src/niveles.c:256: if (nivel == 26){
   8798 3A 60 A2      [13] 1195 	ld	a,(#_nivel + 0)
   879B D6 1A         [ 7] 1196 	sub	a, #0x1a
   879D 20 0F         [12] 1197 	jr	NZ,00146$
                           1198 ;src/niveles.c:257: initSoldado2(&entidad[1]);
   879F 21 36 A2      [10] 1199 	ld	hl, #(_entidad + 0x0015)
   87A2 E5            [11] 1200 	push	hl
   87A3 CD 24 84      [17] 1201 	call	_initSoldado2
                           1202 ;src/niveles.c:258: initCaballero(&entidad[2]);
   87A6 21 4B A2      [10] 1203 	ld	hl, #(_entidad + 0x002a)
   87A9 E3            [19] 1204 	ex	(sp),hl
   87AA CD 6F 84      [17] 1205 	call	_initCaballero
   87AD F1            [10] 1206 	pop	af
   87AE                    1207 00146$:
                           1208 ;src/niveles.c:260: if (nivel == 27){
   87AE 3A 60 A2      [13] 1209 	ld	a,(#_nivel + 0)
   87B1 D6 1B         [ 7] 1210 	sub	a, #0x1b
   87B3 20 0F         [12] 1211 	jr	NZ,00148$
                           1212 ;src/niveles.c:261: initSoldado2(&entidad[1]);
   87B5 21 36 A2      [10] 1213 	ld	hl, #(_entidad + 0x0015)
   87B8 E5            [11] 1214 	push	hl
   87B9 CD 24 84      [17] 1215 	call	_initSoldado2
                           1216 ;src/niveles.c:262: initSoldado2(&entidad[2]);    
   87BC 21 4B A2      [10] 1217 	ld	hl, #(_entidad + 0x002a)
   87BF E3            [19] 1218 	ex	(sp),hl
   87C0 CD 24 84      [17] 1219 	call	_initSoldado2
   87C3 F1            [10] 1220 	pop	af
   87C4                    1221 00148$:
                           1222 ;src/niveles.c:264: if (nivel == 28){
   87C4 3A 60 A2      [13] 1223 	ld	a,(#_nivel + 0)
   87C7 D6 1C         [ 7] 1224 	sub	a, #0x1c
   87C9 20 08         [12] 1225 	jr	NZ,00150$
                           1226 ;src/niveles.c:265: initMago(&entidad[2]);
   87CB 21 4B A2      [10] 1227 	ld	hl, #(_entidad + 0x002a)
   87CE E5            [11] 1228 	push	hl
   87CF CD FE 84      [17] 1229 	call	_initMago
   87D2 F1            [10] 1230 	pop	af
   87D3                    1231 00150$:
                           1232 ;src/niveles.c:267: if (nivel == 29){
   87D3 3A 60 A2      [13] 1233 	ld	a,(#_nivel + 0)
   87D6 D6 1D         [ 7] 1234 	sub	a, #0x1d
   87D8 20 0F         [12] 1235 	jr	NZ,00152$
                           1236 ;src/niveles.c:268: initCaballero(&entidad[1]);
   87DA 21 36 A2      [10] 1237 	ld	hl, #(_entidad + 0x0015)
   87DD E5            [11] 1238 	push	hl
   87DE CD 6F 84      [17] 1239 	call	_initCaballero
                           1240 ;src/niveles.c:269: initCaballero(&entidad[2]);
   87E1 21 4B A2      [10] 1241 	ld	hl, #(_entidad + 0x002a)
   87E4 E3            [19] 1242 	ex	(sp),hl
   87E5 CD 6F 84      [17] 1243 	call	_initCaballero
   87E8 F1            [10] 1244 	pop	af
   87E9                    1245 00152$:
                           1246 ;src/niveles.c:271: if (nivel == 30){
   87E9 FD 21 60 A2   [14] 1247 	ld	iy, #_nivel
   87ED FD 7E 00      [19] 1248 	ld	a, 0 (iy)
   87F0 D6 1E         [ 7] 1249 	sub	a, #0x1e
   87F2 20 26         [12] 1250 	jr	NZ,00154$
                           1251 ;src/niveles.c:272: strcpy(entidad[2].name,"Ricardo");
   87F4 11 4C A2      [10] 1252 	ld	de, #(_entidad + 0x002b)
   87F7 21 97 88      [10] 1253 	ld	hl, #___str_18
   87FA AF            [ 4] 1254 	xor	a, a
   87FB                    1255 00339$:
   87FB BE            [ 7] 1256 	cp	a, (hl)
   87FC ED A0         [16] 1257 	ldi
   87FE 20 FB         [12] 1258 	jr	NZ, 00339$
                           1259 ;src/niveles.c:273: entidad[2].max_energy = 1;
   8800 21 57 A2      [10] 1260 	ld	hl, #(_entidad + 0x0036)
   8803 36 01         [10] 1261 	ld	(hl), #0x01
                           1262 ;src/niveles.c:274: entidad[2].attack = 0;
   8805 21 58 A2      [10] 1263 	ld	hl, #(_entidad + 0x0037)
   8808 36 00         [10] 1264 	ld	(hl), #0x00
                           1265 ;src/niveles.c:275: entidad[2].force = 0;
   880A 21 59 A2      [10] 1266 	ld	hl, #(_entidad + 0x0038)
   880D 36 00         [10] 1267 	ld	(hl), #0x00
                           1268 ;src/niveles.c:276: entidad[2].defense = 0;
   880F 21 5A A2      [10] 1269 	ld	hl, #(_entidad + 0x0039)
   8812 36 00         [10] 1270 	ld	(hl), #0x00
                           1271 ;src/niveles.c:277: entidad[2].sprite = (u8*) &G_ricardo[0];
   8814 21 89 74      [10] 1272 	ld	hl, #_G_ricardo
   8817 22 5E A2      [16] 1273 	ld	((_entidad + 0x003d)), hl
   881A                    1274 00154$:
                           1275 ;src/niveles.c:279: if (nivel == 31){
   881A FD 21 60 A2   [14] 1276 	ld	iy, #_nivel
   881E FD 7E 00      [19] 1277 	ld	a, 0 (iy)
   8821 D6 1F         [ 7] 1278 	sub	a, #0x1f
   8823 20 26         [12] 1279 	jr	NZ,00156$
                           1280 ;src/niveles.c:280: strcpy(entidad[2].name,"Lady Sol");
   8825 11 4C A2      [10] 1281 	ld	de, #(_entidad + 0x002b)
   8828 21 9F 88      [10] 1282 	ld	hl, #___str_19
   882B AF            [ 4] 1283 	xor	a, a
   882C                    1284 00342$:
   882C BE            [ 7] 1285 	cp	a, (hl)
   882D ED A0         [16] 1286 	ldi
   882F 20 FB         [12] 1287 	jr	NZ, 00342$
                           1288 ;src/niveles.c:281: entidad[2].max_energy = 1;
   8831 21 57 A2      [10] 1289 	ld	hl, #(_entidad + 0x0036)
   8834 36 01         [10] 1290 	ld	(hl), #0x01
                           1291 ;src/niveles.c:282: entidad[2].attack = 0;
   8836 21 58 A2      [10] 1292 	ld	hl, #(_entidad + 0x0037)
   8839 36 00         [10] 1293 	ld	(hl), #0x00
                           1294 ;src/niveles.c:283: entidad[2].force = 0;
   883B 21 59 A2      [10] 1295 	ld	hl, #(_entidad + 0x0038)
   883E 36 00         [10] 1296 	ld	(hl), #0x00
                           1297 ;src/niveles.c:284: entidad[2].defense = 0;
   8840 21 5A A2      [10] 1298 	ld	hl, #(_entidad + 0x0039)
   8843 36 00         [10] 1299 	ld	(hl), #0x00
                           1300 ;src/niveles.c:285: entidad[2].sprite = (u8*) &G_sol[0];
   8845 21 69 75      [10] 1301 	ld	hl, #_G_sol
   8848 22 5E A2      [16] 1302 	ld	((_entidad + 0x003d)), hl
   884B                    1303 00156$:
                           1304 ;src/niveles.c:288: entidad[1].pos_x = 28;  //Posición del sprite en pantalla
   884B 21 46 A2      [10] 1305 	ld	hl, #(_entidad + 0x0025)
   884E 36 1C         [10] 1306 	ld	(hl), #0x1c
                           1307 ;src/niveles.c:289: entidad[2].pos_x = 36;
   8850 01 5B A2      [10] 1308 	ld	bc, #_entidad + 58
   8853 3E 24         [ 7] 1309 	ld	a, #0x24
   8855 02            [ 7] 1310 	ld	(bc), a
                           1311 ;src/niveles.c:290: if (nivel == 30)
   8856 3A 60 A2      [13] 1312 	ld	a,(#_nivel + 0)
   8859 D6 1E         [ 7] 1313 	sub	a, #0x1e
   885B 20 03         [12] 1314 	jr	NZ,00158$
                           1315 ;src/niveles.c:291: entidad[2].pos_x = 32;
   885D 3E 20         [ 7] 1316 	ld	a, #0x20
   885F 02            [ 7] 1317 	ld	(bc), a
   8860                    1318 00158$:
                           1319 ;src/niveles.c:292: if (nivel == 31)
   8860 3A 60 A2      [13] 1320 	ld	a,(#_nivel + 0)
   8863 D6 1F         [ 7] 1321 	sub	a, #0x1f
   8865 20 03         [12] 1322 	jr	NZ,00160$
                           1323 ;src/niveles.c:293: entidad[2].pos_x = 20;
   8867 3E 14         [ 7] 1324 	ld	a, #0x14
   8869 02            [ 7] 1325 	ld	(bc), a
   886A                    1326 00160$:
                           1327 ;src/niveles.c:294: entidad[1].pos_y = 32;  //Posición en el marcador
   886A 21 48 A2      [10] 1328 	ld	hl, #(_entidad + 0x0027)
   886D 36 20         [10] 1329 	ld	(hl), #0x20
                           1330 ;src/niveles.c:295: entidad[2].pos_y = 40;  //
   886F 21 5D A2      [10] 1331 	ld	hl, #(_entidad + 0x003c)
   8872 36 28         [10] 1332 	ld	(hl), #0x28
                           1333 ;src/niveles.c:296: entidad[1].energy = entidad[1].max_energy;
   8874 01 41 A2      [10] 1334 	ld	bc, #_entidad + 32
   8877 3A 42 A2      [13] 1335 	ld	a, (#(_entidad + 0x0021) + 0)
   887A 02            [ 7] 1336 	ld	(bc), a
                           1337 ;src/niveles.c:297: entidad[2].energy = entidad[2].max_energy;
   887B 01 56 A2      [10] 1338 	ld	bc, #_entidad + 53
   887E 3A 57 A2      [13] 1339 	ld	a, (#(_entidad + 0x0036) + 0)
   8881 02            [ 7] 1340 	ld	(bc), a
   8882 C9            [10] 1341 	ret
   8883                    1342 ___str_16:
   8883 42 6F 73 73 20 4C  1343 	.ascii "Boss Lvl1"
        76 6C 31
   888C 00                 1344 	.db 0x00
   888D                    1345 ___str_17:
   888D 42 6F 73 73 20 4C  1346 	.ascii "Boss Lvl2"
        76 6C 32
   8896 00                 1347 	.db 0x00
   8897                    1348 ___str_18:
   8897 52 69 63 61 72 64  1349 	.ascii "Ricardo"
        6F
   889E 00                 1350 	.db 0x00
   889F                    1351 ___str_19:
   889F 4C 61 64 79 20 53  1352 	.ascii "Lady Sol"
        6F 6C
   88A7 00                 1353 	.db 0x00
                           1354 	.area _CODE
                           1355 	.area _INITIALIZER
                           1356 	.area _CABS (ABS)
