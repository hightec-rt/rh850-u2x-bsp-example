/**************************************************************************************************
 * SPDX-License-Identifier: BSL-1.0
 *
 * Copyright (C) 2015-2026 HighTec EDV-Systeme GmbH.
 * All rights reserved.
 *************************************************************************************************/

/**************************************************************************************************
 * UC SUPPORT:
 *
 *    RH850 U2x
 *
 * DESCRIPTION:
 *
 *    Toolchain abstraction
 *
 *************************************************************************************************/

#ifndef TOOLCHAIN_H
#define TOOLCHAIN_H

#include <v850intrin.h>

/** ************************************************************************* */
/** Miscellaneous */
/** ************************************************************************* */

#define TOOLCHAIN_STRINGIFY(x) #x


/** ************************************************************************* */
/** Intrinsics */
/** ************************************************************************* */

#define TOOLCHAIN_ENABLE_INTERRUPTS()     __builtin_v850_enable_interrupts()


/** ************************************************************************* */
/** Section definition */
/** ************************************************************************* */



#define TOOLCHAIN_SECTION_TEXT_START(section_name) \
    _Pragma(TOOLCHAIN_STRINGIFY(clang section text=section_name))

#define TOOLCHAIN_SECTION_TEXT_END() \
    _Pragma("clang section text=\"\"")


#define TOOLCHAIN_SECTION_BSS_START(section_name) \
    _Pragma(TOOLCHAIN_STRINGIFY(clang section bss=section_name))

#define TOOLCHAIN_SECTION_BSS_END() \
    _Pragma("clang section bss=\"\"")


#define TOOLCHAIN_SECTION_DATA_START(section_name) \
    _Pragma(TOOLCHAIN_STRINGIFY(clang section data=section_name))

#define TOOLCHAIN_SECTION_DATA_END() \
    _Pragma("clang section data=\"\"")


#define TOOLCHAIN_SECTION_RODATA_START(section_name) \
    _Pragma(TOOLCHAIN_STRINGIFY(clang section rodata=section_name))

#define TOOLCHAIN_SECTION_RODATA_END() \
    _Pragma("clang section rodata=\"\"")



#endif /* TOOLCHAIN_H */
