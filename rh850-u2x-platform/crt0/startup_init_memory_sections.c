/**************************************************************************************************
 * SPDX-License-Identifier: BSL-1.0
 *
 * Copyright (C) 2015-2026 HighTec EDV-Systeme GmbH.
 * All rights reserved.
 *************************************************************************************************/

/**************************************************************************************************
 * @file
 *
 * @brief Memory section initialization during startup.
 *
 * @details
 * UC SUPPORT:
 *    RH850 U2x
 *
 *************************************************************************************************/


/**
 * Public functions in this file:
 * - `startup_init_memory_sections`
 */

#include <stdint.h>

/******************************************************************************/

/******************************************************************************/
/******** BEGIN - PROJECT SPECIFIC IMPLEMENTATION *****************************/
/******************************************************************************/

#include "bsp.h"

/** Access linker symbol `_ld_linker_symbol` as `&_ld_linker_symbol`. */
extern uintptr_t ld_fill_table_pe0;
extern uintptr_t ld_fill_table_pe1;
extern uintptr_t ld_fill_table_pe2;
extern uintptr_t ld_fill_table_pe3;
extern uintptr_t ld_fill_table_pe4;
extern uintptr_t ld_fill_table_pe5;

extern uintptr_t ld_copy_table_pe0;
extern uintptr_t ld_copy_table_pe1;
extern uintptr_t ld_copy_table_pe2;
extern uintptr_t ld_copy_table_pe3;
extern uintptr_t ld_copy_table_pe4;
extern uintptr_t ld_copy_table_pe5;

extern uintptr_t ld_clear_table_pe0;
extern uintptr_t ld_clear_table_pe1;
extern uintptr_t ld_clear_table_pe2;
extern uintptr_t ld_clear_table_pe3;
extern uintptr_t ld_clear_table_pe4;
extern uintptr_t ld_clear_table_pe5;

extern uintptr_t ld_stack_bottom_pe0;
extern uintptr_t ld_stack_bottom_pe1;
extern uintptr_t ld_stack_bottom_pe2;
extern uintptr_t ld_stack_bottom_pe3;
extern uintptr_t ld_stack_bottom_pe4;
extern uintptr_t ld_stack_bottom_pe5;

extern uintptr_t ld_interrupt_vector_table_start_pe0;
extern uintptr_t ld_interrupt_vector_table_start_pe1;
extern uintptr_t ld_interrupt_vector_table_start_pe2;
extern uintptr_t ld_interrupt_vector_table_start_pe3;
extern uintptr_t ld_interrupt_vector_table_start_pe4;
extern uintptr_t ld_interrupt_vector_table_start_pe5;

/**
 * @brief Returns the address of the fill table.
 *
 * @return The address of the fill table as an `uintptr_t`.
 */
uintptr_t startup_get_fill_table_address(void)
{
    switch (bsp_board_processor_element_identifier_Get())
    {
        case 0U: return ((uintptr_t)&ld_fill_table_pe0);
        case 1U: return ((uintptr_t)&ld_fill_table_pe1);
        case 2U: return ((uintptr_t)&ld_fill_table_pe2);
        case 3U: return ((uintptr_t)&ld_fill_table_pe3);
        case 4U: return ((uintptr_t)&ld_fill_table_pe4);
        case 5U: return ((uintptr_t)&ld_fill_table_pe5);
        default: return ((uintptr_t)&ld_fill_table_pe0);
    }
}


/**
 * @brief Returns the address of the copy table.
 *
 * @return The address of the copy table as an `uintptr_t`.
 */
uintptr_t startup_get_copy_table_address(void)
{
    switch (bsp_board_processor_element_identifier_Get())
    {
        case 0U: return ((uintptr_t)&ld_copy_table_pe0);
        case 1U: return ((uintptr_t)&ld_copy_table_pe1);
        case 2U: return ((uintptr_t)&ld_copy_table_pe2);
        case 3U: return ((uintptr_t)&ld_copy_table_pe3);
        case 4U: return ((uintptr_t)&ld_copy_table_pe4);
        case 5U: return ((uintptr_t)&ld_copy_table_pe5);
        default: return ((uintptr_t)&ld_copy_table_pe0);
    }
}


/**
 * @brief Returns the address of the clear table.
 *
 * @return The address of the clear table as an `uintptr_t`.
 */
