/**************************************************************************************************
 * SPDX-License-Identifier: BSL-1.0
 *
 * Copyright (C) 2015-2026 HighTec EDV-Systeme GmbH.
 * All rights reserved.
 *************************************************************************************************/

/**************************************************************************************************
 * @file
 *
 * @brief Exception vector table definition.
 *
 * @details
 * UC SUPPORT:
 *    RH850 U2x
 *
 *
 * Exception Vector Table
 *
 * The Exception Vector Table contains instructions (not addresses).
 * On reset, all PEs execute the first instruction in the Exception Vector Table, which is a jump to a function, called `__start`.
 * There are two identical Exception Vector Tables implemented in this library crate:
 *     0. Exception Vector Table located at the beginning of Flash Bank A
 *         This Exception Vector Table is used by all Renesas RH850 U2A and U2B targets.
 *     1. Exception Vector Table located at the beginning of Flash Bank C
 *         This Exception Vector Table is used only by the Renesas RH850 U2A16 target.
 *         On the Renesas RH850 U2A16 target, PE0 and PE1 starts executing in Flash Bank A, PE2 and PE3 starts executing in Flash Bank C.
 *         On all other supported Renesas RH850 U2x targets, this Exception Vector Table is unused, thus this is a 512 byte (0.0162% of smallest Flash bank) waste of Flash memory.
 *
 *************************************************************************************************/


.macro EXCEPTION_VECTOR_TABLE_ENTRY name
    .balign         16
    syncp
    jmp             _exception_handler_\name, [r0]
.endm

.macro EXCEPTION_HANDLER_DEFINITION name
    .section        .text._exception_handler_\name, "ax", %progbits
    .weak           _exception_handler_\name
    .type           _exception_handler_\name, %function
    .balign         2
    _exception_handler_\name:
    br              _exception_handler_\name
    .size	        _exception_handler_\name, . - _exception_handler_\name
.endm

.macro EXCEPTION_VECTOR_TABLE
    jmp                                 __start, [r0]
    EXCEPTION_VECTOR_TABLE_ENTRY        syserr
    EXCEPTION_VECTOR_TABLE_ENTRY        hvtrap
    EXCEPTION_VECTOR_TABLE_ENTRY        fetrap
    EXCEPTION_VECTOR_TABLE_ENTRY        trap0
    EXCEPTION_VECTOR_TABLE_ENTRY        trap1
    EXCEPTION_VECTOR_TABLE_ENTRY        rie
    EXCEPTION_VECTOR_TABLE_ENTRY        fpe_fxe
    EXCEPTION_VECTOR_TABLE_ENTRY        ucpop
    EXCEPTION_VECTOR_TABLE_ENTRY        mip_mdp
    EXCEPTION_VECTOR_TABLE_ENTRY        pie
    EXCEPTION_VECTOR_TABLE_ENTRY        debug
    EXCEPTION_VECTOR_TABLE_ENTRY        mae
    EXCEPTION_VECTOR_TABLE_ENTRY        rfu
    EXCEPTION_VECTOR_TABLE_ENTRY        fenmi
    EXCEPTION_VECTOR_TABLE_ENTRY        feint
    EXCEPTION_VECTOR_TABLE_ENTRY        int_0
    EXCEPTION_VECTOR_TABLE_ENTRY        int_1
    EXCEPTION_VECTOR_TABLE_ENTRY        int_2
    EXCEPTION_VECTOR_TABLE_ENTRY        int_3
    EXCEPTION_VECTOR_TABLE_ENTRY        int_4
    EXCEPTION_VECTOR_TABLE_ENTRY        int_5
    EXCEPTION_VECTOR_TABLE_ENTRY        int_6
    EXCEPTION_VECTOR_TABLE_ENTRY        int_7
    EXCEPTION_VECTOR_TABLE_ENTRY        int_8
    EXCEPTION_VECTOR_TABLE_ENTRY        int_9
    EXCEPTION_VECTOR_TABLE_ENTRY        int_10
    EXCEPTION_VECTOR_TABLE_ENTRY        int_11
    EXCEPTION_VECTOR_TABLE_ENTRY        int_12
    EXCEPTION_VECTOR_TABLE_ENTRY        int_13
    EXCEPTION_VECTOR_TABLE_ENTRY        int_14
    EXCEPTION_VECTOR_TABLE_ENTRY        int_15
.endm

////////////////////////////////////////////////////////////////////////////////

/// Exception Vector Table

.section            .0.exceptionvecttbl._exception_vector_table_0, "ax", %progbits
.globl              _exception_vector_table_0
.type               _exception_vector_table_0, %object
.balign             512
_exception_vector_table_0:
    EXCEPTION_VECTOR_TABLE
    .size           _exception_vector_table_0, . - _exception_vector_table_0

.section            .1.exceptionvecttbl._exception_vector_table_1, "ax", %progbits
.globl              _exception_vector_table_1
.type               _exception_vector_table_1, %object
.balign             512
_exception_vector_table_1:
    EXCEPTION_VECTOR_TABLE
    .size           _exception_vector_table_1, . - _exception_vector_table_1

////////////////////////////////////////////////////////////////////////////////

/// Default exception handlers

EXCEPTION_HANDLER_DEFINITION            syserr
EXCEPTION_HANDLER_DEFINITION            hvtrap
EXCEPTION_HANDLER_DEFINITION            fetrap
EXCEPTION_HANDLER_DEFINITION            trap0
EXCEPTION_HANDLER_DEFINITION            trap1
EXCEPTION_HANDLER_DEFINITION            rie
EXCEPTION_HANDLER_DEFINITION            fpe_fxe
EXCEPTION_HANDLER_DEFINITION            ucpop
EXCEPTION_HANDLER_DEFINITION            mip_mdp
EXCEPTION_HANDLER_DEFINITION            pie
EXCEPTION_HANDLER_DEFINITION            debug
EXCEPTION_HANDLER_DEFINITION            mae
EXCEPTION_HANDLER_DEFINITION            rfu
EXCEPTION_HANDLER_DEFINITION            fenmi
EXCEPTION_HANDLER_DEFINITION            feint
EXCEPTION_HANDLER_DEFINITION            int_0
EXCEPTION_HANDLER_DEFINITION            int_1
EXCEPTION_HANDLER_DEFINITION            int_2
EXCEPTION_HANDLER_DEFINITION            int_3
EXCEPTION_HANDLER_DEFINITION            int_4
EXCEPTION_HANDLER_DEFINITION            int_5
EXCEPTION_HANDLER_DEFINITION            int_6
EXCEPTION_HANDLER_DEFINITION            int_7
EXCEPTION_HANDLER_DEFINITION            int_8
EXCEPTION_HANDLER_DEFINITION            int_9
EXCEPTION_HANDLER_DEFINITION            int_10
EXCEPTION_HANDLER_DEFINITION            int_11
EXCEPTION_HANDLER_DEFINITION            int_12
EXCEPTION_HANDLER_DEFINITION            int_13
EXCEPTION_HANDLER_DEFINITION            int_14
EXCEPTION_HANDLER_DEFINITION            int_15
