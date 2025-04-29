// gcc -O0 -g demo.c -o demo

#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <stddef.h>
#include <string.h>
#include <stdlib.h>

//------------------------------------------------------------------------------
// Helpers translated from Jasmin inline functions
/*
 * Translated from Jasmin inline functions:
 *
 * __tostack64u8   : copy 64 bytes from memory at `inp` into stack array out[64]
 * __tostack96u8   : copy 96 bytes from memory at `inp` into stack array out[96]
 * __tostack32u8   : copy 32 bytes from memory at `inp` into stack array out[32]
 * __fromstack32u8 : copy 32 bytes from stack array in[32] into memory at `outp`
 * __fromstack134u8: copy 134 bytes from stack array in[134] into memory at `outp`
 * __fromstack64u8 : copy 64 bytes from stack array in[64] into memory at `outp`
 */
//------------------------------------------------------------------------------

static inline uint8_t* __tostack64u8(uint8_t out[64], uintptr_t inp) {
    for (size_t i = 0; i < 64; i++) {
        out[i] = *(uint8_t*)(inp + i);
    }
    return out;
}

static inline uint8_t* __tostack96u8(uint8_t out[96], uintptr_t inp) {
    for (size_t i = 0; i < 96; i++) {
        out[i] = *(uint8_t*)(inp + i);
    }
    return out;
}

static inline uint8_t* __tostack32u8(uint8_t out[32], uintptr_t inp) {
    for (size_t i = 0; i < 32; i++) {
        out[i] = *(uint8_t*)(inp + i);
    }
    return out;
}

static inline void __fromstack32u8(uintptr_t outp, const uint8_t in[32]) {
    for (size_t i = 0; i < 32; i++) {
        *(uint8_t*)(outp + i) = in[i];
    }
}

static inline void __fromstack134u8(uintptr_t outp, const uint8_t in[134]) {
    for (size_t i = 0; i < 134; i++) {
        *(uint8_t*)(outp + i) = in[i];
    }
}

static inline void __fromstack64u8(uintptr_t outp, const uint8_t in[64]) {
    for (size_t i = 0; i < 64; i++) {
        *(uint8_t*)(outp + i) = in[i];
    }
}

//------------------------------------------------------------------------------
// Utility: hexdump a memory region
//------------------------------------------------------------------------------

static void hexdump(const void *addr, size_t len) {
    const uint8_t *p = (const uint8_t*)addr;
    for (size_t i = 0; i < len; i++) {
        if ((i & 0x0F) == 0) {
            printf("\n%p: ", p + i);
        }
        printf("%02x ", p[i]);
    }
    printf("\n");
}

//------------------------------------------------------------------------------
// Read the stack pointer (x86-64 only)
//------------------------------------------------------------------------------

static uintptr_t get_sp(void) {
    uintptr_t sp;
    __asm__ volatile("mov %%rsp, %0" : "=r"(sp));
    return sp;
}

//------------------------------------------------------------------------------
// Demo each helper with concrete memory and stack info
//------------------------------------------------------------------------------

void demo_tostack64(void) {
    static uint8_t global[200];
    for (int i = 0; i < 200; i++) global[i] = (uint8_t)(i + 1);

    uint8_t stackbuf[64];
    uintptr_t sp = get_sp();

    printf("=== __tostack64u8 ===\n");
    printf("SP             = %p\n", (void*)sp);
    printf("global @       = %p\n", (void*)global);
    printf("stackbuf @     = %p\n\n", (void*)stackbuf);

    // Copy 64 bytes from global+10 to stackbuf
    __tostack64u8(stackbuf, (uintptr_t)(global + 10));

    // Show sample
    printf("global[10..17] =");
    for (int i = 0; i < 8; i++) printf(" %02x", global[10 + i]);
    printf("\nstackbuf[0..7] =");
    for (int i = 0; i < 8; i++) printf(" %02x", stackbuf[i]);
    printf("\n\nHexdump around stackbuf (80 bytes):");
    hexdump(stackbuf, 80);
    printf("\n\n");
}

void demo_tostack96(void) {
    static uint8_t global[300];
    for (int i = 0; i < 300; i++) global[i] = (uint8_t)(0xFF - i);

    uint8_t stackbuf[96];
    uintptr_t sp = get_sp();

    printf("=== __tostack96u8 ===\n");
    printf("SP         = %p\n", (void*)sp);
    printf("global @   = %p\n", (void*)global);
    printf("stackbuf @ = %p\n\n", (void*)stackbuf);

    __tostack96u8(stackbuf, (uintptr_t)(global + 20));

    printf("global[20..27] =");
    for (int i = 0; i < 8; i++) printf(" %02x", global[20 + i]);
    printf("\nstackbuf[0..7] =");
    for (int i = 0; i < 8; i++) printf(" %02x", stackbuf[i]);
    printf("\n\nHexdump around stackbuf (112 bytes):");
    hexdump(stackbuf, 112);
    printf("\n\n");
}

