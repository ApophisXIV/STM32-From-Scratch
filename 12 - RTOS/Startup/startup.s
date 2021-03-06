/* Assembler startup file, adapted from code generated by STM32CubeMX */

.syntax unified
.cpu cortex-m3 // The Cortex M3 is a thumb only processor
.fpu softvfp
.thumb

.global g_pfnVectors
.global Default_Handler

.word _sidata   // start addr for initialization values of the .DATA section
.word _sdata    // start addr for .DATA section
.word _edata    // end addr for .DATA section
.word _sbss     // start address for .bss section
.word _ebss     // end address for .bss section

/* Reset_handler */
    .section .text.Reset_Handler
    .weak Reset_Handler
    .type Reset_Handler, %function
Reset_Handler:
 // Copy the DATA segment initializers from flash to SRAM //
    movs r1, #0
    b LoopCopyDataInit

CopyDataInit:
    ldr r3, =_sidata
    ldr r3, [r3, r1]
    str r3, [r0, r1]
    adds r1, r1, #4

LoopCopyDataInit:
    ldr r0, =_sdata
    ldr r3, =_edata
    adds r2, r0, r1
    cmp r2, r3
    bcc CopyDataInit
    ldr r2, =_sbss
    b LoopFillZerobss

// Fill the bss segment with zeros //
FillZerobss:
    movs r3, #0
    str r3, [r2], #4
LoopFillZerobss:
    ldr r3, = _ebss
    cmp r2, r3
    bcc FillZerobss

// Call the application's entry point //
    bl main
    bx lr
.size Reset_Handler, .-Reset_Handler

/* Default_Handler */
    .section .text.Default_Handler,"ax",%progbits
Default_Handler:

Infinite_Loop:
    b Infinite_Loop
    .size Default_Handler, .-Default_Handler

.section .isr_vector,"a",%progbits
    .type g_pfnVectors, %object
    .size g_pfnVectors, .-g_pfnVectors

/* Vector Table (pg 198) */
g_pfnVectors:
.word   _estack                 // * Stack top address
.word   Reset_Handler           // - Reset
.word   NMI_Handler             // - Non Maskable Interrupt
.word   HardFault_Handler       // - HardFault
.word   MemManage_Handler       // - MemManage Fault
.word   BusFault_Handler        // - BusFault
.word   UsageFault_Handler      // - UsageFault
.word   0                       // - RESERVED
.word   0                       // - RESERVED
.word   0                       // - RESERVED
.word   0                       // - RESERVED
.word   SVC_Handler             // - SV call
.word   DebugMon_Handler        // - Debug Monitor
.word   0                       // - RESERVED
.word   PendSV_Handler          // - PendSV
.word   SysTick_Handler         // - SysTick
.word   WWDG_IRQHandler         // 0 WWDG
.word   PVD_IRQHandler          // 1 PVD
.word   TAMPER_IRQHandler       // 2 TAMPER
.word   RTC_IRQHandler          // 3 RTC
.word   FLASH_IRQHandler        // 4 FLASH
.word   RCC_IRQHandler          // 5 RCC
.word   EXTI0_IRQHandler        // 6 EXTI0
.word   EXTI1_IRQHandler        // 7 EXTI1
.word   EXTI2_IRQHandler        // 8 EXTI2
.word   EXTI3_IRQHandler        // 9 EXTI3
.word   EXTI4_IRQHandler        // 10 EXTI4
.word   DMA1_Chan1_IRQHandler   // 11 DMA1_Channel1
.word   DMA1_Chan2_IRQHandler   // 12 DMA1_Channel2
.word   DMA1_Chan3_IRQHandler   // 13 DMA1_Channel3
.word   DMA1_Chan4_IRQHandler   // 14 DMA1_Channel4
.word   DMA1_Chan5_IRQHandler   // 15 DMA1_Channel5
.word   DMA1_Chan6_IRQHandler   // 16 DMA1_Channel6
.word   DMA1_Chan7_IRQHandler   // 17 DMA1_Channel7
.word   ADC1_2_IRQHandler       // 18 ADC1_2
.word   CAN1_TX_IRQHandler      // 19 CAN1_TX
.word   CAN1_RX0_IRQHandler     // 20 CAN1_RX0
.word   CAN1_RX1_IRQHandler     // 21 CAN1_RX1
.word   CAN1_SCE_IRQHandler     // 22 CAN1_SCE
.word   EXTI9_5_IRQHandler      // 23 EXTI9_5
.word   TIM1_BRK_IRQHandler     // 24 TIM1_BRK
.word   TIM1_UP_IRQHandler      // 25 TIM1_UP
.word   TIM1_TRG_COM_IRQHandler // 26 TIM1_TRG_COM
.word   TIM1_CC_IRQHandler      // 27 TIM1_CC
.word   TIM2_IRQHandler         // 28 TIM2
.word   TIM3_IRQHandler         // 29 TIM3
.word   TIM4_IRQHandler         // 30 TIM4
.word   I2C1_EV_IRQHandler      // 31 I2C1_EV
.word   I2C1_ER_IRQHandler      // 32 I2C1_ER
.word   I2C2_EV_IRQHandler      // 33 I2C2_EV
.word   I2C2_ER_IRQHandler      // 34 I2C2_ER
.word   SPI1_IRQHandler         // 35 SPI1
.word   SPI2_IRQHandler         // 36 SPI2
.word   USART1_IRQHandler       // 37 USART1
.word   USART2_IRQHandler       // 38 USART2
.word   USART3_IRQHandler       // 39 USART3
.word   EXTI15_10_IRQHandler    // 40 EXTI15_10
.word   RTCAlarm_IRQHandler     // 41 RTCAlarm
.word   OTG_FS_WKUP_IRQHandler  // 42 OTG_FS_WKUP
.word   0                       // 43 RESERVED
.word   0                       // 44 RESERVED
.word   0                       // 45 RESERVED
.word   0                       // 46 RESERVED
.word   0                       // 47 RESERVED
.word   0                       // 48 RESERVED
.word   0                       // 49 RESERVED
.word   TIM5_IRQHandler         // 50 TIM5
.word   SPI3_IRQHandler         // 51 SPI3
.word   UART4_IRQHandler        // 52 UART4
.word   UART5_IRQHandler        // 53 UART5
.word   TIM6_IRQHandler         // 54 TIM6
.word   TIM7_IRQHandler         // 55 TIM7
.word   DMA2_Chan1_IRQHandler   // 56 DMA2_Channel1
.word   DMA2_Chan2_IRQHandler   // 57 DMA2_Channel2
.word   DMA2_Chan3_IRQHandler   // 58 DMA2_Channel3
.word   DMA2_Chan4_IRQHandler   // 59 DMA2_Channel4
.word   DMA2_Chan5_IRQHandler   // 60 DMA2_Channel5
.word   ETH_IRQHandler          // 61 ETH
.word   ETH_WKUP_IRQHandler     // 62 ETH_WKUP
.word   CAN2_TX_IRQHandler      // 63 CAN2_TX
.word   CAN2_RX0_IRQHandler     // 64 CAN2_RX0
.word   CAN2_RX1_IRQHandler     // 65 CAN2_RX1
.word   CAN2_SCE_IRQHandler     // 66 CAN2_SCE
.word   OTG_FS_IRQHandler       // 67 OTG_FS

