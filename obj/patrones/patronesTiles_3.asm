;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (CYGWIN)
;--------------------------------------------------------
	.module patronesTiles_3
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_tileset3_199
	.globl _g_tileset3_198
	.globl _g_tileset3_197
	.globl _g_tileset3_196
	.globl _g_tileset3_195
	.globl _g_tileset3_194
	.globl _g_tileset3_193
	.globl _g_tileset3_192
	.globl _g_tileset3_191
	.globl _g_tileset3_190
	.globl _g_tileset3_189
	.globl _g_tileset3_188
	.globl _g_tileset3_187
	.globl _g_tileset3_186
	.globl _g_tileset3_185
	.globl _g_tileset3_184
	.globl _g_tileset3_183
	.globl _g_tileset3_182
	.globl _g_tileset3_181
	.globl _g_tileset3_180
	.globl _g_tileset3_179
	.globl _g_tileset3_178
	.globl _g_tileset3_177
	.globl _g_tileset3_176
	.globl _g_tileset3_175
	.globl _g_tileset3_174
	.globl _g_tileset3_173
	.globl _g_tileset3_172
	.globl _g_tileset3_171
	.globl _g_tileset3_170
	.globl _g_tileset3_169
	.globl _g_tileset3_168
	.globl _g_tileset3_167
	.globl _g_tileset3_166
	.globl _g_tileset3_165
	.globl _g_tileset3_164
	.globl _g_tileset3_163
	.globl _g_tileset3_162
	.globl _g_tileset3_161
	.globl _g_tileset3_160
	.globl _g_tileset3_159
	.globl _g_tileset3_158
	.globl _g_tileset3_157
	.globl _g_tileset3_156
	.globl _g_tileset3_155
	.globl _g_tileset3_154
	.globl _g_tileset3_153
	.globl _g_tileset3_152
	.globl _g_tileset3_151
	.globl _g_tileset3_150
	.globl _g_tileset3_149
	.globl _g_tileset3_148
	.globl _g_tileset3_147
	.globl _g_tileset3_146
	.globl _g_tileset3_145
	.globl _g_tileset3_144
	.globl _g_tileset3_143
	.globl _g_tileset3_142
	.globl _g_tileset3_141
	.globl _g_tileset3_140
	.globl _g_tileset3_139
	.globl _g_tileset3_138
	.globl _g_tileset3_137
	.globl _g_tileset3_136
	.globl _g_tileset3_135
	.globl _g_tileset3_134
	.globl _g_tileset3_133
	.globl _g_tileset3_132
	.globl _g_tileset3_131
	.globl _g_tileset3_130
	.globl _g_tileset3_129
	.globl _g_tileset3_128
	.globl _g_tileset3_127
	.globl _g_tileset3_126
	.globl _g_tileset3_125
	.globl _g_tileset3_124
	.globl _g_tileset3_123
	.globl _g_tileset3_122
	.globl _g_tileset3_121
	.globl _g_tileset3_120
	.globl _g_tileset3_119
	.globl _g_tileset3_118
	.globl _g_tileset3_117
	.globl _g_tileset3_116
	.globl _g_tileset3_115
	.globl _g_tileset3_114
	.globl _g_tileset3_113
	.globl _g_tileset3_112
	.globl _g_tileset3_111
	.globl _g_tileset3_110
	.globl _g_tileset3_109
	.globl _g_tileset3_108
	.globl _g_tileset3_107
	.globl _g_tileset3_106
	.globl _g_tileset3_105
	.globl _g_tileset3_104
	.globl _g_tileset3_103
	.globl _g_tileset3_102
	.globl _g_tileset3_101
	.globl _g_tileset3_100
	.globl _g_tileset3_099
	.globl _g_tileset3_098
	.globl _g_tileset3_097
	.globl _g_tileset3_096
	.globl _g_tileset3_095
	.globl _g_tileset3_094
	.globl _g_tileset3_093
	.globl _g_tileset3_092
	.globl _g_tileset3_091
	.globl _g_tileset3_090
	.globl _g_tileset3_089
	.globl _g_tileset3_088
	.globl _g_tileset3_087
	.globl _g_tileset3_086
	.globl _g_tileset3_085
	.globl _g_tileset3_084
	.globl _g_tileset3_083
	.globl _g_tileset3_082
	.globl _g_tileset3_081
	.globl _g_tileset3_080
	.globl _g_tileset3_079
	.globl _g_tileset3_078
	.globl _g_tileset3_077
	.globl _g_tileset3_076
	.globl _g_tileset3_075
	.globl _g_tileset3_074
	.globl _g_tileset3_073
	.globl _g_tileset3_072
	.globl _g_tileset3_071
	.globl _g_tileset3_070
	.globl _g_tileset3_069
	.globl _g_tileset3_068
	.globl _g_tileset3_067
	.globl _g_tileset3_066
	.globl _g_tileset3_065
	.globl _g_tileset3_064
	.globl _g_tileset3_063
	.globl _g_tileset3_062
	.globl _g_tileset3_061
	.globl _g_tileset3_060
	.globl _g_tileset3_059
	.globl _g_tileset3_058
	.globl _g_tileset3_057
	.globl _g_tileset3_056
	.globl _g_tileset3_055
	.globl _g_tileset3_054
	.globl _g_tileset3_053
	.globl _g_tileset3_052
	.globl _g_tileset3_051
	.globl _g_tileset3_050
	.globl _g_tileset3_049
	.globl _g_tileset3_048
	.globl _g_tileset3_047
	.globl _g_tileset3_046
	.globl _g_tileset3_045
	.globl _g_tileset3_044
	.globl _g_tileset3_043
	.globl _g_tileset3_042
	.globl _g_tileset3_041
	.globl _g_tileset3_040
	.globl _g_tileset3_039
	.globl _g_tileset3_038
	.globl _g_tileset3_037
	.globl _g_tileset3_036
	.globl _g_tileset3_035
	.globl _g_tileset3_034
	.globl _g_tileset3_033
	.globl _g_tileset3_032
	.globl _g_tileset3_031
	.globl _g_tileset3_030
	.globl _g_tileset3_029
	.globl _g_tileset3_028
	.globl _g_tileset3_027
	.globl _g_tileset3_026
	.globl _g_tileset3_025
	.globl _g_tileset3_024
	.globl _g_tileset3_023
	.globl _g_tileset3_022
	.globl _g_tileset3_021
	.globl _g_tileset3_020
	.globl _g_tileset3_019
	.globl _g_tileset3_018
	.globl _g_tileset3_017
	.globl _g_tileset3_016
	.globl _g_tileset3_015
	.globl _g_tileset3_014
	.globl _g_tileset3_013
	.globl _g_tileset3_012
	.globl _g_tileset3_011
	.globl _g_tileset3_010
	.globl _g_tileset3_009
	.globl _g_tileset3_008
	.globl _g_tileset3_007
	.globl _g_tileset3_006
	.globl _g_tileset3_005
	.globl _g_tileset3_004
	.globl _g_tileset3_003
	.globl _g_tileset3_002
	.globl _g_tileset3_001
	.globl _g_tileset3_000
	.globl _tileset3
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
_tileset3:
	.dw _g_tileset3_000
	.dw _g_tileset3_001
	.dw _g_tileset3_002
	.dw _g_tileset3_003
	.dw _g_tileset3_004
	.dw _g_tileset3_005
	.dw _g_tileset3_006
	.dw _g_tileset3_007
	.dw _g_tileset3_008
	.dw _g_tileset3_009
	.dw _g_tileset3_010
	.dw _g_tileset3_011
	.dw _g_tileset3_012
	.dw _g_tileset3_013
	.dw _g_tileset3_014
	.dw _g_tileset3_015
	.dw _g_tileset3_016
	.dw _g_tileset3_017
	.dw _g_tileset3_018
	.dw _g_tileset3_019
	.dw _g_tileset3_020
	.dw _g_tileset3_021
	.dw _g_tileset3_022
	.dw _g_tileset3_023
	.dw _g_tileset3_024
	.dw _g_tileset3_025
	.dw _g_tileset3_026
	.dw _g_tileset3_027
	.dw _g_tileset3_028
	.dw _g_tileset3_029
	.dw _g_tileset3_030
	.dw _g_tileset3_031
	.dw _g_tileset3_032
	.dw _g_tileset3_033
	.dw _g_tileset3_034
	.dw _g_tileset3_035
	.dw _g_tileset3_036
	.dw _g_tileset3_037
	.dw _g_tileset3_038
	.dw _g_tileset3_039
	.dw _g_tileset3_040
	.dw _g_tileset3_041
	.dw _g_tileset3_042
	.dw _g_tileset3_043
	.dw _g_tileset3_044
	.dw _g_tileset3_045
	.dw _g_tileset3_046
	.dw _g_tileset3_047
	.dw _g_tileset3_048
	.dw _g_tileset3_049
	.dw _g_tileset3_050
	.dw _g_tileset3_051
	.dw _g_tileset3_052
	.dw _g_tileset3_053
	.dw _g_tileset3_054
	.dw _g_tileset3_055
	.dw _g_tileset3_056
	.dw _g_tileset3_057
	.dw _g_tileset3_058
	.dw _g_tileset3_059
	.dw _g_tileset3_060
	.dw _g_tileset3_061
	.dw _g_tileset3_062
	.dw _g_tileset3_063
	.dw _g_tileset3_064
	.dw _g_tileset3_065
	.dw _g_tileset3_066
	.dw _g_tileset3_067
	.dw _g_tileset3_068
	.dw _g_tileset3_069
	.dw _g_tileset3_070
	.dw _g_tileset3_071
	.dw _g_tileset3_072
	.dw _g_tileset3_073
	.dw _g_tileset3_074
	.dw _g_tileset3_075
	.dw _g_tileset3_076
	.dw _g_tileset3_077
	.dw _g_tileset3_078
	.dw _g_tileset3_079
	.dw _g_tileset3_080
	.dw _g_tileset3_081
	.dw _g_tileset3_082
	.dw _g_tileset3_083
	.dw _g_tileset3_084
	.dw _g_tileset3_085
	.dw _g_tileset3_086
	.dw _g_tileset3_087
	.dw _g_tileset3_088
	.dw _g_tileset3_089
	.dw _g_tileset3_090
	.dw _g_tileset3_091
	.dw _g_tileset3_092
	.dw _g_tileset3_093
	.dw _g_tileset3_094
	.dw _g_tileset3_095
	.dw _g_tileset3_096
	.dw _g_tileset3_097
	.dw _g_tileset3_098
	.dw _g_tileset3_099
	.dw _g_tileset3_100
	.dw _g_tileset3_101
	.dw _g_tileset3_102
	.dw _g_tileset3_103
	.dw _g_tileset3_104
	.dw _g_tileset3_105
	.dw _g_tileset3_106
	.dw _g_tileset3_107
	.dw _g_tileset3_108
	.dw _g_tileset3_109
	.dw _g_tileset3_110
	.dw _g_tileset3_111
	.dw _g_tileset3_112
	.dw _g_tileset3_113
	.dw _g_tileset3_114
	.dw _g_tileset3_115
	.dw _g_tileset3_116
	.dw _g_tileset3_117
	.dw _g_tileset3_118
	.dw _g_tileset3_119
	.dw _g_tileset3_120
	.dw _g_tileset3_121
	.dw _g_tileset3_122
	.dw _g_tileset3_123
	.dw _g_tileset3_124
	.dw _g_tileset3_125
	.dw _g_tileset3_126
	.dw _g_tileset3_127
	.dw _g_tileset3_128
	.dw _g_tileset3_129
	.dw _g_tileset3_130
	.dw _g_tileset3_131
	.dw _g_tileset3_132
	.dw _g_tileset3_133
	.dw _g_tileset3_134
	.dw _g_tileset3_135
	.dw _g_tileset3_136
	.dw _g_tileset3_137
	.dw _g_tileset3_138
	.dw _g_tileset3_139
	.dw _g_tileset3_140
	.dw _g_tileset3_141
	.dw _g_tileset3_142
	.dw _g_tileset3_143
	.dw _g_tileset3_144
	.dw _g_tileset3_145
	.dw _g_tileset3_146
	.dw _g_tileset3_147
	.dw _g_tileset3_148
	.dw _g_tileset3_149
	.dw _g_tileset3_150
	.dw _g_tileset3_151
	.dw _g_tileset3_152
	.dw _g_tileset3_153
	.dw _g_tileset3_154
	.dw _g_tileset3_155
	.dw _g_tileset3_156
	.dw _g_tileset3_157
	.dw _g_tileset3_158
	.dw _g_tileset3_159
	.dw _g_tileset3_160
	.dw _g_tileset3_161
	.dw _g_tileset3_162
	.dw _g_tileset3_163
	.dw _g_tileset3_164
	.dw _g_tileset3_165
	.dw _g_tileset3_166
	.dw _g_tileset3_167
	.dw _g_tileset3_168
	.dw _g_tileset3_169
	.dw _g_tileset3_170
	.dw _g_tileset3_171
	.dw _g_tileset3_172
	.dw _g_tileset3_173
	.dw _g_tileset3_174
	.dw _g_tileset3_175
	.dw _g_tileset3_176
	.dw _g_tileset3_177
	.dw _g_tileset3_178
	.dw _g_tileset3_179
	.dw _g_tileset3_180
	.dw _g_tileset3_181
	.dw _g_tileset3_182
	.dw _g_tileset3_183
	.dw _g_tileset3_184
	.dw _g_tileset3_185
	.dw _g_tileset3_186
	.dw _g_tileset3_187
	.dw _g_tileset3_188
	.dw _g_tileset3_189
	.dw _g_tileset3_190
	.dw _g_tileset3_191
	.dw _g_tileset3_192
	.dw _g_tileset3_193
	.dw _g_tileset3_194
	.dw _g_tileset3_195
	.dw _g_tileset3_196
	.dw _g_tileset3_197
	.dw _g_tileset3_198
	.dw _g_tileset3_199
