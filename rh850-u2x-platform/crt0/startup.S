/**************************************************************************************************
 * SPDX-License-Identifier: BSL-1.0
 *
 * Copyright (C) 2015-2026 HighTec EDV-Systeme GmbH.
 * All rights reserved.
 *************************************************************************************************/

/**************************************************************************************************
 * @file
 *
 * @brief Startup code.
 *
 * @details
 * UC SUPPORT:
 *    RH850 U2x
 *
 *************************************************************************************************/


// Generate references to labels in other files to prevent those labels from being thrown out

.equ            my_exception_vector_table_0,        _exception_vector_table_0
.equ            my_exception_vector_table_1,        _exception_vector_table_1
.equ            my_interrupt_vector_table_pe0,      _INT_Vectors_PE0
.equ            my_interrupt_vector_table_pe1,      _INT_Vectors_PE1
.equ            my_interrupt_vector_table_pe2,      _INT_Vectors_PE2
.equ            my_interrupt_vector_table_pe3,      _INT_Vectors_PE3
.equ            my_interrupt_vector_table_pe4,      _INT_Vectors_PE4
.equ            my_interrupt_vector_table_pe5,      _INT_Vectors_PE5

////////////////////////////////////////////////////////////////////////////////

.macro CMP_PEID, peid:req
    cmp             \peid,     r10
    bz              .L.entry_PE\peid
.endm

.macro LBL_PEID, peid:req
    .L.entry_PE\peid:
    jmp             __cstart_pm\peid, [r0]
    br              _exit
.endm

.macro ENTER_MAIN, peid:req
    .section        .startupcode.__cstart_pm\peid, "ax", %progbits
    .globl          __cstart_pm\peid
    .balign         2
    __cstart_pm\peid:
        mov         r0,                                             gp      // set gp register (currently not used)
        mov         r0,                                             ep      // set ep register (currently not used)
        mov         hilo(_ld_initial_stack_pointer_pe\peid),        sp      // set sp register
        jarl        _startup_init_memory_sections,                  r31     // must be called after initializing stack pointer
        stsr        5,          r10,        0                               // r10 <- PSW
        // xori     0x0020,     r10,        r10                             // enable interrupt
        // movhi    0x4000,     r0,         r11
        // or       r11,        r10                                         // supervisor mode -> user mode
        ldsr        r10,        3,          0                               // FEPSW <- r10
        mov         hilo(_exit),            lp                              // lp <- #_exit
        mov         hilo(_main_pe\peid),    r10
        ldsr        r10,        2,          0                               // FEPC <- #_main
        feret                                                               // Apply PSW and PC to start user mode.
.endm

.macro WEAK_MAIN, peid:req
    .section        .text._main_pe\peid, "ax", %progbits
    .weak           _main_pe\peid
    .type           _main_pe\peid, %function
    .balign         2
    _main_pe\peid:
        br          _main_pe\peid
.endm

////////////////////////////////////////////////////////////////////////////////

/// Startup

.section        .startupcode.__start, "ax", %progbits
.balign         2
.globl          __start
__start:
    //  General purpose register.

    mov         r0,         r1                              // r1  Assembler reserved register
    mov         r0,         r2                              // r2  Register for address and data variables
    mov         r0,         r3                              // r3  Stack pointer(SP)
    mov         r0,         r4                              // r4  Global pointer(GP)
    mov         r0,         r5                              // r5  Text pointer(TP)
    mov         r0,         r6                              // r6  Register for addresses and data variables
    mov         r0,         r7                              // r7  Register for addresses and data variables
    mov         r0,         r8                              // r8  Register for addresses and data variables
    mov         r0,         r9                              // r9  Register for addresses and data variables
    mov         r0,         r10                             // r10 Register for addresses and data variables
    mov         r0,         r11                             // r11 Register for addresses and data variables
    mov         r0,         r12                             // r12 Register for addresses and data variables
    mov         r0,         r13                             // r13 Register for addresses and data variables
    mov         r0,         r14                             // r14 Register for addresses and data variables
    mov         r0,         r15                             // r15 Register for addresses and data variables
    mov         r0,         r16                             // r16 Register for addresses and data variables
    mov         r0,         r17                             // r17 Register for addresses and data variables
    mov         r0,         r18                             // r18 Register for addresses and data variables
    mov         r0,         r19                             // r19 Register for addresses and data variables
    mov         r0,         r20                             // r20 Register for addresses and data variables
    mov         r0,         r21                             // r21 Register for addresses and data variables
    mov         r0,         r22                             // r22 Register for addresses and data variables
    mov         r0,         r23                             // r23 Register for addresses and data variables
    mov         r0,         r24                             // r24 Register for addresses and data variables
    mov         r0,         r25                             // r25 Register for addresses and data variables
    mov         r0,         r26                             // r26 Register for addresses and data variables
    mov         r0,         r27                             // r27 Register for addresses and data variables
    mov         r0,         r28                             // r28 Register for addresses and data variables
    mov         r0,         r29                             // r29 Register for addresses and data variables
    mov         r0,         r30                             // r30 Element pointer(EP)
    mov         r0,         r31                             // r31 Link pointer(LP)

    // Basic system register.

    ldsr        r0,         0,          0                   // SR0,0  EIPC
    ldsr        r0,         2,          0                   // SR2,0  FEPC
    ldsr        r0,         16,         0                   // SR16,0 CTPC
    ldsr        r0,         28,         0                   // SR28,0 EIWR
    ldsr        r0,         29,         0                   // SR29,0 FEWR
    ldsr        r0,         3,          1                   // SR3,1  EBASE
    ldsr        r0,         4,          1                   // SR4,1  INTBP
    ldsr        r0,         6,          2                   // SR6,2  MEA
    ldsr        r0,         8,          2                   // SR8,2  MEI
    ldsr        r0,         18,         2                   // SR18,2 RBIP

    // Enable FPU.

    stsr        6,          r10,        1                   // r10 <- PID
    shl         21,         r10
    shr         30,         r10
    bz          .L.skip_enable_fpu                          // detecting FPU
    stsr        5,          r10,        0                   // r10 <- PSW
    movhi       0x0001,     r0,         r11
    or          r11,        r10
    ldsr        r10,        5,          0                   // enable FPU
    movhi       0x0002,     r0,         r11
    ldsr        r11,        6,          0                   // initialize FPSR
    ldsr        r0,         7,          0                   // initialize FPEPC
    .L.skip_enable_fpu:

    // Enable FXU.

    stsr        6,          r11,        1                   // r11 <- PID
    mov         r11,        r10
    shr         24,         r11
    cmp         6,          r11
    bl          .L.skip_enable_fxu
    shl         20,         r10
    shr         31,         r10
    bz          .L.skip_enable_fxu                          // detecting FXU
    stsr        5,          r10,        0                   // r10 <- PSW
    movhi       0x0002,     r0,         r11
    or          r11,        r10
    ldsr        r10,        5,          0                   // enable FXU
    movhi       0x0002,     r0,         r11
    ldsr        r11,        6,          10                  // initialize FXSR
    ldsr        r0,         8,          10                  // initialize FXST
    ldsr        r0,         10,         10                  // initialize FXCFG
    .L.skip_enable_fxu:

    // Jump to entry point of each PE.

    stsr        0,          r10,        2                   // get PEID or HTCFG0
    stsr        6,          r11,        1                   // get PID
    shr         24,         r11
    cmp         6,          r11
    bnl         .L1
    shr         16,         r10                             // get PEID (for G3)
    .L1:
    CMP_PEID    0
    CMP_PEID    1
    CMP_PEID    2
    CMP_PEID    3
    CMP_PEID    4
    CMP_PEID    5

    LBL_PEID    0
    LBL_PEID    1
    LBL_PEID    2
    LBL_PEID    3
    LBL_PEID    4
    LBL_PEID    5

////////////////////////////////////////////////////////////////////////////////

    // Jump to the main function of each PE.

    ENTER_MAIN 0
    ENTER_MAIN 1
    ENTER_MAIN 2
    ENTER_MAIN 3
    ENTER_MAIN 4
    ENTER_MAIN 5

////////////////////////////////////////////////////////////////////////////////

/// Default exit function.

.section        .startupcode._exit, "ax", %progbits
.weak           _exit
.type           _exit, %function
.balign         2
_exit:
    br          _exit

/// Weak main functions.

// `WEAK_MAIN 0` must not be here, because `_main_pe0` is a mandatory function.
WEAK_MAIN 1
WEAK_MAIN 2
WEAK_MAIN 3
WEAK_MAIN 4
WEAK_MAIN 5
