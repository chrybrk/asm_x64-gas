#include <stdio.h>

int main(void)
{
    int i = 10;
    while (i != 1)
    {
        int a = i % 2;
        i--;
    }

    return 0;
}
