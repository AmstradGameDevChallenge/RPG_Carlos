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
                             26 	.globl _cursorPrint
                             27 	.globl _goblin
                             28 	.globl _player
                             29 	.globl _nivel
                             30 	.globl _entidad
                             31 	.globl _SoldadoArabe
                             32 	.globl _paletaM1
                             33 ;--------------------------------------------------------
                             34 ; special function registers
                             35 ;--------------------------------------------------------
                             36 ;--------------------------------------------------------
                             37 ; ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DATA
   7E52                      40 _entidad::
   7E52                      41 	.ds 60
   7E8E                      42 _nivel::
   7E8E                      43 	.ds 1
   7E8F                      44 _player::
   7E8F                      45 	.ds 20
   7EA3                      46 _goblin::
   7EA3                      47 	.ds 20
   7EB7                      48 _cursorPrint::
   7EB7                      49 	.ds 1
                             50 ;--------------------------------------------------------
                             51 ; ram data
                             52 ;--------------------------------------------------------
                             53 	.area _INITIALIZED
                             54 ;--------------------------------------------------------
                             55 ; absolute external ram data
                             56 ;--------------------------------------------------------
                             57 	.area _DABS (ABS)
                             58 ;--------------------------------------------------------
                             59 ; global & static initialisations
                             60 ;--------------------------------------------------------
                             61 	.area _HOME
                             62 	.area _GSINIT
                             63 	.area _GSFINAL
                             64 	.area _GSINIT
                             65 ;--------------------------------------------------------
                             66 ; Home
                             67 ;--------------------------------------------------------
                             68 	.area _HOME
                             69 	.area _HOME
                             70 ;--------------------------------------------------------
                             71 ; code
                             72 ;--------------------------------------------------------
                             73 	.area _CODE
                             74 ;src/main.c:44: void main(void) {
                             75 ;	---------------------------------
                             76 ; Function main
                             77 ; ---------------------------------
   5B88                      78 _main::
                             79 ;src/main.c:48: cpct_disableFirmware();
   5B88 CD 9B 71      [17]   80 	call	_cpct_disableFirmware
                             81 ;src/main.c:51: while (1) {
   5B8B                      82 00107$:
                             83 ;src/main.c:52: cpct_setVideoMode(1);
   5B8B 2E 01         [ 7]   84 	ld	l, #0x01
   5B8D CD 3F 71      [17]   85 	call	_cpct_setVideoMode
                             86 ;src/main.c:53: cpct_clearScreen(0x00);
   5B90 21 00 40      [10]   87 	ld	hl, #0x4000
   5B93 E5            [11]   88 	push	hl
   5B94 AF            [ 4]   89 	xor	a, a
   5B95 F5            [11]   90 	push	af
   5B96 33            [ 6]   91 	inc	sp
   5B97 26 C0         [ 7]   92 	ld	h, #0xc0
   5B99 E5            [11]   93 	push	hl
   5B9A CD 70 71      [17]   94 	call	_cpct_memset
                             95 ;src/main.c:54: cpct_setPalette(paletaM1,4);
   5B9D 21 04 00      [10]   96 	ld	hl, #0x0004
   5BA0 E5            [11]   97 	push	hl
   5BA1 21 93 5C      [10]   98 	ld	hl, #_paletaM1
   5BA4 E5            [11]   99 	push	hl
   5BA5 CD 60 6D      [17]  100 	call	_cpct_setPalette
                            101 ;src/main.c:55: cpct_setBorder(HW_BLACK);
   5BA8 21 10 14      [10]  102 	ld	hl, #0x1410
   5BAB E5            [11]  103 	push	hl
   5BAC CD E1 6D      [17]  104 	call	_cpct_setPALColour
                            105 ;src/main.c:58: cpct_setDrawCharM1(2, 0);
   5BAF 21 02 00      [10]  106 	ld	hl, #0x0002
   5BB2 E5            [11]  107 	push	hl
   5BB3 CD A5 72      [17]  108 	call	_cpct_setDrawCharM1
                            109 ;src/main.c:59: cpct_drawStringM1("         Don Mendo and Lady Sol", cpctm_screenPtr(CPCT_VMEM_START, 0, 0));
   5BB6 21 00 C0      [10]  110 	ld	hl, #0xc000
   5BB9 E5            [11]  111 	push	hl
   5BBA 21 AB 5C      [10]  112 	ld	hl, #___str_0
   5BBD E5            [11]  113 	push	hl
   5BBE CD ED 6D      [17]  114 	call	_cpct_drawStringM1
                            115 ;src/main.c:60: cpct_drawStringM1("                   in", cpctm_screenPtr(CPCT_VMEM_START, 0, 8));
   5BC1 21 50 C0      [10]  116 	ld	hl, #0xc050
   5BC4 E5            [11]  117 	push	hl
   5BC5 21 CB 5C      [10]  118 	ld	hl, #___str_1
   5BC8 E5            [11]  119 	push	hl
   5BC9 CD ED 6D      [17]  120 	call	_cpct_drawStringM1
                            121 ;src/main.c:61: cpct_drawStringM1("           Castle Concepcion", cpctm_screenPtr(CPCT_VMEM_START, 0, 16));
   5BCC 21 A0 C0      [10]  122 	ld	hl, #0xc0a0
   5BCF E5            [11]  123 	push	hl
   5BD0 21 E1 5C      [10]  124 	ld	hl, #___str_2
   5BD3 E5            [11]  125 	push	hl
   5BD4 CD ED 6D      [17]  126 	call	_cpct_drawStringM1
                            127 ;src/main.c:62: cpct_drawStringM1("Mendo was in love with Lady Sol, a rich ", cpctm_screenPtr(CPCT_VMEM_START, 0, 40));
   5BD7 21 90 C1      [10]  128 	ld	hl, #0xc190
   5BDA E5            [11]  129 	push	hl
   5BDB 21 FE 5C      [10]  130 	ld	hl, #___str_3
   5BDE E5            [11]  131 	push	hl
   5BDF CD ED 6D      [17]  132 	call	_cpct_drawStringM1
                            133 ;src/main.c:63: cpct_drawStringM1("and beautiful woman. He was so poor that", cpctm_screenPtr(CPCT_VMEM_START, 0, 48));
   5BE2 21 E0 C1      [10]  134 	ld	hl, #0xc1e0
   5BE5 E5            [11]  135 	push	hl
   5BE6 21 27 5D      [10]  136 	ld	hl, #___str_4
   5BE9 E5            [11]  137 	push	hl
   5BEA CD ED 6D      [17]  138 	call	_cpct_drawStringM1
                            139 ;src/main.c:64: cpct_drawStringM1("he couldn't marry her. He decided to go ", cpctm_screenPtr(CPCT_VMEM_START, 0, 56));
   5BED 21 30 C2      [10]  140 	ld	hl, #0xc230
   5BF0 E5            [11]  141 	push	hl
   5BF1 21 50 5D      [10]  142 	ld	hl, #___str_5
   5BF4 E5            [11]  143 	push	hl
   5BF5 CD ED 6D      [17]  144 	call	_cpct_drawStringM1
                            145 ;src/main.c:65: cpct_drawStringM1("to the Crusades to get Fortune and Fame.", cpctm_screenPtr(CPCT_VMEM_START, 0, 64));
   5BF8 21 80 C2      [10]  146 	ld	hl, #0xc280
   5BFB E5            [11]  147 	push	hl
   5BFC 21 79 5D      [10]  148 	ld	hl, #___str_6
   5BFF E5            [11]  149 	push	hl
   5C00 CD ED 6D      [17]  150 	call	_cpct_drawStringM1
                            151 ;src/main.c:67: cpct_drawStringM1("When he became a brave hero, he heard", cpctm_screenPtr(CPCT_VMEM_START, 0, 80));
   5C03 21 20 C3      [10]  152 	ld	hl, #0xc320
   5C06 E5            [11]  153 	push	hl
   5C07 21 A2 5D      [10]  154 	ld	hl, #___str_7
   5C0A E5            [11]  155 	push	hl
   5C0B CD ED 6D      [17]  156 	call	_cpct_drawStringM1
                            157 ;src/main.c:68: cpct_drawStringM1("Lady Sol was forced to marry don Ricardo", cpctm_screenPtr(CPCT_VMEM_START, 0, 88));
   5C0E 21 70 C3      [10]  158 	ld	hl, #0xc370
   5C11 E5            [11]  159 	push	hl
   5C12 21 C8 5D      [10]  160 	ld	hl, #___str_8
   5C15 E5            [11]  161 	push	hl
   5C16 CD ED 6D      [17]  162 	call	_cpct_drawStringM1
                            163 ;src/main.c:69: cpct_drawStringM1("a very important noble. ", cpctm_screenPtr(CPCT_VMEM_START, 0, 96));
   5C19 21 C0 C3      [10]  164 	ld	hl, #0xc3c0
   5C1C E5            [11]  165 	push	hl
   5C1D 21 F1 5D      [10]  166 	ld	hl, #___str_9
   5C20 E5            [11]  167 	push	hl
   5C21 CD ED 6D      [17]  168 	call	_cpct_drawStringM1
                            169 ;src/main.c:71: cpct_drawStringM1("Bring to an end the bloody Crusades war,", cpctm_screenPtr(CPCT_VMEM_START, 0, 112));
   5C24 21 60 C4      [10]  170 	ld	hl, #0xc460
   5C27 E5            [11]  171 	push	hl
   5C28 21 0A 5E      [10]  172 	ld	hl, #___str_10
   5C2B E5            [11]  173 	push	hl
   5C2C CD ED 6D      [17]  174 	call	_cpct_drawStringM1
                            175 ;src/main.c:72: cpct_drawStringM1("go through the underway passage and ", cpctm_screenPtr(CPCT_VMEM_START, 0, 120));
   5C2F 21 B0 C4      [10]  176 	ld	hl, #0xc4b0
   5C32 E5            [11]  177 	push	hl
   5C33 21 33 5E      [10]  178 	ld	hl, #___str_11
   5C36 E5            [11]  179 	push	hl
   5C37 CD ED 6D      [17]  180 	call	_cpct_drawStringM1
                            181 ;src/main.c:73: cpct_drawStringM1("finally assault the Castle to help Don ", cpctm_screenPtr(CPCT_VMEM_START, 0, 128));
   5C3A 21 00 C5      [10]  182 	ld	hl, #0xc500
   5C3D E5            [11]  183 	push	hl
   5C3E 21 58 5E      [10]  184 	ld	hl, #___str_12
   5C41 E5            [11]  185 	push	hl
   5C42 CD ED 6D      [17]  186 	call	_cpct_drawStringM1
                            187 ;src/main.c:74: cpct_drawStringM1("Mendo to go back to his love: Lady Sun.", cpctm_screenPtr(CPCT_VMEM_START, 0, 136));
   5C45 21 50 C5      [10]  188 	ld	hl, #0xc550
   5C48 E5            [11]  189 	push	hl
   5C49 21 80 5E      [10]  190 	ld	hl, #___str_13
   5C4C E5            [11]  191 	push	hl
   5C4D CD ED 6D      [17]  192 	call	_cpct_drawStringM1
                            193 ;src/main.c:75: cpct_drawStringM1("PRESS ANY KEY TO START", cpct_getScreenPtr(CPCT_VMEM_START, 0, 168));
   5C50 21 00 A8      [10]  194 	ld	hl, #0xa800
   5C53 E5            [11]  195 	push	hl
   5C54 26 C0         [ 7]  196 	ld	h, #0xc0
   5C56 E5            [11]  197 	push	hl
   5C57 CD 85 72      [17]  198 	call	_cpct_getScreenPtr
   5C5A 01 A8 5E      [10]  199 	ld	bc, #___str_14+0
   5C5D E5            [11]  200 	push	hl
   5C5E C5            [11]  201 	push	bc
   5C5F CD ED 6D      [17]  202 	call	_cpct_drawStringM1
                            203 ;src/main.c:78: pausaTecladoLibre();
   5C62 CD F4 5E      [17]  204 	call	_pausaTecladoLibre
                            205 ;src/main.c:82: do {
   5C65 0E 00         [ 7]  206 	ld	c, #0x00
   5C67                     207 00101$:
                            208 ;src/main.c:83: cpct_scanKeyboard_f();
   5C67 C5            [11]  209 	push	bc
   5C68 CD 77 6D      [17]  210 	call	_cpct_scanKeyboard_f
   5C6B C1            [10]  211 	pop	bc
                            212 ;src/main.c:84: semilla++;
   5C6C 0C            [ 4]  213 	inc	c
                            214 ;src/main.c:86: while (!cpct_isAnyKeyPressed_f());
   5C6D C5            [11]  215 	push	bc
   5C6E CD 4D 71      [17]  216 	call	_cpct_isAnyKeyPressed_f
   5C71 C1            [10]  217 	pop	bc
   5C72 7D            [ 4]  218 	ld	a, l
   5C73 B7            [ 4]  219 	or	a, a
   5C74 28 F1         [12]  220 	jr	Z,00101$
                            221 ;src/main.c:89: if (!semilla)
   5C76 79            [ 4]  222 	ld	a,c
   5C77 6F            [ 4]  223 	ld	l,a
   5C78 B7            [ 4]  224 	or	a, a
   5C79 20 02         [12]  225 	jr	NZ,00105$
                            226 ;src/main.c:90: semilla = 1;
   5C7B 2E 01         [ 7]  227 	ld	l, #0x01
   5C7D                     228 00105$:
                            229 ;src/main.c:92: cpct_srand8(semilla);
   5C7D 26 00         [ 7]  230 	ld	h, #0x00
   5C7F 11 00 00      [10]  231 	ld	de,#0x0000
   5C82 CD 07 70      [17]  232 	call	_cpct_setSeed_mxor
   5C85 CD 0F 70      [17]  233 	call	_cpct_restoreState_mxor_u8
                            234 ;src/main.c:93: nivel = 1;
   5C88 21 8E 7E      [10]  235 	ld	hl,#_nivel + 0
   5C8B 36 01         [10]  236 	ld	(hl), #0x01
                            237 ;src/main.c:94: juego();
   5C8D CD 1B 6B      [17]  238 	call	_juego
   5C90 C3 8B 5B      [10]  239 	jp	00107$
   5C93                     240 _paletaM1:
   5C93 54                  241 	.db #0x54	; 84	'T'
   5C94 40                  242 	.db #0x40	; 64
   5C95 4B                  243 	.db #0x4b	; 75	'K'
   5C96 44                  244 	.db #0x44	; 68	'D'
   5C97                     245 _SoldadoArabe:
   5C97 53 6F 6C 64 69 65   246 	.ascii "Soldier"
        72
   5C9E 00                  247 	.db 0x00
   5C9F 00                  248 	.db 0x00
   5CA0 00                  249 	.db 0x00
   5CA1 5A                  250 	.db #0x5a	; 90	'Z'
   5CA2 5A                  251 	.db #0x5a	; 90	'Z'
   5CA3 14                  252 	.db #0x14	; 20
   5CA4 03                  253 	.db #0x03	; 3
   5CA5 0A                  254 	.db #0x0a	; 10
   5CA6 1C                  255 	.db #0x1c	; 28
   5CA7 1C                  256 	.db #0x1c	; 28
   5CA8 20                  257 	.db #0x20	; 32
   5CA9 34 6C               258 	.dw (_G_arabe_1 + 0)
   5CAB                     259 ___str_0:
   5CAB 20 20 20 20 20 20   260 	.ascii "         Don Mendo and Lady Sol"
        20 20 20 44 6F 6E
        20 4D 65 6E 64 6F
        20 61 6E 64 20 4C
        61 64 79 20 53 6F
        6C
   5CCA 00                  261 	.db 0x00
   5CCB                     262 ___str_1:
   5CCB 20 20 20 20 20 20   263 	.ascii "                   in"
        20 20 20 20 20 20
        20 20 20 20 20 20
        20 69 6E
   5CE0 00                  264 	.db 0x00
   5CE1                     265 ___str_2:
   5CE1 20 20 20 20 20 20   266 	.ascii "           Castle Concepcion"
        20 20 20 20 20 43
        61 73 74 6C 65 20
        43 6F 6E 63 65 70
        63 69 6F 6E
   5CFD 00                  267 	.db 0x00
   5CFE                     268 ___str_3:
   5CFE 4D 65 6E 64 6F 20   269 	.ascii "Mendo was in love with Lady Sol, a rich "
        77 61 73 20 69 6E
        20 6C 6F 76 65 20
        77 69 74 68 20 4C
        61 64 79 20 53 6F
        6C 2C 20 61 20 72
        69 63 68 20
   5D26 00                  270 	.db 0x00
   5D27                     271 ___str_4:
   5D27 61 6E 64 20 62 65   272 	.ascii "and beautiful woman. He was so poor that"
        61 75 74 69 66 75
        6C 20 77 6F 6D 61
        6E 2E 20 48 65 20
        77 61 73 20 73 6F
        20 70 6F 6F 72 20
        74 68 61 74
   5D4F 00                  273 	.db 0x00
   5D50                     274 ___str_5:
   5D50 68 65 20 63 6F 75   275 	.ascii "he couldn't marry her. He decided to go "
        6C 64 6E 27 74 20
        6D 61 72 72 79 20
        68 65 72 2E 20 48
        65 20 64 65 63 69
        64 65 64 20 74 6F
        20 67 6F 20
   5D78 00                  276 	.db 0x00
   5D79                     277 ___str_6:
   5D79 74 6F 20 74 68 65   278 	.ascii "to the Crusades to get Fortune and Fame."
        20 43 72 75 73 61
        64 65 73 20 74 6F
        20 67 65 74 20 46
        6F 72 74 75 6E 65
        20 61 6E 64 20 46
        61 6D 65 2E
   5DA1 00                  279 	.db 0x00
   5DA2                     280 ___str_7:
   5DA2 57 68 65 6E 20 68   281 	.ascii "When he became a brave hero, he heard"
        65 20 62 65 63 61
        6D 65 20 61 20 62
        72 61 76 65 20 68
        65 72 6F 2C 20 68
        65 20 68 65 61 72
        64
   5DC7 00                  282 	.db 0x00
   5DC8                     283 ___str_8:
   5DC8 4C 61 64 79 20 53   284 	.ascii "Lady Sol was forced to marry don Ricardo"
        6F 6C 20 77 61 73
        20 66 6F 72 63 65
        64 20 74 6F 20 6D
        61 72 72 79 20 64
        6F 6E 20 52 69 63
        61 72 64 6F
   5DF0 00                  285 	.db 0x00
   5DF1                     286 ___str_9:
   5DF1 61 20 76 65 72 79   287 	.ascii "a very important noble. "
        20 69 6D 70 6F 72
        74 61 6E 74 20 6E
        6F 62 6C 65 2E 20
   5E09 00                  288 	.db 0x00
   5E0A                     289 ___str_10:
   5E0A 42 72 69 6E 67 20   290 	.ascii "Bring to an end the bloody Crusades war,"
        74 6F 20 61 6E 20
        65 6E 64 20 74 68
        65 20 62 6C 6F 6F
        64 79 20 43 72 75
        73 61 64 65 73 20
        77 61 72 2C
   5E32 00                  291 	.db 0x00
   5E33                     292 ___str_11:
   5E33 67 6F 20 74 68 72   293 	.ascii "go through the underway passage and "
        6F 75 67 68 20 74
        68 65 20 75 6E 64
        65 72 77 61 79 20
        70 61 73 73 61 67
        65 20 61 6E 64 20
   5E57 00                  294 	.db 0x00
   5E58                     295 ___str_12:
   5E58 66 69 6E 61 6C 6C   296 	.ascii "finally assault the Castle to help Don "
        79 20 61 73 73 61
        75 6C 74 20 74 68
        65 20 43 61 73 74
        6C 65 20 74 6F 20
        68 65 6C 70 20 44
        6F 6E 20
   5E7F 00                  297 	.db 0x00
   5E80                     298 ___str_13:
   5E80 4D 65 6E 64 6F 20   299 	.ascii "Mendo to go back to his love: Lady Sun."
        74 6F 20 67 6F 20
        62 61 63 6B 20 74
        6F 20 68 69 73 20
        6C 6F 76 65 3A 20
        4C 61 64 79 20 53
        75 6E 2E
   5EA7 00                  300 	.db 0x00
   5EA8                     301 ___str_14:
   5EA8 50 52 45 53 53 20   302 	.ascii "PRESS ANY KEY TO START"
        41 4E 59 20 4B 45
        59 20 54 4F 20 53
        54 41 52 54
   5EBE 00                  303 	.db 0x00
                            304 	.area _CODE
                            305 	.area _INITIALIZER
                            306 	.area _CABS (ABS)
