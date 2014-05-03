    unsigned char counterx = 0;
    while (1) {
        counterx++;
        IntegerToBinary(counterx, 8, display);
        writeString(display);
        writeString("\r\n");
		}