#ifndef __DELAY__
#define __DELAY__

#include "intrinsic.h"

void delay(uint64_t __IO t);
void systick_delay(uint64_t __IO t);

#endif
