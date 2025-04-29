NAME = gpio
MMCU = atmega2560
BAUDRATE = 115200

$(NAME).hex: gpio_asm.o gpio.o main.o
	avr-gcc -Os -mmcu=$(MMCU) $^ -o $(NAME).elf
	avr-objcopy -O ihex $(NAME).elf $@

gpio_asm.o: gpio_asm.s
	avr-gcc -mmcu=$(MMCU) -c $< -o $@

gpio.o: gpio.c
	avr-gcc -mmcu=$(MMCU) -c $< -o $@

main.o: main.c
	avr-gcc -Os -mmcu=$(MMCU) -c $< -o $@

upload: $(NAME).hex
	avrdude -v -p atmega2560 -c wiring -P /dev/ttyACM0 -b $(BAUDRATE) -D -U flash:w:$<:i
dump: $(NAME).hex
	avr-objdump -s -m $(MMCU) $<
clean:
	rm *.o 
	rm *.elf
	rm *.hex
