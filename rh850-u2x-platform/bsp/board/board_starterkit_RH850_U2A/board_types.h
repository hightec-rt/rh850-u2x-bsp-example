/**************************************************************************************************
 * SPDX-License-Identifier: BSL-1.0
 *
 * Copyright (C) 2015-2026 HighTec EDV-Systeme GmbH.
 * All rights reserved.
 *************************************************************************************************/

/**************************************************************************************************
 * @file
 *
 * @brief Board specific types.
 *
 * @details
 * BOARD FAMILY:
 *    StarterKit RH850 U2A
 *
 * UC SUPPORT:
 *    RH850 U2A
 *
 *************************************************************************************************/

#if defined(STARTER_KIT_RH850_U2A)

#ifndef BOARD_TYPES_H
#define BOARD_TYPES_H


/**
 * @brief LEDs
 *
 */
typedef enum {
    BOARD_LED_1 = 0U,
    BOARD_LED_2,
    BOARD_LED_3,
    BOARD_LED_4,
    BOARD_NB_LEDS
} BOARD_LED_e;


/**
 * @brief LED output control
 *
 */
typedef enum {
    BOARD_LED_SET_NO_CHANGE = 0U,
    BOARD_LED_SET_OFF,
    BOARD_LED_SET_ON,
    BOARD_LED_SET_TOGGLE
} BOARD_LED_SET_e;


#endif /* BOARD_TYPES_H */
#endif /* STARTER_KIT_RH850_U2A */
