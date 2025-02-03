/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "usb_host.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

#include "stdio.h"
#include "ai_datatypes_defines.h"
#include "ai_platform.h"
#include "consumption_model.h"
#include "consumption_model_data.h"

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */


/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
I2C_HandleTypeDef hi2c1;

I2S_HandleTypeDef hi2s3;

SPI_HandleTypeDef hspi1;

UART_HandleTypeDef huart2;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_I2C1_Init(void);
static void MX_I2S3_Init(void);
static void MX_SPI1_Init(void);
static void MX_USART2_UART_Init(void);
void MX_USB_HOST_Process(void);

/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

	// UART buffer for debug messages
	char buf[200];
	int buf_len = 0;

	// AI model related variables
	ai_error ai_err;
	ai_i32 nbatch;
	float y_val;


	// Chunk of memory used to hold intermediate values for neural network
	AI_ALIGNED(4) ai_u8 activations[AI_CONSUMPTION_MODEL_DATA_ACTIVATIONS_SIZE];

	// Buffers used to store input and output tensors
	AI_ALIGNED(4) ai_float in_data[AI_CONSUMPTION_MODEL_IN_1_SIZE_BYTES];
	AI_ALIGNED(4) ai_float out_data[AI_CONSUMPTION_MODEL_OUT_1_SIZE_BYTES];

	// Pointer to our model
	ai_handle consumption_model = AI_HANDLE_NULL;

	// Initialize wrapper structs that hold pointers to data and info about the
	// data (tensor height, width, channels)
	ai_buffer* ai_input  = AI_CONSUMPTION_MODEL_IN;  // pointer to library’s input buffer
	ai_buffer* ai_output = AI_CONSUMPTION_MODEL_OUT; // pointer to library’s output buffer


	// Normalized Test Data
	const float normalized_test_data[100] = {0.33421134180353274f, 0.3085734944737114f, 0.4193575043900425f, 0.45455531453362263f, 0.45102262162999696f, 0.40211238508418556f, 0.40051131081499836f, 0.379547567400062f, 0.34445305237062274f, 0.3820421444065695f, 0.36811796302034916f, 0.38441276727610785f, 0.3707261646524119f, 0.39440140481355235f, 0.3640223117446545f, 0.30475674000619757f, 0.3934355954963332f, 0.35756120235512856f, 0.3683142237372171f, 0.3895207106703854f, 0.3829511414110113f, 0.3068742898460902f, 0.3171986365044933f,
			0.42644871397582895f, 0.4950573287883483f, 0.48879764487139765f, 0.4513170127052991f, 0.46779774816651176f, 0.4178700547464106f, 0.38373618427848377f, 0.4627621113521331f, 0.44596116103708316f, 0.42849912199152984f, 0.42244086354715427f, 0.5169817167647971f, 0.5002272492511105f, 0.3961625865096582f, 0.44584237165582075f, 0.47328271872740435f, 0.5045656440450367f, 0.45412147505422984f, 0.5156130565024274f, 0.4684949901869643f, 0.42024067761594897f, 0.514456151224047f, 0.5090434872430535f, 0.5187945460179734f, 0.5516682160933789f,
			0.5642392314843508f, 0.48616878421650667f, 0.431226113004855f, 0.48119512447061263f, 0.542500774713356f, 0.5902747650036154f, 0.5952535895052166f, 0.6009709740729264f, 0.5318200599111663f, 0.4982284887924803f, 0.5818562132011155f, 0.554116310298523f, 0.520535068691251f, 0.5287212064869332f, 0.5518128292531762f, 0.4829614709224256f, 0.39535171986365036f, 0.4385239128189239f, 0.40819130255138936f, 0.417632475983886f, 0.36269496952794145f, 0.3491994628654066f, 0.4058516682160934f, 0.3926247288503254f, 0.47833901456461103f, 0.4958578659229419f,
			0.4991942981096994f, 0.46700237578762527f, 0.44355954963330235f, 0.46550459663257937f, 0.47699101332506977f, 0.5854147298832765f, 0.6538064249560996f, 0.6284423096787523f, 0.6397324656543747f, 0.6329614709224255f, 0.61848466067555f, 0.6069982439830596f, 0.650475157525049f, 0.6692593740316083f, 0.7452071067038529f, 0.8350945150294392f, 0.9043280652825124f, 0.7427435182315877f, 0.683100919326516f, 0.70252556554075f, 0.6453000723065799f, 0.653258960851152f, 0.7098078710876975f, 0.6929242846813347f, 0.558811073236236f, 0.47802912922218777f
	};

