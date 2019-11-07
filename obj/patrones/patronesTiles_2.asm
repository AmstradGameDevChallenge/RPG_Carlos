;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (CYGWIN)
;--------------------------------------------------------
	.module patronesTiles_2
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_tileset2_199
	.globl _g_tileset2_198
	.globl _g_tileset2_197
	.globl _g_tileset2_196
	.globl _g_tileset2_195
	.globl _g_tileset2_194
	.globl _g_tileset2_193
	.globl _g_tileset2_192
	.globl _g_tileset2_191
	.globl _g_tileset2_190
	.globl _g_tileset2_189
	.globl _g_tileset2_188
	.globl _g_tileset2_187
	.globl _g_tileset2_186
	.globl _g_tileset2_185
	.globl _g_tileset2_184
	.globl _g_tileset2_183
	.globl _g_tileset2_182
	.globl _g_tileset2_181
	.globl _g_tileset2_180
	.globl _g_tileset2_179
	.globl _g_tileset2_178
	.globl _g_tileset2_177
	.globl _g_tileset2_176
	.globl _g_tileset2_175
	.globl _g_tileset2_174
	.globl _g_tileset2_173
	.globl _g_tileset2_172
	.globl _g_tileset2_171
	.globl _g_tileset2_170
	.globl _g_tileset2_169
	.globl _g_tileset2_168
	.globl _g_tileset2_167
	.globl _g_tileset2_166
	.globl _g_tileset2_165
	.globl _g_tileset2_164
	.globl _g_tileset2_163
	.globl _g_tileset2_162
	.globl _g_tileset2_161
	.globl _g_tileset2_160
	.globl _g_tileset2_159
	.globl _g_tileset2_158
	.globl _g_tileset2_157
	.globl _g_tileset2_156
	.globl _g_tileset2_155
	.globl _g_tileset2_154
	.globl _g_tileset2_153
	.globl _g_tileset2_152
	.globl _g_tileset2_151
	.globl _g_tileset2_150
	.globl _g_tileset2_149
	.globl _g_tileset2_148
	.globl _g_tileset2_147
	.globl _g_tileset2_146
	.globl _g_tileset2_145
	.globl _g_tileset2_144
	.globl _g_tileset2_143
	.globl _g_tileset2_142
	.globl _g_tileset2_141
	.globl _g_tileset2_140
	.globl _g_tileset2_139
	.globl _g_tileset2_138
	.globl _g_tileset2_137
	.globl _g_tileset2_136
	.globl _g_tileset2_135
	.globl _g_tileset2_134
	.globl _g_tileset2_133
	.globl _g_tileset2_132
	.globl _g_tileset2_131
	.globl _g_tileset2_130
	.globl _g_tileset2_129
	.globl _g_tileset2_128
	.globl _g_tileset2_127
	.globl _g_tileset2_126
	.globl _g_tileset2_125
	.globl _g_tileset2_124
	.globl _g_tileset2_123
	.globl _g_tileset2_122
	.globl _g_tileset2_121
	.globl _g_tileset2_120
	.globl _g_tileset2_119
	.globl _g_tileset2_118
	.globl _g_tileset2_117
	.globl _g_tileset2_116
	.globl _g_tileset2_115
	.globl _g_tileset2_114
	.globl _g_tileset2_113
	.globl _g_tileset2_112
	.globl _g_tileset2_111
	.globl _g_tileset2_110
	.globl _g_tileset2_109
	.globl _g_tileset2_108
	.globl _g_tileset2_107
	.globl _g_tileset2_106
	.globl _g_tileset2_105
	.globl _g_tileset2_104
	.globl _g_tileset2_103
	.globl _g_tileset2_102
	.globl _g_tileset2_101
	.globl _g_tileset2_100
	.globl _g_tileset2_099
	.globl _g_tileset2_098
	.globl _g_tileset2_097
	.globl _g_tileset2_096
	.globl _g_tileset2_095
	.globl _g_tileset2_094
	.globl _g_tileset2_093
	.globl _g_tileset2_092
	.globl _g_tileset2_091
	.globl _g_tileset2_090
	.globl _g_tileset2_089
	.globl _g_tileset2_088
	.globl _g_tileset2_087
	.globl _g_tileset2_086
	.globl _g_tileset2_085
	.globl _g_tileset2_084
	.globl _g_tileset2_083
	.globl _g_tileset2_082
	.globl _g_tileset2_081
	.globl _g_tileset2_080
	.globl _g_tileset2_079
	.globl _g_tileset2_078
	.globl _g_tileset2_077
	.globl _g_tileset2_076
	.globl _g_tileset2_075
	.globl _g_tileset2_074
	.globl _g_tileset2_073
	.globl _g_tileset2_072
	.globl _g_tileset2_071
	.globl _g_tileset2_070
	.globl _g_tileset2_069
	.globl _g_tileset2_068
	.globl _g_tileset2_067
	.globl _g_tileset2_066
	.globl _g_tileset2_065
	.globl _g_tileset2_064
	.globl _g_tileset2_063
	.globl _g_tileset2_062
	.globl _g_tileset2_061
	.globl _g_tileset2_060
	.globl _g_tileset2_059
	.globl _g_tileset2_058
	.globl _g_tileset2_057
	.globl _g_tileset2_056
	.globl _g_tileset2_055
	.globl _g_tileset2_054
	.globl _g_tileset2_053
	.globl _g_tileset2_052
	.globl _g_tileset2_051
	.globl _g_tileset2_050
	.globl _g_tileset2_049
	.globl _g_tileset2_048
	.globl _g_tileset2_047
	.globl _g_tileset2_046
	.globl _g_tileset2_045
	.globl _g_tileset2_044
	.globl _g_tileset2_043
	.globl _g_tileset2_042
	.globl _g_tileset2_041
	.globl _g_tileset2_040
	.globl _g_tileset2_039
	.globl _g_tileset2_038
	.globl _g_tileset2_037
	.globl _g_tileset2_036
	.globl _g_tileset2_035
	.globl _g_tileset2_034
	.globl _g_tileset2_033
	.globl _g_tileset2_032
	.globl _g_tileset2_031
	.globl _g_tileset2_030
	.globl _g_tileset2_029
	.globl _g_tileset2_028
	.globl _g_tileset2_027
	.globl _g_tileset2_026
	.globl _g_tileset2_025
	.globl _g_tileset2_024
	.globl _g_tileset2_023
	.globl _g_tileset2_022
	.globl _g_tileset2_021
	.globl _g_tileset2_020
	.globl _g_tileset2_019
	.globl _g_tileset2_018
	.globl _g_tileset2_017
	.globl _g_tileset2_016
	.globl _g_tileset2_015
	.globl _g_tileset2_014
	.globl _g_tileset2_013
	.globl _g_tileset2_012
	.globl _g_tileset2_011
	.globl _g_tileset2_010
	.globl _g_tileset2_009
	.globl _g_tileset2_008
	.globl _g_tileset2_007
	.globl _g_tileset2_006
	.globl _g_tileset2_005
	.globl _g_tileset2_004
	.globl _g_tileset2_003
	.globl _g_tileset2_002
	.globl _g_tileset2_001
	.globl _g_tileset2_000
	.globl _tileset2
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
_tileset2:
	.dw _g_tileset2_000
	.dw _g_tileset2_001
	.dw _g_tileset2_002
	.dw _g_tileset2_003
	.dw _g_tileset2_004
	.dw _g_tileset2_005
	.dw _g_tileset2_006
	.dw _g_tileset2_007
	.dw _g_tileset2_008
	.dw _g_tileset2_009
	.dw _g_tileset2_010
	.dw _g_tileset2_011
	.dw _g_tileset2_012
	.dw _g_tileset2_013
	.dw _g_tileset2_014
	.dw _g_tileset2_015
	.dw _g_tileset2_016
	.dw _g_tileset2_017
	.dw _g_tileset2_018
	.dw _g_tileset2_019
	.dw _g_tileset2_020
	.dw _g_tileset2_021
	.dw _g_tileset2_022
	.dw _g_tileset2_023
	.dw _g_tileset2_024
	.dw _g_tileset2_025
	.dw _g_tileset2_026
	.dw _g_tileset2_027
	.dw _g_tileset2_028
	.dw _g_tileset2_029
	.dw _g_tileset2_030
	.dw _g_tileset2_031
	.dw _g_tileset2_032
	.dw _g_tileset2_033
	.dw _g_tileset2_034
	.dw _g_tileset2_035
	.dw _g_tileset2_036
	.dw _g_tileset2_037
	.dw _g_tileset2_038
	.dw _g_tileset2_039
	.dw _g_tileset2_040
	.dw _g_tileset2_041
	.dw _g_tileset2_042
	.dw _g_tileset2_043
	.dw _g_tileset2_044
	.dw _g_tileset2_045
	.dw _g_tileset2_046
	.dw _g_tileset2_047
	.dw _g_tileset2_048
	.dw _g_tileset2_049
	.dw _g_tileset2_050
	.dw _g_tileset2_051
	.dw _g_tileset2_052
	.dw _g_tileset2_053
	.dw _g_tileset2_054
	.dw _g_tileset2_055
	.dw _g_tileset2_056
	.dw _g_tileset2_057
	.dw _g_tileset2_058
	.dw _g_tileset2_059
	.dw _g_tileset2_060
	.dw _g_tileset2_061
	.dw _g_tileset2_062
	.dw _g_tileset2_063
	.dw _g_tileset2_064
	.dw _g_tileset2_065
	.dw _g_tileset2_066
	.dw _g_tileset2_067
	.dw _g_tileset2_068
	.dw _g_tileset2_069
	.dw _g_tileset2_070
	.dw _g_tileset2_071
	.dw _g_tileset2_072
	.dw _g_tileset2_073
	.dw _g_tileset2_074
	.dw _g_tileset2_075
	.dw _g_tileset2_076
	.dw _g_tileset2_077
	.dw _g_tileset2_078
	.dw _g_tileset2_079
	.dw _g_tileset2_080
	.dw _g_tileset2_081
	.dw _g_tileset2_082
	.dw _g_tileset2_083
	.dw _g_tileset2_084
	.dw _g_tileset2_085
	.dw _g_tileset2_086
	.dw _g_tileset2_087
	.dw _g_tileset2_088
	.dw _g_tileset2_089
	.dw _g_tileset2_090
	.dw _g_tileset2_091
	.dw _g_tileset2_092
	.dw _g_tileset2_093
	.dw _g_tileset2_094
	.dw _g_tileset2_095
	.dw _g_tileset2_096
	.dw _g_tileset2_097
	.dw _g_tileset2_098
	.dw _g_tileset2_099
	.dw _g_tileset2_100
	.dw _g_tileset2_101
	.dw _g_tileset2_102
	.dw _g_tileset2_103
	.dw _g_tileset2_104
	.dw _g_tileset2_105
	.dw _g_tileset2_106
	.dw _g_tileset2_107
	.dw _g_tileset2_108
	.dw _g_tileset2_109
	.dw _g_tileset2_110
	.dw _g_tileset2_111
	.dw _g_tileset2_112
	.dw _g_tileset2_113
	.dw _g_tileset2_114
	.dw _g_tileset2_115
	.dw _g_tileset2_116
	.dw _g_tileset2_117
	.dw _g_tileset2_118
	.dw _g_tileset2_119
	.dw _g_tileset2_120
	.dw _g_tileset2_121
	.dw _g_tileset2_122
	.dw _g_tileset2_123
	.dw _g_tileset2_124
	.dw _g_tileset2_125
	.dw _g_tileset2_126
	.dw _g_tileset2_127
	.dw _g_tileset2_128
	.dw _g_tileset2_129
	.dw _g_tileset2_130
	.dw _g_tileset2_131
	.dw _g_tileset2_132
	.dw _g_tileset2_133
	.dw _g_tileset2_134
	.dw _g_tileset2_135
	.dw _g_tileset2_136
	.dw _g_tileset2_137
	.dw _g_tileset2_138
	.dw _g_tileset2_139
	.dw _g_tileset2_140
	.dw _g_tileset2_141
	.dw _g_tileset2_142
	.dw _g_tileset2_143
	.dw _g_tileset2_144
	.dw _g_tileset2_145
	.dw _g_tileset2_146
	.dw _g_tileset2_147
	.dw _g_tileset2_148
	.dw _g_tileset2_149
	.dw _g_tileset2_150
	.dw _g_tileset2_151
	.dw _g_tileset2_152
	.dw _g_tileset2_153
	.dw _g_tileset2_154
	.dw _g_tileset2_155
	.dw _g_tileset2_156
	.dw _g_tileset2_157
	.dw _g_tileset2_158
	.dw _g_tileset2_159
	.dw _g_tileset2_160
	.dw _g_tileset2_161
	.dw _g_tileset2_162
	.dw _g_tileset2_163
	.dw _g_tileset2_164
	.dw _g_tileset2_165
	.dw _g_tileset2_166
	.dw _g_tileset2_167
	.dw _g_tileset2_168
	.dw _g_tileset2_169
	.dw _g_tileset2_170
	.dw _g_tileset2_171
	.dw _g_tileset2_172
	.dw _g_tileset2_173
	.dw _g_tileset2_174
	.dw _g_tileset2_175
	.dw _g_tileset2_176
	.dw _g_tileset2_177
	.dw _g_tileset2_178
	.dw _g_tileset2_179
	.dw _g_tileset2_180
	.dw _g_tileset2_181
	.dw _g_tileset2_182
	.dw _g_tileset2_183
	.dw _g_tileset2_184
	.dw _g_tileset2_185
	.dw _g_tileset2_186
	.dw _g_tileset2_187
	.dw _g_tileset2_188
	.dw _g_tileset2_189
	.dw _g_tileset2_190
	.dw _g_tileset2_191
	.dw _g_tileset2_192
	.dw _g_tileset2_193
	.dw _g_tileset2_194
	.dw _g_tileset2_195
	.dw _g_tileset2_196
	.dw _g_tileset2_197
	.dw _g_tileset2_198
	.dw _g_tileset2_199
