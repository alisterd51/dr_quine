#include <stdio.h>
#include <fcntl.h>

#define GRACE "#include <stdio.h>%2$c#include <fcntl.h>%2$c%2$c#define GRACE %3$c%1$s%3$c%2$c%2$cint main() {%2$c    int fd = open(%3$cGrace_kid.c%3$c, O_WRONLY | O_CREAT, 0664);%2$c%2$c    dprintf(fd, GRACE, GRACE, %5$c%4$cn%5$c, %5$c%4$c%3$c%5$c, %5$c%4$c%4$c%5$c, %5$c%4$c%5$c%5$c);%2$c}%2$c"

int main() {
    int fd = open("Grace_kid.c", O_WRONLY | O_CREAT, 0664);

    dprintf(fd, GRACE, GRACE, '\n', '\"', '\\', '\'');
}