uintptr_t startup_get_clear_table_address(void)
{
    switch (bsp_board_processor_element_identifier_Get())
    {
        case 0U: return ((uintptr_t)&ld_clear_table_pe0);
        case 1U: return ((uintptr_t)&ld_clear_table_pe1);
        case 2U: return ((uintptr_t)&ld_clear_table_pe2);
        case 3U: return ((uintptr_t)&ld_clear_table_pe3);
        case 4U: return ((uintptr_t)&ld_clear_table_pe4);
        case 5U: return ((uintptr_t)&ld_clear_table_pe5);
        default: return ((uintptr_t)&ld_clear_table_pe0);
    }
}


/**
 * @brief Returns the address of the stack bottom, the deepest address in the stack.
 *
 * @return The address of the stack bottom as an `uintptr_t`.
 */
uintptr_t startup_get_stack_bottom_address(void)
{
    switch (bsp_board_processor_element_identifier_Get())
    {
        case 0U: return ((uintptr_t)&ld_stack_bottom_pe0);
        case 1U: return ((uintptr_t)&ld_stack_bottom_pe1);
        case 2U: return ((uintptr_t)&ld_stack_bottom_pe2);
        case 3U: return ((uintptr_t)&ld_stack_bottom_pe3);
        case 4U: return ((uintptr_t)&ld_stack_bottom_pe4);
        case 5U: return ((uintptr_t)&ld_stack_bottom_pe5);
        default: return ((uintptr_t)&ld_stack_bottom_pe0);
    }
}


/**
 * @brief Returns the address of the interrupt vector table.
 *
 * @return The address of the interrupt vector table as an `uintptr_t`.
 */
uintptr_t startup_get_interrupt_vector_table_address(void)
{
    switch (bsp_board_processor_element_identifier_Get())
    {
        case 0U: return ((uintptr_t)&ld_interrupt_vector_table_start_pe0);
        case 1U: return ((uintptr_t)&ld_interrupt_vector_table_start_pe1);
        case 2U: return ((uintptr_t)&ld_interrupt_vector_table_start_pe2);
        case 3U: return ((uintptr_t)&ld_interrupt_vector_table_start_pe3);
        case 4U: return ((uintptr_t)&ld_interrupt_vector_table_start_pe4);
        case 5U: return ((uintptr_t)&ld_interrupt_vector_table_start_pe5);
        default: return ((uintptr_t)&ld_interrupt_vector_table_start_pe0);
    }
}


/**
 * @brief Returns the current value of the stack pointer.
 *
 * @return The current value of the stack pointer as an `uintptr_t`.
 */
uintptr_t startup_get_stack_pointer(void)
{
    uintptr_t sp;

    __asm__ volatile (
        "mov r3, %0"
        : "=r" (sp)
        :
        :
    );

    return sp;
}


/**
 * @brief Sets the vector table address in a system register.
 *
 */
void startup_set_vector_table_address(void)
{
    uintptr_t interrupt_vector_table =
        startup_get_interrupt_vector_table_address();

    __asm__ volatile (
        "ldsr %0, 4, 1\n\t"
        :
        : "r" (interrupt_vector_table)
        : "memory"
    );
}

/******************************************************************************/
/******** END - PROJECT SPECIFIC IMPLEMENTATION *******************************/
/******************************************************************************/

/******************************************************************************/

/** Places the function into the .startupcode linker section. */
#define STARTUP_PLACE_IN_STARTUPCODE_SECTION        __attribute__((__section__(".startupcode.startup_init_memory_sections")))

/** Value that marks the end of a clear table, copy table, or fill table. */
#define TABLE_ROW_END_MARKER                        ((uintptr_t *)-1)

/** Number of elements in a table row. */
#define TABLE_ROW_ELEM_COUNT(table)                 (uintptr_t)((table)->size / sizeof(uintptr_t))

/******************************************************************************/

/** Fill table row. */
typedef struct
{
    /** Start address to fill from. VMA. */
    volatile uintptr_t * start;
    /** End address to fill until (not including). VMA. */
    volatile const uintptr_t * end;
    /** Pattern. */
    volatile uintptr_t pattern;

} fill_table_row_t;

