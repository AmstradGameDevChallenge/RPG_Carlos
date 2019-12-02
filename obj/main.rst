                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (CYGWIN)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _m_sfx
                             12 	.globl _chardata
                             13 	.globl _main
                             14 	.globl _setInterruptAtVSYNCStart
                             15 	.globl _intHandler
                             16 	.globl _reproducirMusica
                             17 	.globl _juego
                             18 	.globl _pausaTecladoLibre
                             19 	.globl _efecto_pliegue
                             20 	.globl _mydrawStringM1
                             21 	.globl _cpct_restoreState_mxor_u8
                             22 	.globl _cpct_setSeed_mxor
                             23 	.globl _cpct_akp_SFXPlay
                             24 	.globl _cpct_akp_SFXInit
                             25 	.globl _cpct_akp_musicPlay
                             26 	.globl _cpct_akp_musicInit
                             27 	.globl _cpct_getScreenPtr
                             28 	.globl _cpct_setPALColour
                             29 	.globl _cpct_setPalette
                             30 	.globl _cpct_waitVSYNC
                             31 	.globl _cpct_setVideoMode
                             32 	.globl _cpct_setDrawCharM1
                             33 	.globl _cpct_isAnyKeyPressed_f
                             34 	.globl _cpct_scanKeyboard_if
                             35 	.globl _cpct_memset
                             36 	.globl _cpct_setInterruptHandler
                             37 	.globl _cpct_disableFirmware
                             38 	.globl _musica_sonando
                             39 	.globl _contador_musica
                             40 	.globl _sig_nivel
                             41 	.globl _cursorConsola
                             42 	.globl _nivel
                             43 	.globl _entidad
                             44 	.globl _paletaM1
                             45 	.globl _playFX
                             46 ;--------------------------------------------------------
                             47 ; special function registers
                             48 ;--------------------------------------------------------
                             49 ;--------------------------------------------------------
                             50 ; ram data
                             51 ;--------------------------------------------------------
                             52 	.area _DATA
   A221                      53 _entidad::
   A221                      54 	.ds 63
   A260                      55 _nivel::
   A260                      56 	.ds 1
   A261                      57 _cursorConsola::
   A261                      58 	.ds 1
   A262                      59 _sig_nivel::
   A262                      60 	.ds 1
   A263                      61 _contador_musica::
   A263                      62 	.ds 1
   A264                      63 _musica_sonando::
   A264                      64 	.ds 1
                             65 ;--------------------------------------------------------
                             66 ; ram data
                             67 ;--------------------------------------------------------
                             68 	.area _INITIALIZED
                             69 ;--------------------------------------------------------
                             70 ; absolute external ram data
                             71 ;--------------------------------------------------------
                             72 	.area _DABS (ABS)
                             73 ;--------------------------------------------------------
                             74 ; global & static initialisations
                             75 ;--------------------------------------------------------
                             76 	.area _HOME
                             77 	.area _GSINIT
                             78 	.area _GSFINAL
                             79 	.area _GSINIT
                             80 ;--------------------------------------------------------
                             81 ; Home
                             82 ;--------------------------------------------------------
                             83 	.area _HOME
                             84 	.area _HOME
                             85 ;--------------------------------------------------------
                             86 ; code
                             87 ;--------------------------------------------------------
                             88 	.area _CODE
                             89 ;src/main.c:43: void playFX (u8 instrumento, u8 nota) {
                             90 ;	---------------------------------
                             91 ; Function playFX
                             92 ; ---------------------------------
   598F                      93 _playFX::
                             94 ;src/main.c:49: cpct_akp_SFXInit (m_sfx);
   598F 21 40 03      [10]   95 	ld	hl, #_m_sfx
   5992 E5            [11]   96 	push	hl
   5993 CD F1 90      [17]   97 	call	_cpct_akp_SFXInit
                             98 ;src/main.c:50: cpct_akp_SFXPlay (instrumento, 15, nota, 0, 0, AY_CHANNEL_B);
   5996 26 02         [ 7]   99 	ld	h,#0x02
   5998 E3            [19]  100 	ex	(sp),hl
   5999 33            [ 6]  101 	inc	sp
   599A 21 00 00      [10]  102 	ld	hl, #0x0000
   599D E5            [11]  103 	push	hl
   599E AF            [ 4]  104 	xor	a, a
   599F F5            [11]  105 	push	af
   59A0 33            [ 6]  106 	inc	sp
   59A1 21 07 00      [10]  107 	ld	hl, #7+0
   59A4 39            [11]  108 	add	hl, sp
   59A5 56            [ 7]  109 	ld	d, (hl)
   59A6 1E 0F         [ 7]  110 	ld	e,#0x0f
   59A8 D5            [11]  111 	push	de
   59A9 21 08 00      [10]  112 	ld	hl, #8+0
   59AC 39            [11]  113 	add	hl, sp
   59AD 7E            [ 7]  114 	ld	a, (hl)
   59AE F5            [11]  115 	push	af
   59AF 33            [ 6]  116 	inc	sp
   59B0 CD 0C 91      [17]  117 	call	_cpct_akp_SFXPlay
   59B3 21 07 00      [10]  118 	ld	hl, #7
   59B6 39            [11]  119 	add	hl, sp
   59B7 F9            [ 6]  120 	ld	sp, hl
   59B8 C9            [10]  121 	ret
   59B9                     122 _paletaM1:
   59B9 54                  123 	.db #0x54	; 84	'T'
   59BA 40                  124 	.db #0x40	; 64
   59BB 4B                  125 	.db #0x4b	; 75	'K'
   59BC 44                  126 	.db #0x44	; 68	'D'
                            127 ;src/main.c:53: void reproducirMusica(){
                            128 ;	---------------------------------
                            129 ; Function reproducirMusica
                            130 ; ---------------------------------
   59BD                     131 _reproducirMusica::
                            132 ;src/main.c:64: __endasm;
   59BD D9            [ 4]  133 	EXX
   59BE F5            [11]  134 	PUSH	AF
   59BF C5            [11]  135 	PUSH	BC
   59C0 D5            [11]  136 	PUSH	DE
   59C1 E5            [11]  137 	PUSH	HL
                            138 ;src/main.c:65: cpct_akp_musicPlay();
   59C2 CD 62 89      [17]  139 	call	_cpct_akp_musicPlay
                            140 ;src/main.c:72: __endasm;
   59C5 E1            [10]  141 	POP	HL
   59C6 D1            [10]  142 	POP	DE
   59C7 C1            [10]  143 	POP	BC
   59C8 F1            [10]  144 	POP	AF
   59C9 D9            [ 4]  145 	EXX
   59CA C9            [10]  146 	ret
                            147 ;src/main.c:75: void intHandler(){
                            148 ;	---------------------------------
                            149 ; Function intHandler
                            150 ; ---------------------------------
   59CB                     151 _intHandler::
                            152 ;src/main.c:76: cpct_scanKeyboard_if();  //Para capturar teclado para quitar música o salir durante el juego
   59CB CD 7F 94      [17]  153 	call	_cpct_scanKeyboard_if
                            154 ;src/main.c:80: if (!contador_musica && musica_sonando) {   
   59CE 3A 63 A2      [13]  155 	ld	a,(#_contador_musica + 0)
   59D1 B7            [ 4]  156 	or	a, a
   59D2 20 0E         [12]  157 	jr	NZ,00102$
   59D4 3A 64 A2      [13]  158 	ld	a,(#_musica_sonando + 0)
   59D7 B7            [ 4]  159 	or	a, a
   59D8 28 08         [12]  160 	jr	Z,00102$
                            161 ;src/main.c:81: reproducirMusica();
   59DA CD BD 59      [17]  162 	call	_reproducirMusica
                            163 ;src/main.c:82: contador_musica = 6;
   59DD 21 63 A2      [10]  164 	ld	hl,#_contador_musica + 0
   59E0 36 06         [10]  165 	ld	(hl), #0x06
   59E2                     166 00102$:
                            167 ;src/main.c:85: contador_musica--;
   59E2 21 63 A2      [10]  168 	ld	hl, #_contador_musica+0
   59E5 35            [11]  169 	dec	(hl)
   59E6 C9            [10]  170 	ret
                            171 ;src/main.c:88: void setInterruptAtVSYNCStart(void *intHdl){
                            172 ;	---------------------------------
                            173 ; Function setInterruptAtVSYNCStart
                            174 ; ---------------------------------
   59E7                     175 _setInterruptAtVSYNCStart::
                            176 ;src/main.c:93: cpct_waitVSYNC();
   59E7 CD E7 94      [17]  177 	call	_cpct_waitVSYNC
                            178 ;src/main.c:97: __endasm;
   59EA 76            [ 4]  179 	halt
   59EB 76            [ 4]  180 	halt
                            181 ;src/main.c:99: cpct_waitVSYNC(); //Me aseguro que se espera al final del pintado de la pantalla para cambiar el código de la interrupción
   59EC CD E7 94      [17]  182 	call	_cpct_waitVSYNC
                            183 ;src/main.c:100: cpct_setInterruptHandler(intHdl);
   59EF C1            [10]  184 	pop	bc
   59F0 E1            [10]  185 	pop	hl
   59F1 E5            [11]  186 	push	hl
   59F2 C5            [11]  187 	push	bc
   59F3 C3 A0 96      [10]  188 	jp  _cpct_setInterruptHandler
                            189 ;src/main.c:103: void main(void) {
                            190 ;	---------------------------------
                            191 ; Function main
                            192 ; ---------------------------------
   59F6                     193 _main::
                            194 ;src/main.c:106: contador_musica = 5;
   59F6 21 63 A2      [10]  195 	ld	hl,#_contador_musica + 0
   59F9 36 05         [10]  196 	ld	(hl), #0x05
                            197 ;src/main.c:109: cpct_disableFirmware();
   59FB CD 43 95      [17]  198 	call	_cpct_disableFirmware
                            199 ;src/main.c:110: setInterruptAtVSYNCStart(intHandler);
   59FE 01 CB 59      [10]  200 	ld	bc, #_intHandler
   5A01 C5            [11]  201 	push	bc
   5A02 CD E7 59      [17]  202 	call	_setInterruptAtVSYNCStart
   5A05 F1            [10]  203 	pop	af
                            204 ;src/main.c:114: efecto_pliegue(PLIEGUE);
   5A06 AF            [ 4]  205 	xor	a, a
   5A07 F5            [11]  206 	push	af
   5A08 33            [ 6]  207 	inc	sp
   5A09 CD 81 76      [17]  208 	call	_efecto_pliegue
   5A0C 33            [ 6]  209 	inc	sp
                            210 ;src/main.c:115: while (1) {
   5A0D                     211 00107$:
                            212 ;src/main.c:116: cpct_setVideoMode(1);
   5A0D 2E 01         [ 7]  213 	ld	l, #0x01
   5A0F CD EF 94      [17]  214 	call	_cpct_setVideoMode
                            215 ;src/main.c:117: cpct_clearScreen(0x00);
   5A12 21 00 40      [10]  216 	ld	hl, #0x4000
   5A15 E5            [11]  217 	push	hl
   5A16 AF            [ 4]  218 	xor	a, a
   5A17 F5            [11]  219 	push	af
   5A18 33            [ 6]  220 	inc	sp
   5A19 26 C0         [ 7]  221 	ld	h, #0xc0
   5A1B E5            [11]  222 	push	hl
   5A1C CD 18 95      [17]  223 	call	_cpct_memset
                            224 ;src/main.c:118: cpct_setPalette(paletaM1,4);
   5A1F 21 04 00      [10]  225 	ld	hl, #0x0004
   5A22 E5            [11]  226 	push	hl
   5A23 21 B9 59      [10]  227 	ld	hl, #_paletaM1
   5A26 E5            [11]  228 	push	hl
   5A27 CD 3D 89      [17]  229 	call	_cpct_setPalette
                            230 ;src/main.c:119: cpct_setBorder(HW_BLACK);
   5A2A 21 10 14      [10]  231 	ld	hl, #0x1410
   5A2D E5            [11]  232 	push	hl
   5A2E CD 54 89      [17]  233 	call	_cpct_setPALColour
                            234 ;src/main.c:122: cpct_setDrawCharM1(2, 0);
   5A31 21 02 00      [10]  235 	ld	hl, #0x0002
   5A34 E5            [11]  236 	push	hl
   5A35 CD 4C 96      [17]  237 	call	_cpct_setDrawCharM1
                            238 ;src/main.c:123: mydrawStringM1("         Don Mendo and Lady Sol", cpctm_screenPtr(CPCT_VMEM_START, 0, 0));
   5A38 21 00 C0      [10]  239 	ld	hl, #0xc000
   5A3B E5            [11]  240 	push	hl
   5A3C 21 28 5B      [10]  241 	ld	hl, #___str_0
   5A3F E5            [11]  242 	push	hl
   5A40 CD BA 88      [17]  243 	call	_mydrawStringM1
                            244 ;src/main.c:124: mydrawStringM1("                   in", cpctm_screenPtr(CPCT_VMEM_START, 0, 8));
   5A43 21 50 C0      [10]  245 	ld	hl, #0xc050
   5A46 E5            [11]  246 	push	hl
   5A47 21 48 5B      [10]  247 	ld	hl, #___str_1
   5A4A E5            [11]  248 	push	hl
   5A4B CD BA 88      [17]  249 	call	_mydrawStringM1
                            250 ;src/main.c:125: mydrawStringM1("           Castle Concepcion", cpctm_screenPtr(CPCT_VMEM_START, 0, 16));
   5A4E 21 A0 C0      [10]  251 	ld	hl, #0xc0a0
   5A51 E5            [11]  252 	push	hl
   5A52 21 5E 5B      [10]  253 	ld	hl, #___str_2
   5A55 E5            [11]  254 	push	hl
   5A56 CD BA 88      [17]  255 	call	_mydrawStringM1
                            256 ;src/main.c:126: mydrawStringM1("Mendo was in love with Lady Sol, a rich ", cpctm_screenPtr(CPCT_VMEM_START, 0, 40));
   5A59 21 90 C1      [10]  257 	ld	hl, #0xc190
   5A5C E5            [11]  258 	push	hl
   5A5D 21 7B 5B      [10]  259 	ld	hl, #___str_3
   5A60 E5            [11]  260 	push	hl
   5A61 CD BA 88      [17]  261 	call	_mydrawStringM1
                            262 ;src/main.c:127: mydrawStringM1("and beautiful woman. He was so poor that", cpctm_screenPtr(CPCT_VMEM_START, 0, 48));
   5A64 21 E0 C1      [10]  263 	ld	hl, #0xc1e0
   5A67 E5            [11]  264 	push	hl
   5A68 21 A4 5B      [10]  265 	ld	hl, #___str_4
   5A6B E5            [11]  266 	push	hl
   5A6C CD BA 88      [17]  267 	call	_mydrawStringM1
                            268 ;src/main.c:128: mydrawStringM1("he couldn't marry her. He decided to go ", cpctm_screenPtr(CPCT_VMEM_START, 0, 56));
   5A6F 21 30 C2      [10]  269 	ld	hl, #0xc230
   5A72 E5            [11]  270 	push	hl
   5A73 21 CD 5B      [10]  271 	ld	hl, #___str_5
   5A76 E5            [11]  272 	push	hl
   5A77 CD BA 88      [17]  273 	call	_mydrawStringM1
                            274 ;src/main.c:129: mydrawStringM1("to the Crusades to get Fortune and Fame.", cpctm_screenPtr(CPCT_VMEM_START, 0, 64));
   5A7A 21 80 C2      [10]  275 	ld	hl, #0xc280
   5A7D E5            [11]  276 	push	hl
   5A7E 21 F6 5B      [10]  277 	ld	hl, #___str_6
   5A81 E5            [11]  278 	push	hl
   5A82 CD BA 88      [17]  279 	call	_mydrawStringM1
                            280 ;src/main.c:131: mydrawStringM1("When he became a brave hero, he heard", cpctm_screenPtr(CPCT_VMEM_START, 0, 80));
   5A85 21 20 C3      [10]  281 	ld	hl, #0xc320
   5A88 E5            [11]  282 	push	hl
   5A89 21 1F 5C      [10]  283 	ld	hl, #___str_7
   5A8C E5            [11]  284 	push	hl
   5A8D CD BA 88      [17]  285 	call	_mydrawStringM1
                            286 ;src/main.c:132: mydrawStringM1("Lady Sol was forced to marry don Ricardo", cpctm_screenPtr(CPCT_VMEM_START, 0, 88));
   5A90 21 70 C3      [10]  287 	ld	hl, #0xc370
   5A93 E5            [11]  288 	push	hl
   5A94 21 45 5C      [10]  289 	ld	hl, #___str_8
   5A97 E5            [11]  290 	push	hl
   5A98 CD BA 88      [17]  291 	call	_mydrawStringM1
                            292 ;src/main.c:133: mydrawStringM1("a very important noble. ", cpctm_screenPtr(CPCT_VMEM_START, 0, 96));
   5A9B 21 C0 C3      [10]  293 	ld	hl, #0xc3c0
   5A9E E5            [11]  294 	push	hl
   5A9F 21 6E 5C      [10]  295 	ld	hl, #___str_9
   5AA2 E5            [11]  296 	push	hl
   5AA3 CD BA 88      [17]  297 	call	_mydrawStringM1
                            298 ;src/main.c:135: mydrawStringM1("Bring to an end the bloody Crusades war,", cpctm_screenPtr(CPCT_VMEM_START, 0, 112));
   5AA6 21 60 C4      [10]  299 	ld	hl, #0xc460
   5AA9 E5            [11]  300 	push	hl
   5AAA 21 87 5C      [10]  301 	ld	hl, #___str_10
   5AAD E5            [11]  302 	push	hl
   5AAE CD BA 88      [17]  303 	call	_mydrawStringM1
                            304 ;src/main.c:136: mydrawStringM1("go through the underway passage and ", cpctm_screenPtr(CPCT_VMEM_START, 0, 120));
   5AB1 21 B0 C4      [10]  305 	ld	hl, #0xc4b0
   5AB4 E5            [11]  306 	push	hl
   5AB5 21 B0 5C      [10]  307 	ld	hl, #___str_11
   5AB8 E5            [11]  308 	push	hl
   5AB9 CD BA 88      [17]  309 	call	_mydrawStringM1
                            310 ;src/main.c:137: mydrawStringM1("finally assault the Castle to help Don ", cpctm_screenPtr(CPCT_VMEM_START, 0, 128));
   5ABC 21 00 C5      [10]  311 	ld	hl, #0xc500
   5ABF E5            [11]  312 	push	hl
   5AC0 21 D5 5C      [10]  313 	ld	hl, #___str_12
   5AC3 E5            [11]  314 	push	hl
   5AC4 CD BA 88      [17]  315 	call	_mydrawStringM1
                            316 ;src/main.c:138: mydrawStringM1("Mendo to go back to his love: Lady Sol.", cpctm_screenPtr(CPCT_VMEM_START, 0, 136));
   5AC7 21 50 C5      [10]  317 	ld	hl, #0xc550
   5ACA E5            [11]  318 	push	hl
   5ACB 21 FD 5C      [10]  319 	ld	hl, #___str_13
   5ACE E5            [11]  320 	push	hl
   5ACF CD BA 88      [17]  321 	call	_mydrawStringM1
                            322 ;src/main.c:139: mydrawStringM1("PRESS ANY KEY TO START", cpct_getScreenPtr(CPCT_VMEM_START, 0, 168));
   5AD2 21 00 A8      [10]  323 	ld	hl, #0xa800
   5AD5 E5            [11]  324 	push	hl
   5AD6 26 C0         [ 7]  325 	ld	h, #0xc0
   5AD8 E5            [11]  326 	push	hl
   5AD9 CD 2C 96      [17]  327 	call	_cpct_getScreenPtr
   5ADC 01 25 5D      [10]  328 	ld	bc, #___str_14+0
   5ADF E5            [11]  329 	push	hl
   5AE0 C5            [11]  330 	push	bc
   5AE1 CD BA 88      [17]  331 	call	_mydrawStringM1
                            332 ;src/main.c:140: cpct_akp_musicInit((u8*) m_intro);
   5AE4 01 CD 03      [10]  333 	ld	bc, #_m_intro+0
   5AE7 C5            [11]  334 	push	bc
   5AE8 CD 65 90      [17]  335 	call	_cpct_akp_musicInit
   5AEB F1            [10]  336 	pop	af
                            337 ;src/main.c:141: musica_sonando = 1;
   5AEC 21 64 A2      [10]  338 	ld	hl,#_musica_sonando + 0
   5AEF 36 01         [10]  339 	ld	(hl), #0x01
                            340 ;src/main.c:142: efecto_pliegue(DESPLIEGUE);
   5AF1 3E 01         [ 7]  341 	ld	a, #0x01
   5AF3 F5            [11]  342 	push	af
   5AF4 33            [ 6]  343 	inc	sp
   5AF5 CD 81 76      [17]  344 	call	_efecto_pliegue
   5AF8 33            [ 6]  345 	inc	sp
                            346 ;src/main.c:144: pausaTecladoLibre();
   5AF9 CD B9 76      [17]  347 	call	_pausaTecladoLibre
                            348 ;src/main.c:148: do {
   5AFC 0E 00         [ 7]  349 	ld	c, #0x00
   5AFE                     350 00101$:
                            351 ;src/main.c:150: semilla++;
   5AFE 0C            [ 4]  352 	inc	c
                            353 ;src/main.c:152: while (!cpct_isAnyKeyPressed_f());
   5AFF C5            [11]  354 	push	bc
   5B00 CD FD 94      [17]  355 	call	_cpct_isAnyKeyPressed_f
   5B03 C1            [10]  356 	pop	bc
   5B04 7D            [ 4]  357 	ld	a, l
   5B05 B7            [ 4]  358 	or	a, a
   5B06 28 F6         [12]  359 	jr	Z,00101$
                            360 ;src/main.c:155: if (!semilla)
   5B08 79            [ 4]  361 	ld	a,c
   5B09 6F            [ 4]  362 	ld	l,a
   5B0A B7            [ 4]  363 	or	a, a
   5B0B 20 02         [12]  364 	jr	NZ,00105$
                            365 ;src/main.c:156: semilla = 1;
   5B0D 2E 01         [ 7]  366 	ld	l, #0x01
   5B0F                     367 00105$:
                            368 ;src/main.c:158: cpct_srand8(semilla);
   5B0F 26 00         [ 7]  369 	ld	h, #0x00
   5B11 11 00 00      [10]  370 	ld	de,#0x0000
   5B14 CD E2 92      [17]  371 	call	_cpct_setSeed_mxor
   5B17 CD 2B 93      [17]  372 	call	_cpct_restoreState_mxor_u8
                            373 ;src/main.c:159: cpct_akp_musicInit((u8*) m_sfx);
   5B1A 21 40 03      [10]  374 	ld	hl, #_m_sfx
   5B1D E5            [11]  375 	push	hl
   5B1E CD 65 90      [17]  376 	call	_cpct_akp_musicInit
   5B21 F1            [10]  377 	pop	af
                            378 ;src/main.c:162: juego();
   5B22 CD 6A 62      [17]  379 	call	_juego
   5B25 C3 0D 5A      [10]  380 	jp	00107$
   5B28                     381 ___str_0:
   5B28 20 20 20 20 20 20   382 	.ascii "         Don Mendo and Lady Sol"
        20 20 20 44 6F 6E
        20 4D 65 6E 64 6F
        20 61 6E 64 20 4C
        61 64 79 20 53 6F
        6C
   5B47 00                  383 	.db 0x00
   5B48                     384 ___str_1:
   5B48 20 20 20 20 20 20   385 	.ascii "                   in"
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 69 6E
   5B5D 00                  386 	.db 0x00
   5B5E                     387 ___str_2:
   5B5E 20 20 20 20 20 20   388 	.ascii "           Castle Concepcion"
        20 20 20 20 20 43
        61 73 74 6C 65 20
        43 6F 6E 63 65 70
        63 69 6F 6E
   5B7A 00                  389 	.db 0x00
   5B7B                     390 ___str_3:
   5B7B 4D 65 6E 64 6F 20   391 	.ascii "Mendo was in love with Lady Sol, a rich "
        77 61 73 20 69 6E
        20 6C 6F 76 65 20
        77 69 74 68 20 4C
        61 64 79 20 53 6F
        6C 2C 20 61 20 72
        69 63 68 20
   5BA3 00                  392 	.db 0x00
   5BA4                     393 ___str_4:
   5BA4 61 6E 64 20 62 65   394 	.ascii "and beautiful woman. He was so poor that"
        61 75 74 69 66 75
        6C 20 77 6F 6D 61
        6E 2E 20 48 65 20
        77 61 73 20 73 6F
        20 70 6F 6F 72 20
        74 68 61 74
   5BCC 00                  395 	.db 0x00
   5BCD                     396 ___str_5:
   5BCD 68 65 20 63 6F 75   397 	.ascii "he couldn't marry her. He decided to go "
        6C 64 6E 27 74 20
        6D 61 72 72 79 20
        68 65 72 2E 20 48
        65 20 64 65 63 69
        64 65 64 20 74 6F
        20 67 6F 20
   5BF5 00                  398 	.db 0x00
   5BF6                     399 ___str_6:
   5BF6 74 6F 20 74 68 65   400 	.ascii "to the Crusades to get Fortune and Fame."
        20 43 72 75 73 61
        64 65 73 20 74 6F
        20 67 65 74 20 46
        6F 72 74 75 6E 65
        20 61 6E 64 20 46
        61 6D 65 2E
   5C1E 00                  401 	.db 0x00
   5C1F                     402 ___str_7:
   5C1F 57 68 65 6E 20 68   403 	.ascii "When he became a brave hero, he heard"
        65 20 62 65 63 61
        6D 65 20 61 20 62
        72 61 76 65 20 68
        65 72 6F 2C 20 68
        65 20 68 65 61 72
        64
   5C44 00                  404 	.db 0x00
   5C45                     405 ___str_8:
   5C45 4C 61 64 79 20 53   406 	.ascii "Lady Sol was forced to marry don Ricardo"
        6F 6C 20 77 61 73
        20 66 6F 72 63 65
        64 20 74 6F 20 6D
        61 72 72 79 20 64
        6F 6E 20 52 69 63
        61 72 64 6F
   5C6D 00                  407 	.db 0x00
   5C6E                     408 ___str_9:
   5C6E 61 20 76 65 72 79   409 	.ascii "a very important noble. "
        20 69 6D 70 6F 72
        74 61 6E 74 20 6E
        6F 62 6C 65 2E 20
   5C86 00                  410 	.db 0x00
   5C87                     411 ___str_10:
   5C87 42 72 69 6E 67 20   412 	.ascii "Bring to an end the bloody Crusades war,"
        74 6F 20 61 6E 20
        65 6E 64 20 74 68
        65 20 62 6C 6F 6F
        64 79 20 43 72 75
        73 61 64 65 73 20
        77 61 72 2C
   5CAF 00                  413 	.db 0x00
   5CB0                     414 ___str_11:
   5CB0 67 6F 20 74 68 72   415 	.ascii "go through the underway passage and "
        6F 75 67 68 20 74
        68 65 20 75 6E 64
        65 72 77 61 79 20
        70 61 73 73 61 67
        65 20 61 6E 64 20
   5CD4 00                  416 	.db 0x00
   5CD5                     417 ___str_12:
   5CD5 66 69 6E 61 6C 6C   418 	.ascii "finally assault the Castle to help Don "
        79 20 61 73 73 61
        75 6C 74 20 74 68
        65 20 43 61 73 74
        6C 65 20 74 6F 20
        68 65 6C 70 20 44
        6F 6E 20
   5CFC 00                  419 	.db 0x00
   5CFD                     420 ___str_13:
   5CFD 4D 65 6E 64 6F 20   421 	.ascii "Mendo to go back to his love: Lady Sol."
        74 6F 20 67 6F 20
        62 61 63 6B 20 74
        6F 20 68 69 73 20
        6C 6F 76 65 3A 20
        4C 61 64 79 20 53
        6F 6C 2E
   5D24 00                  422 	.db 0x00
   5D25                     423 ___str_14:
   5D25 50 52 45 53 53 20   424 	.ascii "PRESS ANY KEY TO START"
        41 4E 59 20 4B 45
        59 20 54 4F 20 53
        54 41 52 54
   5D3B 00                  425 	.db 0x00
                            426 	.area _CODE
                            427 	.area _INITIALIZER
                            428 	.area _CABS (ABS)
   0040                     429 	.org 0x0040
   0040                     430 _chardata:
   0040 00                  431 	.db #0x00	; 0
   0041 00                  432 	.db #0x00	; 0
   0042 00                  433 	.db #0x00	; 0
   0043 00                  434 	.db #0x00	; 0
   0044 00                  435 	.db #0x00	; 0
   0045 00                  436 	.db #0x00	; 0
   0046 00                  437 	.db #0x00	; 0
   0047 00                  438 	.db #0x00	; 0
   0048 18                  439 	.db #0x18	; 24
   0049 18                  440 	.db #0x18	; 24
   004A 18                  441 	.db #0x18	; 24
   004B 18                  442 	.db #0x18	; 24
   004C 18                  443 	.db #0x18	; 24
   004D 00                  444 	.db #0x00	; 0
   004E 18                  445 	.db #0x18	; 24
   004F 00                  446 	.db #0x00	; 0
   0050 66                  447 	.db #0x66	; 102	'f'
   0051 66                  448 	.db #0x66	; 102	'f'
   0052 00                  449 	.db #0x00	; 0
   0053 00                  450 	.db #0x00	; 0
   0054 00                  451 	.db #0x00	; 0
   0055 00                  452 	.db #0x00	; 0
   0056 00                  453 	.db #0x00	; 0
   0057 00                  454 	.db #0x00	; 0
   0058 66                  455 	.db #0x66	; 102	'f'
   0059 FF                  456 	.db #0xff	; 255
   005A FF                  457 	.db #0xff	; 255
   005B 66                  458 	.db #0x66	; 102	'f'
   005C FF                  459 	.db #0xff	; 255
   005D FF                  460 	.db #0xff	; 255
   005E 66                  461 	.db #0x66	; 102	'f'
   005F 00                  462 	.db #0x00	; 0
   0060 3E                  463 	.db #0x3e	; 62
   0061 54                  464 	.db #0x54	; 84	'T'
   0062 54                  465 	.db #0x54	; 84	'T'
   0063 3E                  466 	.db #0x3e	; 62
   0064 15                  467 	.db #0x15	; 21
   0065 15                  468 	.db #0x15	; 21
   0066 7E                  469 	.db #0x7e	; 126
   0067 14                  470 	.db #0x14	; 20
   0068 00                  471 	.db #0x00	; 0
   0069 62                  472 	.db #0x62	; 98	'b'
   006A 64                  473 	.db #0x64	; 100	'd'
   006B 08                  474 	.db #0x08	; 8
   006C 10                  475 	.db #0x10	; 16
   006D 26                  476 	.db #0x26	; 38
   006E 46                  477 	.db #0x46	; 70	'F'
   006F 00                  478 	.db #0x00	; 0
   0070 38                  479 	.db #0x38	; 56	'8'
   0071 28                  480 	.db #0x28	; 40
   0072 38                  481 	.db #0x38	; 56	'8'
   0073 70                  482 	.db #0x70	; 112	'p'
   0074 5E                  483 	.db #0x5e	; 94
   0075 6C                  484 	.db #0x6c	; 108	'l'
   0076 36                  485 	.db #0x36	; 54	'6'
   0077 00                  486 	.db #0x00	; 0
   0078 18                  487 	.db #0x18	; 24
   0079 18                  488 	.db #0x18	; 24
   007A 00                  489 	.db #0x00	; 0
   007B 00                  490 	.db #0x00	; 0
   007C 00                  491 	.db #0x00	; 0
   007D 00                  492 	.db #0x00	; 0
   007E 00                  493 	.db #0x00	; 0
   007F 00                  494 	.db #0x00	; 0
   0080 08                  495 	.db #0x08	; 8
   0081 10                  496 	.db #0x10	; 16
   0082 10                  497 	.db #0x10	; 16
   0083 10                  498 	.db #0x10	; 16
   0084 10                  499 	.db #0x10	; 16
   0085 10                  500 	.db #0x10	; 16
   0086 08                  501 	.db #0x08	; 8
   0087 00                  502 	.db #0x00	; 0
   0088 10                  503 	.db #0x10	; 16
   0089 08                  504 	.db #0x08	; 8
   008A 08                  505 	.db #0x08	; 8
   008B 08                  506 	.db #0x08	; 8
   008C 08                  507 	.db #0x08	; 8
   008D 08                  508 	.db #0x08	; 8
   008E 10                  509 	.db #0x10	; 16
   008F 00                  510 	.db #0x00	; 0
   0090 00                  511 	.db #0x00	; 0
   0091 18                  512 	.db #0x18	; 24
   0092 18                  513 	.db #0x18	; 24
   0093 7E                  514 	.db #0x7e	; 126
   0094 7E                  515 	.db #0x7e	; 126
   0095 18                  516 	.db #0x18	; 24
   0096 18                  517 	.db #0x18	; 24
   0097 00                  518 	.db #0x00	; 0
   0098 00                  519 	.db #0x00	; 0
   0099 5A                  520 	.db #0x5a	; 90	'Z'
   009A 3C                  521 	.db #0x3c	; 60
   009B 7E                  522 	.db #0x7e	; 126
   009C 7E                  523 	.db #0x7e	; 126
   009D 3C                  524 	.db #0x3c	; 60
   009E 5A                  525 	.db #0x5a	; 90	'Z'
   009F 00                  526 	.db #0x00	; 0
   00A0 00                  527 	.db #0x00	; 0
   00A1 00                  528 	.db #0x00	; 0
   00A2 00                  529 	.db #0x00	; 0
   00A3 00                  530 	.db #0x00	; 0
   00A4 00                  531 	.db #0x00	; 0
   00A5 08                  532 	.db #0x08	; 8
   00A6 08                  533 	.db #0x08	; 8
   00A7 10                  534 	.db #0x10	; 16
   00A8 00                  535 	.db #0x00	; 0
   00A9 00                  536 	.db #0x00	; 0
   00AA 00                  537 	.db #0x00	; 0
   00AB 3C                  538 	.db #0x3c	; 60
   00AC 3C                  539 	.db #0x3c	; 60
   00AD 00                  540 	.db #0x00	; 0
   00AE 00                  541 	.db #0x00	; 0
   00AF 00                  542 	.db #0x00	; 0
   00B0 00                  543 	.db #0x00	; 0
   00B1 00                  544 	.db #0x00	; 0
   00B2 00                  545 	.db #0x00	; 0
   00B3 00                  546 	.db #0x00	; 0
   00B4 00                  547 	.db #0x00	; 0
   00B5 00                  548 	.db #0x00	; 0
   00B6 18                  549 	.db #0x18	; 24
   00B7 18                  550 	.db #0x18	; 24
   00B8 04                  551 	.db #0x04	; 4
   00B9 04                  552 	.db #0x04	; 4
   00BA 08                  553 	.db #0x08	; 8
   00BB 08                  554 	.db #0x08	; 8
   00BC 10                  555 	.db #0x10	; 16
   00BD 10                  556 	.db #0x10	; 16
   00BE 20                  557 	.db #0x20	; 32
   00BF 20                  558 	.db #0x20	; 32
   00C0 18                  559 	.db #0x18	; 24
   00C1 24                  560 	.db #0x24	; 36
   00C2 24                  561 	.db #0x24	; 36
   00C3 24                  562 	.db #0x24	; 36
   00C4 24                  563 	.db #0x24	; 36
   00C5 24                  564 	.db #0x24	; 36
   00C6 18                  565 	.db #0x18	; 24
   00C7 00                  566 	.db #0x00	; 0
   00C8 08                  567 	.db #0x08	; 8
   00C9 18                  568 	.db #0x18	; 24
   00CA 28                  569 	.db #0x28	; 40
   00CB 08                  570 	.db #0x08	; 8
   00CC 08                  571 	.db #0x08	; 8
   00CD 08                  572 	.db #0x08	; 8
   00CE 08                  573 	.db #0x08	; 8
   00CF 00                  574 	.db #0x00	; 0
   00D0 18                  575 	.db #0x18	; 24
   00D1 24                  576 	.db #0x24	; 36
   00D2 04                  577 	.db #0x04	; 4
   00D3 04                  578 	.db #0x04	; 4
   00D4 08                  579 	.db #0x08	; 8
   00D5 10                  580 	.db #0x10	; 16
   00D6 3C                  581 	.db #0x3c	; 60
   00D7 00                  582 	.db #0x00	; 0
   00D8 18                  583 	.db #0x18	; 24
   00D9 04                  584 	.db #0x04	; 4
   00DA 04                  585 	.db #0x04	; 4
   00DB 08                  586 	.db #0x08	; 8
   00DC 04                  587 	.db #0x04	; 4
   00DD 04                  588 	.db #0x04	; 4
   00DE 18                  589 	.db #0x18	; 24
   00DF 00                  590 	.db #0x00	; 0
   00E0 08                  591 	.db #0x08	; 8
   00E1 18                  592 	.db #0x18	; 24
   00E2 28                  593 	.db #0x28	; 40
   00E3 48                  594 	.db #0x48	; 72	'H'
   00E4 7C                  595 	.db #0x7c	; 124
   00E5 08                  596 	.db #0x08	; 8
   00E6 08                  597 	.db #0x08	; 8
   00E7 00                  598 	.db #0x00	; 0
   00E8 3C                  599 	.db #0x3c	; 60
   00E9 20                  600 	.db #0x20	; 32
   00EA 20                  601 	.db #0x20	; 32
   00EB 3C                  602 	.db #0x3c	; 60
   00EC 04                  603 	.db #0x04	; 4
   00ED 04                  604 	.db #0x04	; 4
   00EE 38                  605 	.db #0x38	; 56	'8'
   00EF 00                  606 	.db #0x00	; 0
   00F0 18                  607 	.db #0x18	; 24
   00F1 20                  608 	.db #0x20	; 32
   00F2 20                  609 	.db #0x20	; 32
   00F3 38                  610 	.db #0x38	; 56	'8'
   00F4 24                  611 	.db #0x24	; 36
   00F5 24                  612 	.db #0x24	; 36
   00F6 18                  613 	.db #0x18	; 24
   00F7 00                  614 	.db #0x00	; 0
   00F8 3C                  615 	.db #0x3c	; 60
   00F9 04                  616 	.db #0x04	; 4
   00FA 04                  617 	.db #0x04	; 4
   00FB 08                  618 	.db #0x08	; 8
   00FC 08                  619 	.db #0x08	; 8
   00FD 10                  620 	.db #0x10	; 16
   00FE 10                  621 	.db #0x10	; 16
   00FF 00                  622 	.db #0x00	; 0
   0100 18                  623 	.db #0x18	; 24
   0101 24                  624 	.db #0x24	; 36
   0102 24                  625 	.db #0x24	; 36
   0103 18                  626 	.db #0x18	; 24
   0104 24                  627 	.db #0x24	; 36
   0105 24                  628 	.db #0x24	; 36
   0106 18                  629 	.db #0x18	; 24
   0107 00                  630 	.db #0x00	; 0
   0108 18                  631 	.db #0x18	; 24
   0109 24                  632 	.db #0x24	; 36
   010A 24                  633 	.db #0x24	; 36
   010B 1C                  634 	.db #0x1c	; 28
   010C 04                  635 	.db #0x04	; 4
   010D 04                  636 	.db #0x04	; 4
   010E 18                  637 	.db #0x18	; 24
   010F 00                  638 	.db #0x00	; 0
   0110 00                  639 	.db #0x00	; 0
   0111 18                  640 	.db #0x18	; 24
   0112 18                  641 	.db #0x18	; 24
   0113 00                  642 	.db #0x00	; 0
   0114 00                  643 	.db #0x00	; 0
   0115 18                  644 	.db #0x18	; 24
   0116 18                  645 	.db #0x18	; 24
   0117 00                  646 	.db #0x00	; 0
   0118 00                  647 	.db #0x00	; 0
   0119 18                  648 	.db #0x18	; 24
   011A 18                  649 	.db #0x18	; 24
   011B 00                  650 	.db #0x00	; 0
   011C 00                  651 	.db #0x00	; 0
   011D 18                  652 	.db #0x18	; 24
   011E 18                  653 	.db #0x18	; 24
   011F 30                  654 	.db #0x30	; 48	'0'
   0120 0C                  655 	.db #0x0c	; 12
   0121 18                  656 	.db #0x18	; 24
   0122 30                  657 	.db #0x30	; 48	'0'
   0123 60                  658 	.db #0x60	; 96
   0124 30                  659 	.db #0x30	; 48	'0'
   0125 18                  660 	.db #0x18	; 24
   0126 0C                  661 	.db #0x0c	; 12
   0127 00                  662 	.db #0x00	; 0
   0128 00                  663 	.db #0x00	; 0
   0129 7E                  664 	.db #0x7e	; 126
   012A 7E                  665 	.db #0x7e	; 126
   012B 00                  666 	.db #0x00	; 0
   012C 00                  667 	.db #0x00	; 0
   012D 7E                  668 	.db #0x7e	; 126
   012E 7E                  669 	.db #0x7e	; 126
   012F 00                  670 	.db #0x00	; 0
   0130 30                  671 	.db #0x30	; 48	'0'
   0131 18                  672 	.db #0x18	; 24
   0132 0C                  673 	.db #0x0c	; 12
   0133 06                  674 	.db #0x06	; 6
   0134 0C                  675 	.db #0x0c	; 12
   0135 18                  676 	.db #0x18	; 24
   0136 30                  677 	.db #0x30	; 48	'0'
   0137 00                  678 	.db #0x00	; 0
   0138 1C                  679 	.db #0x1c	; 28
   0139 22                  680 	.db #0x22	; 34
   013A 02                  681 	.db #0x02	; 2
   013B 04                  682 	.db #0x04	; 4
   013C 18                  683 	.db #0x18	; 24
   013D 00                  684 	.db #0x00	; 0
   013E 18                  685 	.db #0x18	; 24
   013F 00                  686 	.db #0x00	; 0
   0140 7C                  687 	.db #0x7c	; 124
   0141 82                  688 	.db #0x82	; 130
   0142 BA                  689 	.db #0xba	; 186
   0143 AA                  690 	.db #0xaa	; 170
   0144 BC                  691 	.db #0xbc	; 188
   0145 80                  692 	.db #0x80	; 128
   0146 7E                  693 	.db #0x7e	; 126
   0147 00                  694 	.db #0x00	; 0
   0148 30                  695 	.db #0x30	; 48	'0'
   0149 78                  696 	.db #0x78	; 120	'x'
   014A CC                  697 	.db #0xcc	; 204
   014B 64                  698 	.db #0x64	; 100	'd'
   014C FC                  699 	.db #0xfc	; 252
   014D 86                  700 	.db #0x86	; 134
   014E 86                  701 	.db #0x86	; 134
   014F 00                  702 	.db #0x00	; 0
   0150 78                  703 	.db #0x78	; 120	'x'
   0151 6C                  704 	.db #0x6c	; 108	'l'
   0152 24                  705 	.db #0x24	; 36
   0153 3E                  706 	.db #0x3e	; 62
   0154 62                  707 	.db #0x62	; 98	'b'
   0155 42                  708 	.db #0x42	; 66	'B'
   0156 7E                  709 	.db #0x7e	; 126
   0157 00                  710 	.db #0x00	; 0
   0158 1C                  711 	.db #0x1c	; 28
   0159 33                  712 	.db #0x33	; 51	'3'
   015A 62                  713 	.db #0x62	; 98	'b'
   015B C0                  714 	.db #0xc0	; 192
   015C C0                  715 	.db #0xc0	; 192
   015D C2                  716 	.db #0xc2	; 194
   015E 3C                  717 	.db #0x3c	; 60
   015F 00                  718 	.db #0x00	; 0
   0160 70                  719 	.db #0x70	; 112	'p'
   0161 2C                  720 	.db #0x2c	; 44
   0162 26                  721 	.db #0x26	; 38
   0163 22                  722 	.db #0x22	; 34
   0164 22                  723 	.db #0x22	; 34
   0165 62                  724 	.db #0x62	; 98	'b'
   0166 7E                  725 	.db #0x7e	; 126
   0167 00                  726 	.db #0x00	; 0
   0168 3F                  727 	.db #0x3f	; 63
   0169 22                  728 	.db #0x22	; 34
   016A 22                  729 	.db #0x22	; 34
   016B 38                  730 	.db #0x38	; 56	'8'
   016C 20                  731 	.db #0x20	; 32
   016D 60                  732 	.db #0x60	; 96
   016E 7C                  733 	.db #0x7c	; 124
   016F 00                  734 	.db #0x00	; 0
   0170 3E                  735 	.db #0x3e	; 62
   0171 26                  736 	.db #0x26	; 38
   0172 20                  737 	.db #0x20	; 32
   0173 78                  738 	.db #0x78	; 120	'x'
   0174 40                  739 	.db #0x40	; 64
   0175 40                  740 	.db #0x40	; 64
   0176 40                  741 	.db #0x40	; 64
   0177 00                  742 	.db #0x00	; 0
   0178 3E                  743 	.db #0x3e	; 62
   0179 63                  744 	.db #0x63	; 99	'c'
   017A 62                  745 	.db #0x62	; 98	'b'
   017B 40                  746 	.db #0x40	; 64
   017C CE                  747 	.db #0xce	; 206
   017D C2                  748 	.db #0xc2	; 194
   017E 3C                  749 	.db #0x3c	; 60
   017F 00                  750 	.db #0x00	; 0
   0180 73                  751 	.db #0x73	; 115	's'
   0181 23                  752 	.db #0x23	; 35
   0182 23                  753 	.db #0x23	; 35
   0183 3F                  754 	.db #0x3f	; 63
   0184 63                  755 	.db #0x63	; 99	'c'
   0185 47                  756 	.db #0x47	; 71	'G'
   0186 46                  757 	.db #0x46	; 70	'F'
   0187 00                  758 	.db #0x00	; 0
   0188 3E                  759 	.db #0x3e	; 62
   0189 44                  760 	.db #0x44	; 68	'D'
   018A 0C                  761 	.db #0x0c	; 12
   018B 08                  762 	.db #0x08	; 8
   018C 08                  763 	.db #0x08	; 8
   018D 18                  764 	.db #0x18	; 24
   018E 7E                  765 	.db #0x7e	; 126
   018F 00                  766 	.db #0x00	; 0
   0190 7E                  767 	.db #0x7e	; 126
   0191 0C                  768 	.db #0x0c	; 12
   0192 04                  769 	.db #0x04	; 4
   0193 0C                  770 	.db #0x0c	; 12
   0194 08                  771 	.db #0x08	; 8
   0195 58                  772 	.db #0x58	; 88	'X'
   0196 70                  773 	.db #0x70	; 112	'p'
   0197 00                  774 	.db #0x00	; 0
   0198 40                  775 	.db #0x40	; 64
   0199 66                  776 	.db #0x66	; 102	'f'
   019A 3C                  777 	.db #0x3c	; 60
   019B 30                  778 	.db #0x30	; 48	'0'
   019C 78                  779 	.db #0x78	; 120	'x'
   019D 4C                  780 	.db #0x4c	; 76	'L'
   019E C4                  781 	.db #0xc4	; 196
   019F 00                  782 	.db #0x00	; 0
   01A0 30                  783 	.db #0x30	; 48	'0'
   01A1 20                  784 	.db #0x20	; 32
   01A2 20                  785 	.db #0x20	; 32
   01A3 20                  786 	.db #0x20	; 32
   01A4 60                  787 	.db #0x60	; 96
   01A5 60                  788 	.db #0x60	; 96
   01A6 7C                  789 	.db #0x7c	; 124
   01A7 00                  790 	.db #0x00	; 0
   01A8 22                  791 	.db #0x22	; 34
   01A9 76                  792 	.db #0x76	; 118	'v'
   01AA 5E                  793 	.db #0x5e	; 94
   01AB 5A                  794 	.db #0x5a	; 90	'Z'
   01AC 42                  795 	.db #0x42	; 66	'B'
   01AD C6                  796 	.db #0xc6	; 198
   01AE C4                  797 	.db #0xc4	; 196
   01AF 00                  798 	.db #0x00	; 0
   01B0 10                  799 	.db #0x10	; 16
   01B1 36                  800 	.db #0x36	; 54	'6'
   01B2 36                  801 	.db #0x36	; 54	'6'
   01B3 7E                  802 	.db #0x7e	; 126
   01B4 4C                  803 	.db #0x4c	; 76	'L'
   01B5 4C                  804 	.db #0x4c	; 76	'L'
   01B6 CC                  805 	.db #0xcc	; 204
   01B7 00                  806 	.db #0x00	; 0
   01B8 3C                  807 	.db #0x3c	; 60
   01B9 42                  808 	.db #0x42	; 66	'B'
   01BA 42                  809 	.db #0x42	; 66	'B'
   01BB C2                  810 	.db #0xc2	; 194
   01BC 82                  811 	.db #0x82	; 130
   01BD C6                  812 	.db #0xc6	; 198
   01BE 7C                  813 	.db #0x7c	; 124
   01BF 00                  814 	.db #0x00	; 0
   01C0 3C                  815 	.db #0x3c	; 60
   01C1 16                  816 	.db #0x16	; 22
   01C2 32                  817 	.db #0x32	; 50	'2'
   01C3 22                  818 	.db #0x22	; 34
   01C4 3C                  819 	.db #0x3c	; 60
   01C5 60                  820 	.db #0x60	; 96
   01C6 40                  821 	.db #0x40	; 64
   01C7 00                  822 	.db #0x00	; 0
   01C8 3C                  823 	.db #0x3c	; 60
   01C9 7C                  824 	.db #0x7c	; 124
   01CA 46                  825 	.db #0x46	; 70	'F'
   01CB C2                  826 	.db #0xc2	; 194
   01CC 8E                  827 	.db #0x8e	; 142
   01CD 4C                  828 	.db #0x4c	; 76	'L'
   01CE 76                  829 	.db #0x76	; 118	'v'
   01CF 00                  830 	.db #0x00	; 0
   01D0 3C                  831 	.db #0x3c	; 60
   01D1 26                  832 	.db #0x26	; 38
   01D2 22                  833 	.db #0x22	; 34
   01D3 46                  834 	.db #0x46	; 70	'F'
   01D4 7C                  835 	.db #0x7c	; 124
   01D5 58                  836 	.db #0x58	; 88	'X'
   01D6 4C                  837 	.db #0x4c	; 76	'L'
   01D7 00                  838 	.db #0x00	; 0
   01D8 1C                  839 	.db #0x1c	; 28
   01D9 36                  840 	.db #0x36	; 54	'6'
   01DA 30                  841 	.db #0x30	; 48	'0'
   01DB 18                  842 	.db #0x18	; 24
   01DC 0C                  843 	.db #0x0c	; 12
   01DD CC                  844 	.db #0xcc	; 204
   01DE 78                  845 	.db #0x78	; 120	'x'
   01DF 00                  846 	.db #0x00	; 0
   01E0 7F                  847 	.db #0x7f	; 127
   01E1 0C                  848 	.db #0x0c	; 12
   01E2 18                  849 	.db #0x18	; 24
   01E3 10                  850 	.db #0x10	; 16
   01E4 30                  851 	.db #0x30	; 48	'0'
   01E5 60                  852 	.db #0x60	; 96
   01E6 60                  853 	.db #0x60	; 96
   01E7 00                  854 	.db #0x00	; 0
   01E8 21                  855 	.db #0x21	; 33
   01E9 22                  856 	.db #0x22	; 34
   01EA 62                  857 	.db #0x62	; 98	'b'
   01EB 42                  858 	.db #0x42	; 66	'B'
   01EC C2                  859 	.db #0xc2	; 194
   01ED C6                  860 	.db #0xc6	; 198
   01EE FC                  861 	.db #0xfc	; 252
   01EF 00                  862 	.db #0x00	; 0
   01F0 46                  863 	.db #0x46	; 70	'F'
   01F1 46                  864 	.db #0x46	; 70	'F'
   01F2 44                  865 	.db #0x44	; 68	'D'
   01F3 48                  866 	.db #0x48	; 72	'H'
   01F4 68                  867 	.db #0x68	; 104	'h'
   01F5 78                  868 	.db #0x78	; 120	'x'
   01F6 70                  869 	.db #0x70	; 112	'p'
   01F7 00                  870 	.db #0x00	; 0
   01F8 40                  871 	.db #0x40	; 64
   01F9 42                  872 	.db #0x42	; 66	'B'
   01FA 42                  873 	.db #0x42	; 66	'B'
   01FB 96                  874 	.db #0x96	; 150
   01FC B4                  875 	.db #0xb4	; 180
   01FD AC                  876 	.db #0xac	; 172
   01FE EC                  877 	.db #0xec	; 236
   01FF 00                  878 	.db #0x00	; 0
   0200 66                  879 	.db #0x66	; 102	'f'
   0201 66                  880 	.db #0x66	; 102	'f'
   0202 18                  881 	.db #0x18	; 24
   0203 18                  882 	.db #0x18	; 24
   0204 6C                  883 	.db #0x6c	; 108	'l'
   0205 C4                  884 	.db #0xc4	; 196
   0206 C4                  885 	.db #0xc4	; 196
   0207 00                  886 	.db #0x00	; 0
   0208 46                  887 	.db #0x46	; 70	'F'
   0209 26                  888 	.db #0x26	; 38
   020A 28                  889 	.db #0x28	; 40
   020B 38                  890 	.db #0x38	; 56	'8'
   020C 30                  891 	.db #0x30	; 48	'0'
   020D 20                  892 	.db #0x20	; 32
   020E 20                  893 	.db #0x20	; 32
   020F 00                  894 	.db #0x00	; 0
   0210 1E                  895 	.db #0x1e	; 30
   0211 7E                  896 	.db #0x7e	; 126
   0212 0C                  897 	.db #0x0c	; 12
   0213 1C                  898 	.db #0x1c	; 28
   0214 30                  899 	.db #0x30	; 48	'0'
   0215 7E                  900 	.db #0x7e	; 126
   0216 7E                  901 	.db #0x7e	; 126
   0217 00                  902 	.db #0x00	; 0
   0218 18                  903 	.db #0x18	; 24
   0219 18                  904 	.db #0x18	; 24
   021A 10                  905 	.db #0x10	; 16
   021B 10                  906 	.db #0x10	; 16
   021C 10                  907 	.db #0x10	; 16
   021D 18                  908 	.db #0x18	; 24
   021E 18                  909 	.db #0x18	; 24
   021F 00                  910 	.db #0x00	; 0
   0220 20                  911 	.db #0x20	; 32
   0221 20                  912 	.db #0x20	; 32
   0222 10                  913 	.db #0x10	; 16
   0223 10                  914 	.db #0x10	; 16
   0224 08                  915 	.db #0x08	; 8
   0225 08                  916 	.db #0x08	; 8
   0226 04                  917 	.db #0x04	; 4
   0227 04                  918 	.db #0x04	; 4
   0228 18                  919 	.db #0x18	; 24
   0229 18                  920 	.db #0x18	; 24
   022A 08                  921 	.db #0x08	; 8
   022B 08                  922 	.db #0x08	; 8
   022C 08                  923 	.db #0x08	; 8
   022D 18                  924 	.db #0x18	; 24
   022E 18                  925 	.db #0x18	; 24
   022F 00                  926 	.db #0x00	; 0
   0230 10                  927 	.db #0x10	; 16
   0231 38                  928 	.db #0x38	; 56	'8'
   0232 7C                  929 	.db #0x7c	; 124
   0233 FE                  930 	.db #0xfe	; 254
   0234 38                  931 	.db #0x38	; 56	'8'
   0235 38                  932 	.db #0x38	; 56	'8'
   0236 38                  933 	.db #0x38	; 56	'8'
   0237 00                  934 	.db #0x00	; 0
   0238 00                  935 	.db #0x00	; 0
   0239 00                  936 	.db #0x00	; 0
   023A 00                  937 	.db #0x00	; 0
   023B 00                  938 	.db #0x00	; 0
   023C 00                  939 	.db #0x00	; 0
   023D 00                  940 	.db #0x00	; 0
   023E 00                  941 	.db #0x00	; 0
   023F 7E                  942 	.db #0x7e	; 126
   0240 10                  943 	.db #0x10	; 16
   0241 10                  944 	.db #0x10	; 16
   0242 08                  945 	.db #0x08	; 8
   0243 00                  946 	.db #0x00	; 0
   0244 00                  947 	.db #0x00	; 0
   0245 00                  948 	.db #0x00	; 0
   0246 00                  949 	.db #0x00	; 0
   0247 00                  950 	.db #0x00	; 0
   0248 38                  951 	.db #0x38	; 56	'8'
   0249 04                  952 	.db #0x04	; 4
   024A 04                  953 	.db #0x04	; 4
   024B 3C                  954 	.db #0x3c	; 60
   024C 4C                  955 	.db #0x4c	; 76	'L'
   024D 78                  956 	.db #0x78	; 120	'x'
   024E 00                  957 	.db #0x00	; 0
   024F 00                  958 	.db #0x00	; 0
   0250 18                  959 	.db #0x18	; 24
   0251 10                  960 	.db #0x10	; 16
   0252 30                  961 	.db #0x30	; 48	'0'
   0253 28                  962 	.db #0x28	; 40
   0254 4C                  963 	.db #0x4c	; 76	'L'
   0255 78                  964 	.db #0x78	; 120	'x'
   0256 00                  965 	.db #0x00	; 0
   0257 00                  966 	.db #0x00	; 0
   0258 00                  967 	.db #0x00	; 0
   0259 1C                  968 	.db #0x1c	; 28
   025A 36                  969 	.db #0x36	; 54	'6'
   025B 20                  970 	.db #0x20	; 32
   025C 30                  971 	.db #0x30	; 48	'0'
   025D 1C                  972 	.db #0x1c	; 28
   025E 00                  973 	.db #0x00	; 0
   025F 00                  974 	.db #0x00	; 0
   0260 02                  975 	.db #0x02	; 2
   0261 06                  976 	.db #0x06	; 6
   0262 04                  977 	.db #0x04	; 4
   0263 3C                  978 	.db #0x3c	; 60
   0264 48                  979 	.db #0x48	; 72	'H'
   0265 78                  980 	.db #0x78	; 120	'x'
   0266 00                  981 	.db #0x00	; 0
   0267 00                  982 	.db #0x00	; 0
   0268 00                  983 	.db #0x00	; 0
   0269 3C                  984 	.db #0x3c	; 60
   026A 62                  985 	.db #0x62	; 98	'b'
   026B 7E                  986 	.db #0x7e	; 126
   026C 60                  987 	.db #0x60	; 96
   026D 38                  988 	.db #0x38	; 56	'8'
   026E 00                  989 	.db #0x00	; 0
   026F 00                  990 	.db #0x00	; 0
   0270 0E                  991 	.db #0x0e	; 14
   0271 0E                  992 	.db #0x0e	; 14
   0272 38                  993 	.db #0x38	; 56	'8'
   0273 1C                  994 	.db #0x1c	; 28
   0274 30                  995 	.db #0x30	; 48	'0'
   0275 20                  996 	.db #0x20	; 32
   0276 20                  997 	.db #0x20	; 32
   0277 00                  998 	.db #0x00	; 0
   0278 1C                  999 	.db #0x1c	; 28
   0279 14                 1000 	.db #0x14	; 20
   027A 1C                 1001 	.db #0x1c	; 28
   027B 04                 1002 	.db #0x04	; 4
   027C 48                 1003 	.db #0x48	; 72	'H'
   027D 78                 1004 	.db #0x78	; 120	'x'
   027E 30                 1005 	.db #0x30	; 48	'0'
   027F 00                 1006 	.db #0x00	; 0
   0280 10                 1007 	.db #0x10	; 16
   0281 30                 1008 	.db #0x30	; 48	'0'
   0282 30                 1009 	.db #0x30	; 48	'0'
   0283 3C                 1010 	.db #0x3c	; 60
   0284 24                 1011 	.db #0x24	; 36
   0285 24                 1012 	.db #0x24	; 36
   0286 00                 1013 	.db #0x00	; 0
   0287 00                 1014 	.db #0x00	; 0
   0288 10                 1015 	.db #0x10	; 16
   0289 00                 1016 	.db #0x00	; 0
   028A 10                 1017 	.db #0x10	; 16
   028B 20                 1018 	.db #0x20	; 32
   028C 20                 1019 	.db #0x20	; 32
   028D 30                 1020 	.db #0x30	; 48	'0'
   028E 00                 1021 	.db #0x00	; 0
   028F 00                 1022 	.db #0x00	; 0
   0290 04                 1023 	.db #0x04	; 4
   0291 00                 1024 	.db #0x00	; 0
   0292 08                 1025 	.db #0x08	; 8
   0293 08                 1026 	.db #0x08	; 8
   0294 08                 1027 	.db #0x08	; 8
   0295 10                 1028 	.db #0x10	; 16
   0296 30                 1029 	.db #0x30	; 48	'0'
   0297 00                 1030 	.db #0x00	; 0
   0298 10                 1031 	.db #0x10	; 16
   0299 14                 1032 	.db #0x14	; 20
   029A 1C                 1033 	.db #0x1c	; 28
   029B 10                 1034 	.db #0x10	; 16
   029C 38                 1035 	.db #0x38	; 56	'8'
   029D 2C                 1036 	.db #0x2c	; 44
   029E 00                 1037 	.db #0x00	; 0
   029F 00                 1038 	.db #0x00	; 0
   02A0 08                 1039 	.db #0x08	; 8
   02A1 18                 1040 	.db #0x18	; 24
   02A2 10                 1041 	.db #0x10	; 16
   02A3 10                 1042 	.db #0x10	; 16
   02A4 20                 1043 	.db #0x20	; 32
   02A5 38                 1044 	.db #0x38	; 56	'8'
   02A6 00                 1045 	.db #0x00	; 0
   02A7 00                 1046 	.db #0x00	; 0
   02A8 00                 1047 	.db #0x00	; 0
   02A9 30                 1048 	.db #0x30	; 48	'0'
   02AA 7E                 1049 	.db #0x7e	; 126
   02AB 5A                 1050 	.db #0x5a	; 90	'Z'
   02AC D6                 1051 	.db #0xd6	; 214
   02AD 84                 1052 	.db #0x84	; 132
   02AE 00                 1053 	.db #0x00	; 0
   02AF 00                 1054 	.db #0x00	; 0
   02B0 00                 1055 	.db #0x00	; 0
   02B1 20                 1056 	.db #0x20	; 32
   02B2 38                 1057 	.db #0x38	; 56	'8'
   02B3 68                 1058 	.db #0x68	; 104	'h'
   02B4 48                 1059 	.db #0x48	; 72	'H'
   02B5 48                 1060 	.db #0x48	; 72	'H'
   02B6 00                 1061 	.db #0x00	; 0
   02B7 00                 1062 	.db #0x00	; 0
   02B8 00                 1063 	.db #0x00	; 0
   02B9 3C                 1064 	.db #0x3c	; 60
   02BA 64                 1065 	.db #0x64	; 100	'd'
   02BB 44                 1066 	.db #0x44	; 68	'D'
   02BC 64                 1067 	.db #0x64	; 100	'd'
   02BD 38                 1068 	.db #0x38	; 56	'8'
   02BE 00                 1069 	.db #0x00	; 0
   02BF 00                 1070 	.db #0x00	; 0
   02C0 0C                 1071 	.db #0x0c	; 12
   02C1 0A                 1072 	.db #0x0a	; 10
   02C2 0A                 1073 	.db #0x0a	; 10
   02C3 1C                 1074 	.db #0x1c	; 28
   02C4 10                 1075 	.db #0x10	; 16
   02C5 20                 1076 	.db #0x20	; 32
   02C6 20                 1077 	.db #0x20	; 32
   02C7 00                 1078 	.db #0x00	; 0
   02C8 18                 1079 	.db #0x18	; 24
   02C9 24                 1080 	.db #0x24	; 36
   02CA 24                 1081 	.db #0x24	; 36
   02CB 1C                 1082 	.db #0x1c	; 28
   02CC 04                 1083 	.db #0x04	; 4
   02CD 08                 1084 	.db #0x08	; 8
   02CE 10                 1085 	.db #0x10	; 16
   02CF 00                 1086 	.db #0x00	; 0
   02D0 00                 1087 	.db #0x00	; 0
   02D1 20                 1088 	.db #0x20	; 32
   02D2 3C                 1089 	.db #0x3c	; 60
   02D3 30                 1090 	.db #0x30	; 48	'0'
   02D4 60                 1091 	.db #0x60	; 96
   02D5 40                 1092 	.db #0x40	; 64
   02D6 00                 1093 	.db #0x00	; 0
   02D7 00                 1094 	.db #0x00	; 0
   02D8 00                 1095 	.db #0x00	; 0
   02D9 0E                 1096 	.db #0x0e	; 14
   02DA 10                 1097 	.db #0x10	; 16
   02DB 18                 1098 	.db #0x18	; 24
   02DC 08                 1099 	.db #0x08	; 8
   02DD 70                 1100 	.db #0x70	; 112	'p'
   02DE 00                 1101 	.db #0x00	; 0
   02DF 00                 1102 	.db #0x00	; 0
   02E0 08                 1103 	.db #0x08	; 8
   02E1 38                 1104 	.db #0x38	; 56	'8'
   02E2 16                 1105 	.db #0x16	; 22
   02E3 20                 1106 	.db #0x20	; 32
   02E4 60                 1107 	.db #0x60	; 96
   02E5 60                 1108 	.db #0x60	; 96
   02E6 38                 1109 	.db #0x38	; 56	'8'
   02E7 00                 1110 	.db #0x00	; 0
   02E8 00                 1111 	.db #0x00	; 0
   02E9 24                 1112 	.db #0x24	; 36
   02EA 44                 1113 	.db #0x44	; 68	'D'
   02EB 44                 1114 	.db #0x44	; 68	'D'
   02EC 4C                 1115 	.db #0x4c	; 76	'L'
   02ED 78                 1116 	.db #0x78	; 120	'x'
   02EE 00                 1117 	.db #0x00	; 0
   02EF 00                 1118 	.db #0x00	; 0
   02F0 00                 1119 	.db #0x00	; 0
   02F1 20                 1120 	.db #0x20	; 32
   02F2 26                 1121 	.db #0x26	; 38
   02F3 48                 1122 	.db #0x48	; 72	'H'
   02F4 58                 1123 	.db #0x58	; 88	'X'
   02F5 60                 1124 	.db #0x60	; 96
   02F6 00                 1125 	.db #0x00	; 0
   02F7 00                 1126 	.db #0x00	; 0
   02F8 00                 1127 	.db #0x00	; 0
   02F9 41                 1128 	.db #0x41	; 65	'A'
   02FA 53                 1129 	.db #0x53	; 83	'S'
   02FB 56                 1130 	.db #0x56	; 86	'V'
   02FC 7C                 1131 	.db #0x7c	; 124
   02FD 58                 1132 	.db #0x58	; 88	'X'
   02FE 00                 1133 	.db #0x00	; 0
   02FF 00                 1134 	.db #0x00	; 0
   0300 00                 1135 	.db #0x00	; 0
   0301 24                 1136 	.db #0x24	; 36
   0302 1C                 1137 	.db #0x1c	; 28
   0303 1C                 1138 	.db #0x1c	; 28
   0304 18                 1139 	.db #0x18	; 24
   0305 24                 1140 	.db #0x24	; 36
   0306 44                 1141 	.db #0x44	; 68	'D'
   0307 00                 1142 	.db #0x00	; 0
   0308 00                 1143 	.db #0x00	; 0
   0309 22                 1144 	.db #0x22	; 34
   030A 34                 1145 	.db #0x34	; 52	'4'
   030B 34                 1146 	.db #0x34	; 52	'4'
   030C 1C                 1147 	.db #0x1c	; 28
   030D 0C                 1148 	.db #0x0c	; 12
   030E 08                 1149 	.db #0x08	; 8
   030F 18                 1150 	.db #0x18	; 24
   0310 00                 1151 	.db #0x00	; 0
   0311 3E                 1152 	.db #0x3e	; 62
   0312 04                 1153 	.db #0x04	; 4
   0313 0C                 1154 	.db #0x0c	; 12
   0314 38                 1155 	.db #0x38	; 56	'8'
   0315 60                 1156 	.db #0x60	; 96
   0316 3C                 1157 	.db #0x3c	; 60
   0317 00                 1158 	.db #0x00	; 0
   0318 08                 1159 	.db #0x08	; 8
   0319 10                 1160 	.db #0x10	; 16
   031A 10                 1161 	.db #0x10	; 16
   031B 20                 1162 	.db #0x20	; 32
   031C 10                 1163 	.db #0x10	; 16
   031D 10                 1164 	.db #0x10	; 16
   031E 08                 1165 	.db #0x08	; 8
   031F 00                 1166 	.db #0x00	; 0
   0320 10                 1167 	.db #0x10	; 16
   0321 10                 1168 	.db #0x10	; 16
   0322 10                 1169 	.db #0x10	; 16
   0323 10                 1170 	.db #0x10	; 16
   0324 10                 1171 	.db #0x10	; 16
   0325 10                 1172 	.db #0x10	; 16
   0326 10                 1173 	.db #0x10	; 16
   0327 00                 1174 	.db #0x00	; 0
   0328 10                 1175 	.db #0x10	; 16
   0329 08                 1176 	.db #0x08	; 8
   032A 08                 1177 	.db #0x08	; 8
   032B 04                 1178 	.db #0x04	; 4
   032C 08                 1179 	.db #0x08	; 8
   032D 08                 1180 	.db #0x08	; 8
   032E 10                 1181 	.db #0x10	; 16
   032F 00                 1182 	.db #0x00	; 0
   0330 30                 1183 	.db #0x30	; 48	'0'
   0331 49                 1184 	.db #0x49	; 73	'I'
   0332 06                 1185 	.db #0x06	; 6
   0333 00                 1186 	.db #0x00	; 0
   0334 00                 1187 	.db #0x00	; 0
   0335 00                 1188 	.db #0x00	; 0
   0336 00                 1189 	.db #0x00	; 0
   0337 00                 1190 	.db #0x00	; 0
   0338 00                 1191 	.db #0x00	; 0
   0339 00                 1192 	.db #0x00	; 0
   033A 00                 1193 	.db #0x00	; 0
   033B 00                 1194 	.db #0x00	; 0
   033C 00                 1195 	.db #0x00	; 0
   033D 00                 1196 	.db #0x00	; 0
   033E 00                 1197 	.db #0x00	; 0
   033F 00                 1198 	.db #0x00	; 0
   0340                    1199 	.org 0x0340
   0340                    1200 _m_sfx:
   0340 41                 1201 	.db #0x41	; 65	'A'
   0341 54                 1202 	.db #0x54	; 84	'T'
   0342 31                 1203 	.db #0x31	; 49	'1'
   0343 30                 1204 	.db #0x30	; 48	'0'
   0344 01                 1205 	.db #0x01	; 1
   0345 40                 1206 	.db #0x40	; 64
   0346 42                 1207 	.db #0x42	; 66	'B'
   0347 0F                 1208 	.db #0x0f	; 15
   0348 02                 1209 	.db #0x02	; 2
   0349 FF                 1210 	.db #0xff	; 255
   034A 6B                 1211 	.db #0x6b	; 107	'k'
   034B 00                 1212 	.db #0x00	; 0
   034C 56                 1213 	.db #0x56	; 86	'V'
   034D 03                 1214 	.db #0x03	; 3
   034E 5F                 1215 	.db #0x5f	; 95
   034F 03                 1216 	.db #0x03	; 3
   0350 83                 1217 	.db #0x83	; 131
   0351 03                 1218 	.db #0x03	; 3
   0352 A9                 1219 	.db #0xa9	; 169
   0353 03                 1220 	.db #0x03	; 3
   0354 B0                 1221 	.db #0xb0	; 176
   0355 03                 1222 	.db #0x03	; 3
   0356 00                 1223 	.db #0x00	; 0
   0357 00                 1224 	.db #0x00	; 0
   0358 00                 1225 	.db #0x00	; 0
   0359 00                 1226 	.db #0x00	; 0
   035A 00                 1227 	.db #0x00	; 0
   035B 00                 1228 	.db #0x00	; 0
   035C 0D                 1229 	.db #0x0d	; 13
   035D 58                 1230 	.db #0x58	; 88	'X'
   035E 03                 1231 	.db #0x03	; 3
   035F 01                 1232 	.db #0x01	; 1
   0360 00                 1233 	.db #0x00	; 0
   0361 3C                 1234 	.db #0x3c	; 60
   0362 3A                 1235 	.db #0x3a	; 58
   0363 21                 1236 	.db #0x21	; 33
   0364 76                 1237 	.db #0x76	; 118	'v'
   0365 22                 1238 	.db #0x22	; 34
   0366 0C                 1239 	.db #0x0c	; 12
   0367 76                 1240 	.db #0x76	; 118	'v'
   0368 23                 1241 	.db #0x23	; 35
   0369 18                 1242 	.db #0x18	; 24
   036A 72                 1243 	.db #0x72	; 114	'r'
   036B 24                 1244 	.db #0x24	; 36
   036C 0C                 1245 	.db #0x0c	; 12
   036D 6E                 1246 	.db #0x6e	; 110	'n'
   036E 26                 1247 	.db #0x26	; 38
   036F 18                 1248 	.db #0x18	; 24
   0370 2A                 1249 	.db #0x2a	; 42
   0371 2A                 1250 	.db #0x2a	; 42
   0372 26                 1251 	.db #0x26	; 38
   0373 2B                 1252 	.db #0x2b	; 43
   0374 22                 1253 	.db #0x22	; 34
   0375 2C                 1254 	.db #0x2c	; 44
   0376 1E                 1255 	.db #0x1e	; 30
   0377 2E                 1256 	.db #0x2e	; 46
   0378 1A                 1257 	.db #0x1a	; 26
   0379 30                 1258 	.db #0x30	; 48	'0'
   037A 16                 1259 	.db #0x16	; 22
   037B 31                 1260 	.db #0x31	; 49	'1'
   037C 12                 1261 	.db #0x12	; 18
   037D 36                 1262 	.db #0x36	; 54	'6'
   037E 0E                 1263 	.db #0x0e	; 14
   037F 3D                 1264 	.db #0x3d	; 61
   0380 0D                 1265 	.db #0x0d	; 13
   0381 58                 1266 	.db #0x58	; 88	'X'
   0382 03                 1267 	.db #0x03	; 3
   0383 01                 1268 	.db #0x01	; 1
   0384 00                 1269 	.db #0x00	; 0
   0385 7E                 1270 	.db #0x7e	; 126
   0386 21                 1271 	.db #0x21	; 33
   0387 0C                 1272 	.db #0x0c	; 12
   0388 70                 1273 	.db #0x70	; 112	'p'
   0389 18                 1274 	.db #0x18	; 24
   038A 72                 1275 	.db #0x72	; 114	'r'
   038B 21                 1276 	.db #0x21	; 33
   038C 10                 1277 	.db #0x10	; 16
   038D 6C                 1278 	.db #0x6c	; 108	'l'
   038E 1C                 1279 	.db #0x1c	; 28
   038F 7A                 1280 	.db #0x7a	; 122	'z'
   0390 21                 1281 	.db #0x21	; 33
   0391 13                 1282 	.db #0x13	; 19
   0392 74                 1283 	.db #0x74	; 116	't'
   0393 1F                 1284 	.db #0x1f	; 31
   0394 25                 1285 	.db #0x25	; 37
   0395 28                 1286 	.db #0x28	; 40
   0396 F4                 1287 	.db #0xf4	; 244
   0397 89                 1288 	.db #0x89	; 137
   0398 08                 1289 	.db #0x08	; 8
   0399 25                 1290 	.db #0x25	; 37
   039A 28                 1291 	.db #0x28	; 40
   039B F4                 1292 	.db #0xf4	; 244
   039C 89                 1293 	.db #0x89	; 137
   039D 08                 1294 	.db #0x08	; 8
   039E 25                 1295 	.db #0x25	; 37
   039F 28                 1296 	.db #0x28	; 40
   03A0 F4                 1297 	.db #0xf4	; 244
   03A1 89                 1298 	.db #0x89	; 137
   03A2 08                 1299 	.db #0x08	; 8
   03A3 25                 1300 	.db #0x25	; 37
   03A4 28                 1301 	.db #0x28	; 40
   03A5 E8                 1302 	.db #0xe8	; 232
   03A6 0D                 1303 	.db #0x0d	; 13
   03A7 58                 1304 	.db #0x58	; 88	'X'
   03A8 03                 1305 	.db #0x03	; 3
   03A9 01                 1306 	.db #0x01	; 1
   03AA 00                 1307 	.db #0x00	; 0
   03AB 02                 1308 	.db #0x02	; 2
   03AC 20                 1309 	.db #0x20	; 32
   03AD 0D                 1310 	.db #0x0d	; 13
   03AE 58                 1311 	.db #0x58	; 88	'X'
   03AF 03                 1312 	.db #0x03	; 3
   03B0 01                 1313 	.db #0x01	; 1
   03B1 00                 1314 	.db #0x00	; 0
   03B2 02                 1315 	.db #0x02	; 2
   03B3 20                 1316 	.db #0x20	; 32
   03B4 0D                 1317 	.db #0x0d	; 13
   03B5 58                 1318 	.db #0x58	; 88	'X'
   03B6 03                 1319 	.db #0x03	; 3
   03B7 40                 1320 	.db #0x40	; 64
   03B8 00                 1321 	.db #0x00	; 0
   03B9 00                 1322 	.db #0x00	; 0
   03BA 00                 1323 	.db #0x00	; 0
   03BB C7                 1324 	.db #0xc7	; 199
   03BC 03                 1325 	.db #0x03	; 3
   03BD 00                 1326 	.db #0x00	; 0
   03BE C8                 1327 	.db #0xc8	; 200
   03BF 03                 1328 	.db #0x03	; 3
   03C0 C8                 1329 	.db #0xc8	; 200
   03C1 03                 1330 	.db #0x03	; 3
   03C2 C8                 1331 	.db #0xc8	; 200
   03C3 03                 1332 	.db #0x03	; 3
   03C4 01                 1333 	.db #0x01	; 1
   03C5 BD                 1334 	.db #0xbd	; 189
   03C6 03                 1335 	.db #0x03	; 3
   03C7 00                 1336 	.db #0x00	; 0
   03C8 42                 1337 	.db #0x42	; 66	'B'
   03C9 80                 1338 	.db #0x80	; 128
   03CA 00                 1339 	.db #0x00	; 0
   03CB 00                 1340 	.db #0x00	; 0
   03CC 00                 1341 	.db #0x00	; 0
