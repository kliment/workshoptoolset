// Default settings - may be changed over I2C
#define DEFAULT_MAX_DUTY_CYCLE 90
#define DEFAULT_TEMPERATURE_SETPOINT 320
#define DEFAULT_IDLE_SECONDS 120
#define DEFAULT_OFF_MINUTES 5

// Type to use for duty cycle calculations. Change this to float if you want to
// use a PID or non-integral P-values.
typedef int32_t REAL;

// Time used to read the temperature, in ms. Also limits the duty cycle to 100-x %.
#define TEMPERATURE_READ_TIME 10u

// Switching period of the FET, in ms. Higher values lead to more variance on
// the power supply load, but less switching losses.
//
// Should be a divisor of (100 - TEMPERATURE_READ_TIME), or the timing will be
// off.
#define SWITCHING_PERIOD 5u

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

// Do not touch these
#define CYCLE_LENGTH 100
#if ((CYCLE_LENGTH - TEMPERATURE_READ_TIME) % SWITCHING_PERIOD) != 0
#warning Switching period does not divide cycle time
#endif

