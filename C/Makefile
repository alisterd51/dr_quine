all:
BUILD	:= debug

build_dir := ${BUILD}

BIN1	:= Colleen
BIN2	:= Grace
BIN3	:= Sully

exes	:= ${BIN1} ${BIN2} ${BIN3}

SRCS1	:= Colleen.c
SRCS2	:= Grace.c
SRCS3	:= Sully.c

OBJS1	:= ${SRCS1:.c=.o}
OBJS2	:= ${SRCS2:.c=.o}
OBJS3	:= ${SRCS3:.c=.o}

DEPS1	:= ${OBJS1:.o=.d}
DEPS2	:= ${OBJS2:.o=.d}
DEPS3	:= ${OBJS3:.o=.d}

-include ${addprefix ${build_dir}/, ${DEPS1} ${DEPS2} ${DEPS3}}

CC	:=	clang

CFLAGS.debug	:= -O0 -g3 -fsanitize=address -fsanitize=undefined -fsanitize=leak
CFLAGS.release	:=
CFLAGS	:= -Wall -Wextra -Werror ${CFLAGS.${BUILD}}

LDLIBS	:= -lc

LDFLAGS.debug	:= -g3 -fsanitize=address -fsanitize=undefined -fsanitize=leak
LDFLAGS.release	:= 
LDFLAGS	:= ${LDFLAGS.${BUILD}}

COMPILE	= ${CC} -MD -MP ${CFLAGS} -c $< -o $@
LINK	= ${CC} ${LDFLAGS} ${filter-out Makefile, $^} ${LDLIBS} -o $@

all: ${exes:%=${build_dir}/%}

${build_dir}:
	mkdir $@

${build_dir}/%.o: %.c Makefile | ${build_dir}
	${strip ${COMPILE}}

${build_dir}/${BIN1}: ${addprefix ${build_dir}/, ${OBJS1}} Makefile | ${build_dir}
	${strip ${LINK}}

${build_dir}/${BIN2}: ${addprefix ${build_dir}/, ${OBJS2}} Makefile | ${build_dir}
	${strip ${LINK}}

${build_dir}/${BIN3}: ${addprefix ${build_dir}/, ${OBJS3}} Makefile | ${build_dir}
	${strip ${LINK}}

${BIN1}: ${build_dir}/${BIN1}

${BIN2}: ${build_dir}/${BIN2}

${BIN3}: ${build_dir}/${BIN3}

clean:
	rm -f ${addprefix ${build_dir}/, ${OBJS1} ${OBJS2} ${OBJS3}}
	rm -f ${addprefix ${build_dir}/, ${DEPS1} ${DEPS2} ${DEPS3}}

fclean:
	rm -rf ${build_dir}

re: fclean all

.PHONY: all clean fclean re ${BIN1} ${BIN2} ${BIN3}
