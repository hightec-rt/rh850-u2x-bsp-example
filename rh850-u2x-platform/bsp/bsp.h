/**************************************************************************************************
 * SPDX-License-Identifier: BSL-1.0
 *
 * Copyright (C) 2015-2026 HighTec EDV-Systeme GmbH.
 * All rights reserved.
 *************************************************************************************************/

/**************************************************************************************************
 * @file
 *
 * @brief Board Support Package (BSP) interface file.
 *
 * @details
 * UC SUPPORT:
 *    RH850 U2x
 *
 *************************************************************************************************/


#ifndef BSP_H
#define BSP_H

/* Include of BSP sub-modules header files */
#include "board/bsp_board.h"
#include "toolchain.h"


/** ************************************************************************* */
/** Board LEDs */
/** ************************************************************************* */

/**
 * @brief Initialize LEDs
 *
 * @param[in] set Initial LED output control
 * @return void
 */
extern void bsp_board_led_InitAll(BOARD_LED_SET_e set);

/**
 * @brief Set target LED
 *
 * @param[in] led target LED
 * @param[in] set output control
 * @return void
 */
extern void bsp_board_led_Set(BOARD_LED_e led, BOARD_LED_SET_e set);


/** ************************************************************************* */
/** OS Timer */
/** ************************************************************************* */

/**
 * @brief Initialize OS Timers
 *
 * @return void
 */
extern void bsp_board_ostm_InitAll(void);


/** ************************************************************************* */
/** Reset Controller */
/** ************************************************************************* */

/**
 * @brief Start target Processor Element (PE)
 *
 * @param[in] peid target PEID
 * @return void
 */
extern void bsp_board_reset_controller_StartPE(uint8_t peid);

/**
 * @brief Start all Processor Element (PE)
 *
 * @return void
 */
extern void bsp_board_reset_controller_StartAllPE(void);

/**
 * @brief Get actual Processor Element Identifier (PEID) running the code
 *
 * @return actual PEID
 */
extern uintptr_t bsp_board_processor_element_identifier_Get(void);


#endif /* BSP_H */
