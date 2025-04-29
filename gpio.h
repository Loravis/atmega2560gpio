extern void setup_gpio_asm(char port, char modebits); 
extern void set_output_asm(char port, char statebits);
extern void unset_output_asm(char port, char statebits);
extern void delay_asm(char iter);

void setup_gpio(char port, char bit, char mode);
void set_output(char port, char bit, char state); 