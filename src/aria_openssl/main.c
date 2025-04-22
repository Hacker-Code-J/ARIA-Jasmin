/**
 * Buiding and Linking:
 * gcc -o aria_example main.c openssl_aria.c -I.
 * 
 * Building and Linking with Assembly:
 * gcc -g -c jasmin_aria.s -o jasmin_aria.o
 * gcc -o aria_example main.c openssl_aria.c jasmin_aria.o -I.
 * 
 */

#include "openssl_aria.h"

extern unsigned int jyh_aria_set_encrypt_key(const unsigned char *userKey, const int bits,
                               ARIA_KEY *key);

int main() {
    /* key : 00 11 22 33 44 55 66 77 88 99 aa bb cc dd ee ff */
    unsigned char key[16] = {0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
                              0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff};
    /* plaintext : 11 11 11 11 aa aa aa aa 11 11 11 11 bb bb bb bb */
   unsigned char plaintext[16] = {0x11, 0x11, 0x11, 0x11, 0xaa, 0xaa, 0xaa, 0xaa,
                                    0x11, 0x11, 0x11, 0x11, 0xbb, 0xbb, 0xbb, 0xbb};
    unsigned char ciphertext[16] = { 0x00, };
    ARIA_KEY aria_key;
    memset(&aria_key, 0, sizeof(ARIA_KEY)); // Initialize the key structure
    printf("Default aria_key:\n");
    for (int i = 0; i < 16; i++) {
        printf("%02x ", aria_key.rd_key[i].c[0]);
    }
    printf("\n");
    // Setting the encryption key
    int bits = 128;
    int ret;
    ret = jyh_aria_set_encrypt_key(key, bits, &aria_key);
    if (ret != 0) {
        printf("Error setting encryption key\n");
        return ret;
    }
    printf("[  Ji-YH] ");
    for (int i = 0; i < 16; i++) {
        printf("%02x ", aria_key.rd_key[i].c[0]);
    } puts("");

    memset(aria_key.rd_key, 0, sizeof(aria_key.rd_key)); // Clear the key structure
    ret = ossl_aria_set_encrypt_key(key, bits, &aria_key);
    if (ret != 0) {
        printf("Error setting encryption key\n");
        return ret;
    }
    printf("[OpenSSL] ");
    for (int i = 0; i < 16; i++) {
        printf("%02x ", aria_key.rd_key[i].c[0]);
    }
    printf("\n");
    
    printf("Plaintext: ");
    for (int i = 0; i < 16; i++) {
        printf("%02x ", plaintext[i]);
    }
    printf("\n");

    ossl_aria_encrypt(plaintext, ciphertext, &aria_key);
    printf("Ciphertext: ");
    for (int i = 0; i < 16; i++) {
        printf("%02x ", ciphertext[i]);
    }
    printf("\n");
    // Decrypting the ciphertext
    unsigned char decrypted[16];
    ret = ossl_aria_set_decrypt_key(key, bits, &aria_key);
    if (ret != 0) {
        printf("Error setting decryption key\n");
        return ret;
    }
    ossl_aria_encrypt(ciphertext, decrypted, &aria_key);
    printf("Decrypted: ");
    for (int i = 0; i < 16; i++) {
        printf("%02x ", decrypted[i]);
    }
    printf("\n");
    // Check if decrypted text matches original plaintext
    if (memcmp(plaintext, decrypted, 16) == 0) {
        printf("Decryption successful!\n");
    } else {
        printf("Decryption failed!\n");
    }
    // Free any allocated resources if necessary
    // In this case, no dynamic memory allocation is used, so nothing to free.
    // Note: In a real-world scenario, you should also handle errors and edge cases.
    // For example, check if the key length is valid, handle memory allocation failures, etc.
    // Also, ensure to use secure memory handling practices to avoid memory leaks or vulnerabilities.
    // This is a simple demonstration and should not be used in production code without proper error handling.

    return 0;
}