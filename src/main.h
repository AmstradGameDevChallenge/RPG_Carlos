typedef struct {
	u8 name[10]; //nombre 
    u8 energy;   //HP
    u8 max_energy; //Maximo HP que puede tener
	u8 attack; //puntos de ataque
	u8 force;  //fuerza
	u8 defense; //puntos de curación
	u8 pos_x; //posición x en el área de juego
	u8 pos_y; //posición y en el marcador
	u8* sprite; //sprite asociado
} TStats;

extern TStats entidad[3];  //entidad[0] es el jugador; los otros dos los enemigos
extern u8 nivel;


/*
- flag completar nivel (enemigos sin energia)
- IA básica enemigos
*/