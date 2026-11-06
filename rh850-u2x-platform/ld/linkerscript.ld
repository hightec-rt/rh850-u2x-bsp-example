/**************************************************************************************************
 * SPDX-License-Identifier: BSL-1.0
 *
 * Copyright (C) 2015-2026 HighTec EDV-Systeme GmbH.
 * All rights reserved.
 *************************************************************************************************/

/**************************************************************************************************
 * @file
 *
 * @brief General linker script
 *
 * @details
 * UC SUPPORT:
 *    RH850 U2A16
 *
 * This file is a general linker script file which should fit the needs of most projects.
 *
 * There are device specific linker script files which describe the memory regions of the selected device
 * (like memory_u2a16.ld, flash_regions_u2a16.ld).
 *
 *************************************************************************************************/


/* Output Sections: Boot. */
SECTIONS
{
    /* Exception Vector Table. */
    .0.exceptionvecttbl : ALIGN(512) { KEEP(*(.0.exceptionvecttbl*)); . = ALIGN(8); } >REGION_EXECPLACE_0_EXCEPTION_VECT_TBL AT> REGION_LOADPLACE_0_EXCEPTION_VECT_TBL
    .1.exceptionvecttbl : ALIGN(512) { KEEP(*(.1.exceptionvecttbl*)); . = ALIGN(8); } >REGION_EXECPLACE_1_EXCEPTION_VECT_TBL AT> REGION_LOADPLACE_1_EXCEPTION_VECT_TBL

    /* Exception Vector Table start. */
    _ld_exception_vector_table_start_0 = ADDR(.0.exceptionvecttbl); /* This linker symbol may be used by the startup_init_memory_sections() function. */
    _ld_exception_vector_table_start_1 = ADDR(.1.exceptionvecttbl); /* This linker symbol may be used by the startup_init_memory_sections() function. */

    /* ========================================================================== */

    /* Interrupt Vector Table. */
    .pe0.interruptvecttbl : ALIGN(512) { KEEP(*(.pe0.interruptvecttbl*)); . = ALIGN(8); } >REGION_EXECPLACE_PE0_INTERRUPT_VECT_TBL AT> REGION_LOADPLACE_PE0_INTERRUPT_VECT_TBL
    .pe1.interruptvecttbl : ALIGN(512) { KEEP(*(.pe1.interruptvecttbl*)); . = ALIGN(8); } >REGION_EXECPLACE_PE1_INTERRUPT_VECT_TBL AT> REGION_LOADPLACE_PE1_INTERRUPT_VECT_TBL
    .pe2.interruptvecttbl : ALIGN(512) { KEEP(*(.pe2.interruptvecttbl*)); . = ALIGN(8); } >REGION_EXECPLACE_PE2_INTERRUPT_VECT_TBL AT> REGION_LOADPLACE_PE2_INTERRUPT_VECT_TBL
    .pe3.interruptvecttbl : ALIGN(512) { KEEP(*(.pe3.interruptvecttbl*)); . = ALIGN(8); } >REGION_EXECPLACE_PE3_INTERRUPT_VECT_TBL AT> REGION_LOADPLACE_PE3_INTERRUPT_VECT_TBL
    .pe4.interruptvecttbl : ALIGN(512) { KEEP(*(.pe4.interruptvecttbl*)); . = ALIGN(8); } >REGION_EXECPLACE_PE4_INTERRUPT_VECT_TBL AT> REGION_LOADPLACE_PE4_INTERRUPT_VECT_TBL
    .pe5.interruptvecttbl : ALIGN(512) { KEEP(*(.pe5.interruptvecttbl*)); . = ALIGN(8); } >REGION_EXECPLACE_PE5_INTERRUPT_VECT_TBL AT> REGION_LOADPLACE_PE5_INTERRUPT_VECT_TBL

    /* Interrupt Vector Table start. */
    _ld_interrupt_vector_table_start_pe0 = ADDR(.pe0.interruptvecttbl); /* This linker symbol may be used by the startup_init_memory_sections() function. */
    _ld_interrupt_vector_table_start_pe1 = ADDR(.pe1.interruptvecttbl); /* This linker symbol may be used by the startup_init_memory_sections() function. */
    _ld_interrupt_vector_table_start_pe2 = ADDR(.pe2.interruptvecttbl); /* This linker symbol may be used by the startup_init_memory_sections() function. */
    _ld_interrupt_vector_table_start_pe3 = ADDR(.pe3.interruptvecttbl); /* This linker symbol may be used by the startup_init_memory_sections() function. */
    _ld_interrupt_vector_table_start_pe4 = ADDR(.pe4.interruptvecttbl); /* This linker symbol may be used by the startup_init_memory_sections() function. */
    _ld_interrupt_vector_table_start_pe5 = ADDR(.pe5.interruptvecttbl); /* This linker symbol may be used by the startup_init_memory_sections() function. */

    /* ========================================================================== */

    /* Startup code. */
    .startupcode : ALIGN(8) { KEEP(*(.startupcode*)); . = ALIGN(8); } >REGION_LOADPLACE_STARTUP_CODE AT> REGION_LOADPLACE_STARTUP_CODE
}



