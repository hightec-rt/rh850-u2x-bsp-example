/**************************************************************************************************
 * SPDX-License-Identifier: BSL-1.0
 *
 * Copyright (C) 2015-2026 HighTec EDV-Systeme GmbH.
 * All rights reserved.
 *************************************************************************************************/

/**************************************************************************************************
 * @file
 *
 * @brief Implementation of Board support routines.
 *
 * @details
 * BOARD FAMILY:
 *    StarterKit RH850 U2A
 *
 * UC SUPPORT:
 *    RH850 U2A
 *
 *************************************************************************************************/

/* include common BSP header file */
#include "bsp.h"

#if defined(STARTER_KIT_RH850_U2A)

#include "board_spec.h"


/** ************************************************************************* */
/** Board LEDs */
/** ************************************************************************* */

 void bsp_board_led_InitAll(BOARD_LED_SET_e set)
{
    /* Enable write access to protected port registers */
    PORT_PKCPROT_REG = PORT_KCE_EN_VAL;

    /* Enable port write for LED ports */
    PORT_PWE_REG |= PORT_PWE_PWEP2_MSK;
    PORT_PWE_REG |= PORT_PWE_PWEP6_MSK;

    /* Set output mode for LED pins */
    PORT_PM2_REG &= ~PORT_PMn_PMn_1_MSK;
    PORT_PM2_REG &= ~PORT_PMn_PMn_2_MSK;
    PORT_PM6_REG &= ~PORT_PMn_PMn_5_MSK;
    PORT_PM6_REG &= ~PORT_PMn_PMn_6_MSK;

    /* Disable write access to protected port registers */
    PORT_PKCPROT_REG = PORT_KCE_DIS_VAL;

    /* Enable write access to protected functional safety registers */
    FS_PBGKCPROT_REG = FS_KCE_EN_VAL;

    /* Grant access for all PEs to write to the LED ports */
    FS_PBG21_PBGPROT1_6_REG |= 0x0000000FU;
    FS_PBG21_PBGPROT1_10_REG |= 0x0000000FU;

    /* Disable write access to protected functional safety registers */
    FS_PBGKCPROT_REG = FS_KCE_DIS_VAL;

    /* Set LEDs */
    bsp_board_led_Set(BOARD_LED_1, set);
    bsp_board_led_Set(BOARD_LED_2, set);
    bsp_board_led_Set(BOARD_LED_3, set);
    bsp_board_led_Set(BOARD_LED_4, set);
}


void bsp_board_led_Set(BOARD_LED_e led, BOARD_LED_SET_e set)
{
    switch (set)
    {
        case BOARD_LED_SET_NO_CHANGE:
        {
            break;
        }
        case BOARD_LED_SET_OFF:
        {
            /* Reset LED pin */
            switch (led)
            {
                case BOARD_LED_1:   {PORT_P2_REG &= ~PORT_Pn_Pn_1_MSK; break;}
                case BOARD_LED_2:   {PORT_P2_REG &= ~PORT_Pn_Pn_2_MSK; break;}
                case BOARD_LED_3:   {PORT_P6_REG &= ~PORT_Pn_Pn_5_MSK; break;}
                case BOARD_LED_4:   {PORT_P6_REG &= ~PORT_Pn_Pn_6_MSK; break;}
                case BOARD_NB_LEDS: {                                  break;}
            }
            break;
        }
        case BOARD_LED_SET_ON:
        {
            /* Set LED pin */
            switch (led)
            {
                case BOARD_LED_1:   {PORT_P2_REG |= PORT_Pn_Pn_1_MSK; break;}
                case BOARD_LED_2:   {PORT_P2_REG |= PORT_Pn_Pn_2_MSK; break;}
                case BOARD_LED_3:   {PORT_P6_REG |= PORT_Pn_Pn_5_MSK; break;}
                case BOARD_LED_4:   {PORT_P6_REG |= PORT_Pn_Pn_6_MSK; break;}
                case BOARD_NB_LEDS: {                                 break;}
            }
            break;
        }
        case BOARD_LED_SET_TOGGLE:
        {
            /* Toggle LED pin */
            switch (led)
            {
                case BOARD_LED_1:   {PORT_PNOT2_REG |= PORT_PNOTn_PNOTn_1_MSK; break;}
                case BOARD_LED_2:   {PORT_PNOT2_REG |= PORT_PNOTn_PNOTn_2_MSK; break;}
                case BOARD_LED_3:   {PORT_PNOT6_REG |= PORT_PNOTn_PNOTn_5_MSK; break;}
                case BOARD_LED_4:   {PORT_PNOT6_REG |= PORT_PNOTn_PNOTn_6_MSK; break;}
                case BOARD_NB_LEDS: {                                          break;}
            }
            break;
        }
    }
}


/** ************************************************************************* */
/** OS Timer */
/** ************************************************************************* */

