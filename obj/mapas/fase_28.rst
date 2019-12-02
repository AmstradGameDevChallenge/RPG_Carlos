                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (CYGWIN)
                              4 ;--------------------------------------------------------
                              5 	.module fase_28
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_mapa28
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
   3A37                      44 _g_mapa28:
   3A37 28                   45 	.db #0x28	; 40
   3A38 28                   46 	.db #0x28	; 40
   3A39 C7                   47 	.db #0xc7	; 199
   3A3A C7                   48 	.db #0xc7	; 199
   3A3B C7                   49 	.db #0xc7	; 199
   3A3C C7                   50 	.db #0xc7	; 199
   3A3D C7                   51 	.db #0xc7	; 199
   3A3E C7                   52 	.db #0xc7	; 199
   3A3F C7                   53 	.db #0xc7	; 199
   3A40 C7                   54 	.db #0xc7	; 199
   3A41 C7                   55 	.db #0xc7	; 199
   3A42 C7                   56 	.db #0xc7	; 199
   3A43 C7                   57 	.db #0xc7	; 199
   3A44 C7                   58 	.db #0xc7	; 199
   3A45 C7                   59 	.db #0xc7	; 199
   3A46 C7                   60 	.db #0xc7	; 199
   3A47 29                   61 	.db #0x29	; 41
   3A48 29                   62 	.db #0x29	; 41
   3A49 32                   63 	.db #0x32	; 50	'2'
   3A4A 32                   64 	.db #0x32	; 50	'2'
   3A4B C7                   65 	.db #0xc7	; 199
   3A4C C7                   66 	.db #0xc7	; 199
   3A4D C7                   67 	.db #0xc7	; 199
   3A4E C7                   68 	.db #0xc7	; 199
   3A4F C7                   69 	.db #0xc7	; 199
   3A50 C7                   70 	.db #0xc7	; 199
   3A51 C7                   71 	.db #0xc7	; 199
   3A52 C7                   72 	.db #0xc7	; 199
   3A53 C7                   73 	.db #0xc7	; 199
   3A54 C7                   74 	.db #0xc7	; 199
   3A55 C7                   75 	.db #0xc7	; 199
   3A56 C7                   76 	.db #0xc7	; 199
   3A57 C7                   77 	.db #0xc7	; 199
   3A58 C7                   78 	.db #0xc7	; 199
   3A59 33                   79 	.db #0x33	; 51	'3'
   3A5A 33                   80 	.db #0x33	; 51	'3'
   3A5B 28                   81 	.db #0x28	; 40
   3A5C C7                   82 	.db #0xc7	; 199
   3A5D C7                   83 	.db #0xc7	; 199
   3A5E C7                   84 	.db #0xc7	; 199
   3A5F C7                   85 	.db #0xc7	; 199
   3A60 C7                   86 	.db #0xc7	; 199
   3A61 C7                   87 	.db #0xc7	; 199
   3A62 C7                   88 	.db #0xc7	; 199
   3A63 C7                   89 	.db #0xc7	; 199
   3A64 C7                   90 	.db #0xc7	; 199
   3A65 C7                   91 	.db #0xc7	; 199
   3A66 40                   92 	.db #0x40	; 64
   3A67 41                   93 	.db #0x41	; 65	'A'
   3A68 42                   94 	.db #0x42	; 66	'B'
   3A69 C7                   95 	.db #0xc7	; 199
   3A6A C7                   96 	.db #0xc7	; 199
   3A6B C7                   97 	.db #0xc7	; 199
   3A6C C7                   98 	.db #0xc7	; 199
   3A6D 32                   99 	.db #0x32	; 50	'2'
   3A6E C7                  100 	.db #0xc7	; 199
   3A6F C7                  101 	.db #0xc7	; 199
   3A70 C7                  102 	.db #0xc7	; 199
   3A71 C7                  103 	.db #0xc7	; 199
   3A72 C7                  104 	.db #0xc7	; 199
   3A73 C7                  105 	.db #0xc7	; 199
   3A74 C7                  106 	.db #0xc7	; 199
   3A75 C7                  107 	.db #0xc7	; 199
   3A76 C7                  108 	.db #0xc7	; 199
   3A77 C7                  109 	.db #0xc7	; 199
   3A78 4A                  110 	.db #0x4a	; 74	'J'
   3A79 4B                  111 	.db #0x4b	; 75	'K'
   3A7A 4C                  112 	.db #0x4c	; 76	'L'
   3A7B C7                  113 	.db #0xc7	; 199
   3A7C C7                  114 	.db #0xc7	; 199
   3A7D C7                  115 	.db #0xc7	; 199
   3A7E 33                  116 	.db #0x33	; 51	'3'
   3A7F C7                  117 	.db #0xc7	; 199
   3A80 C7                  118 	.db #0xc7	; 199
   3A81 C7                  119 	.db #0xc7	; 199
   3A82 C7                  120 	.db #0xc7	; 199
   3A83 C7                  121 	.db #0xc7	; 199
   3A84 C7                  122 	.db #0xc7	; 199
   3A85 C7                  123 	.db #0xc7	; 199
   3A86 C7                  124 	.db #0xc7	; 199
   3A87 C7                  125 	.db #0xc7	; 199
   3A88 C7                  126 	.db #0xc7	; 199
   3A89 C7                  127 	.db #0xc7	; 199
   3A8A 54                  128 	.db #0x54	; 84	'T'
   3A8B C7                  129 	.db #0xc7	; 199
   3A8C 56                  130 	.db #0x56	; 86	'V'
   3A8D C7                  131 	.db #0xc7	; 199
   3A8E C7                  132 	.db #0xc7	; 199
   3A8F C7                  133 	.db #0xc7	; 199
   3A90 C7                  134 	.db #0xc7	; 199
   3A91 C7                  135 	.db #0xc7	; 199
   3A92 C7                  136 	.db #0xc7	; 199
   3A93 C7                  137 	.db #0xc7	; 199
   3A94 C7                  138 	.db #0xc7	; 199
   3A95 C7                  139 	.db #0xc7	; 199
   3A96 C7                  140 	.db #0xc7	; 199
   3A97 C7                  141 	.db #0xc7	; 199
   3A98 C7                  142 	.db #0xc7	; 199
   3A99 C7                  143 	.db #0xc7	; 199
   3A9A C7                  144 	.db #0xc7	; 199
   3A9B C7                  145 	.db #0xc7	; 199
   3A9C 5E                  146 	.db #0x5e	; 94
   3A9D C7                  147 	.db #0xc7	; 199
   3A9E 60                  148 	.db #0x60	; 96
   3A9F C7                  149 	.db #0xc7	; 199
   3AA0 C7                  150 	.db #0xc7	; 199
   3AA1 C7                  151 	.db #0xc7	; 199
   3AA2 C7                  152 	.db #0xc7	; 199
   3AA3 C7                  153 	.db #0xc7	; 199
   3AA4 C7                  154 	.db #0xc7	; 199
   3AA5 C7                  155 	.db #0xc7	; 199
   3AA6 C7                  156 	.db #0xc7	; 199
   3AA7 C7                  157 	.db #0xc7	; 199
   3AA8 C7                  158 	.db #0xc7	; 199
   3AA9 C7                  159 	.db #0xc7	; 199
   3AAA C7                  160 	.db #0xc7	; 199
   3AAB C7                  161 	.db #0xc7	; 199
   3AAC C7                  162 	.db #0xc7	; 199
   3AAD C7                  163 	.db #0xc7	; 199
   3AAE 40                  164 	.db #0x40	; 64
   3AAF 41                  165 	.db #0x41	; 65	'A'
   3AB0 42                  166 	.db #0x42	; 66	'B'
   3AB1 C7                  167 	.db #0xc7	; 199
   3AB2 C7                  168 	.db #0xc7	; 199
   3AB3 C7                  169 	.db #0xc7	; 199
   3AB4 C7                  170 	.db #0xc7	; 199
   3AB5 C7                  171 	.db #0xc7	; 199
   3AB6 C7                  172 	.db #0xc7	; 199
   3AB7 C7                  173 	.db #0xc7	; 199
   3AB8 C7                  174 	.db #0xc7	; 199
   3AB9 C7                  175 	.db #0xc7	; 199
   3ABA C7                  176 	.db #0xc7	; 199
   3ABB C7                  177 	.db #0xc7	; 199
   3ABC C7                  178 	.db #0xc7	; 199
   3ABD C7                  179 	.db #0xc7	; 199
   3ABE C7                  180 	.db #0xc7	; 199
   3ABF C7                  181 	.db #0xc7	; 199
   3AC0 4A                  182 	.db #0x4a	; 74	'J'
   3AC1 4B                  183 	.db #0x4b	; 75	'K'
   3AC2 4C                  184 	.db #0x4c	; 76	'L'
   3AC3 C7                  185 	.db #0xc7	; 199
   3AC4 C7                  186 	.db #0xc7	; 199
   3AC5 C7                  187 	.db #0xc7	; 199
   3AC6 C7                  188 	.db #0xc7	; 199
   3AC7 C7                  189 	.db #0xc7	; 199
   3AC8 C7                  190 	.db #0xc7	; 199
   3AC9 C7                  191 	.db #0xc7	; 199
   3ACA C7                  192 	.db #0xc7	; 199
   3ACB C7                  193 	.db #0xc7	; 199
   3ACC C7                  194 	.db #0xc7	; 199
   3ACD C7                  195 	.db #0xc7	; 199
   3ACE C7                  196 	.db #0xc7	; 199
   3ACF C7                  197 	.db #0xc7	; 199
   3AD0 C7                  198 	.db #0xc7	; 199
   3AD1 C7                  199 	.db #0xc7	; 199
   3AD2 C7                  200 	.db #0xc7	; 199
   3AD3 C7                  201 	.db #0xc7	; 199
   3AD4 C7                  202 	.db #0xc7	; 199
   3AD5 C7                  203 	.db #0xc7	; 199
   3AD6 C7                  204 	.db #0xc7	; 199
   3AD7 C7                  205 	.db #0xc7	; 199
   3AD8 C7                  206 	.db #0xc7	; 199
   3AD9 C7                  207 	.db #0xc7	; 199
   3ADA C7                  208 	.db #0xc7	; 199
   3ADB C7                  209 	.db #0xc7	; 199
   3ADC C7                  210 	.db #0xc7	; 199
   3ADD C7                  211 	.db #0xc7	; 199
   3ADE C7                  212 	.db #0xc7	; 199
   3ADF C7                  213 	.db #0xc7	; 199
   3AE0 C7                  214 	.db #0xc7	; 199
   3AE1 C7                  215 	.db #0xc7	; 199
   3AE2 C7                  216 	.db #0xc7	; 199
   3AE3 C7                  217 	.db #0xc7	; 199
   3AE4 C7                  218 	.db #0xc7	; 199
   3AE5 C7                  219 	.db #0xc7	; 199
   3AE6 C7                  220 	.db #0xc7	; 199
   3AE7 C7                  221 	.db #0xc7	; 199
   3AE8 C7                  222 	.db #0xc7	; 199
   3AE9 C7                  223 	.db #0xc7	; 199
   3AEA C7                  224 	.db #0xc7	; 199
   3AEB C7                  225 	.db #0xc7	; 199
   3AEC C7                  226 	.db #0xc7	; 199
   3AED C7                  227 	.db #0xc7	; 199
   3AEE C7                  228 	.db #0xc7	; 199
   3AEF C7                  229 	.db #0xc7	; 199
   3AF0 C7                  230 	.db #0xc7	; 199
   3AF1 C7                  231 	.db #0xc7	; 199
   3AF2 C7                  232 	.db #0xc7	; 199
   3AF3 C7                  233 	.db #0xc7	; 199
   3AF4 C7                  234 	.db #0xc7	; 199
   3AF5 C7                  235 	.db #0xc7	; 199
   3AF6 C7                  236 	.db #0xc7	; 199
   3AF7 C7                  237 	.db #0xc7	; 199
   3AF8 C7                  238 	.db #0xc7	; 199
   3AF9 C7                  239 	.db #0xc7	; 199
   3AFA C7                  240 	.db #0xc7	; 199
   3AFB C7                  241 	.db #0xc7	; 199
   3AFC C7                  242 	.db #0xc7	; 199
   3AFD C7                  243 	.db #0xc7	; 199
   3AFE C7                  244 	.db #0xc7	; 199
   3AFF C7                  245 	.db #0xc7	; 199
   3B00 C7                  246 	.db #0xc7	; 199
   3B01 C7                  247 	.db #0xc7	; 199
   3B02 C7                  248 	.db #0xc7	; 199
   3B03 C7                  249 	.db #0xc7	; 199
   3B04 C7                  250 	.db #0xc7	; 199
   3B05 C7                  251 	.db #0xc7	; 199
   3B06 C7                  252 	.db #0xc7	; 199
   3B07 C7                  253 	.db #0xc7	; 199
   3B08 C7                  254 	.db #0xc7	; 199
   3B09 C7                  255 	.db #0xc7	; 199
   3B0A C7                  256 	.db #0xc7	; 199
   3B0B C7                  257 	.db #0xc7	; 199
   3B0C C7                  258 	.db #0xc7	; 199
   3B0D C7                  259 	.db #0xc7	; 199
   3B0E C7                  260 	.db #0xc7	; 199
   3B0F C7                  261 	.db #0xc7	; 199
   3B10 C7                  262 	.db #0xc7	; 199
   3B11 C7                  263 	.db #0xc7	; 199
   3B12 C7                  264 	.db #0xc7	; 199
   3B13 C7                  265 	.db #0xc7	; 199
   3B14 C7                  266 	.db #0xc7	; 199
   3B15 C7                  267 	.db #0xc7	; 199
   3B16 C7                  268 	.db #0xc7	; 199
   3B17 C7                  269 	.db #0xc7	; 199
   3B18 C7                  270 	.db #0xc7	; 199
   3B19 C7                  271 	.db #0xc7	; 199
   3B1A C7                  272 	.db #0xc7	; 199
   3B1B C7                  273 	.db #0xc7	; 199
   3B1C C7                  274 	.db #0xc7	; 199
   3B1D C7                  275 	.db #0xc7	; 199
   3B1E C7                  276 	.db #0xc7	; 199
   3B1F C7                  277 	.db #0xc7	; 199
   3B20 C7                  278 	.db #0xc7	; 199
   3B21 C7                  279 	.db #0xc7	; 199
   3B22 C7                  280 	.db #0xc7	; 199
   3B23 C7                  281 	.db #0xc7	; 199
   3B24 C7                  282 	.db #0xc7	; 199
   3B25 C7                  283 	.db #0xc7	; 199
   3B26 C7                  284 	.db #0xc7	; 199
   3B27 C7                  285 	.db #0xc7	; 199
   3B28 C7                  286 	.db #0xc7	; 199
   3B29 C7                  287 	.db #0xc7	; 199
   3B2A C7                  288 	.db #0xc7	; 199
   3B2B C7                  289 	.db #0xc7	; 199
   3B2C C7                  290 	.db #0xc7	; 199
   3B2D C7                  291 	.db #0xc7	; 199
   3B2E C7                  292 	.db #0xc7	; 199
   3B2F C7                  293 	.db #0xc7	; 199
   3B30 C7                  294 	.db #0xc7	; 199
   3B31 C7                  295 	.db #0xc7	; 199
   3B32 C7                  296 	.db #0xc7	; 199
   3B33 C7                  297 	.db #0xc7	; 199
   3B34 C7                  298 	.db #0xc7	; 199
   3B35 C7                  299 	.db #0xc7	; 199
   3B36 C7                  300 	.db #0xc7	; 199
   3B37 C7                  301 	.db #0xc7	; 199
   3B38 C7                  302 	.db #0xc7	; 199
   3B39 C7                  303 	.db #0xc7	; 199
   3B3A C7                  304 	.db #0xc7	; 199
   3B3B C7                  305 	.db #0xc7	; 199
   3B3C C7                  306 	.db #0xc7	; 199
   3B3D C7                  307 	.db #0xc7	; 199
   3B3E C7                  308 	.db #0xc7	; 199
   3B3F C7                  309 	.db #0xc7	; 199
   3B40 C7                  310 	.db #0xc7	; 199
   3B41 C7                  311 	.db #0xc7	; 199
   3B42 C7                  312 	.db #0xc7	; 199
   3B43 C7                  313 	.db #0xc7	; 199
   3B44 C7                  314 	.db #0xc7	; 199
   3B45 C7                  315 	.db #0xc7	; 199
   3B46 C7                  316 	.db #0xc7	; 199
   3B47 C7                  317 	.db #0xc7	; 199
   3B48 C7                  318 	.db #0xc7	; 199
   3B49 C7                  319 	.db #0xc7	; 199
   3B4A C7                  320 	.db #0xc7	; 199
   3B4B C7                  321 	.db #0xc7	; 199
   3B4C C7                  322 	.db #0xc7	; 199
   3B4D C7                  323 	.db #0xc7	; 199
   3B4E C7                  324 	.db #0xc7	; 199
   3B4F C7                  325 	.db #0xc7	; 199
   3B50 C7                  326 	.db #0xc7	; 199
   3B51 C7                  327 	.db #0xc7	; 199
   3B52 C7                  328 	.db #0xc7	; 199
   3B53 C7                  329 	.db #0xc7	; 199
   3B54 C7                  330 	.db #0xc7	; 199
   3B55 C7                  331 	.db #0xc7	; 199
   3B56 C7                  332 	.db #0xc7	; 199
   3B57 C7                  333 	.db #0xc7	; 199
   3B58 C7                  334 	.db #0xc7	; 199
   3B59 C7                  335 	.db #0xc7	; 199
   3B5A C7                  336 	.db #0xc7	; 199
   3B5B C7                  337 	.db #0xc7	; 199
   3B5C C7                  338 	.db #0xc7	; 199
   3B5D C7                  339 	.db #0xc7	; 199
   3B5E C7                  340 	.db #0xc7	; 199
   3B5F C7                  341 	.db #0xc7	; 199
   3B60 C7                  342 	.db #0xc7	; 199
   3B61 C7                  343 	.db #0xc7	; 199
   3B62 C7                  344 	.db #0xc7	; 199
   3B63 C7                  345 	.db #0xc7	; 199
   3B64 C7                  346 	.db #0xc7	; 199
   3B65 C7                  347 	.db #0xc7	; 199
   3B66 C7                  348 	.db #0xc7	; 199
   3B67 C7                  349 	.db #0xc7	; 199
   3B68 C7                  350 	.db #0xc7	; 199
   3B69 C7                  351 	.db #0xc7	; 199
   3B6A C7                  352 	.db #0xc7	; 199
   3B6B C7                  353 	.db #0xc7	; 199
   3B6C C7                  354 	.db #0xc7	; 199
   3B6D C7                  355 	.db #0xc7	; 199
   3B6E C7                  356 	.db #0xc7	; 199
   3B6F C7                  357 	.db #0xc7	; 199
   3B70 C7                  358 	.db #0xc7	; 199
   3B71 C7                  359 	.db #0xc7	; 199
   3B72 C7                  360 	.db #0xc7	; 199
   3B73 C7                  361 	.db #0xc7	; 199
   3B74 C7                  362 	.db #0xc7	; 199
   3B75 C7                  363 	.db #0xc7	; 199
   3B76 C7                  364 	.db #0xc7	; 199
   3B77 C7                  365 	.db #0xc7	; 199
   3B78 C7                  366 	.db #0xc7	; 199
   3B79 C7                  367 	.db #0xc7	; 199
   3B7A C7                  368 	.db #0xc7	; 199
   3B7B C7                  369 	.db #0xc7	; 199
   3B7C C7                  370 	.db #0xc7	; 199
   3B7D C7                  371 	.db #0xc7	; 199
   3B7E C7                  372 	.db #0xc7	; 199
   3B7F C7                  373 	.db #0xc7	; 199
   3B80 C7                  374 	.db #0xc7	; 199
   3B81 8F                  375 	.db #0x8f	; 143
   3B82 90                  376 	.db #0x90	; 144
   3B83 91                  377 	.db #0x91	; 145
   3B84 C7                  378 	.db #0xc7	; 199
   3B85 C7                  379 	.db #0xc7	; 199
   3B86 C7                  380 	.db #0xc7	; 199
   3B87 C7                  381 	.db #0xc7	; 199
   3B88 C7                  382 	.db #0xc7	; 199
   3B89 C7                  383 	.db #0xc7	; 199
   3B8A C7                  384 	.db #0xc7	; 199
   3B8B C7                  385 	.db #0xc7	; 199
   3B8C C7                  386 	.db #0xc7	; 199
   3B8D C7                  387 	.db #0xc7	; 199
   3B8E C7                  388 	.db #0xc7	; 199
   3B8F C7                  389 	.db #0xc7	; 199
   3B90 C7                  390 	.db #0xc7	; 199
   3B91 C7                  391 	.db #0xc7	; 199
   3B92 C7                  392 	.db #0xc7	; 199
   3B93 99                  393 	.db #0x99	; 153
   3B94 9A                  394 	.db #0x9a	; 154
   3B95 9B                  395 	.db #0x9b	; 155
   3B96 C7                  396 	.db #0xc7	; 199
   3B97 C7                  397 	.db #0xc7	; 199
   3B98 C7                  398 	.db #0xc7	; 199
   3B99 C7                  399 	.db #0xc7	; 199
   3B9A C7                  400 	.db #0xc7	; 199
   3B9B C7                  401 	.db #0xc7	; 199
   3B9C C7                  402 	.db #0xc7	; 199
   3B9D C7                  403 	.db #0xc7	; 199
   3B9E C7                  404 	.db #0xc7	; 199
   3B9F C7                  405 	.db #0xc7	; 199
   3BA0 C7                  406 	.db #0xc7	; 199
   3BA1 C7                  407 	.db #0xc7	; 199
   3BA2 C7                  408 	.db #0xc7	; 199
   3BA3 C7                  409 	.db #0xc7	; 199
   3BA4 C7                  410 	.db #0xc7	; 199
   3BA5 A3                  411 	.db #0xa3	; 163
   3BA6 A4                  412 	.db #0xa4	; 164
   3BA7 A5                  413 	.db #0xa5	; 165
   3BA8 C7                  414 	.db #0xc7	; 199
   3BA9 C7                  415 	.db #0xc7	; 199
   3BAA C7                  416 	.db #0xc7	; 199
   3BAB C7                  417 	.db #0xc7	; 199
   3BAC C7                  418 	.db #0xc7	; 199
   3BAD C7                  419 	.db #0xc7	; 199
   3BAE C7                  420 	.db #0xc7	; 199
   3BAF C7                  421 	.db #0xc7	; 199
   3BB0 C7                  422 	.db #0xc7	; 199
   3BB1 C7                  423 	.db #0xc7	; 199
   3BB2 C7                  424 	.db #0xc7	; 199
   3BB3 C7                  425 	.db #0xc7	; 199
   3BB4 C7                  426 	.db #0xc7	; 199
   3BB5 C7                  427 	.db #0xc7	; 199
   3BB6 C7                  428 	.db #0xc7	; 199
   3BB7 AD                  429 	.db #0xad	; 173
   3BB8 AE                  430 	.db #0xae	; 174
   3BB9 AF                  431 	.db #0xaf	; 175
   3BBA C7                  432 	.db #0xc7	; 199
   3BBB C7                  433 	.db #0xc7	; 199
   3BBC C7                  434 	.db #0xc7	; 199
   3BBD C7                  435 	.db #0xc7	; 199
   3BBE C7                  436 	.db #0xc7	; 199
   3BBF C7                  437 	.db #0xc7	; 199
   3BC0 C7                  438 	.db #0xc7	; 199
   3BC1 C7                  439 	.db #0xc7	; 199
   3BC2 C7                  440 	.db #0xc7	; 199
   3BC3 C7                  441 	.db #0xc7	; 199
   3BC4 C7                  442 	.db #0xc7	; 199
   3BC5 C7                  443 	.db #0xc7	; 199
   3BC6 C7                  444 	.db #0xc7	; 199
   3BC7 C7                  445 	.db #0xc7	; 199
   3BC8 C7                  446 	.db #0xc7	; 199
   3BC9 B7                  447 	.db #0xb7	; 183
   3BCA B8                  448 	.db #0xb8	; 184
   3BCB B9                  449 	.db #0xb9	; 185
   3BCC C7                  450 	.db #0xc7	; 199
   3BCD C7                  451 	.db #0xc7	; 199
   3BCE C7                  452 	.db #0xc7	; 199
   3BCF C7                  453 	.db #0xc7	; 199
   3BD0 C7                  454 	.db #0xc7	; 199
   3BD1 C7                  455 	.db #0xc7	; 199
   3BD2 C7                  456 	.db #0xc7	; 199
   3BD3 C7                  457 	.db #0xc7	; 199
   3BD4 C7                  458 	.db #0xc7	; 199
   3BD5 C7                  459 	.db #0xc7	; 199
   3BD6 C7                  460 	.db #0xc7	; 199
   3BD7 C7                  461 	.db #0xc7	; 199
   3BD8 C7                  462 	.db #0xc7	; 199
   3BD9 C7                  463 	.db #0xc7	; 199
   3BDA C7                  464 	.db #0xc7	; 199
   3BDB C1                  465 	.db #0xc1	; 193
   3BDC C2                  466 	.db #0xc2	; 194
   3BDD C3                  467 	.db #0xc3	; 195
   3BDE C7                  468 	.db #0xc7	; 199
   3BDF C7                  469 	.db #0xc7	; 199
   3BE0 C7                  470 	.db #0xc7	; 199
   3BE1 C7                  471 	.db #0xc7	; 199
   3BE2 C7                  472 	.db #0xc7	; 199
   3BE3 C7                  473 	.db #0xc7	; 199
   3BE4 C7                  474 	.db #0xc7	; 199
   3BE5 C7                  475 	.db #0xc7	; 199
   3BE6 C7                  476 	.db #0xc7	; 199
   3BE7 00                  477 	.db #0x00	; 0
   3BE8 01                  478 	.db #0x01	; 1
   3BE9 00                  479 	.db #0x00	; 0
   3BEA 01                  480 	.db #0x01	; 1
   3BEB 00                  481 	.db #0x00	; 0
   3BEC 01                  482 	.db #0x01	; 1
   3BED 00                  483 	.db #0x00	; 0
   3BEE 01                  484 	.db #0x01	; 1
   3BEF 00                  485 	.db #0x00	; 0
   3BF0 01                  486 	.db #0x01	; 1
   3BF1 00                  487 	.db #0x00	; 0
   3BF2 01                  488 	.db #0x01	; 1
   3BF3 00                  489 	.db #0x00	; 0
   3BF4 01                  490 	.db #0x01	; 1
   3BF5 00                  491 	.db #0x00	; 0
   3BF6 01                  492 	.db #0x01	; 1
   3BF7 00                  493 	.db #0x00	; 0
   3BF8 01                  494 	.db #0x01	; 1
   3BF9 0A                  495 	.db #0x0a	; 10
   3BFA 0B                  496 	.db #0x0b	; 11
   3BFB 0A                  497 	.db #0x0a	; 10
   3BFC 0B                  498 	.db #0x0b	; 11
   3BFD 0A                  499 	.db #0x0a	; 10
   3BFE 0B                  500 	.db #0x0b	; 11
   3BFF 0A                  501 	.db #0x0a	; 10
   3C00 0B                  502 	.db #0x0b	; 11
   3C01 0A                  503 	.db #0x0a	; 10
   3C02 0B                  504 	.db #0x0b	; 11
   3C03 0A                  505 	.db #0x0a	; 10
   3C04 0B                  506 	.db #0x0b	; 11
   3C05 0A                  507 	.db #0x0a	; 10
   3C06 0B                  508 	.db #0x0b	; 11
   3C07 0A                  509 	.db #0x0a	; 10
   3C08 0B                  510 	.db #0x0b	; 11
   3C09 0A                  511 	.db #0x0a	; 10
   3C0A 0B                  512 	.db #0x0b	; 11
   3C0B 14                  513 	.db #0x14	; 20
   3C0C 15                  514 	.db #0x15	; 21
   3C0D 14                  515 	.db #0x14	; 20
   3C0E 15                  516 	.db #0x15	; 21
   3C0F 14                  517 	.db #0x14	; 20
   3C10 15                  518 	.db #0x15	; 21
   3C11 14                  519 	.db #0x14	; 20
   3C12 15                  520 	.db #0x15	; 21
   3C13 14                  521 	.db #0x14	; 20
   3C14 15                  522 	.db #0x15	; 21
   3C15 14                  523 	.db #0x14	; 20
   3C16 15                  524 	.db #0x15	; 21
   3C17 14                  525 	.db #0x14	; 20
   3C18 15                  526 	.db #0x15	; 21
   3C19 14                  527 	.db #0x14	; 20
   3C1A 15                  528 	.db #0x15	; 21
   3C1B 14                  529 	.db #0x14	; 20
   3C1C 15                  530 	.db #0x15	; 21
   3C1D 1E                  531 	.db #0x1e	; 30
   3C1E 1F                  532 	.db #0x1f	; 31
   3C1F 1E                  533 	.db #0x1e	; 30
   3C20 1F                  534 	.db #0x1f	; 31
   3C21 1E                  535 	.db #0x1e	; 30
   3C22 1F                  536 	.db #0x1f	; 31
   3C23 1E                  537 	.db #0x1e	; 30
   3C24 1F                  538 	.db #0x1f	; 31
   3C25 1E                  539 	.db #0x1e	; 30
   3C26 1F                  540 	.db #0x1f	; 31
   3C27 1E                  541 	.db #0x1e	; 30
   3C28 1F                  542 	.db #0x1f	; 31
   3C29 1E                  543 	.db #0x1e	; 30
   3C2A 1F                  544 	.db #0x1f	; 31
   3C2B 1E                  545 	.db #0x1e	; 30
   3C2C 1F                  546 	.db #0x1f	; 31
   3C2D 1E                  547 	.db #0x1e	; 30
   3C2E 1F                  548 	.db #0x1f	; 31
                            549 	.area _INITIALIZER
                            550 	.area _CABS (ABS)