//	const float normalized_test_data[100] = {0.3085734944737114f, 0.4193575043900425f, 0.45455531453362263f, 0.45102262162999696f, 0.40211238508418556f, 0.40051131081499836f, 0.379547567400062f, 0.34445305237062274f, 0.3820421444065695f, 0.36811796302034916f, 0.38441276727610785f, 0.3707261646524119f, 0.39440140481355235f, 0.3640223117446545f, 0.30475674000619757f, 0.3934355954963332f, 0.35756120235512856f, 0.3683142237372171f, 0.3895207106703854f, 0.3829511414110113f, 0.3068742898460902f, 0.3171986365044933f,
//			0.42644871397582895f, 0.4950573287883483f, 0.48879764487139765f, 0.4513170127052991f, 0.46779774816651176f, 0.4178700547464106f, 0.38373618427848377f, 0.4627621113521331f, 0.44596116103708316f, 0.42849912199152984f, 0.42244086354715427f, 0.5169817167647971f, 0.5002272492511105f, 0.3961625865096582f, 0.44584237165582075f, 0.47328271872740435f, 0.5045656440450367f, 0.45412147505422984f, 0.5156130565024274f, 0.4684949901869643f, 0.42024067761594897f, 0.514456151224047f, 0.5090434872430535f, 0.5187945460179734f, 0.5516682160933789f,
//			0.5642392314843508f, 0.48616878421650667f, 0.431226113004855f, 0.48119512447061263f, 0.542500774713356f, 0.5902747650036154f, 0.5952535895052166f, 0.6009709740729264f, 0.5318200599111663f, 0.4982284887924803f, 0.5818562132011155f, 0.554116310298523f, 0.520535068691251f, 0.5287212064869332f, 0.5518128292531762f, 0.4829614709224256f, 0.39535171986365036f, 0.4385239128189239f, 0.40819130255138936f, 0.417632475983886f, 0.36269496952794145f, 0.3491994628654066f, 0.4058516682160934f, 0.3926247288503254f, 0.47833901456461103f, 0.4958578659229419f,
//			0.4991942981096994f, 0.46700237578762527f, 0.44355954963330235f, 0.46550459663257937f, 0.47699101332506977f, 0.5854147298832765f, 0.6538064249560996f, 0.6284423096787523f, 0.6397324656543747f, 0.6329614709224255f, 0.61848466067555f, 0.6069982439830596f, 0.650475157525049f, 0.6692593740316083f, 0.7452071067038529f, 0.8350945150294392f, 0.9043280652825124f, 0.7427435182315877f, 0.683100919326516f, 0.70252556554075f, 0.6453000723065799f, 0.653258960851152f, 0.7098078710876975f, 0.6929242846813347f, 0.558811073236236f, 0.47802912922218777f, 0.5647453775436423f
//	};


	/* Actual ytest[0] Value */
	const float actual_ytest = 0.56474538f;

