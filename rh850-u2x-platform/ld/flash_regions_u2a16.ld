/******************************************************************************/
/******************************************************************************/
/******************************************************************************/

/** Required amount of stack in bytes. */
_LD_STACK_SIZE_PE0 = 16K;
_LD_STACK_SIZE_PE1 = 4K;
_LD_STACK_SIZE_PE2 = 4K;
_LD_STACK_SIZE_PE3 = 4K;
_LD_STACK_SIZE_PE4 = 4K;
_LD_STACK_SIZE_PE5 = 4K;

/** Required amount of heap in bytes. */
_LD_HEAP_SIZE_PE0  = 128K;
_LD_HEAP_SIZE_PE1  = 4K;
_LD_HEAP_SIZE_PE2  = 4K;
_LD_HEAP_SIZE_PE3  = 4K;
_LD_HEAP_SIZE_PE4  = 4K;
_LD_HEAP_SIZE_PE5  = 4K;

/** Entry point. */
ENTRY(__start);

/******************************************************************************/
/******************************************************************************/
/******************************************************************************/

/******************************************************************************/
/******************************************************************************/
/******************************************************************************/

/**
 * Load place of Exception Vector Table.
 * Usually non-volatile memory (e.g. Flash).
 * Input sections: .0.exceptionvecttbl .1.exceptionvecttbl
 */
REGION_ALIAS("REGION_LOADPLACE_0_EXCEPTION_VECT_TBL",           CODE_FLASH_USER_AREA_0_BANK_A);     /* Must be CODE_FLASH_USER_AREA_0_BANK_A in multi-core situations. */
REGION_ALIAS("REGION_LOADPLACE_1_EXCEPTION_VECT_TBL",           CODE_FLASH_USER_AREA_2_BANK_C);     /* Must be CODE_FLASH_USER_AREA_2_BANK_C in multi-core situations (only in U2A16), must be the same as the previous in single-core situations (or for targets other than U2A16). */

/**
 * Execution place of Exception Vector Table.
 * Can be non-volatile memory (e.g. Flash) or volatile memory (e.g. RAM).
 * Input sections: .0.exceptionvecttbl .1.exceptionvecttbl
 */
REGION_ALIAS("REGION_EXECPLACE_0_EXCEPTION_VECT_TBL",           CODE_FLASH_USER_AREA_0_BANK_A);     /* Must be CODE_FLASH_USER_AREA_0_BANK_A in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_1_EXCEPTION_VECT_TBL",           CODE_FLASH_USER_AREA_2_BANK_C);     /* Must be CODE_FLASH_USER_AREA_2_BANK_C in multi-core situations (only in U2A16), must be the same as the previous in single-core situations (or for targets other than U2A16). */

/******************************************************************************/

/**
 * Load place of Interrupt Vector Table.
 * Usually non-volatile memory (e.g. Flash).
 * Input sections: .pe0.interruptvecttbl .pe1.interruptvecttbl .pe2.interruptvecttbl .pe3.interruptvecttbl .pe4.interruptvecttbl .pe5.interruptvecttbl
 */
