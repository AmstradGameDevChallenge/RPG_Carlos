#include <cpctelera.h>
#include <stdio.h>
#include <string.h>
#include "main.h"
#include "graficos.h"

void initSoldadoArabe1(TStats *entidad) {
  strcpy(entidad->name,"Soldier 1");
   entidad->max_energy = 60;
   entidad->attack = 20;
   entidad->force = 5;
   entidad->defense = 10;
   entidad->sprite = (u8*) &G_arabe_1[0];
}

void initSoldadoArabe2(TStats *entidad) {
  strcpy(entidad->name,"Soldier 2");
   entidad->max_energy = 75;
   entidad->attack = 30;
   entidad->force = 10;
   entidad->defense = 20;
   entidad->sprite = (u8*) &G_arabe_2[0];
}

void initSoldadoArabe3(TStats *entidad) {
  strcpy(entidad->name,"Soldier 3");
   entidad->max_energy = 90;
   entidad->attack = 30;
   entidad->force = 20;
   entidad->defense = 30;
   entidad->sprite = (u8*) &G_arabe_3[0];
}

void initFakir(TStats *entidad) {
  strcpy(entidad->name,"Fakir");
   entidad->max_energy = 60;
   entidad->attack = 40;
   entidad->force = 0;
   entidad->defense = 5;
   entidad->sprite = (u8*) &G_fakir[0];
}

void initAbeja(TStats *entidad) {
  strcpy(entidad->name,"Bee");
  entidad->max_energy = 60;
  entidad->attack = 30;
  entidad->force = 10;
  entidad->defense = 5;
  entidad->sprite = (u8*) &G_abeja[0];
}

void initMurcielago(TStats *entidad) {
  strcpy(entidad->name,"Evil Bat");
   entidad->max_energy = 60;
   entidad->attack = 20;
   entidad->force = 5;
   entidad->defense = 10;
   entidad->sprite = (u8*) &G_murcielago[0];
}

void initEsqueleto(TStats *entidad) {
  strcpy(entidad->name,"Skeleton");
   entidad->max_energy = 75;
   entidad->attack = 30;
   entidad->force = 10;
   entidad->defense = 20;
   entidad->sprite = (u8*) &G_esqueleto[0];
}

void initGusano(TStats *entidad) {
  strcpy(entidad->name,"Worm");
   entidad->max_energy = 60;
   entidad->attack = 40;
   entidad->force = 0;
   entidad->defense = 5;
   entidad->sprite = (u8*) &G_gusano[0];
}

void initSpider(TStats *entidad) {
  strcpy(entidad->name,"Spider");
   entidad->max_energy = 90;
   entidad->attack = 30;
   entidad->force = 20;
   entidad->defense = 30;
   entidad->sprite = (u8*) &G_spider[0];
}

void initGoblin(TStats *entidad) {
  strcpy(entidad->name,"Goblin");
  entidad->max_energy = 60;
  entidad->attack = 30;
  entidad->force = 10;
  entidad->defense = 5;
  entidad->sprite = (u8*) &G_goblin[0];
}

void initPlayer(){
   strcpy(entidad[0].name,"Don Mendo");
   entidad[0].max_energy = entidad[0].energy = 99;
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
    initSoldadoArabe1(&entidad[1]);
 	}
  if (nivel == 2) {
    initSoldadoArabe1(&entidad[1]);
    initSoldadoArabe1(&entidad[2]);
  }
  if (nivel == 3){
    initAbeja(&entidad[1]);
    initSoldadoArabe1(&entidad[2]);
  }
  if (nivel == 4){
    initSoldadoArabe2(&entidad[1]);
  }
  if (nivel == 6){
    initAbeja(&entidad[1]);
    initFakir(&entidad[2]);
  }
  if (nivel == 7){
    initSoldadoArabe2(&entidad[1]);
    initSoldadoArabe3(&entidad[2]);
  }
  if (nivel == 8){
    initFakir(&entidad[1]);
    initSoldadoArabe2(&entidad[2]);
  }
  if (nivel == 9){
    initSoldadoArabe3(&entidad[1]);
    initSoldadoArabe3(&entidad[2]);
  }
  if (nivel == 10){
    strcpy(entidad[2].name,"Boss Lvl1");
    entidad[2].max_energy = 99;
    entidad[2].attack = 40;
    entidad[2].force = 10;
    entidad[2].defense = 25;
    entidad[2].sprite = (u8*) &G_arabe_boss[0];
  }

  if (nivel == 11) {
    initMurcielago(&entidad[1]);
  }
  if (nivel == 12) {
    initMurcielago(&entidad[1]);
    initEsqueleto(&entidad[2]);
  }
  if (nivel == 13){
    initEsqueleto(&entidad[1]);
    initEsqueleto(&entidad[2]);
  }
  if (nivel == 14){
    initMurcielago(&entidad[1]);
    initGusano(&entidad[2]);
  }
  if (nivel == 16){
    initEsqueleto(&entidad[1]);
    initGusano(&entidad[2]);
  }
  if (nivel == 17){
    initSpider(&entidad[1]);
    initSpider(&entidad[2]);
  }
  if (nivel == 18){
    initGoblin(&entidad[1]);
    initGoblin(&entidad[2]);
  }
  if (nivel == 19){
    initGoblin(&entidad[1]);
    initSpider(&entidad[2]);
  }
  if (nivel == 20){
    strcpy(entidad[2].name,"Boss Lvl2");
    entidad[2].max_energy = 99;
    entidad[2].attack = 40;
    entidad[2].force = 10;
    entidad[2].defense = 25;
    entidad[2].sprite = (u8*) &G_cavern_boss[0];
  }

  entidad[1].pos_x = 28;  //Posición del sprite en pantalla
  entidad[2].pos_x = 36;
  entidad[1].pos_y = 32;  //Posición en el marcador
  entidad[2].pos_y = 40;  //
 	entidad[1].energy = entidad[1].max_energy;
 	entidad[2].energy = entidad[2].max_energy;
}
