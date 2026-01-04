#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    int a, b;
    float c;

    if (argc < 3) {
        printf("Usage: %s <num1> <num2>\n", argv[0]);
        return 1;
    }
    a = atoi(argv[1]);
    b = atoi(argv[2]);

    if (b == 0) {
        printf("Error: Division by zero is not allowed.\n");
        return 1;
    }

    c = (float)a / b;
    printf("%d / %d = %.2f\n", a, b, c);
    return 0;
}