_g_tileset2_000:
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x03	; 3
_g_tileset2_001:
	.db #0x0d	; 13
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
_g_tileset2_002:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset2_003:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset2_004:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset2_005:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset2_006:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset2_007:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset2_008:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset2_009:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset2_010:
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0x0f	; 15
_g_tileset2_011:
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x0d	; 13
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x09	; 9
_g_tileset2_012:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_013:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
_g_tileset2_014:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset2_015:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0e	; 14
_g_tileset2_016:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset2_017:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset2_018:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset2_019:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset2_020:
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0b	; 11
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x0c	; 12
_g_tileset2_021:
	.db #0x0d	; 13
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x0d	; 13
_g_tileset2_022:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_023:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_024:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_025:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_026:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset2_027:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
_g_tileset2_028:
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_029:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0f	; 15
_g_tileset2_030:
	.db #0x08	; 8
	.db #0x0e	; 14
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0b	; 11
_g_tileset2_031:
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0x0d	; 13
	.db #0x0f	; 15
_g_tileset2_032:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
_g_tileset2_033:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_034:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_035:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_036:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0e	; 14
_g_tileset2_037:
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_038:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_039:
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0f	; 15
_g_tileset2_040:
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x0e	; 14
_g_tileset2_041:
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
_g_tileset2_042:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_043:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
_g_tileset2_044:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_045:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
_g_tileset2_046:
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x08	; 8
_g_tileset2_047:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_048:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_049:
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
_g_tileset2_050:
	.db #0x02	; 2
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x04	; 4
_g_tileset2_051:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_052:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_053:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
_g_tileset2_054:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
_g_tileset2_055:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
_g_tileset2_056:
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
_g_tileset2_057:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_058:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_059:
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
_g_tileset2_060:
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
_g_tileset2_061:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_062:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_063:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
_g_tileset2_064:
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
_g_tileset2_065:
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x02	; 2
_g_tileset2_066:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
_g_tileset2_067:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_068:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
_g_tileset2_069:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_070:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_071:
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x0c	; 12
_g_tileset2_072:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_073:
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
_g_tileset2_074:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
_g_tileset2_075:
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
_g_tileset2_076:
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
_g_tileset2_077:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0c	; 12
_g_tileset2_078:
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x0c	; 12
_g_tileset2_079:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x08	; 8
_g_tileset2_080:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x08	; 8
_g_tileset2_081:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
_g_tileset2_082:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_083:
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
_g_tileset2_084:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_085:
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
_g_tileset2_086:
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_087:
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_088:
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_089:
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
_g_tileset2_090:
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
_g_tileset2_091:
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
_g_tileset2_092:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_093:
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
_g_tileset2_094:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
_g_tileset2_095:
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x06	; 6
_g_tileset2_096:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
_g_tileset2_097:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_098:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_099:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_100:
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x08	; 8
_g_tileset2_101:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
_g_tileset2_102:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_103:
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_104:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_105:
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x00	; 0
_g_tileset2_106:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x06	; 6
_g_tileset2_107:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x08	; 8
_g_tileset2_108:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_109:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_110:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x02	; 2
_g_tileset2_111:
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
_g_tileset2_112:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_113:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_114:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_115:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_116:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
_g_tileset2_117:
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x07	; 7
_g_tileset2_118:
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_119:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_120:
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
_g_tileset2_121:
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
_g_tileset2_122:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_123:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_124:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_125:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_126:
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x0d	; 13
_g_tileset2_127:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
_g_tileset2_128:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_129:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_130:
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
_g_tileset2_131:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
_g_tileset2_132:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_133:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_134:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_135:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_136:
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_137:
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x08	; 8
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_138:
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
_g_tileset2_139:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_140:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
_g_tileset2_141:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x00	; 0
_g_tileset2_142:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_143:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
_g_tileset2_144:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_145:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
_g_tileset2_146:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_147:
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x0a	; 10
_g_tileset2_148:
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
_g_tileset2_149:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x0c	; 12
_g_tileset2_150:
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
_g_tileset2_151:
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
_g_tileset2_152:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_153:
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
_g_tileset2_154:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x04	; 4
_g_tileset2_155:
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x08	; 8
_g_tileset2_156:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_157:
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
_g_tileset2_158:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x06	; 6
_g_tileset2_159:
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_160:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
_g_tileset2_161:
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
_g_tileset2_162:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_163:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
_g_tileset2_164:
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x02	; 2
_g_tileset2_165:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
_g_tileset2_166:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_167:
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x03	; 3
_g_tileset2_168:
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
_g_tileset2_169:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x00	; 0
_g_tileset2_170:
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_171:
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_172:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_173:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_g_tileset2_174:
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
_g_tileset2_175:
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
_g_tileset2_176:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_177:
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
_g_tileset2_178:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_179:
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
_g_tileset2_180:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_181:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_182:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_183:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
_g_tileset2_184:
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x02	; 2
_g_tileset2_185:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
_g_tileset2_186:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_187:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x01	; 1
_g_tileset2_188:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x0b	; 11
	.db #0x00	; 0
_g_tileset2_189:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_190:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_191:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_192:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_193:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
_g_tileset2_194:
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0f	; 15
_g_tileset2_195:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
_g_tileset2_196:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset2_197:
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
_g_tileset2_198:
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
_g_tileset2_199:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
