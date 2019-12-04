/**
 * \file
 *
 * \brief I2C slave driver.
 *
 (c) 2018 Microchip Technology Inc. and its subsidiaries.

    Subject to your compliance with these terms,you may use this software and
    any derivatives exclusively with Microchip products.It is your responsibility
    to comply with third party license terms applicable to your use of third party
    software (including open source software) that may accompany Microchip software.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 */

/**
 * \defgroup doc_driver_i2c_slave I2C Slave Driver
 * \ingroup doc_driver_i2c
 *
 * \section doc_driver_i2c_slave_rev Revision History
 * - v0.0.0.1 Initial Commit
 *
 *@{
 */

#include <i2c_slave.h>
#include <driver_init.h>
#include <stdbool.h>
#include "../config.h"

// uint8_t FLASH_0_read_eeprom_byte(uint16_t eeprom_adr);
// void FLASH_0_write_eeprom_byte(uint16_t eeprom_adr, uint8_t data);
void updateeeprom(uint16_t addr, uint8_t val);

#define Slave_Addr_Read \
    ((TWSR0 & 0xF8) == 0xA8)  // Own SLA+R addr received and ACK has been returned
#define Slave_Addr_Write \
    ((TWSR0 & 0xF8) == 0x60)  // Own SLA+W addr received and ACK has been returned
#define Slave_Read                  ((TWSR0 & 0xF8) == 0xB8)  // Read data byte transmitted and ACK received
#define Slave_Write_Arb_lost        ((TWSR0 & 0xF8) == 0x38)  // Arbitration Lost in SLA+W
#define Slave_Write_Received_back   ((TWSR0 & 0xF8) == 0x68)  // Arbitration Lost in SLA+R/W as Master
#define Slave_Gencall_Received_back ((TWSR0 & 0xF8) == 0x78)  // General Call Address received
#define Slave_Read_Received_back \
    ((TWSR0 & 0xF8) == 0xB0)  // Own SLA+R has been received and ACK has been returned
#define Slave_Bus_Error ((TWSR0 & 0xF8) == 0x00)  // Bus Error
#define Slave_Write_Ack \
    ((TWSR0 & 0xF8) == 0x80)  // Earlier addressed with own SLA+W; Data received and ACK returned
#define Slave_Data_IRQ \
    ((TWSR0 & 0xF8) == 0xC8)  // Last Data Byte has been transmitted and ACK has been received
#define Slave_Stop \
    ((TWSR0 & 0xF8) == 0xA0)  // STOP Condition, Repeated START condition has been received
#define Slave_Not_Ack \
    ((TWSR0 & 0xF8) == 0xC0)  // Data Byte has been transmitted and NOT ACK has been received

// Read Event Interrupt Handlers
void I2C_0_read_callback(void);
void (*I2C_0_read_interrupt_handler)(void);

// Write Event Interrupt Handlers
void I2C_0_write_callback(void);
void (*I2C_0_write_interrupt_handler)(void);

// Address Event Interrupt Handlers
void I2C_0_address_callback(void);
void (*I2C_0_address_interrupt_handler)(void);

// Stop Event Interrupt Handlers
void I2C_0_stop_callback(void);
void (*I2C_0_stop_interrupt_handler)(void);

// Bus Collision Event Interrupt Handlers
void I2C_0_collision_callback(void);
void (*I2C_0_collision_interrupt_handler)(void);

// Bus Error Event Interrupt Handlers
void I2C_0_bus_error_callback(void);
void (*I2C_0_bus_error_interrupt_handler)(void);

/**
 * \brief Initialize I2C interface
 * If module is configured to disabled state, the clock to the I2C is disabled
 * if this is supported by the device's clock system.
 *
 * \return Nothing
 */
void I2C_0_init() {
    // TWI0.CTRLA = 0 << TWI_FMPEN_bp /* FM Plus Enable: disabled */
    //		 | TWI_SDAHOLD_OFF_gc /* SDA hold time off */
    //		 | TWI_SDASETUP_4CYC_gc; /* SDA setup time is 4 clock cycles */

    // TWI0.DBGCTRL = 1 << TWI_DBGRUN_bp; /* Debug Run: disabled */

    TWI0.SADDR = 0x33 << TWI_ADDRMASK_gp /* Slave Address: 0x33 */
                 | 0 << TWI_ADDREN_bp;   /* General Call Recognition Enable: disabled */

    // TWI0.SADDRMASK = 0 << TWI_ADDREN_bp /* Address Mask Enable: disabled */
    //		 | 0x0 << TWI_ADDRMASK_gp; /* Address Mask: 0x0 */

    TWI0.SCTRLA = 1 << TWI_APIEN_bp    /* Address/Stop Interrupt Enable: enabled */
                  | 1 << TWI_DIEN_bp   /* Data Interrupt Enable: enabled */
                  | 0 << TWI_ENABLE_bp /* Enable TWI Slave: enabled */
                  | 0 << TWI_PIEN_bp   /* Stop Interrupt Enable: enabled */
                  | 0 << TWI_PMEN_bp   /* Promiscuous Mode Enable: disabled */
                  | 0 << TWI_SMEN_bp;  /* Smart Mode Enable: disabled */
}

/**
 * \brief Open the I2C for communication. Enables the module if disabled.
 *
 * \return Nothing
 */
void I2C_0_open(void) {
    TWI0.SCTRLA |= TWI_ENABLE_bm;
}

