#include <stdio.h>

#define GRACE "#include <stdio.h>%2$c%2$c#define GRACE %3$c%1$s%3$c%2$c#define MAIN() int main() {FILE *stream = fopen(%3$cGrace_kid.c%3$c, %3$cw+%3$c); fprintf(stream, GRACE, GRACE, %5$c%4$cn%5$c, %5$c%4$c%3$c%5$c, %5$c%4$c%4$c%5$c, %5$c%4$c%5$c%5$c); fclose(stream); return (0);}%2$c%2$c/* comment */%2$c%2$cMAIN()%2$c"
#define MAIN() int main() {FILE *stream = fopen("Grace_kid.c", "w+"); fprintf(stream, GRACE, GRACE, '\n', '\"', '\\', '\''); fclose(stream); return (0);}

/* comment */

MAIN()
