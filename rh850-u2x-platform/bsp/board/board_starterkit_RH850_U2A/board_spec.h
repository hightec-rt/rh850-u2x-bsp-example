/**************************************************************************************************
 * SPDX-License-Identifier: BSL-1.0
 *
 * Copyright (C) 2015-2026 HighTec EDV-Systeme GmbH.
 * All rights reserved.
 *************************************************************************************************/

/**************************************************************************************************
 * @file
 *
 * @brief Board specification file.
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

#ifndef BOARD_SPEC_H
#define BOARD_SPEC_H


/** ************************************************************************* */
/** Core specification */
/** ************************************************************************* */

/* Number of Cores instances */
#define UC_NB_CORES                 (4U)


/** ************************************************************************* */
/** External crystal clock in [MHz] */
/** It can be overridden by the user, in case the board is populated with a different crystal */
/** ************************************************************************* */

#ifndef BOARD_XTAL_CLOCK
#define BOARD_XTAL_CLOCK    (20U)
#endif


#define REG32(addr) (*(volatile uint32_t *)(void *)(uintptr_t)(addr))
#define REG16(addr) (*(volatile uint16_t *)(void *)(uintptr_t)(addr))
#define REG8(addr)  (*(volatile uint8_t  *)(void *)(uintptr_t)(addr))

/** ************************************************************************* */
/** PORT (LED) setup */
/** ************************************************************************* */

/** Port base addresses */
#define PORT_BASE    (0xFFD90000U)


/** Port Keycode Protection Register */
#define PORT_KCE_EN_VAL     (0xA5A5A501U)
#define PORT_KCE_DIS_VAL    (0xA5A5A500U)

#define PORT_PKCPROT_ADDR    (PORT_BASE + 0x2F40U)
#define PORT_PKCPROT_REG     REG32(PORT_PKCPROT_ADDR)


/** Port Write Enable register */
#define PORT_PWE_ADDR    (PORT_BASE + 0x2F44U)
#define PORT_PWE_REG     REG32(PORT_PWE_ADDR)

#define PORT_PWE_PWEP2_POS    (3U)
#define PORT_PWE_PWEP2_MSK    (1U << PORT_PWE_PWEP2_POS)

#define PORT_PWE_PWEP6_POS    (7U)
#define PORT_PWE_PWEP6_MSK    (1U << PORT_PWE_PWEP6_POS)


/** Port Mode Register */
#define PORT_PM2_ADDR    (PORT_BASE + 0x0010U + 0x40U * 2U)
#define PORT_PM2_REG     REG32(PORT_PM2_ADDR)

#define PORT_PM6_ADDR    (PORT_BASE + 0x0010U + 0x40U * 6U)
#define PORT_PM6_REG     REG32(PORT_PM6_ADDR)

#define PORT_PMn_PMn_1_POS    (1U)
#define PORT_PMn_PMn_1_MSK    (1U << PORT_PMn_PMn_1_POS)
#define PORT_PMn_PMn_2_POS    (2U)
#define PORT_PMn_PMn_2_MSK    (1U << PORT_PMn_PMn_2_POS)
#define PORT_PMn_PMn_5_POS    (5U)
#define PORT_PMn_PMn_5_MSK    (1U << PORT_PMn_PMn_5_POS)
#define PORT_PMn_PMn_6_POS    (6U)
#define PORT_PMn_PMn_6_MSK    (1U << PORT_PMn_PMn_6_POS)


/**  Port Register */
#define PORT_P2_ADDR    (PORT_BASE + 0x0000U + 0x40U * 2U)
#define PORT_P2_REG     REG32(PORT_P2_ADDR)

#define PORT_P6_ADDR    (PORT_BASE + 0x0000U + 0x40U * 6U)
#define PORT_P6_REG     REG32(PORT_P6_ADDR)

