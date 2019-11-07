ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
                              4 ;;
                              5 ;;  This program is free software: you can redistribute it and/or modify
                              6 ;;  it under the terms of the GNU Lesser General Public License as published by
                              7 ;;  the Free Software Foundation, either version 3 of the License, or
                              8 ;;  (at your option) any later version.
                              9 ;;
                             10 ;;  This program is distributed in the hope that it will be useful,
                             11 ;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
                             12 ;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                             13 ;;  GNU Lesser General Public License for more details.
                             14 ;;
                             15 ;;  You should have received a copy of the GNU Lesser General Public License
                             16 ;;  along with this program.  If not, see <http://www.gnu.org/licenses/>.
                             17 ;;-------------------------------------------------------------------------------
                             18 .module cpct_strings
                             19 
                             20 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             21 ;;
                             22 ;; Function: mydrawCharM1_inner_asm
                             23 ;;
                             24 ;;    Inner function used by <mydrawCharM1> and <mydrawStringM1> to actually
                             25 ;; draw the character. This function shall not be used directly unless you know
                             26 ;; exactly what it does.
                             27 ;;
                             28 ;; Input Parameters (3 Bytes):
                             29 ;;  (2B HL) video_memory - Video memory location where the character will be drawn
                             30 ;;  (1B A ) ascii        - Character to be drawn (ASCII code)
                             31 ;;
                             32 ;; Assembly call (Input parameters on registers):
                             33 ;;    > call mydrawCharM1_inner_asm
                             34 ;;
                             35 ;; Parameter Restrictions:
                             36 ;;  * *video_memory* could theoretically be any 16-bit memory location. It will work
                             37 ;; outside current screen memory boundaries, which is useful if you use any kind of
                             38 ;; double buffer. However, be careful where you use it, as it does no kind of check
                             39 ;; or clipping, and it could overwrite data if you select a wrong place to draw.
                             40 ;;  * *ascii* could be any 8-bit value, as 256 characters are available in ROM.
                             41 ;;
                             42 ;; Requirements and limitations:
                             43 ;;  * This function *assumes Lower ROM (0x0000-0x3FFF) is enabled* to read ROM character 
                             44 ;; definitions. Therefore, this code should be above 0x3FFF to work; otherwise, it would
                             45 ;; become shadowed by ROM and results would be undefined. You may, theoretically, use it
                             46 ;; without ROM enabled and using your own character set definitions in RAM (0x3800-0x3FFF)
                             47 ;;  * Screen is assumed to be standard mode 0 (160x200, 16 colours)
                             48 ;;  * When reading from ROM, *interrupts should be disabled* to prevent firmware from
                             49 ;; taking over and causing undefined behaviour. 
                             50 ;;  * To make this function *work from ROM*, put the 16 bytes of *cpct_char2pxM1* in RAM.
                             51 ;;
                             52 ;; Details:
                             53 ;;    This function reads a character from ROM and draws it at a given *video_memory* location.
                             54 ;; *video_memory* points to the upper-left corner of location where the character will be drawn. 
                             55 ;; As this function assumes screen is configured for Mode 1 (320x200, 4 colours), it means that 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             56 ;; the character can only be drawn at even pixel columns (0, 4, 8, 12...), because each byte 
                             57 ;; contains 4 pixels in Mode 1. 
                             58 ;;
                             59 ;;    Character is drawn using 2 colours: foreground (FG) and background (BG). Both colours 
                             60 ;; *must be* configured previously by calling <cpct_setDrawCharM1>. You may call this function 
                             61 ;; once and then use the same colours for printing as long as you want. Every time you need 
                             62 ;; different colours, you need to call <cpct_setDrawCharM1> again. Default colours are FG=1, BG=0
                             63 ;; and will be used if <cpct_setDrawCharM1> has never been called previously.
                             64 ;;
                             65 ;;    This function is used by <mydrawCharM1> and <mydrawStringM1> as inner drawing loop.
                             66 ;;
                             67 ;; Destroyed Register values: 
                             68 ;;    AF, BC, DE, HL
                             69 ;;
                             70 ;; Required memory:
                             71 ;;    80 bytes (64 bytes code + 16 bytes colour table)
                             72 ;;
                             73 ;; Time Measures:
                             74 ;; (start code)
                             75 ;;   Case     | microSecs | CPU Cycles 
                             76 ;; -------------------------------------
                             77 ;;   Best     |    458    |    1832
                             78 ;;   Worst    |    466    |    1848
                             79 ;; -------------------------------------
                             80 ;; (end code)
                             81 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             82 
   5DD2                      83 mydrawCharM1_inner_asm::
                             84    ;; Calculate the memory address where the 8 bytes defining the character appearance 
                             85    ;; ... start (BC = 0x0040 + 8*ASCII value). charset_fonts_address = 0x0040. 
                             86    ;; ASCII value is in A=|hgfedcba|
                             87 
   5DD2 D6 20         [ 7]   88    sub #32           ;; Quitar 32 a A, pues el primer carácter imprimible en ASCII es el 32, y en mi charset es el 0 (no defino los 32 primeros)
                             89 
                             90 ;; Para multiplicar A * 8, se rota su valor tres veces a la izquierda. A=|hgfedcba| => A=|edcbahgf|
                             91 ;; Los tres bits que quedarán a la derecha serán el resultado para la parte alta
                             92 ;; y los 7 que quedan por la izquierda, el resultado de la parte baja
   5DD4 E5            [11]   93    push hl           ;; Guardo HL pues ahí está la dirección de memoria de vídeo donde escribir. Lo uso para luego hacer la suma del offset
                             94 
   5DD5 07            [ 4]   95    rlca              ;; A=|gfedcbah|
   5DD6 07            [ 4]   96    rlca              ;; A=|fedcbahg|
   5DD7 07            [ 4]   97    rlca              ;; A=|edcbahgf|
   5DD8 6F            [ 4]   98    ld    l, a        ;; L=|edcbahgf|
   5DD9 E6 07         [ 7]   99    and  #0b00000111  ;; A =|00000hgf| para quedarnos con la parte alta
   5DDB 67            [ 4]  100    ld    h, a        ;; H = |00000hgf|
   5DDC 7D            [ 4]  101    ld    a, l        ;; A = |edcbahgf|
   5DDD E6 F8         [ 7]  102    and  #0b111111000 ;; A = |edcba000| para quedarnos con la parte baja
   5DDF 6F            [ 4]  103    ld    l, a        ;; L = |edcba000|
                            104 ;; Now HL = |edcba|000| |00000hgf| = 8*ASCII  (little ending)      
                            105 ;; Queda sumar el offset de donde está el charset de las fuentes => 0x40
                            106    
   5DE0 01 40 00      [10]  107    ld bc,#0x40
   5DE3 09            [11]  108    add hl, bc
   5DE4 44            [ 4]  109    ld b, h
   5DE5 4D            [ 4]  110    ld c, l
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                            111 ;; El resultado hay que dejarlo en BC para que el resto de la función no haya que cambiarlo   
                            112 
   5DE6 E1            [10]  113    pop hl            ;; Restablecer la dirección de memoria de vídeo donde escribir en HL
                            114 
                            115 
   5DE7                     116 nextrow:
                            117    ;; HL holds destination video memory address where to draw next
                            118    ;; Lets put it on DE and use HL to point to the conversion table
   5DE7 EB            [ 4]  119    ex    de, hl       ;; [1] DE points to video memory, HL is free
                            120 
                            121    ;; Draw first 4 pixels (1st byte) of the row to the screen
   5DE8 21 1B 5E      [10]  122    ld    hl, #char2px ;; [3] HL points to char2pixels conversion table
   5DEB 0A            [ 7]  123    ld     a, (bc)     ;; [2] Get current row definition to extract the high nibble, which defines first 4 pixels
   5DEC 0F            [ 4]  124    rrca               ;; [1] / Switch both nibbles of A. We want to use the high nibble (4 highest bits)
   5DED 0F            [ 4]  125    rrca               ;; [1] | as a value to be added to the base address of the char2px table (now in HL)
   5DEE 0F            [ 4]  126    rrca               ;; [1] | to find the actual conversion to pixels.
   5DEF 0F            [ 4]  127    rrca               ;; [1] \ A = |abcdefgh| >>> A' = |efghabcd| 
   5DF0 E6 0F         [ 7]  128    and  #0x0F         ;; [2] A'' = |0000abcd| (Leave only the 4 highest bits of A as a 0-15 number)
   5DF2 85            [ 4]  129    add    l           ;; [1] /
   5DF3 6F            [ 4]  130    ld     l, a        ;; [1] | HL' = HL + A  
   5DF4 8C            [ 4]  131    adc    h           ;; [1] | We add the highest nibble of A to HL to get the first 4 pixel values to be
   5DF5 95            [ 4]  132    sub    l           ;; [1] | drawn to the screen (the first of two bytes to be written)
   5DF6 67            [ 4]  133    ld     h, a        ;; [1] \
   5DF7 7E            [ 7]  134    ld     a, (hl)     ;; [2] / Write first 4 pixels to the screen and increment destination pointer to leave
   5DF8 12            [ 7]  135    ld  (de), a        ;; [2] | it ready for the next 4 pixels.
   5DF9 13            [ 6]  136    inc   de           ;; [2] \ (DE) <- (HL) : DE++
                            137 
                            138    ;; Draw second 4 pixels (2nd byte) of the row to the screen
   5DFA 21 1B 5E      [10]  139    ld    hl, #char2px ;; [3] HL points to char2pixels conversion table again
   5DFD 0A            [ 7]  140    ld     a, (bc)     ;; [2] Get current row definition again, but this time to extract low nibble, defining next 4 pixels
   5DFE E6 0F         [ 7]  141    and  #0x0F         ;; [2] A = |abcdefgh| >>> A' = |0000efgh| (Leave only lowest nibble as a 0-15 value)
   5E00 85            [ 4]  142    add    l           ;; [1] / 
   5E01 6F            [ 4]  143    ld     l, a        ;; [1] | HL' = HL + A  
   5E02 8C            [ 4]  144    adc    h           ;; [1] | We add the lowest nibble of A to HL to get the next 4 pixel values to be
   5E03 95            [ 4]  145    sub    l           ;; [1] | drawn to the screen (the second of two bytes to be written)
   5E04 67            [ 4]  146    ld     h, a        ;; [1] \
   5E05 7E            [ 7]  147    ld     a, (hl)     ;; [2] / Write next 4 pixels to the screen 
   5E06 12            [ 7]  148    ld  (de), a        ;; [2] \ (DE) <- (HL)
                            149 
   5E07                     150 endpixelline:
                            151    ;; Move to next pixel-line definition of the character
   5E07 0C            [ 4]  152    inc    c           ;; [1] Next pixel Line (characters are 8-byte-aligned in memory, 
                            153                       ;; ... so we only need to increment C, as B will not change)
   5E08 79            [ 4]  154    ld     a, c        ;; [1] If next pixel line corresponds to a new character 
                            155                       ;; .... (this is, we have finished drawing our character), ....
   5E09 E6 07         [ 7]  156    and   #0x07        ;; [2] ... then C % 8 == 0, as it is 8-byte-aligned. 
   5E0B C8            [11]  157    ret   z            ;; [2/4] If C % 8 == 0, we have finished drawing the character, else, proceed to next line
                            158 
                            159    ;; Prepare to copy next line 
                            160    ;;  -- Move DE pointer to the next pixel line on the video memory
                            161    ;; (We save new calculations on HL, because it will be exchanged with DE at the start of nextrow: loop)
   5E0C 21 FF 07      [10]  162    ld    hl, #0x800-1 ;; [3] | Next pixel line is 0x800 bytes away in standard video modes
   5E0F 19            [11]  163    add   hl, de       ;; [3] | ..but DE has already being incremented by 1. So add 0x800-1 to
                            164                       ;;       ..DE to make it point to the start of the next pixel line in video memory
                            165    ;; Check if new address has crossed character boundaries (every 8 pixel lines)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



   5E10 7C            [ 4]  166    ld     a, h        ;; [1] A = H (top 8 bits of video memory address)
   5E11 E6 38         [ 7]  167    and   #0x38        ;; [2] We check if we have crossed memory boundary (every 8 pixel lines)
   5E13 20 D2         [12]  168    jr    nz, nextrow  ;; [2/3]  by checking the 4 bits that identify present memory line. 
                            169                       ;; .... If 0, we have crossed boundaries
   5E15                     170 boundary_crossed:
   5E15 11 50 C0      [10]  171    ld    de, #0xC050  ;; [3] | HL = HL + 0xC050: Relocate DE pointer to the start of the next pixel line in video memory
   5E18 19            [11]  172    add   hl, de       ;; [3] \ (Remember that HL and DE will be exchanged at the start of nextrow:)
   5E19 18 CC         [12]  173    jr    nextrow      ;; [3] Jump to continue with next pixel line
                            174 
                            175 ;; Character To Pixels Definition conversion table.
                            176 ;; This table is set up with the 16 combinations for pixel values using the current 
                            177 ;; PEN/PAPER selected configuration. This is used to convert the character definition
                            178 ;; to actual pixel values and then render them to screen
   5E1B                     179 cpct_char2pxM1:: .ds 16
                     0049   180 char2px = cpct_char2pxM1   ;; Alias for brevity
