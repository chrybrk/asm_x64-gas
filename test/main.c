#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int* array = calloc(2, sizeof(int));
    array[0] = 10;
    array[1] = 20;

    int temp = array[0];
    array[0] = array[1];
    array[1] = temp;

    return 0;
}
