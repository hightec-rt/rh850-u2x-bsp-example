/**************************************************************************************************
 * SPDX-License-Identifier: BSL-1.0
 *
 * Copyright (C) 2015-2026 HighTec EDV-Systeme GmbH.
 * All rights reserved.
 *************************************************************************************************/

/**************************************************************************************************
 * @file
 *
 * @brief Memory section definition
 *
 * @details
 * UC SUPPORT:
 *    RH850 U2A16
 *
 *************************************************************************************************/

MEMORY
{
    CODE_FLASH_USER_AREA_0_BANK_A           : ORIGIN = 0x00000000, LENGTH = 4M
    CODE_FLASH_USER_AREA_1_BANK_B           : ORIGIN = 0x00400000, LENGTH = 4M
    CODE_FLASH_USER_AREA_2_BANK_C           : ORIGIN = 0x00800000, LENGTH = 4M
    CODE_FLASH_USER_AREA_3_BANK_D           : ORIGIN = 0x00C00000, LENGTH = 4M

    DATA_FLASH_DATA_AREA_0                  : ORIGIN = 0xFF200000, LENGTH = 256K
    DATA_FLASH_DATA_AREA_1                  : ORIGIN = 0xFF240000, LENGTH = 256K
    DATA_FLASH_DATA_AREA_2                  : ORIGIN = 0xFF280000, LENGTH = 64K

    LOCAL_RAM_PE3                           : ORIGIN = 0xFD600000, LENGTH = 64K
    LOCAL_RAM_PE2                           : ORIGIN = 0xFD800000, LENGTH = 64K
    LOCAL_RAM_PE1                           : ORIGIN = 0xFDA00000, LENGTH = 64K
    LOCAL_RAM_PE0                           : ORIGIN = 0xFDC00000, LENGTH = 64K
    LOCAL_RAM_SELF                          : ORIGIN = 0xFDE00000, LENGTH = 64K

    CLUSTER_RAM_CLUSTER0                    : ORIGIN = 0xFE000000, LENGTH = 512K
    CLUSTER_RAM_CLUSTER1                    : ORIGIN = 0xFE100000, LENGTH = 512K
    CLUSTER_RAM_CLUSTER2                    : ORIGIN = 0xFE400000, LENGTH = 2M
    CLUSTER_RAM_CLUSTER3_RETENTION_RAM      : ORIGIN = 0xFE800000, LENGTH = 256K
}