void demo_tostack32(void) {
    static uint8_t global[128];
    for (int i = 0; i < 128; i++) global[i] = (uint8_t)(i ^ 0xA5);

    uint8_t stackbuf[32];
    uintptr_t sp = get_sp();

    printf("=== __tostack32u8 ===\n");
    printf("SP         = %p\n", (void*)sp);
    printf("global @   = %p\n", (void*)global);
    printf("stackbuf @ = %p\n\n", (void*)stackbuf);

    __tostack32u8(stackbuf, (uintptr_t)(global + 30));

    printf("global[30..37] =");
    for (int i = 0; i < 8; i++) printf(" %02x", global[30 + i]);
    printf("\nstackbuf[0..7] =");
    for (int i = 0; i < 8; i++) printf(" %02x", stackbuf[i]);
    printf("\n\nHexdump around stackbuf (64 bytes):");
    hexdump(stackbuf, 64);
    printf("\n\n");
}

void demo_fromstack32(void) {
    uint8_t stackbuf[32];
    for (int i = 0; i < 32; i++) stackbuf[i] = (uint8_t)(i + 1);

    static uint8_t dest[100];
    memset(dest, 0, sizeof(dest));
    uintptr_t sp = get_sp();

    printf("=== __fromstack32u8 ===\n");
    printf("SP         = %p\n", (void*)sp);
    printf("stackbuf @ = %p\n", (void*)stackbuf);
    printf("dest @     = %p\n\n", (void*)dest);

    __fromstack32u8((uintptr_t)(dest + 5), stackbuf);

    printf("stackbuf[0..7] =");
    for (int i = 0; i < 8; i++) printf(" %02x", stackbuf[i]);
    printf("\ndest[5..12]    =");
    for (int i = 0; i < 8; i++) printf(" %02x", dest[5 + i]);
    printf("\n\nHexdump around dest+5 (48 bytes):");
    hexdump(dest + 5, 48);
    printf("\n\n");
}

void demo_fromstack134(void) {
    uint8_t stackbuf[134];
    for (int i = 0; i < 134; i++) stackbuf[i] = (uint8_t)i;

    uint8_t *dest = malloc(200);
    memset(dest, 0, 200);
    uintptr_t sp = get_sp();

    printf("=== __fromstack134u8 ===\n");
    printf("SP         = %p\n", (void*)sp);
    printf("stackbuf @ = %p\n", (void*)stackbuf);
    printf("dest @     = %p\n\n", (void*)dest);

    __fromstack134u8((uintptr_t)(dest + 10), stackbuf);

    printf("stackbuf[0..7]  =");
    for (int i = 0; i < 8; i++) printf(" %02x", stackbuf[i]);
    printf("\ndest[10..17]    =");
    for (int i = 0; i < 8; i++) printf(" %02x", dest[10 + i]);
    printf("\n\nHexdump around dest+10 (80 bytes):");
    hexdump(dest + 10, 80);
    printf("\n\n");

    free(dest);
}

void demo_fromstack64(void) {
    uint8_t stackbuf[64];
    for (int i = 0; i < 64; i++) stackbuf[i] = (uint8_t)(~i);

    static uint8_t dest[100];
    memset(dest, 0, sizeof(dest));
    uintptr_t sp = get_sp();

    printf("=== __fromstack64u8 ===\n");
    printf("SP         = %p\n", (void*)sp);
    printf("stackbuf @ = %p\n", (void*)stackbuf);
    printf("dest @     = %p\n\n", (void*)dest);

    __fromstack64u8((uintptr_t)(dest + 20), stackbuf);

    printf("stackbuf[0..7] =");
    for (int i = 0; i < 8; i++) printf(" %02x", stackbuf[i]);
    printf("\ndest[20..27]   =");
    for (int i = 0; i < 8; i++) printf(" %02x", dest[20 + i]);
    printf("\n\nHexdump around dest+20 (80 bytes):");
    hexdump(dest + 20, 80);
    printf("\n\n");
}

int main(void) {
    demo_tostack64();
    demo_tostack96();
    demo_tostack32();
    demo_fromstack32();
    demo_fromstack134();
    demo_fromstack64();
    return 0;
}

// =======================================================================================

// #include <stdio.h>
// #include <stdint.h>
// #include <inttypes.h>
// #include <stddef.h>
// #include <string.h>
// #include <stdlib.h>