//	const float actual_ytest = 0.56492614f;



	// Set working memory and get weights/biases from model
	ai_network_params ai_params = {
	  AI_CONSUMPTION_MODEL_DATA_WEIGHTS(ai_consumption_model_data_weights_get()),
	  AI_CONSUMPTION_MODEL_DATA_ACTIVATIONS(activations)
	};

	// Assign arrays
	ai_input[0].data  = AI_HANDLE_PTR(in_data);
	ai_output[0].data = AI_HANDLE_PTR(out_data);

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_I2C1_Init();
  MX_I2S3_Init();
  MX_SPI1_Init();
  MX_USB_HOST_Init();
  MX_USART2_UART_Init();
  /* USER CODE BEGIN 2 */

  // Create instance of neural network
    ai_err = ai_consumption_model_create(&consumption_model, AI_CONSUMPTION_MODEL_DATA_CONFIG);
    if (ai_err.type != AI_ERROR_NONE)
    {
      buf_len = sprintf(buf, "AI Error: Type=%d Code=%d\r\n", ai_err.type, ai_err.code);
      HAL_UART_Transmit(&huart2, (uint8_t *)buf, buf_len, 100);
      while(1);
    }

    // Initialize neural network
    if (!ai_consumption_model_init(consumption_model, &ai_params))
    {
      buf_len = sprintf(buf, "Error: could not initialize NN\r\n");
      HAL_UART_Transmit(&huart2, (uint8_t *)buf, buf_len, 100);
      while(1);
    }

    // Fill input buffer (use test value)
    for (uint32_t i = 0; i < AI_CONSUMPTION_MODEL_IN_1_SIZE; i++)
    {
    	((ai_float *)in_data)[i] = normalized_test_data[i];
    }


  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */

  while (1)
  {
    MX_USB_HOST_Process();

    /* USER CODE END WHILE */
    MX_USB_HOST_Process();

    /* USER CODE BEGIN 3 */



    // Perform inference
    nbatch = ai_consumption_model_run(consumption_model, &ai_input[0], &ai_output[0]);
    if (nbatch != 1) {
      buf_len = sprintf(buf, "inference Error: Type=%d Code=%d\r\n", ai_err.type, ai_err.code);
      HAL_UART_Transmit(&huart2, (uint8_t *)buf, buf_len, 100);
    }

    // Read output (predicted y) of neural network
    y_val = ((float *)out_data)[0];

    // Print output of neural network
    buf_len = sprintf(buf,"Predicted: %f\r\n" , y_val );
    HAL_UART_Transmit(&huart2, (uint8_t *)buf, buf_len, 100);
    buf_len = sprintf(buf,"Actual: %f\r\n" , actual_ytest );
    HAL_UART_Transmit(&huart2, (uint8_t *)buf, buf_len, 100);

    // Wait before doing it again
    HAL_Delay(1000);
  }


  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 8;
  RCC_OscInitStruct.PLL.PLLN = 336;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 7;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief I2C1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2C1_Init(void)
{

  /* USER CODE BEGIN I2C1_Init 0 */

  /* USER CODE END I2C1_Init 0 */

  /* USER CODE BEGIN I2C1_Init 1 */

  /* USER CODE END I2C1_Init 1 */
  hi2c1.Instance = I2C1;
  hi2c1.Init.ClockSpeed = 100000;
  hi2c1.Init.DutyCycle = I2C_DUTYCYCLE_2;
  hi2c1.Init.OwnAddress1 = 0;
  hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c1.Init.OwnAddress2 = 0;
  hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN I2C1_Init 2 */

  /* USER CODE END I2C1_Init 2 */

}

/**
  * @brief I2S3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2S3_Init(void)
{

  /* USER CODE BEGIN I2S3_Init 0 */

  /* USER CODE END I2S3_Init 0 */

  /* USER CODE BEGIN I2S3_Init 1 */

  /* USER CODE END I2S3_Init 1 */
  hi2s3.Instance = SPI3;
  hi2s3.Init.Mode = I2S_MODE_MASTER_TX;
  hi2s3.Init.Standard = I2S_STANDARD_PHILIPS;
  hi2s3.Init.DataFormat = I2S_DATAFORMAT_16B;
  hi2s3.Init.MCLKOutput = I2S_MCLKOUTPUT_ENABLE;
  hi2s3.Init.AudioFreq = I2S_AUDIOFREQ_96K;
  hi2s3.Init.CPOL = I2S_CPOL_LOW;
  hi2s3.Init.ClockSource = I2S_CLOCK_PLL;
  hi2s3.Init.FullDuplexMode = I2S_FULLDUPLEXMODE_DISABLE;
  if (HAL_I2S_Init(&hi2s3) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN I2S3_Init 2 */

  /* USER CODE END I2S3_Init 2 */

}