_g_tileset3_000:
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_001:
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_002:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
_g_tileset3_003:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x02	; 2
_g_tileset3_004:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
_g_tileset3_005:
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
_g_tileset3_006:
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
_g_tileset3_007:
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0b	; 11
_g_tileset3_008:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_009:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_010:
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_011:
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_012:
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
_g_tileset3_013:
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x02	; 2
_g_tileset3_014:
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
_g_tileset3_015:
	.db #0x0d	; 13
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0d	; 13
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0a	; 10
_g_tileset3_016:
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0a	; 10
_g_tileset3_017:
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0b	; 11
_g_tileset3_018:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_019:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_020:
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_021:
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_022:
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
_g_tileset3_023:
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x02	; 2
_g_tileset3_024:
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
_g_tileset3_025:
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x0d	; 13
	.db #0x0d	; 13
_g_tileset3_026:
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x09	; 9
_g_tileset3_027:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x0b	; 11
	.db #0x0b	; 11
_g_tileset3_028:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_029:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_030:
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_031:
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_032:
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset3_033:
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset3_034:
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset3_035:
	.db #0x0d	; 13
	.db #0x0d	; 13
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
_g_tileset3_036:
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x08	; 8
_g_tileset3_037:
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
_g_tileset3_038:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_039:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_040:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x08	; 8
_g_tileset3_041:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
_g_tileset3_042:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x04	; 4
_g_tileset3_043:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
_g_tileset3_044:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x0e	; 14
_g_tileset3_045:
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0d	; 13
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0d	; 13
	.db #0x05	; 5