#define PORT_Pn_Pn_1_POS    (1U)
#define PORT_Pn_Pn_1_MSK    (1U << PORT_Pn_Pn_1_POS)
#define PORT_Pn_Pn_2_POS    (2U)
#define PORT_Pn_Pn_2_MSK    (1U << PORT_Pn_Pn_2_POS)
#define PORT_Pn_Pn_5_POS    (5U)
#define PORT_Pn_Pn_5_MSK    (1U << PORT_Pn_Pn_5_POS)
#define PORT_Pn_Pn_6_POS    (6U)
#define PORT_Pn_Pn_6_MSK    (1U << PORT_Pn_Pn_6_POS)


/** Port NOT Register */
#define PORT_PNOT2_ADDR    (PORT_BASE + 0x0008U + 0x40U * 2U)
#define PORT_PNOT2_REG     REG32(PORT_PNOT2_ADDR)

#define PORT_PNOT6_ADDR    (PORT_BASE + 0x0008U + 0x40U * 6U)
#define PORT_PNOT6_REG     REG32(PORT_PNOT6_ADDR)

#define PORT_PNOTn_PNOTn_1_POS    (1U)
#define PORT_PNOTn_PNOTn_1_MSK    (1U << PORT_PNOTn_PNOTn_1_POS)
#define PORT_PNOTn_PNOTn_2_POS    (2U)
#define PORT_PNOTn_PNOTn_2_MSK    (1U << PORT_PNOTn_PNOTn_2_POS)
#define PORT_PNOTn_PNOTn_5_POS    (5U)
#define PORT_PNOTn_PNOTn_5_MSK    (1U << PORT_PNOTn_PNOTn_5_POS)
#define PORT_PNOTn_PNOTn_6_POS    (6U)
#define PORT_PNOTn_PNOTn_6_MSK    (1U << PORT_PNOTn_PNOTn_6_POS)


/** ************************************************************************* */
/** Standby Controller (STBC) Setup */
/** ************************************************************************* */

/** Module Standby Register Key Code Protection Register */
#define STBC_KCE_EN_VAL        (0xA5A5A501U)
#define STBC_KCE_DIS_VAL       (0xA5A5A500U)

#define STBC_MSRKCPROT_ADDR    (0xFF981710U)
#define STBC_MSRKCPROT_REG     REG32(STBC_MSRKCPROT_ADDR)


/** Module Standby Register for OSTM */
#define STBC_MSR_OSTM_ADDR    (0xFF981180U)
#define STBC_MSR_OSTM_REG     REG32(STBC_MSR_OSTM_ADDR)

#define STBC_MSR_OSTM_MS_OSTM_0_POS    (0U)
#define STBC_MSR_OSTM_MS_OSTM_0_MSK    (1U << STBC_MSR_OSTM_MS_OSTM_0_POS)

#define STBC_MSR_OSTM_MS_OSTM_1_POS    (1U)
#define STBC_MSR_OSTM_MS_OSTM_1_MSK    (1U << STBC_MSR_OSTM_MS_OSTM_1_POS)

#define STBC_MSR_OSTM_MS_OSTM_2_POS    (2U)
#define STBC_MSR_OSTM_MS_OSTM_2_MSK    (1U << STBC_MSR_OSTM_MS_OSTM_2_POS)

#define STBC_MSR_OSTM_MS_OSTM_3_POS    (3U)
#define STBC_MSR_OSTM_MS_OSTM_3_MSK    (1U << STBC_MSR_OSTM_MS_OSTM_3_POS)


/** ************************************************************************* */
/** Interrupt Controller (INTC) Setup */
/** ************************************************************************* */

/** Interrupt base addresses */
#define INTC2_BASE    (0xFFF80000)


/** EI Level Interrupt Control Register */
#define INTC_EIC199_ADDR    (INTC2_BASE + 0x0000U + 0x02U * 199U)
#define INTC_EIC199_REG     REG8(INTC_EIC199_ADDR)

#define INTC_EIC200_ADDR    (INTC2_BASE + 0x0000U + 0x02U * 200U)
#define INTC_EIC200_REG     REG8(INTC_EIC200_ADDR)

