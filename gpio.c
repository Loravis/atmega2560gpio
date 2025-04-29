#include "gpio.h"

void setup_gpio(char port, char bit, char mode) {
  setup_gpio_asm(port, 0 | (mode << bit));
}

void set_output(char port, char bit, char state) {
  if (state == 1) {
    set_output_asm(port, 0 | (state << bit));
  } else {
    state = 1;
    unset_output_asm(port, 0 | (state << bit));
  } 
}