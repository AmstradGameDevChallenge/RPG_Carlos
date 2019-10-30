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
                             11 	.globl _main
                             12 	.globl _juego
                             13 	.globl _pausaTecladoLibre
                             14 	.globl _cpct_restoreState_mxor_u8
                             15 	.globl _cpct_setSeed_mxor
                             16 	.globl _cpct_getScreenPtr
                             17 	.globl _cpct_setPALColour
                             18 	.globl _cpct_setPalette
                             19 	.globl _cpct_setVideoMode
                             20 	.globl _cpct_drawStringM1
                             21 	.globl _cpct_setDrawCharM1
                             22 	.globl _cpct_isAnyKeyPressed_f
                             23 	.globl _cpct_scanKeyboard_f
                             24 	.globl _cpct_memset
                             25 	.globl _cpct_disableFirmware
                             26 	.globl _sig_nivel
                             27 	.globl _cursorConsola
                             28 	.globl _nivel
                             29 	.globl _entidad
                             30 	.globl _paletaM1
                             31 ;--------------------------------------------------------
                             32 ; special function registers
                             33 ;--------------------------------------------------------
                             34 ;--------------------------------------------------------
                             35 ; ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DATA
   8770                      38 _entidad::
   8770                      39 	.ds 60
   87AC                      40 _nivel::
   87AC                      41 	.ds 1
   87AD                      42 _cursorConsola::
   87AD                      43 	.ds 1
   87AE                      44 _sig_nivel::
   87AE                      45 	.ds 1
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
                             70 ;src/main.c:39: void main(void) {
                             71 ;	---------------------------------
                             72 ; Function main
                             73 ; ---------------------------------
   5B88                      74 _main::
                             75 ;src/main.c:43: cpct_disableFirmware();
   5B88 CD AB 7A      [17]   76 	call	_cpct_disableFirmware
                             77 ;src/main.c:45: while (1) {
   5B8B                      78 00107$:
                             79 ;src/main.c:46: cpct_setVideoMode(1);
   5B8B 2E 01         [ 7]   80 	ld	l, #0x01
   5B8D CD 57 7A      [17]   81 	call	_cpct_setVideoMode
                             82 ;src/main.c:47: cpct_clearScreen(0x00);
   5B90 21 00 40      [10]   83 	ld	hl, #0x4000
   5B93 E5            [11]   84 	push	hl
   5B94 AF            [ 4]   85 	xor	a, a
   5B95 F5            [11]   86 	push	af
   5B96 33            [ 6]   87 	inc	sp
   5B97 26 C0         [ 7]   88 	ld	h, #0xc0
   5B99 E5            [11]   89 	push	hl
   5B9A CD 80 7A      [17]   90 	call	_cpct_memset
                             91 ;src/main.c:48: cpct_setPalette(paletaM1,4);
   5B9D 21 04 00      [10]   92 	ld	hl, #0x0004
   5BA0 E5            [11]   93 	push	hl
   5BA1 21 8E 5C      [10]   94 	ld	hl, #_paletaM1
   5BA4 E5            [11]   95 	push	hl
   5BA5 CD 78 76      [17]   96 	call	_cpct_setPalette
                             97 ;src/main.c:49: cpct_setBorder(HW_BLACK);
   5BA8 21 10 14      [10]   98 	ld	hl, #0x1410
   5BAB E5            [11]   99 	push	hl
   5BAC CD F9 76      [17]  100 	call	_cpct_setPALColour
                            101 ;src/main.c:52: cpct_setDrawCharM1(2, 0);
   5BAF 21 02 00      [10]  102 	ld	hl, #0x0002
   5BB2 E5            [11]  103 	push	hl
   5BB3 CD C3 7B      [17]  104 	call	_cpct_setDrawCharM1
                            105 ;src/main.c:53: cpct_drawStringM1("         Don Mendo and Lady Sol", cpctm_screenPtr(CPCT_VMEM_START, 0, 0));
   5BB6 21 00 C0      [10]  106 	ld	hl, #0xc000
   5BB9 E5            [11]  107 	push	hl
   5BBA 21 92 5C      [10]  108 	ld	hl, #___str_0
   5BBD E5            [11]  109 	push	hl
   5BBE CD 05 77      [17]  110 	call	_cpct_drawStringM1
                            111 ;src/main.c:54: cpct_drawStringM1("                   in", cpctm_screenPtr(CPCT_VMEM_START, 0, 8));
   5BC1 21 50 C0      [10]  112 	ld	hl, #0xc050
   5BC4 E5            [11]  113 	push	hl
   5BC5 21 B2 5C      [10]  114 	ld	hl, #___str_1
   5BC8 E5            [11]  115 	push	hl
   5BC9 CD 05 77      [17]  116 	call	_cpct_drawStringM1
                            117 ;src/main.c:55: cpct_drawStringM1("           Castle Concepcion", cpctm_screenPtr(CPCT_VMEM_START, 0, 16));
   5BCC 21 A0 C0      [10]  118 	ld	hl, #0xc0a0
   5BCF E5            [11]  119 	push	hl
   5BD0 21 C8 5C      [10]  120 	ld	hl, #___str_2
   5BD3 E5            [11]  121 	push	hl
   5BD4 CD 05 77      [17]  122 	call	_cpct_drawStringM1
                            123 ;src/main.c:56: cpct_drawStringM1("Mendo was in love with Lady Sol, a rich ", cpctm_screenPtr(CPCT_VMEM_START, 0, 40));
   5BD7 21 90 C1      [10]  124 	ld	hl, #0xc190
   5BDA E5            [11]  125 	push	hl
   5BDB 21 E5 5C      [10]  126 	ld	hl, #___str_3
   5BDE E5            [11]  127 	push	hl
   5BDF CD 05 77      [17]  128 	call	_cpct_drawStringM1
                            129 ;src/main.c:57: cpct_drawStringM1("and beautiful woman. He was so poor that", cpctm_screenPtr(CPCT_VMEM_START, 0, 48));
   5BE2 21 E0 C1      [10]  130 	ld	hl, #0xc1e0
   5BE5 E5            [11]  131 	push	hl
   5BE6 21 0E 5D      [10]  132 	ld	hl, #___str_4
   5BE9 E5            [11]  133 	push	hl
   5BEA CD 05 77      [17]  134 	call	_cpct_drawStringM1
                            135 ;src/main.c:58: cpct_drawStringM1("he couldn't marry her. He decided to go ", cpctm_screenPtr(CPCT_VMEM_START, 0, 56));
   5BED 21 30 C2      [10]  136 	ld	hl, #0xc230
   5BF0 E5            [11]  137 	push	hl
   5BF1 21 37 5D      [10]  138 	ld	hl, #___str_5
   5BF4 E5            [11]  139 	push	hl
   5BF5 CD 05 77      [17]  140 	call	_cpct_drawStringM1
                            141 ;src/main.c:59: cpct_drawStringM1("to the Crusades to get Fortune and Fame.", cpctm_screenPtr(CPCT_VMEM_START, 0, 64));
   5BF8 21 80 C2      [10]  142 	ld	hl, #0xc280
   5BFB E5            [11]  143 	push	hl
   5BFC 21 60 5D      [10]  144 	ld	hl, #___str_6
   5BFF E5            [11]  145 	push	hl
   5C00 CD 05 77      [17]  146 	call	_cpct_drawStringM1
                            147 ;src/main.c:61: cpct_drawStringM1("When he became a brave hero, he heard", cpctm_screenPtr(CPCT_VMEM_START, 0, 80));
   5C03 21 20 C3      [10]  148 	ld	hl, #0xc320
   5C06 E5            [11]  149 	push	hl
   5C07 21 89 5D      [10]  150 	ld	hl, #___str_7
   5C0A E5            [11]  151 	push	hl
   5C0B CD 05 77      [17]  152 	call	_cpct_drawStringM1
                            153 ;src/main.c:62: cpct_drawStringM1("Lady Sol was forced to marry don Ricardo", cpctm_screenPtr(CPCT_VMEM_START, 0, 88));
   5C0E 21 70 C3      [10]  154 	ld	hl, #0xc370
   5C11 E5            [11]  155 	push	hl
   5C12 21 AF 5D      [10]  156 	ld	hl, #___str_8
   5C15 E5            [11]  157 	push	hl
   5C16 CD 05 77      [17]  158 	call	_cpct_drawStringM1
                            159 ;src/main.c:63: cpct_drawStringM1("a very important noble. ", cpctm_screenPtr(CPCT_VMEM_START, 0, 96));
   5C19 21 C0 C3      [10]  160 	ld	hl, #0xc3c0
   5C1C E5            [11]  161 	push	hl
   5C1D 21 D8 5D      [10]  162 	ld	hl, #___str_9
   5C20 E5            [11]  163 	push	hl
   5C21 CD 05 77      [17]  164 	call	_cpct_drawStringM1
                            165 ;src/main.c:65: cpct_drawStringM1("Bring to an end the bloody Crusades war,", cpctm_screenPtr(CPCT_VMEM_START, 0, 112));
   5C24 21 60 C4      [10]  166 	ld	hl, #0xc460
   5C27 E5            [11]  167 	push	hl
   5C28 21 F1 5D      [10]  168 	ld	hl, #___str_10
   5C2B E5            [11]  169 	push	hl
   5C2C CD 05 77      [17]  170 	call	_cpct_drawStringM1
                            171 ;src/main.c:66: cpct_drawStringM1("go through the underway passage and ", cpctm_screenPtr(CPCT_VMEM_START, 0, 120));
   5C2F 21 B0 C4      [10]  172 	ld	hl, #0xc4b0
   5C32 E5            [11]  173 	push	hl
   5C33 21 1A 5E      [10]  174 	ld	hl, #___str_11
   5C36 E5            [11]  175 	push	hl
   5C37 CD 05 77      [17]  176 	call	_cpct_drawStringM1
                            177 ;src/main.c:67: cpct_drawStringM1("finally assault the Castle to help Don ", cpctm_screenPtr(CPCT_VMEM_START, 0, 128));
   5C3A 21 00 C5      [10]  178 	ld	hl, #0xc500
   5C3D E5            [11]  179 	push	hl
   5C3E 21 3F 5E      [10]  180 	ld	hl, #___str_12
   5C41 E5            [11]  181 	push	hl
   5C42 CD 05 77      [17]  182 	call	_cpct_drawStringM1
                            183 ;src/main.c:68: cpct_drawStringM1("Mendo to go back to his love: Lady Sun.", cpctm_screenPtr(CPCT_VMEM_START, 0, 136));
   5C45 21 50 C5      [10]  184 	ld	hl, #0xc550
   5C48 E5            [11]  185 	push	hl
   5C49 21 67 5E      [10]  186 	ld	hl, #___str_13
   5C4C E5            [11]  187 	push	hl
   5C4D CD 05 77      [17]  188 	call	_cpct_drawStringM1
                            189 ;src/main.c:69: cpct_drawStringM1("PRESS ANY KEY TO START", cpct_getScreenPtr(CPCT_VMEM_START, 0, 168));
   5C50 21 00 A8      [10]  190 	ld	hl, #0xa800
   5C53 E5            [11]  191 	push	hl
   5C54 26 C0         [ 7]  192 	ld	h, #0xc0
   5C56 E5            [11]  193 	push	hl
   5C57 CD A3 7B      [17]  194 	call	_cpct_getScreenPtr
   5C5A 01 8F 5E      [10]  195 	ld	bc, #___str_14+0
   5C5D E5            [11]  196 	push	hl
   5C5E C5            [11]  197 	push	bc
   5C5F CD 05 77      [17]  198 	call	_cpct_drawStringM1
                            199 ;src/main.c:72: pausaTecladoLibre();
   5C62 CD 46 6E      [17]  200 	call	_pausaTecladoLibre
                            201 ;src/main.c:76: do {
   5C65 0E 00         [ 7]  202 	ld	c, #0x00
   5C67                     203 00101$:
                            204 ;src/main.c:77: cpct_scanKeyboard_f();
   5C67 C5            [11]  205 	push	bc
   5C68 CD 8F 76      [17]  206 	call	_cpct_scanKeyboard_f
   5C6B C1            [10]  207 	pop	bc
                            208 ;src/main.c:78: semilla++;
   5C6C 0C            [ 4]  209 	inc	c
                            210 ;src/main.c:80: while (!cpct_isAnyKeyPressed_f());
   5C6D C5            [11]  211 	push	bc
   5C6E CD 65 7A      [17]  212 	call	_cpct_isAnyKeyPressed_f
   5C71 C1            [10]  213 	pop	bc
   5C72 7D            [ 4]  214 	ld	a, l
   5C73 B7            [ 4]  215 	or	a, a
   5C74 28 F1         [12]  216 	jr	Z,00101$
                            217 ;src/main.c:83: if (!semilla)
   5C76 79            [ 4]  218 	ld	a,c
   5C77 6F            [ 4]  219 	ld	l,a
   5C78 B7            [ 4]  220 	or	a, a
   5C79 20 02         [12]  221 	jr	NZ,00105$
                            222 ;src/main.c:84: semilla = 1;
   5C7B 2E 01         [ 7]  223 	ld	l, #0x01
   5C7D                     224 00105$:
                            225 ;src/main.c:86: cpct_srand8(semilla);
   5C7D 26 00         [ 7]  226 	ld	h, #0x00
   5C7F 11 00 00      [10]  227 	ld	de,#0x0000
   5C82 CD 1F 79      [17]  228 	call	_cpct_setSeed_mxor
   5C85 CD 27 79      [17]  229 	call	_cpct_restoreState_mxor_u8
                            230 ;src/main.c:87: juego();
   5C88 CD 64 66      [17]  231 	call	_juego
   5C8B C3 8B 5B      [10]  232 	jp	00107$
   5C8E                     233 _paletaM1:
   5C8E 54                  234 	.db #0x54	; 84	'T'
   5C8F 40                  235 	.db #0x40	; 64
   5C90 4B                  236 	.db #0x4b	; 75	'K'
   5C91 44                  237 	.db #0x44	; 68	'D'
   5C92                     238 ___str_0:
   5C92 20 20 20 20 20 20   239 	.ascii "         Don Mendo and Lady Sol"
        20 20 20 44 6F 6E
        20 4D 65 6E 64 6F
        20 61 6E 64 20 4C
        61 64 79 20 53 6F
        6C
   5CB1 00                  240 	.db 0x00
   5CB2                     241 ___str_1:
   5CB2 20 20 20 20 20 20   242 	.ascii "                   in"
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 69 6E
   5CC7 00                  243 	.db 0x00
   5CC8                     244 ___str_2:
   5CC8 20 20 20 20 20 20   245 	.ascii "           Castle Concepcion"
        20 20 20 20 20 43
        61 73 74 6C 65 20
        43 6F 6E 63 65 70
        63 69 6F 6E
   5CE4 00                  246 	.db 0x00
   5CE5                     247 ___str_3:
   5CE5 4D 65 6E 64 6F 20   248 	.ascii "Mendo was in love with Lady Sol, a rich "
        77 61 73 20 69 6E
        20 6C 6F 76 65 20
        77 69 74 68 20 4C
        61 64 79 20 53 6F
        6C 2C 20 61 20 72
        69 63 68 20
   5D0D 00                  249 	.db 0x00
   5D0E                     250 ___str_4:
   5D0E 61 6E 64 20 62 65   251 	.ascii "and beautiful woman. He was so poor that"
        61 75 74 69 66 75
        6C 20 77 6F 6D 61
        6E 2E 20 48 65 20
        77 61 73 20 73 6F
        20 70 6F 6F 72 20
        74 68 61 74
   5D36 00                  252 	.db 0x00
   5D37                     253 ___str_5:
   5D37 68 65 20 63 6F 75   254 	.ascii "he couldn't marry her. He decided to go "
        6C 64 6E 27 74 20
        6D 61 72 72 79 20
        68 65 72 2E 20 48
        65 20 64 65 63 69
        64 65 64 20 74 6F
        20 67 6F 20
   5D5F 00                  255 	.db 0x00
   5D60                     256 ___str_6:
   5D60 74 6F 20 74 68 65   257 	.ascii "to the Crusades to get Fortune and Fame."
        20 43 72 75 73 61
        64 65 73 20 74 6F
        20 67 65 74 20 46
        6F 72 74 75 6E 65
        20 61 6E 64 20 46
        61 6D 65 2E
   5D88 00                  258 	.db 0x00
   5D89                     259 ___str_7:
   5D89 57 68 65 6E 20 68   260 	.ascii "When he became a brave hero, he heard"
        65 20 62 65 63 61
        6D 65 20 61 20 62
        72 61 76 65 20 68
        65 72 6F 2C 20 68
        65 20 68 65 61 72
        64
   5DAE 00                  261 	.db 0x00
   5DAF                     262 ___str_8:
   5DAF 4C 61 64 79 20 53   263 	.ascii "Lady Sol was forced to marry don Ricardo"
        6F 6C 20 77 61 73
        20 66 6F 72 63 65
        64 20 74 6F 20 6D
        61 72 72 79 20 64
        6F 6E 20 52 69 63
        61 72 64 6F
   5DD7 00                  264 	.db 0x00
   5DD8                     265 ___str_9:
   5DD8 61 20 76 65 72 79   266 	.ascii "a very important noble. "
        20 69 6D 70 6F 72
        74 61 6E 74 20 6E
        6F 62 6C 65 2E 20
   5DF0 00                  267 	.db 0x00
   5DF1                     268 ___str_10:
   5DF1 42 72 69 6E 67 20   269 	.ascii "Bring to an end the bloody Crusades war,"
        74 6F 20 61 6E 20
        65 6E 64 20 74 68
        65 20 62 6C 6F 6F
        64 79 20 43 72 75
        73 61 64 65 73 20
        77 61 72 2C
   5E19 00                  270 	.db 0x00
   5E1A                     271 ___str_11:
   5E1A 67 6F 20 74 68 72   272 	.ascii "go through the underway passage and "
        6F 75 67 68 20 74
        68 65 20 75 6E 64
        65 72 77 61 79 20
        70 61 73 73 61 67
        65 20 61 6E 64 20
   5E3E 00                  273 	.db 0x00
   5E3F                     274 ___str_12:
   5E3F 66 69 6E 61 6C 6C   275 	.ascii "finally assault the Castle to help Don "
        79 20 61 73 73 61
        75 6C 74 20 74 68
        65 20 43 61 73 74
        6C 65 20 74 6F 20
        68 65 6C 70 20 44
        6F 6E 20
   5E66 00                  276 	.db 0x00
   5E67                     277 ___str_13:
   5E67 4D 65 6E 64 6F 20   278 	.ascii "Mendo to go back to his love: Lady Sun."
        74 6F 20 67 6F 20
        62 61 63 6B 20 74
        6F 20 68 69 73 20
        6C 6F 76 65 3A 20
        4C 61 64 79 20 53
        75 6E 2E
   5E8E 00                  279 	.db 0x00
   5E8F                     280 ___str_14:
   5E8F 50 52 45 53 53 20   281 	.ascii "PRESS ANY KEY TO START"
        41 4E 59 20 4B 45
        59 20 54 4F 20 53
        54 41 52 54
   5EA5 00                  282 	.db 0x00
                            283 	.area _CODE
                            284 	.area _INITIALIZER
                            285 	.area _CABS (ABS)
