#include <stdio.h>

#define COLLEEN "#include <stdio.h>%2$c%2$c#define COLLEEN %3$c%1$s%3$c%2$c%2$c/*%2$c *comment two%2$c */%2$c%2$cvoid test() {%2$c    printf(COLLEEN, COLLEEN, %5$c%4$cn%5$c, %5$c%4$c%3$c%5$c, %5$c%4$c%4$c%5$c, %5$c%4$c%5$c%5$c);%2$c}%2$c%2$cint main() {%2$c    /*comment one*/%2$c    test();%2$c}%2$c"

/*
 *comment two
 */

void test() {
    printf(COLLEEN, COLLEEN, '\n', '\"', '\\', '\'');
}

int main() {
    /*comment one*/
    test();
}
