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
                             20 ;;
                             21 ;; Include constants and general values
                             22 ;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             23 .include "/home/cpp76s/cpctelera_git/cpctelera/src/strings/strings.s"
                              1 ;;-----------------------------LICENSE NOTICE------------------------------------
                              2 ;;  This file is part of CPCtelera: An Amstrad CPC Game Engine 
                              3 ;;  Copyright (C) 2014-2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
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
                             18 ;#####################################################################
                             19 ;### MODULE: Strings                                               ###
                             20 ;#####################################################################
                             21 ;### Routines to print and manage characters and strings           ###
                             22 ;#####################################################################
                             23 ;
                             24 .module cpct_strings
                             25 
                             26 ;;
                             27 ;; Compilation control directives
                             28 ;;
                             29 ;; If true, interrupts can be disabled to get function parameters faster
                     0000    30 .equ let_disable_interrupts_for_function_parameters, 0  
                             31 
                             32 ;;
                             33 ;; Constant values
                             34 ;;
                     3800    35 .equ char0_ROM_address, 0x3800   ;; Address where definition of character 0 starts in ROM
                     007F    36 .equ GA_port_byte,      0x7F     ;; 8-bit Port of the Gate Array
                             37 
                             38 ;;
                             39 ;; External values
                             40 ;;
                             41 .globl _cpct_mode_rom_status       ;; defined in firmware_ed.s
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             24 
                             25 ;;
                             26 ;; C bindings for <mydrawStringM1>
                             27 ;;
                             28 ;;   29 us, 13 bytes
                             29 ;;
   88BA                      30 _mydrawStringM1::
   88BA FD 22 D5 88   [20]   31    ld (saveiy), iy   ;; [6] Save IY before modifying them
                             32 
   88BE E1            [10]   33    pop   hl          ;; [3] HL = Return Address
   88BF FD E1         [14]   34    pop   iy          ;; [5] BC = Pointer to the null terminated string
   88C1 E3            [19]   35    ex  (sp), hl      ;; [6] HL = Destination address (Video memory location where character will be printed)
                             36                      ;; ... and leave only return address at the top of the stack,
                             37                      ;; ... to fullfill __z88dk_callee calling convention
                             38 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                             39 .include /mydrawStringM1.asm/
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
                             22 ;; Function: mydrawStringM1
                             23 ;;
                             24 ;;    Prints a null-terminated string with ROM characters on a given byte-aligned 
                             25 ;; position on the screen in Mode 1 (320x200px, 4 colours).
                             26 ;;
                             27 ;; C Definition:
                             28 ;;    void <mydrawStringM1> (void* *string*, void* *video_memory*) __z88dk_callee;
                             29 ;;
                             30 ;; Input Parameters (4 Bytes):
                             31 ;;  (2B IY) string       - Pointer to the null terminated string being drawn
                             32 ;;  (2B HL) video_memory - Video memory location where the string will be drawn
                             33 ;;
                             34 ;; Assembly call (Input parameters on registers):
                             35 ;;    > call mydrawStringM1_asm
                             36 ;;
                             37 ;; Parameter Restrictions:
                             38 ;;  * *string* must be a null terminated string. It could contain any 8-bit value as 
                             39 ;; characters except 0, which will signal the end of the string. Be careful to provide
                             40 ;; strings with a 0 (null) at the end of the string. Otherwise, unexpected results may
                             41 ;; happen (Typically, rubbish characters printed on screen and, occasionally, memory 
                             42 ;; overwrite and even hangs or crashes).
                             43 ;;  * *video_memory* could theoretically be any 16-bit memory location. It will work
                             44 ;; outside current screen memory boundaries, which is useful if you use any kind of
                             45 ;; double buffer. However, be careful where you use it, as it does no kind of check
                             46 ;; or clipping, and it could overwrite data if you select a wrong place to draw.
                             47 ;;
                             48 ;; Requirements and limitations:
                             49 ;;  * *Do not put this function's code below 0x4000 in memory*. In order to read
                             50 ;; characters from ROM, this function enables Lower ROM (which is located 0x0000-0x3FFF),
                             51 ;; so CPU would read code from ROM instead of RAM in first bank, effectively shadowing
                             52 ;; this piece of code. This would lead to undefined results (typically program would
                             53 ;; hang or crash).
                             54 ;;  * This routine does not check for boundaries. If you draw too long strings or out 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 5.
