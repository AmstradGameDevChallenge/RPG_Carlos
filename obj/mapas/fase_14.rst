                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (CYGWIN)
                              4 ;--------------------------------------------------------
                              5 	.module fase_14
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_mapa14
                             12 ;--------------------------------------------------------
                             13 ; special function registers
                             14 ;--------------------------------------------------------
                             15 ;--------------------------------------------------------
                             16 ; ram data
                             17 ;--------------------------------------------------------
                             18 	.area _DATA
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _INITIALIZED
                             23 ;--------------------------------------------------------
                             24 ; absolute external ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DABS (ABS)
                             27 ;--------------------------------------------------------
                             28 ; global & static initialisations
                             29 ;--------------------------------------------------------
                             30 	.area _HOME
                             31 	.area _GSINIT
                             32 	.area _GSFINAL
                             33 	.area _GSINIT
                             34 ;--------------------------------------------------------
                             35 ; Home
                             36 ;--------------------------------------------------------
                             37 	.area _HOME
                             38 	.area _HOME
                             39 ;--------------------------------------------------------
                             40 ; code
                             41 ;--------------------------------------------------------
                             42 	.area _CODE
                             43 	.area _CODE
   1EA7                      44 _g_mapa14:
   1EA7 06                   45 	.db #0x06	; 6
   1EA8 06                   46 	.db #0x06	; 6
   1EA9 02                   47 	.db #0x02	; 2
   1EAA 03                   48 	.db #0x03	; 3
   1EAB 06                   49 	.db #0x06	; 6
   1EAC 07                   50 	.db #0x07	; 7
   1EAD 02                   51 	.db #0x02	; 2
   1EAE 03                   52 	.db #0x03	; 3
   1EAF 02                   53 	.db #0x02	; 2
   1EB0 03                   54 	.db #0x03	; 3
   1EB1 02                   55 	.db #0x02	; 2
   1EB2 02                   56 	.db #0x02	; 2
   1EB3 03                   57 	.db #0x03	; 3
   1EB4 04                   58 	.db #0x04	; 4
   1EB5 03                   59 	.db #0x03	; 3
   1EB6 04                   60 	.db #0x04	; 4
   1EB7 08                   61 	.db #0x08	; 8
   1EB8 09                   62 	.db #0x09	; 9
   1EB9 10                   63 	.db #0x10	; 16
   1EBA 10                   64 	.db #0x10	; 16
   1EBB 09                   65 	.db #0x09	; 9
   1EBC 09                   66 	.db #0x09	; 9
   1EBD 10                   67 	.db #0x10	; 16
   1EBE 11                   68 	.db #0x11	; 17
   1EBF 0C                   69 	.db #0x0c	; 12
   1EC0 0D                   70 	.db #0x0d	; 13
   1EC1 09                   71 	.db #0x09	; 9
   1EC2 09                   72 	.db #0x09	; 9
   1EC3 09                   73 	.db #0x09	; 9
   1EC4 09                   74 	.db #0x09	; 9
   1EC5 09                   75 	.db #0x09	; 9
   1EC6 09                   76 	.db #0x09	; 9
   1EC7 09                   77 	.db #0x09	; 9
   1EC8 09                   78 	.db #0x09	; 9
   1EC9 12                   79 	.db #0x12	; 18
   1ECA 13                   80 	.db #0x13	; 19
   1ECB 1A                   81 	.db #0x1a	; 26
   1ECC 1A                   82 	.db #0x1a	; 26
   1ECD 09                   83 	.db #0x09	; 9
   1ECE 09                   84 	.db #0x09	; 9
   1ECF 1A                   85 	.db #0x1a	; 26
   1ED0 1B                   86 	.db #0x1b	; 27
   1ED1 C7                   87 	.db #0xc7	; 199
   1ED2 1C                   88 	.db #0x1c	; 28
   1ED3 1D                   89 	.db #0x1d	; 29
   1ED4 09                   90 	.db #0x09	; 9
   1ED5 09                   91 	.db #0x09	; 9
   1ED6 11                   92 	.db #0x11	; 17
   1ED7 09                   93 	.db #0x09	; 9
   1ED8 09                   94 	.db #0x09	; 9
   1ED9 09                   95 	.db #0x09	; 9
   1EDA 09                   96 	.db #0x09	; 9
   1EDB 09                   97 	.db #0x09	; 9
   1EDC 09                   98 	.db #0x09	; 9
   1EDD 06                   99 	.db #0x06	; 6
   1EDE 24                  100 	.db #0x24	; 36
   1EDF 12                  101 	.db #0x12	; 18
   1EE0 13                  102 	.db #0x13	; 19
   1EE1 24                  103 	.db #0x24	; 36
   1EE2 25                  104 	.db #0x25	; 37
   1EE3 C7                  105 	.db #0xc7	; 199
   1EE4 C7                  106 	.db #0xc7	; 199
   1EE5 1D                  107 	.db #0x1d	; 29
   1EE6 09                  108 	.db #0x09	; 9
   1EE7 09                  109 	.db #0x09	; 9
   1EE8 1B                  110 	.db #0x1b	; 27
   1EE9 28                  111 	.db #0x28	; 40
   1EEA 29                  112 	.db #0x29	; 41
   1EEB 29                  113 	.db #0x29	; 41
   1EEC 0F                  114 	.db #0x0f	; 15
   1EED 1D                  115 	.db #0x1d	; 29
   1EEE 09                  116 	.db #0x09	; 9
   1EEF 10                  117 	.db #0x10	; 16
   1EF0 2E                  118 	.db #0x2e	; 46
   1EF1 1C                  119 	.db #0x1c	; 28
   1EF2 1D                  120 	.db #0x1d	; 29
   1EF3 2E                  121 	.db #0x2e	; 46
   1EF4 C7                  122 	.db #0xc7	; 199
   1EF5 C7                  123 	.db #0xc7	; 199
   1EF6 C7                  124 	.db #0xc7	; 199
   1EF7 27                  125 	.db #0x27	; 39
   1EF8 09                  126 	.db #0x09	; 9
   1EF9 11                  127 	.db #0x11	; 17
   1EFA 25                  128 	.db #0x25	; 37
   1EFB 32                  129 	.db #0x32	; 50	'2'
   1EFC C7                  130 	.db #0xc7	; 199
   1EFD 33                  131 	.db #0x33	; 51	'3'
   1EFE 29                  132 	.db #0x29	; 41
   1EFF 27                  133 	.db #0x27	; 39
   1F00 09                  134 	.db #0x09	; 9
   1F01 1A                  135 	.db #0x1a	; 26
   1F02 38                  136 	.db #0x38	; 56	'8'
   1F03 C7                  137 	.db #0xc7	; 199
   1F04 C7                  138 	.db #0xc7	; 199
   1F05 38                  139 	.db #0x38	; 56	'8'
   1F06 C7                  140 	.db #0xc7	; 199
   1F07 C7                  141 	.db #0xc7	; 199
   1F08 C7                  142 	.db #0xc7	; 199
   1F09 31                  143 	.db #0x31	; 49	'1'
   1F0A 09                  144 	.db #0x09	; 9
   1F0B 1B                  145 	.db #0x1b	; 27
   1F0C C7                  146 	.db #0xc7	; 199
   1F0D 3C                  147 	.db #0x3c	; 60
   1F0E C7                  148 	.db #0xc7	; 199
   1F0F C7                  149 	.db #0xc7	; 199
   1F10 33                  150 	.db #0x33	; 51	'3'
   1F11 31                  151 	.db #0x31	; 49	'1'
   1F12 09                  152 	.db #0x09	; 9
   1F13 24                  153 	.db #0x24	; 36
   1F14 C7                  154 	.db #0xc7	; 199
   1F15 C7                  155 	.db #0xc7	; 199
   1F16 C7                  156 	.db #0xc7	; 199
   1F17 C7                  157 	.db #0xc7	; 199
   1F18 C7                  158 	.db #0xc7	; 199
   1F19 C7                  159 	.db #0xc7	; 199
   1F1A C7                  160 	.db #0xc7	; 199
   1F1B 1C                  161 	.db #0x1c	; 28
   1F1C 1D                  162 	.db #0x1d	; 29
   1F1D C7                  163 	.db #0xc7	; 199
   1F1E C7                  164 	.db #0xc7	; 199
   1F1F C7                  165 	.db #0xc7	; 199
   1F20 C7                  166 	.db #0xc7	; 199
   1F21 C7                  167 	.db #0xc7	; 199
   1F22 C7                  168 	.db #0xc7	; 199
   1F23 3B                  169 	.db #0x3b	; 59
   1F24 09                  170 	.db #0x09	; 9
   1F25 2E                  171 	.db #0x2e	; 46
   1F26 C7                  172 	.db #0xc7	; 199
   1F27 C7                  173 	.db #0xc7	; 199
   1F28 C7                  174 	.db #0xc7	; 199
   1F29 C7                  175 	.db #0xc7	; 199
   1F2A C7                  176 	.db #0xc7	; 199
   1F2B C7                  177 	.db #0xc7	; 199
   1F2C C7                  178 	.db #0xc7	; 199
   1F2D C7                  179 	.db #0xc7	; 199
   1F2E C7                  180 	.db #0xc7	; 199
   1F2F C7                  181 	.db #0xc7	; 199
   1F30 C7                  182 	.db #0xc7	; 199
   1F31 C7                  183 	.db #0xc7	; 199
   1F32 C7                  184 	.db #0xc7	; 199
   1F33 C7                  185 	.db #0xc7	; 199
   1F34 C7                  186 	.db #0xc7	; 199
   1F35 C7                  187 	.db #0xc7	; 199
   1F36 1D                  188 	.db #0x1d	; 29
   1F37 38                  189 	.db #0x38	; 56	'8'
   1F38 C7                  190 	.db #0xc7	; 199
   1F39 C7                  191 	.db #0xc7	; 199
   1F3A C7                  192 	.db #0xc7	; 199
   1F3B C7                  193 	.db #0xc7	; 199
   1F3C C7                  194 	.db #0xc7	; 199
   1F3D C7                  195 	.db #0xc7	; 199
   1F3E C7                  196 	.db #0xc7	; 199
   1F3F C7                  197 	.db #0xc7	; 199
   1F40 C7                  198 	.db #0xc7	; 199
   1F41 C7                  199 	.db #0xc7	; 199
   1F42 C7                  200 	.db #0xc7	; 199
   1F43 C7                  201 	.db #0xc7	; 199
   1F44 C7                  202 	.db #0xc7	; 199
   1F45 C7                  203 	.db #0xc7	; 199
   1F46 C7                  204 	.db #0xc7	; 199
   1F47 C7                  205 	.db #0xc7	; 199
   1F48 27                  206 	.db #0x27	; 39
   1F49 C7                  207 	.db #0xc7	; 199
   1F4A C7                  208 	.db #0xc7	; 199
   1F4B C7                  209 	.db #0xc7	; 199
   1F4C C7                  210 	.db #0xc7	; 199
   1F4D C7                  211 	.db #0xc7	; 199
   1F4E C7                  212 	.db #0xc7	; 199
   1F4F C7                  213 	.db #0xc7	; 199
   1F50 C7                  214 	.db #0xc7	; 199
   1F51 C7                  215 	.db #0xc7	; 199
   1F52 C7                  216 	.db #0xc7	; 199
   1F53 C7                  217 	.db #0xc7	; 199
   1F54 C7                  218 	.db #0xc7	; 199
   1F55 C7                  219 	.db #0xc7	; 199
   1F56 C7                  220 	.db #0xc7	; 199
   1F57 C7                  221 	.db #0xc7	; 199
   1F58 C7                  222 	.db #0xc7	; 199
   1F59 C7                  223 	.db #0xc7	; 199
   1F5A 31                  224 	.db #0x31	; 49	'1'
   1F5B C7                  225 	.db #0xc7	; 199
   1F5C C7                  226 	.db #0xc7	; 199
   1F5D C7                  227 	.db #0xc7	; 199
   1F5E C7                  228 	.db #0xc7	; 199
   1F5F C7                  229 	.db #0xc7	; 199
   1F60 C7                  230 	.db #0xc7	; 199
   1F61 C7                  231 	.db #0xc7	; 199
   1F62 C7                  232 	.db #0xc7	; 199
   1F63 C7                  233 	.db #0xc7	; 199
   1F64 C7                  234 	.db #0xc7	; 199
   1F65 C7                  235 	.db #0xc7	; 199
   1F66 C7                  236 	.db #0xc7	; 199
   1F67 C7                  237 	.db #0xc7	; 199
   1F68 C7                  238 	.db #0xc7	; 199
   1F69 C7                  239 	.db #0xc7	; 199
   1F6A C7                  240 	.db #0xc7	; 199
   1F6B C7                  241 	.db #0xc7	; 199
   1F6C 3B                  242 	.db #0x3b	; 59
   1F6D C7                  243 	.db #0xc7	; 199
   1F6E C7                  244 	.db #0xc7	; 199
   1F6F C7                  245 	.db #0xc7	; 199
   1F70 C7                  246 	.db #0xc7	; 199
   1F71 C7                  247 	.db #0xc7	; 199
   1F72 C7                  248 	.db #0xc7	; 199
   1F73 C7                  249 	.db #0xc7	; 199
   1F74 C7                  250 	.db #0xc7	; 199
   1F75 C7                  251 	.db #0xc7	; 199
   1F76 C7                  252 	.db #0xc7	; 199
   1F77 C7                  253 	.db #0xc7	; 199
   1F78 C7                  254 	.db #0xc7	; 199
   1F79 C7                  255 	.db #0xc7	; 199
   1F7A C7                  256 	.db #0xc7	; 199
   1F7B C7                  257 	.db #0xc7	; 199
   1F7C C7                  258 	.db #0xc7	; 199
   1F7D C7                  259 	.db #0xc7	; 199
   1F7E C7                  260 	.db #0xc7	; 199
   1F7F C7                  261 	.db #0xc7	; 199
   1F80 C7                  262 	.db #0xc7	; 199
   1F81 C7                  263 	.db #0xc7	; 199
   1F82 C7                  264 	.db #0xc7	; 199
   1F83 46                  265 	.db #0x46	; 70	'F'
   1F84 C7                  266 	.db #0xc7	; 199
   1F85 C7                  267 	.db #0xc7	; 199
   1F86 C7                  268 	.db #0xc7	; 199
   1F87 C7                  269 	.db #0xc7	; 199
   1F88 C7                  270 	.db #0xc7	; 199
   1F89 C7                  271 	.db #0xc7	; 199
   1F8A C7                  272 	.db #0xc7	; 199
   1F8B C7                  273 	.db #0xc7	; 199
   1F8C C7                  274 	.db #0xc7	; 199
   1F8D C7                  275 	.db #0xc7	; 199
   1F8E C7                  276 	.db #0xc7	; 199
   1F8F C7                  277 	.db #0xc7	; 199
   1F90 C7                  278 	.db #0xc7	; 199
   1F91 C7                  279 	.db #0xc7	; 199
   1F92 C7                  280 	.db #0xc7	; 199
   1F93 C7                  281 	.db #0xc7	; 199
   1F94 C7                  282 	.db #0xc7	; 199
   1F95 C7                  283 	.db #0xc7	; 199
   1F96 C7                  284 	.db #0xc7	; 199
   1F97 C7                  285 	.db #0xc7	; 199
   1F98 C7                  286 	.db #0xc7	; 199
   1F99 C7                  287 	.db #0xc7	; 199
   1F9A C7                  288 	.db #0xc7	; 199
   1F9B C7                  289 	.db #0xc7	; 199
   1F9C C7                  290 	.db #0xc7	; 199
   1F9D C7                  291 	.db #0xc7	; 199
   1F9E C7                  292 	.db #0xc7	; 199
   1F9F C7                  293 	.db #0xc7	; 199
   1FA0 C7                  294 	.db #0xc7	; 199
   1FA1 C7                  295 	.db #0xc7	; 199
   1FA2 C7                  296 	.db #0xc7	; 199
   1FA3 C7                  297 	.db #0xc7	; 199
   1FA4 C7                  298 	.db #0xc7	; 199
   1FA5 C7                  299 	.db #0xc7	; 199
   1FA6 C7                  300 	.db #0xc7	; 199
   1FA7 C7                  301 	.db #0xc7	; 199
   1FA8 C7                  302 	.db #0xc7	; 199
   1FA9 C7                  303 	.db #0xc7	; 199
   1FAA C7                  304 	.db #0xc7	; 199
   1FAB C7                  305 	.db #0xc7	; 199
   1FAC C7                  306 	.db #0xc7	; 199
   1FAD C7                  307 	.db #0xc7	; 199
   1FAE C7                  308 	.db #0xc7	; 199
   1FAF C7                  309 	.db #0xc7	; 199
   1FB0 C7                  310 	.db #0xc7	; 199
   1FB1 C7                  311 	.db #0xc7	; 199
   1FB2 C7                  312 	.db #0xc7	; 199
   1FB3 C7                  313 	.db #0xc7	; 199
   1FB4 C7                  314 	.db #0xc7	; 199
   1FB5 C7                  315 	.db #0xc7	; 199
   1FB6 C7                  316 	.db #0xc7	; 199
   1FB7 C7                  317 	.db #0xc7	; 199
   1FB8 C7                  318 	.db #0xc7	; 199
   1FB9 C7                  319 	.db #0xc7	; 199
   1FBA C7                  320 	.db #0xc7	; 199
   1FBB C7                  321 	.db #0xc7	; 199
   1FBC C7                  322 	.db #0xc7	; 199
   1FBD C7                  323 	.db #0xc7	; 199
   1FBE C7                  324 	.db #0xc7	; 199
   1FBF C7                  325 	.db #0xc7	; 199
   1FC0 C7                  326 	.db #0xc7	; 199
   1FC1 C7                  327 	.db #0xc7	; 199
   1FC2 C7                  328 	.db #0xc7	; 199
   1FC3 C7                  329 	.db #0xc7	; 199
   1FC4 C7                  330 	.db #0xc7	; 199
   1FC5 C7                  331 	.db #0xc7	; 199
   1FC6 C7                  332 	.db #0xc7	; 199
   1FC7 C7                  333 	.db #0xc7	; 199
   1FC8 C7                  334 	.db #0xc7	; 199
   1FC9 C7                  335 	.db #0xc7	; 199
   1FCA C7                  336 	.db #0xc7	; 199
   1FCB C7                  337 	.db #0xc7	; 199
   1FCC C7                  338 	.db #0xc7	; 199
   1FCD C7                  339 	.db #0xc7	; 199
   1FCE C7                  340 	.db #0xc7	; 199
   1FCF C7                  341 	.db #0xc7	; 199
   1FD0 C7                  342 	.db #0xc7	; 199
   1FD1 C7                  343 	.db #0xc7	; 199
   1FD2 C7                  344 	.db #0xc7	; 199
   1FD3 C7                  345 	.db #0xc7	; 199
   1FD4 C7                  346 	.db #0xc7	; 199
   1FD5 C7                  347 	.db #0xc7	; 199
   1FD6 C7                  348 	.db #0xc7	; 199
   1FD7 C7                  349 	.db #0xc7	; 199
   1FD8 C7                  350 	.db #0xc7	; 199
   1FD9 C7                  351 	.db #0xc7	; 199
   1FDA C7                  352 	.db #0xc7	; 199
   1FDB C7                  353 	.db #0xc7	; 199
   1FDC C7                  354 	.db #0xc7	; 199
   1FDD C7                  355 	.db #0xc7	; 199
   1FDE C7                  356 	.db #0xc7	; 199
   1FDF C7                  357 	.db #0xc7	; 199
   1FE0 C7                  358 	.db #0xc7	; 199
   1FE1 C7                  359 	.db #0xc7	; 199
   1FE2 C7                  360 	.db #0xc7	; 199
   1FE3 C7                  361 	.db #0xc7	; 199
   1FE4 C7                  362 	.db #0xc7	; 199
   1FE5 C7                  363 	.db #0xc7	; 199
   1FE6 C7                  364 	.db #0xc7	; 199
   1FE7 C7                  365 	.db #0xc7	; 199
   1FE8 C7                  366 	.db #0xc7	; 199
   1FE9 C7                  367 	.db #0xc7	; 199
   1FEA C7                  368 	.db #0xc7	; 199
   1FEB C7                  369 	.db #0xc7	; 199
   1FEC C7                  370 	.db #0xc7	; 199
   1FED C7                  371 	.db #0xc7	; 199
   1FEE C7                  372 	.db #0xc7	; 199
   1FEF C7                  373 	.db #0xc7	; 199
   1FF0 C7                  374 	.db #0xc7	; 199
   1FF1 C7                  375 	.db #0xc7	; 199
   1FF2 C7                  376 	.db #0xc7	; 199
   1FF3 C7                  377 	.db #0xc7	; 199
   1FF4 C7                  378 	.db #0xc7	; 199
   1FF5 C7                  379 	.db #0xc7	; 199
   1FF6 C7                  380 	.db #0xc7	; 199
   1FF7 C7                  381 	.db #0xc7	; 199
   1FF8 C7                  382 	.db #0xc7	; 199
   1FF9 C7                  383 	.db #0xc7	; 199
   1FFA C7                  384 	.db #0xc7	; 199
   1FFB C7                  385 	.db #0xc7	; 199
   1FFC C7                  386 	.db #0xc7	; 199
   1FFD C7                  387 	.db #0xc7	; 199
   1FFE C7                  388 	.db #0xc7	; 199
   1FFF C7                  389 	.db #0xc7	; 199
   2000 C7                  390 	.db #0xc7	; 199
   2001 C7                  391 	.db #0xc7	; 199
   2002 C7                  392 	.db #0xc7	; 199
   2003 C7                  393 	.db #0xc7	; 199
   2004 C7                  394 	.db #0xc7	; 199
   2005 C7                  395 	.db #0xc7	; 199
   2006 C7                  396 	.db #0xc7	; 199
   2007 C7                  397 	.db #0xc7	; 199
   2008 C7                  398 	.db #0xc7	; 199
   2009 C7                  399 	.db #0xc7	; 199
   200A C7                  400 	.db #0xc7	; 199
   200B C7                  401 	.db #0xc7	; 199
   200C C7                  402 	.db #0xc7	; 199
   200D C7                  403 	.db #0xc7	; 199
   200E C7                  404 	.db #0xc7	; 199
   200F C7                  405 	.db #0xc7	; 199
   2010 C7                  406 	.db #0xc7	; 199
   2011 C7                  407 	.db #0xc7	; 199
   2012 C7                  408 	.db #0xc7	; 199
   2013 C7                  409 	.db #0xc7	; 199
   2014 C7                  410 	.db #0xc7	; 199
   2015 C7                  411 	.db #0xc7	; 199
   2016 C7                  412 	.db #0xc7	; 199
   2017 C7                  413 	.db #0xc7	; 199
   2018 C7                  414 	.db #0xc7	; 199
   2019 C7                  415 	.db #0xc7	; 199
   201A C7                  416 	.db #0xc7	; 199
   201B C7                  417 	.db #0xc7	; 199
   201C C7                  418 	.db #0xc7	; 199
   201D C7                  419 	.db #0xc7	; 199
   201E C7                  420 	.db #0xc7	; 199
   201F C7                  421 	.db #0xc7	; 199
   2020 C7                  422 	.db #0xc7	; 199
   2021 C7                  423 	.db #0xc7	; 199
   2022 C7                  424 	.db #0xc7	; 199
   2023 C7                  425 	.db #0xc7	; 199
   2024 C7                  426 	.db #0xc7	; 199
   2025 C7                  427 	.db #0xc7	; 199
   2026 C7                  428 	.db #0xc7	; 199
   2027 C7                  429 	.db #0xc7	; 199
   2028 C7                  430 	.db #0xc7	; 199
   2029 C7                  431 	.db #0xc7	; 199
   202A C7                  432 	.db #0xc7	; 199
   202B C7                  433 	.db #0xc7	; 199
   202C C7                  434 	.db #0xc7	; 199
   202D C7                  435 	.db #0xc7	; 199
   202E C7                  436 	.db #0xc7	; 199
   202F C7                  437 	.db #0xc7	; 199
   2030 C7                  438 	.db #0xc7	; 199
   2031 C7                  439 	.db #0xc7	; 199
   2032 C7                  440 	.db #0xc7	; 199
   2033 C7                  441 	.db #0xc7	; 199
   2034 C7                  442 	.db #0xc7	; 199
   2035 C7                  443 	.db #0xc7	; 199
   2036 C7                  444 	.db #0xc7	; 199
   2037 C7                  445 	.db #0xc7	; 199
   2038 C7                  446 	.db #0xc7	; 199
   2039 C7                  447 	.db #0xc7	; 199
   203A C7                  448 	.db #0xc7	; 199
   203B C7                  449 	.db #0xc7	; 199
   203C C7                  450 	.db #0xc7	; 199
   203D C7                  451 	.db #0xc7	; 199
   203E C7                  452 	.db #0xc7	; 199
   203F C7                  453 	.db #0xc7	; 199
   2040 C7                  454 	.db #0xc7	; 199
   2041 C7                  455 	.db #0xc7	; 199
   2042 C7                  456 	.db #0xc7	; 199
   2043 C7                  457 	.db #0xc7	; 199
   2044 C7                  458 	.db #0xc7	; 199
   2045 C7                  459 	.db #0xc7	; 199
   2046 C7                  460 	.db #0xc7	; 199
   2047 C7                  461 	.db #0xc7	; 199
   2048 C7                  462 	.db #0xc7	; 199
   2049 C7                  463 	.db #0xc7	; 199
   204A C7                  464 	.db #0xc7	; 199
   204B C7                  465 	.db #0xc7	; 199
   204C C7                  466 	.db #0xc7	; 199
   204D C7                  467 	.db #0xc7	; 199
   204E C7                  468 	.db #0xc7	; 199
   204F C7                  469 	.db #0xc7	; 199
   2050 C7                  470 	.db #0xc7	; 199
   2051 C7                  471 	.db #0xc7	; 199
   2052 C7                  472 	.db #0xc7	; 199
   2053 C7                  473 	.db #0xc7	; 199
   2054 C7                  474 	.db #0xc7	; 199
   2055 C7                  475 	.db #0xc7	; 199
   2056 C7                  476 	.db #0xc7	; 199
   2057 00                  477 	.db #0x00	; 0
   2058 01                  478 	.db #0x01	; 1
   2059 00                  479 	.db #0x00	; 0
   205A 01                  480 	.db #0x01	; 1
   205B 00                  481 	.db #0x00	; 0
   205C 01                  482 	.db #0x01	; 1
   205D 00                  483 	.db #0x00	; 0
   205E 01                  484 	.db #0x01	; 1
   205F 00                  485 	.db #0x00	; 0
   2060 01                  486 	.db #0x01	; 1
   2061 00                  487 	.db #0x00	; 0
   2062 01                  488 	.db #0x01	; 1
   2063 00                  489 	.db #0x00	; 0
   2064 01                  490 	.db #0x01	; 1
   2065 00                  491 	.db #0x00	; 0
   2066 01                  492 	.db #0x01	; 1
   2067 00                  493 	.db #0x00	; 0
   2068 01                  494 	.db #0x01	; 1
   2069 0A                  495 	.db #0x0a	; 10
   206A 0B                  496 	.db #0x0b	; 11
   206B 0A                  497 	.db #0x0a	; 10
   206C 0B                  498 	.db #0x0b	; 11
   206D 0A                  499 	.db #0x0a	; 10
   206E 0B                  500 	.db #0x0b	; 11
   206F 0A                  501 	.db #0x0a	; 10
   2070 0B                  502 	.db #0x0b	; 11
   2071 0A                  503 	.db #0x0a	; 10
   2072 0B                  504 	.db #0x0b	; 11
   2073 0A                  505 	.db #0x0a	; 10
   2074 0B                  506 	.db #0x0b	; 11
   2075 0A                  507 	.db #0x0a	; 10
   2076 0B                  508 	.db #0x0b	; 11
   2077 0A                  509 	.db #0x0a	; 10
   2078 0B                  510 	.db #0x0b	; 11
   2079 0A                  511 	.db #0x0a	; 10
   207A 0B                  512 	.db #0x0b	; 11
   207B 14                  513 	.db #0x14	; 20
   207C 15                  514 	.db #0x15	; 21
   207D 14                  515 	.db #0x14	; 20
   207E 15                  516 	.db #0x15	; 21
   207F 14                  517 	.db #0x14	; 20
   2080 15                  518 	.db #0x15	; 21
   2081 14                  519 	.db #0x14	; 20
   2082 15                  520 	.db #0x15	; 21
   2083 14                  521 	.db #0x14	; 20
   2084 15                  522 	.db #0x15	; 21
   2085 14                  523 	.db #0x14	; 20
   2086 15                  524 	.db #0x15	; 21
   2087 14                  525 	.db #0x14	; 20
   2088 15                  526 	.db #0x15	; 21
   2089 14                  527 	.db #0x14	; 20
   208A 15                  528 	.db #0x15	; 21
   208B 14                  529 	.db #0x14	; 20
   208C 15                  530 	.db #0x15	; 21
   208D 1E                  531 	.db #0x1e	; 30
   208E 1F                  532 	.db #0x1f	; 31
   208F 1E                  533 	.db #0x1e	; 30
   2090 1F                  534 	.db #0x1f	; 31
   2091 1E                  535 	.db #0x1e	; 30
   2092 1F                  536 	.db #0x1f	; 31
   2093 1E                  537 	.db #0x1e	; 30
   2094 1F                  538 	.db #0x1f	; 31
   2095 1E                  539 	.db #0x1e	; 30
   2096 1F                  540 	.db #0x1f	; 31
   2097 1E                  541 	.db #0x1e	; 30
   2098 1F                  542 	.db #0x1f	; 31
   2099 1E                  543 	.db #0x1e	; 30
   209A 1F                  544 	.db #0x1f	; 31
   209B 1E                  545 	.db #0x1e	; 30
   209C 1F                  546 	.db #0x1f	; 31
   209D 1E                  547 	.db #0x1e	; 30
   209E 1F                  548 	.db #0x1f	; 31
                            549 	.area _INITIALIZER
                            550 	.area _CABS (ABS)
