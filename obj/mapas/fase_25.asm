;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (CYGWIN)
;--------------------------------------------------------
	.module fase_25
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_mapa25
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
_g_mapa25:
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0xc7	; 199
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x51	; 81	'Q'
	.db #0xc7	; 199
	.db #0x5b	; 91
	.db #0x50	; 80	'P'
	.db #0xc7	; 199
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0xc7	; 199
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0xc7	; 199
	.db #0x5b	; 91
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0xc7	; 199
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x51	; 81	'Q'
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x5b	; 91
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x65	; 101	'e'
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x50	; 80	'P'
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1f	; 31
	.area _INITIALIZER
	.area _CABS (ABS)
