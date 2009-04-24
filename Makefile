# auto generated - do not edit

default: all

all:\
UNIT_TESTS/ada_size UNIT_TESTS/ada_size.ali UNIT_TESTS/ada_size.o \
UNIT_TESTS/c_size UNIT_TESTS/c_size.o ctxt/bindir.o ctxt/ctxt.a ctxt/dlibdir.o \
ctxt/incdir.o ctxt/repos.o ctxt/slibdir.o ctxt/version.o deinstaller \
deinstaller.o install-core.o install-error.o install-posix.o install-win32.o \
install.a installer installer.o instchk instchk.o insthier.o sdl-ada-conf \
sdl-ada-conf.o sdl-ada.a sdl-audio.ali sdl-audio.o sdl-error.ali sdl-error.o \
sdl-events.ali sdl-events.o sdl-joystick.ali sdl-joystick.o sdl-keyboard.ali \
sdl-keyboard.o sdl-keysym.ali sdl-keysym.o sdl-mouse.ali sdl-mouse.o \
sdl-rwops.ali sdl-rwops.o sdl-timer.ali sdl-timer.o sdl-video.ali sdl-video.o \
sdl.ali sdl.o

# Mkf-deinstall
deinstall: deinstaller conf-sosuffix
	./deinstaller
deinstall-dryrun: deinstaller conf-sosuffix
	./deinstaller dryrun

# Mkf-install
install: installer postinstall conf-sosuffix
	./installer
	./postinstall

install-dryrun: installer conf-sosuffix
	./installer dryrun

# Mkf-instchk
install-check: instchk conf-sosuffix
	./instchk

# Mkf-test
tests:
	(cd UNIT_TESTS && make)
tests_clean:
	(cd UNIT_TESTS && make clean)

# -- SYSDEPS start
flags-sdl:
	@echo SYSDEPS sdl-flags run create flags-sdl 
	@(cd SYSDEPS/modules/sdl-flags && ./run)
libs-sdl:
	@echo SYSDEPS sdl-libs run create libs-sdl 
	@(cd SYSDEPS/modules/sdl-libs && ./run)


sdl-flags_clean:
	@echo SYSDEPS sdl-flags clean flags-sdl 
	@(cd SYSDEPS/modules/sdl-flags && ./clean)
sdl-libs_clean:
	@echo SYSDEPS sdl-libs clean libs-sdl 
	@(cd SYSDEPS/modules/sdl-libs && ./clean)


sysdeps_clean:\
sdl-flags_clean \
sdl-libs_clean \


# -- SYSDEPS end


UNIT_TESTS/ada_size:\
ada-bind ada-link UNIT_TESTS/ada_size.ald UNIT_TESTS/ada_size.ali sdl-audio.ali \
sdl-error.ali sdl-events.ali sdl-joystick.ali sdl-keyboard.ali sdl-keysym.ali \
sdl-mouse.ali sdl-rwops.ali sdl-timer.ali sdl-video.ali sdl.ali
	./ada-bind UNIT_TESTS/ada_size.ali
	./ada-link UNIT_TESTS/ada_size UNIT_TESTS/ada_size.ali

UNIT_TESTS/ada_size.ali:\
ada-compile UNIT_TESTS/ada_size.adb sdl.ali sdl-audio.ali sdl-error.ali \
sdl-events.ali sdl-joystick.ali sdl-keyboard.ali sdl-keysym.ali sdl-mouse.ali \
sdl-rwops.ali sdl-timer.ali sdl-video.ali
	./ada-compile UNIT_TESTS/ada_size.adb

UNIT_TESTS/ada_size.o:\
UNIT_TESTS/ada_size.ali

UNIT_TESTS/c_size:\
cc-link UNIT_TESTS/c_size.ld UNIT_TESTS/c_size.o
	./cc-link UNIT_TESTS/c_size UNIT_TESTS/c_size.o

UNIT_TESTS/c_size.o:\
cc-compile UNIT_TESTS/c_size.c
	./cc-compile UNIT_TESTS/c_size.c

ada-bind:\
conf-adabind conf-systype conf-adatype conf-adafflist flags-cwd

ada-compile:\
conf-adacomp conf-adatype conf-systype conf-adacflags conf-adafflist flags-cwd

ada-link:\
conf-adalink conf-adatype conf-systype conf-aldfflist libs-sdl

ada-srcmap:\
conf-adacomp conf-adatype conf-systype

ada-srcmap-all:\
ada-srcmap conf-adacomp conf-adatype conf-systype

cc-compile:\
conf-cc conf-cctype conf-systype conf-cflags conf-ccfflist flags-sdl

cc-link:\
conf-ld conf-ldtype conf-systype conf-ldflags

cc-slib:\
conf-systype

conf-adatype:\
mk-adatype
	./mk-adatype > conf-adatype.tmp && mv conf-adatype.tmp conf-adatype

conf-cctype:\
conf-cc conf-cc mk-cctype
	./mk-cctype > conf-cctype.tmp && mv conf-cctype.tmp conf-cctype