// /*
//  * Translated from Jasmin inline functions:
//  *
//  * __tostack64u8   : copy 64 bytes from memory at `inp` into stack array out[64]
//  * __tostack96u8   : copy 96 bytes from memory at `inp` into stack array out[96]
//  * __tostack32u8   : copy 32 bytes from memory at `inp` into stack array out[32]
//  * __fromstack32u8 : copy 32 bytes from stack array in[32] into memory at `outp`
//  * __fromstack134u8: copy 134 bytes from stack array in[134] into memory at `outp`
//  * __fromstack64u8 : copy 64 bytes from stack array in[64] into memory at `outp`
//  */

// static inline uint8_t* __tostack64u8(uint8_t out[64], uintptr_t inp) {
//     for (size_t i = 0; i < 64; i++) {
//         out[i] = *(uint8_t*)(inp + i);
//     }
//     return out;
// }

// static inline uint8_t* __tostack96u8(uint8_t out[96], uintptr_t inp) {
//     for (size_t i = 0; i < 96; i++) {
//         out[i] = *(uint8_t*)(inp + i);
//     }
//     return out;
// }

// static inline uint8_t* __tostack32u8(uint8_t out[32], uintptr_t inp) {
//     for (size_t i = 0; i < 32; i++) {
//         out[i] = *(uint8_t*)(inp + i);
//     }
//     return out;
// }

// static inline void __fromstack32u8(uintptr_t outp, const uint8_t in[32]) {
//     for (size_t i = 0; i < 32; i++) {
//         *(uint8_t*)(outp + i) = in[i];
//     }
// }

// static inline void __fromstack134u8(uintptr_t outp, const uint8_t in[134]) {
//     for (size_t i = 0; i < 134; i++) {
//         *(uint8_t*)(outp + i) = in[i];
//     }
// }

// static inline void __fromstack64u8(uintptr_t outp, const uint8_t in[64]) {
//     for (size_t i = 0; i < 64; i++) {
//         *(uint8_t*)(outp + i) = in[i];
//     }
// }

// //------------------------------------------------------------------------------
// // Utility: hexdump a memory region
// //------------------------------------------------------------------------------

// static void hexdump(const void *addr, size_t len) {
//     const uint8_t *p = (const uint8_t*)addr;
//     for (size_t i = 0; i < len; i++) {
//         if ((i & 0x0F) == 0) {
//             printf("\n%p: ", p + i);
//         }
//         printf("%02x ", p[i]);
//     }
//     printf("\n");
// }

// //------------------------------------------------------------------------------
// // Capture current stack pointer (x86_64 only)
// //------------------------------------------------------------------------------

// static uintptr_t get_sp(void) {
//     uintptr_t sp;
//     __asm__ volatile ("mov %%rsp, %0" : "=r"(sp));
//     return sp;
// }

// //------------------------------------------------------------------------------
// // Demonstrations
// //------------------------------------------------------------------------------

// void demo_tostack64(void) {
//     static uint8_t global64[200];
//     for (int i = 0; i < 200; i++) global64[i] = (uint8_t)(i + 1);

//     uint8_t stack64[64];
//     uintptr_t sp = get_sp();

//     printf("=== demo __tostack64u8 ===\n");
//     printf("  stack pointer    : %p\n", (void*)sp);
//     printf("  global64 buffer  : %p\n", (void*)global64);
//     printf("  stack64 buffer   : %p\n", (void*)stack64);

//     __tostack64u8(stack64, (uintptr_t)(global64 + 10));

//     printf("\n  src[10..17]  =");
//     for (int i = 0; i < 8; i++) printf(" %02x", global64[10 + i]);
//     printf("\n  stack64[0..7]=");
//     for (int i = 0; i < 8; i++) printf(" %02x", stack64[i]);
//     printf("\n\n  hexdump around stack64 (80 bytes):");
//     hexdump(stack64, 80);
//     printf("\n\n");
// }

// void demo_tostack96(void) {
//     static uint8_t global96[300];
//     for (int i = 0; i < 300; i++) global96[i] = (uint8_t)(0xFF - i);

//     uint8_t stack96[96];
//     uintptr_t sp = get_sp();

//     printf("=== demo __tostack96u8 ===\n");
//     printf("  stack pointer    : %p\n", (void*)sp);
//     printf("  global96 buffer  : %p\n", (void*)global96);
//     printf("  stack96 buffer   : %p\n", (void*)stack96);

//     __tostack96u8(stack96, (uintptr_t)(global96 + 20));

//     printf("\n  src[20..27]   =");
//     for (int i = 0; i < 8; i++) printf(" %02x", global96[20 + i]);
//     printf("\n  stack96[0..7] =");
//     for (int i = 0; i < 8; i++) printf(" %02x", stack96[i]);
//     printf("\n\n  hexdump around stack96 (112 bytes):");
//     hexdump(stack96, 112);
//     printf("\n\n");
// }

