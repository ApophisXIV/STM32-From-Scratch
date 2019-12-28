#include "usart.h"

usart_t *usart1 = (usart_t *)(UART1_BASE);
usart_t *usart2 = (usart_t *)(UART2_BASE);
usart_t *usart3 = (usart_t *)(UART3_BASE);

usart_t *get_usart(uint8_t usart) {
    switch(usart) {
        case USART1: return usart1;
        case USART2: return usart2;
        case USART3: return usart3;
        default: return usart1;
    }
}

void init_serial(uint8_t usart, uint32_t baud) {
    usart_t *serial = get_usart(usart);
    serial->cr1 = (RE|TE|PCE|W_LEN_9|UE); // enable Tx/Tx, parity, word length 9, usart
    serial->cr2 = 0;
    serial->cr3 = 0;
    serial->gtpr = 0;
    serial->baud = HSI_MHZ / baud;
}

bool serial_wr_c(uint8_t usart, char c) {
    usart_t *serial = get_usart(usart);
    while(!(serial->sr & TXE));
    serial->data = c;
    return 1;
}

bool serial_wr_s(uint8_t usart, char *s, bool new_line) {
    while(*s) serial_wr_c(usart, *s++);
    if (!new_line) return 1;
    serial_wr_c(usart, '\r');
    serial_wr_c(usart, '\n');
    return 1;
}

char serial_r_c(uint8_t usart) {
    usart_t *serial = get_usart(usart);
    while(!(serial->sr) & RXNE);
    return serial->data & DATA_MASK;
}

char *serial_r_s(uint8_t usart, char *buffer) {
    while(*buffer) {
        *buffer++ = serial_r_c(usart);
    }
    return buffer;
}