_g_tileset3_046:
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x05	; 5
_g_tileset3_047:
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x05	; 5
	.db #0x05	; 5
_g_tileset3_048:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_049:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_050:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
_g_tileset3_051:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
_g_tileset3_052:
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
_g_tileset3_053:
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
_g_tileset3_054:
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x0c	; 12
_g_tileset3_055:
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0d	; 13
	.db #0x05	; 5
	.db #0x0d	; 13
	.db #0x05	; 5
_g_tileset3_056:
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
_g_tileset3_057:
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
_g_tileset3_058:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_059:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_060:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_061:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_062:
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x0a	; 10
_g_tileset3_063:
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x08	; 8
_g_tileset3_064:
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
_g_tileset3_065:
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x01	; 1
_g_tileset3_066:
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x03	; 3
_g_tileset3_067:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_068:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_069:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_070:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0f	; 15
_g_tileset3_071:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_g_tileset3_072:
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x0a	; 10
_g_tileset3_073:
	.db #0x05	; 5
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x05	; 5
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x08	; 8
_g_tileset3_074:
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0x00	; 0
_g_tileset3_075:
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x0e	; 14
_g_tileset3_076:
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x0e	; 14
_g_tileset3_077:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_078:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_079:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_080:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x0d	; 13
_g_tileset3_081:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x0d	; 13
_g_tileset3_082:
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x04	; 4
_g_tileset3_083:
	.db #0x05	; 5
	.db #0x08	; 8
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
_g_tileset3_084:
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x01	; 1
_g_tileset3_085:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_086:
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
_g_tileset3_087:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_088:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_089:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_090:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x0d	; 13
	.db #0x0d	; 13