/** Copy table row. */
typedef struct
{
    /** Source address to copy from. LMA. */
    volatile const uintptr_t * const source;
    /** Destination address to copy to. VMA. */
    volatile uintptr_t * const destination;
    /** Number of bytes to copy. */
    volatile uintptr_t size;

} copy_table_row_t;

/** Clear table row. */
typedef struct
{
    /** Destination address to clear. VMA. */
    volatile uintptr_t * const destination;
    /** Number of bytes to clear. */
    volatile uintptr_t size;

} clear_table_row_t;

/******************************************************************************/

/**
 * @brief Initialize memory sections.
 *
 * @details This function must be invoked from startup code at the earliest opportunity, immediately after the initial stack pointer is set.
 * @note Calling this function before the stack is valid results in undefined behavior.
 * @note The `_ld_initial_stack_pointer` linker symbol is provided for the startup code to set the initial stack pointer.
 */
void startup_init_memory_sections(void) STARTUP_PLACE_IN_STARTUPCODE_SECTION;

void startup_init_memory_sections(void)
{
    /*
     * General information:
     * To prevent the toolchain from inserting a built-in memset or memcpy function, the following things are done:
     * 1) Pointers are read and written with volatile access.
     */

    /*
     * Fill memory sections.
     * Initialize VMA (virtual memory address, usually volatile memory) to defined pattern.
     */
    {
        /* Get pointer to the fill table. */
        volatile const fill_table_row_t * fill_table = (volatile const fill_table_row_t *)(uintptr_t)startup_get_fill_table_address();

        /* Loop through the fill table. */
        while (TABLE_ROW_END_MARKER != fill_table->start)
        {
            /* Current fill table row. */
            volatile       uintptr_t * sta = fill_table->start;
            volatile const uintptr_t * end = fill_table->end;
            volatile       uintptr_t   pat = fill_table->pattern;

            /* If the stack is about to be filled, ... */
            if ((volatile uintptr_t *)(uintptr_t)startup_get_stack_bottom_address() == sta)
            {
                /* ... make sure to only fill the stack until (not including) the current stack pointer. */
                end = (volatile const uintptr_t *)(uintptr_t)startup_get_stack_pointer();
            }

            /* Fill word by word. */
            while (sta != end)
            {
                *sta++ = pat;
            }

            /* Jump to the next row of the fill table. */
            ++fill_table;
        }
    }

    /*
     * Copy memory sections.
     * Copy from LMA (load memory address, usually non-volatile memory) to VMA (virtual memory address, usually volatile memory).
     */
    {
        /* Get pointer to the copy table. */
        volatile const copy_table_row_t * copy_table = (volatile const copy_table_row_t *)(uintptr_t)startup_get_copy_table_address();

        /* Loop through the copy table. */
        while ((TABLE_ROW_END_MARKER != copy_table->source) && (TABLE_ROW_END_MARKER != copy_table->destination))
        {
            /* Current copy table row. */
            volatile const uintptr_t * const src = copy_table->source;
            volatile       uintptr_t * const dst = copy_table->destination;
            volatile       uintptr_t         cnt = TABLE_ROW_ELEM_COUNT(copy_table);

            /* If LMA and VMA is equal, no need to copy. */
            if (src != dst)
            {
                volatile uintptr_t i;

                /* Copy word by word. */
                for (i = 0U; i < cnt; ++i)
                {
                    dst[i] = src[i];
                }
            }

            /* Jump to the next row of the copy table. */
            ++copy_table;
        }
    }

    /*
     * Clear memory sections.
     * Initialize VMA (virtual memory address, usually volatile memory) to zero.
     */
    {
        /* Get pointer to the clear table. */
        volatile const clear_table_row_t * clear_table = (volatile const clear_table_row_t *)(uintptr_t)startup_get_clear_table_address();

        /* Loop through the clear table. */
        while (TABLE_ROW_END_MARKER != clear_table->destination)
        {
            volatile uintptr_t i;

            /* Current clear table row. */
            volatile uintptr_t * const dst = clear_table->destination;
            volatile uintptr_t         cnt = TABLE_ROW_ELEM_COUNT(clear_table);

            /* Clear word by word. */
            for (i = 0U; i < cnt; ++i)
            {
                dst[i] = 0U;
            }

            /* Jump to the next row of the clear table. */
            ++clear_table;
        }
    }

    /* Set vector table address. */
    startup_set_vector_table_address();

} /* startup_init_memory_sections */