REGION_ALIAS("REGION_LOADPLACE_PE0_INTERRUPT_VECT_TBL",         CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_LOADPLACE_PE1_INTERRUPT_VECT_TBL",         CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_LOADPLACE_PE2_INTERRUPT_VECT_TBL",         CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_LOADPLACE_PE3_INTERRUPT_VECT_TBL",         CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_LOADPLACE_PE4_INTERRUPT_VECT_TBL",         CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_LOADPLACE_PE5_INTERRUPT_VECT_TBL",         CODE_FLASH_USER_AREA_0_BANK_A);

/**
 * Execution place of Interrupt Vector Table.
 * Can be non-volatile memory (e.g. Flash) or volatile memory (e.g. RAM).
 * Input sections: .pe0.interruptvecttbl .pe1.interruptvecttbl .pe2.interruptvecttbl .pe3.interruptvecttbl .pe4.interruptvecttbl .pe5.interruptvecttbl
 */
REGION_ALIAS("REGION_EXECPLACE_PE0_INTERRUPT_VECT_TBL",         CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_EXECPLACE_PE1_INTERRUPT_VECT_TBL",         CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_EXECPLACE_PE2_INTERRUPT_VECT_TBL",         CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_EXECPLACE_PE3_INTERRUPT_VECT_TBL",         CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_EXECPLACE_PE4_INTERRUPT_VECT_TBL",         CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_EXECPLACE_PE5_INTERRUPT_VECT_TBL",         CODE_FLASH_USER_AREA_0_BANK_A);

/******************************************************************************/

/**
 * Load place of startup code.
 * Usually non-volatile memory (e.g. Flash).
 * Input sections: .startupcode
 */
REGION_ALIAS("REGION_LOADPLACE_STARTUP_CODE",                   CODE_FLASH_USER_AREA_0_BANK_A);

/******************************************************************************/
/******************************************************************************/
/******************************************************************************/

/**
 * Load place of application functions that are not assigned to any custom section.
 * Usually non-volatile memory (e.g. Flash).
 * Input sections: .text
 */
REGION_ALIAS("REGION_LOADPLACE_DEFAULT_CODE",                   CODE_FLASH_USER_AREA_0_BANK_A);

/**
 * Execution place of application functions that are not assigned to any custom section.
 * Can be non-volatile memory (e.g. Flash) or volatile memory (e.g. RAM).
 * Input sections: .text
 */
REGION_ALIAS("REGION_EXECPLACE_DEFAULT_CODE",                   CODE_FLASH_USER_AREA_0_BANK_A);

/******************************************************************************/

/**
 * Load place of application functions that are explicitly assigned to section .customtext.
 * Usually non-volatile memory (e.g. Flash).
 * Input sections: .customtext
 */
REGION_ALIAS("REGION_LOADPLACE_CUSTOM_CODE",                    CODE_FLASH_USER_AREA_0_BANK_A);

/**
 * Execution place of application functions that are explicitly assigned to section .customtext.
 * Can be non-volatile memory (e.g. Flash) or volatile memory (e.g. RAM).
 * Input sections: .customtext
 */
REGION_ALIAS("REGION_EXECPLACE_CUSTOM_CODE",                    CODE_FLASH_USER_AREA_0_BANK_A);

/******************************************************************************/
/******************************************************************************/
/******************************************************************************/

/**
 * Load place of application constant variables that are not assigned to any custom section.
 * Usually non-volatile memory (e.g. Flash).
 * Input sections: .rodata .rdata
 */
REGION_ALIAS("REGION_LOADPLACE_DEFAULT_CONSTDATA",              CODE_FLASH_USER_AREA_0_BANK_A);

/**
 * Execution place of application constant variables that are not assigned to any custom section.
 * Can be non-volatile memory (e.g. Flash) or volatile memory (e.g. RAM).
 * Input sections: .rodata .rdata
 */
REGION_ALIAS("REGION_EXECPLACE_DEFAULT_CONSTDATA",              CODE_FLASH_USER_AREA_0_BANK_A);

/******************************************************************************/

/**
 * Load place of application constant variables that are explicitly assigned to section .customrodata.
 * Usually non-volatile memory (e.g. Flash).
 * Input sections: .customrodata
 */
REGION_ALIAS("REGION_LOADPLACE_CUSTOM_CONSTDATA",               CODE_FLASH_USER_AREA_0_BANK_A);

/**
 * Execution place of application constant variables that are explicitly assigned to section .customrodata.
 * Can be non-volatile memory (e.g. Flash) or volatile memory (e.g. RAM).
 * Input sections: .customrodata
 */
REGION_ALIAS("REGION_EXECPLACE_CUSTOM_CONSTDATA",               CODE_FLASH_USER_AREA_0_BANK_A);

/******************************************************************************/
/******************************************************************************/
/******************************************************************************/

/**
 * Execution place of application uninitialized variables that are explicitly assigned to section .preserve.
 * The variables in this region keep their values across device soft-resets.
 * The startup code ignores these variables.
 * Must be volatile memory (e.g. RAM).
 * Input sections: .preserve
 */
REGION_ALIAS("REGION_EXECPLACE_PRESERVEDATA",                   CLUSTER_RAM_CLUSTER0);

/******************************************************************************/
/******************************************************************************/
/******************************************************************************/

/**
 * Load place of application initialized variables that are not assigned to any custom section.
 * Usually non-volatile memory (e.g. Flash).
 * Input sections: .data .pe0.data .pe1.data .pe2.data .pe3.data .pe4.data .pe5.data
 */
REGION_ALIAS("REGION_LOADPLACE_DEFAULT_INITDATA",               CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_LOADPLACE_PE0_INITDATA",                   CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_LOADPLACE_PE1_INITDATA",                   CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_LOADPLACE_PE2_INITDATA",                   CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_LOADPLACE_PE3_INITDATA",                   CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_LOADPLACE_PE4_INITDATA",                   CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_LOADPLACE_PE5_INITDATA",                   CODE_FLASH_USER_AREA_0_BANK_A);
REGION_ALIAS("REGION_LOADPLACE_SHARED_INITDATA",                CODE_FLASH_USER_AREA_0_BANK_A);

/**
 * Execution place of application initialized variables that are not assigned to any custom section.
 * Must be volatile memory (e.g. RAM).
 * Input sections: .data .pe0.data .pe1.data .pe2.data .pe3.data .pe4.data .pe5.data
 */
REGION_ALIAS("REGION_EXECPLACE_DEFAULT_INITDATA",               LOCAL_RAM_SELF);            /* Must       be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE0_INITDATA",                   CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE1_INITDATA",                   CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE2_INITDATA",                   CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE3_INITDATA",                   CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE4_INITDATA",                   CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE5_INITDATA",                   CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_SHARED_INITDATA",                CLUSTER_RAM_CLUSTER0);      /* Must   not be LOCAL_RAM_SELF in multi-core situations. */

/******************************************************************************/
/******************************************************************************/
/******************************************************************************/

/**
 * Execution place of application uninitialized variables that are not assigned to any custom section.
 * Must be volatile memory (e.g. RAM).
 * Input sections: .bss .pe0.bss .pe1.bss .pe2.bss .pe3.bss .pe4.bss .pe5.bss .shared.bss
 */
REGION_ALIAS("REGION_EXECPLACE_DEFAULT_UNINITDATA",             LOCAL_RAM_SELF);            /* Must       be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE0_UNINITDATA",                 CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE1_UNINITDATA",                 CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE2_UNINITDATA",                 CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE3_UNINITDATA",                 CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE4_UNINITDATA",                 CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE5_UNINITDATA",                 CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_SHARED_UNINITDATA",              CLUSTER_RAM_CLUSTER0);      /* Must   not be LOCAL_RAM_SELF in multi-core situations. */

/******************************************************************************/
/******************************************************************************/
/******************************************************************************/

/**
 * Execution place of stack variables.
 * Must be volatile memory (e.g. RAM).
 * Input sections: .stack.pe0 .stack.pe1 .stack.pe2 .stack.pe3 .stack.pe4 .stack.pe5
 */
REGION_ALIAS("REGION_EXECPLACE_PE0_STACK",                     CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE1_STACK",                     CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE2_STACK",                     CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE3_STACK",                     CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE4_STACK",                     CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE5_STACK",                     CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */

/******************************************************************************/

/**
 * Execution place of heap variables.
 * Must be volatile memory (e.g. RAM).
 * Input sections: .heap.pe0 .heap.pe1 .heap.pe2 .heap.pe3 .heap.pe4 .heap.pe5
 */
REGION_ALIAS("REGION_EXECPLACE_PE0_HEAP",                      CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE1_HEAP",                      CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE2_HEAP",                      CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE3_HEAP",                      CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE4_HEAP",                      CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */
REGION_ALIAS("REGION_EXECPLACE_PE5_HEAP",                      CLUSTER_RAM_CLUSTER0);      /* Should not be LOCAL_RAM_SELF in multi-core situations. */

/******************************************************************************/
/******************************************************************************/
/******************************************************************************/
