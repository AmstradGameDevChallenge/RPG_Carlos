10 REM
20 REM LOADER PARA LA VERSION DISCO
30 REM
40 REM SPLASHSCREEN DE CPCtelera
41 REM Lo cargo en 0x4000 y luego llamo donde está el main (0x448C)
42 REM
50 INK  0, 0: BORDER 0
60 CLS : MEMORY &4000: LOAD"!SPLASH.BIN",&4000 : CALL &44F3
64 REM
65 REM Hay que volver a cambiar fondo y borde porque se ha restaurado el firmware tras el splashscreen
66 REM
700 MODE 0
720 INK  0,&0D:INK  1,&0E:INK  2,&0C:INK  3,&00
730 INK  4,&19:INK  5,&10:INK  6,&1A:INK  7,&03
740 INK  8,&17:INK  9,&0A:INK 10,&01:INK 11,&04
750 INK 12,&09:INK 13,&11:INK 14,&16:INK 15,&0B
751 PAPER 3
752 BORDER 3
752 CLS
760 LOAD "!SCREEN0.BIN",&C000
1000 RUN"!DATA0.BIN"