_g_tileset3_091:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x0d	; 13
	.db #0x0d	; 13
_g_tileset3_092:
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x03	; 3
_g_tileset3_093:
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
_g_tileset3_094:
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x0e	; 14
_g_tileset3_095:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_096:
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x0c	; 12
_g_tileset3_097:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_098:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_099:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_100:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x0d	; 13
_g_tileset3_101:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x0d	; 13
_g_tileset3_102:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_103:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_104:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_105:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_106:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_107:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_108:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_109:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_110:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x0d	; 13
	.db #0x0d	; 13
_g_tileset3_111:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x05	; 5
	.db #0x0d	; 13
_g_tileset3_112:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0c	; 12
_g_tileset3_113:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_114:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_115:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_116:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_117:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_118:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_119:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_120:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_121:
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x07	; 7
_g_tileset3_122:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_123:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x0c	; 12
_g_tileset3_124:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0d	; 13
	.db #0x09	; 9
_g_tileset3_125:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0f	; 15
_g_tileset3_126:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x02	; 2
_g_tileset3_127:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_128:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x00	; 0
_g_tileset3_129:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_130:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_131:
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x0c	; 12
_g_tileset3_132:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_133:
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x07	; 7
	.db #0x0c	; 12
_g_tileset3_134:
	.db #0x0d	; 13
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0e	; 14
_g_tileset3_135:
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_136:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x08	; 8
_g_tileset3_137:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_138:
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_139:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_140:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x08	; 8
_g_tileset3_141:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
_g_tileset3_142:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x08	; 8
_g_tileset3_143:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_144:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
_g_tileset3_145:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_146:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_147:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_148:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_149:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_150:
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_g_tileset3_151:
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x03	; 3
_g_tileset3_152:
	.db #0x0b	; 11
	.db #0x08	; 8
	.db #0x0e	; 14
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
_g_tileset3_153:
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x07	; 7
_g_tileset3_154:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x05	; 5
	.db #0x0e	; 14
	.db #0x08	; 8
