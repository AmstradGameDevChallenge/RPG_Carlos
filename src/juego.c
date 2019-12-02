#include <cpctelera.h>
#include <stdio.h>
#include <string.h>
#include "main.h"
#include "niveles.h"
#include "funciones.h"

extern u8 g_mapa01[504];


u8 turno() { //devuelve valor 0 cuando muere personaje o se termina nivel
	u8 i,temp[36];
  u8* mapa;

  //borrar personajes en posición anterior (no se puede hacer en mismo bucle que pintado porque un enemigo puede borrar al protagonista)
  for (i = 0; i < 3; i++) {
    mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
    cpct_etm_drawTileBox2x4 ((entidad[i].pos_x_ant - 4)/2, 17, 2, 7, 18, INICIO_AREA_JUEGO, mapa );
  }

  cpct_waitVSYNC();
	//pintar stats & sprites
	for (i = 0; i < 3; i++) {
		if (entidad[i].energy) {
			printStats(&entidad[i]);
			cpct_drawSpriteMasked (entidad[i].sprite, cpct_getScreenPtr (CPCT_VMEM_START, entidad[i].pos_x, 132), 4,28);
      entidad[i].pos_x_ant = entidad[i].pos_x;
		}
	}

  // Fin del Juego
  if (nivel == 31) {
    printConsole("Don Mendo", 2, 0);
    printConsole("&", 2, 0);
    printConsole("Lady Sol", 2, 0);
    printConsole(" ", 2, 0);
    printConsole("together at last", 2, 0);
    printConsole("CONGRATULATIONS!", 0, 2);
    entidad[0].energy = 0;

    pausaTecladoLibre();
    do {
        ;
    } while (!cpct_isAnyKeyPressed_f());
    return 0;
  } 

  //pintar pociones en niveles especiales
  if (nivel == 5 || nivel == 15 || nivel == 25) {
    drawPotion();
  }


	// TURNO JUGADOR //////////////////////////////
		// Tomar acción
	i = 0;
  do  {
//    	cpct_scanKeyboard_f();
    	sprintf(temp, "ACTION (</>/D) ?");
    	if (i < 25) {
			printConsole(temp, 2, 0);
    	} else {
    		printConsole(temp, 0, 2);
    	}
    	i++;
		cursorConsola -=8;
		if (i == 50)
			i=0;
	}
  while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_CursorLeft)  && !cpct_isKeyPressed(Joy0_Left) 
    	&& !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_CursorRight) && !cpct_isKeyPressed(Joy0_Right) 
    	&& !cpct_isKeyPressed(Key_D) && !cpct_isKeyPressed(Joy0_Fire1));
  
	// Mover izquierda
  if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
   	moverIzq(&entidad[0]);
  }

  // Mover derecha y posible ataque
  if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
   	moverDcha(&entidad[0]);
  }

  // Defensa
  if (cpct_isKeyPressed(Key_D) || cpct_isKeyPressed(Joy0_Fire1)) {
   	defender(&entidad[0]);
  }
  

  // TURNO ENEMIGOS //////////////
  for (i = 1; i < 3; i++) {
   	if (entidad[i].energy) {
      IA (&entidad[i]);
    }
  }

  pausa(SEGUNDO);
  pausaTecladoLibre();


  // Se ha completado nivel
  if (nivel == 5 || nivel == 15 || nivel == 25) {
    if (entidad[0].pos_x == 28) {
      //Beber Poción y aumentar atributo
      if (cpct_rand() % 2){
        // Mejora de salud 50%
        entidad[0].max_energy +=10;
        entidad[0].energy = entidad[0].max_energy;
        sprintf(temp, "%-9s ^ HP",entidad[0].name);
        printConsole(temp, 2, 0);
      } else if (cpct_rand() % 2){
        //Mejora de Ataque 25%
        entidad[0].attack += 5;
        sprintf(temp, "%-9s ^ ATT",entidad[0].name);
        printConsole(temp, 2, 0);
      } else {
        //Mejora de Defensa 25%
        entidad[0].defense += 5;
        sprintf(temp, "%-9s ^ DEF",entidad[0].name);
        printConsole(temp, 2, 0);
      }
        
      printStats(&entidad[0]);
      sig_nivel = 1;
    }

  } else if (!(entidad[1].energy || entidad[2].energy)) {
    sig_nivel = 1;
  }


  if (sig_nivel) {
	  nivel++;
    entidad[0].pos_x = 8;
    sprintf(temp, "   NEXT LEVEL   ");

    printConsole(temp, 0, 2);
    sig_nivel = 0;
		return 0;
	}

  // Hemos muerto
  if (!entidad[0].energy) {
    sprintf(temp, "    GAME OVER   ");
    printConsole(temp, 0, 2);
    return 0;
  }
  else
    return 1;
}

void juego() {
  u8 i;

  nivel = 1;
  sig_nivel = 0;

	initPlayer();
  efecto_pliegue(PLIEGUE);
	while(entidad[0].energy) {
    i = 0;
		cpct_clearScreen(0x00);
    dibujarMarcoExterior();
    // Mostrar capítulos
    cpct_setDrawCharM1(2, 0);
    if (nivel == 1) {
      mydrawStringM1("Chapter 1", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
      mydrawStringM1("A faraway and foreign land ...", cpctm_screenPtr(CPCT_VMEM_START, 12, 96));
      i = 1;
    }
    if (nivel == 11) {
      mydrawStringM1("Chapter 2", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
      mydrawStringM1("A hidden passage to the Castle ...", cpctm_screenPtr(CPCT_VMEM_START, 6, 96));
      i = 1;
    }
    if (nivel == 21) {
      mydrawStringM1("Chapter 3", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
      mydrawStringM1("don Ricardo's Castle ...", cpctm_screenPtr(CPCT_VMEM_START, 15, 96));
      i = 1;
    }

    if (i) {
      efecto_pliegue(DESPLIEGUE);
      for (i=0; i< 5; i++)
        pausa(SEGUNDO);

      efecto_pliegue(PLIEGUE);
    }

		cursorConsola = 64;

    initNivel();
		dibujarMarcoInterior();
		dibujarEscenario();
    printLevel();

    efecto_pliegue(DESPLIEGUE);
		while (turno())
			;

		do {
      ;
    } while (!cpct_isAnyKeyPressed_f());
    efecto_pliegue(PLIEGUE);
	}
}