/* Output Sections: Program code. */
SECTIONS
{
    /* Custom program code. */
    .customtext : ALIGN(8) { *(.customtext*); . = ALIGN(8); } >REGION_EXECPLACE_CUSTOM_CODE AT> REGION_LOADPLACE_CUSTOM_CODE

    /* Default program code. */
    .text : ALIGN(8) { *(.text*); . = ALIGN(8); } >REGION_EXECPLACE_DEFAULT_CODE AT> REGION_LOADPLACE_DEFAULT_CODE
}



/* Output Sections: Copy, clear and fill tables. */
SECTIONS
{
    /* Copy, clear and fill tables. */
    /* On 32-bit targets, the tables must contain LONG values. */
    /* On 64-bit targets, the tables must contain QUAD values. */
    .copyclearfilltable : ALIGN(8)
    {
        /*   source                                          destination                                     size */

        _ld_copy_table_pe0 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(LOADADDR(.0.exceptionvecttbl));            LONG(0 + ADDR(.0.exceptionvecttbl));            LONG(SIZEOF(.0.exceptionvecttbl));
        LONG(LOADADDR(.1.exceptionvecttbl));            LONG(0 + ADDR(.1.exceptionvecttbl));            LONG(SIZEOF(.1.exceptionvecttbl));
        LONG(LOADADDR(.pe0.interruptvecttbl));          LONG(0 + ADDR(.pe0.interruptvecttbl));          LONG(SIZEOF(.pe0.interruptvecttbl));
        LONG(LOADADDR(.pe1.interruptvecttbl));          LONG(0 + ADDR(.pe1.interruptvecttbl));          LONG(SIZEOF(.pe1.interruptvecttbl));
        LONG(LOADADDR(.pe2.interruptvecttbl));          LONG(0 + ADDR(.pe2.interruptvecttbl));          LONG(SIZEOF(.pe2.interruptvecttbl));
        LONG(LOADADDR(.pe3.interruptvecttbl));          LONG(0 + ADDR(.pe3.interruptvecttbl));          LONG(SIZEOF(.pe3.interruptvecttbl));
        LONG(LOADADDR(.pe4.interruptvecttbl));          LONG(0 + ADDR(.pe4.interruptvecttbl));          LONG(SIZEOF(.pe4.interruptvecttbl));
        LONG(LOADADDR(.pe5.interruptvecttbl));          LONG(0 + ADDR(.pe5.interruptvecttbl));          LONG(SIZEOF(.pe5.interruptvecttbl));
        LONG(LOADADDR(.customtext));                    LONG(0 + ADDR(.customtext));                    LONG(SIZEOF(.customtext));
        LONG(LOADADDR(.text));                          LONG(0 + ADDR(.text));                          LONG(SIZEOF(.text));
        LONG(LOADADDR(.customrodata));                  LONG(0 + ADDR(.customrodata));                  LONG(SIZEOF(.customrodata));
        LONG(LOADADDR(.rodata));                        LONG(0 + ADDR(.rodata));                        LONG(SIZEOF(.rodata));
        LONG(LOADADDR(.data));                          LONG(0 + ADDR(.data));                          LONG(SIZEOF(.data));
        LONG(LOADADDR(.pe0.data));                      LONG(0 + ADDR(.pe0.data));                      LONG(SIZEOF(.pe0.data));
        LONG(LOADADDR(.shared.data));                   LONG(0 + ADDR(.shared.data));                   LONG(SIZEOF(.shared.data));
        LONG(-1);                                       LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        _ld_copy_table_pe1 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(LOADADDR(.data));                          LONG(0 + ADDR(.data));                          LONG(SIZEOF(.data));
        LONG(LOADADDR(.pe1.data));                      LONG(0 + ADDR(.pe1.data));                      LONG(SIZEOF(.pe1.data));
        LONG(-1);                                       LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        _ld_copy_table_pe2 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(LOADADDR(.data));                          LONG(0 + ADDR(.data));                          LONG(SIZEOF(.data));
        LONG(LOADADDR(.pe2.data));                      LONG(0 + ADDR(.pe2.data));                      LONG(SIZEOF(.pe2.data));
        LONG(-1);                                       LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        _ld_copy_table_pe3 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(LOADADDR(.data));                          LONG(0 + ADDR(.data));                          LONG(SIZEOF(.data));
        LONG(LOADADDR(.pe3.data));                      LONG(0 + ADDR(.pe3.data));                      LONG(SIZEOF(.pe3.data));
        LONG(-1);                                       LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        _ld_copy_table_pe4 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(LOADADDR(.data));                          LONG(0 + ADDR(.data));                          LONG(SIZEOF(.data));
        LONG(LOADADDR(.pe4.data));                      LONG(0 + ADDR(.pe4.data));                      LONG(SIZEOF(.pe4.data));
        LONG(-1);                                       LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        _ld_copy_table_pe5 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(LOADADDR(.data));                          LONG(0 + ADDR(.data));                          LONG(SIZEOF(.data));
        LONG(LOADADDR(.pe5.data));                      LONG(0 + ADDR(.pe5.data));                      LONG(SIZEOF(.pe5.data));
        LONG(-1);                                       LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        /* ========================================================================== */

        /*   destination                                     size */

        _ld_clear_table_pe0 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(0 + ADDR(.bss));                           LONG(SIZEOF(.bss));
        LONG(0 + ADDR(.pe0.bss));                       LONG(SIZEOF(.pe0.bss));
        LONG(0 + ADDR(.shared.bss));                    LONG(SIZEOF(.shared.bss));
        LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        _ld_clear_table_pe1 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(0 + ADDR(.bss));                           LONG(SIZEOF(.bss));
        LONG(0 + ADDR(.pe1.bss));                       LONG(SIZEOF(.pe1.bss));
        LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        _ld_clear_table_pe2 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(0 + ADDR(.bss));                           LONG(SIZEOF(.bss));
        LONG(0 + ADDR(.pe2.bss));                       LONG(SIZEOF(.pe2.bss));
        LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        _ld_clear_table_pe3 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(0 + ADDR(.bss));                           LONG(SIZEOF(.bss));
        LONG(0 + ADDR(.pe3.bss));                       LONG(SIZEOF(.pe3.bss));
        LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        _ld_clear_table_pe4 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(0 + ADDR(.bss));                           LONG(SIZEOF(.bss));
        LONG(0 + ADDR(.pe4.bss));                       LONG(SIZEOF(.pe4.bss));
        LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        _ld_clear_table_pe5 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(0 + ADDR(.bss));                           LONG(SIZEOF(.bss));
        LONG(0 + ADDR(.pe5.bss));                       LONG(SIZEOF(.pe5.bss));
        LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        /* ========================================================================== */

        /*   start                                           end                                             pattern */

        _ld_fill_table_pe0 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(0 + _ld_heap_start_pe0);                   LONG(0 + _ld_heap_end_pe0);                     LONG(0xEEEEEEE0);
        LONG(0 + _ld_stack_bottom_pe0);                 LONG(0 + _ld_stack_top_pe0);                    LONG(0x55555550);
        LONG(-1);                                       LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        _ld_fill_table_pe1 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(0 + _ld_heap_start_pe1);                   LONG(0 + _ld_heap_end_pe1);                     LONG(0xEEEEEEE1);
        LONG(0 + _ld_stack_bottom_pe1);                 LONG(0 + _ld_stack_top_pe1);                    LONG(0x55555551);
        LONG(-1);                                       LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        _ld_fill_table_pe2 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(0 + _ld_heap_start_pe2);                   LONG(0 + _ld_heap_end_pe2);                     LONG(0xEEEEEEE2);
        LONG(0 + _ld_stack_bottom_pe2);                 LONG(0 + _ld_stack_top_pe2);                    LONG(0x55555552);
        LONG(-1);                                       LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        _ld_fill_table_pe3 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(0 + _ld_heap_start_pe3);                   LONG(0 + _ld_heap_end_pe3);                     LONG(0xEEEEEEE3);
        LONG(0 + _ld_stack_bottom_pe3);                 LONG(0 + _ld_stack_top_pe3);                    LONG(0x55555553);
        LONG(-1);                                       LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        _ld_fill_table_pe4 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(0 + _ld_heap_start_pe4);                   LONG(0 + _ld_heap_end_pe4);                     LONG(0xEEEEEEE4);
        LONG(0 + _ld_stack_bottom_pe4);                 LONG(0 + _ld_stack_top_pe4);                    LONG(0x55555554);
        LONG(-1);                                       LONG(-1);                                       LONG(-1);
        . = ALIGN(8);

        _ld_fill_table_pe5 = .; /* This linker symbol is used by the startup_init_memory_sections() function. */
        LONG(0 + _ld_heap_start_pe5);                   LONG(0 + _ld_heap_end_pe5);                     LONG(0xEEEEEEE5);
        LONG(0 + _ld_stack_bottom_pe5);                 LONG(0 + _ld_stack_top_pe5);                    LONG(0x55555555);
        LONG(-1);                                       LONG(-1);                                       LONG(-1);
        . = ALIGN(8);
    } >REGION_LOADPLACE_DEFAULT_CONSTDATA AT> REGION_LOADPLACE_DEFAULT_CONSTDATA
}



