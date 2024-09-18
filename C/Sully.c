#include <stdio.h>
#include <stdlib.h>

#define SULLY "#include <stdio.h>%2$c#include <stdlib.h>%2$c%2$c#define SULLY %3$c%1$s%3$c%2$c%2$cint main()%2$c{%2$c    int i = %6$d;%2$c    char name[50];%2$c    char str[200];%2$c    FILE *stream;%2$c%2$c    if (i > 0)%2$c    {%2$c        sprintf(name, %3$cSully_%%d.c%3$c, i - 1);%2$c        stream = fopen(name, %3$cw+%3$c);%2$c        fprintf(stream, SULLY, SULLY, %5$c%4$cn%5$c, %5$c%4$c%3$c%5$c, %5$c%4$c%4$c%5$c, %5$c%4$c%5$c%5$c, i - 1);%2$c        fflush(stream);%2$c        sprintf(str, %3$ccc Sully_%%1$d.c -o Sully_%%1$d && ./Sully_%%1$d%3$c, i - 1);%2$c        system(str);%2$c    }%2$c    return (0);%2$c}%2$c"

int main()
{
    int i = 5;
    char name[50];
    char str[200];
    FILE *stream;

    if (i > 0)
    {
        sprintf(name, "Sully_%d.c", i - 1);
        stream = fopen(name, "w+");
        fprintf(stream, SULLY, SULLY, '\n', '\"', '\\', '\'', i - 1);
        fflush(stream);
        sprintf(str, "cc Sully_%1$d.c -o Sully_%1$d && ./Sully_%1$d", i - 1);
        system(str);
    }
    return (0);
}
