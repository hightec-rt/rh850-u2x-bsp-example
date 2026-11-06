/**************************************************************************************************
 * SPDX-License-Identifier: BSL-1.0
 *
 * Copyright (C) 2015-2026 HighTec EDV-Systeme GmbH.
 * All rights reserved.
 *************************************************************************************************/

/**************************************************************************************************
 * @file
 *
 * @brief Weak default function definition.
 *
 * @details
 * UC SUPPORT:
 *    RH850 U2x
 *
 *************************************************************************************************/


/**
 * @brief Weak definition of main PE1 function
 *
 */
__attribute__((weak)) int main_pe1(void)
{
    while (1) {}
    return 0;
}


/**
 * @brief Weak definition of main PE2 function
 *
 */
__attribute__((weak)) int main_pe2(void)
{
    while (1) {}
    return 0;
}


/**
 * @brief Weak definition of main PE3 function
 *
 */
__attribute__((weak)) int main_pe3(void)
{
    while (1) {}
    return 0;
}
