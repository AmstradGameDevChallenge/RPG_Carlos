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

u8 abs (i8 valor){
   return (valor > 0 ? valor : -valor);
}

void pausa(u16 ciclos) {
  u16 i;

  for (i = 0; i < ciclos; i++)
      ;
}

void efecto_pliegue(u8 modo) {
  u8 i,j;

  i = 200;
  if (modo)
    i = 1;
  
  do {
    cpct_setCRTCReg (1, i/5);   //Cambiar nº columnas por pantalla (1-40)
    cpct_setCRTCReg (6, i/8);   //Cambiar nº de filas por pantallas (1-25)

    for (j = 0; j < 255; j++)
      ;

    if (modo) {
      i++;
    } else {
      i--; 
    }
  } while (i > 0 && i <= 200);
}


void pausaTecladoLibre(){
	while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
   		cpct_scanKeyboard_f();
   	}
}

void dibujarMarcoExterior (){
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
  }
    //filas verticales
  for (i=16; i < 176; i += 16 ){
    cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, 0, i), 4, 16);
    cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START,76, i), 4, 16);  
  }

}

void dibujarMarcoInterior (){
  //fase 0=cruzadas; 1=subterráneo; 2=castillo
  u8 i;
  u8* tile;

  tile = (u8*) &G_tile_cruzada[0];
  if ((nivel/10) == 1)
    tile = (u8*) &G_tile_cruzada[0];

  //dibujar marco alrededor de pantalla
    //filas horizontales
  for (i=0; i < 80; i += 4) {
    cpct_drawSprite (tile,  cpct_getScreenPtr (CPCT_VMEM_START, i,  48), 4, 16);
  }
    //filas verticales
  for (i=64; i < 176; i += 16 ){
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
    pausa(SEGUNDO);
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

void drawPotion(){
  cpct_drawSpriteMasked (G_pocion, cpctm_screenPtr (CPCT_VMEM_START, 28, 144), 2,16);
}