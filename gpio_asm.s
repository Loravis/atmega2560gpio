.global setup_gpio_asm
.global set_output_asm
.global unset_output_asm
.global delay_asm

setup_gpio_asm:
    in r20, 0x04
    or r20, r22
    out 0x04, r20       ; r22 contains the modebits parameter
    ret

set_output_asm:
    in r20, 0x05
    or r20, r22
    out 0x05, r20
    ret

unset_output_asm:
    in r20, 0x05
    eor r20, r22
    out 0x05, r20
    ret

delay_asm:
    mov r22, r24
    mov r20, r24
    loop_1:
        dec r24
        brbs 1, end_1

        loop_2: 
            dec r22
            brbs 1, end_2

            loop_3: 
                dec r20
                brbs 1, end_3
                rjmp loop_3

            end_3:
            rjmp loop_2

        end_2:
        rjmp loop_1

    end_1:

