                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (CYGWIN)
                              4 ;--------------------------------------------------------
                              5 	.module fase_19
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_mapa19
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
   287F                      44 _g_mapa19:
   287F 0D                   45 	.db #0x0d	; 13
   2880 0F                   46 	.db #0x0f	; 15
   2881 0F                   47 	.db #0x0f	; 15
   2882 03                   48 	.db #0x03	; 3
   2883 09                   49 	.db #0x09	; 9
   2884 09                   50 	.db #0x09	; 9
   2885 09                   51 	.db #0x09	; 9
   2886 09                   52 	.db #0x09	; 9
   2887 09                   53 	.db #0x09	; 9
   2888 09                   54 	.db #0x09	; 9
   2889 06                   55 	.db #0x06	; 6
   288A 07                   56 	.db #0x07	; 7
   288B 08                   57 	.db #0x08	; 8
   288C 09                   58 	.db #0x09	; 9
   288D 09                   59 	.db #0x09	; 9
   288E 09                   60 	.db #0x09	; 9
   288F 09                   61 	.db #0x09	; 9
   2890 09                   62 	.db #0x09	; 9
   2891 A7                   63 	.db #0xa7	; 167
   2892 A8                   64 	.db #0xa8	; 168
   2893 A9                   65 	.db #0xa9	; 169
   2894 0D                   66 	.db #0x0d	; 13
   2895 09                   67 	.db #0x09	; 9
   2896 09                   68 	.db #0x09	; 9
   2897 09                   69 	.db #0x09	; 9
   2898 09                   70 	.db #0x09	; 9
   2899 09                   71 	.db #0x09	; 9
   289A 09                   72 	.db #0x09	; 9
   289B 09                   73 	.db #0x09	; 9
   289C 09                   74 	.db #0x09	; 9
   289D 09                   75 	.db #0x09	; 9
   289E 09                   76 	.db #0x09	; 9
   289F 09                   77 	.db #0x09	; 9
   28A0 09                   78 	.db #0x09	; 9
   28A1 09                   79 	.db #0x09	; 9
   28A2 09                   80 	.db #0x09	; 9
   28A3 B1                   81 	.db #0xb1	; 177
   28A4 B2                   82 	.db #0xb2	; 178
   28A5 B3                   83 	.db #0xb3	; 179
   28A6 C7                   84 	.db #0xc7	; 199
   28A7 0C                   85 	.db #0x0c	; 12
   28A8 0D                   86 	.db #0x0d	; 13
   28A9 09                   87 	.db #0x09	; 9
   28AA 0C                   88 	.db #0x0c	; 12
   28AB 0D                   89 	.db #0x0d	; 13
   28AC 09                   90 	.db #0x09	; 9
   28AD 1A                   91 	.db #0x1a	; 26
   28AE 1B                   92 	.db #0x1b	; 27
   28AF 1C                   93 	.db #0x1c	; 28
   28B0 1D                   94 	.db #0x1d	; 29
   28B1 24                   95 	.db #0x24	; 36
   28B2 0F                   96 	.db #0x0f	; 15
   28B3 0C                   97 	.db #0x0c	; 12
   28B4 0D                   98 	.db #0x0d	; 13
   28B5 BB                   99 	.db #0xbb	; 187
   28B6 BC                  100 	.db #0xbc	; 188
   28B7 BD                  101 	.db #0xbd	; 189
   28B8 C7                  102 	.db #0xc7	; 199
   28B9 C7                  103 	.db #0xc7	; 199
   28BA C7                  104 	.db #0xc7	; 199
   28BB 28                  105 	.db #0x28	; 40
   28BC C7                  106 	.db #0xc7	; 199
   28BD C7                  107 	.db #0xc7	; 199
   28BE 31                  108 	.db #0x31	; 49	'1'
   28BF 24                  109 	.db #0x24	; 36
   28C0 25                  110 	.db #0x25	; 37
   28C1 26                  111 	.db #0x26	; 38
   28C2 31                  112 	.db #0x31	; 49	'1'
   28C3 2E                  113 	.db #0x2e	; 46
   28C4 C7                  114 	.db #0xc7	; 199
   28C5 C7                  115 	.db #0xc7	; 199
   28C6 C7                  116 	.db #0xc7	; 199
   28C7 C5                  117 	.db #0xc5	; 197
   28C8 C6                  118 	.db #0xc6	; 198
   28C9 C7                  119 	.db #0xc7	; 199
   28CA C7                  120 	.db #0xc7	; 199
   28CB C7                  121 	.db #0xc7	; 199
   28CC C7                  122 	.db #0xc7	; 199
   28CD 32                  123 	.db #0x32	; 50	'2'
   28CE C7                  124 	.db #0xc7	; 199
   28CF C7                  125 	.db #0xc7	; 199
   28D0 3B                  126 	.db #0x3b	; 59
   28D1 2E                  127 	.db #0x2e	; 46
   28D2 2F                  128 	.db #0x2f	; 47
   28D3 30                  129 	.db #0x30	; 48	'0'
   28D4 3B                  130 	.db #0x3b	; 59
   28D5 38                  131 	.db #0x38	; 56	'8'
   28D6 C7                  132 	.db #0xc7	; 199
   28D7 C7                  133 	.db #0xc7	; 199
   28D8 C7                  134 	.db #0xc7	; 199
   28D9 C7                  135 	.db #0xc7	; 199
   28DA C7                  136 	.db #0xc7	; 199
   28DB C7                  137 	.db #0xc7	; 199
   28DC C7                  138 	.db #0xc7	; 199
   28DD C7                  139 	.db #0xc7	; 199
   28DE C7                  140 	.db #0xc7	; 199
   28DF 3C                  141 	.db #0x3c	; 60
   28E0 C7                  142 	.db #0xc7	; 199
   28E1 C7                  143 	.db #0xc7	; 199
   28E2 C7                  144 	.db #0xc7	; 199
   28E3 33                  145 	.db #0x33	; 51	'3'
   28E4 C7                  146 	.db #0xc7	; 199
   28E5 C7                  147 	.db #0xc7	; 199
   28E6 C7                  148 	.db #0xc7	; 199
   28E7 C7                  149 	.db #0xc7	; 199
   28E8 C7                  150 	.db #0xc7	; 199
   28E9 C7                  151 	.db #0xc7	; 199
   28EA C7                  152 	.db #0xc7	; 199
   28EB C7                  153 	.db #0xc7	; 199
   28EC C7                  154 	.db #0xc7	; 199
   28ED C7                  155 	.db #0xc7	; 199
   28EE C7                  156 	.db #0xc7	; 199
   28EF C7                  157 	.db #0xc7	; 199
   28F0 C7                  158 	.db #0xc7	; 199
   28F1 C7                  159 	.db #0xc7	; 199
   28F2 C7                  160 	.db #0xc7	; 199
   28F3 C7                  161 	.db #0xc7	; 199
   28F4 C7                  162 	.db #0xc7	; 199
   28F5 C7                  163 	.db #0xc7	; 199
   28F6 C7                  164 	.db #0xc7	; 199
   28F7 C7                  165 	.db #0xc7	; 199
   28F8 C7                  166 	.db #0xc7	; 199
   28F9 C7                  167 	.db #0xc7	; 199
   28FA C7                  168 	.db #0xc7	; 199
   28FB C7                  169 	.db #0xc7	; 199
   28FC C7                  170 	.db #0xc7	; 199
   28FD C7                  171 	.db #0xc7	; 199
   28FE C7                  172 	.db #0xc7	; 199
   28FF C7                  173 	.db #0xc7	; 199
   2900 C7                  174 	.db #0xc7	; 199
   2901 C7                  175 	.db #0xc7	; 199
   2902 C7                  176 	.db #0xc7	; 199
   2903 C7                  177 	.db #0xc7	; 199
   2904 C7                  178 	.db #0xc7	; 199
   2905 C7                  179 	.db #0xc7	; 199
   2906 C7                  180 	.db #0xc7	; 199
   2907 C7                  181 	.db #0xc7	; 199
   2908 C7                  182 	.db #0xc7	; 199
   2909 C7                  183 	.db #0xc7	; 199
   290A C7                  184 	.db #0xc7	; 199
   290B C7                  185 	.db #0xc7	; 199
   290C C7                  186 	.db #0xc7	; 199
   290D C7                  187 	.db #0xc7	; 199
   290E C7                  188 	.db #0xc7	; 199
   290F C7                  189 	.db #0xc7	; 199
   2910 C7                  190 	.db #0xc7	; 199
   2911 C7                  191 	.db #0xc7	; 199
   2912 C7                  192 	.db #0xc7	; 199
   2913 C7                  193 	.db #0xc7	; 199
   2914 C7                  194 	.db #0xc7	; 199
   2915 C7                  195 	.db #0xc7	; 199
   2916 C7                  196 	.db #0xc7	; 199
   2917 C7                  197 	.db #0xc7	; 199
   2918 C7                  198 	.db #0xc7	; 199
   2919 C7                  199 	.db #0xc7	; 199
   291A C7                  200 	.db #0xc7	; 199
   291B C7                  201 	.db #0xc7	; 199
   291C C7                  202 	.db #0xc7	; 199
   291D C7                  203 	.db #0xc7	; 199
   291E C7                  204 	.db #0xc7	; 199
   291F C7                  205 	.db #0xc7	; 199
   2920 C7                  206 	.db #0xc7	; 199
   2921 C7                  207 	.db #0xc7	; 199
   2922 C7                  208 	.db #0xc7	; 199
   2923 C7                  209 	.db #0xc7	; 199
   2924 C7                  210 	.db #0xc7	; 199
   2925 C7                  211 	.db #0xc7	; 199
   2926 C7                  212 	.db #0xc7	; 199
   2927 C7                  213 	.db #0xc7	; 199
   2928 C7                  214 	.db #0xc7	; 199
   2929 C7                  215 	.db #0xc7	; 199
   292A C7                  216 	.db #0xc7	; 199
   292B C7                  217 	.db #0xc7	; 199
   292C C7                  218 	.db #0xc7	; 199
   292D C7                  219 	.db #0xc7	; 199
   292E C7                  220 	.db #0xc7	; 199
   292F C7                  221 	.db #0xc7	; 199
   2930 C7                  222 	.db #0xc7	; 199
   2931 C7                  223 	.db #0xc7	; 199
   2932 C7                  224 	.db #0xc7	; 199
   2933 C7                  225 	.db #0xc7	; 199
   2934 C7                  226 	.db #0xc7	; 199
   2935 C7                  227 	.db #0xc7	; 199
   2936 C7                  228 	.db #0xc7	; 199
   2937 C7                  229 	.db #0xc7	; 199
   2938 C7                  230 	.db #0xc7	; 199
   2939 C7                  231 	.db #0xc7	; 199
   293A C7                  232 	.db #0xc7	; 199
   293B C7                  233 	.db #0xc7	; 199
   293C C7                  234 	.db #0xc7	; 199
   293D C7                  235 	.db #0xc7	; 199
   293E C7                  236 	.db #0xc7	; 199
   293F C7                  237 	.db #0xc7	; 199
   2940 C7                  238 	.db #0xc7	; 199
   2941 C7                  239 	.db #0xc7	; 199
   2942 C7                  240 	.db #0xc7	; 199
   2943 C7                  241 	.db #0xc7	; 199
   2944 C7                  242 	.db #0xc7	; 199
   2945 C7                  243 	.db #0xc7	; 199
   2946 C7                  244 	.db #0xc7	; 199
   2947 C7                  245 	.db #0xc7	; 199
   2948 C7                  246 	.db #0xc7	; 199
   2949 C7                  247 	.db #0xc7	; 199
   294A C7                  248 	.db #0xc7	; 199
   294B C7                  249 	.db #0xc7	; 199
   294C C7                  250 	.db #0xc7	; 199
   294D C7                  251 	.db #0xc7	; 199
   294E C7                  252 	.db #0xc7	; 199
   294F C7                  253 	.db #0xc7	; 199
   2950 C7                  254 	.db #0xc7	; 199
   2951 C7                  255 	.db #0xc7	; 199
   2952 C7                  256 	.db #0xc7	; 199
   2953 C7                  257 	.db #0xc7	; 199
   2954 C7                  258 	.db #0xc7	; 199
   2955 C7                  259 	.db #0xc7	; 199
   2956 C7                  260 	.db #0xc7	; 199
   2957 C7                  261 	.db #0xc7	; 199
   2958 C7                  262 	.db #0xc7	; 199
   2959 C7                  263 	.db #0xc7	; 199
   295A C7                  264 	.db #0xc7	; 199
   295B C7                  265 	.db #0xc7	; 199
   295C C7                  266 	.db #0xc7	; 199
   295D C7                  267 	.db #0xc7	; 199
   295E C7                  268 	.db #0xc7	; 199
   295F C7                  269 	.db #0xc7	; 199
   2960 C7                  270 	.db #0xc7	; 199
   2961 C7                  271 	.db #0xc7	; 199
   2962 C7                  272 	.db #0xc7	; 199
   2963 C7                  273 	.db #0xc7	; 199
   2964 C7                  274 	.db #0xc7	; 199
   2965 C7                  275 	.db #0xc7	; 199
   2966 C7                  276 	.db #0xc7	; 199
   2967 C7                  277 	.db #0xc7	; 199
   2968 C7                  278 	.db #0xc7	; 199
   2969 C7                  279 	.db #0xc7	; 199
   296A C7                  280 	.db #0xc7	; 199
   296B C7                  281 	.db #0xc7	; 199
   296C C7                  282 	.db #0xc7	; 199
   296D C7                  283 	.db #0xc7	; 199
   296E C7                  284 	.db #0xc7	; 199
   296F C7                  285 	.db #0xc7	; 199
   2970 C7                  286 	.db #0xc7	; 199
   2971 C7                  287 	.db #0xc7	; 199
   2972 C7                  288 	.db #0xc7	; 199
   2973 C7                  289 	.db #0xc7	; 199
   2974 C7                  290 	.db #0xc7	; 199
   2975 C7                  291 	.db #0xc7	; 199
   2976 C7                  292 	.db #0xc7	; 199
   2977 C7                  293 	.db #0xc7	; 199
   2978 C7                  294 	.db #0xc7	; 199
   2979 C7                  295 	.db #0xc7	; 199
   297A C7                  296 	.db #0xc7	; 199
   297B C7                  297 	.db #0xc7	; 199
   297C C7                  298 	.db #0xc7	; 199
   297D C7                  299 	.db #0xc7	; 199
   297E C7                  300 	.db #0xc7	; 199
   297F C7                  301 	.db #0xc7	; 199
   2980 C7                  302 	.db #0xc7	; 199
   2981 C7                  303 	.db #0xc7	; 199
   2982 C7                  304 	.db #0xc7	; 199
   2983 C7                  305 	.db #0xc7	; 199
   2984 C7                  306 	.db #0xc7	; 199
   2985 C7                  307 	.db #0xc7	; 199
   2986 C7                  308 	.db #0xc7	; 199
   2987 C7                  309 	.db #0xc7	; 199
   2988 C7                  310 	.db #0xc7	; 199
   2989 C7                  311 	.db #0xc7	; 199
   298A C7                  312 	.db #0xc7	; 199
   298B C7                  313 	.db #0xc7	; 199
   298C C7                  314 	.db #0xc7	; 199
   298D C7                  315 	.db #0xc7	; 199
   298E C7                  316 	.db #0xc7	; 199
   298F C7                  317 	.db #0xc7	; 199
   2990 C7                  318 	.db #0xc7	; 199
   2991 C7                  319 	.db #0xc7	; 199
   2992 C7                  320 	.db #0xc7	; 199
   2993 C7                  321 	.db #0xc7	; 199
   2994 C7                  322 	.db #0xc7	; 199
   2995 C7                  323 	.db #0xc7	; 199
   2996 C7                  324 	.db #0xc7	; 199
   2997 C7                  325 	.db #0xc7	; 199
   2998 C7                  326 	.db #0xc7	; 199
   2999 C7                  327 	.db #0xc7	; 199
   299A C7                  328 	.db #0xc7	; 199
   299B C7                  329 	.db #0xc7	; 199
   299C C7                  330 	.db #0xc7	; 199
   299D C7                  331 	.db #0xc7	; 199
   299E C7                  332 	.db #0xc7	; 199
   299F C7                  333 	.db #0xc7	; 199
   29A0 C7                  334 	.db #0xc7	; 199
   29A1 C7                  335 	.db #0xc7	; 199
   29A2 C7                  336 	.db #0xc7	; 199
   29A3 C7                  337 	.db #0xc7	; 199
   29A4 C7                  338 	.db #0xc7	; 199
   29A5 C7                  339 	.db #0xc7	; 199
   29A6 C7                  340 	.db #0xc7	; 199
   29A7 C7                  341 	.db #0xc7	; 199
   29A8 C7                  342 	.db #0xc7	; 199
   29A9 C7                  343 	.db #0xc7	; 199
   29AA C7                  344 	.db #0xc7	; 199
   29AB C7                  345 	.db #0xc7	; 199
   29AC C7                  346 	.db #0xc7	; 199
   29AD C7                  347 	.db #0xc7	; 199
   29AE C7                  348 	.db #0xc7	; 199
   29AF C7                  349 	.db #0xc7	; 199
   29B0 C7                  350 	.db #0xc7	; 199
   29B1 C7                  351 	.db #0xc7	; 199
   29B2 C7                  352 	.db #0xc7	; 199
   29B3 C7                  353 	.db #0xc7	; 199
   29B4 C7                  354 	.db #0xc7	; 199
   29B5 C7                  355 	.db #0xc7	; 199
   29B6 C7                  356 	.db #0xc7	; 199
   29B7 C7                  357 	.db #0xc7	; 199
   29B8 C7                  358 	.db #0xc7	; 199
   29B9 C7                  359 	.db #0xc7	; 199
   29BA C7                  360 	.db #0xc7	; 199
   29BB C7                  361 	.db #0xc7	; 199
   29BC C7                  362 	.db #0xc7	; 199
   29BD C7                  363 	.db #0xc7	; 199
   29BE C7                  364 	.db #0xc7	; 199
   29BF C7                  365 	.db #0xc7	; 199
   29C0 C7                  366 	.db #0xc7	; 199
   29C1 C7                  367 	.db #0xc7	; 199
   29C2 C7                  368 	.db #0xc7	; 199
   29C3 C7                  369 	.db #0xc7	; 199
   29C4 C7                  370 	.db #0xc7	; 199
   29C5 C7                  371 	.db #0xc7	; 199
   29C6 C7                  372 	.db #0xc7	; 199
   29C7 C7                  373 	.db #0xc7	; 199
   29C8 C7                  374 	.db #0xc7	; 199
   29C9 C7                  375 	.db #0xc7	; 199
   29CA C7                  376 	.db #0xc7	; 199
   29CB C7                  377 	.db #0xc7	; 199
   29CC C7                  378 	.db #0xc7	; 199
   29CD C7                  379 	.db #0xc7	; 199
   29CE C7                  380 	.db #0xc7	; 199
   29CF C7                  381 	.db #0xc7	; 199
   29D0 C7                  382 	.db #0xc7	; 199
   29D1 C7                  383 	.db #0xc7	; 199
   29D2 C7                  384 	.db #0xc7	; 199
   29D3 C7                  385 	.db #0xc7	; 199
   29D4 C7                  386 	.db #0xc7	; 199
   29D5 C7                  387 	.db #0xc7	; 199
   29D6 C7                  388 	.db #0xc7	; 199
   29D7 C7                  389 	.db #0xc7	; 199
   29D8 C7                  390 	.db #0xc7	; 199
   29D9 C7                  391 	.db #0xc7	; 199
   29DA C7                  392 	.db #0xc7	; 199
   29DB C7                  393 	.db #0xc7	; 199
   29DC C7                  394 	.db #0xc7	; 199
   29DD C7                  395 	.db #0xc7	; 199
   29DE C7                  396 	.db #0xc7	; 199
   29DF C7                  397 	.db #0xc7	; 199
   29E0 C7                  398 	.db #0xc7	; 199
   29E1 C7                  399 	.db #0xc7	; 199
   29E2 C7                  400 	.db #0xc7	; 199
   29E3 C7                  401 	.db #0xc7	; 199
   29E4 C7                  402 	.db #0xc7	; 199
   29E5 C7                  403 	.db #0xc7	; 199
   29E6 C7                  404 	.db #0xc7	; 199
   29E7 C7                  405 	.db #0xc7	; 199
   29E8 C7                  406 	.db #0xc7	; 199
   29E9 C7                  407 	.db #0xc7	; 199
   29EA C7                  408 	.db #0xc7	; 199
   29EB C7                  409 	.db #0xc7	; 199
   29EC C7                  410 	.db #0xc7	; 199
   29ED C7                  411 	.db #0xc7	; 199
   29EE C7                  412 	.db #0xc7	; 199
   29EF C7                  413 	.db #0xc7	; 199
   29F0 C7                  414 	.db #0xc7	; 199
   29F1 C7                  415 	.db #0xc7	; 199
   29F2 C7                  416 	.db #0xc7	; 199
   29F3 C7                  417 	.db #0xc7	; 199
   29F4 C7                  418 	.db #0xc7	; 199
   29F5 C7                  419 	.db #0xc7	; 199
   29F6 C7                  420 	.db #0xc7	; 199
   29F7 C7                  421 	.db #0xc7	; 199
   29F8 C7                  422 	.db #0xc7	; 199
   29F9 C7                  423 	.db #0xc7	; 199
   29FA C7                  424 	.db #0xc7	; 199
   29FB C7                  425 	.db #0xc7	; 199
   29FC C7                  426 	.db #0xc7	; 199
   29FD C7                  427 	.db #0xc7	; 199
   29FE C7                  428 	.db #0xc7	; 199
   29FF C7                  429 	.db #0xc7	; 199
   2A00 C7                  430 	.db #0xc7	; 199
   2A01 C7                  431 	.db #0xc7	; 199
   2A02 C7                  432 	.db #0xc7	; 199
   2A03 C7                  433 	.db #0xc7	; 199
   2A04 C7                  434 	.db #0xc7	; 199
   2A05 C7                  435 	.db #0xc7	; 199
   2A06 C7                  436 	.db #0xc7	; 199
   2A07 C7                  437 	.db #0xc7	; 199
   2A08 C7                  438 	.db #0xc7	; 199
   2A09 C7                  439 	.db #0xc7	; 199
   2A0A C7                  440 	.db #0xc7	; 199
   2A0B C7                  441 	.db #0xc7	; 199
   2A0C C7                  442 	.db #0xc7	; 199
   2A0D C7                  443 	.db #0xc7	; 199
   2A0E C7                  444 	.db #0xc7	; 199
   2A0F C7                  445 	.db #0xc7	; 199
   2A10 C7                  446 	.db #0xc7	; 199
   2A11 C7                  447 	.db #0xc7	; 199
   2A12 C7                  448 	.db #0xc7	; 199
   2A13 C7                  449 	.db #0xc7	; 199
   2A14 C7                  450 	.db #0xc7	; 199
   2A15 C7                  451 	.db #0xc7	; 199
   2A16 C7                  452 	.db #0xc7	; 199
   2A17 C7                  453 	.db #0xc7	; 199
   2A18 C7                  454 	.db #0xc7	; 199
   2A19 C7                  455 	.db #0xc7	; 199
   2A1A C7                  456 	.db #0xc7	; 199
   2A1B C7                  457 	.db #0xc7	; 199
   2A1C C7                  458 	.db #0xc7	; 199
   2A1D C7                  459 	.db #0xc7	; 199
   2A1E C7                  460 	.db #0xc7	; 199
   2A1F C7                  461 	.db #0xc7	; 199
   2A20 C7                  462 	.db #0xc7	; 199
   2A21 C7                  463 	.db #0xc7	; 199
   2A22 C7                  464 	.db #0xc7	; 199
   2A23 C7                  465 	.db #0xc7	; 199
   2A24 C7                  466 	.db #0xc7	; 199
   2A25 C7                  467 	.db #0xc7	; 199
   2A26 C7                  468 	.db #0xc7	; 199
   2A27 C7                  469 	.db #0xc7	; 199
   2A28 C7                  470 	.db #0xc7	; 199
   2A29 C7                  471 	.db #0xc7	; 199
   2A2A C7                  472 	.db #0xc7	; 199
   2A2B C7                  473 	.db #0xc7	; 199
   2A2C C7                  474 	.db #0xc7	; 199
   2A2D C7                  475 	.db #0xc7	; 199
   2A2E C7                  476 	.db #0xc7	; 199
   2A2F 00                  477 	.db #0x00	; 0
   2A30 01                  478 	.db #0x01	; 1
   2A31 00                  479 	.db #0x00	; 0
   2A32 01                  480 	.db #0x01	; 1
   2A33 00                  481 	.db #0x00	; 0
   2A34 01                  482 	.db #0x01	; 1
   2A35 00                  483 	.db #0x00	; 0
   2A36 01                  484 	.db #0x01	; 1
   2A37 00                  485 	.db #0x00	; 0
   2A38 01                  486 	.db #0x01	; 1
   2A39 00                  487 	.db #0x00	; 0
   2A3A 01                  488 	.db #0x01	; 1
   2A3B 00                  489 	.db #0x00	; 0
   2A3C 01                  490 	.db #0x01	; 1
   2A3D 00                  491 	.db #0x00	; 0
   2A3E 01                  492 	.db #0x01	; 1
   2A3F 00                  493 	.db #0x00	; 0
   2A40 01                  494 	.db #0x01	; 1
   2A41 0A                  495 	.db #0x0a	; 10
   2A42 0B                  496 	.db #0x0b	; 11
   2A43 0A                  497 	.db #0x0a	; 10
   2A44 0B                  498 	.db #0x0b	; 11
   2A45 0A                  499 	.db #0x0a	; 10
   2A46 0B                  500 	.db #0x0b	; 11
   2A47 0A                  501 	.db #0x0a	; 10
   2A48 0B                  502 	.db #0x0b	; 11
   2A49 0A                  503 	.db #0x0a	; 10
   2A4A 0B                  504 	.db #0x0b	; 11
   2A4B 0A                  505 	.db #0x0a	; 10
   2A4C 0B                  506 	.db #0x0b	; 11
   2A4D 0A                  507 	.db #0x0a	; 10
   2A4E 0B                  508 	.db #0x0b	; 11
   2A4F 0A                  509 	.db #0x0a	; 10
   2A50 0B                  510 	.db #0x0b	; 11
   2A51 0A                  511 	.db #0x0a	; 10
   2A52 0B                  512 	.db #0x0b	; 11
   2A53 14                  513 	.db #0x14	; 20
   2A54 15                  514 	.db #0x15	; 21
   2A55 14                  515 	.db #0x14	; 20
   2A56 15                  516 	.db #0x15	; 21
   2A57 14                  517 	.db #0x14	; 20
   2A58 15                  518 	.db #0x15	; 21
   2A59 14                  519 	.db #0x14	; 20
   2A5A 15                  520 	.db #0x15	; 21
   2A5B 14                  521 	.db #0x14	; 20
   2A5C 15                  522 	.db #0x15	; 21
   2A5D 14                  523 	.db #0x14	; 20
   2A5E 15                  524 	.db #0x15	; 21
   2A5F 14                  525 	.db #0x14	; 20
   2A60 15                  526 	.db #0x15	; 21
   2A61 14                  527 	.db #0x14	; 20
   2A62 15                  528 	.db #0x15	; 21
   2A63 14                  529 	.db #0x14	; 20
   2A64 15                  530 	.db #0x15	; 21
   2A65 1E                  531 	.db #0x1e	; 30
   2A66 1F                  532 	.db #0x1f	; 31
   2A67 1E                  533 	.db #0x1e	; 30
   2A68 1F                  534 	.db #0x1f	; 31
   2A69 1E                  535 	.db #0x1e	; 30
   2A6A 1F                  536 	.db #0x1f	; 31
   2A6B 1E                  537 	.db #0x1e	; 30
   2A6C 1F                  538 	.db #0x1f	; 31
   2A6D 1E                  539 	.db #0x1e	; 30
   2A6E 1F                  540 	.db #0x1f	; 31
   2A6F 1E                  541 	.db #0x1e	; 30
   2A70 1F                  542 	.db #0x1f	; 31
   2A71 1E                  543 	.db #0x1e	; 30
   2A72 1F                  544 	.db #0x1f	; 31
   2A73 1E                  545 	.db #0x1e	; 30
   2A74 1F                  546 	.db #0x1f	; 31
   2A75 1E                  547 	.db #0x1e	; 30
   2A76 1F                  548 	.db #0x1f	; 31
                            549 	.area _INITIALIZER
                            550 	.area _CABS (ABS)
