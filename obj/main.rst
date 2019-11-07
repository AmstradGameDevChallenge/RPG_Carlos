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
                             14 	.globl _mydrawStringM1
                             15 	.globl _cpct_restoreState_mxor_u8
                             16 	.globl _cpct_setSeed_mxor
                             17 	.globl _cpct_getScreenPtr
                             18 	.globl _cpct_setPALColour
                             19 	.globl _cpct_setPalette
                             20 	.globl _cpct_setVideoMode
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
   6EA0                      38 _entidad::
   6EA0                      39 	.ds 60
   6EDC                      40 _nivel::
   6EDC                      41 	.ds 1
   6EDD                      42 _cursorConsola::
   6EDD                      43 	.ds 1
   6EDE                      44 _sig_nivel::
   6EDE                      45 	.ds 1
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
                             70 ;src/main.c:41: void main(void) {
                             71 ;	---------------------------------
                             72 ; Function main
                             73 ; ---------------------------------
   3A48                      74 _main::
                             75 ;src/main.c:45: cpct_disableFirmware();
   3A48 CD EA 61      [17]   76 	call	_cpct_disableFirmware
                             77 ;src/main.c:47: while (1) {
   3A4B                      78 00107$:
                             79 ;src/main.c:48: cpct_setVideoMode(1);
   3A4B 2E 01         [ 7]   80 	ld	l, #0x01
   3A4D CD 96 61      [17]   81 	call	_cpct_setVideoMode
                             82 ;src/main.c:49: cpct_clearScreen(0x00);
   3A50 21 00 40      [10]   83 	ld	hl, #0x4000
   3A53 E5            [11]   84 	push	hl
   3A54 AF            [ 4]   85 	xor	a, a
   3A55 F5            [11]   86 	push	af
   3A56 33            [ 6]   87 	inc	sp
   3A57 26 C0         [ 7]   88 	ld	h, #0xc0
   3A59 E5            [11]   89 	push	hl
   3A5A CD BF 61      [17]   90 	call	_cpct_memset
                             91 ;src/main.c:50: cpct_setPalette(paletaM1,4);
   3A5D 21 04 00      [10]   92 	ld	hl, #0x0004
   3A60 E5            [11]   93 	push	hl
   3A61 21 4E 3B      [10]   94 	ld	hl, #_paletaM1
   3A64 E5            [11]   95 	push	hl
   3A65 CD 37 5E      [17]   96 	call	_cpct_setPalette
                             97 ;src/main.c:51: cpct_setBorder(HW_BLACK);
   3A68 21 10 14      [10]   98 	ld	hl, #0x1410
   3A6B E5            [11]   99 	push	hl
   3A6C CD B8 5E      [17]  100 	call	_cpct_setPALColour
                            101 ;src/main.c:54: cpct_setDrawCharM1(2, 0);
   3A6F 21 02 00      [10]  102 	ld	hl, #0x0002
   3A72 E5            [11]  103 	push	hl
   3A73 CD F3 62      [17]  104 	call	_cpct_setDrawCharM1
                            105 ;src/main.c:55: mydrawStringM1("         Don Mendo and Lady Sol", cpctm_screenPtr(CPCT_VMEM_START, 0, 0));
   3A76 21 00 C0      [10]  106 	ld	hl, #0xc000
   3A79 E5            [11]  107 	push	hl
   3A7A 21 52 3B      [10]  108 	ld	hl, #___str_0
   3A7D E5            [11]  109 	push	hl
   3A7E CD B4 5D      [17]  110 	call	_mydrawStringM1
                            111 ;src/main.c:56: mydrawStringM1("                   in", cpctm_screenPtr(CPCT_VMEM_START, 0, 8));
   3A81 21 50 C0      [10]  112 	ld	hl, #0xc050
   3A84 E5            [11]  113 	push	hl
   3A85 21 72 3B      [10]  114 	ld	hl, #___str_1
   3A88 E5            [11]  115 	push	hl
   3A89 CD B4 5D      [17]  116 	call	_mydrawStringM1
                            117 ;src/main.c:57: mydrawStringM1("           Castle Concepcion", cpctm_screenPtr(CPCT_VMEM_START, 0, 16));
   3A8C 21 A0 C0      [10]  118 	ld	hl, #0xc0a0
   3A8F E5            [11]  119 	push	hl
   3A90 21 88 3B      [10]  120 	ld	hl, #___str_2
   3A93 E5            [11]  121 	push	hl
   3A94 CD B4 5D      [17]  122 	call	_mydrawStringM1
                            123 ;src/main.c:58: mydrawStringM1("Mendo was in love with Lady Sol, a rich ", cpctm_screenPtr(CPCT_VMEM_START, 0, 40));
   3A97 21 90 C1      [10]  124 	ld	hl, #0xc190
   3A9A E5            [11]  125 	push	hl
   3A9B 21 A5 3B      [10]  126 	ld	hl, #___str_3
   3A9E E5            [11]  127 	push	hl
   3A9F CD B4 5D      [17]  128 	call	_mydrawStringM1
                            129 ;src/main.c:59: mydrawStringM1("and beautiful woman. He was so poor that", cpctm_screenPtr(CPCT_VMEM_START, 0, 48));
   3AA2 21 E0 C1      [10]  130 	ld	hl, #0xc1e0
   3AA5 E5            [11]  131 	push	hl
   3AA6 21 CE 3B      [10]  132 	ld	hl, #___str_4
   3AA9 E5            [11]  133 	push	hl
   3AAA CD B4 5D      [17]  134 	call	_mydrawStringM1
                            135 ;src/main.c:60: mydrawStringM1("he couldn't marry her. He decided to go ", cpctm_screenPtr(CPCT_VMEM_START, 0, 56));
   3AAD 21 30 C2      [10]  136 	ld	hl, #0xc230
   3AB0 E5            [11]  137 	push	hl
   3AB1 21 F7 3B      [10]  138 	ld	hl, #___str_5
   3AB4 E5            [11]  139 	push	hl
   3AB5 CD B4 5D      [17]  140 	call	_mydrawStringM1
                            141 ;src/main.c:61: mydrawStringM1("to the Crusades to get Fortune and Fame.", cpctm_screenPtr(CPCT_VMEM_START, 0, 64));
   3AB8 21 80 C2      [10]  142 	ld	hl, #0xc280
   3ABB E5            [11]  143 	push	hl
   3ABC 21 20 3C      [10]  144 	ld	hl, #___str_6
   3ABF E5            [11]  145 	push	hl
   3AC0 CD B4 5D      [17]  146 	call	_mydrawStringM1
                            147 ;src/main.c:63: mydrawStringM1("When he became a brave hero, he heard", cpctm_screenPtr(CPCT_VMEM_START, 0, 80));
   3AC3 21 20 C3      [10]  148 	ld	hl, #0xc320
   3AC6 E5            [11]  149 	push	hl
   3AC7 21 49 3C      [10]  150 	ld	hl, #___str_7
   3ACA E5            [11]  151 	push	hl
   3ACB CD B4 5D      [17]  152 	call	_mydrawStringM1
                            153 ;src/main.c:64: mydrawStringM1("Lady Sol was forced to marry don Ricardo", cpctm_screenPtr(CPCT_VMEM_START, 0, 88));
   3ACE 21 70 C3      [10]  154 	ld	hl, #0xc370
   3AD1 E5            [11]  155 	push	hl
   3AD2 21 6F 3C      [10]  156 	ld	hl, #___str_8
   3AD5 E5            [11]  157 	push	hl
   3AD6 CD B4 5D      [17]  158 	call	_mydrawStringM1
                            159 ;src/main.c:65: mydrawStringM1("a very important noble. ", cpctm_screenPtr(CPCT_VMEM_START, 0, 96));
   3AD9 21 C0 C3      [10]  160 	ld	hl, #0xc3c0
   3ADC E5            [11]  161 	push	hl
   3ADD 21 98 3C      [10]  162 	ld	hl, #___str_9
   3AE0 E5            [11]  163 	push	hl
   3AE1 CD B4 5D      [17]  164 	call	_mydrawStringM1
                            165 ;src/main.c:67: mydrawStringM1("Bring to an end the bloody Crusades war,", cpctm_screenPtr(CPCT_VMEM_START, 0, 112));
   3AE4 21 60 C4      [10]  166 	ld	hl, #0xc460
   3AE7 E5            [11]  167 	push	hl
   3AE8 21 B1 3C      [10]  168 	ld	hl, #___str_10
   3AEB E5            [11]  169 	push	hl
   3AEC CD B4 5D      [17]  170 	call	_mydrawStringM1
                            171 ;src/main.c:68: mydrawStringM1("go through the underway passage and ", cpctm_screenPtr(CPCT_VMEM_START, 0, 120));
   3AEF 21 B0 C4      [10]  172 	ld	hl, #0xc4b0
   3AF2 E5            [11]  173 	push	hl
   3AF3 21 DA 3C      [10]  174 	ld	hl, #___str_11
   3AF6 E5            [11]  175 	push	hl
   3AF7 CD B4 5D      [17]  176 	call	_mydrawStringM1
                            177 ;src/main.c:69: mydrawStringM1("finally assault the Castle to help Don ", cpctm_screenPtr(CPCT_VMEM_START, 0, 128));
   3AFA 21 00 C5      [10]  178 	ld	hl, #0xc500
   3AFD E5            [11]  179 	push	hl
   3AFE 21 FF 3C      [10]  180 	ld	hl, #___str_12
   3B01 E5            [11]  181 	push	hl
   3B02 CD B4 5D      [17]  182 	call	_mydrawStringM1
                            183 ;src/main.c:70: mydrawStringM1("Mendo to go back to his love: Lady Sun.", cpctm_screenPtr(CPCT_VMEM_START, 0, 136));
   3B05 21 50 C5      [10]  184 	ld	hl, #0xc550
   3B08 E5            [11]  185 	push	hl
   3B09 21 27 3D      [10]  186 	ld	hl, #___str_13
   3B0C E5            [11]  187 	push	hl
   3B0D CD B4 5D      [17]  188 	call	_mydrawStringM1
                            189 ;src/main.c:71: mydrawStringM1("PRESS ANY KEY TO START", cpct_getScreenPtr(CPCT_VMEM_START, 0, 168));
   3B10 21 00 A8      [10]  190 	ld	hl, #0xa800
   3B13 E5            [11]  191 	push	hl
   3B14 26 C0         [ 7]  192 	ld	h, #0xc0
   3B16 E5            [11]  193 	push	hl
   3B17 CD D3 62      [17]  194 	call	_cpct_getScreenPtr
   3B1A 01 4F 3D      [10]  195 	ld	bc, #___str_14+0
   3B1D E5            [11]  196 	push	hl
   3B1E C5            [11]  197 	push	bc
   3B1F CD B4 5D      [17]  198 	call	_mydrawStringM1
                            199 ;src/main.c:74: pausaTecladoLibre();
   3B22 CD 31 53      [17]  200 	call	_pausaTecladoLibre
                            201 ;src/main.c:78: do {
   3B25 0E 00         [ 7]  202 	ld	c, #0x00
   3B27                     203 00101$:
                            204 ;src/main.c:79: cpct_scanKeyboard_f();
   3B27 C5            [11]  205 	push	bc
   3B28 CD 4E 5E      [17]  206 	call	_cpct_scanKeyboard_f
   3B2B C1            [10]  207 	pop	bc
                            208 ;src/main.c:80: semilla++;
   3B2C 0C            [ 4]  209 	inc	c
                            210 ;src/main.c:82: while (!cpct_isAnyKeyPressed_f());
   3B2D C5            [11]  211 	push	bc
   3B2E CD A4 61      [17]  212 	call	_cpct_isAnyKeyPressed_f
   3B31 C1            [10]  213 	pop	bc
   3B32 7D            [ 4]  214 	ld	a, l
   3B33 B7            [ 4]  215 	or	a, a
   3B34 28 F1         [12]  216 	jr	Z,00101$
                            217 ;src/main.c:85: if (!semilla)
   3B36 79            [ 4]  218 	ld	a,c
   3B37 6F            [ 4]  219 	ld	l,a
   3B38 B7            [ 4]  220 	or	a, a
   3B39 20 02         [12]  221 	jr	NZ,00105$
                            222 ;src/main.c:86: semilla = 1;
   3B3B 2E 01         [ 7]  223 	ld	l, #0x01
   3B3D                     224 00105$:
                            225 ;src/main.c:88: cpct_srand8(semilla);
   3B3D 26 00         [ 7]  226 	ld	h, #0x00
   3B3F 11 00 00      [10]  227 	ld	de,#0x0000
   3B42 CD 5E 60      [17]  228 	call	_cpct_setSeed_mxor
   3B45 CD 66 60      [17]  229 	call	_cpct_restoreState_mxor_u8
                            230 ;src/main.c:89: juego();
   3B48 CD 61 51      [17]  231 	call	_juego
   3B4B C3 4B 3A      [10]  232 	jp	00107$
   3B4E                     233 _paletaM1:
   3B4E 54                  234 	.db #0x54	; 84	'T'
   3B4F 40                  235 	.db #0x40	; 64
   3B50 4B                  236 	.db #0x4b	; 75	'K'
   3B51 44                  237 	.db #0x44	; 68	'D'
   3B52                     238 ___str_0:
   3B52 20 20 20 20 20 20   239 	.ascii "         Don Mendo and Lady Sol"
        20 20 20 44 6F 6E
        20 4D 65 6E 64 6F
        20 61 6E 64 20 4C
        61 64 79 20 53 6F
        6C
   3B71 00                  240 	.db 0x00
   3B72                     241 ___str_1:
   3B72 20 20 20 20 20 20   242 	.ascii "                   in"
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 69 6E
   3B87 00                  243 	.db 0x00
   3B88                     244 ___str_2:
   3B88 20 20 20 20 20 20   245 	.ascii "           Castle Concepcion"
        20 20 20 20 20 43
        61 73 74 6C 65 20
        43 6F 6E 63 65 70
        63 69 6F 6E
   3BA4 00                  246 	.db 0x00
   3BA5                     247 ___str_3:
   3BA5 4D 65 6E 64 6F 20   248 	.ascii "Mendo was in love with Lady Sol, a rich "
        77 61 73 20 69 6E
        20 6C 6F 76 65 20
        77 69 74 68 20 4C
        61 64 79 20 53 6F
        6C 2C 20 61 20 72
        69 63 68 20
   3BCD 00                  249 	.db 0x00
   3BCE                     250 ___str_4:
   3BCE 61 6E 64 20 62 65   251 	.ascii "and beautiful woman. He was so poor that"
        61 75 74 69 66 75
        6C 20 77 6F 6D 61
        6E 2E 20 48 65 20
        77 61 73 20 73 6F
        20 70 6F 6F 72 20
        74 68 61 74
   3BF6 00                  252 	.db 0x00
   3BF7                     253 ___str_5:
   3BF7 68 65 20 63 6F 75   254 	.ascii "he couldn't marry her. He decided to go "
        6C 64 6E 27 74 20
        6D 61 72 72 79 20
        68 65 72 2E 20 48
        65 20 64 65 63 69
        64 65 64 20 74 6F
        20 67 6F 20
   3C1F 00                  255 	.db 0x00
   3C20                     256 ___str_6:
   3C20 74 6F 20 74 68 65   257 	.ascii "to the Crusades to get Fortune and Fame."
        20 43 72 75 73 61
        64 65 73 20 74 6F
        20 67 65 74 20 46
        6F 72 74 75 6E 65
        20 61 6E 64 20 46
        61 6D 65 2E
   3C48 00                  258 	.db 0x00
   3C49                     259 ___str_7:
   3C49 57 68 65 6E 20 68   260 	.ascii "When he became a brave hero, he heard"
        65 20 62 65 63 61
        6D 65 20 61 20 62
        72 61 76 65 20 68
        65 72 6F 2C 20 68
        65 20 68 65 61 72
        64
   3C6E 00                  261 	.db 0x00
   3C6F                     262 ___str_8:
   3C6F 4C 61 64 79 20 53   263 	.ascii "Lady Sol was forced to marry don Ricardo"
        6F 6C 20 77 61 73
        20 66 6F 72 63 65
        64 20 74 6F 20 6D
        61 72 72 79 20 64
        6F 6E 20 52 69 63
        61 72 64 6F
   3C97 00                  264 	.db 0x00
   3C98                     265 ___str_9:
   3C98 61 20 76 65 72 79   266 	.ascii "a very important noble. "
        20 69 6D 70 6F 72
        74 61 6E 74 20 6E
        6F 62 6C 65 2E 20
   3CB0 00                  267 	.db 0x00
   3CB1                     268 ___str_10:
   3CB1 42 72 69 6E 67 20   269 	.ascii "Bring to an end the bloody Crusades war,"
        74 6F 20 61 6E 20
        65 6E 64 20 74 68
        65 20 62 6C 6F 6F
        64 79 20 43 72 75
        73 61 64 65 73 20
        77 61 72 2C
   3CD9 00                  270 	.db 0x00
   3CDA                     271 ___str_11:
   3CDA 67 6F 20 74 68 72   272 	.ascii "go through the underway passage and "
        6F 75 67 68 20 74
        68 65 20 75 6E 64
        65 72 77 61 79 20
        70 61 73 73 61 67
        65 20 61 6E 64 20
   3CFE 00                  273 	.db 0x00
   3CFF                     274 ___str_12:
   3CFF 66 69 6E 61 6C 6C   275 	.ascii "finally assault the Castle to help Don "
        79 20 61 73 73 61
        75 6C 74 20 74 68
        65 20 43 61 73 74
        6C 65 20 74 6F 20
        68 65 6C 70 20 44
        6F 6E 20
   3D26 00                  276 	.db 0x00
   3D27                     277 ___str_13:
   3D27 4D 65 6E 64 6F 20   278 	.ascii "Mendo to go back to his love: Lady Sun."
        74 6F 20 67 6F 20
        62 61 63 6B 20 74
        6F 20 68 69 73 20
        6C 6F 76 65 3A 20
        4C 61 64 79 20 53
        75 6E 2E
   3D4E 00                  279 	.db 0x00
   3D4F                     280 ___str_14:
   3D4F 50 52 45 53 53 20   281 	.ascii "PRESS ANY KEY TO START"
        41 4E 59 20 4B 45
        59 20 54 4F 20 53
        54 41 52 54
   3D65 00                  282 	.db 0x00
                            283 	.area _CODE
                            284 	.area _INITIALIZER
                            285 	.area _CABS (ABS)