Hexadecimal [16-Bits]



                             55 ;; of the screen, unpredictable results will happen.
                             56 ;;  * Screen must be configured in Mode 1 (320x200 px, 4 colours)
                             57 ;;  * This function requires the CPC *firmware* to be *DISABLED*. Otherwise, random
                             58 ;; crashes might happen due to side effects.
                             59 ;;  * This function *disables interrupts* during main loop (character printing), and
                             60 ;; re-enables them at the end.
                             61 ;;  * This function *will not work from ROM*, as it uses self-modifying code.
                             62 ;;
                             63 ;; Details:
                             64 ;;    This function receives a null-terminated string and draws it to the screen in 
                             65 ;; Mode 1 (320x200, 4 colours). To do so, it repeatedly calls <mydrawCharM1_inner_asm>,
                             66 ;; for every character to be drawn. As foreground and background colours it uses the
                             67 ;; ones previously set up by the latest call to <cpct_setDrawCharM1>. Therefore, you
                             68 ;; need to call <cpct_setDrawCharM1> previous to using this function to select the
                             69 ;; colours you want the text to be drawn of. However, once you set colours, they 
                             70 ;; remain set with no need to call <cpct_setDrawCharM1> again.
                             71 ;;
                             72 ;;   *video_memory* parameter points to the byte where the string will be
                             73 ;; drawn. The first pixel of that byte will be the upper-left corner of the string.
                             74 ;; As this function uses a byte-pointer to refer to the upper-left corner of the 
                             75 ;; string, it can only start drawing the string on every pixel columns divisible by 4 
                             76 ;; (0, 4, 8, 12...), as every byte contains 4 pixels in Mode 1.
                             77 ;;
                             78 ;;    Usage of this function is quite straight-forward, as you can see in the 
                             79 ;; following example,
                             80 ;; (start code)
                             81 ;;    // Just print some strings for testing
                             82 ;;    void main () {
                             83 ;;       u8* pvmem;  // Pointer to video memory
                             84 ;;
                             85 ;;       // Set video mode 0
                             86 ;;       cpct_disableFirmware();
                             87 ;;       cpct_setVideoMode(1);
                             88 ;;
                             89 ;;       // Draw some testing strings with curious colours, more or less centered
                             90 ;;       pvmem = cpctm_screenPtr(CPCT_VMEM_START, 16, 88);  // Calculate video memory address
                             91 ;;       cpct_setDrawCharM1(3, 1);                          // Red over yellow
                             92 ;;       mydrawStringM1("Hello there!", pvmem);          // Draw the string
                             93 ;;
                             94 ;;       pvmem = cpctm_screenPtr(CPCT_VMEM_START, 20, 108); // Calculate new video memory address
                             95 ;;       cpct_setDrawCharM1(2, 3);                          // Blue over red
                             96 ;;       mydrawStringM1("Great man!",   pvmem);          // Draw the string
                             97 ;;
                             98 ;;       // And loop forever
                             99 ;;       while(1);
                            100 ;;    }
                            101 ;; (end code)
                            102 ;;
                            103 ;; Destroyed Register values: 
                            104 ;;    C bindings     - AF, BC, DE, HL
                            105 ;;    ASM bindings   - AF, BC, DE, HL, IY
                            106 ;;
                            107 ;; Required memory:
                            108 ;;    C bindings     - 48 bytes (+80 bytes <mydrawCharM1_inner_asm> = 128 bytes)
                            109 ;;    ASM bindings   - 36 bytes (+80 bytes <mydrawCharM1_inner_asm> = 116 bytes)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 6.
