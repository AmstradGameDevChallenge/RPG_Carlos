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

u8 abs (i8 valor){
   return (valor > 0 ? valor : -valor);
}

void initPlayer(){
   strcpy(player.name,"PLAYER");
   player.max_energy = 99;
   player.energy = player.max_energy;
   player.attack = 30;
   player.defense = 15;
   player.pos_x = 5;
}

void initGoblin(){
   strcpy(goblin.name,"GOBLIN");
   goblin.max_energy = 90;
   goblin.energy = goblin.max_energy;
   goblin.attack = 20;
   goblin.defense = 10;
   goblin.pos_x = 7;
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
      cursorPrint = 44;
   }

   cpct_drawStringM1(string, cpct_getScreenPtr(CPCT_VMEM_START, 0, cursorPrint));
   cursorPrint +=8;

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
   cpct_setDrawCharM1(3, 0);
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
   cpct_setDrawCharM1(3, 0);
}


void game(){
   while (player.energy) {
      cpct_clearScreen(0x00);
      cursorPrint = 44;
      if (!goblin.energy) {
         initGoblin();
         showConsole("A GOBLIN APPEARS.");
      }

      
      printStats(&player);
      printStats(&goblin);
      cpct_drawStringM1("========================================", cpct_getScreenPtr(CPCT_VMEM_START, 0, 36));
  
      // RENDER Player
      cpct_drawStringM1("@", cpct_getScreenPtr(CPCT_VMEM_START, (player.pos_x)*2, 28));
      // RENDER Enemy
      cpct_drawStringM1("G", cpct_getScreenPtr(CPCT_VMEM_START, (goblin.pos_x)*2, 28));


      
      // Get Player Action
      showConsole("ACTION (O/P/D)?");
      do 
         cpct_scanKeyboard_f();
      while (!cpct_isKeyPressed(Key_O) && !cpct_isKeyPressed(Key_P) && !cpct_isKeyPressed(Key_D));
      
      //Erase prior position
      cpct_drawStringM1(" ", cpct_getScreenPtr(CPCT_VMEM_START, (player.pos_x)*2, 28));

      if (cpct_isKeyPressed(Key_O)) {
         player.pos_x--;
         if (!player.pos_x)
            player.pos_x = 1;
      }

      if (cpct_isKeyPressed(Key_P)) {
         player.pos_x++;
         if (player.pos_x == 40)
            player.pos_x = 39;
         if (player.pos_x == goblin.pos_x) {
            player.pos_x--;
            attack(&player, &goblin);
         }
      }

      //Defense
      if (cpct_isKeyPressed(Key_D)) {
         defense(&player);
      }

      // RENDER Player 
      cpct_drawStringM1("@", cpct_getScreenPtr(CPCT_VMEM_START, (player.pos_x)*2, 28));

      
      //Enemy turn
      if (goblin.energy) {
         if (abs(goblin.pos_x - player.pos_x) == 1) //attack
            attack(&goblin,&player);
         else  //defense
            defense(&goblin);
      } else {
         showConsole("YOU KILLED THE GOBLIN.");
      }

      if (!player.energy){
         showConsole("YOU DIED.");
      }

      while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
         cpct_scanKeyboard_f();
      }
      
      showConsole("PRESS ANY KEY TO CONTINUE");
      //Wait for key
      do 
         cpct_scanKeyboard_f();
      while (!cpct_isAnyKeyPressed_f());
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
      while (cpct_isAnyKeyPressed_f ()) { //Asegurarnos que se ha dejado de pulsar la tecla anterior 
         cpct_scanKeyboard_f();
      }
      
      semilla = 0;
      do {
         cpct_scanKeyboard_f();
         semilla++;
      }
      while (!cpct_isAnyKeyPressed_f());
      cpct_clearScreen(0x00);

      
      if (!semilla)
         semilla = 1;

      cpct_srand8(semilla);
      initPlayer();
      game();
   }
}
