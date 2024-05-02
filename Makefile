.POSIX:

CC ?=		cc
LIBS =
OPTFLAGS =	-O3
DBGFLAGS =	-O0 -g
CFLAGS =	-pipe -Wall -Werror -march=native
INCLUDEDIR =	-I.

all: build

build: clean
	${CC} ${DBGFLAGS} ${CFLAGS} ${INCLUDEDIR} -o termbar ${LIBS} termbarc.c

opt: clean
	${CC} ${OPTFLAGS} ${CFLAGS} ${INCLUDEDIR} -o termbar ${LIBS} termbarc.c

install:
	install -s termbar ${HOME}/bin/termbar
	install termbar.conf ${HOME}/.termbar.conf

clean:
	rm -f termbar

uninstall:
	rm -f ${HOME}/bin/termbar
	rm -f ${HOME}/.termbar.conf

debug: build
	egdb -q ./termbar -ex "break main" -ex "run"
