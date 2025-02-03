/**
  ******************************************************************************
  * @file    consumption_model_data_params.h
  * @author  AST Embedded Analytics Research Platform
  * @date    2025-02-02T12:24:09+0330
  * @brief   AI Tool Automatic Code Generator for Embedded NN computing
  ******************************************************************************
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  ******************************************************************************
  */

#ifndef CONSUMPTION_MODEL_DATA_PARAMS_H
#define CONSUMPTION_MODEL_DATA_PARAMS_H

#include "ai_platform.h"

/*
#define AI_CONSUMPTION_MODEL_DATA_WEIGHTS_PARAMS \
  (AI_HANDLE_PTR(&ai_consumption_model_data_weights_params[1]))
*/

#define AI_CONSUMPTION_MODEL_DATA_CONFIG               (NULL)


#define AI_CONSUMPTION_MODEL_DATA_ACTIVATIONS_SIZES \
  { 12956, }
#define AI_CONSUMPTION_MODEL_DATA_ACTIVATIONS_SIZE     (12956)
#define AI_CONSUMPTION_MODEL_DATA_ACTIVATIONS_COUNT    (1)
#define AI_CONSUMPTION_MODEL_DATA_ACTIVATION_1_SIZE    (12956)



#define AI_CONSUMPTION_MODEL_DATA_WEIGHTS_SIZES \
  { 803844, }
#define AI_CONSUMPTION_MODEL_DATA_WEIGHTS_SIZE         (803844)
#define AI_CONSUMPTION_MODEL_DATA_WEIGHTS_COUNT        (1)
#define AI_CONSUMPTION_MODEL_DATA_WEIGHT_1_SIZE        (803844)



#define AI_CONSUMPTION_MODEL_DATA_ACTIVATIONS_TABLE_GET() \
  (&g_consumption_model_activations_table[1])

extern ai_handle g_consumption_model_activations_table[1 + 2];



#define AI_CONSUMPTION_MODEL_DATA_WEIGHTS_TABLE_GET() \
  (&g_consumption_model_weights_table[1])

extern ai_handle g_consumption_model_weights_table[1 + 2];


#endif    /* CONSUMPTION_MODEL_DATA_PARAMS_H */
