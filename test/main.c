#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int *array = calloc(1, sizeof(int) * 5);

    array[0] = 10;

    return 0;
}
