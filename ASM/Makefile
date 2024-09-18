all:
BUILD	:= debug

build_dir := ${BUILD}

BIN1	:= Colleen
BIN2	:= Grace
BIN3	:= Sully

exes	:= ${BIN1} ${BIN2} ${BIN3}

SRCS1	:= Colleen.s
SRCS2	:= Grace.s
SRCS3	:= Sully.s

OBJS1	:= ${SRCS1:.s=.o}
OBJS2	:= ${SRCS2:.s=.o}
OBJS3	:= ${SRCS3:.s=.o}

DEPS1	:= ${OBJS1:.o=.d}
DEPS2	:= ${OBJS2:.o=.d}
DEPS3	:= ${OBJS3:.o=.d}

AS	:= nasm
LD	:= clang

ASFLAGS.debug	:=
ASFLAGS.release	:=
ASFLAGS	:= -f elf64 ${ASFLAGS.${BUILD}}

LDLIBS	:=

LDFLAGS.debug	:=
LDFLAGS.release	:= 
LDFLAGS	:= ${LDFLAGS.${BUILD}}

COMPILE	= ${AS} ${ASFLAGS} $< -o $@
LINK	= ${LD} ${LDFLAGS} ${filter-out Makefile, $^} ${LDLIBS} -o $@

all: ${exes:%=${build_dir}/%}

${build_dir}:
	mkdir $@

${build_dir}/%.o: %.s Makefile | ${build_dir}
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
