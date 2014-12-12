#include "stm32l053xx.h"
#include "system_stm32l0xx.h"
// #include <stdio.h>

volatile uint32_t msTicks = 0;                                       /* Variable to store millisecond ticks */

void SysTick_Handler(void)
{
    msTicks++;
}

// void _init(void){}

int main(void)
{
    // SystemInit();

    // SysTick_Config(SystemCoreClock / 1000);      /* Configure SysTick to generate an interrupt every millisecond */

    // printf("0x%X\n", GPIOA->MODER);
    // printf("0x%X\n", RCC->IOPENR);
    RCC->IOPENR |= RCC_IOPENR_GPIOAEN;
    // printf("0x%X\n", RCC->IOPENR);

    GPIOA->MODER |= (GPIO_MODER_MODE5_0) ;
     // Configure PC8 and PC9 in output  mode

    GPIOA->MODER &= ~(3 << (2 * 5));
    GPIOA->MODER |= 1 << (2 * 5);
    int every_one_sec = msTicks;
    // while (1)
    // {
        if(msTicks == (1000 + every_one_sec))
        {
            GPIOA->ODR ^= 0x20;
            msTicks = every_one_sec;
        }
    // }
    // printf("0x%X\n", GPIOA->MODER);
    return 0;
}
