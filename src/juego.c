#include <cpctelera.h>
#include <stdio.h>
#include <string.h>
#include "main.h"
#include "niveles.h"
#include "funciones.h"

extern u8 g_mapa01[504];


u8 turno() { //devuelve valor 0 cuando muere personaje o se termina nivel
	u8 i,j,temp[36], enemy_mov, nueva_pos;
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
  //pintar pociones en niveles especiales
  if (nivel == 5 || nivel == 15 || nivel == 25) {
    drawPotion();
  }


	// TURNO JUGADOR //////////////////////////////

		// Tomar acción
	i = 0;
  do  {
    	cpct_scanKeyboard_f();
    	sprintf(temp, "ACTION (%c/%c/D) ?",242,243);
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
  
  nueva_pos = 0;

	// Mover izquierda
  if (cpct_isKeyPressed(Key_O) || cpct_isKeyPressed(Key_CursorLeft) || cpct_isKeyPressed(Joy0_Left)) {
   	sprintf(temp, "%-9s GOES %c",entidad[0].name,242);
   	printConsole(temp, 2, 0);

    nueva_pos = entidad[0].pos_x - 4;
  }

  // Mover derecha y posible ataque
  if (cpct_isKeyPressed(Key_P) || cpct_isKeyPressed(Key_CursorRight) || cpct_isKeyPressed(Joy0_Right)) {
   	sprintf(temp, "%-9s GOES %c",entidad[0].name,243);
   	printConsole(temp, 2 ,0);

    nueva_pos = entidad[0].pos_x + 4;
            
    if (nueva_pos == entidad[1].pos_x && entidad[1].energy)
     	atacar(&entidad[0], &entidad[1]);

    if (nueva_pos == entidad[2].pos_x && entidad[2].energy)
     	atacar(&entidad[0], &entidad[2]);

    }

  // Defensa
  if (cpct_isKeyPressed(Key_D) || cpct_isKeyPressed(Joy0_Fire1)) {
   	defender(&entidad[0]);
    }


  //Comprobar que el movimiento es posible (límites pantalla o enemigos)
  if (nueva_pos > 3 
   	&& nueva_pos < 37 
   	&& (!entidad[1].energy || nueva_pos != entidad[1].pos_x)
   	&& (!entidad[2].energy || nueva_pos != entidad[2].pos_x)
   	)
    entidad[0].pos_x = nueva_pos;

  // TURNO ENEMIGOS //////////////

  for (i = 1; i < 3; i++) {
   	if (entidad[i].energy) {
   		if (abs(entidad[i].pos_x - entidad[0].pos_x) == 4) //Si está en casilla contigua, atacar
   			atacar(&entidad[i], &entidad[0]);
   		else { 
       	enemy_mov = cpct_rand()%3; //33% de moverse a izquierda, derecha o curarse
       	if (enemy_mov == 1) {
       		sprintf(temp, "%-9s GOES %c",entidad[i].name,242);
		     	printConsole(temp, 0, 2);

	        nueva_pos = entidad[i].pos_x - 4;
       	} else if (enemy_mov == 2) {
         		sprintf(temp, "%-9s GOES %c",entidad[i].name,243);
	   	     	printConsole(temp, 0, 2);

		        nueva_pos = entidad[i].pos_x + 4;
       	} else
         		defender(&entidad[i]);
     	}

     	//Comprobar colisión con otros personajes
      for (j = 0; j < 3; j++) {
      	if (i!=j) {
      		if (entidad[j].pos_x == nueva_pos) {
      			nueva_pos = 0;
      			break;
      		}
      	}
      }

      //Comprobar que el movimiento es posible (límites pantalla)
		  if (nueva_pos > 3 && nueva_pos < 37)
				entidad[i].pos_x = nueva_pos; 
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
        entidad[0].energy = entidad[0].max_energy;
        sprintf(temp, "%-9s MAX HP",entidad[0].name);
        printConsole(temp, 2, 0);
      } else if (cpct_rand() % 2){
        //Mejora de Ataque 25%
        entidad[0].attack += 5;
        sprintf(temp, "%-9s %c ATT",entidad[0].name,240);
        printConsole(temp, 2, 0);
      } else {
        //Mejora de Defensa 25%
        entidad[0].defense += 5;
        sprintf(temp, "%-9s %c DEF",entidad[0].name,240);
        printConsole(temp, 2, 0);
      }
        
      printStats(&entidad[0]);
      sig_nivel = 1;
    }

  } else if (!(entidad[1].energy || entidad[2].energy)) {
    sig_nivel = 1;
  }


  if (sig_nivel) {
    if (nivel == 10) {// Fin del Juego
      sprintf(temp, "CONGRATULATIONS!");
      entidad[0].energy = 0;
    } else {
		  nivel++;
      entidad[0].pos_x = 8;
      sprintf(temp, "   NEXT LEVEL   ");
    }
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

	while(entidad[0].energy) {
    i = 0;
		cpct_clearScreen(0x00);
    dibujarMarcoExterior();
    // Mostrar capítulos
    if (nivel == 1) {
      cpct_drawStringM1("Chapter 1", cpctm_screenPtr(CPCT_VMEM_START, 30, 80));
      cpct_drawStringM1("A faraway and foreign land ...", cpctm_screenPtr(CPCT_VMEM_START, 12, 96));
      i = 1;
    }

    if (i) {
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
      cpct_scanKeyboard_f();
    } while (!cpct_isAnyKeyPressed_f());
    efecto_pliegue(PLIEGUE);
	}
}