conf-ldtype:\
conf-ld conf-ld mk-ldtype
	./mk-ldtype > conf-ldtype.tmp && mv conf-ldtype.tmp conf-ldtype

conf-sosuffix:\
mk-sosuffix
	./mk-sosuffix > conf-sosuffix.tmp && mv conf-sosuffix.tmp conf-sosuffix

conf-systype:\
mk-systype
	./mk-systype > conf-systype.tmp && mv conf-systype.tmp conf-systype

# ctxt/bindir.c.mff
ctxt/bindir.c: mk-ctxt conf-bindir
	rm -f ctxt/bindir.c
	./mk-ctxt ctxt_bindir < conf-bindir > ctxt/bindir.c

ctxt/bindir.o:\
cc-compile ctxt/bindir.c
	./cc-compile ctxt/bindir.c

ctxt/ctxt.a:\
cc-slib ctxt/ctxt.sld ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o ctxt/repos.o \
ctxt/slibdir.o ctxt/version.o
	./cc-slib ctxt/ctxt ctxt/bindir.o ctxt/dlibdir.o ctxt/incdir.o ctxt/repos.o \
	ctxt/slibdir.o ctxt/version.o

# ctxt/dlibdir.c.mff
ctxt/dlibdir.c: mk-ctxt conf-dlibdir
	rm -f ctxt/dlibdir.c
	./mk-ctxt ctxt_dlibdir < conf-dlibdir > ctxt/dlibdir.c

ctxt/dlibdir.o:\
cc-compile ctxt/dlibdir.c
	./cc-compile ctxt/dlibdir.c

# ctxt/incdir.c.mff
ctxt/incdir.c: mk-ctxt conf-incdir
	rm -f ctxt/incdir.c
	./mk-ctxt ctxt_incdir < conf-incdir > ctxt/incdir.c

ctxt/incdir.o:\
cc-compile ctxt/incdir.c
	./cc-compile ctxt/incdir.c

# ctxt/repos.c.mff
ctxt/repos.c: mk-ctxt conf-repos
	rm -f ctxt/repos.c
	./mk-ctxt ctxt_repos < conf-repos > ctxt/repos.c

ctxt/repos.o:\
cc-compile ctxt/repos.c
	./cc-compile ctxt/repos.c

# ctxt/slibdir.c.mff
ctxt/slibdir.c: mk-ctxt conf-slibdir
	rm -f ctxt/slibdir.c
	./mk-ctxt ctxt_slibdir < conf-slibdir > ctxt/slibdir.c

ctxt/slibdir.o:\
cc-compile ctxt/slibdir.c
	./cc-compile ctxt/slibdir.c

# ctxt/version.c.mff
ctxt/version.c: mk-ctxt VERSION
	rm -f ctxt/version.c
	./mk-ctxt ctxt_version < VERSION > ctxt/version.c

ctxt/version.o:\
cc-compile ctxt/version.c
	./cc-compile ctxt/version.c

deinstaller:\
cc-link deinstaller.ld deinstaller.o insthier.o install.a ctxt/ctxt.a
	./cc-link deinstaller deinstaller.o insthier.o install.a ctxt/ctxt.a

deinstaller.o:\
cc-compile deinstaller.c install.h
	./cc-compile deinstaller.c

install-core.o:\
cc-compile install-core.c install.h
	./cc-compile install-core.c

install-error.o:\
cc-compile install-error.c install.h
	./cc-compile install-error.c

install-posix.o:\
cc-compile install-posix.c install.h
	./cc-compile install-posix.c

install-win32.o:\
cc-compile install-win32.c install.h
	./cc-compile install-win32.c

install.a:\
cc-slib install.sld install-core.o install-posix.o install-win32.o \
install-error.o
	./cc-slib install install-core.o install-posix.o install-win32.o \
	install-error.o

install.h:\
install_os.h

installer:\
cc-link installer.ld installer.o insthier.o install.a ctxt/ctxt.a
	./cc-link installer installer.o insthier.o install.a ctxt/ctxt.a

installer.o:\
cc-compile installer.c install.h
	./cc-compile installer.c

instchk:\
cc-link instchk.ld instchk.o insthier.o install.a ctxt/ctxt.a
	./cc-link instchk instchk.o insthier.o install.a ctxt/ctxt.a

instchk.o:\
cc-compile instchk.c install.h
	./cc-compile instchk.c

insthier.o:\
cc-compile insthier.c ctxt.h install.h
	./cc-compile insthier.c

mk-adatype:\
conf-adacomp conf-systype

mk-cctype:\
conf-cc conf-systype

mk-ctxt:\
mk-mk-ctxt
	./mk-mk-ctxt

mk-ldtype:\
conf-ld conf-systype conf-cctype

mk-mk-ctxt:\
conf-cc conf-ld

mk-sosuffix:\
conf-systype

mk-systype:\
conf-cc conf-ld

