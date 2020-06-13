blink: blink.c
	/home/artfulbytes/ti/ccs910/ccs/tools/compiler/msp430-gcc-8.2.0.52_linux64/bin/msp430-elf-gcc \
	-mmcu=msp430g2553 \
	-I /home/artfulbytes/ti/ccs910/ccs/ccs_base/msp430/include_gcc \
	-L /home/artfulbytes/ti/ccs910/ccs/ccs_base/msp430/include_gcc \
	-c -o blink blink.c
