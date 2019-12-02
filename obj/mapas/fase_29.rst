                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (CYGWIN)
                              4 ;--------------------------------------------------------
                              5 	.module fase_29
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_mapa29
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
   3C2F                      44 _g_mapa29:
   3C2F 50                   45 	.db #0x50	; 80	'P'
   3C30 51                   46 	.db #0x51	; 81	'Q'
   3C31 50                   47 	.db #0x50	; 80	'P'
   3C32 51                   48 	.db #0x51	; 81	'Q'
   3C33 5A                   49 	.db #0x5a	; 90	'Z'
   3C34 5B                   50 	.db #0x5b	; 91
   3C35 64                   51 	.db #0x64	; 100	'd'
   3C36 65                   52 	.db #0x65	; 101	'e'
   3C37 C7                   53 	.db #0xc7	; 199
   3C38 C7                   54 	.db #0xc7	; 199
   3C39 C7                   55 	.db #0xc7	; 199
   3C3A C7                   56 	.db #0xc7	; 199
   3C3B C7                   57 	.db #0xc7	; 199
   3C3C C7                   58 	.db #0xc7	; 199
   3C3D C7                   59 	.db #0xc7	; 199
   3C3E C7                   60 	.db #0xc7	; 199
   3C3F C7                   61 	.db #0xc7	; 199
   3C40 C7                   62 	.db #0xc7	; 199
   3C41 5A                   63 	.db #0x5a	; 90	'Z'
   3C42 5B                   64 	.db #0x5b	; 91
   3C43 5A                   65 	.db #0x5a	; 90	'Z'
   3C44 5B                   66 	.db #0x5b	; 91
   3C45 64                   67 	.db #0x64	; 100	'd'
   3C46 65                   68 	.db #0x65	; 101	'e'
   3C47 6E                   69 	.db #0x6e	; 110	'n'
   3C48 6F                   70 	.db #0x6f	; 111	'o'
   3C49 C7                   71 	.db #0xc7	; 199
   3C4A C7                   72 	.db #0xc7	; 199
   3C4B C7                   73 	.db #0xc7	; 199
   3C4C C7                   74 	.db #0xc7	; 199
   3C4D C7                   75 	.db #0xc7	; 199
   3C4E C7                   76 	.db #0xc7	; 199
   3C4F C7                   77 	.db #0xc7	; 199
   3C50 C7                   78 	.db #0xc7	; 199
   3C51 C7                   79 	.db #0xc7	; 199
   3C52 C7                   80 	.db #0xc7	; 199
   3C53 64                   81 	.db #0x64	; 100	'd'
   3C54 65                   82 	.db #0x65	; 101	'e'
   3C55 64                   83 	.db #0x64	; 100	'd'
   3C56 65                   84 	.db #0x65	; 101	'e'
   3C57 6E                   85 	.db #0x6e	; 110	'n'
   3C58 6F                   86 	.db #0x6f	; 111	'o'
   3C59 C7                   87 	.db #0xc7	; 199
   3C5A C7                   88 	.db #0xc7	; 199
   3C5B C7                   89 	.db #0xc7	; 199
   3C5C C7                   90 	.db #0xc7	; 199
   3C5D C7                   91 	.db #0xc7	; 199
   3C5E C7                   92 	.db #0xc7	; 199
   3C5F C7                   93 	.db #0xc7	; 199
   3C60 C7                   94 	.db #0xc7	; 199
   3C61 C7                   95 	.db #0xc7	; 199
   3C62 C7                   96 	.db #0xc7	; 199
   3C63 C7                   97 	.db #0xc7	; 199
   3C64 C7                   98 	.db #0xc7	; 199
   3C65 6E                   99 	.db #0x6e	; 110	'n'
   3C66 6F                  100 	.db #0x6f	; 111	'o'
   3C67 50                  101 	.db #0x50	; 80	'P'
   3C68 51                  102 	.db #0x51	; 81	'Q'
   3C69 C7                  103 	.db #0xc7	; 199
   3C6A C7                  104 	.db #0xc7	; 199
   3C6B C7                  105 	.db #0xc7	; 199
   3C6C C7                  106 	.db #0xc7	; 199
   3C6D C7                  107 	.db #0xc7	; 199
   3C6E C7                  108 	.db #0xc7	; 199
   3C6F C7                  109 	.db #0xc7	; 199
   3C70 C7                  110 	.db #0xc7	; 199
   3C71 C7                  111 	.db #0xc7	; 199
   3C72 C7                  112 	.db #0xc7	; 199
   3C73 C7                  113 	.db #0xc7	; 199
   3C74 C7                  114 	.db #0xc7	; 199
   3C75 C7                  115 	.db #0xc7	; 199
   3C76 C7                  116 	.db #0xc7	; 199
   3C77 50                  117 	.db #0x50	; 80	'P'
   3C78 51                  118 	.db #0x51	; 81	'Q'
   3C79 5A                  119 	.db #0x5a	; 90	'Z'
   3C7A 5B                  120 	.db #0x5b	; 91
   3C7B C7                  121 	.db #0xc7	; 199
   3C7C C7                  122 	.db #0xc7	; 199
   3C7D C7                  123 	.db #0xc7	; 199
   3C7E C7                  124 	.db #0xc7	; 199
   3C7F C7                  125 	.db #0xc7	; 199
   3C80 C7                  126 	.db #0xc7	; 199
   3C81 C7                  127 	.db #0xc7	; 199
   3C82 C7                  128 	.db #0xc7	; 199
   3C83 C7                  129 	.db #0xc7	; 199
   3C84 C7                  130 	.db #0xc7	; 199
   3C85 C7                  131 	.db #0xc7	; 199
   3C86 C7                  132 	.db #0xc7	; 199
   3C87 C7                  133 	.db #0xc7	; 199
   3C88 C7                  134 	.db #0xc7	; 199
   3C89 5A                  135 	.db #0x5a	; 90	'Z'
   3C8A 5B                  136 	.db #0x5b	; 91
   3C8B 64                  137 	.db #0x64	; 100	'd'
   3C8C 65                  138 	.db #0x65	; 101	'e'
   3C8D C7                  139 	.db #0xc7	; 199
   3C8E C7                  140 	.db #0xc7	; 199
   3C8F C7                  141 	.db #0xc7	; 199
   3C90 C7                  142 	.db #0xc7	; 199
   3C91 C7                  143 	.db #0xc7	; 199
   3C92 C7                  144 	.db #0xc7	; 199
   3C93 C7                  145 	.db #0xc7	; 199
   3C94 C7                  146 	.db #0xc7	; 199
   3C95 C7                  147 	.db #0xc7	; 199
   3C96 C7                  148 	.db #0xc7	; 199
   3C97 C7                  149 	.db #0xc7	; 199
   3C98 C7                  150 	.db #0xc7	; 199
   3C99 C7                  151 	.db #0xc7	; 199
   3C9A C7                  152 	.db #0xc7	; 199
   3C9B 64                  153 	.db #0x64	; 100	'd'
   3C9C 65                  154 	.db #0x65	; 101	'e'
   3C9D 6E                  155 	.db #0x6e	; 110	'n'
   3C9E 6F                  156 	.db #0x6f	; 111	'o'
   3C9F C7                  157 	.db #0xc7	; 199
   3CA0 C7                  158 	.db #0xc7	; 199
   3CA1 C7                  159 	.db #0xc7	; 199
   3CA2 C7                  160 	.db #0xc7	; 199
   3CA3 C7                  161 	.db #0xc7	; 199
   3CA4 C7                  162 	.db #0xc7	; 199
   3CA5 C7                  163 	.db #0xc7	; 199
   3CA6 C7                  164 	.db #0xc7	; 199
   3CA7 C7                  165 	.db #0xc7	; 199
   3CA8 C7                  166 	.db #0xc7	; 199
   3CA9 C7                  167 	.db #0xc7	; 199
   3CAA C7                  168 	.db #0xc7	; 199
   3CAB C7                  169 	.db #0xc7	; 199
   3CAC C7                  170 	.db #0xc7	; 199
   3CAD 50                  171 	.db #0x50	; 80	'P'
   3CAE 51                  172 	.db #0x51	; 81	'Q'
   3CAF C7                  173 	.db #0xc7	; 199
   3CB0 C7                  174 	.db #0xc7	; 199
   3CB1 C7                  175 	.db #0xc7	; 199
   3CB2 C7                  176 	.db #0xc7	; 199
   3CB3 C7                  177 	.db #0xc7	; 199
   3CB4 C7                  178 	.db #0xc7	; 199
   3CB5 C7                  179 	.db #0xc7	; 199
   3CB6 C7                  180 	.db #0xc7	; 199
   3CB7 C7                  181 	.db #0xc7	; 199
   3CB8 C7                  182 	.db #0xc7	; 199
   3CB9 C7                  183 	.db #0xc7	; 199
   3CBA C7                  184 	.db #0xc7	; 199
   3CBB C7                  185 	.db #0xc7	; 199
   3CBC C7                  186 	.db #0xc7	; 199
   3CBD C7                  187 	.db #0xc7	; 199
   3CBE C7                  188 	.db #0xc7	; 199
   3CBF 5A                  189 	.db #0x5a	; 90	'Z'
   3CC0 5B                  190 	.db #0x5b	; 91
   3CC1 C7                  191 	.db #0xc7	; 199
   3CC2 C7                  192 	.db #0xc7	; 199
   3CC3 C7                  193 	.db #0xc7	; 199
   3CC4 C7                  194 	.db #0xc7	; 199
   3CC5 C7                  195 	.db #0xc7	; 199
   3CC6 C7                  196 	.db #0xc7	; 199
   3CC7 C7                  197 	.db #0xc7	; 199
   3CC8 C7                  198 	.db #0xc7	; 199
   3CC9 C7                  199 	.db #0xc7	; 199
   3CCA C7                  200 	.db #0xc7	; 199
   3CCB C7                  201 	.db #0xc7	; 199
   3CCC C7                  202 	.db #0xc7	; 199
   3CCD C7                  203 	.db #0xc7	; 199
   3CCE C7                  204 	.db #0xc7	; 199
   3CCF C7                  205 	.db #0xc7	; 199
   3CD0 C7                  206 	.db #0xc7	; 199
   3CD1 64                  207 	.db #0x64	; 100	'd'
   3CD2 65                  208 	.db #0x65	; 101	'e'
   3CD3 C7                  209 	.db #0xc7	; 199
   3CD4 C7                  210 	.db #0xc7	; 199
   3CD5 C7                  211 	.db #0xc7	; 199
   3CD6 C7                  212 	.db #0xc7	; 199
   3CD7 79                  213 	.db #0x79	; 121	'y'
   3CD8 C7                  214 	.db #0xc7	; 199
   3CD9 C7                  215 	.db #0xc7	; 199
   3CDA C7                  216 	.db #0xc7	; 199
   3CDB C7                  217 	.db #0xc7	; 199
   3CDC C7                  218 	.db #0xc7	; 199
   3CDD C7                  219 	.db #0xc7	; 199
   3CDE C7                  220 	.db #0xc7	; 199
   3CDF C7                  221 	.db #0xc7	; 199
   3CE0 C7                  222 	.db #0xc7	; 199
   3CE1 C7                  223 	.db #0xc7	; 199
   3CE2 C7                  224 	.db #0xc7	; 199
   3CE3 50                  225 	.db #0x50	; 80	'P'
   3CE4 51                  226 	.db #0x51	; 81	'Q'
   3CE5 C7                  227 	.db #0xc7	; 199
   3CE6 C7                  228 	.db #0xc7	; 199
   3CE7 C7                  229 	.db #0xc7	; 199
   3CE8 C7                  230 	.db #0xc7	; 199
   3CE9 83                  231 	.db #0x83	; 131
   3CEA C7                  232 	.db #0xc7	; 199
   3CEB C7                  233 	.db #0xc7	; 199
   3CEC C7                  234 	.db #0xc7	; 199
   3CED C7                  235 	.db #0xc7	; 199
   3CEE C7                  236 	.db #0xc7	; 199
   3CEF C7                  237 	.db #0xc7	; 199
   3CF0 C7                  238 	.db #0xc7	; 199
   3CF1 C7                  239 	.db #0xc7	; 199
   3CF2 C7                  240 	.db #0xc7	; 199
   3CF3 C7                  241 	.db #0xc7	; 199
   3CF4 C7                  242 	.db #0xc7	; 199
   3CF5 5A                  243 	.db #0x5a	; 90	'Z'
   3CF6 5B                  244 	.db #0x5b	; 91
   3CF7 C7                  245 	.db #0xc7	; 199
   3CF8 C7                  246 	.db #0xc7	; 199
   3CF9 C7                  247 	.db #0xc7	; 199
   3CFA 8C                  248 	.db #0x8c	; 140
   3CFB 8D                  249 	.db #0x8d	; 141
   3CFC 8E                  250 	.db #0x8e	; 142
   3CFD C7                  251 	.db #0xc7	; 199
   3CFE C7                  252 	.db #0xc7	; 199
   3CFF C7                  253 	.db #0xc7	; 199
   3D00 C7                  254 	.db #0xc7	; 199
   3D01 C7                  255 	.db #0xc7	; 199
   3D02 C7                  256 	.db #0xc7	; 199
   3D03 C7                  257 	.db #0xc7	; 199
   3D04 C7                  258 	.db #0xc7	; 199
   3D05 C7                  259 	.db #0xc7	; 199
   3D06 C7                  260 	.db #0xc7	; 199
   3D07 64                  261 	.db #0x64	; 100	'd'
   3D08 65                  262 	.db #0x65	; 101	'e'
   3D09 C7                  263 	.db #0xc7	; 199
   3D0A C7                  264 	.db #0xc7	; 199
   3D0B C7                  265 	.db #0xc7	; 199
   3D0C 96                  266 	.db #0x96	; 150
   3D0D 97                  267 	.db #0x97	; 151
   3D0E 98                  268 	.db #0x98	; 152
   3D0F 79                  269 	.db #0x79	; 121	'y'
   3D10 C7                  270 	.db #0xc7	; 199
   3D11 C7                  271 	.db #0xc7	; 199
   3D12 C7                  272 	.db #0xc7	; 199
   3D13 C7                  273 	.db #0xc7	; 199
   3D14 C7                  274 	.db #0xc7	; 199
   3D15 C7                  275 	.db #0xc7	; 199
   3D16 C7                  276 	.db #0xc7	; 199
   3D17 C7                  277 	.db #0xc7	; 199
   3D18 C7                  278 	.db #0xc7	; 199
   3D19 6E                  279 	.db #0x6e	; 110	'n'
   3D1A 6F                  280 	.db #0x6f	; 111	'o'
   3D1B C7                  281 	.db #0xc7	; 199
   3D1C C7                  282 	.db #0xc7	; 199
   3D1D C7                  283 	.db #0xc7	; 199
   3D1E A0                  284 	.db #0xa0	; 160
   3D1F A1                  285 	.db #0xa1	; 161
   3D20 79                  286 	.db #0x79	; 121	'y'
   3D21 83                  287 	.db #0x83	; 131
   3D22 C7                  288 	.db #0xc7	; 199
   3D23 C7                  289 	.db #0xc7	; 199
   3D24 C7                  290 	.db #0xc7	; 199
   3D25 C7                  291 	.db #0xc7	; 199
   3D26 C7                  292 	.db #0xc7	; 199
   3D27 C7                  293 	.db #0xc7	; 199
   3D28 C7                  294 	.db #0xc7	; 199
   3D29 C7                  295 	.db #0xc7	; 199
   3D2A C7                  296 	.db #0xc7	; 199
   3D2B C7                  297 	.db #0xc7	; 199
   3D2C C7                  298 	.db #0xc7	; 199
   3D2D C7                  299 	.db #0xc7	; 199
   3D2E C7                  300 	.db #0xc7	; 199
   3D2F C7                  301 	.db #0xc7	; 199
   3D30 AA                  302 	.db #0xaa	; 170
   3D31 AB                  303 	.db #0xab	; 171
   3D32 83                  304 	.db #0x83	; 131
   3D33 8D                  305 	.db #0x8d	; 141
   3D34 8E                  306 	.db #0x8e	; 142
   3D35 C7                  307 	.db #0xc7	; 199
   3D36 C7                  308 	.db #0xc7	; 199
   3D37 C7                  309 	.db #0xc7	; 199
   3D38 C7                  310 	.db #0xc7	; 199
   3D39 C7                  311 	.db #0xc7	; 199
   3D3A C7                  312 	.db #0xc7	; 199
   3D3B C7                  313 	.db #0xc7	; 199
   3D3C C7                  314 	.db #0xc7	; 199
   3D3D C7                  315 	.db #0xc7	; 199
   3D3E C7                  316 	.db #0xc7	; 199
   3D3F C7                  317 	.db #0xc7	; 199
   3D40 C7                  318 	.db #0xc7	; 199
   3D41 C7                  319 	.db #0xc7	; 199
   3D42 B4                  320 	.db #0xb4	; 180
   3D43 8C                  321 	.db #0x8c	; 140
   3D44 8D                  322 	.db #0x8d	; 141
   3D45 8E                  323 	.db #0x8e	; 142
   3D46 98                  324 	.db #0x98	; 152
   3D47 C7                  325 	.db #0xc7	; 199
   3D48 C7                  326 	.db #0xc7	; 199
   3D49 C7                  327 	.db #0xc7	; 199
   3D4A C7                  328 	.db #0xc7	; 199
   3D4B C7                  329 	.db #0xc7	; 199
   3D4C C7                  330 	.db #0xc7	; 199
   3D4D C7                  331 	.db #0xc7	; 199
   3D4E C7                  332 	.db #0xc7	; 199
   3D4F C7                  333 	.db #0xc7	; 199
   3D50 C7                  334 	.db #0xc7	; 199
   3D51 C7                  335 	.db #0xc7	; 199
   3D52 C7                  336 	.db #0xc7	; 199
   3D53 C7                  337 	.db #0xc7	; 199
   3D54 BE                  338 	.db #0xbe	; 190
   3D55 96                  339 	.db #0x96	; 150
   3D56 97                  340 	.db #0x97	; 151
   3D57 98                  341 	.db #0x98	; 152
   3D58 A2                  342 	.db #0xa2	; 162
   3D59 C7                  343 	.db #0xc7	; 199
   3D5A C7                  344 	.db #0xc7	; 199
   3D5B C7                  345 	.db #0xc7	; 199
   3D5C C7                  346 	.db #0xc7	; 199
   3D5D C7                  347 	.db #0xc7	; 199
   3D5E C7                  348 	.db #0xc7	; 199
   3D5F C7                  349 	.db #0xc7	; 199
   3D60 C7                  350 	.db #0xc7	; 199
   3D61 C7                  351 	.db #0xc7	; 199
   3D62 C7                  352 	.db #0xc7	; 199
   3D63 C7                  353 	.db #0xc7	; 199
   3D64 C7                  354 	.db #0xc7	; 199
   3D65 C7                  355 	.db #0xc7	; 199
   3D66 C7                  356 	.db #0xc7	; 199
   3D67 A0                  357 	.db #0xa0	; 160
   3D68 A1                  358 	.db #0xa1	; 161
   3D69 A2                  359 	.db #0xa2	; 162
   3D6A AC                  360 	.db #0xac	; 172
   3D6B C7                  361 	.db #0xc7	; 199
   3D6C C7                  362 	.db #0xc7	; 199
   3D6D C7                  363 	.db #0xc7	; 199
   3D6E C7                  364 	.db #0xc7	; 199
   3D6F C7                  365 	.db #0xc7	; 199
   3D70 C7                  366 	.db #0xc7	; 199
   3D71 C7                  367 	.db #0xc7	; 199
   3D72 C7                  368 	.db #0xc7	; 199
   3D73 C7                  369 	.db #0xc7	; 199
   3D74 C7                  370 	.db #0xc7	; 199
   3D75 C7                  371 	.db #0xc7	; 199
   3D76 C7                  372 	.db #0xc7	; 199
   3D77 C7                  373 	.db #0xc7	; 199
   3D78 C7                  374 	.db #0xc7	; 199
   3D79 AA                  375 	.db #0xaa	; 170
   3D7A AB                  376 	.db #0xab	; 171
   3D7B AC                  377 	.db #0xac	; 172
   3D7C B6                  378 	.db #0xb6	; 182
   3D7D C7                  379 	.db #0xc7	; 199
   3D7E C7                  380 	.db #0xc7	; 199
   3D7F C7                  381 	.db #0xc7	; 199
   3D80 C7                  382 	.db #0xc7	; 199
   3D81 C7                  383 	.db #0xc7	; 199
   3D82 C7                  384 	.db #0xc7	; 199
   3D83 C7                  385 	.db #0xc7	; 199
   3D84 C7                  386 	.db #0xc7	; 199
   3D85 C7                  387 	.db #0xc7	; 199
   3D86 C7                  388 	.db #0xc7	; 199
   3D87 C7                  389 	.db #0xc7	; 199
   3D88 C7                  390 	.db #0xc7	; 199
   3D89 C7                  391 	.db #0xc7	; 199
   3D8A C7                  392 	.db #0xc7	; 199
   3D8B B4                  393 	.db #0xb4	; 180
   3D8C B5                  394 	.db #0xb5	; 181
   3D8D B6                  395 	.db #0xb6	; 182
   3D8E C0                  396 	.db #0xc0	; 192
   3D8F C7                  397 	.db #0xc7	; 199
   3D90 C7                  398 	.db #0xc7	; 199
   3D91 C7                  399 	.db #0xc7	; 199
   3D92 C7                  400 	.db #0xc7	; 199
   3D93 C7                  401 	.db #0xc7	; 199
   3D94 C7                  402 	.db #0xc7	; 199
   3D95 C7                  403 	.db #0xc7	; 199
   3D96 C7                  404 	.db #0xc7	; 199
   3D97 C7                  405 	.db #0xc7	; 199
   3D98 C7                  406 	.db #0xc7	; 199
   3D99 C7                  407 	.db #0xc7	; 199
   3D9A C7                  408 	.db #0xc7	; 199
   3D9B C7                  409 	.db #0xc7	; 199
   3D9C C7                  410 	.db #0xc7	; 199
   3D9D BE                  411 	.db #0xbe	; 190
   3D9E BF                  412 	.db #0xbf	; 191
   3D9F C0                  413 	.db #0xc0	; 192
   3DA0 C7                  414 	.db #0xc7	; 199
   3DA1 C7                  415 	.db #0xc7	; 199
   3DA2 C7                  416 	.db #0xc7	; 199
   3DA3 C7                  417 	.db #0xc7	; 199
   3DA4 C7                  418 	.db #0xc7	; 199
   3DA5 C7                  419 	.db #0xc7	; 199
   3DA6 C7                  420 	.db #0xc7	; 199
   3DA7 C7                  421 	.db #0xc7	; 199
   3DA8 C7                  422 	.db #0xc7	; 199
   3DA9 C7                  423 	.db #0xc7	; 199
   3DAA C7                  424 	.db #0xc7	; 199
   3DAB C7                  425 	.db #0xc7	; 199
   3DAC C7                  426 	.db #0xc7	; 199
   3DAD C7                  427 	.db #0xc7	; 199
   3DAE C7                  428 	.db #0xc7	; 199
   3DAF C7                  429 	.db #0xc7	; 199
   3DB0 C7                  430 	.db #0xc7	; 199
   3DB1 C7                  431 	.db #0xc7	; 199
   3DB2 C7                  432 	.db #0xc7	; 199
   3DB3 C7                  433 	.db #0xc7	; 199
   3DB4 C7                  434 	.db #0xc7	; 199
   3DB5 C7                  435 	.db #0xc7	; 199
   3DB6 C7                  436 	.db #0xc7	; 199
   3DB7 C7                  437 	.db #0xc7	; 199
   3DB8 C7                  438 	.db #0xc7	; 199
   3DB9 C7                  439 	.db #0xc7	; 199
   3DBA C7                  440 	.db #0xc7	; 199
   3DBB C7                  441 	.db #0xc7	; 199
   3DBC C7                  442 	.db #0xc7	; 199
   3DBD C7                  443 	.db #0xc7	; 199
   3DBE C7                  444 	.db #0xc7	; 199
   3DBF C7                  445 	.db #0xc7	; 199
   3DC0 C7                  446 	.db #0xc7	; 199
   3DC1 C7                  447 	.db #0xc7	; 199
   3DC2 C7                  448 	.db #0xc7	; 199
   3DC3 C7                  449 	.db #0xc7	; 199
   3DC4 C7                  450 	.db #0xc7	; 199
   3DC5 C7                  451 	.db #0xc7	; 199
   3DC6 C7                  452 	.db #0xc7	; 199
   3DC7 C7                  453 	.db #0xc7	; 199
   3DC8 C7                  454 	.db #0xc7	; 199
   3DC9 C7                  455 	.db #0xc7	; 199
   3DCA C7                  456 	.db #0xc7	; 199
   3DCB C7                  457 	.db #0xc7	; 199
   3DCC C7                  458 	.db #0xc7	; 199
   3DCD C7                  459 	.db #0xc7	; 199
   3DCE C7                  460 	.db #0xc7	; 199
   3DCF C7                  461 	.db #0xc7	; 199
   3DD0 C7                  462 	.db #0xc7	; 199
   3DD1 C7                  463 	.db #0xc7	; 199
   3DD2 C7                  464 	.db #0xc7	; 199
   3DD3 C7                  465 	.db #0xc7	; 199
   3DD4 C7                  466 	.db #0xc7	; 199
   3DD5 C7                  467 	.db #0xc7	; 199
   3DD6 C7                  468 	.db #0xc7	; 199
   3DD7 C7                  469 	.db #0xc7	; 199
   3DD8 C7                  470 	.db #0xc7	; 199
   3DD9 C7                  471 	.db #0xc7	; 199
   3DDA C7                  472 	.db #0xc7	; 199
   3DDB C7                  473 	.db #0xc7	; 199
   3DDC C7                  474 	.db #0xc7	; 199
   3DDD C7                  475 	.db #0xc7	; 199
   3DDE C7                  476 	.db #0xc7	; 199
   3DDF 00                  477 	.db #0x00	; 0
   3DE0 01                  478 	.db #0x01	; 1
   3DE1 00                  479 	.db #0x00	; 0
   3DE2 01                  480 	.db #0x01	; 1
   3DE3 00                  481 	.db #0x00	; 0
   3DE4 01                  482 	.db #0x01	; 1
   3DE5 00                  483 	.db #0x00	; 0
   3DE6 01                  484 	.db #0x01	; 1
   3DE7 00                  485 	.db #0x00	; 0
   3DE8 01                  486 	.db #0x01	; 1
   3DE9 00                  487 	.db #0x00	; 0
   3DEA 01                  488 	.db #0x01	; 1
   3DEB 00                  489 	.db #0x00	; 0
   3DEC 01                  490 	.db #0x01	; 1
   3DED 00                  491 	.db #0x00	; 0
   3DEE 01                  492 	.db #0x01	; 1
   3DEF 00                  493 	.db #0x00	; 0
   3DF0 01                  494 	.db #0x01	; 1
   3DF1 0A                  495 	.db #0x0a	; 10
   3DF2 0B                  496 	.db #0x0b	; 11
   3DF3 0A                  497 	.db #0x0a	; 10
   3DF4 0B                  498 	.db #0x0b	; 11
   3DF5 0A                  499 	.db #0x0a	; 10
   3DF6 0B                  500 	.db #0x0b	; 11
   3DF7 0A                  501 	.db #0x0a	; 10
   3DF8 0B                  502 	.db #0x0b	; 11
   3DF9 0A                  503 	.db #0x0a	; 10
   3DFA 0B                  504 	.db #0x0b	; 11
   3DFB 0A                  505 	.db #0x0a	; 10
   3DFC 0B                  506 	.db #0x0b	; 11
   3DFD 0A                  507 	.db #0x0a	; 10
   3DFE 0B                  508 	.db #0x0b	; 11
   3DFF 0A                  509 	.db #0x0a	; 10
   3E00 0B                  510 	.db #0x0b	; 11
   3E01 0A                  511 	.db #0x0a	; 10
   3E02 0B                  512 	.db #0x0b	; 11
   3E03 14                  513 	.db #0x14	; 20
   3E04 15                  514 	.db #0x15	; 21
   3E05 14                  515 	.db #0x14	; 20
   3E06 15                  516 	.db #0x15	; 21
   3E07 14                  517 	.db #0x14	; 20
   3E08 15                  518 	.db #0x15	; 21
   3E09 14                  519 	.db #0x14	; 20
   3E0A 15                  520 	.db #0x15	; 21
   3E0B 14                  521 	.db #0x14	; 20
   3E0C 15                  522 	.db #0x15	; 21
   3E0D 14                  523 	.db #0x14	; 20
   3E0E 15                  524 	.db #0x15	; 21
   3E0F 14                  525 	.db #0x14	; 20
   3E10 15                  526 	.db #0x15	; 21
   3E11 14                  527 	.db #0x14	; 20
   3E12 15                  528 	.db #0x15	; 21
   3E13 14                  529 	.db #0x14	; 20
   3E14 15                  530 	.db #0x15	; 21
   3E15 1E                  531 	.db #0x1e	; 30
   3E16 1F                  532 	.db #0x1f	; 31
   3E17 1E                  533 	.db #0x1e	; 30
   3E18 1F                  534 	.db #0x1f	; 31
   3E19 1E                  535 	.db #0x1e	; 30
   3E1A 1F                  536 	.db #0x1f	; 31
   3E1B 1E                  537 	.db #0x1e	; 30
   3E1C 1F                  538 	.db #0x1f	; 31
   3E1D 1E                  539 	.db #0x1e	; 30
   3E1E 1F                  540 	.db #0x1f	; 31
   3E1F 1E                  541 	.db #0x1e	; 30
   3E20 1F                  542 	.db #0x1f	; 31
   3E21 1E                  543 	.db #0x1e	; 30
   3E22 1F                  544 	.db #0x1f	; 31
   3E23 1E                  545 	.db #0x1e	; 30
   3E24 1F                  546 	.db #0x1f	; 31
   3E25 1E                  547 	.db #0x1e	; 30
   3E26 1F                  548 	.db #0x1f	; 31
                            549 	.area _INITIALIZER
                            550 	.area _CABS (ABS)
