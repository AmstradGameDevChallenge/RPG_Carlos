;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (CYGWIN)
;--------------------------------------------------------
	.module fase_18
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_mapa18
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
_g_mapa18:
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x1a	; 26
	.db #0x1a	; 26
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x11	; 17
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x24	; 36
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x10	; 16
	.db #0x2e	; 46
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x1a	; 26
	.db #0x38	; 56	'8'
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x27	; 39
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x24	; 36
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x31	; 49	'1'
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x2e	; 46
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x3b	; 59
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x38	; 56	'8'
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x20	; 32
	.db #0xc7	; 199
	.db #0x49	; 73	'I'
	.db #0x4a	; 74	'J'
	.db #0xc7	; 199
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0xc7	; 199
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x5d	; 93
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x3b	; 59
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0xc7	; 199
	.db #0x67	; 103	'g'
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
	.db #0x46	; 70	'F'
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
