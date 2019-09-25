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
#include "graficos.h"
#include "juego.h"


//////// VARIABLES GLOBALES ///////////////////////////////////////////////////////////////

const u8 paletaM1[4] = {0x54, 0x40, 0x4B, 0x44};
TStats entidad[3];
u8 nivel;


TStats player;
TStats goblin;
u8 cursorPrint;

const TStats SoldadoArabe = { "Soldier", 90, 90, 20, 3, 10, 28, 28, 32, &G_arabe_1[0] };


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
      cpct_setDrawCharM1(2, 0);
      cpct_drawStringM1("         Don Mendo and Lady Sol", cpctm_screenPtr(CPCT_VMEM_START, 0, 0));
      cpct_drawStringM1("                   in", cpctm_screenPtr(CPCT_VMEM_START, 0, 8));
      cpct_drawStringM1("           Castle Concepcion", cpctm_screenPtr(CPCT_VMEM_START, 0, 16));
      cpct_drawStringM1("Mendo was in love with Lady Sol, a rich ", cpctm_screenPtr(CPCT_VMEM_START, 0, 40));
      cpct_drawStringM1("and beautiful woman. He was so poor that", cpctm_screenPtr(CPCT_VMEM_START, 0, 48));
      cpct_drawStringM1("he couldn't marry her. He decided to go ", cpctm_screenPtr(CPCT_VMEM_START, 0, 56));
      cpct_drawStringM1("to the Crusades to get Fortune and Fame.", cpctm_screenPtr(CPCT_VMEM_START, 0, 64));

      cpct_drawStringM1("When he became a brave hero, he heard", cpctm_screenPtr(CPCT_VMEM_START, 0, 80));
      cpct_drawStringM1("Lady Sol was forced to marry don Ricardo", cpctm_screenPtr(CPCT_VMEM_START, 0, 88));
      cpct_drawStringM1("a very important noble. ", cpctm_screenPtr(CPCT_VMEM_START, 0, 96));

      cpct_drawStringM1("Bring to an end the bloody Crusades war,", cpctm_screenPtr(CPCT_VMEM_START, 0, 112));
      cpct_drawStringM1("go through the underway passage and ", cpctm_screenPtr(CPCT_VMEM_START, 0, 120));
      cpct_drawStringM1("finally assault the Castle to help Don ", cpctm_screenPtr(CPCT_VMEM_START, 0, 128));
      cpct_drawStringM1("Mendo to go back to his love: Lady Sun.", cpctm_screenPtr(CPCT_VMEM_START, 0, 136));
      cpct_drawStringM1("PRESS ANY KEY TO START", cpct_getScreenPtr(CPCT_VMEM_START, 0, 168));

      
      pausaTecladoLibre();
      
      //Wait for key
      semilla = 0;
      do {
         cpct_scanKeyboard_f();
         semilla++;
      }
      while (!cpct_isAnyKeyPressed_f());

      
      if (!semilla)
         semilla = 1;

      cpct_srand8(semilla);
      nivel = 1;
      juego();
   }
}
