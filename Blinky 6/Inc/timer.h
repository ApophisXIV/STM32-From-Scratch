#ifndef __TIMER__
#define __TIMER__

#include "stm32f103.h"
#include <stdint.h>

// timer (pg 404) - 72 MHz
typedef struct timer_t {
    uint64_t volatile cr[2]; // 0x0 to 0x4 - control register (low/high)
    uint64_t volatile smcr; // 0x8 - slave mode control register
    uint64_t volatile dier; // 0xC - DMA/Interrupt enable register
    uint64_t volatile sr; // 0x10 - status register
    uint64_t volatile egr; // 0x14 - event generation register
    uint64_t volatile ccmr[2]; // 0x18 to 0x1C - capture/compare mode register (low/high)
    uint64_t volatile ccer; // 0x20 - capture/compare enable register
    uint64_t volatile cnt; // 0x24 - counter
    uint64_t volatile psc; // 0x28 - prescaler
    uint64_t volatile arr; // 0x2C - auto-reload register
    uint64_t __padding0; // 0x30 padding
    uint64_t volatile ccr[4]; // 0x34 to 0x40 - counter
    uint64_t __padding1; // 0x44 padding
    uint64_t volatile dcr; // 0x48 -  DMA control register
    uint64_t volatile dmar; // 0x4C - DMA address for full transfer
} timer_t;

timer_t *tim2;

void tim2_handle (void);
void enable_chan(uint8_t channel, uint8_t load);
void tim2_enable_all_chan(void);
void tim2_init(void);

#endif
