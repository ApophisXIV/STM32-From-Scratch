#ifndef __USART__
#define __USART__

#include "stm32f103.h"
#include "stdbool.h"

#define USART1  1
#define USART2  2
#define USART3  3

#define RE      (1<<2)  // receiver enable
#define TE      (1<<3)  // transmitter enable
#define PCE     (1<<10) // parity control enable
#define W_LEN_9 (1<<12) // start bit, 9 data bits, stop bit
#define UE      (1<<13) // usart enable

#define DATA_MASK 0xff // mask for data bits for data register

#define TXE     (1<<7) // transmit data register is empty
#define RXNE    (1<<5) // read data register is not empty

// USART registers (pg 817) //
typedef struct {
    uint32_t __IO sr;   // 0x0 status register
    uint32_t __IO data; // 0x4 data register
    uint32_t __IO baud; // 0x8 baud rate register
    uint32_t __IO cr1;  // 0xC control register 1
    uint32_t __IO cr2;  // 0x10 control register 2
    uint32_t __IO cr3;  // 0x14 control register 3
    uint32_t __IO gtpr; // 0x18 guard time and prescaler register
} usart_t;

usart_t *get_usart(uint8_t usart);
void init_serial(uint8_t usart, uint32_t baud);
bool serial_wr_c(uint8_t usart, char c);
bool serial_wr_s(uint8_t usart, char *s, bool new_line);
char serial_r_c(uint8_t usart);
char *serial_r_s(uint8_t usart, char *buffer);

#endif
