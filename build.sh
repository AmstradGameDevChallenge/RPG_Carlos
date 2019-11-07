make cleanall 
#cpct_png2chars.exe ./doc/fuentes.png -o fonts -of src
#Si se rehace fonts.c, hay que volver a poner la dirección absoluta y declararlo constante __at (0x0040) const u8 chardata
#
make all 
cpct_winape agc.dsk