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
#include "funciones.h"
#include "juego.h"
#include "absolutas.h"
#include "m_intro.h"



//////// VARIABLES GLOBALES ///////////////////////////////////////////////////////////////

const u8 paletaM1[4] = {0x54, 0x40, 0x4B, 0x44};
TStats entidad[3];
u8 nivel;
u8 cursorConsola;
u8 sig_nivel;
u8 contador_musica;
u8 musica_sonando;

void playFX (u8 instrumento, u8 nota) {
// SFXPlay admite notas de 0 a 143, es decir 144 notas. Siendo 12 notas por octava, daría para 12 octavas
// Sin embargo, Arkos sólo muestra octavas de 0 a A
// Para obtener una nota hay que calcular
// ((octava * 12) + nota (teniendo en cuenta semitonos)) - 1. Por ejemplo E2 => (2 * 12) + 5 - 1

   cpct_akp_SFXInit (m_sfx);
   cpct_akp_SFXPlay (instrumento, 15, nota, 0, 0, AY_CHANNEL_B);
}

void reproducirMusica(){
   //El reproductor Arkos hace uso de los registros auxiliares (AF',BC',...) por lo que si luego se hace uso
   //de funciones que hagan uso de ellos (como easytiles) puede corromperse el programa si llega la interrupción a medio proceso.
   //Por eso, es mejor curarse en salud y guardarlos siempre de manera manual antes de llamar a la reproducción de la música

   __asm
      EXX
      PUSH AF
      PUSH BC
      PUSH DE
      PUSH HL
   __endasm;
   cpct_akp_musicPlay();
   __asm
      POP HL
      POP DE
      POP BC
      POP AF
      EXX
   __endasm;
}

void intHandler(){
   cpct_scanKeyboard_if();  //Para capturar teclado para quitar música o salir durante el juego

   //Las interrupciones se llaman 300 veces por segundo, la música debe sonar 50 veces por segundo (50hz)
   //por lo que sólo hay que llamar al siguiente bloque de música cada 6 veces
   if (!contador_musica && musica_sonando) {   
      reproducirMusica();
      contador_musica = 6;
   }

   contador_musica--;
}

void setInterruptAtVSYNCStart(void *intHdl){
   //Asegurarnos que cambiamos la gestión de interrupciones al terminar VSync
   //pues el primero puede saltar si estamos a mitad de VSync. Por eso se pasan 2 interrupciones más y entra en espera.
   //(halt paraliza la ejecución hasta que se produzca una nueva interrupción)
   //Ahora es seguro que saltará de la espera al llegar el CRTC al VSync
   cpct_waitVSYNC();
   __asm
      halt 
      halt
   __endasm;
   //Nos aseguramos que CRTC estaba a mitad de pantalla
   cpct_waitVSYNC(); //Me aseguro que se espera al final del pintado de la pantalla para cambiar el código de la interrupción
   cpct_setInterruptHandler(intHdl);
}

void main(void) {
   u8 semilla;

   contador_musica = 5;
    
   // Disable firmware, clear and colour screen (black)
   cpct_disableFirmware();
   setInterruptAtVSYNCStart(intHandler);
   
   

   efecto_pliegue(PLIEGUE);
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
      mydrawStringM1("Mendo to go back to his love: Lady Sol.", cpctm_screenPtr(CPCT_VMEM_START, 0, 136));
      mydrawStringM1("PRESS ANY KEY TO START", cpct_getScreenPtr(CPCT_VMEM_START, 0, 168));
      cpct_akp_musicInit((u8*) m_intro);
      musica_sonando = 1;
      efecto_pliegue(DESPLIEGUE);
      
      pausaTecladoLibre();
      
      //Wait for key
      semilla = 0;
      do {
         //cpct_scanKeyboard_f();
         semilla++;
      }
      while (!cpct_isAnyKeyPressed_f());

      
      if (!semilla)
         semilla = 1;

      cpct_srand8(semilla);
      cpct_akp_musicInit((u8*) m_sfx);
      //musica_sonando = 0;
      //cpct_akp_stop();
      juego();
   }
}
