#include <atmel_start.h>
#define __DELAY_BACKWARD_COMPATIBLE__
#include <util/delay.h>
#include <ccp.h>
#include "config.h"

volatile int duty = 0;

volatile uint16_t temp  = 0;
volatile uint16_t atemp = 0;
REAL total_error = 0, prev_error = 0;
volatile int setpoint    = 0;
volatile int oldsetpoint = 0;
volatile int maxduty     = 60;
volatile int deftemp     = 320;
volatile int idlesecs    = 120;
volatile int offmins     = 5;
volatile int offsettemp  = 0;

volatile int btnflag   = 0;
volatile int vibrflag  = 0;
volatile int btnignore = 0;

volatile uint16_t cycles  = 0;
volatile uint16_t seconds = 0;
volatile uint16_t minutes = 0;

volatile uint8_t datareg[9] = {0};
//[0] - curtemp C/2 (ro)
//[1] - state|atemp C/2 (ro)
//[2] - duty (ro)
//[3] - settemp C/2
//[4] - maxpower (x/15)
//[5] - defaultt (C/2)
//[6] - idlesecs(s*10)
//[7] - offmins (min)
//[8] - tempoffset (127=0)

int standby = 0;  // 0=off/heating/hot/cooling, 1=standby, vibration wake

static uint8_t FLASH_0_read_eeprom_byte(uint16_t eeprom_adr) {
  return *(uint8_t *)(EEPROM_START + eeprom_adr);
}

static void FLASH_0_write_eeprom_byte(uint16_t eeprom_adr, uint8_t data) {
  /* Wait for completion of previous write */
  while (NVMCTRL.STATUS & NVMCTRL_EEBUSY_bm)
    ;

  /* Clear page buffer */
  ccp_write_spm((void *)&NVMCTRL.CTRLA, NVMCTRL_CMD_PAGEBUFCLR_gc);

  /* Write byte to page buffer */
  *(uint8_t *)(EEPROM_START + eeprom_adr) = data;

  /* Erase byte and program it with desired value */
  ccp_write_spm((void *)&NVMCTRL.CTRLA, NVMCTRL_CMD_PAGEERASEWRITE_gc);
}

void updateeeprom(uint16_t addr, uint8_t val) {
  if (FLASH_0_read_eeprom_byte(addr) != val) {
    FLASH_0_write_eeprom_byte(addr, val);
  }
}

static inline void calctemp(uint16_t adcval) {
  // int8_t sigrow_offset = SIGROW.TEMPSENSE1; // Read signed value from signature row
  // uint8_t sigrow_gain = SIGROW.TEMPSENSE0;
  // Read unsigned value from signature row
  uint16_t adc_reading = adcval;
  // ADC conversion result with 1.1 V internal reference
  uint32_t xtemp = adc_reading - (int8_t)SIGROW.TEMPSENSE1;
  xtemp *= (uint8_t)SIGROW.TEMPSENSE0;  // Result might overflow 16 bit variable (10bit+8bit)
  xtemp += 0x80;
  // Add 1/2 to get correct rounding on division below
  xtemp >>= 8;
  // Divide result to get Kelvin
  uint16_t temperature_in_C = xtemp - 273;
  atemp                     = temperature_in_C + offsettemp;
}

void pid_harder() {
  if (temp > setpoint) {
    duty = 0;
    return;
  }

  int32_t error = setpoint - temp;
  total_error += error;
  if (total_error > maxduty * 1.0f)
    total_error = maxduty * 1.0f;
  else if (total_error < 0.0f)
    total_error = 0.0f;

  int32_t pduty =
      Kp * error;

#ifdef PID
  double delta_error = error - prev_error;
  prev_error = error;

  pduty += (Ki*100.0)*total_error + (Kd/100.0)*delta_error;
#endif

  if (pduty > maxduty)
    pduty = maxduty;
  else if (pduty < 0)
    pduty = 0;

  duty       = pduty;
}