_g_tileset3_155:
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x08	; 8
	.db #0x0b	; 11
	.db #0x08	; 8
_g_tileset3_156:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_157:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_158:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_159:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_160:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x06	; 6
_g_tileset3_161:
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x0e	; 14
_g_tileset3_162:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
_g_tileset3_163:
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
_g_tileset3_164:
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_165:
	.db #0x0e	; 14
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x02	; 2
_g_tileset3_166:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_167:
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
_g_tileset3_168:
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
_g_tileset3_169:
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
_g_tileset3_170:
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
_g_tileset3_171:
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x0e	; 14
_g_tileset3_172:
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
_g_tileset3_173:
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
_g_tileset3_174:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_175:
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
_g_tileset3_176:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_177:
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
_g_tileset3_178:
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
_g_tileset3_179:
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x08	; 8
_g_tileset3_180:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
_g_tileset3_181:
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
_g_tileset3_182:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
_g_tileset3_183:
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
_g_tileset3_184:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_185:
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x04	; 4
_g_tileset3_186:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_187:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_188:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_189:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_190:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x02	; 2
_g_tileset3_191:
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x08	; 8
_g_tileset3_192:
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
_g_tileset3_193:
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x06	; 6
_g_tileset3_194:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_195:
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x00	; 0
_g_tileset3_196:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_197:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_198:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_g_tileset3_199:
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
