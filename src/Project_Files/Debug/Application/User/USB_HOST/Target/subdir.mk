################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../USB_HOST/Target/usbh_conf.c \
../USB_HOST/Target/usbh_platform.c 

OBJS += \
./Application/User/USB_HOST/Target/usbh_conf.o \
./Application/User/USB_HOST/Target/usbh_platform.o 

C_DEPS += \
./Application/User/USB_HOST/Target/usbh_conf.d \
./Application/User/USB_HOST/Target/usbh_platform.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/USB_HOST/Target/usbh_conf.o: D:/Study/AUT/Embeded_AI/Project_Files/USB_HOST/Target/usbh_conf.c Application/User/USB_HOST/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../../USB_HOST/App -I../../USB_HOST/Target -I../../Core/Inc -I../../Middlewares/ST/AI/Inc -I../../X-CUBE-AI/App -I../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../Drivers/CMSIS/Include -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Inc" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Lib" -I"D:/Study/AUT/Embeded_AI/Project_Files/Drivers/STM32F4xx_HAL_Driver/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/USB_HOST/Target/usbh_platform.o: D:/Study/AUT/Embeded_AI/Project_Files/USB_HOST/Target/usbh_platform.c Application/User/USB_HOST/Target/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../../USB_HOST/App -I../../USB_HOST/Target -I../../Core/Inc -I../../Middlewares/ST/AI/Inc -I../../X-CUBE-AI/App -I../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../Drivers/CMSIS/Include -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Inc" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Lib" -I"D:/Study/AUT/Embeded_AI/Project_Files/Drivers/STM32F4xx_HAL_Driver/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-User-2f-USB_HOST-2f-Target

clean-Application-2f-User-2f-USB_HOST-2f-Target:
	-$(RM) ./Application/User/USB_HOST/Target/usbh_conf.cyclo ./Application/User/USB_HOST/Target/usbh_conf.d ./Application/User/USB_HOST/Target/usbh_conf.o ./Application/User/USB_HOST/Target/usbh_conf.su ./Application/User/USB_HOST/Target/usbh_platform.cyclo ./Application/User/USB_HOST/Target/usbh_platform.d ./Application/User/USB_HOST/Target/usbh_platform.o ./Application/User/USB_HOST/Target/usbh_platform.su

.PHONY: clean-Application-2f-User-2f-USB_HOST-2f-Target