void bsp_board_ostm_InitAll(void)
{
    /* Setup interrupt */
    INTC_EIC199_REG &= ~INTC_EICn_EIMKn_MSK;
    INTC_EIC199_REG |=  INTC_EICn_EITBn_MSK;
    INTC_EIBD199_REG &= ~INTC_EIBD32_767_PEID_MSK;
    INTC_EIBD199_REG |= (0x0U << INTC_EIBD32_767_PEID_POS);

    INTC_EIC200_REG &= ~INTC_EICn_EIMKn_MSK;
    INTC_EIC200_REG |=  INTC_EICn_EITBn_MSK;
    INTC_EIBD200_REG &= ~INTC_EIBD32_767_PEID_MSK;
    INTC_EIBD200_REG |= (0x1U << INTC_EIBD32_767_PEID_POS);

    INTC_EIC201_REG &= ~INTC_EICn_EIMKn_MSK;
    INTC_EIC201_REG |=  INTC_EICn_EITBn_MSK;
    INTC_EIBD201_REG &= ~INTC_EIBD32_767_PEID_MSK;
    INTC_EIBD201_REG |= (0x2U << INTC_EIBD32_767_PEID_POS);

    INTC_EIC202_REG &= ~INTC_EICn_EIMKn_MSK;
    INTC_EIC202_REG |=  INTC_EICn_EITBn_MSK;
    INTC_EIBD202_REG &= ~INTC_EIBD32_767_PEID_MSK;
    INTC_EIBD202_REG |= (0x3U << INTC_EIBD32_767_PEID_POS);

    /* Standby controller -> enable clock */
    STBC_MSRKCPROT_REG  =  STBC_KCE_EN_VAL;
    STBC_MSR_OSTM_REG  &= ~STBC_MSR_OSTM_MS_OSTM_0_MSK;
    STBC_MSR_OSTM_REG  &= ~STBC_MSR_OSTM_MS_OSTM_1_MSK;
    STBC_MSR_OSTM_REG  &= ~STBC_MSR_OSTM_MS_OSTM_2_MSK;
    STBC_MSR_OSTM_REG  &= ~STBC_MSR_OSTM_MS_OSTM_3_MSK;

    /* Wait until the clock supply stabilizes */
    while (0U != (STBC_MSR_OSTM_REG & STBC_MSR_OSTM_MS_OSTM_0_MSK)) {__builtin_v850_snooze();}
    while (0U != (STBC_MSR_OSTM_REG & STBC_MSR_OSTM_MS_OSTM_1_MSK)) {__builtin_v850_snooze();}
    while (0U != (STBC_MSR_OSTM_REG & STBC_MSR_OSTM_MS_OSTM_2_MSK)) {__builtin_v850_snooze();}
    while (0U != (STBC_MSR_OSTM_REG & STBC_MSR_OSTM_MS_OSTM_3_MSK)) {__builtin_v850_snooze();}

    /* Interval timer mode */
    OSTM_OSTM0CTL_REG &= ~OSTM_OSTMnCTL_OSTMnMD1_MSK;
    OSTM_OSTM1CTL_REG &= ~OSTM_OSTMnCTL_OSTMnMD1_MSK;
    OSTM_OSTM2CTL_REG &= ~OSTM_OSTMnCTL_OSTMnMD1_MSK;
    OSTM_OSTM3CTL_REG &= ~OSTM_OSTMnCTL_OSTMnMD1_MSK;

    /* Enable interrupt request */
    OSTM_OSTM0CTL_REG |= OSTM_OSTMnCTL_OSTMnIE_MSK;
    OSTM_OSTM1CTL_REG |= OSTM_OSTMnCTL_OSTMnIE_MSK;
    OSTM_OSTM2CTL_REG |= OSTM_OSTMnCTL_OSTMnIE_MSK;
    OSTM_OSTM3CTL_REG |= OSTM_OSTMnCTL_OSTMnIE_MSK;

    /* Load compare register */
    OSTM_OSTM0CMP_REG_U32 = BSP_BOARD_RAND_WAIT_COUNTER_VAL(0U);
    OSTM_OSTM1CMP_REG_U32 = BSP_BOARD_RAND_WAIT_COUNTER_VAL(1U);
    OSTM_OSTM2CMP_REG_U32 = BSP_BOARD_RAND_WAIT_COUNTER_VAL(2U);
    OSTM_OSTM3CMP_REG_U32 = BSP_BOARD_RAND_WAIT_COUNTER_VAL(3U);

    /* Start counter */
    OSTM_OSTM0TS_REG = OSTM_OSTMnTS_OSTMnTS_MSK;
    OSTM_OSTM1TS_REG = OSTM_OSTMnTS_OSTMnTS_MSK;
    OSTM_OSTM2TS_REG = OSTM_OSTMnTS_OSTMnTS_MSK;
    OSTM_OSTM3TS_REG = OSTM_OSTMnTS_OSTMnTS_MSK;
}


/** ************************************************************************* */
/** Reset Controller */
/** ************************************************************************* */

void bsp_board_reset_controller_StartPE(uint8_t peid)
{
    if (0U == bsp_board_processor_element_identifier_Get())
    {
        volatile uint32_t i;

        switch (peid)
        {
            case 0U: {break;}
            case 1U: {RESCTLR_BOOTCTRL_REG |= RESCTLR_BOOTCTRL_BC1_MSK; break;}
            case 2U: {RESCTLR_BOOTCTRL_REG |= RESCTLR_BOOTCTRL_BC2_MSK; break;}
            case 3U: {RESCTLR_BOOTCTRL_REG |= RESCTLR_BOOTCTRL_BC3_MSK; break;}
            default: {break;}
        }

        for (i = 0U; i < 1000000U; i++) {__asm__ volatile ("nop");}
    }
}


void bsp_board_reset_controller_StartAllPE(void)
{
    bsp_board_reset_controller_StartPE(1U);
    bsp_board_reset_controller_StartPE(2U);
    bsp_board_reset_controller_StartPE(3U);
}


uintptr_t bsp_board_processor_element_identifier_Get(void)
{
    uintptr_t peid;
    __asm__ volatile (
        "stsr 0, %0, 2"
        : "=r" (peid)
        :
        :
    );
    return peid;
}


#endif /* STARTER_KIT_RH850_U2A */
