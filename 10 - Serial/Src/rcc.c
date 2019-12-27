#include "rcc.h"

rcc_t *rcc = (rcc_t *)(RCC_BASE);

void rcc_init(void) {
    rcc->apbe1 |= (TIM2_EN); // enable timers
    rcc->apbe2 |= (GPIOA_EN|GPIOB_EN|GPIOC_EN); // enable all GPIO pins
    rcc->apbe2 |= USART1_EN;
}
