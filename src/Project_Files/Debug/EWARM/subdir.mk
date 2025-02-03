################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../EWARM/startup_stm32f407xx.s 

OBJS += \
./EWARM/startup_stm32f407xx.o 

S_DEPS += \
./EWARM/startup_stm32f407xx.d 


# Each subdirectory must supply rules for building sources it contributes
EWARM/%.o: ../EWARM/%.s EWARM/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Inc" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Lib" -I"D:/Study/AUT/Embeded_AI/Project_Files/Drivers/STM32F4xx_HAL_Driver/Src" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-EWARM

clean-EWARM:
	-$(RM) ./EWARM/startup_stm32f407xx.d ./EWARM/startup_stm32f407xx.o

.PHONY: clean-EWARM