/* Output Sections: Constant data. */
SECTIONS
{
    /* Custom constant data. */
    .customrodata : ALIGN(8) { *(.customrodata*); . = ALIGN(8); } >REGION_EXECPLACE_CUSTOM_CONSTDATA AT> REGION_LOADPLACE_CUSTOM_CONSTDATA

    /* Default constant data. */
    .rodata : ALIGN(8) { *(.rodata* .rdata*); . = ALIGN(8); } >REGION_EXECPLACE_DEFAULT_CONSTDATA AT> REGION_LOADPLACE_DEFAULT_CONSTDATA

    /* Relocation entries. */
    .reloc : ALIGN(8) { *(.rel.dyn); *(.rel.ifunc); *(.rel.plt); *(.rel.iplt); . = ALIGN(8); } >REGION_LOADPLACE_DEFAULT_CONSTDATA AT> REGION_LOADPLACE_DEFAULT_CONSTDATA
}



/* Output Sections: Preserved data across resets. */
SECTIONS
{
    /* Default preserved data. */
    .preserve (NOLOAD) : ALIGN(8) { KEEP(*(SORT_BY_NAME(.preserve*))); . = ALIGN(8); } >REGION_EXECPLACE_PRESERVEDATA AT> REGION_EXECPLACE_PRESERVEDATA
}



