/**************************************************************************************************
 * SPDX-License-Identifier: BSL-1.0
 *
 * Copyright (C) 2015-2026 HighTec EDV-Systeme GmbH.
 * All rights reserved.
 *************************************************************************************************/

/**************************************************************************************************
 * @file
 *
 * @brief Selection of the EVB board definition files.
 *
 * @details
 * UC SUPPORT:
 *    RH850 U2x
 *
 *************************************************************************************************/

#ifndef BSP_BOARD_H
#define BSP_BOARD_H

#include <stdint.h>


/** ************************************************************************* */
/** LED physical port-pin structure */
/** ************************************************************************* */

#define BSP_BOARD_RAND_WAIT_COUNTER_VAL(pe)    (2000000U * ((pe) + 1U))


 /**
 * @brief Board LED type
 *
 */
typedef struct board_led_s {
    uint32_t port;
    uint32_t index;
} BOARD_LED_S;


/** ************************************************************************* */
/** Specific Board Interface Header file selection */
/** Controlled by the symbol defined either in the Project Settings or on the build command line */
/** ************************************************************************* */

/* for the check of the board definition */
#define BSP_BOARD_SUPPORT    0U


#ifdef STARTER_KIT_RH850_U2A
#include "board/board_starterkit_RH850_U2A/board.h"
#undef BSP_BOARD_SUPPORT
#endif

/* check of existing board definition that the BSP relies on */
#ifdef BSP_BOARD_SUPPORT
#error... Board Type is not defined in the project setting.
#endif


#endif /* BSP_BOARD_H */
