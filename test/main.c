#include <stdio.h>
#include <stdlib.h>

int power(int b, int e)
{
    int total = 1;
    for (int i = 0; i < e; i++) total = total * b;

    return total;
}

int main(void)
{
    int size = 4;
    int array[] = { 1, 0, 0, 0 };
    int sum = 0;

    for (int i = 0; i < size; i++)
    {
        sum = sum + (power(2, size - i - 1) * array[i]);
    }

    printf("%d\n", sum);

    return 0;
}
