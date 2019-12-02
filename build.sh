#cpct_png2chars.exe ./doc/fuentes.png -o fonts -of src
#Si se rehace fonts.c, hay que volver a poner la dirección absoluta y declararlo constante __at (0x0040) const u8 chardata
# Variables del nombre del proyecto y para llamar a iDSK y 2CDT
PROYECTO=agc
IDSK=${CPCT_PATH}/tools/iDSK-0.13/bin/iDSK.exe
CPC2CDT=${CPCT_PATH}/tools/cpc2cdt/bin/cpc2cdt
# Muestro fecha del sistema para que luego se pueda calcular lo que ha tardado en generarse todo
clear
date
echo ; echo ; echo 
# Limpio lo creado anteriormente para hacer un build completo, para evitar problemas si sólo se modifican .h que estén incluidos en otros ficheros 
make cleanall 
make all 
#
# CREACIÓN DEL DISCO
#
$IDSK ${PROYECTO}.dsk -g ${PROYECTO}.bin
#$IDSK ${PROYECTO}.dsk -r ${PROYECTO}.bin
mv ${PROYECTO}.bin data0.bin
rm ${PROYECTO}.dsk
$IDSK ${PROYECTO}.dsk -n
unix2dos ./doc/disc.bas
$IDSK ${PROYECTO}.dsk -i ./doc/disc.bas -t 0
$IDSK ${PROYECTO}.dsk -i ./dsk/splash.bin
$IDSK ${PROYECTO}.dsk -i ./dsk/screen0.bin
$IDSK ${PROYECTO}.dsk -i data0.bin
#
# CREACIÓN DEL CASSETTE
#
rm ${PROYECTO}.cdt
unix2dos ./doc/disc.bas
$CPC2CDT -t -b 2000 -m cpctxt -r ${PROYECTO} ./doc/disc.bas ${PROYECTO}.cdt
$CPC2CDT -t -b 2000 -m cpc  -r screen0.bin ./dsk/screen0.bin ${PROYECTO}.cdt
DIR_MAIN=`grep _main ./obj/${PROYECTO}.map  | cut -c 10-13`
DIR_MAIN=0x$DIR_MAIN
$CPC2CDT -t -b 2000 -m cpc -r data0.bin  -l 0x0040 -x $DIR_MAIN ./obj/${PROYECTO}.bin ${PROYECTO}.cdt 
# Borrar ficheros que se han extraído, ya no son necesarios
rm data0.bin
# Fecha para saber cuando terminó
date
echo ; echo ; echo 
# Ejecutar el disco final (WinApe no puede ejecutar directamente una cinta por línea de comando)
cpct_winape ${PROYECTO}.dsk