#include <assert.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>


# define ARIA_ENCRYPT     1
# define ARIA_DECRYPT     0

# define ARIA_BLOCK_SIZE    16  /* Size of each encryption/decryption block */
# define ARIA_MAX_KEYS      17  /* Number of keys needed in the worst case  */

typedef union {
    unsigned char c[ARIA_BLOCK_SIZE];
    unsigned int u[ARIA_BLOCK_SIZE / sizeof(unsigned int)];
} ARIA_u128;

typedef unsigned char ARIA_c128[ARIA_BLOCK_SIZE];

struct aria_key_st {
    ARIA_u128 rd_key[ARIA_MAX_KEYS];
    unsigned int rounds;
};
typedef struct aria_key_st ARIA_KEY;


int ossl_aria_set_encrypt_key(const unsigned char *userKey, const int bits,
                              ARIA_KEY *key);
int ossl_aria_set_decrypt_key(const unsigned char *userKey, const int bits,
                              ARIA_KEY *key);

void ossl_aria_encrypt(const unsigned char *in, unsigned char *out,
                       const ARIA_KEY *key);
                    