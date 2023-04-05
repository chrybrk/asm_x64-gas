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

    for (int i = 0; i < size; i++)
        printf("result: %d\n", array[i]);

    free(array);

    return 0;
}