#define INTC_EIC201_ADDR    (INTC2_BASE + 0x0000U + 0x02U * 201U)
#define INTC_EIC201_REG     REG8(INTC_EIC201_ADDR)

#define INTC_EIC202_ADDR    (INTC2_BASE + 0x0000U + 0x02U * 202U)
#define INTC_EIC202_REG     REG8(INTC_EIC202_ADDR)

#define INTC_EICn_EIMKn_POS    (7U)
#define INTC_EICn_EIMKn_MSK    ((uint8_t)(1U << INTC_EICn_EIMKn_POS))

#define INTC_EICn_EITBn_POS    (6U)
#define INTC_EICn_EITBn_MSK    ((uint8_t)(1U << INTC_EICn_EITBn_POS))

#define INTC_EIBD199_ADDR    (INTC2_BASE + 0x2000U + 0x04U * 199U)
#define INTC_EIBD199_REG     REG32(INTC_EIBD199_ADDR)

#define INTC_EIBD200_ADDR    (INTC2_BASE + 0x2000U + 0x04U * 200U)
#define INTC_EIBD200_REG     REG32(INTC_EIBD200_ADDR)

#define INTC_EIBD201_ADDR    (INTC2_BASE + 0x2000U + 0x04U * 201U)
#define INTC_EIBD201_REG     REG32(INTC_EIBD201_ADDR)

#define INTC_EIBD202_ADDR    (INTC2_BASE + 0x2000U + 0x04U * 202U)
#define INTC_EIBD202_REG     REG32(INTC_EIBD202_ADDR)

#define INTC_EIBD32_767_PEID_POS    (0U)
#define INTC_EIBD32_767_PEID_MSK    ((uint32_t)(0x7U << INTC_EIBD32_767_PEID_POS))


/** ************************************************************************* */
/** OS Timer (OSTM) Setup */
/** ************************************************************************* */

/** OS Timer base addresses */
#define OSTM0_BASE    (0xFFBF0000)
#define OSTM1_BASE    (0xFFBF0100)
#define OSTM2_BASE    (0xFFBF0200)
#define OSTM3_BASE    (0xFFBF0300)

/** OSTMn Control Register */
#define OSTM_OSTM0CTL_ADDR    (OSTM0_BASE + 0x20U)
#define OSTM_OSTM0CTL_REG     REG32(OSTM_OSTM0CTL_ADDR)

#define OSTM_OSTM1CTL_ADDR    (OSTM1_BASE + 0x20U)
#define OSTM_OSTM1CTL_REG     REG32(OSTM_OSTM1CTL_ADDR)

#define OSTM_OSTM2CTL_ADDR    (OSTM2_BASE + 0x20U)
#define OSTM_OSTM2CTL_REG     REG32(OSTM_OSTM2CTL_ADDR)

#define OSTM_OSTM3CTL_ADDR    (OSTM3_BASE + 0x20U)
#define OSTM_OSTM3CTL_REG     REG32(OSTM_OSTM3CTL_ADDR)

#define OSTM_OSTMnCTL_OSTMnMD1_POS    (1U)
#define OSTM_OSTMnCTL_OSTMnMD1_MSK    (1U << OSTM_OSTMnCTL_OSTMnMD1_POS)

#define OSTM_OSTMnCTL_OSTMnIE_POS    (7U)
#define OSTM_OSTMnCTL_OSTMnIE_MSK    (1U << OSTM_OSTMnCTL_OSTMnIE_POS)


/** OSTMn Compare Register */
#define OSTM_OSTM0CMP_ADDR    (OSTM0_BASE + 0x00U)
#define OSTM_OSTM0CMP_REG     REG32(OSTM_OSTM0CMP_ADDR)

#define OSTM_OSTM1CMP_ADDR    (OSTM1_BASE + 0x00U)
#define OSTM_OSTM1CMP_REG     REG32(OSTM_OSTM1CMP_ADDR)

#define OSTM_OSTM2CMP_ADDR    (OSTM2_BASE + 0x00U)
#define OSTM_OSTM2CMP_REG     REG32(OSTM_OSTM2CMP_ADDR)