/**
 * \brief Close the I2C for communication. Disables the module if enabled.
 *
 * \return Nothing
 */
void I2C_0_close(void) {
    TWI0.SCTRLA &= ~TWI_ENABLE_bm;
}

/**
 * \brief The function called by the I2C IRQ handler.
 * Can be called in a polling loop in a polled driver.
 *
 * \return Nothing
 */

static inline void TWI_SlaveAddressMatchHandler();
static inline void TWI_SlaveStopHandler();
static inline void TWI_SlaveDataHandler();
static inline void TWI_SlaveReadHandler();
static inline void TWI_SlaveWriteHandler();

void I2C_0_isr() {
    uint8_t currentStatus = TWI0.SSTATUS;

    /* If bus error. */
    if (currentStatus & TWI_BUSERR_bm) {
    }

    /* If transmit collision. */
    else if (currentStatus & TWI_COLL_bm) {
    }

    /* If address match. */
    else if ((currentStatus & TWI_APIF_bm) && (currentStatus & TWI_AP_bm)) {
        TWI_SlaveAddressMatchHandler();
    }

    /* If stop (only enabled through slave read transaction). */
    else if (currentStatus & TWI_APIF_bm) {
        TWI_SlaveStopHandler();
    }

    /* If data interrupt. */
    else if (currentStatus & TWI_DIF_bm) {
        TWI_SlaveDataHandler();
    }
}

static inline void TWI_SlaveAddressMatchHandler() {
    TWI0.SCTRLB = TWI_SCMD_RESPONSE_gc;
}
static uint8_t sent = 0;
static uint8_t recv = 0;

static inline void TWI_SlaveStopHandler() {
    TWI0.SCTRLB = TWI_SCMD_COMPTRANS_gc;
    /* Clear APIF, according to flowchart don't ACK or NACK */
    uint8_t currentStatus = TWI0.SSTATUS;
    TWI0.SSTATUS          = currentStatus | TWI_APIF_bm;
    sent                  = 0;
    recv                  = 0;
}

static inline void TWI_SlaveDataHandler() {
    if (TWI0.SSTATUS & TWI_DIR_bm) {
        TWI_SlaveWriteHandler();
    } else {
        TWI_SlaveReadHandler();
    }
}
extern volatile uint8_t datareg[9];
extern volatile int setpoint;
extern volatile int maxduty;
extern volatile int deftemp;
extern volatile int idlesecs;
extern volatile int offmins;
extern volatile int offsettemp;

static inline void TWI_SlaveReadHandler() {
    /* Enable stop interrupt. */
    uint8_t currentCtrlA = TWI0.SCTRLA;
    TWI0.SCTRLA          = currentCtrlA | TWI_PIEN_bm;

    /* If free space in buffer. */
    if (recv < 7) {
        /* Fetch data */

        uint8_t data = TWI0.SDATA;
        // if(recv>0){
        //    datareg[recv+1]=data;
        //}
        if (recv == 1) {
            // setting setpoint
            if (data <= 250) {
                datareg[3] = data;
                setpoint   = data << 1;
            }
        } else if (recv == 2) {
            // setting maxpower
            if (data < MAX_DUTY_CYCLE) {
                datareg[4] = data;
                maxduty    = data;
                updateeeprom(1, data);
            }
        } else if (recv == 3) {
            // setting defaulttemp
            if (data <= 250) {
                datareg[5] = data;
                updateeeprom(2, data);
            }
        } else if (recv == 4) {
            // setting idlesecs
            datareg[6] = data;
            idlesecs   = data;
            updateeeprom(3, data);
        } else if (recv == 5) {
            // setting offmins
            datareg[7] = data;
            offmins    = data;
            updateeeprom(4, data);
        } else if (recv == 6) {
            // setting offsettemp
            datareg[8] = data;
            offsettemp = data - 127;
            updateeeprom(5, data);
        }
        recv++;

        TWI0.SCTRLB = TWI_SCMD_RESPONSE_gc;
    }
    /* If buffer overflow, send NACK and wait for next START. Set
     * result buffer overflow.
     */
    else {
        TWI0.SCTRLB = TWI_ACKACT_bm | TWI_SCMD_COMPTRANS_gc;
    }
}

static inline void TWI_SlaveWriteHandler() {
    /* If NACK, slave write transaction finished. */
    if ((sent > 0) && (TWI0.SSTATUS & TWI_RXACK_bm)) {
        TWI0.SCTRLB = TWI_SCMD_COMPTRANS_gc;
    }
    /* If ACK, master expects more data. */
    else {
        if (sent < 9) {
            uint8_t data = datareg[sent];

            sent++;
            TWI0.SDATA  = data;
            TWI0.SCTRLB = TWI_SCMD_RESPONSE_gc;

            /* Send data, wait for data interrupt. */

        }
        /* If buffer overflow. */
        else {
            TWI0.SCTRLB = TWI_SCMD_COMPTRANS_gc;
            sent        = 0;
        }
    }
}

ISR(TWI0_TWIS_vect) {
    I2C_0_isr();
}

/**
 * \brief Enable address recognition in I2C_0
 * 1. If supported by the clock system, enables the clock to the module
 * 2. Enables the I2C slave functionality  by setting the enable-bit in the HW's control register
 *
 * \return Nothing
 */
void I2C_0_enable(void) {
    TWI0.SCTRLA |= TWI_ENABLE_bm;
}