int main(void) {
  VREF_CTRLA = VREF_ADC0REFSEL_1V1_gc     /* Voltage reference at 1.1V */
               | VREF_DAC0REFSEL_0V55_gc; /* Voltage reference at 0.55V */

  VREF_CTRLB = 1 << VREF_ADC0REFEN_bp    /* ADC0 reference enable: enabled */
               | 0 << VREF_DAC0REFEN_bp; /* DAC0/AC0 reference enable: disabled */

  uint8_t signature = FLASH_0_read_eeprom_byte(0);
  if (signature != 0xce) {
    FLASH_0_write_eeprom_byte(1, maxduty);           // max power = 60%
    FLASH_0_write_eeprom_byte(2, deftemp >> 1);      // default temp = 320C
    FLASH_0_write_eeprom_byte(3, idlesecs);          // idle secs
    FLASH_0_write_eeprom_byte(4, offmins);           // offmins
    FLASH_0_write_eeprom_byte(5, 127 + offsettemp);  // offsettemp
    FLASH_0_write_eeprom_byte(0, 0xce);              // signature
  } else {
    maxduty    = FLASH_0_read_eeprom_byte(1);
    deftemp    = FLASH_0_read_eeprom_byte(2) << 1;
    idlesecs   = FLASH_0_read_eeprom_byte(3);
    offmins    = FLASH_0_read_eeprom_byte(4);
    offsettemp = FLASH_0_read_eeprom_byte(5) - 127;
  }
  // setpoint=0;
  datareg[4] = maxduty;
  datareg[5] = deftemp >> 1;
  datareg[6] = idlesecs;
  datareg[7] = offmins;
  datareg[8] = 127 + offsettemp;
  atmel_start_init();
  PORTC.DIRSET = 1;
  PORTC.DIRSET = 2;
  PORTC.OUTSET = 1;
  PORTC.OUTSET = 2;
  sei();
  ADC_0_enable();
  I2C_0_open();

  while (1) {
    // temp++;
    calctemp(ADC_0_get_conversion(ADC_MUXPOS_TEMPSENSE_gc) >> 5);
    temp = ((int)(1.00 * (ADC_0_get_conversion(6) >> 5))) + atemp;
    if (temp > 55) {
      PORTC.OUTSET = 1;
    } else {
      PORTC.OUTCLR = 1;
    }
    PORTC.OUTCLR = 2;

    if (btnignore) {
      btnignore--;
      btnflag = 0;
    } else if (btnflag) {
      // not ignoring button, first click event:
      if (setpoint > 0) {
        oldsetpoint = setpoint;
        setpoint    = 0;  // power off on button press
        standby     = 0;
      } else {
        if (oldsetpoint) {
          setpoint = oldsetpoint;
        } else {
          setpoint = deftemp;  // power on on button press
        }
        standby = 0;
      }
      btnignore = 3;  // ignore button presses for 300ms
      btnflag   = 0;
    }
    if (setpoint && temp < setpoint - 15) {
      // blink white while heating
      if (cycles > 4) {
        PORTC.OUTSET = 2;
      } else {
        PORTC.OUTCLR = 2;
      }
    }
    if (setpoint && temp >= setpoint - 15) {
      PORTC.OUTSET = 2;
    }
    if (setpoint) {
      pid_harder();
    } else {
      duty = 0;
    }
    if (duty > 0) {
      FET_set_level(true);
      _delay_ms(duty);
    }
    FET_set_level(false);
    datareg[0] = (temp >> 1) & 0xff;
    datareg[1] &= ~0x1f;
    datareg[1] = (atemp >> 1) & 0x1f;
    datareg[2] = duty;
    datareg[3] = (setpoint >> 1) & 0xff;
    _delay_ms(100 - (duty > MAX_DUTY_CYCLE ? MAX_DUTY_CYCLE : duty));
    cycles++;
    if (cycles == 10) {
      seconds++;
      if (idlesecs && seconds >= idlesecs) {
        oldsetpoint = setpoint;
        setpoint    = 0;
        standby     = 1;
      }
      cycles = 0;
      if (seconds % 60 == 0) {
        minutes++;
        if (idlesecs == 0) {
          seconds = 0;
        } else {
          if (seconds > idlesecs) {
            seconds = 0;
          }
        }
        if (offmins) {
          if (minutes > offmins) {
            oldsetpoint = setpoint;
            setpoint    = 0;
            standby     = 0;
            minutes     = 0;
          }
        } else {
          minutes = 0;
        }
      }
    }
    if (vibrflag) {
      vibrflag = 0;
      if (standby && !setpoint && oldsetpoint) {
        setpoint = oldsetpoint;
        standby  = 0;
      } else if (!setpoint) {
        PORTC.OUTSET = 2;
      } else {
        seconds = 0;
        minutes = 0;
      }
    }
  }
}

ISR(PORTB_PORT_vect) {
  /* Insert your PORTB interrupt handling code here */

  // BTN pressed handler
  btnflag = 1;

  /* Clear interrupt flags */
  VPORTB_INTFLAGS = (1 << 4);
}

ISR(PORTC_PORT_vect) {
  /* Insert your PORTC interrupt handling code here */
  vibrflag = 1;
  /* Clear interrupt flags */
  VPORTC_INTFLAGS = (1 << 1) | (1 << 3);
}
