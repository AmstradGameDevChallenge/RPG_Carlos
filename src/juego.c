#define INICIO_AREA_JUEGO  cpctm_screenPtr (CPCT_VMEM_START, 4, 64)

#include <cpctelera.h>
#include <stdio.h>
#include <string.h>
#include "main.h"
#include "graficos.h"
#include "patrones/patronesTiles_1.h"
#include "mapas/fase_02.h"
#include "mapas/fase_01.h"
#include "mapas/fase_03.h"
#include "mapas/fase_04.h"
#include "mapas/fase_05.h"
#include "mapas/fase_06.h"
#include "mapas/fase_07.h"
#include "mapas/fase_08.h"
#include "mapas/fase_09.h"
#include "mapas/fase_10.h"

u8 cursorConsola;

u8 abs (i8 valor){
   return (valor > 0 ? valor : -valor);
}

void pausa() {
	u16 i;

	for (i = 0; i < 32768 /*16384*/; i++)
			;
}

void pausaTecladoLibre(){
	while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
   		cpct_scanKeyboard_f();
   	}
}

void dibujarMarco (){
	//fase 0=cruzadas; 1=subterráneo; 2=castillo
	u8 i;
	u8* tile;

	tile = (u8*) &G_tile_cruzada[0];
	if ((nivel/10) == 1)
		tile = (u8*) &G_tile_cruzada[0];

	//dibujar marco alrededor de pantalla
		//filas horizontales
	for (i=0; i < 80; i += 4) {
		cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,   0), 4, 16);
		cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i, 176), 4, 16);
		cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,  48), 4, 16);
	}
		//filas verticales
	for (i=16; i < 176; i += 16 ){
		cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, 0, i), 4, 16);
		cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,76, i), 4, 16);	
		if (i>63)
			cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,40, i), 4, 16);
		
	}

  //Hueco para consola de mensajes
  cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
}

void dibujarEscenario(){
  u8* mapa;

  cpct_etm_setTileset2x4(tileset1);
  if (nivel > 10)
    cpct_etm_setTileset2x4(tileset1);

  mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
  
  cpct_etm_drawTilemap2x4 ( g_mapa01_W, g_mapa01_H , INICIO_AREA_JUEGO, mapa);
}

void initPlayer(){
   strcpy(entidad[0].name,"Don Mendo");
   entidad[0].max_energy = 99;
   entidad[0].energy = entidad[0].max_energy;
   entidad[0].attack = 30;
   entidad[0].force = 6;
   entidad[0].defense = 15;
   entidad[0].pos_x = 8;
   entidad[0].pos_x_ant = 8;
   entidad[0].pos_y = 24;
   entidad[0].sprite = (u8*) &G_mendo[0];
}

void initNivel(){
	//Por defecto enemigos a 0
	entidad[1].max_energy = 0;
  entidad[1].pos_x_ant = 4;
  entidad[2].max_energy = 0;
	entidad[2].pos_x_ant = 4;


	//Crear enemigos
	if (nivel == 1) {
    cpct_memcpy (&entidad[1],&SoldadoArabe,sizeof(TStats));
 	}
  if (nivel == 2) {
    cpct_memcpy (&entidad[1],&SoldadoArabe,sizeof(TStats));
    cpct_memcpy (&entidad[2],&SoldadoArabe,sizeof(TStats));
    entidad[2].pos_x = 36;
  }

  entidad[1].pos_y = 32;
  entidad[2].pos_y = 40;
 	entidad[1].energy = entidad[1].max_energy;
 	entidad[2].energy = entidad[2].max_energy;
}

void printStats(TStats *a) {
	u8 temp[36];
  
  cpct_setDrawCharM1(2, 0);
	sprintf(temp, "                                    ");
	if (a->energy)
   		sprintf(temp, "%-9s=> HP:%02d. ATT: %02d. DEF: %02d",a->name, a->energy,a->attack,a->defense);
   	
   	cpct_drawStringM1(temp, cpct_getScreenPtr(CPCT_VMEM_START, 4, a->pos_y));
}

void printLevel() {
  u8 temp[40];
   
  sprintf(temp, "LEVEL: %02d",nivel);
  cpct_setDrawCharM1(2, 0);
  cpct_drawStringM1(temp, cpctm_screenPtr(CPCT_VMEM_START, 4, 16));
}

void printConsole  (void* string, u8 pen, u8 bground) {
   if (cursorConsola > 175){
   	//pausa y volver al inicio
   	pausa();
    cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
    cursorConsola = 64;
   }

   cpct_setDrawCharM1(pen, bground);
   cpct_drawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 44, cursorConsola));
   cursorConsola +=8;
}

void atacar(TStats *a, TStats *b) {
	u8 temp[20], ataque, pen, bg;


	pen = 0;
	bg = 2;
	if ((u16) a->sprite == (u16) G_mendo)  {
		pen = 2;
		bg = 0;
	}


  ataque = a->attack + (2*(cpct_rand()%a->force)) - a->force;
	sprintf(temp, "%-9s ATT %02d",a->name, ataque);
  printConsole(temp, pen, bg);

  if (ataque < b->energy) {
  	b->energy = b->energy - ataque;
   	sprintf(temp, "%-9s HP=>%02d",b->name, b->energy);
  } else {
   	b->energy = 0;
   	sprintf(temp, "%-9s DIED! ",b->name, b->energy);
    printStats(b);
    //Invertir colores 
    ataque = pen;
    pen = bg;
    bg = ataque;
  }

  printConsole(temp, pen, bg);
}

void defender(TStats *a) {
  u8 temp[20], healed, pen, bg;

	pen = 0;
	bg = 2;
	if ((u16) a->sprite == (u16) G_mendo)  {
		pen = 2;
		bg = 0;
	}

  if (a->energy + a->defense < a->max_energy)
    healed = a->defense;
  else
    healed = a->max_energy - a->energy;

  a->energy = a->energy + healed;
  
  if (healed) {
    sprintf(temp, "%-9s %c %02dHP",a->name, 240,healed);
    printConsole(temp, pen, bg);
  }
}

u8 turno() { //devuelve valor 0 cuando muere personaje o se termina nivel
	u8 i,j,temp[36], enemy_mov, nueva_pos;
  u8* mapa;
	
  //borrar personajes en posición anterior (no se puede hacer en mismo bucle que pintado porque un enemigo puede borrar al protagonista)
  for (i = 0; i < 3; i++) {
    mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
    cpct_etm_drawTileBox2x4 ((entidad[i].pos_x_ant - 4)/2, 17, 2, 7, g_mapa01_W, INICIO_AREA_JUEGO, mapa );
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
            
    if (nueva_pos == entidad[1].pos_x)
     	atacar(&entidad[0], &entidad[1]);

    if (nueva_pos == entidad[2].pos_x)
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

  pausa();
  pausaTecladoLibre();


  // Se ha completado nivel
	if (!(entidad[1].energy || entidad[2].energy)) {
    if (nivel == 10) {// Fin del Juego
      sprintf(temp, "CONGRATULATIONS!");
      entidad[0].energy = 0;
    } else {
		  nivel++;
      entidad[0].pos_x = 8;
      sprintf(temp, "   NEXT LEVEL   ");
    }
    printConsole(temp, 0, 2);
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
	initPlayer();

	while(entidad[0].energy) {
		cpct_clearScreen(0x00);
		cursorConsola = 64;

		dibujarMarco();
		dibujarEscenario();

		initNivel();
    printLevel();
		while (turno())
			;

		do {
      cpct_scanKeyboard_f();
    } while (!cpct_isAnyKeyPressed_f());
	}
}