.weak NMI_Handler
    .thumb_set NMI_Handler,Default_Handler

.weak HardFault_Handler
  .thumb_set HardFault_Handler,Default_Handler

.weak MemManage_Handler
  .thumb_set MemManage_Handler,Default_Handler

.weak BusFault_Handler
  .thumb_set BusFault_Handler,Default_Handler

.weak UsageFault_Handler
  .thumb_set UsageFault_Handler,Default_Handler

.weak SVC_Handler
  .thumb_set SVC_Handler,Default_Handler

.weak DebugMon_Handler
  .thumb_set DebugMon_Handler,Default_Handler

.weak PendSV_Handler
  .thumb_set PendSV_Handler,Default_Handler

.weak SysTick_Handler
  .thumb_set SysTick_Handler,Default_Handler

.weak WWDG_IRQHandler
  .thumb_set WWDG_IRQHandler,Default_Handler

.weak PVD_IRQHandler
  .thumb_set PVD_IRQHandler,Default_Handler

.weak TAMPER_IRQHandler
  .thumb_set TAMPER_IRQHandler,Default_Handler

.weak RTC_IRQHandler
  .thumb_set RTC_IRQHandler,Default_Handler

.weak FLASH_IRQHandler
  .thumb_set FLASH_IRQHandler,Default_Handler

.weak RCC_IRQHandler
  .thumb_set RCC_IRQHandler,Default_Handler

.weak EXTI0_IRQHandler
  .thumb_set EXTI0_IRQHandler,Default_Handler

.weak EXTI1_IRQHandler
  .thumb_set EXTI1_IRQHandler,Default_Handler

.weak EXTI2_IRQHandler
  .thumb_set EXTI2_IRQHandler,Default_Handler

.weak EXTI3_IRQHandler
  .thumb_set EXTI3_IRQHandler,Default_Handler

.weak EXTI4_IRQHandler
  .thumb_set EXTI4_IRQHandler,Default_Handler

.weak DMA1_Chan1_IRQHandler
  .thumb_set DMA1_Chan1_IRQHandler,Default_Handler

.weak DMA1_Chan2_IRQHandler
  .thumb_set DMA1_Chan2_IRQHandler,Default_Handler

.weak DMA1_Chan3_IRQHandler
  .thumb_set DMA1_Chan3_IRQHandler,Default_Handler

.weak DMA1_Chan4_IRQHandler
  .thumb_set DMA1_Chan4_IRQHandler,Default_Handler

.weak DMA1_Chan5_IRQHandler
  .thumb_set DMA1_Chan5_IRQHandler,Default_Handler

.weak DMA1_Chan6_IRQHandler
  .thumb_set DMA1_Chan6_IRQHandler,Default_Handler

