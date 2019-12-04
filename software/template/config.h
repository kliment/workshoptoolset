// Type to use for duty cycle calculations. Change this to float if you want to
// use a PID or non-integral P-values.
typedef int32_t REAL;

// Maximum allowed duty cycle. Do not set this to more than 100!
#define MAX_DUTY_CYCLE 90u

// If defined, use a PID
// #define PID

static const REAL Kp = (REAL)10.0;
static const REAL Ki = (REAL)0.0;
static const REAL Kd = (REAL)0.5;

// The red LED is on when the tip is hot enough to hurt your fingers
#define RED_LED_PORT PORTC
#define RED_LED_PIN  1

// The white LED is on when the temperature is close to the setpoint, and
// blinks while heating
#define WHITE_LED_PORT PORTC
#define WHITE_LED_PIN  2

#define SET_DIR(NAME) NAME##_PORT.DIRSET = NAME##_PIN;
#define CLR_DIR(NAME) NAME##_PORT.DIRCLR = NAME##_PIN;
#define SET_PIN(NAME) NAME##_PORT.OUTSET = NAME##_PIN;
#define CLR_PIN(NAME) NAME##_PORT.OUTCLR = NAME##_PIN;

#if MAX_DUTY_CYCLE >= 100
#error MAX_DUTY_CYCLE must not be greater than 99
#endif
