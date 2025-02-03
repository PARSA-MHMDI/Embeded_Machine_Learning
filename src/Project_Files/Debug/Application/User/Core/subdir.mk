################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/main.c \
../Core/Src/stm32f4xx_hal_msp.c \
../Core/Src/stm32f4xx_it.c \
../Application/User/Core/syscalls.c \
../Application/User/Core/sysmem.c 

OBJS += \
./Application/User/Core/main.o \
./Application/User/Core/stm32f4xx_hal_msp.o \
./Application/User/Core/stm32f4xx_it.o \
./Application/User/Core/syscalls.o \
./Application/User/Core/sysmem.o 

C_DEPS += \
./Application/User/Core/main.d \
./Application/User/Core/stm32f4xx_hal_msp.d \
./Application/User/Core/stm32f4xx_it.d \
./Application/User/Core/syscalls.d \
./Application/User/Core/sysmem.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/Core/main.o: D:/Study/AUT/Embeded_AI/Project_Files/Core/Src/main.c Application/User/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../../USB_HOST/App -I../../USB_HOST/Target -I../../Core/Inc -I../../Middlewares/ST/AI/Inc -I../../X-CUBE-AI/App -I../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../Drivers/CMSIS/Include -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Inc" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Lib" -I"D:/Study/AUT/Embeded_AI/Project_Files/Drivers/STM32F4xx_HAL_Driver/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/Core/stm32f4xx_hal_msp.o: D:/Study/AUT/Embeded_AI/Project_Files/Core/Src/stm32f4xx_hal_msp.c Application/User/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../../USB_HOST/App -I../../USB_HOST/Target -I../../Core/Inc -I../../Middlewares/ST/AI/Inc -I../../X-CUBE-AI/App -I../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../Drivers/CMSIS/Include -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Inc" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Lib" -I"D:/Study/AUT/Embeded_AI/Project_Files/Drivers/STM32F4xx_HAL_Driver/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/Core/stm32f4xx_it.o: D:/Study/AUT/Embeded_AI/Project_Files/Core/Src/stm32f4xx_it.c Application/User/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../../USB_HOST/App -I../../USB_HOST/Target -I../../Core/Inc -I../../Middlewares/ST/AI/Inc -I../../X-CUBE-AI/App -I../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../Drivers/CMSIS/Include -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Inc" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Lib" -I"D:/Study/AUT/Embeded_AI/Project_Files/Drivers/STM32F4xx_HAL_Driver/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/Core/%.o Application/User/Core/%.su Application/User/Core/%.cyclo: ../Application/User/Core/%.c Application/User/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../../USB_HOST/App -I../../USB_HOST/Target -I../../Core/Inc -I../../Middlewares/ST/AI/Inc -I../../X-CUBE-AI/App -I../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../Drivers/CMSIS/Include -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Inc" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Lib" -I"D:/Study/AUT/Embeded_AI/Project_Files/Drivers/STM32F4xx_HAL_Driver/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-User-2f-Core

clean-Application-2f-User-2f-Core:
	-$(RM) ./Application/User/Core/main.cyclo ./Application/User/Core/main.d ./Application/User/Core/main.o ./Application/User/Core/main.su ./Application/User/Core/stm32f4xx_hal_msp.cyclo ./Application/User/Core/stm32f4xx_hal_msp.d ./Application/User/Core/stm32f4xx_hal_msp.o ./Application/User/Core/stm32f4xx_hal_msp.su ./Application/User/Core/stm32f4xx_it.cyclo ./Application/User/Core/stm32f4xx_it.d ./Application/User/Core/stm32f4xx_it.o ./Application/User/Core/stm32f4xx_it.su ./Application/User/Core/syscalls.cyclo ./Application/User/Core/syscalls.d ./Application/User/Core/syscalls.o ./Application/User/Core/syscalls.su ./Application/User/Core/sysmem.cyclo ./Application/User/Core/sysmem.d ./Application/User/Core/sysmem.o ./Application/User/Core/sysmem.su

.PHONY: clean-Application-2f-User-2f-Core

