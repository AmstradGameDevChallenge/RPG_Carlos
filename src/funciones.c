#include <cpctelera.h>
#include <stdio.h>
#include <string.h>
#include "main.h"
#include "graficos.h"
#include "patrones/patronesTiles_1.h"
#include "patrones/patronesTiles_2.h"
#include "patrones/patronesTiles_3.h"
#include "mapas/fase_01.h"
#include "mapas/fase_02.h"
#include "mapas/fase_03.h"
#include "mapas/fase_04.h"
#include "mapas/fase_05.h"
#include "mapas/fase_06.h"
#include "mapas/fase_07.h"
#include "mapas/fase_08.h"
#include "mapas/fase_09.h"
#include "mapas/fase_10.h"
#include "mapas/fase_11.h"
#include "mapas/fase_12.h"
#include "mapas/fase_13.h"
#include "mapas/fase_14.h"
#include "mapas/fase_15.h"
#include "mapas/fase_16.h"
#include "mapas/fase_17.h"
#include "mapas/fase_18.h"
#include "mapas/fase_19.h"
#include "mapas/fase_20.h"
#include "mapas/fase_21.h"
#include "mapas/fase_22.h"
#include "mapas/fase_23.h"
#include "mapas/fase_24.h"
#include "mapas/fase_25.h"
#include "mapas/fase_26.h"
#include "mapas/fase_27.h"
#include "mapas/fase_28.h"
#include "mapas/fase_29.h"
#include "mapas/fase_30.h"
#include "mapas/fase_31.h"

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

  i = 80;
  if (modo)
    i = 1;
  
  do {
    cpct_setCRTCReg (1, i/2);   //Cambiar nº columnas por pantalla (1-40)

    for (j = 0; j < 255; j++)
      ;

    if (modo) {
      i++;
    } else {
      i--; 
    }
  } while (i > 0 && i <= 80);
}


void pausaTecladoLibre(){
	while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
   		//cpct_scanKeyboard_f()
    ;
   	}
}

void dibujarMarcoExterior (){
  //fase 0=cruzadas; 1=subterráneo; 2=castillo
  u8 i;
  u8* tile;

  tile = (u8*) &G_tile_cruzada[0];
  if (nivel > 10)
    tile = (u8*) &G_tile_caverna[0];
  if (nivel > 20)
    tile = (u8*) &G_tile_castillo[0];

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
  if (nivel > 10)
    tile = (u8*) &G_tile_caverna[0];
  if (nivel > 20)
    tile = (u8*) &G_tile_castillo[0];

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
    cpct_etm_setTileset2x4(tileset2);
  if (nivel > 20)
    cpct_etm_setTileset2x4(tileset3);

  mapa = (u8*) (&g_mapa01[0] + ((nivel-1) * 504));
  
  __asm
      di
  __endasm;
  cpct_etm_drawTilemap2x4_f ( g_mapa01_W, g_mapa01_H , INICIO_AREA_JUEGO, mapa);
  __asm
      ei
  __endasm;
}


void printStats(TStats *a) {
  u8 temp[36];
  
  cpct_setDrawCharM1(2, 0);
  sprintf(temp, "                                    ");
  if (a->energy)
      sprintf(temp, "%-9s=> HP:%02d. ATT: %02d. DEF: %02d",a->name, a->energy,a->attack,a->defense);
    
    mydrawStringM1(temp, cpct_getScreenPtr(CPCT_VMEM_START, 4, a->pos_y));
}

void printLevel() {
  u8 temp[40];
   
  sprintf(temp, "LEVEL: %02d",nivel);
  cpct_setDrawCharM1(2, 0);
  mydrawStringM1(temp, cpctm_screenPtr(CPCT_VMEM_START, 4, 16));
}

void printConsole  (void* string, u8 pen, u8 bground) {
   if (cursorConsola > 175){
    //pausa y volver al inicio
    pausa(SEGUNDO);
    cpct_drawSolidBox (cpctm_screenPtr (CPCT_VMEM_START, 43, 56), cpct_px2byteM1 (0, 0, 0, 0), 34, 128); //borrar pantalla
    cursorConsola = 64;
   }

   cpct_setDrawCharM1(pen, bground);
   mydrawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 44, cursorConsola));
   cursorConsola +=8;
}