.weak DMA1_Chan7_IRQHandler
  .thumb_set DMA1_Chan7_IRQHandler,Default_Handler

.weak ADC1_2_IRQHandler
  .thumb_set ADC1_2_IRQHandler,Default_Handler

.weak CAN1_TX_IRQHandler
  .thumb_set CAN1_TX_IRQHandler,Default_Handler

.weak CAN1_RX0_IRQHandler
  .thumb_set CAN1_RX0_IRQHandler,Default_Handler

.weak CAN1_RX1_IRQHandler
  .thumb_set CAN1_RX1_IRQHandler,Default_Handler

.weak CAN1_SCE_IRQHandler
  .thumb_set CAN1_SCE_IRQHandler,Default_Handler

.weak EXTI9_5_IRQHandler
  .thumb_set EXTI9_5_IRQHandler,Default_Handler

.weak TIM1_BRK_IRQHandler
  .thumb_set TIM1_BRK_IRQHandler,Default_Handler

.weak TIM1_UP_IRQHandler
  .thumb_set TIM1_UP_IRQHandler,Default_Handler

.weak TIM1_TRG_COM_IRQHandler
  .thumb_set TIM1_TRG_COM_IRQHandler,Default_Handler

.weak TIM1_CC_IRQHandler
  .thumb_set TIM1_CC_IRQHandler,Default_Handler

.weak TIM2_IRQHandler
  .thumb_set TIM2_IRQHandler,Default_Handler

.weak TIM3_IRQHandler
  .thumb_set TIM3_IRQHandler,Default_Handler

.weak TIM4_IRQHandler
  .thumb_set TIM4_IRQHandler,Default_Handler

.weak I2C1_EV_IRQHandler
  .thumb_set I2C1_EV_IRQHandler,Default_Handler

.weak I2C1_ER_IRQHandler
  .thumb_set I2C1_ER_IRQHandler,Default_Handler

.weak I2C2_EV_IRQHandler
  .thumb_set I2C2_EV_IRQHandler,Default_Handler

.weak I2C2_ER_IRQHandler
  .thumb_set I2C2_ER_IRQHandler,Default_Handler

.weak SPI1_IRQHandler
  .thumb_set SPI1_IRQHandler,Default_Handler

.weak SPI2_IRQHandler
  .thumb_set SPI2_IRQHandler,Default_Handler

.weak USART1_IRQHandler
  .thumb_set USART1_IRQHandler,Default_Handler

.weak USART2_IRQHandler
  .thumb_set USART2_IRQHandler,Default_Handler

.weak USART3_IRQHandler
  .thumb_set USART3_IRQHandler,Default_Handler

.weak EXTI15_10_IRQHandler
  .thumb_set EXTI15_10_IRQHandler,Default_Handler

.weak RTCAlarm_IRQHandler
  .thumb_set RTCAlarm_IRQHandler,Default_Handler

.weak OTG_FS_WKUP_IRQHandler
  .thumb_set OTG_FS_WKUP_IRQHandler,Default_Handler

.weak TIM5_IRQHandler
  .thumb_set TIM5_IRQHandler,Default_Handler

.weak SPI3_IRQHandler
  .thumb_set SPI3_IRQHandler,Default_Handler

.weak UART4_IRQHandler
  .thumb_set UART4_IRQHandler,Default_Handler

.weak UART5_IRQHandler
  .thumb_set UART5_IRQHandler,Default_Handler

.weak TIM6_IRQHandler
  .thumb_set TIM6_IRQHandler,Default_Handler

.weak TIM7_IRQHandler
  .thumb_set TIM7_IRQHandler,Default_Handler

.weak DMA2_Chan1_IRQHandler
  .thumb_set DMA2_Chan1_IRQHandler,Default_Handler

.weak DMA2_Chan2_IRQHandler
  .thumb_set DMA2_Chan2_IRQHandler,Default_Handler

.weak DMA2_Chan3_IRQHandler
  .thumb_set DMA2_Chan3_IRQHandler,Default_Handler

.weak DMA2_Chan4_IRQHandler
  .thumb_set DMA2_Chan4_IRQHandler,Default_Handler

.weak DMA2_Chan5_IRQHandler
  .thumb_set DMA2_Chan5_IRQHandler,Default_Handler

.weak ETH_IRQHandler
  .thumb_set ETH_IRQHandler,Default_Handler

.weak ETH_WKUP_IRQHandler
  .thumb_set ETH_WKUP_IRQHandler,Default_Handler

.weak CAN2_TX_IRQHandler
  .thumb_set CAN2_TX_IRQHandler,Default_Handler

.weak CAN2_RX0_IRQHandler
  .thumb_set CAN2_RX0_IRQHandler,Default_Handler

.weak CAN2_RX1_IRQHandler
  .thumb_set CAN2_RX1_IRQHandler,Default_Handler

.weak CAN2_SCE_IRQHandler
  .thumb_set CAN2_SCE_IRQHandler,Default_Handler

.weak OTG_FS_IRQHandler
  .thumb_set OTG_FS_IRQHandler,Default_Handler

/* THE END */
