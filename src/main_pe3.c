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


#if (UC_NB_CORES > 3U)

static volatile       uint32_t self_bss_var;
static volatile       uint32_t self_data_var = 10000U;
static volatile const uint32_t rodata_var = 2U;

TOOLCHAIN_SECTION_BSS_START(".pe3.bss")
static volatile uint32_t pe3_bss_var;
TOOLCHAIN_SECTION_BSS_END()

TOOLCHAIN_SECTION_DATA_START(".pe3.data")
static volatile uint32_t pe3_data_var = 10000U;
TOOLCHAIN_SECTION_DATA_END()


/**
 * @brief OSTM3 Interrupt Handler
 *
 */
__attribute__((interrupt_handler("eiint"))) void isr_eiint202(void)
{
    /* Toggle LED */
    bsp_board_led_Set(BOARD_LED_4, BOARD_LED_SET_TOGGLE);
}


void main_pe3(void)
{
    /* Enable interrupts */
    TOOLCHAIN_ENABLE_INTERRUPTS();

    for (;;)
    {
        uint32_t i;

        for (i = 0U; i < 10000U; i++) {}

        self_bss_var += rodata_var;
        self_data_var += rodata_var;
        pe3_bss_var += rodata_var;
        pe3_data_var += rodata_var;
    }
}

#endif /* CORE 3 */