/* Output Sections: Initialized data. */
SECTIONS
{
    /* Default initialized data. */
    .data : ALIGN(8) { *(.data*); . = ALIGN(8); } >REGION_EXECPLACE_DEFAULT_INITDATA AT> REGION_LOADPLACE_DEFAULT_INITDATA

    /* Private initialized data for each PE. */
    .pe0.data : ALIGN(8) { *(.pe0.data*); . = ALIGN(8); } >REGION_EXECPLACE_PE0_INITDATA AT> REGION_LOADPLACE_PE0_INITDATA
    .pe1.data : ALIGN(8) { *(.pe1.data*); . = ALIGN(8); } >REGION_EXECPLACE_PE1_INITDATA AT> REGION_LOADPLACE_PE1_INITDATA
    .pe2.data : ALIGN(8) { *(.pe2.data*); . = ALIGN(8); } >REGION_EXECPLACE_PE2_INITDATA AT> REGION_LOADPLACE_PE2_INITDATA
    .pe3.data : ALIGN(8) { *(.pe3.data*); . = ALIGN(8); } >REGION_EXECPLACE_PE3_INITDATA AT> REGION_LOADPLACE_PE3_INITDATA
    .pe4.data : ALIGN(8) { *(.pe4.data*); . = ALIGN(8); } >REGION_EXECPLACE_PE4_INITDATA AT> REGION_LOADPLACE_PE4_INITDATA
    .pe5.data : ALIGN(8) { *(.pe5.data*); . = ALIGN(8); } >REGION_EXECPLACE_PE5_INITDATA AT> REGION_LOADPLACE_PE5_INITDATA

    /* Shared initialized data for each PE. */
    .shared.data : ALIGN(8) { *(.shared.data*); . = ALIGN(8); } >REGION_EXECPLACE_SHARED_INITDATA AT> REGION_LOADPLACE_SHARED_INITDATA
}