// void demo_tostack32(void) {
//     static uint8_t global32[128];
//     for (int i = 0; i < 128; i++) global32[i] = (uint8_t)(i ^ 0xA5);

//     uint8_t stack32[32];
//     uintptr_t sp = get_sp();

//     printf("=== demo __tostack32u8 ===\n");
//     printf("  stack pointer    : %p\n", (void*)sp);
//     printf("  global32 buffer  : %p\n", (void*)global32);
//     printf("  stack32 buffer   : %p\n", (void*)stack32);

//     __tostack32u8(stack32, (uintptr_t)(global32 + 30));

//     printf("\n  src[30..37]   =");
//     for (int i = 0; i < 8; i++) printf(" %02x", global32[30 + i]);
//     printf("\n  stack32[0..7] =");
//     for (int i = 0; i < 8; i++) printf(" %02x", stack32[i]);
//     printf("\n\n  hexdump around stack32 (64 bytes):");
//     hexdump(stack32, 64);
//     printf("\n\n");
// }

// void demo_fromstack32(void) {
//     uint8_t stack32[32];
//     for (int i = 0; i < 32; i++) stack32[i] = (uint8_t)(i + 1);

//     static uint8_t dest32[100];
//     memset(dest32, 0, sizeof(dest32));
//     uintptr_t sp = get_sp();

//     printf("=== demo __fromstack32u8 ===\n");
//     printf("  stack pointer    : %p\n", (void*)sp);
//     printf("  stack32 buffer   : %p\n", (void*)stack32);
//     printf("  dest32 buffer    : %p\n", (void*)dest32);

//     __fromstack32u8((uintptr_t)(dest32 + 5), stack32);

//     printf("\n  stack32[0..7] =");
//     for (int i = 0; i < 8; i++) printf(" %02x", stack32[i]);
//     printf("\n  dest32[5..12] =");
//     for (int i = 0; i < 8; i++) printf(" %02x", dest32[5 + i]);
//     printf("\n\n  hexdump around dest32+5 (48 bytes):");
//     hexdump(dest32 + 5, 48);
//     printf("\n\n");
// }

// void demo_fromstack134(void) {
//     uint8_t stack134[134];
//     for (int i = 0; i < 134; i++) stack134[i] = (uint8_t)i;

//     uint8_t *dest134 = malloc(200);
//     memset(dest134, 0, 200);
//     uintptr_t sp = get_sp();

//     printf("=== demo __fromstack134u8 ===\n");
//     printf("  stack pointer    : %p\n", (void*)sp);
//     printf("  stack134 buffer  : %p\n", (void*)stack134);
//     printf("  dest134 buffer   : %p\n", (void*)dest134);

//     __fromstack134u8((uintptr_t)(dest134 + 10), stack134);

//     printf("\n  stack134[0..7]  =");
//     for (int i = 0; i < 8; i++) printf(" %02x", stack134[i]);
//     printf("\n  dest134[10..17] =");
//     for (int i = 0; i < 8; i++) printf(" %02x", dest134[10 + i]);
//     printf("\n\n  hexdump around dest134+10 (80 bytes):");
//     hexdump(dest134 + 10, 80);
//     printf("\n\n");

//     free(dest134);
// }

// void demo_fromstack64(void) {
//     uint8_t stack64[64];
//     for (int i = 0; i < 64; i++) stack64[i] = (uint8_t)(~i);

//     static uint8_t dest64[100];
//     memset(dest64, 0, sizeof(dest64));
//     uintptr_t sp = get_sp();

//     printf("=== demo __fromstack64u8 ===\n");
//     printf("  stack pointer    : %p\n", (void*)sp);
//     printf("  stack64 buffer   : %p\n", (void*)stack64);
//     printf("  dest64 buffer    : %p\n", (void*)dest64);

//     __fromstack64u8((uintptr_t)(dest64 + 20), stack64);

//     printf("\n  stack64[0..7]   =");
//     for (int i = 0; i < 8; i++) printf(" %02x", stack64[i]);
//     printf("\n  dest64[20..27]  =");
//     for (int i = 0; i < 8; i++) printf(" %02x", dest64[20 + i]);
//     printf("\n\n  hexdump around dest64+20 (80 bytes):");
//     hexdump(dest64 + 20, 80);
//     printf("\n\n");
// }

// int main(void) {
//     demo_tostack64();
//     demo_tostack96();
//     demo_tostack32();
//     demo_fromstack32();
//     demo_fromstack134();
//     demo_fromstack64();
//     return 0;
// }