#define OSTM_OSTM3CMP_ADDR    (OSTM3_BASE + 0x00U)
#define OSTM_OSTM3CMP_REG     REG32(OSTM_OSTM3CMP_ADDR)

#define OSTM_OSTM0CMP_REG_U32    OSTM_OSTM0CMP_REG
#define OSTM_OSTM1CMP_REG_U32    OSTM_OSTM1CMP_REG
#define OSTM_OSTM2CMP_REG_U32    OSTM_OSTM2CMP_REG
#define OSTM_OSTM3CMP_REG_U32    OSTM_OSTM3CMP_REG


/** OSTMn Count Start Trigger Register */
#define OSTM_OSTM0TS_ADDR    (OSTM0_BASE + 0x14U)
#define OSTM_OSTM0TS_REG     REG8(OSTM_OSTM0TS_ADDR)

#define OSTM_OSTM1TS_ADDR    (OSTM1_BASE + 0x14U)
#define OSTM_OSTM1TS_REG     REG8(OSTM_OSTM1TS_ADDR)

#define OSTM_OSTM2TS_ADDR    (OSTM2_BASE + 0x14U)
#define OSTM_OSTM2TS_REG     REG8(OSTM_OSTM2TS_ADDR)

#define OSTM_OSTM3TS_ADDR    (OSTM3_BASE + 0x14U)
#define OSTM_OSTM3TS_REG     REG8(OSTM_OSTM3TS_ADDR)

#define OSTM_OSTMnTS_OSTMnTS_POS    (0U)
#define OSTM_OSTMnTS_OSTMnTS_MSK    ((uint8_t)(1U << OSTM_OSTMnTS_OSTMnTS_POS))


/** ************************************************************************* */
/** Reset Controller (RESCTLR) */
/** ************************************************************************* */

/** Boot Control Register */
#define RESCTLR_BOOTCTRL_ADDR    (0xFFFB2000U)
#define RESCTLR_BOOTCTRL_REG     REG32(RESCTLR_BOOTCTRL_ADDR)

#define RESCTLR_BOOTCTRL_BC1_POS    (1U)
#define RESCTLR_BOOTCTRL_BC1_MSK    (1U << RESCTLR_BOOTCTRL_BC1_POS)

#define RESCTLR_BOOTCTRL_BC2_POS    (2U)
#define RESCTLR_BOOTCTRL_BC2_MSK    (1U << RESCTLR_BOOTCTRL_BC2_POS)

#define RESCTLR_BOOTCTRL_BC3_POS    (3U)
#define RESCTLR_BOOTCTRL_BC3_MSK    (1U << RESCTLR_BOOTCTRL_BC3_POS)


/** ************************************************************************* */
/** Functional Safety (FS) Setup */
/** ************************************************************************* */

/** Functional Safety base addresses */
#define FS_PBGERRSLV20_BASE    (0xFFDE1000U)
#define FS_PBG21_BASE          (0xFFDE0C00U)

/** Functional Safety Keycode Protection Register */
#define FS_KCE_EN_VAL     (0xA5A5A501U)
#define FS_KCE_DIS_VAL    (0xA5A5A500U)

#define FS_PBGKCPROT_ADDR    (FS_PBGERRSLV20_BASE + 0x18U)
#define FS_PBGKCPROT_REG     REG32(FS_PBGKCPROT_ADDR)

#define FS_PBG21_PBGPROT1_6_ADDR    (FS_PBG21_BASE + 0x04U + (6U * 0x08U))
#define FS_PBG21_PBGPROT1_6_REG     REG32(FS_PBG21_PBGPROT1_6_ADDR)

#define FS_PBG21_PBGPROT1_10_ADDR    (FS_PBG21_BASE + 0x04U + (10U * 0x08U))
#define FS_PBG21_PBGPROT1_10_REG     REG32(FS_PBG21_PBGPROT1_10_ADDR)


#endif /* BOARD_SPEC_H */
#endif /* STARTER_KIT_RH850_U2A */
