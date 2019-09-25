;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (CYGWIN)
;--------------------------------------------------------
	.module fase_06
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_mapa06
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
_g_mapa06:
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
	.db #0x59	; 89	'Y'
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
	.db #0x59	; 89	'Y'
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
	.db #0x59	; 89	'Y'
	.db #0x5e	; 94
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x5e	; 94
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x5e	; 94
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x68	; 104	'h'
	.db #0x69	; 105	'i'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6d	; 109	'm'
	.db #0x68	; 104	'h'
	.db #0x69	; 105	'i'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6d	; 109	'm'
	.db #0x68	; 104	'h'
	.db #0x69	; 105	'i'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6d	; 109	'm'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x7c	; 124
	.db #0x7d	; 125
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x7c	; 124
	.db #0x7d	; 125
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x7c	; 124
	.db #0x7d	; 125
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x86	; 134
	.db #0x87	; 135
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8a	; 138
	.db #0x8b	; 139
	.db #0x86	; 134
	.db #0x87	; 135
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8a	; 138
	.db #0x8b	; 139
	.db #0x86	; 134
	.db #0x87	; 135
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8a	; 138
	.db #0x8b	; 139
	.db #0x90	; 144
	.db #0x91	; 145
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x90	; 144
	.db #0x91	; 145
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x90	; 144
	.db #0x91	; 145
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x9b	; 155
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x9e	; 158
	.db #0x9f	; 159
	.db #0x9a	; 154
	.db #0x9b	; 155
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x9e	; 158
	.db #0x9f	; 159
	.db #0x9a	; 154
	.db #0x9b	; 155
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x9e	; 158
	.db #0x9f	; 159
	.db #0xa4	; 164
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xa9	; 169
	.db #0xa4	; 164
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x24	; 36
	.db #0xa9	; 169
	.db #0xa4	; 164
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xa9	; 169
	.db #0xae	; 174
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xae	; 174
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xae	; 174
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xb8	; 184
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xbd	; 189
	.db #0xb8	; 184
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xbd	; 189
	.db #0xb8	; 184
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xbd	; 189
	.db #0xc2	; 194
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0xc2	; 194
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0xc2	; 194
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0xae	; 174
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xae	; 174
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xae	; 174
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xb8	; 184
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xbd	; 189
	.db #0xb8	; 184
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xbd	; 189
	.db #0xb8	; 184
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xbd	; 189
	.db #0xc2	; 194
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0xc2	; 194
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0xc2	; 194
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0xae	; 174
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xae	; 174
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xae	; 174
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xb8	; 184
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xbd	; 189
	.db #0xb8	; 184
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xbd	; 189
	.db #0xb8	; 184
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xbd	; 189
	.db #0xc2	; 194
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0xc2	; 194
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0xc2	; 194
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0xae	; 174
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xae	; 174
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xae	; 174
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xb8	; 184
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xbd	; 189
	.db #0xb8	; 184
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xbd	; 189
	.db #0xb8	; 184
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xbd	; 189
	.db #0xc2	; 194
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0xc2	; 194
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0xc2	; 194
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0xae	; 174
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xae	; 174
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xae	; 174
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xb3	; 179
	.db #0xb8	; 184
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xbd	; 189
	.db #0xb8	; 184
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xbd	; 189
	.db #0xb8	; 184
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xbd	; 189
	.db #0xc2	; 194
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0xc2	; 194
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0xc2	; 194
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xc7	; 199
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x4c	; 76	'L'
	.db #0x4d	; 77	'M'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.area _INITIALIZER
	.area _CABS (ABS)
