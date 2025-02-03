################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_w.c \
../Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_x.c \
../Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_y.c \
../Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_z.c 

OBJS += \
./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_w.o \
./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_x.o \
./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_y.o \
./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_z.o 

C_DEPS += \
./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_w.d \
./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_x.d \
./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_y.d \
./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_z.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/NN/Source/ConcatenationFunctions/%.o Drivers/CMSIS/NN/Source/ConcatenationFunctions/%.su Drivers/CMSIS/NN/Source/ConcatenationFunctions/%.cyclo: ../Drivers/CMSIS/NN/Source/ConcatenationFunctions/%.c Drivers/CMSIS/NN/Source/ConcatenationFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../../USB_HOST/App -I../../USB_HOST/Target -I../../Core/Inc -I../../Middlewares/ST/AI/Inc -I../../X-CUBE-AI/App -I../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../Drivers/CMSIS/Include -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Inc" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Lib" -I"D:/Study/AUT/Embeded_AI/Project_Files/Drivers/STM32F4xx_HAL_Driver/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-NN-2f-Source-2f-ConcatenationFunctions

clean-Drivers-2f-CMSIS-2f-NN-2f-Source-2f-ConcatenationFunctions:
	-$(RM) ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_w.cyclo ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_w.d ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_w.o ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_w.su ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_x.cyclo ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_x.d ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_x.o ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_x.su ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_y.cyclo ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_y.d ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_y.o ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_y.su ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_z.cyclo ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_z.d ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_z.o ./Drivers/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_z.su

.PHONY: clean-Drivers-2f-CMSIS-2f-NN-2f-Source-2f-ConcatenationFunctions

