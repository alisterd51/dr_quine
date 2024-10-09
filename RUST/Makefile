all:
BUILD	:= debug

build_dir := ${BUILD}

BIN1	:= Colleen
BIN2	:= Grace
BIN3	:= Sully

exes	:= ${BIN1} ${BIN2} ${BIN3}

SRCS1	:= Colleen.rs
SRCS2	:= Grace.rs
SRCS3	:= Sully.rs

RUSTC	:= rustc

RUSTFLAGS.debug	:= -C debuginfo=2 -C opt-level=0
RUSTFLAGS.release	:= -C debuginfo=0 -C opt-level=3
RUSTFLAGS	:= ${RUSTFLAGS.${BUILD}}

COMPILE	= ${RUSTC} ${RUSTFLAGS} $< -o $@

all: ${exes:%=${build_dir}/%}

${build_dir}:
	mkdir $@

${build_dir}/${BIN1}: ${SRCS1} | ${build_dir}
	${strip ${COMPILE}}

${build_dir}/${BIN2}: ${SRCS2} | ${build_dir}
	${strip ${COMPILE}}

${build_dir}/${BIN3}: ${SRCS3} | ${build_dir}
	${strip ${COMPILE}}

${BIN1}: ${build_dir}/${BIN1}

${BIN2}: ${build_dir}/${BIN2}

${BIN3}: ${build_dir}/${BIN3}

clean:

fclean:
	rm -rf ${build_dir}

re: fclean all

.PHONY: all clean fclean re ${BIN1} ${BIN2} ${BIN3}
