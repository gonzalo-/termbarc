.POSIX:

CC ?=		cc
LIBS =
OPTFLAGS =	-O3
DBGFLAGS =	-O0 -g
CFLAGS =	-pipe -Wall -Werror -march=native
INCLUDEDIR =	-I.

# man
MANDIR =	${HOME}/man
MAN5 =		${MANDIR}/man5

all: build

build: clean
	${CC} ${DBGFLAGS} ${CFLAGS} ${INCLUDEDIR} -o termbar ${LIBS} termbarc.c

opt: clean
	${CC} ${OPTFLAGS} ${CFLAGS} ${INCLUDEDIR} -o termbar ${LIBS} termbarc.c

install:
	install -s termbar ${HOME}/bin/termbar
	install termbar.conf ${HOME}/.termbar.conf
	install -Dm 644 termbar.conf.5 ${MAN5}/termbar.conf.5

clean:
	rm -f termbar

uninstall:
	rm -f ${HOME}/bin/termbar
	rm -f ${HOME}/.termbar.conf
	rm -f ${MAN5}/termbar.conf.5

debug: build
	egdb -q ./termbar -ex "break main" -ex "run"