Hexadecimal [16-Bits]



                            110 ;;
                            111 ;; Time Measures:
                            112 ;; (start code)
                            113 ;;   Case     | microSecs (us) |  CPU Cycles
                            114 ;; -------------------------------------------
                            115 ;;   Best     |   62 + 486*L   |  248 + 1944*L
                            116 ;;   Worst    |   62 + 494*L   |  248 + 1976*L
                            117 ;; ----------------------------------------------
                            118 ;; Asm saving |      -26       |      -104
                            119 ;; ----------------------------------------------
                            120 ;; (end code)
                            121 ;;    L = Length of the string (excluding null-terminator character)
                            122 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                            123 
                            124 .globl mydrawCharM1_inner_asm
                            125 
                            126 ;;   ;; Enable Lower ROM during char copy operation, with interrupts disabled 
                            127 ;;   ;; to prevent firmware messing things up
                            128 ;;   ld     a,(_cpct_mode_rom_status) ;; [4] A = mode_rom_status (present value)
                            129 ;;   and    #0b11111011               ;; [2] bit 3 of A = 0 --> Lower ROM enabled (0 means enabled)
                            130 ;;   ld     b, #GA_port_byte          ;; [2] B = Gate Array Port (0x7F)
                            131 ;;   di                               ;; [1] Disable interrupts to prevent firmware from taking control while Lower ROM is enabled
                            132 ;;   out   (c), a                     ;; [3] GA Command: Set Video Mode and ROM status (100)
                            133 
   88C2 18 09         [12]  134    jr    firstChar                  ;; [3] Jump to first char (Saves 1 jr back every iteration)
                            135 
   88C4                     136 nextChar:
                            137    ;; Draw next character
   88C4 E5            [11]  138    push  hl                         ;; [4] Save HL
   88C5 CD D8 88      [17]  139    call  mydrawCharM1_inner_asm  ;; [5 + 458/466] Draws the next character
   88C8 E1            [10]  140    pop   hl                         ;; [3] Recover HL 
                            141 
                            142    ;; Increment Pointers
   88C9 23            [ 6]  143    inc   hl                         ;; [2] /
   88CA 23            [ 6]  144    inc   hl                         ;; [2] | HL += 2 (point to next position in video memory, 8 pixels to the right)
   88CB FD 23         [10]  145    inc   iy                         ;; [3] IX += 1 (point to next character in the string)
                            146 
   88CD                     147 firstChar:
   88CD FD 7E 00      [19]  148    ld     a, (iy)                   ;; [5] A = next character from the string
   88D0 B7            [ 4]  149    or     a                         ;; [1] Check if A = 0
   88D1 20 F1         [12]  150    jr    nz, nextChar               ;; [2/3] if A != 0, A is next character, draw it, else end
                            151 
   88D3                     152 endstring:
                            153 ;;   ;; After finishing character drawing, restore previous ROM and Interrupts status
                            154 ;;   ld     a, (_cpct_mode_rom_status) ;; [4] A = mode_rom_status (present saved value)
                            155 ;;   ld     b, #GA_port_byte           ;; [2] B = Gate Array Port (0x7F)
                            156 ;;   out   (c), a                      ;; [3] GA Command: Set Video Mode and ROM status (100)
                            157 ;;   ei                                ;; [1] Enable interrupts
                            158 
                            159 ;; IY Restore and Return provided by bindings
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 7.
Hexadecimal [16-Bits]



                             40 
                     001B    41 saveiy = .+2
   88D3 FD 21 00 00   [14]   42    ld    iy, #0000   ;; [6] Restore IY before returning (0000 is a placeholder)
   88D7 C9            [10]   43    ret               ;; [3] Return
