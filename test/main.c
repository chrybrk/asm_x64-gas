#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    printf("size: ");
    int size;
    scanf("%d", &size);

    int *array = calloc(size, sizeof(int));
    
    for (int i = 0; i < size; i++)
    {
        printf("v: ");
        scanf("%d", &array[i]);
    }

    int s = 0;

    for (int i = 0; i < size; i++)
        s += array[i];

    printf("result: %d\n", s);

    free(array);

    return 0;
}