/**
  * @brief SPI1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_SPI1_Init(void)
{

  /* USER CODE BEGIN SPI1_Init 0 */

  /* USER CODE END SPI1_Init 0 */

  /* USER CODE BEGIN SPI1_Init 1 */

  /* USER CODE END SPI1_Init 1 */
  /* SPI1 parameter configuration*/
  hspi1.Instance = SPI1;
  hspi1.Init.Mode = SPI_MODE_MASTER;
  hspi1.Init.Direction = SPI_DIRECTION_2LINES;
  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi1.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi1.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi1.Init.NSS = SPI_NSS_SOFT;
  hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_2;
  hspi1.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi1.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi1.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi1.Init.CRCPolynomial = 10;
  if (HAL_SPI_Init(&hspi1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN SPI1_Init 2 */

  /* USER CODE END SPI1_Init 2 */

}

/**
  * @brief USART2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART2_UART_Init(void)
{

  /* USER CODE BEGIN USART2_Init 0 */

  /* USER CODE END USART2_Init 0 */

  /* USER CODE BEGIN USART2_Init 1 */

  /* USER CODE END USART2_Init 1 */
  huart2.Instance = USART2;
  huart2.Init.BaudRate = 115200;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART2_Init 2 */

  /* USER CODE END USART2_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
/* USER CODE BEGIN MX_GPIO_Init_1 */
/* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOE_CLK_ENABLE();
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(CS_I2C_SPI_GPIO_Port, CS_I2C_SPI_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(OTG_FS_PowerSwitchOn_GPIO_Port, OTG_FS_PowerSwitchOn_Pin, GPIO_PIN_SET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOD, LD4_Pin|LD3_Pin|LD5_Pin|LD6_Pin
                          |Audio_RST_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : CS_I2C_SPI_Pin */
  GPIO_InitStruct.Pin = CS_I2C_SPI_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(CS_I2C_SPI_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : OTG_FS_PowerSwitchOn_Pin */
  GPIO_InitStruct.Pin = OTG_FS_PowerSwitchOn_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(OTG_FS_PowerSwitchOn_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : PDM_OUT_Pin */
  GPIO_InitStruct.Pin = PDM_OUT_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  GPIO_InitStruct.Alternate = GPIO_AF5_SPI2;
  HAL_GPIO_Init(PDM_OUT_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : B1_Pin */
  GPIO_InitStruct.Pin = B1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_EVT_RISING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(B1_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : BOOT1_Pin */
  GPIO_InitStruct.Pin = BOOT1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(BOOT1_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : CLK_IN_Pin */
  GPIO_InitStruct.Pin = CLK_IN_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  GPIO_InitStruct.Alternate = GPIO_AF5_SPI2;
  HAL_GPIO_Init(CLK_IN_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : LD4_Pin LD3_Pin LD5_Pin LD6_Pin
                           Audio_RST_Pin */
  GPIO_InitStruct.Pin = LD4_Pin|LD3_Pin|LD5_Pin|LD6_Pin
                          |Audio_RST_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

  /*Configure GPIO pin : OTG_FS_OverCurrent_Pin */
  GPIO_InitStruct.Pin = OTG_FS_OverCurrent_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(OTG_FS_OverCurrent_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : MEMS_INT2_Pin */
  GPIO_InitStruct.Pin = MEMS_INT2_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_EVT_RISING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(MEMS_INT2_GPIO_Port, &GPIO_InitStruct);

/* USER CODE BEGIN MX_GPIO_Init_2 */
/* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