sdl-ada-conf:\
cc-link sdl-ada-conf.ld sdl-ada-conf.o ctxt/ctxt.a
	./cc-link sdl-ada-conf sdl-ada-conf.o ctxt/ctxt.a

sdl-ada-conf.o:\
cc-compile sdl-ada-conf.c ctxt.h
	./cc-compile sdl-ada-conf.c

sdl-ada.a:\
cc-slib sdl-ada.sld sdl-audio.o sdl-error.o sdl-events.o sdl-joystick.o \
sdl-keyboard.o sdl-keysym.o sdl-mouse.o sdl-rwops.o sdl-timer.o sdl-video.o \
sdl.o
	./cc-slib sdl-ada sdl-audio.o sdl-error.o sdl-events.o sdl-joystick.o \
	sdl-keyboard.o sdl-keysym.o sdl-mouse.o sdl-rwops.o sdl-timer.o sdl-video.o \
	sdl.o

sdl-audio.ads:\
sdl.ali

sdl-audio.ali:\
ada-compile sdl-audio.adb sdl.ali sdl-audio.ads
	./ada-compile sdl-audio.adb

sdl-audio.o:\
sdl-audio.ali

sdl-error.ads:\
sdl.ali

sdl-error.ali:\
ada-compile sdl-error.adb sdl.ali sdl-error.ads
	./ada-compile sdl-error.adb

sdl-error.o:\
sdl-error.ali

sdl-events.ali:\
ada-compile sdl-events.ads sdl.ali sdl-events.ads sdl-mouse.ali \
sdl-keyboard.ali sdl-joystick.ali
	./ada-compile sdl-events.ads

sdl-events.o:\
sdl-events.ali

sdl-joystick.ali:\
ada-compile sdl-joystick.ads sdl.ali sdl-joystick.ads
	./ada-compile sdl-joystick.ads

sdl-joystick.o:\
sdl-joystick.ali

sdl-keyboard.ali:\
ada-compile sdl-keyboard.ads sdl.ali sdl-keyboard.ads sdl-keysym.ali
	./ada-compile sdl-keyboard.ads

sdl-keyboard.o:\
sdl-keyboard.ali

sdl-keysym.ali:\
ada-compile sdl-keysym.ads sdl.ali sdl-keysym.ads
	./ada-compile sdl-keysym.ads

sdl-keysym.o:\
sdl-keysym.ali

sdl-mouse.ali:\
ada-compile sdl-mouse.ads sdl.ali sdl-mouse.ads sdl-video.ali
	./ada-compile sdl-mouse.ads

sdl-mouse.o:\
sdl-mouse.ali

sdl-rwops.ads:\
sdl.ali

sdl-rwops.ali:\
ada-compile sdl-rwops.adb sdl.ali sdl-rwops.ads
	./ada-compile sdl-rwops.adb

sdl-rwops.o:\
sdl-rwops.ali

sdl-timer.ali:\
ada-compile sdl-timer.ads sdl.ali sdl-timer.ads
	./ada-compile sdl-timer.ads

sdl-timer.o:\
sdl-timer.ali

sdl-video.ads:\
sdl.ali

sdl-video.ali:\
ada-compile sdl-video.adb sdl.ali sdl-video.ads
	./ada-compile sdl-video.adb

sdl-video.o:\
sdl-video.ali

sdl.ali:\
ada-compile sdl.adb sdl.ads
	./ada-compile sdl.adb

sdl.o:\
sdl.ali

clean-all: sysdeps_clean tests_clean obj_clean ext_clean
clean: obj_clean
obj_clean:
	rm -f UNIT_TESTS/ada_size UNIT_TESTS/ada_size.ali UNIT_TESTS/ada_size.o \
	UNIT_TESTS/c_size UNIT_TESTS/c_size.o ctxt/bindir.c ctxt/bindir.o ctxt/ctxt.a \
	ctxt/dlibdir.c ctxt/dlibdir.o ctxt/incdir.c ctxt/incdir.o ctxt/repos.c \
	ctxt/repos.o ctxt/slibdir.c ctxt/slibdir.o ctxt/version.c ctxt/version.o \
	deinstaller deinstaller.o install-core.o install-error.o install-posix.o \
	install-win32.o install.a installer installer.o instchk instchk.o insthier.o \
	sdl-ada-conf sdl-ada-conf.o sdl-ada.a sdl-audio.ali sdl-audio.o sdl-error.ali \
	sdl-error.o sdl-events.ali sdl-events.o sdl-joystick.ali sdl-joystick.o \
	sdl-keyboard.ali sdl-keyboard.o sdl-keysym.ali sdl-keysym.o sdl-mouse.ali \
	sdl-mouse.o sdl-rwops.ali sdl-rwops.o sdl-timer.ali sdl-timer.o sdl-video.ali \
	sdl-video.o sdl.ali sdl.o
ext_clean:
	rm -f conf-adatype conf-cctype conf-ldtype conf-sosuffix conf-systype mk-ctxt

regen:\
ada-srcmap ada-srcmap-all
	./ada-srcmap-all
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile
