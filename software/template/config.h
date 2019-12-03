typedef int32_t REAL;
static const uint8_t MAX_DUTY_CYCLE = 90u;

// If defined, use a PID
// #define PID

static const REAL Kp = (REAL)10.0;
static const REAL Ki = (REAL)0.0;
static const REAL Kd = (REAL)0.5;

#define HOT_LED_PORT PORTC
#define HOT_LED_PIN  1

#define HEATING_LED_PORT PORTC
#define HEATING_LED_PIN  2

#define SET_DIR(NAME) NAME##_PORT.DIRSET = NAME##_PIN;
#define CLR_DIR(NAME) NAME##_PORT.DIRCLR = NAME##_PIN;
#define SET_PIN(NAME) NAME##_PORT.OUTSET = NAME##_PIN;
#define CLR_PIN(NAME) NAME##_PORT.OUTCLR = NAME##_PIN;
