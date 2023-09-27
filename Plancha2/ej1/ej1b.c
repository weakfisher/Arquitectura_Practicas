int main(void) {

    char a = 0xFE; // %al
    char b = -1; // %bl
    a+= b;
    b++;
    return a;
}