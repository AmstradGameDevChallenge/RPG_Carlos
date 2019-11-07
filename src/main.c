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
#include "fonts.h"
#include "graficos.h"
#include "juego.h"



//////// VARIABLES GLOBALES ///////////////////////////////////////////////////////////////

const u8 paletaM1[4] = {0x54, 0x40, 0x4B, 0x44};
TStats entidad[3];
u8 nivel;
u8 cursorConsola;
u8 sig_nivel;


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
      mydrawStringM1("         Don Mendo and Lady Sol", cpctm_screenPtr(CPCT_VMEM_START, 0, 0));
      mydrawStringM1("                   in", cpctm_screenPtr(CPCT_VMEM_START, 0, 8));
      mydrawStringM1("           Castle Concepcion", cpctm_screenPtr(CPCT_VMEM_START, 0, 16));
      mydrawStringM1("Mendo was in love with Lady Sol, a rich ", cpctm_screenPtr(CPCT_VMEM_START, 0, 40));
      mydrawStringM1("and beautiful woman. He was so poor that", cpctm_screenPtr(CPCT_VMEM_START, 0, 48));
      mydrawStringM1("he couldn't marry her. He decided to go ", cpctm_screenPtr(CPCT_VMEM_START, 0, 56));
      mydrawStringM1("to the Crusades to get Fortune and Fame.", cpctm_screenPtr(CPCT_VMEM_START, 0, 64));

      mydrawStringM1("When he became a brave hero, he heard", cpctm_screenPtr(CPCT_VMEM_START, 0, 80));
      mydrawStringM1("Lady Sol was forced to marry don Ricardo", cpctm_screenPtr(CPCT_VMEM_START, 0, 88));
      mydrawStringM1("a very important noble. ", cpctm_screenPtr(CPCT_VMEM_START, 0, 96));

      mydrawStringM1("Bring to an end the bloody Crusades war,", cpctm_screenPtr(CPCT_VMEM_START, 0, 112));
      mydrawStringM1("go through the underway passage and ", cpctm_screenPtr(CPCT_VMEM_START, 0, 120));
      mydrawStringM1("finally assault the Castle to help Don ", cpctm_screenPtr(CPCT_VMEM_START, 0, 128));
      mydrawStringM1("Mendo to go back to his love: Lady Sun.", cpctm_screenPtr(CPCT_VMEM_START, 0, 136));
      mydrawStringM1("PRESS ANY KEY TO START", cpct_getScreenPtr(CPCT_VMEM_START, 0, 168));

      
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
      juego();
   }
}
