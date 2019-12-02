                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (CYGWIN)
                              4 ;--------------------------------------------------------
                              5 	.module fase_12
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_mapa12
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
   1AB7                      44 _g_mapa12:
   1AB7 02                   45 	.db #0x02	; 2
   1AB8 02                   46 	.db #0x02	; 2
   1AB9 03                   47 	.db #0x03	; 3
   1ABA 02                   48 	.db #0x02	; 2
   1ABB 03                   49 	.db #0x03	; 3
   1ABC 02                   50 	.db #0x02	; 2
   1ABD 03                   51 	.db #0x03	; 3
   1ABE 04                   52 	.db #0x04	; 4
   1ABF 05                   53 	.db #0x05	; 5
   1AC0 04                   54 	.db #0x04	; 4
   1AC1 05                   55 	.db #0x05	; 5
   1AC2 02                   56 	.db #0x02	; 2
   1AC3 03                   57 	.db #0x03	; 3
   1AC4 02                   58 	.db #0x02	; 2
   1AC5 03                   59 	.db #0x03	; 3
   1AC6 02                   60 	.db #0x02	; 2
   1AC7 03                   61 	.db #0x03	; 3
   1AC8 03                   62 	.db #0x03	; 3
   1AC9 0C                   63 	.db #0x0c	; 12
   1ACA 0C                   64 	.db #0x0c	; 12
   1ACB 0D                   65 	.db #0x0d	; 13
   1ACC 0C                   66 	.db #0x0c	; 12
   1ACD 0D                   67 	.db #0x0d	; 13
   1ACE 0C                   68 	.db #0x0c	; 12
   1ACF 0D                   69 	.db #0x0d	; 13
   1AD0 0E                   70 	.db #0x0e	; 14
   1AD1 0F                   71 	.db #0x0f	; 15
   1AD2 0E                   72 	.db #0x0e	; 14
   1AD3 0F                   73 	.db #0x0f	; 15
   1AD4 0C                   74 	.db #0x0c	; 12
   1AD5 0D                   75 	.db #0x0d	; 13
   1AD6 0C                   76 	.db #0x0c	; 12
   1AD7 0D                   77 	.db #0x0d	; 13
   1AD8 0C                   78 	.db #0x0c	; 12
   1AD9 0D                   79 	.db #0x0d	; 13
   1ADA 0D                   80 	.db #0x0d	; 13
   1ADB C7                   81 	.db #0xc7	; 199
   1ADC 3D                   82 	.db #0x3d	; 61
   1ADD 50                   83 	.db #0x50	; 80	'P'
   1ADE C7                   84 	.db #0xc7	; 199
   1ADF C7                   85 	.db #0xc7	; 199
   1AE0 C7                   86 	.db #0xc7	; 199
   1AE1 C7                   87 	.db #0xc7	; 199
   1AE2 28                   88 	.db #0x28	; 40
   1AE3 29                   89 	.db #0x29	; 41
   1AE4 28                   90 	.db #0x28	; 40
   1AE5 29                   91 	.db #0x29	; 41
   1AE6 C7                   92 	.db #0xc7	; 199
   1AE7 C7                   93 	.db #0xc7	; 199
   1AE8 6E                   94 	.db #0x6e	; 110	'n'
   1AE9 C7                   95 	.db #0xc7	; 199
   1AEA C7                   96 	.db #0xc7	; 199
   1AEB C7                   97 	.db #0xc7	; 199
   1AEC C7                   98 	.db #0xc7	; 199
   1AED C7                   99 	.db #0xc7	; 199
   1AEE C7                  100 	.db #0xc7	; 199
   1AEF 5A                  101 	.db #0x5a	; 90	'Z'
   1AF0 C7                  102 	.db #0xc7	; 199
   1AF1 C7                  103 	.db #0xc7	; 199
   1AF2 C7                  104 	.db #0xc7	; 199
   1AF3 C7                  105 	.db #0xc7	; 199
   1AF4 32                  106 	.db #0x32	; 50	'2'
   1AF5 33                  107 	.db #0x33	; 51	'3'
   1AF6 32                  108 	.db #0x32	; 50	'2'
   1AF7 33                  109 	.db #0x33	; 51	'3'
   1AF8 C7                  110 	.db #0xc7	; 199
   1AF9 C7                  111 	.db #0xc7	; 199
   1AFA 78                  112 	.db #0x78	; 120	'x'
   1AFB C7                  113 	.db #0xc7	; 199
   1AFC C7                  114 	.db #0xc7	; 199
   1AFD C7                  115 	.db #0xc7	; 199
   1AFE C7                  116 	.db #0xc7	; 199
   1AFF C7                  117 	.db #0xc7	; 199
   1B00 C7                  118 	.db #0xc7	; 199
   1B01 64                  119 	.db #0x64	; 100	'd'
   1B02 C7                  120 	.db #0xc7	; 199
   1B03 C7                  121 	.db #0xc7	; 199
   1B04 C7                  122 	.db #0xc7	; 199
   1B05 C7                  123 	.db #0xc7	; 199
   1B06 3C                  124 	.db #0x3c	; 60
   1B07 C7                  125 	.db #0xc7	; 199
   1B08 3C                  126 	.db #0x3c	; 60
   1B09 C7                  127 	.db #0xc7	; 199
   1B0A C7                  128 	.db #0xc7	; 199
   1B0B C7                  129 	.db #0xc7	; 199
   1B0C 82                  130 	.db #0x82	; 130
   1B0D C7                  131 	.db #0xc7	; 199
   1B0E C7                  132 	.db #0xc7	; 199
   1B0F C7                  133 	.db #0xc7	; 199
   1B10 C7                  134 	.db #0xc7	; 199
   1B11 C7                  135 	.db #0xc7	; 199
   1B12 C7                  136 	.db #0xc7	; 199
   1B13 6E                  137 	.db #0x6e	; 110	'n'
   1B14 C7                  138 	.db #0xc7	; 199
   1B15 C7                  139 	.db #0xc7	; 199
   1B16 C7                  140 	.db #0xc7	; 199
   1B17 C7                  141 	.db #0xc7	; 199
   1B18 C7                  142 	.db #0xc7	; 199
   1B19 C7                  143 	.db #0xc7	; 199
   1B1A C7                  144 	.db #0xc7	; 199
   1B1B C7                  145 	.db #0xc7	; 199
   1B1C C7                  146 	.db #0xc7	; 199
   1B1D C7                  147 	.db #0xc7	; 199
   1B1E 8C                  148 	.db #0x8c	; 140
   1B1F C7                  149 	.db #0xc7	; 199
   1B20 C7                  150 	.db #0xc7	; 199
   1B21 C7                  151 	.db #0xc7	; 199
   1B22 C7                  152 	.db #0xc7	; 199
   1B23 C7                  153 	.db #0xc7	; 199
   1B24 C7                  154 	.db #0xc7	; 199
   1B25 78                  155 	.db #0x78	; 120	'x'
   1B26 C7                  156 	.db #0xc7	; 199
   1B27 C7                  157 	.db #0xc7	; 199
   1B28 C7                  158 	.db #0xc7	; 199
   1B29 C7                  159 	.db #0xc7	; 199
   1B2A C7                  160 	.db #0xc7	; 199
   1B2B C7                  161 	.db #0xc7	; 199
   1B2C C7                  162 	.db #0xc7	; 199
   1B2D C7                  163 	.db #0xc7	; 199
   1B2E C7                  164 	.db #0xc7	; 199
   1B2F C7                  165 	.db #0xc7	; 199
   1B30 96                  166 	.db #0x96	; 150
   1B31 C7                  167 	.db #0xc7	; 199
   1B32 C7                  168 	.db #0xc7	; 199
   1B33 C7                  169 	.db #0xc7	; 199
   1B34 C7                  170 	.db #0xc7	; 199
   1B35 C7                  171 	.db #0xc7	; 199
   1B36 C7                  172 	.db #0xc7	; 199
   1B37 82                  173 	.db #0x82	; 130
   1B38 C7                  174 	.db #0xc7	; 199
   1B39 C7                  175 	.db #0xc7	; 199
   1B3A C7                  176 	.db #0xc7	; 199
   1B3B C7                  177 	.db #0xc7	; 199
   1B3C C7                  178 	.db #0xc7	; 199
   1B3D C7                  179 	.db #0xc7	; 199
   1B3E C7                  180 	.db #0xc7	; 199
   1B3F C7                  181 	.db #0xc7	; 199
   1B40 C7                  182 	.db #0xc7	; 199
   1B41 C7                  183 	.db #0xc7	; 199
   1B42 A0                  184 	.db #0xa0	; 160
   1B43 C7                  185 	.db #0xc7	; 199
   1B44 C7                  186 	.db #0xc7	; 199
   1B45 C7                  187 	.db #0xc7	; 199
   1B46 C7                  188 	.db #0xc7	; 199
   1B47 C7                  189 	.db #0xc7	; 199
   1B48 C7                  190 	.db #0xc7	; 199
   1B49 8C                  191 	.db #0x8c	; 140
   1B4A C7                  192 	.db #0xc7	; 199
   1B4B C7                  193 	.db #0xc7	; 199
   1B4C C7                  194 	.db #0xc7	; 199
   1B4D C7                  195 	.db #0xc7	; 199
   1B4E C7                  196 	.db #0xc7	; 199
   1B4F C7                  197 	.db #0xc7	; 199
   1B50 C7                  198 	.db #0xc7	; 199
   1B51 C7                  199 	.db #0xc7	; 199
   1B52 C7                  200 	.db #0xc7	; 199
   1B53 C7                  201 	.db #0xc7	; 199
   1B54 AA                  202 	.db #0xaa	; 170
   1B55 C7                  203 	.db #0xc7	; 199
   1B56 C7                  204 	.db #0xc7	; 199
   1B57 C7                  205 	.db #0xc7	; 199
   1B58 C7                  206 	.db #0xc7	; 199
   1B59 C7                  207 	.db #0xc7	; 199
   1B5A C7                  208 	.db #0xc7	; 199
   1B5B 96                  209 	.db #0x96	; 150
   1B5C C7                  210 	.db #0xc7	; 199
   1B5D C7                  211 	.db #0xc7	; 199
   1B5E C7                  212 	.db #0xc7	; 199
   1B5F C7                  213 	.db #0xc7	; 199
   1B60 C7                  214 	.db #0xc7	; 199
   1B61 C7                  215 	.db #0xc7	; 199
   1B62 C7                  216 	.db #0xc7	; 199
   1B63 C7                  217 	.db #0xc7	; 199
   1B64 C7                  218 	.db #0xc7	; 199
   1B65 C7                  219 	.db #0xc7	; 199
   1B66 C7                  220 	.db #0xc7	; 199
   1B67 C7                  221 	.db #0xc7	; 199
   1B68 C7                  222 	.db #0xc7	; 199
   1B69 C7                  223 	.db #0xc7	; 199
   1B6A C7                  224 	.db #0xc7	; 199
   1B6B C7                  225 	.db #0xc7	; 199
   1B6C C7                  226 	.db #0xc7	; 199
   1B6D A0                  227 	.db #0xa0	; 160
   1B6E C7                  228 	.db #0xc7	; 199
   1B6F C7                  229 	.db #0xc7	; 199
   1B70 C7                  230 	.db #0xc7	; 199
   1B71 C7                  231 	.db #0xc7	; 199
   1B72 C7                  232 	.db #0xc7	; 199
   1B73 C7                  233 	.db #0xc7	; 199
   1B74 C7                  234 	.db #0xc7	; 199
   1B75 C7                  235 	.db #0xc7	; 199
   1B76 C7                  236 	.db #0xc7	; 199
   1B77 C7                  237 	.db #0xc7	; 199
   1B78 C7                  238 	.db #0xc7	; 199
   1B79 51                  239 	.db #0x51	; 81	'Q'
   1B7A C7                  240 	.db #0xc7	; 199
   1B7B C7                  241 	.db #0xc7	; 199
   1B7C C7                  242 	.db #0xc7	; 199
   1B7D C7                  243 	.db #0xc7	; 199
   1B7E C7                  244 	.db #0xc7	; 199
   1B7F AA                  245 	.db #0xaa	; 170
   1B80 C7                  246 	.db #0xc7	; 199
   1B81 C7                  247 	.db #0xc7	; 199
   1B82 C7                  248 	.db #0xc7	; 199
   1B83 C7                  249 	.db #0xc7	; 199
   1B84 C7                  250 	.db #0xc7	; 199
   1B85 C7                  251 	.db #0xc7	; 199
   1B86 C7                  252 	.db #0xc7	; 199
   1B87 C7                  253 	.db #0xc7	; 199
   1B88 C7                  254 	.db #0xc7	; 199
   1B89 C7                  255 	.db #0xc7	; 199
   1B8A C7                  256 	.db #0xc7	; 199
   1B8B 5B                  257 	.db #0x5b	; 91
   1B8C C7                  258 	.db #0xc7	; 199
   1B8D C7                  259 	.db #0xc7	; 199
   1B8E C7                  260 	.db #0xc7	; 199
   1B8F C7                  261 	.db #0xc7	; 199
   1B90 C7                  262 	.db #0xc7	; 199
   1B91 C7                  263 	.db #0xc7	; 199
   1B92 C7                  264 	.db #0xc7	; 199
   1B93 46                  265 	.db #0x46	; 70	'F'
   1B94 C7                  266 	.db #0xc7	; 199
   1B95 C7                  267 	.db #0xc7	; 199
   1B96 C7                  268 	.db #0xc7	; 199
   1B97 C7                  269 	.db #0xc7	; 199
   1B98 C7                  270 	.db #0xc7	; 199
   1B99 C7                  271 	.db #0xc7	; 199
   1B9A C7                  272 	.db #0xc7	; 199
   1B9B C7                  273 	.db #0xc7	; 199
   1B9C C7                  274 	.db #0xc7	; 199
   1B9D 65                  275 	.db #0x65	; 101	'e'
   1B9E C7                  276 	.db #0xc7	; 199
   1B9F C7                  277 	.db #0xc7	; 199
   1BA0 C7                  278 	.db #0xc7	; 199
   1BA1 C7                  279 	.db #0xc7	; 199
   1BA2 C7                  280 	.db #0xc7	; 199
   1BA3 C7                  281 	.db #0xc7	; 199
   1BA4 C7                  282 	.db #0xc7	; 199
   1BA5 C7                  283 	.db #0xc7	; 199
   1BA6 C7                  284 	.db #0xc7	; 199
   1BA7 C7                  285 	.db #0xc7	; 199
   1BA8 C7                  286 	.db #0xc7	; 199
   1BA9 C7                  287 	.db #0xc7	; 199
   1BAA C7                  288 	.db #0xc7	; 199
   1BAB C7                  289 	.db #0xc7	; 199
   1BAC C7                  290 	.db #0xc7	; 199
   1BAD C7                  291 	.db #0xc7	; 199
   1BAE C7                  292 	.db #0xc7	; 199
   1BAF 6F                  293 	.db #0x6f	; 111	'o'
   1BB0 C7                  294 	.db #0xc7	; 199
   1BB1 C7                  295 	.db #0xc7	; 199
   1BB2 C7                  296 	.db #0xc7	; 199
   1BB3 C7                  297 	.db #0xc7	; 199
   1BB4 C7                  298 	.db #0xc7	; 199
   1BB5 C7                  299 	.db #0xc7	; 199
   1BB6 C7                  300 	.db #0xc7	; 199
   1BB7 C7                  301 	.db #0xc7	; 199
   1BB8 C7                  302 	.db #0xc7	; 199
   1BB9 C7                  303 	.db #0xc7	; 199
   1BBA C7                  304 	.db #0xc7	; 199
   1BBB C7                  305 	.db #0xc7	; 199
   1BBC C7                  306 	.db #0xc7	; 199
   1BBD C7                  307 	.db #0xc7	; 199
   1BBE C7                  308 	.db #0xc7	; 199
   1BBF C7                  309 	.db #0xc7	; 199
   1BC0 C7                  310 	.db #0xc7	; 199
   1BC1 79                  311 	.db #0x79	; 121	'y'
   1BC2 C7                  312 	.db #0xc7	; 199
   1BC3 C7                  313 	.db #0xc7	; 199
   1BC4 C7                  314 	.db #0xc7	; 199
   1BC5 C7                  315 	.db #0xc7	; 199
   1BC6 C7                  316 	.db #0xc7	; 199
   1BC7 C7                  317 	.db #0xc7	; 199
   1BC8 C7                  318 	.db #0xc7	; 199
   1BC9 C7                  319 	.db #0xc7	; 199
   1BCA C7                  320 	.db #0xc7	; 199
   1BCB C7                  321 	.db #0xc7	; 199
   1BCC C7                  322 	.db #0xc7	; 199
   1BCD C7                  323 	.db #0xc7	; 199
   1BCE C7                  324 	.db #0xc7	; 199
   1BCF C7                  325 	.db #0xc7	; 199
   1BD0 C7                  326 	.db #0xc7	; 199
   1BD1 C7                  327 	.db #0xc7	; 199
   1BD2 C7                  328 	.db #0xc7	; 199
   1BD3 83                  329 	.db #0x83	; 131
   1BD4 C7                  330 	.db #0xc7	; 199
   1BD5 C7                  331 	.db #0xc7	; 199
   1BD6 C7                  332 	.db #0xc7	; 199
   1BD7 C7                  333 	.db #0xc7	; 199
   1BD8 C7                  334 	.db #0xc7	; 199
   1BD9 C7                  335 	.db #0xc7	; 199
   1BDA C7                  336 	.db #0xc7	; 199
   1BDB C7                  337 	.db #0xc7	; 199
   1BDC C7                  338 	.db #0xc7	; 199
   1BDD C7                  339 	.db #0xc7	; 199
   1BDE C7                  340 	.db #0xc7	; 199
   1BDF C7                  341 	.db #0xc7	; 199
   1BE0 C7                  342 	.db #0xc7	; 199
   1BE1 C7                  343 	.db #0xc7	; 199
   1BE2 C7                  344 	.db #0xc7	; 199
   1BE3 C7                  345 	.db #0xc7	; 199
   1BE4 C7                  346 	.db #0xc7	; 199
   1BE5 8D                  347 	.db #0x8d	; 141
   1BE6 C7                  348 	.db #0xc7	; 199
   1BE7 C7                  349 	.db #0xc7	; 199
   1BE8 C7                  350 	.db #0xc7	; 199
   1BE9 C7                  351 	.db #0xc7	; 199
   1BEA C7                  352 	.db #0xc7	; 199
   1BEB C7                  353 	.db #0xc7	; 199
   1BEC C7                  354 	.db #0xc7	; 199
   1BED C7                  355 	.db #0xc7	; 199
   1BEE C7                  356 	.db #0xc7	; 199
   1BEF C7                  357 	.db #0xc7	; 199
   1BF0 C7                  358 	.db #0xc7	; 199
   1BF1 C7                  359 	.db #0xc7	; 199
   1BF2 C7                  360 	.db #0xc7	; 199
   1BF3 C7                  361 	.db #0xc7	; 199
   1BF4 C7                  362 	.db #0xc7	; 199
   1BF5 C7                  363 	.db #0xc7	; 199
   1BF6 C7                  364 	.db #0xc7	; 199
   1BF7 97                  365 	.db #0x97	; 151
   1BF8 C7                  366 	.db #0xc7	; 199
   1BF9 C7                  367 	.db #0xc7	; 199
   1BFA C7                  368 	.db #0xc7	; 199
   1BFB C7                  369 	.db #0xc7	; 199
   1BFC C7                  370 	.db #0xc7	; 199
   1BFD C7                  371 	.db #0xc7	; 199
   1BFE C7                  372 	.db #0xc7	; 199
   1BFF C7                  373 	.db #0xc7	; 199
   1C00 C7                  374 	.db #0xc7	; 199
   1C01 C7                  375 	.db #0xc7	; 199
   1C02 C7                  376 	.db #0xc7	; 199
   1C03 C7                  377 	.db #0xc7	; 199
   1C04 C7                  378 	.db #0xc7	; 199
   1C05 C7                  379 	.db #0xc7	; 199
   1C06 C7                  380 	.db #0xc7	; 199
   1C07 C7                  381 	.db #0xc7	; 199
   1C08 C7                  382 	.db #0xc7	; 199
   1C09 A1                  383 	.db #0xa1	; 161
   1C0A C7                  384 	.db #0xc7	; 199
   1C0B C7                  385 	.db #0xc7	; 199
   1C0C C7                  386 	.db #0xc7	; 199
   1C0D C7                  387 	.db #0xc7	; 199
   1C0E C7                  388 	.db #0xc7	; 199
   1C0F C7                  389 	.db #0xc7	; 199
   1C10 C7                  390 	.db #0xc7	; 199
   1C11 C7                  391 	.db #0xc7	; 199
   1C12 C7                  392 	.db #0xc7	; 199
   1C13 C7                  393 	.db #0xc7	; 199
   1C14 C7                  394 	.db #0xc7	; 199
   1C15 C7                  395 	.db #0xc7	; 199
   1C16 C7                  396 	.db #0xc7	; 199
   1C17 C7                  397 	.db #0xc7	; 199
   1C18 C7                  398 	.db #0xc7	; 199
   1C19 C7                  399 	.db #0xc7	; 199
   1C1A C7                  400 	.db #0xc7	; 199
   1C1B AB                  401 	.db #0xab	; 171
   1C1C C7                  402 	.db #0xc7	; 199
   1C1D C7                  403 	.db #0xc7	; 199
   1C1E C7                  404 	.db #0xc7	; 199
   1C1F C7                  405 	.db #0xc7	; 199
   1C20 C7                  406 	.db #0xc7	; 199
   1C21 C7                  407 	.db #0xc7	; 199
   1C22 C7                  408 	.db #0xc7	; 199
   1C23 C7                  409 	.db #0xc7	; 199
   1C24 C7                  410 	.db #0xc7	; 199
   1C25 C7                  411 	.db #0xc7	; 199
   1C26 C7                  412 	.db #0xc7	; 199
   1C27 C7                  413 	.db #0xc7	; 199
   1C28 C7                  414 	.db #0xc7	; 199
   1C29 C7                  415 	.db #0xc7	; 199
   1C2A C7                  416 	.db #0xc7	; 199
   1C2B C7                  417 	.db #0xc7	; 199
   1C2C C7                  418 	.db #0xc7	; 199
   1C2D C7                  419 	.db #0xc7	; 199
   1C2E C7                  420 	.db #0xc7	; 199
   1C2F C7                  421 	.db #0xc7	; 199
   1C30 C7                  422 	.db #0xc7	; 199
   1C31 C7                  423 	.db #0xc7	; 199
   1C32 C7                  424 	.db #0xc7	; 199
   1C33 C7                  425 	.db #0xc7	; 199
   1C34 C7                  426 	.db #0xc7	; 199
   1C35 C7                  427 	.db #0xc7	; 199
   1C36 C7                  428 	.db #0xc7	; 199
   1C37 C7                  429 	.db #0xc7	; 199
   1C38 C7                  430 	.db #0xc7	; 199
   1C39 C7                  431 	.db #0xc7	; 199
   1C3A C7                  432 	.db #0xc7	; 199
   1C3B C7                  433 	.db #0xc7	; 199
   1C3C C7                  434 	.db #0xc7	; 199
   1C3D C7                  435 	.db #0xc7	; 199
   1C3E C7                  436 	.db #0xc7	; 199
   1C3F C7                  437 	.db #0xc7	; 199
   1C40 C7                  438 	.db #0xc7	; 199
   1C41 C7                  439 	.db #0xc7	; 199
   1C42 C7                  440 	.db #0xc7	; 199
   1C43 C7                  441 	.db #0xc7	; 199
   1C44 C7                  442 	.db #0xc7	; 199
   1C45 C7                  443 	.db #0xc7	; 199
   1C46 C7                  444 	.db #0xc7	; 199
   1C47 C7                  445 	.db #0xc7	; 199
   1C48 C7                  446 	.db #0xc7	; 199
   1C49 C7                  447 	.db #0xc7	; 199
   1C4A C7                  448 	.db #0xc7	; 199
   1C4B C7                  449 	.db #0xc7	; 199
   1C4C C7                  450 	.db #0xc7	; 199
   1C4D C7                  451 	.db #0xc7	; 199
   1C4E C7                  452 	.db #0xc7	; 199
   1C4F C7                  453 	.db #0xc7	; 199
   1C50 C7                  454 	.db #0xc7	; 199
   1C51 C7                  455 	.db #0xc7	; 199
   1C52 C7                  456 	.db #0xc7	; 199
   1C53 C7                  457 	.db #0xc7	; 199
   1C54 C7                  458 	.db #0xc7	; 199
   1C55 C7                  459 	.db #0xc7	; 199
   1C56 C7                  460 	.db #0xc7	; 199
   1C57 C7                  461 	.db #0xc7	; 199
   1C58 C7                  462 	.db #0xc7	; 199
   1C59 C7                  463 	.db #0xc7	; 199
   1C5A C7                  464 	.db #0xc7	; 199
   1C5B C7                  465 	.db #0xc7	; 199
   1C5C C7                  466 	.db #0xc7	; 199
   1C5D C7                  467 	.db #0xc7	; 199
   1C5E C7                  468 	.db #0xc7	; 199
   1C5F C7                  469 	.db #0xc7	; 199
   1C60 C7                  470 	.db #0xc7	; 199
   1C61 C7                  471 	.db #0xc7	; 199
   1C62 C7                  472 	.db #0xc7	; 199
   1C63 C7                  473 	.db #0xc7	; 199
   1C64 C7                  474 	.db #0xc7	; 199
   1C65 C7                  475 	.db #0xc7	; 199
   1C66 C7                  476 	.db #0xc7	; 199
   1C67 00                  477 	.db #0x00	; 0
   1C68 01                  478 	.db #0x01	; 1
   1C69 00                  479 	.db #0x00	; 0
   1C6A 01                  480 	.db #0x01	; 1
   1C6B 00                  481 	.db #0x00	; 0
   1C6C 01                  482 	.db #0x01	; 1
   1C6D 00                  483 	.db #0x00	; 0
   1C6E 01                  484 	.db #0x01	; 1
   1C6F 00                  485 	.db #0x00	; 0
   1C70 01                  486 	.db #0x01	; 1
   1C71 00                  487 	.db #0x00	; 0
   1C72 01                  488 	.db #0x01	; 1
   1C73 00                  489 	.db #0x00	; 0
   1C74 01                  490 	.db #0x01	; 1
   1C75 00                  491 	.db #0x00	; 0
   1C76 01                  492 	.db #0x01	; 1
   1C77 00                  493 	.db #0x00	; 0
   1C78 01                  494 	.db #0x01	; 1
   1C79 0A                  495 	.db #0x0a	; 10
   1C7A 0B                  496 	.db #0x0b	; 11
   1C7B 0A                  497 	.db #0x0a	; 10
   1C7C 0B                  498 	.db #0x0b	; 11
   1C7D 0A                  499 	.db #0x0a	; 10
   1C7E 0B                  500 	.db #0x0b	; 11
   1C7F 0A                  501 	.db #0x0a	; 10
   1C80 0B                  502 	.db #0x0b	; 11
   1C81 0A                  503 	.db #0x0a	; 10
   1C82 0B                  504 	.db #0x0b	; 11
   1C83 0A                  505 	.db #0x0a	; 10
   1C84 0B                  506 	.db #0x0b	; 11
   1C85 0A                  507 	.db #0x0a	; 10
   1C86 0B                  508 	.db #0x0b	; 11
   1C87 0A                  509 	.db #0x0a	; 10
   1C88 0B                  510 	.db #0x0b	; 11
   1C89 0A                  511 	.db #0x0a	; 10
   1C8A 0B                  512 	.db #0x0b	; 11
   1C8B 14                  513 	.db #0x14	; 20
   1C8C 15                  514 	.db #0x15	; 21
   1C8D 14                  515 	.db #0x14	; 20
   1C8E 15                  516 	.db #0x15	; 21
   1C8F 14                  517 	.db #0x14	; 20
   1C90 15                  518 	.db #0x15	; 21
   1C91 14                  519 	.db #0x14	; 20
   1C92 15                  520 	.db #0x15	; 21
   1C93 14                  521 	.db #0x14	; 20
   1C94 15                  522 	.db #0x15	; 21
   1C95 14                  523 	.db #0x14	; 20
   1C96 15                  524 	.db #0x15	; 21
   1C97 14                  525 	.db #0x14	; 20
   1C98 15                  526 	.db #0x15	; 21
   1C99 14                  527 	.db #0x14	; 20
   1C9A 15                  528 	.db #0x15	; 21
   1C9B 14                  529 	.db #0x14	; 20
   1C9C 15                  530 	.db #0x15	; 21
   1C9D 1E                  531 	.db #0x1e	; 30
   1C9E 1F                  532 	.db #0x1f	; 31
   1C9F 1E                  533 	.db #0x1e	; 30
   1CA0 1F                  534 	.db #0x1f	; 31
   1CA1 1E                  535 	.db #0x1e	; 30
   1CA2 1F                  536 	.db #0x1f	; 31
   1CA3 1E                  537 	.db #0x1e	; 30
   1CA4 1F                  538 	.db #0x1f	; 31
   1CA5 1E                  539 	.db #0x1e	; 30
   1CA6 1F                  540 	.db #0x1f	; 31
   1CA7 1E                  541 	.db #0x1e	; 30
   1CA8 1F                  542 	.db #0x1f	; 31
   1CA9 1E                  543 	.db #0x1e	; 30
   1CAA 1F                  544 	.db #0x1f	; 31
   1CAB 1E                  545 	.db #0x1e	; 30
   1CAC 1F                  546 	.db #0x1f	; 31
   1CAD 1E                  547 	.db #0x1e	; 30
   1CAE 1F                  548 	.db #0x1f	; 31
                            549 	.area _INITIALIZER
                            550 	.area _CABS (ABS)
