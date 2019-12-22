
################################################################################
# Automatically-generated file. Do not edit!
################################################################################

ifdef SystemRoot
	SHELL = cmd.exe
	MK_DIR = mkdir
else
	ifeq ($(shell uname), Linux)
		MK_DIR = mkdir -p
	endif

	ifeq ($(shell uname | cut -d _ -f 1), CYGWIN)
		MK_DIR = mkdir -p
	endif

	ifeq ($(shell uname | cut -d _ -f 1), MINGW32)
		MK_DIR = mkdir -p
	endif

	ifeq ($(shell uname | cut -d _ -f 1), MINGW64)
		MK_DIR = mkdir -p
	endif
endif

BUILD_DIR ?= build/

# List the subdirectories for creating object files
SUB_DIRS += src
BUILD_SUB_DIRS = $(SUB_DIRS:%=$(BUILD_DIR)%)

# List the object files
SRC = src/adc_basic.c src/i2c_slave.c main.c src/driver_init.c src/pwm_basic.c src/protected_io.c
OBJS = $(SRC:%.c=$(BUILD_DIR)%.o)

# List the dependency files
DEPS := $(OBJS:%.o=%.d)

MAKEFILE_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
OUTPUT_FILE_NAME := handpiece
OUTPUT_FILE_PATH = $(OUTPUT_FILE_NAME).elf
BUILD_DIR_OUTPUT_FILE_NAME = $(BUILD_DIR)$(OUTPUT_FILE_NAME)

DEVICE_FLAGS = -mmcu=attiny816 -Bdevice/attiny816 -D__tiny816__

CFLAGS += $(DEVICE_FLAGS)
CFLAGS += -DF_CPU=20000000
CFLAGS += -Iinclude -Iutils -Iutils/assembler -Iconfig -I.
CFLAGS += -Os -ffunction-sections
CFLAGS += -DDEBUG
CFLAGS += -g3 -Wall -std=gnu99 -Wa,-mgcc-isr 

LDFLAGS += -Wa,-mgcc-isr -lm -Wl,-Map="$(BUILD_DIR_OUTPUT_FILE_NAME)" $(DEVICE_FLAGS) -Llib -Wl,--gc-sections -lattiny816 -flto

# All Target
all: $(SUB_DIRS) $(OUTPUT_FILE_PATH)

$(OUTPUT_FILE_PATH): $(OBJS)
	@echo Building target: $@
	@echo Invoking: AVR/GNU Linker
	avr-gcc -o $(OUTPUT_FILE_NAME).elf $(OBJS) $(LDFLAGS) 
	@echo Finished building target: $@

	"avr-objcopy" -O binary "$(OUTPUT_FILE_PATH)" "$(OUTPUT_FILE_NAME).bin"
	"avr-objcopy" -O ihex -R .eeprom -R .fuse -R .lock -R .signature -R .user_signatures "$(OUTPUT_FILE_PATH)" "$(OUTPUT_FILE_NAME).hex"
	"avr-objcopy" -j .eeprom --set-section-flags=.eeprom=alloc,load --change-section-lma .eeprom=0 --no-change-warnings \
			-O binary "$(OUTPUT_FILE_PATH)" "$(BUILD_DIR_OUTPUT_FILE_NAME).eep" || exit 0
	"avr-objdump" -h -S "$(OUTPUT_FILE_PATH)" > "$(BUILD_DIR_OUTPUT_FILE_NAME).lss"
	"avr-size" "$(OUTPUT_FILE_PATH)"

# Compiler target(s)


$(BUILD_DIR)%.o: %.c | $(BUILD_DIR) $(BUILD_SUB_DIRS)
	avr-gcc $(CFLAGS) -x c -c -MD -MP -MF "$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)"  -o "$@" "$<"

$(BUILD_DIR)%.o: %.s | $(BUILD_DIR) $(BUILD_SUB_DIRS)
	avr-gcc $(CFLAGS) -x assembler-with-cpp -c -MD -MP -MF "$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)"  -o "$@" "$<"

$(BUILD_DIR)%.o: %.S | $(BUILD_DIR) $(BUILD_SUB_DIRS)
	avr-gcc $(CFLAGS) -x assembler-with-cpp -c -MD -MP -MF "$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)"  -o "$@" "$<"

# Detect changes in the dependent files and recompile the respective object files.
ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(DEPS)),)
-include $(DEPS)
endif
endif

$(BUILD_DIR) $(BUILD_SUB_DIRS):
	$(MK_DIR) "$@"

$(BUILD_SUB_DIRS): | $(BUILD_DIR)

clean:
	rm -f $(OBJS)
	rm -f $(OUTPUT_FILE_PATH)
	rm -f $(DEPS)
	rm -f $(OUTPUT_FILE_PATH)
	rm -f \
			$(BUILD_DIR_OUTPUT_FILE_NAME).a \
			$(OUTPUT_FILE_NAME).hex \
			$(OUTPUT_FILE_NAME).bin \
			$(BUILD_DIR_OUTPUT_FILE_NAME).lss \
			$(BUILD_DIR_OUTPUT_FILE_NAME).eep \
			$(BUILD_DIR_OUTPUT_FILE_NAME).map \
			$(BUILD_DIR_OUTPUT_FILE_NAME).srec

.PHONY: all clean
