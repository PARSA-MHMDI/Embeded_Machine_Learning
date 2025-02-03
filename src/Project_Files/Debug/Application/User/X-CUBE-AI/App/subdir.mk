################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../X-CUBE-AI/App/app_x-cube-ai.c \
../X-CUBE-AI/App/consumption_model.c \
../X-CUBE-AI/App/consumption_model_data.c \
../X-CUBE-AI/App/consumption_model_data_params.c 

OBJS += \
./Application/User/X-CUBE-AI/App/app_x-cube-ai.o \
./Application/User/X-CUBE-AI/App/consumption_model.o \
./Application/User/X-CUBE-AI/App/consumption_model_data.o \
./Application/User/X-CUBE-AI/App/consumption_model_data_params.o 

C_DEPS += \
./Application/User/X-CUBE-AI/App/app_x-cube-ai.d \
./Application/User/X-CUBE-AI/App/consumption_model.d \
./Application/User/X-CUBE-AI/App/consumption_model_data.d \
./Application/User/X-CUBE-AI/App/consumption_model_data_params.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/X-CUBE-AI/App/app_x-cube-ai.o: D:/Study/AUT/Embeded_AI/Project_Files/X-CUBE-AI/App/app_x-cube-ai.c Application/User/X-CUBE-AI/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../../USB_HOST/App -I../../USB_HOST/Target -I../../Core/Inc -I../../Middlewares/ST/AI/Inc -I../../X-CUBE-AI/App -I../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../Drivers/CMSIS/Include -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Inc" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Lib" -I"D:/Study/AUT/Embeded_AI/Project_Files/Drivers/STM32F4xx_HAL_Driver/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/X-CUBE-AI/App/consumption_model.o: D:/Study/AUT/Embeded_AI/Project_Files/X-CUBE-AI/App/consumption_model.c Application/User/X-CUBE-AI/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../../USB_HOST/App -I../../USB_HOST/Target -I../../Core/Inc -I../../Middlewares/ST/AI/Inc -I../../X-CUBE-AI/App -I../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../Drivers/CMSIS/Include -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Inc" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Lib" -I"D:/Study/AUT/Embeded_AI/Project_Files/Drivers/STM32F4xx_HAL_Driver/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/X-CUBE-AI/App/consumption_model_data.o: D:/Study/AUT/Embeded_AI/Project_Files/X-CUBE-AI/App/consumption_model_data.c Application/User/X-CUBE-AI/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../../USB_HOST/App -I../../USB_HOST/Target -I../../Core/Inc -I../../Middlewares/ST/AI/Inc -I../../X-CUBE-AI/App -I../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../Drivers/CMSIS/Include -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Inc" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Lib" -I"D:/Study/AUT/Embeded_AI/Project_Files/Drivers/STM32F4xx_HAL_Driver/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/X-CUBE-AI/App/consumption_model_data_params.o: D:/Study/AUT/Embeded_AI/Project_Files/X-CUBE-AI/App/consumption_model_data_params.c Application/User/X-CUBE-AI/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../../USB_HOST/App -I../../USB_HOST/Target -I../../Core/Inc -I../../Middlewares/ST/AI/Inc -I../../X-CUBE-AI/App -I../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../Drivers/CMSIS/Include -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Inc" -I"D:/Study/AUT/Embeded_AI/Project_Files/Middlewares/ST/AI/Lib" -I"D:/Study/AUT/Embeded_AI/Project_Files/Drivers/STM32F4xx_HAL_Driver/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-User-2f-X-2d-CUBE-2d-AI-2f-App

clean-Application-2f-User-2f-X-2d-CUBE-2d-AI-2f-App:
	-$(RM) ./Application/User/X-CUBE-AI/App/app_x-cube-ai.cyclo ./Application/User/X-CUBE-AI/App/app_x-cube-ai.d ./Application/User/X-CUBE-AI/App/app_x-cube-ai.o ./Application/User/X-CUBE-AI/App/app_x-cube-ai.su ./Application/User/X-CUBE-AI/App/consumption_model.cyclo ./Application/User/X-CUBE-AI/App/consumption_model.d ./Application/User/X-CUBE-AI/App/consumption_model.o ./Application/User/X-CUBE-AI/App/consumption_model.su ./Application/User/X-CUBE-AI/App/consumption_model_data.cyclo ./Application/User/X-CUBE-AI/App/consumption_model_data.d ./Application/User/X-CUBE-AI/App/consumption_model_data.o ./Application/User/X-CUBE-AI/App/consumption_model_data.su ./Application/User/X-CUBE-AI/App/consumption_model_data_params.cyclo ./Application/User/X-CUBE-AI/App/consumption_model_data_params.d ./Application/User/X-CUBE-AI/App/consumption_model_data_params.o ./Application/User/X-CUBE-AI/App/consumption_model_data_params.su

.PHONY: clean-Application-2f-User-2f-X-2d-CUBE-2d-AI-2f-App

