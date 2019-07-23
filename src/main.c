//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

// RPG GAME - Amstrad GameDev Challenge
// 2019 Carlos Pérezgrín

#include <cpctelera.h>
#include <stdio.h>
#include <string.h>
#include "main.h"

const u8 paletaM1[4] = {0x54, 0x43, 0x4C, 0x4B};
TStats player;
TStats goblin;
u8 cursorPrint;

void initPlayer(){
   strcpy(player.name,"PLAYER");
   player.max_energy = 99;
   player.energy = player.max_energy;
   player.attack = 30;
   player.defense = 15;
}

void initGoblin(){
   strcpy(goblin.name,"GOBLIN");
   goblin.max_energy = 90;
   goblin.energy = goblin.max_energy;
   goblin.attack = 20;
   goblin.defense = 10;
}

void printStats(TStats *a) {

   u8 temp[40];
   u8 posy = 10;
   sprintf(temp, "%s %02d. ATTACK: %02d. DEFENSE: %02d",a->name, a->energy,a->attack,a->defense);

   if (a == &player) 
      posy = 0;

   cpct_drawStringM1(temp, cpct_getScreenPtr(CPCT_VMEM_START, 0, posy));
}


void showConsole  (void* string) {
   if (cursorPrint > 190){
      cpct_clearScreen(0x00);
      cursorPrint = 30;
   }

   cpct_drawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 0, cursorPrint));
   cursorPrint +=8;

   cpct_setDrawCharM1(3, 0);
   printStats(&player);
   printStats(&goblin);
   cpct_drawStringM1("========================================", cpct_getScreenPtr(CPCT_VMEM_START, 0, 20));
}


void attack(TStats *a, TStats *b) {
   u8 temp[40];

   if (a->attack < b->energy) 
      b->energy = b->energy - a->attack;
   else
      b->energy = 0;

   sprintf(temp, "%s attacks %02d.",a->name, a->attack);

   cpct_setDrawCharM1(2, 0);
   showConsole(temp);
}

void defense(TStats *a) {
   u8 temp[40], healed;

   healed = 0;
   if (a->energy + a->defense < a->max_energy)
      healed = a->defense;

   a->energy = a->energy + healed;
   
   sprintf(temp, "%s heals %02d.",a->name, healed);

   cpct_setDrawCharM1(1, 0);
   showConsole(temp);
}


void game(){
   while (player.energy) {
      initGoblin();
      showConsole("A GOBLIN APPEARS.");

      while (player.energy && goblin.energy) {
         // Get Player Action
         showConsole("ACTION (A/D)?");
         do 
            cpct_scanKeyboard_f();
         while (!cpct_isKeyPressed(Key_A) && !cpct_isKeyPressed(Key_D));
         
         //Attack
         if (cpct_isKeyPressed(Key_A)) {
            attack(&player, &goblin);
         }
         //Defense
         if (cpct_isKeyPressed(Key_D)) {
            defense(&player);
         }
         


         //Enemy turn
         if (goblin.energy) {
            if (cpct_rand()%4) {// 75% of attack
               attack(&goblin,&player);
            } else { //defense
               defense(&goblin);
            }
         } else {
            showConsole("YOU KILLED THE GOBLIN.");
         }

         if (!player.energy){
            showConsole("YOU DIED.");
         }
         
         while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
            cpct_scanKeyboard_f();
         }
      }
   }
}

void main(void) {
   u8 semilla;

   // Disable firmware, clear and colour screen (black)
   cpct_disableFirmware();


   while (1) {
      cpct_setVideoMode(1);
      cpct_clearScreen(0x00);
      cpct_setPalette(paletaM1,4);
      cpct_setBorder(HW_BLACK);

      //Intro (text int white)
      cpct_setDrawCharM1(3, 0);
      cpct_drawStringM1("RPG GAME", cpct_getScreenPtr(CPCT_VMEM_START, 0, 0));
      cpct_drawStringM1("PRESS ANY KEY TO START", cpct_getScreenPtr(CPCT_VMEM_START, 0, 20));

      //Wait for key
      semilla = 0;
      do {
         cpct_scanKeyboard_f();
         semilla++;
      }
      while (!cpct_isAnyKeyPressed_f());
      cpct_clearScreen(0x00);

      cursorPrint = 30;
      if (!semilla)
         semilla = 1;

      cpct_srand8(semilla);
      initPlayer();
      game();
   }
}
