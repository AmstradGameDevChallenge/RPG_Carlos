#define INICIO_AREA_JUEGO  cpctm_screenPtr (CPCT_VMEM_START, 4, 64)
#define SEGUNDO 32768
#define PLIEGUE 0
#define DESPLIEGUE 1

typedef struct {
	u8 name[10]; //nombre 
    u8 energy;   //HP
    u8 max_energy; //Maximo HP que puede tener
	u8 attack; //puntos de ataque
	u8 force;  //fuerza
	u8 defense; //puntos de curación
	u8 pos_x; //posición x en el área de juego
	u8 pos_x_ant; //posición x anterior en el área de juego (para borrados)
	u8 pos_y; //posición y en el marcador
	u8* sprite; //sprite asociado
} TStats;

extern TStats entidad[3];  //entidad[0] es el jugador; los otros dos los enemigos
extern u8 nivel;
extern u8 cursorConsola;
extern u8 sig_nivel;
extern const TStats SoldadoArabe;

void mydrawStringM1 (void* string, void* video_memory) __z88dk_callee;
//void mydrawCharM1 (void* video_memory, u8 ascii) __z88dk_callee;
/*
- flag completar nivel (enemigos sin energia)
- IA básica enemigos
*/