void atacar(TStats *a, TStats *b) {
  u8 temp[20], ataque, pen, bg, nota;


  pen = 0;
  bg = 2;
  nota = 33;
  if ((u16) a->sprite == (u16) G_mendo)  {
    pen = 2;
    bg = 0;
    nota = 23;
  }

  if (b->energy) { //Asegurarnos que el atacado sigue vivo
    ataque = a->attack + (2*(cpct_rand()%a->force)) - a->force;
    sprintf(temp, "%-9s ATT %02d",a->name, ataque);
    printConsole(temp, pen, bg);
    playFX (1, nota);
    pausa(SEGUNDO/2);

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
}

void comprobarPosicion (TStats *a, u8 nuevaPosicion){
  u8 nueva, j;

  nueva = nuevaPosicion;

  //Comprobar colisión con otros personajes
  for (j = 0; j < 3; j++) {
    if (a->id != j && entidad[j].energy) {
      if (entidad[j].pos_x == nueva) {
        nueva = 0;
        if (a->id == 0 || j == 0) //ataque sólo si está involucrado el jugador. Para que no se ataquen los enemigos
          atacar(&entidad[a->id], &entidad[j]);
        break;
      }
    }
  }

  //Comprobar que el movimiento es posible (límites pantalla)
  if (nueva > 3 && nueva < 37)
    a->pos_x = nueva;
}

void moverIzq(TStats *a) {
  u8 temp[20], pen, bg;

  pen = 0;
  bg = 2;
  if ((u16) a->sprite == (u16) G_mendo)  {
    pen = 2;
    bg = 0;
  }
    
  sprintf(temp, "%-9s GOES <",a->name);
  printConsole(temp, pen, bg);

  comprobarPosicion(a,a->pos_x - 4);
}

void moverDcha(TStats *a) {
  u8 temp[20], pen, bg;

  pen = 0;
  bg = 2;
  if ((u16) a->sprite == (u16) G_mendo)  {
    pen = 2;
    bg = 0;
  }
  
  sprintf(temp, "%-9s GOES >",a->name);
  printConsole(temp, pen, bg);

  comprobarPosicion(a,a->pos_x + 4);
}

void defender(TStats *a) {
  u8 temp[20], healed, pen, bg, nota;

  pen = 0;
  bg = 2;
  nota = 33;
  if ((u16) a->sprite == (u16) G_mendo)  {
    pen = 2;
    bg = 0;
    nota = 23;
  }

  if (a->energy + a->defense < a->max_energy)
    healed = a->defense;
  else
    healed = a->max_energy - a->energy;

  a->energy = a->energy + healed;
  
  if (healed) {
    sprintf(temp, "%-9s ^ %02dHP",a->name, healed);
    printConsole(temp, pen, bg);
    playFX (2, nota);
    pausa(SEGUNDO/2);
  }
}

void IA(TStats *a) {

  if ((u16) a->sprite == (u16) G_goblin) {
    if (cpct_rand() % 2)
      moverIzq(a);
  }

  if ( ((u16) a->sprite == (u16) G_arabe_1)
    || ((u16) a->sprite == (u16) G_arabe_2)
    || ((u16) a->sprite == (u16) G_esqueleto)
    || ((u16) a->sprite == (u16) G_spider)
    || ((u16) a->sprite == (u16) G_soldado_1)
    || ((u16) a->sprite == (u16) G_carcelero)
    || ((u16) a->sprite == (u16) G_caballero)
    )  {  
    //Esta IA hace que entre en modo ataque si el protagonista está a 2 casillas y no lo suelte (le perseguirá sin preocuparse de su salud)
    //Si no está cerca, 50% de curarse, 25 de moverse a izquierda, 25% a derecha
    if (abs(a->pos_x - entidad[0].pos_x) <= 8)  {
      moverIzq(a);
    }
    else {
      if (cpct_rand() % 2)
        defender(a);
      else { 
        if (cpct_rand() % 2)
          moverIzq(a);
        else 
          moverDcha(a);
      }
    }
  }
  if ((u16) a->sprite == (u16) G_abeja 
    || (u16) a->sprite == (u16) G_murcielago
    || nivel == 10
    || nivel == 20
    )  {  
  //50% de curarse o de avanzar hacia protagonista
    if (cpct_rand() % 2)
      defender(a);
    else
      moverIzq(a);
  }
  if (((u16) a->sprite == (u16) G_fakir)
    || ((u16) a->sprite == (u16) G_gusano)
    || ((u16) a->sprite == (u16) G_soldado_2)
    )  {  
  //Son enemigos de sólo ataque , cuando protagonista está en casilla contigua y les persigue
    if (abs(a->pos_x - entidad[0].pos_x) <= 4) 
      moverIzq(a);
  }
  if ((u16) a->sprite == (u16) G_arabe_3)  {  
  //Son enemigos de sólo ataque a distancia, siempre hacen daño en su turno.
  // Normalmente no se curan
    if (abs(a->pos_x - entidad[0].pos_x) <= 16) 
      atacar(a,&entidad[0]);
  }
  if ((u16) a->sprite == (u16) G_mago)  {  
  //ataque a distancia, siempre hacen daño en su turno.
    atacar(a,&entidad[0]);
  }

}


void drawPotion(){
  cpct_drawSpriteMasked (G_pocion, cpctm_screenPtr (CPCT_VMEM_START, 28, 144), 2,16);
}