/**************************************************************************************************
 * SPDX-License-Identifier: BSL-1.0
 *
 * Copyright (C) 2015-2026 HighTec EDV-Systeme GmbH.
 * All rights reserved.
 *************************************************************************************************/

/**************************************************************************************************
 * @file
 *
 * @brief Application core specific main file.
 *
 *************************************************************************************************/

#include <stdint.h>
#include "bsp.h"


#if (UC_NB_CORES > 0U)

static volatile       uint32_t self_bss_var;
static volatile       uint32_t self_data_var = 10000U;
static volatile const uint32_t rodata_var = 2U;

TOOLCHAIN_SECTION_BSS_START(".pe0.bss")
static volatile uint32_t pe0_bss_var;
TOOLCHAIN_SECTION_BSS_END()

TOOLCHAIN_SECTION_DATA_START(".pe0.data")
static volatile uint32_t pe0_data_var = 10000U;
TOOLCHAIN_SECTION_DATA_END()


/**
 * @brief OSTM0 Interrupt Handler
 *
 */
__attribute__((interrupt_handler("eiint"))) void isr_eiint199(void)
{
    /* Toggle LED */
    bsp_board_led_Set(BOARD_LED_1, BOARD_LED_SET_TOGGLE);
}


void main_pe0(void)
{
    /* Enable interrupts */
    TOOLCHAIN_ENABLE_INTERRUPTS();

    /* Initialize LEDs */
    bsp_board_led_InitAll(BOARD_LED_SET_OFF);

    /* Initialize OS Timers */
    bsp_board_ostm_InitAll();

    /* Start all PEs */
    bsp_board_reset_controller_StartAllPE();

    for (;;)
    {
        uint32_t i;

        for (i = 0U; i < 10000U; i++) {}

        self_bss_var += rodata_var;
        self_data_var += rodata_var;
        pe0_bss_var += rodata_var;
        pe0_data_var += rodata_var;
    }
}

#endif /* CORE 0 */