/* Output Sections: Uninitialized data. */
SECTIONS
{
    /* Default uninitialized data. */
    .bss (NOLOAD) : ALIGN(8) { *(.bss*); . = ALIGN(8); } >REGION_EXECPLACE_DEFAULT_UNINITDATA AT> REGION_EXECPLACE_DEFAULT_UNINITDATA

    /* Private uninitialized data for each PE. */
    .pe0.bss (NOLOAD) : ALIGN(8) { *(.pe0.bss*); . = ALIGN(8); } >REGION_EXECPLACE_PE0_UNINITDATA AT> REGION_EXECPLACE_PE0_UNINITDATA
    .pe1.bss (NOLOAD) : ALIGN(8) { *(.pe1.bss*); . = ALIGN(8); } >REGION_EXECPLACE_PE1_UNINITDATA AT> REGION_EXECPLACE_PE1_UNINITDATA
    .pe2.bss (NOLOAD) : ALIGN(8) { *(.pe2.bss*); . = ALIGN(8); } >REGION_EXECPLACE_PE2_UNINITDATA AT> REGION_EXECPLACE_PE2_UNINITDATA
    .pe3.bss (NOLOAD) : ALIGN(8) { *(.pe3.bss*); . = ALIGN(8); } >REGION_EXECPLACE_PE3_UNINITDATA AT> REGION_EXECPLACE_PE3_UNINITDATA
    .pe4.bss (NOLOAD) : ALIGN(8) { *(.pe4.bss*); . = ALIGN(8); } >REGION_EXECPLACE_PE4_UNINITDATA AT> REGION_EXECPLACE_PE4_UNINITDATA
    .pe5.bss (NOLOAD) : ALIGN(8) { *(.pe5.bss*); . = ALIGN(8); } >REGION_EXECPLACE_PE5_UNINITDATA AT> REGION_EXECPLACE_PE5_UNINITDATA

    /* Shared uninitialized data for each PE. */
    .shared.bss (NOLOAD) : ALIGN(8) { *(.shared.bss*); . = ALIGN(8); } >REGION_EXECPLACE_SHARED_UNINITDATA AT> REGION_EXECPLACE_SHARED_UNINITDATA
}



