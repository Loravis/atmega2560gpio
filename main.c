#include "gpio.h"

int main(void) {
  setup_gpio(0, 7, 1);
   
  while (1) {
    set_output(0, 7, 1); 
    delay_asm(84);
    set_output(0,7, 0);
    delay_asm(84);
  }
}