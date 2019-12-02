                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (CYGWIN)
                              4 ;--------------------------------------------------------
                              5 	.module fase_04
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_mapa04
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
   0AF7                      44 _g_mapa04:
   0AF7 8C                   45 	.db #0x8c	; 140
   0AF8 8C                   46 	.db #0x8c	; 140
   0AF9 8C                   47 	.db #0x8c	; 140
   0AFA 44                   48 	.db #0x44	; 68	'D'
   0AFB 8C                   49 	.db #0x8c	; 140
   0AFC 8C                   50 	.db #0x8c	; 140
   0AFD 8C                   51 	.db #0x8c	; 140
   0AFE 8C                   52 	.db #0x8c	; 140
   0AFF 8C                   53 	.db #0x8c	; 140
   0B00 8C                   54 	.db #0x8c	; 140
   0B01 8C                   55 	.db #0x8c	; 140
   0B02 8C                   56 	.db #0x8c	; 140
   0B03 8C                   57 	.db #0x8c	; 140
   0B04 8C                   58 	.db #0x8c	; 140
   0B05 8C                   59 	.db #0x8c	; 140
   0B06 8C                   60 	.db #0x8c	; 140
   0B07 4E                   61 	.db #0x4e	; 78	'N'
   0B08 8C                   62 	.db #0x8c	; 140
   0B09 8C                   63 	.db #0x8c	; 140
   0B0A 30                   64 	.db #0x30	; 48	'0'
   0B0B 8C                   65 	.db #0x8c	; 140
   0B0C 4E                   66 	.db #0x4e	; 78	'N'
   0B0D 8C                   67 	.db #0x8c	; 140
   0B0E 8C                   68 	.db #0x8c	; 140
   0B0F 8C                   69 	.db #0x8c	; 140
   0B10 03                   70 	.db #0x03	; 3
   0B11 8C                   71 	.db #0x8c	; 140
   0B12 A5                   72 	.db #0xa5	; 165
   0B13 8C                   73 	.db #0x8c	; 140
   0B14 8C                   74 	.db #0x8c	; 140
   0B15 8C                   75 	.db #0x8c	; 140
   0B16 08                   76 	.db #0x08	; 8
   0B17 09                   77 	.db #0x09	; 9
   0B18 8C                   78 	.db #0x8c	; 140
   0B19 8C                   79 	.db #0x8c	; 140
   0B1A 44                   80 	.db #0x44	; 68	'D'
   0B1B 8C                   81 	.db #0x8c	; 140
   0B1C 3A                   82 	.db #0x3a	; 58
   0B1D A5                   83 	.db #0xa5	; 165
   0B1E 8C                   84 	.db #0x8c	; 140
   0B1F 8C                   85 	.db #0x8c	; 140
   0B20 8C                   86 	.db #0x8c	; 140
   0B21 8C                   87 	.db #0x8c	; 140
   0B22 0D                   88 	.db #0x0d	; 13
   0B23 8C                   89 	.db #0x8c	; 140
   0B24 AF                   90 	.db #0xaf	; 175
   0B25 8C                   91 	.db #0x8c	; 140
   0B26 8C                   92 	.db #0x8c	; 140
   0B27 30                   93 	.db #0x30	; 48	'0'
   0B28 12                   94 	.db #0x12	; 18
   0B29 13                   95 	.db #0x13	; 19
   0B2A 8C                   96 	.db #0x8c	; 140
   0B2B 8C                   97 	.db #0x8c	; 140
   0B2C 4E                   98 	.db #0x4e	; 78	'N'
   0B2D 8C                   99 	.db #0x8c	; 140
   0B2E 8C                  100 	.db #0x8c	; 140
   0B2F AF                  101 	.db #0xaf	; 175
   0B30 8C                  102 	.db #0x8c	; 140
   0B31 8C                  103 	.db #0x8c	; 140
   0B32 8C                  104 	.db #0x8c	; 140
   0B33 8C                  105 	.db #0x8c	; 140
   0B34 8C                  106 	.db #0x8c	; 140
   0B35 8C                  107 	.db #0x8c	; 140
   0B36 8C                  108 	.db #0x8c	; 140
   0B37 8C                  109 	.db #0x8c	; 140
   0B38 8C                  110 	.db #0x8c	; 140
   0B39 3A                  111 	.db #0x3a	; 58
   0B3A 1C                  112 	.db #0x1c	; 28
   0B3B 1D                  113 	.db #0x1d	; 29
   0B3C 8C                  114 	.db #0x8c	; 140
   0B3D 8C                  115 	.db #0x8c	; 140
   0B3E 8C                  116 	.db #0x8c	; 140
   0B3F 8C                  117 	.db #0x8c	; 140
   0B40 8C                  118 	.db #0x8c	; 140
   0B41 8C                  119 	.db #0x8c	; 140
   0B42 8C                  120 	.db #0x8c	; 140
   0B43 8C                  121 	.db #0x8c	; 140
   0B44 8C                  122 	.db #0x8c	; 140
   0B45 44                  123 	.db #0x44	; 68	'D'
   0B46 8C                  124 	.db #0x8c	; 140
   0B47 8C                  125 	.db #0x8c	; 140
   0B48 8C                  126 	.db #0x8c	; 140
   0B49 8C                  127 	.db #0x8c	; 140
   0B4A 8C                  128 	.db #0x8c	; 140
   0B4B 8C                  129 	.db #0x8c	; 140
   0B4C 26                  130 	.db #0x26	; 38
   0B4D 27                  131 	.db #0x27	; 39
   0B4E 8C                  132 	.db #0x8c	; 140
   0B4F 8C                  133 	.db #0x8c	; 140
   0B50 A5                  134 	.db #0xa5	; 165
   0B51 8C                  135 	.db #0x8c	; 140
   0B52 8C                  136 	.db #0x8c	; 140
   0B53 8C                  137 	.db #0x8c	; 140
   0B54 8C                  138 	.db #0x8c	; 140
   0B55 8C                  139 	.db #0x8c	; 140
   0B56 8C                  140 	.db #0x8c	; 140
   0B57 4E                  141 	.db #0x4e	; 78	'N'
   0B58 8C                  142 	.db #0x8c	; 140
   0B59 8C                  143 	.db #0x8c	; 140
   0B5A 8C                  144 	.db #0x8c	; 140
   0B5B 8C                  145 	.db #0x8c	; 140
   0B5C 8C                  146 	.db #0x8c	; 140
   0B5D 8C                  147 	.db #0x8c	; 140
   0B5E 8C                  148 	.db #0x8c	; 140
   0B5F 8C                  149 	.db #0x8c	; 140
   0B60 8C                  150 	.db #0x8c	; 140
   0B61 8C                  151 	.db #0x8c	; 140
   0B62 AF                  152 	.db #0xaf	; 175
   0B63 8C                  153 	.db #0x8c	; 140
   0B64 30                  154 	.db #0x30	; 48	'0'
   0B65 8C                  155 	.db #0x8c	; 140
   0B66 8C                  156 	.db #0x8c	; 140
   0B67 8C                  157 	.db #0x8c	; 140
   0B68 8C                  158 	.db #0x8c	; 140
   0B69 8C                  159 	.db #0x8c	; 140
   0B6A 8C                  160 	.db #0x8c	; 140
   0B6B 8C                  161 	.db #0x8c	; 140
   0B6C 8C                  162 	.db #0x8c	; 140
   0B6D 8C                  163 	.db #0x8c	; 140
   0B6E 8C                  164 	.db #0x8c	; 140
   0B6F 8C                  165 	.db #0x8c	; 140
   0B70 8C                  166 	.db #0x8c	; 140
   0B71 8C                  167 	.db #0x8c	; 140
   0B72 8C                  168 	.db #0x8c	; 140
   0B73 8C                  169 	.db #0x8c	; 140
   0B74 8C                  170 	.db #0x8c	; 140
   0B75 8C                  171 	.db #0x8c	; 140
   0B76 3A                  172 	.db #0x3a	; 58
   0B77 8C                  173 	.db #0x8c	; 140
   0B78 8C                  174 	.db #0x8c	; 140
   0B79 8C                  175 	.db #0x8c	; 140
   0B7A 8C                  176 	.db #0x8c	; 140
   0B7B 8C                  177 	.db #0x8c	; 140
   0B7C 8C                  178 	.db #0x8c	; 140
   0B7D 8C                  179 	.db #0x8c	; 140
   0B7E 8C                  180 	.db #0x8c	; 140
   0B7F 8C                  181 	.db #0x8c	; 140
   0B80 8C                  182 	.db #0x8c	; 140
   0B81 8C                  183 	.db #0x8c	; 140
   0B82 8C                  184 	.db #0x8c	; 140
   0B83 8C                  185 	.db #0x8c	; 140
   0B84 8C                  186 	.db #0x8c	; 140
   0B85 8C                  187 	.db #0x8c	; 140
   0B86 8C                  188 	.db #0x8c	; 140
   0B87 8C                  189 	.db #0x8c	; 140
   0B88 8C                  190 	.db #0x8c	; 140
   0B89 8C                  191 	.db #0x8c	; 140
   0B8A 8C                  192 	.db #0x8c	; 140
   0B8B 8C                  193 	.db #0x8c	; 140
   0B8C 8C                  194 	.db #0x8c	; 140
   0B8D 8C                  195 	.db #0x8c	; 140
   0B8E 8C                  196 	.db #0x8c	; 140
   0B8F 8C                  197 	.db #0x8c	; 140
   0B90 8C                  198 	.db #0x8c	; 140
   0B91 24                  199 	.db #0x24	; 36
   0B92 8C                  200 	.db #0x8c	; 140
   0B93 8C                  201 	.db #0x8c	; 140
   0B94 8C                  202 	.db #0x8c	; 140
   0B95 8C                  203 	.db #0x8c	; 140
   0B96 8C                  204 	.db #0x8c	; 140
   0B97 8C                  205 	.db #0x8c	; 140
   0B98 8C                  206 	.db #0x8c	; 140
   0B99 8C                  207 	.db #0x8c	; 140
   0B9A 8C                  208 	.db #0x8c	; 140
   0B9B 8C                  209 	.db #0x8c	; 140
   0B9C 8C                  210 	.db #0x8c	; 140
   0B9D 8C                  211 	.db #0x8c	; 140
   0B9E 8C                  212 	.db #0x8c	; 140
   0B9F 8C                  213 	.db #0x8c	; 140
   0BA0 8C                  214 	.db #0x8c	; 140
   0BA1 8C                  215 	.db #0x8c	; 140
   0BA2 8C                  216 	.db #0x8c	; 140
   0BA3 A5                  217 	.db #0xa5	; 165
   0BA4 8C                  218 	.db #0x8c	; 140
   0BA5 8C                  219 	.db #0x8c	; 140
   0BA6 8C                  220 	.db #0x8c	; 140
   0BA7 8C                  221 	.db #0x8c	; 140
   0BA8 8C                  222 	.db #0x8c	; 140
   0BA9 8C                  223 	.db #0x8c	; 140
   0BAA 8C                  224 	.db #0x8c	; 140
   0BAB 8C                  225 	.db #0x8c	; 140
   0BAC 8C                  226 	.db #0x8c	; 140
   0BAD 8C                  227 	.db #0x8c	; 140
   0BAE 8C                  228 	.db #0x8c	; 140
   0BAF 8C                  229 	.db #0x8c	; 140
   0BB0 8C                  230 	.db #0x8c	; 140
   0BB1 8C                  231 	.db #0x8c	; 140
   0BB2 8C                  232 	.db #0x8c	; 140
   0BB3 8C                  233 	.db #0x8c	; 140
   0BB4 8C                  234 	.db #0x8c	; 140
   0BB5 AF                  235 	.db #0xaf	; 175
   0BB6 8C                  236 	.db #0x8c	; 140
   0BB7 8C                  237 	.db #0x8c	; 140
   0BB8 8C                  238 	.db #0x8c	; 140
   0BB9 8C                  239 	.db #0x8c	; 140
   0BBA 8C                  240 	.db #0x8c	; 140
   0BBB 8C                  241 	.db #0x8c	; 140
   0BBC 8C                  242 	.db #0x8c	; 140
   0BBD 8C                  243 	.db #0x8c	; 140
   0BBE 8C                  244 	.db #0x8c	; 140
   0BBF 8C                  245 	.db #0x8c	; 140
   0BC0 8C                  246 	.db #0x8c	; 140
   0BC1 8C                  247 	.db #0x8c	; 140
   0BC2 8C                  248 	.db #0x8c	; 140
   0BC3 8C                  249 	.db #0x8c	; 140
   0BC4 8C                  250 	.db #0x8c	; 140
   0BC5 8C                  251 	.db #0x8c	; 140
   0BC6 8C                  252 	.db #0x8c	; 140
   0BC7 8C                  253 	.db #0x8c	; 140
   0BC8 8C                  254 	.db #0x8c	; 140
   0BC9 8C                  255 	.db #0x8c	; 140
   0BCA 8C                  256 	.db #0x8c	; 140
   0BCB 8C                  257 	.db #0x8c	; 140
   0BCC 8C                  258 	.db #0x8c	; 140
   0BCD 8C                  259 	.db #0x8c	; 140
   0BCE 8C                  260 	.db #0x8c	; 140
   0BCF 8C                  261 	.db #0x8c	; 140
   0BD0 8C                  262 	.db #0x8c	; 140
   0BD1 8C                  263 	.db #0x8c	; 140
   0BD2 8C                  264 	.db #0x8c	; 140
   0BD3 8C                  265 	.db #0x8c	; 140
   0BD4 8C                  266 	.db #0x8c	; 140
   0BD5 8C                  267 	.db #0x8c	; 140
   0BD6 8C                  268 	.db #0x8c	; 140
   0BD7 8C                  269 	.db #0x8c	; 140
   0BD8 8C                  270 	.db #0x8c	; 140
   0BD9 8C                  271 	.db #0x8c	; 140
   0BDA 8C                  272 	.db #0x8c	; 140
   0BDB 8C                  273 	.db #0x8c	; 140
   0BDC 8C                  274 	.db #0x8c	; 140
   0BDD 50                  275 	.db #0x50	; 80	'P'
   0BDE 51                  276 	.db #0x51	; 81	'Q'
   0BDF 52                  277 	.db #0x52	; 82	'R'
   0BE0 53                  278 	.db #0x53	; 83	'S'
   0BE1 8C                  279 	.db #0x8c	; 140
   0BE2 8C                  280 	.db #0x8c	; 140
   0BE3 8C                  281 	.db #0x8c	; 140
   0BE4 8C                  282 	.db #0x8c	; 140
   0BE5 8C                  283 	.db #0x8c	; 140
   0BE6 8C                  284 	.db #0x8c	; 140
   0BE7 8C                  285 	.db #0x8c	; 140
   0BE8 8C                  286 	.db #0x8c	; 140
   0BE9 8C                  287 	.db #0x8c	; 140
   0BEA 8C                  288 	.db #0x8c	; 140
   0BEB 8C                  289 	.db #0x8c	; 140
   0BEC 8C                  290 	.db #0x8c	; 140
   0BED 8C                  291 	.db #0x8c	; 140
   0BEE 8C                  292 	.db #0x8c	; 140
   0BEF 5A                  293 	.db #0x5a	; 90	'Z'
   0BF0 5B                  294 	.db #0x5b	; 91
   0BF1 5C                  295 	.db #0x5c	; 92
   0BF2 5D                  296 	.db #0x5d	; 93
   0BF3 51                  297 	.db #0x51	; 81	'Q'
   0BF4 52                  298 	.db #0x52	; 82	'R'
   0BF5 53                  299 	.db #0x53	; 83	'S'
   0BF6 8C                  300 	.db #0x8c	; 140
   0BF7 8C                  301 	.db #0x8c	; 140
   0BF8 8C                  302 	.db #0x8c	; 140
   0BF9 8C                  303 	.db #0x8c	; 140
   0BFA 8C                  304 	.db #0x8c	; 140
   0BFB 8C                  305 	.db #0x8c	; 140
   0BFC 8C                  306 	.db #0x8c	; 140
   0BFD 8C                  307 	.db #0x8c	; 140
   0BFE 8C                  308 	.db #0x8c	; 140
   0BFF 8C                  309 	.db #0x8c	; 140
   0C00 8C                  310 	.db #0x8c	; 140
   0C01 64                  311 	.db #0x64	; 100	'd'
   0C02 65                  312 	.db #0x65	; 101	'e'
   0C03 66                  313 	.db #0x66	; 102	'f'
   0C04 67                  314 	.db #0x67	; 103	'g'
   0C05 5B                  315 	.db #0x5b	; 91
   0C06 5C                  316 	.db #0x5c	; 92
   0C07 5D                  317 	.db #0x5d	; 93
   0C08 8C                  318 	.db #0x8c	; 140
   0C09 8C                  319 	.db #0x8c	; 140
   0C0A 8C                  320 	.db #0x8c	; 140
   0C0B 8C                  321 	.db #0x8c	; 140
   0C0C 8C                  322 	.db #0x8c	; 140
   0C0D 8C                  323 	.db #0x8c	; 140
   0C0E 8C                  324 	.db #0x8c	; 140
   0C0F 8C                  325 	.db #0x8c	; 140
   0C10 8C                  326 	.db #0x8c	; 140
   0C11 8C                  327 	.db #0x8c	; 140
   0C12 8C                  328 	.db #0x8c	; 140
   0C13 6E                  329 	.db #0x6e	; 110	'n'
   0C14 6F                  330 	.db #0x6f	; 111	'o'
   0C15 70                  331 	.db #0x70	; 112	'p'
   0C16 71                  332 	.db #0x71	; 113	'q'
   0C17 65                  333 	.db #0x65	; 101	'e'
   0C18 66                  334 	.db #0x66	; 102	'f'
   0C19 67                  335 	.db #0x67	; 103	'g'
   0C1A 8C                  336 	.db #0x8c	; 140
   0C1B 8C                  337 	.db #0x8c	; 140
   0C1C 8C                  338 	.db #0x8c	; 140
   0C1D 8C                  339 	.db #0x8c	; 140
   0C1E 8C                  340 	.db #0x8c	; 140
   0C1F 8C                  341 	.db #0x8c	; 140
   0C20 8C                  342 	.db #0x8c	; 140
   0C21 8C                  343 	.db #0x8c	; 140
   0C22 8C                  344 	.db #0x8c	; 140
   0C23 8C                  345 	.db #0x8c	; 140
   0C24 8C                  346 	.db #0x8c	; 140
   0C25 78                  347 	.db #0x78	; 120	'x'
   0C26 79                  348 	.db #0x79	; 121	'y'
   0C27 7A                  349 	.db #0x7a	; 122	'z'
   0C28 8C                  350 	.db #0x8c	; 140
   0C29 6F                  351 	.db #0x6f	; 111	'o'
   0C2A 70                  352 	.db #0x70	; 112	'p'
   0C2B 71                  353 	.db #0x71	; 113	'q'
   0C2C 8C                  354 	.db #0x8c	; 140
   0C2D 8C                  355 	.db #0x8c	; 140
   0C2E 8C                  356 	.db #0x8c	; 140
   0C2F 8C                  357 	.db #0x8c	; 140
   0C30 8C                  358 	.db #0x8c	; 140
   0C31 8C                  359 	.db #0x8c	; 140
   0C32 8C                  360 	.db #0x8c	; 140
   0C33 8C                  361 	.db #0x8c	; 140
   0C34 8C                  362 	.db #0x8c	; 140
   0C35 8C                  363 	.db #0x8c	; 140
   0C36 8C                  364 	.db #0x8c	; 140
   0C37 82                  365 	.db #0x82	; 130
   0C38 83                  366 	.db #0x83	; 131
   0C39 84                  367 	.db #0x84	; 132
   0C3A 8C                  368 	.db #0x8c	; 140
   0C3B 79                  369 	.db #0x79	; 121	'y'
   0C3C 7A                  370 	.db #0x7a	; 122	'z'
   0C3D 8C                  371 	.db #0x8c	; 140
   0C3E 8C                  372 	.db #0x8c	; 140
   0C3F 8C                  373 	.db #0x8c	; 140
   0C40 8C                  374 	.db #0x8c	; 140
   0C41 8C                  375 	.db #0x8c	; 140
   0C42 8C                  376 	.db #0x8c	; 140
   0C43 8C                  377 	.db #0x8c	; 140
   0C44 8C                  378 	.db #0x8c	; 140
   0C45 8C                  379 	.db #0x8c	; 140
   0C46 8C                  380 	.db #0x8c	; 140
   0C47 8C                  381 	.db #0x8c	; 140
   0C48 8C                  382 	.db #0x8c	; 140
   0C49 8C                  383 	.db #0x8c	; 140
   0C4A 8D                  384 	.db #0x8d	; 141
   0C4B 8E                  385 	.db #0x8e	; 142
   0C4C 8C                  386 	.db #0x8c	; 140
   0C4D 83                  387 	.db #0x83	; 131
   0C4E 84                  388 	.db #0x84	; 132
   0C4F 8C                  389 	.db #0x8c	; 140
   0C50 8C                  390 	.db #0x8c	; 140
   0C51 8C                  391 	.db #0x8c	; 140
   0C52 8C                  392 	.db #0x8c	; 140
   0C53 8C                  393 	.db #0x8c	; 140
   0C54 8C                  394 	.db #0x8c	; 140
   0C55 8C                  395 	.db #0x8c	; 140
   0C56 8C                  396 	.db #0x8c	; 140
   0C57 8C                  397 	.db #0x8c	; 140
   0C58 8C                  398 	.db #0x8c	; 140
   0C59 8C                  399 	.db #0x8c	; 140
   0C5A 8C                  400 	.db #0x8c	; 140
   0C5B 96                  401 	.db #0x96	; 150
   0C5C 97                  402 	.db #0x97	; 151
   0C5D 98                  403 	.db #0x98	; 152
   0C5E 8C                  404 	.db #0x8c	; 140
   0C5F 8D                  405 	.db #0x8d	; 141
   0C60 8E                  406 	.db #0x8e	; 142
   0C61 8C                  407 	.db #0x8c	; 140
   0C62 8C                  408 	.db #0x8c	; 140
   0C63 8C                  409 	.db #0x8c	; 140
   0C64 8C                  410 	.db #0x8c	; 140
   0C65 8C                  411 	.db #0x8c	; 140
   0C66 8C                  412 	.db #0x8c	; 140
   0C67 8C                  413 	.db #0x8c	; 140
   0C68 8C                  414 	.db #0x8c	; 140
   0C69 8C                  415 	.db #0x8c	; 140
   0C6A 8C                  416 	.db #0x8c	; 140
   0C6B 8C                  417 	.db #0x8c	; 140
   0C6C 8C                  418 	.db #0x8c	; 140
   0C6D A0                  419 	.db #0xa0	; 160
   0C6E A1                  420 	.db #0xa1	; 161
   0C6F 8C                  421 	.db #0x8c	; 140
   0C70 8C                  422 	.db #0x8c	; 140
   0C71 97                  423 	.db #0x97	; 151
   0C72 98                  424 	.db #0x98	; 152
   0C73 8C                  425 	.db #0x8c	; 140
   0C74 8C                  426 	.db #0x8c	; 140
   0C75 8C                  427 	.db #0x8c	; 140
   0C76 8C                  428 	.db #0x8c	; 140
   0C77 8C                  429 	.db #0x8c	; 140
   0C78 8C                  430 	.db #0x8c	; 140
   0C79 8C                  431 	.db #0x8c	; 140
   0C7A 8C                  432 	.db #0x8c	; 140
   0C7B 8C                  433 	.db #0x8c	; 140
   0C7C 8C                  434 	.db #0x8c	; 140
   0C7D 8C                  435 	.db #0x8c	; 140
   0C7E 8C                  436 	.db #0x8c	; 140
   0C7F AA                  437 	.db #0xaa	; 170
   0C80 AB                  438 	.db #0xab	; 171
   0C81 8C                  439 	.db #0x8c	; 140
   0C82 8C                  440 	.db #0x8c	; 140
   0C83 A1                  441 	.db #0xa1	; 161
   0C84 8C                  442 	.db #0x8c	; 140
   0C85 8C                  443 	.db #0x8c	; 140
   0C86 8C                  444 	.db #0x8c	; 140
   0C87 8C                  445 	.db #0x8c	; 140
   0C88 8C                  446 	.db #0x8c	; 140
   0C89 8C                  447 	.db #0x8c	; 140
   0C8A 8C                  448 	.db #0x8c	; 140
   0C8B 8C                  449 	.db #0x8c	; 140
   0C8C 8C                  450 	.db #0x8c	; 140
   0C8D 8C                  451 	.db #0x8c	; 140
   0C8E 8C                  452 	.db #0x8c	; 140
   0C8F 8C                  453 	.db #0x8c	; 140
   0C90 8C                  454 	.db #0x8c	; 140
   0C91 B4                  455 	.db #0xb4	; 180
   0C92 B5                  456 	.db #0xb5	; 181
   0C93 8C                  457 	.db #0x8c	; 140
   0C94 8C                  458 	.db #0x8c	; 140
   0C95 AB                  459 	.db #0xab	; 171
   0C96 8C                  460 	.db #0x8c	; 140
   0C97 8C                  461 	.db #0x8c	; 140
   0C98 8C                  462 	.db #0x8c	; 140
   0C99 8C                  463 	.db #0x8c	; 140
   0C9A 8C                  464 	.db #0x8c	; 140
   0C9B 8C                  465 	.db #0x8c	; 140
   0C9C 8C                  466 	.db #0x8c	; 140
   0C9D 8C                  467 	.db #0x8c	; 140
   0C9E 8C                  468 	.db #0x8c	; 140
   0C9F 8C                  469 	.db #0x8c	; 140
   0CA0 8C                  470 	.db #0x8c	; 140
   0CA1 8C                  471 	.db #0x8c	; 140
   0CA2 8C                  472 	.db #0x8c	; 140
   0CA3 BE                  473 	.db #0xbe	; 190
   0CA4 BF                  474 	.db #0xbf	; 191
   0CA5 8C                  475 	.db #0x8c	; 140
   0CA6 8C                  476 	.db #0x8c	; 140
   0CA7 00                  477 	.db #0x00	; 0
   0CA8 01                  478 	.db #0x01	; 1
   0CA9 00                  479 	.db #0x00	; 0
   0CAA 01                  480 	.db #0x01	; 1
   0CAB 00                  481 	.db #0x00	; 0
   0CAC 01                  482 	.db #0x01	; 1
   0CAD 00                  483 	.db #0x00	; 0
   0CAE 01                  484 	.db #0x01	; 1
   0CAF 00                  485 	.db #0x00	; 0
   0CB0 01                  486 	.db #0x01	; 1
   0CB1 00                  487 	.db #0x00	; 0
   0CB2 01                  488 	.db #0x01	; 1
   0CB3 00                  489 	.db #0x00	; 0
   0CB4 01                  490 	.db #0x01	; 1
   0CB5 00                  491 	.db #0x00	; 0
   0CB6 01                  492 	.db #0x01	; 1
   0CB7 00                  493 	.db #0x00	; 0
   0CB8 01                  494 	.db #0x01	; 1
   0CB9 0A                  495 	.db #0x0a	; 10
   0CBA 0B                  496 	.db #0x0b	; 11
   0CBB 0A                  497 	.db #0x0a	; 10
   0CBC 0B                  498 	.db #0x0b	; 11
   0CBD 0A                  499 	.db #0x0a	; 10
   0CBE 0B                  500 	.db #0x0b	; 11
   0CBF 0A                  501 	.db #0x0a	; 10
   0CC0 0B                  502 	.db #0x0b	; 11
   0CC1 0A                  503 	.db #0x0a	; 10
   0CC2 0B                  504 	.db #0x0b	; 11
   0CC3 0A                  505 	.db #0x0a	; 10
   0CC4 0B                  506 	.db #0x0b	; 11
   0CC5 0A                  507 	.db #0x0a	; 10
   0CC6 0B                  508 	.db #0x0b	; 11
   0CC7 0A                  509 	.db #0x0a	; 10
   0CC8 0B                  510 	.db #0x0b	; 11
   0CC9 0A                  511 	.db #0x0a	; 10
   0CCA 0B                  512 	.db #0x0b	; 11
   0CCB 14                  513 	.db #0x14	; 20
   0CCC 15                  514 	.db #0x15	; 21
   0CCD 14                  515 	.db #0x14	; 20
   0CCE 15                  516 	.db #0x15	; 21
   0CCF 14                  517 	.db #0x14	; 20
   0CD0 15                  518 	.db #0x15	; 21
   0CD1 14                  519 	.db #0x14	; 20
   0CD2 15                  520 	.db #0x15	; 21
   0CD3 14                  521 	.db #0x14	; 20
   0CD4 15                  522 	.db #0x15	; 21
   0CD5 14                  523 	.db #0x14	; 20
   0CD6 15                  524 	.db #0x15	; 21
   0CD7 14                  525 	.db #0x14	; 20
   0CD8 15                  526 	.db #0x15	; 21
   0CD9 14                  527 	.db #0x14	; 20
   0CDA 15                  528 	.db #0x15	; 21
   0CDB 14                  529 	.db #0x14	; 20
   0CDC 15                  530 	.db #0x15	; 21
   0CDD 1E                  531 	.db #0x1e	; 30
   0CDE 1F                  532 	.db #0x1f	; 31
   0CDF 1E                  533 	.db #0x1e	; 30
   0CE0 1F                  534 	.db #0x1f	; 31
   0CE1 1E                  535 	.db #0x1e	; 30
   0CE2 1F                  536 	.db #0x1f	; 31
   0CE3 1E                  537 	.db #0x1e	; 30
   0CE4 1F                  538 	.db #0x1f	; 31
   0CE5 1E                  539 	.db #0x1e	; 30
   0CE6 1F                  540 	.db #0x1f	; 31
   0CE7 1E                  541 	.db #0x1e	; 30
   0CE8 1F                  542 	.db #0x1f	; 31
   0CE9 1E                  543 	.db #0x1e	; 30
   0CEA 1F                  544 	.db #0x1f	; 31
   0CEB 1E                  545 	.db #0x1e	; 30
   0CEC 1F                  546 	.db #0x1f	; 31
   0CED 1E                  547 	.db #0x1e	; 30
   0CEE 1F                  548 	.db #0x1f	; 31
                            549 	.area _INITIALIZER
                            550 	.area _CABS (ABS)