/* Output Sections: Heap and stack. */
SECTIONS
{
    /* Default heap. */
    .heap.pe0 (NOLOAD) : ALIGN(8) { KEEP(*(.heap.pe0*)); . = ALIGN(8); . = . + _LD_HEAP_SIZE_PE0; . = ALIGN(8); } >REGION_EXECPLACE_PE0_HEAP AT> REGION_EXECPLACE_PE0_HEAP
    .heap.pe1 (NOLOAD) : ALIGN(8) { KEEP(*(.heap.pe1*)); . = ALIGN(8); . = . + _LD_HEAP_SIZE_PE1; . = ALIGN(8); } >REGION_EXECPLACE_PE1_HEAP AT> REGION_EXECPLACE_PE1_HEAP
    .heap.pe2 (NOLOAD) : ALIGN(8) { KEEP(*(.heap.pe2*)); . = ALIGN(8); . = . + _LD_HEAP_SIZE_PE2; . = ALIGN(8); } >REGION_EXECPLACE_PE2_HEAP AT> REGION_EXECPLACE_PE2_HEAP
    .heap.pe3 (NOLOAD) : ALIGN(8) { KEEP(*(.heap.pe3*)); . = ALIGN(8); . = . + _LD_HEAP_SIZE_PE3; . = ALIGN(8); } >REGION_EXECPLACE_PE3_HEAP AT> REGION_EXECPLACE_PE3_HEAP
    .heap.pe4 (NOLOAD) : ALIGN(8) { KEEP(*(.heap.pe4*)); . = ALIGN(8); . = . + _LD_HEAP_SIZE_PE4; . = ALIGN(8); } >REGION_EXECPLACE_PE4_HEAP AT> REGION_EXECPLACE_PE4_HEAP
    .heap.pe5 (NOLOAD) : ALIGN(8) { KEEP(*(.heap.pe5*)); . = ALIGN(8); . = . + _LD_HEAP_SIZE_PE5; . = ALIGN(8); } >REGION_EXECPLACE_PE5_HEAP AT> REGION_EXECPLACE_PE5_HEAP

    /* Heap start. Heap grows upward. */
    _ld_heap_start_pe0 = ADDR(.heap.pe0);
    _ld_heap_start_pe1 = ADDR(.heap.pe1);
    _ld_heap_start_pe2 = ADDR(.heap.pe2);
    _ld_heap_start_pe3 = ADDR(.heap.pe3);
    _ld_heap_start_pe4 = ADDR(.heap.pe4);
    _ld_heap_start_pe5 = ADDR(.heap.pe5);

    /* Heap end. */
    _ld_heap_end_pe0 = ADDR(.heap.pe0) + SIZEOF(.heap.pe0);
    _ld_heap_end_pe1 = ADDR(.heap.pe1) + SIZEOF(.heap.pe1);
    _ld_heap_end_pe2 = ADDR(.heap.pe2) + SIZEOF(.heap.pe2);
    _ld_heap_end_pe3 = ADDR(.heap.pe3) + SIZEOF(.heap.pe3);
    _ld_heap_end_pe4 = ADDR(.heap.pe4) + SIZEOF(.heap.pe4);
    _ld_heap_end_pe5 = ADDR(.heap.pe5) + SIZEOF(.heap.pe5);

    /* ========================================================================== */

    /* Default stack. */
    .stack.pe0 (NOLOAD) : ALIGN(8) { KEEP(*(.stack.pe0*)); . = ALIGN(8); . = . + _LD_STACK_SIZE_PE0; . = ALIGN(8); } >REGION_EXECPLACE_PE0_STACK AT> REGION_EXECPLACE_PE0_STACK
    .stack.pe1 (NOLOAD) : ALIGN(8) { KEEP(*(.stack.pe1*)); . = ALIGN(8); . = . + _LD_STACK_SIZE_PE1; . = ALIGN(8); } >REGION_EXECPLACE_PE1_STACK AT> REGION_EXECPLACE_PE1_STACK
    .stack.pe2 (NOLOAD) : ALIGN(8) { KEEP(*(.stack.pe2*)); . = ALIGN(8); . = . + _LD_STACK_SIZE_PE2; . = ALIGN(8); } >REGION_EXECPLACE_PE2_STACK AT> REGION_EXECPLACE_PE2_STACK
    .stack.pe3 (NOLOAD) : ALIGN(8) { KEEP(*(.stack.pe3*)); . = ALIGN(8); . = . + _LD_STACK_SIZE_PE3; . = ALIGN(8); } >REGION_EXECPLACE_PE3_STACK AT> REGION_EXECPLACE_PE3_STACK
    .stack.pe4 (NOLOAD) : ALIGN(8) { KEEP(*(.stack.pe4*)); . = ALIGN(8); . = . + _LD_STACK_SIZE_PE4; . = ALIGN(8); } >REGION_EXECPLACE_PE4_STACK AT> REGION_EXECPLACE_PE4_STACK
    .stack.pe5 (NOLOAD) : ALIGN(8) { KEEP(*(.stack.pe5*)); . = ALIGN(8); . = . + _LD_STACK_SIZE_PE5; . = ALIGN(8); } >REGION_EXECPLACE_PE5_STACK AT> REGION_EXECPLACE_PE5_STACK

    /* Stack top. Stack grows downward. */
    _ld_stack_top_pe0 = ADDR(.stack.pe0) + SIZEOF(.stack.pe0);
    _ld_stack_top_pe1 = ADDR(.stack.pe1) + SIZEOF(.stack.pe1);
    _ld_stack_top_pe2 = ADDR(.stack.pe2) + SIZEOF(.stack.pe2);
    _ld_stack_top_pe3 = ADDR(.stack.pe3) + SIZEOF(.stack.pe3);
    _ld_stack_top_pe4 = ADDR(.stack.pe4) + SIZEOF(.stack.pe4);
    _ld_stack_top_pe5 = ADDR(.stack.pe5) + SIZEOF(.stack.pe5);

    /* Stack bottom. */
    _ld_stack_bottom_pe0 = ADDR(.stack.pe0); /* This linker symbol is used by the startup_init_memory_sections() function. */
    _ld_stack_bottom_pe1 = ADDR(.stack.pe1); /* This linker symbol is used by the startup_init_memory_sections() function. */
    _ld_stack_bottom_pe2 = ADDR(.stack.pe2); /* This linker symbol is used by the startup_init_memory_sections() function. */
    _ld_stack_bottom_pe3 = ADDR(.stack.pe3); /* This linker symbol is used by the startup_init_memory_sections() function. */
    _ld_stack_bottom_pe4 = ADDR(.stack.pe4); /* This linker symbol is used by the startup_init_memory_sections() function. */
    _ld_stack_bottom_pe5 = ADDR(.stack.pe5); /* This linker symbol is used by the startup_init_memory_sections() function. */

    /* Startup code shall initialize the stack pointer to this value. */
    _ld_initial_stack_pointer_pe0 = _ld_stack_top_pe0;
    _ld_initial_stack_pointer_pe1 = _ld_stack_top_pe1;
    _ld_initial_stack_pointer_pe2 = _ld_stack_top_pe2;
    _ld_initial_stack_pointer_pe3 = _ld_stack_top_pe3;
    _ld_initial_stack_pointer_pe4 = _ld_stack_top_pe4;
    _ld_initial_stack_pointer_pe5 = _ld_stack_top_pe5;
}



/* Output Sections: Debug and information sections. */
SECTIONS
{
    /* Debug sections. */
    .debug_info     0 : { *(.debug_info) }
    .debug_abbrev   0 : { *(.debug_abbrev) }
    .debug_ranges   0 : { *(.debug_ranges) }
    .debug_aranges  0 : { *(.debug_aranges) }
    .debug_rnglists 0 : { *(.debug_rnglists) }
    .debug_macro    0 : { *(.debug_macro) }
    .debug_line     0 : { *(.debug_line) }
    .debug_str      0 : { *(.debug_str) }
    .debug_frame    0 : { *(.debug_frame) }
    .debug_line_str 0 : { *(.debug_line_str) }
    .debug_loc      0 : { *(.debug_loc) }
    .debug_loclists 0 : { *(.debug_loclists) }

    /* Synthetic and attribute sections. */
    .symtab       0 : { *(.symtab) }
    .symtab_shndx 0 : { *(.symtab_shndx) }
    .strtab       0 : { *(.strtab) }
    .shstrtab     0 : { *(.shstrtab) }

    /* Toolchain version information. */
    .comment      0 : { *(.comment*) }
    .note.renesas 0 : { *(.note.renesas) }
}



/* Output Sections: Discarded sections. */
SECTIONS
{
    /* Remove information from the compiler libraries. */
    /DISCARD/ :
    {
        libc.a ( * )
        libm.a ( * )
        libgcc.a ( * )
    }
}



/* Dummy memory region for orphan sections. */
MEMORY
{
    ORPHAN (rwx) : ORIGIN = 0xFFFFFFFF, LENGTH = 0
}

/* Output Sections: Orphan sections. */
SECTIONS
{
    /* Capture orphan sections. */
    .orphans 0 : { *(*) } >ORPHAN AT> ORPHAN
}

/* Report orphan sections as error. */
ASSERT(SIZEOF(.orphans) == 0, "Linker error. There are orphan sections. Orphan sections are listed in the map file under the `.orphans` text.");



/* Exception vector table and interrupt vector table related asserts. */
ASSERT(SIZEOF(.0.exceptionvecttbl) != 0, "Linker error. Flash Bank A exception vector table must not be empty.")
ASSERT(SIZEOF(.1.exceptionvecttbl) != 0, "Linker error. Flash Bank C exception vector table must not be empty.")
ASSERT(SIZEOF(.pe0.interruptvecttbl) != 0, "Linker error. PE0 interrupt vector table must not be empty.")
ASSERT(SIZEOF(.pe1.interruptvecttbl) != 0, "Linker error. PE1 interrupt vector table must not be empty.")
ASSERT(SIZEOF(.pe2.interruptvecttbl) != 0, "Linker error. PE2 interrupt vector table must not be empty.")
ASSERT(SIZEOF(.pe3.interruptvecttbl) != 0, "Linker error. PE3 interrupt vector table must not be empty.")
ASSERT(SIZEOF(.pe4.interruptvecttbl) != 0, "Linker error. PE4 interrupt vector table must not be empty.")
ASSERT(SIZEOF(.pe5.interruptvecttbl) != 0, "Linker error. PE5 interrupt vector table must not be empty.")
