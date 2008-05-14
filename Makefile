# auto generated - do not edit

default: all

all:\
sdl-ada.a sdl-error.ali sdl-error.o sdl-mouse.ali sdl-mouse.o sdl-timer.ali \
sdl-timer.o sdl-video.ali sdl-video.o sdl.ali sdl.o

ada-bind:\
conf-adabind conf-systype conf-adatype

ada-compile:\
conf-adacomp conf-adatype conf-systype conf-adacflags

ada-link:\
conf-adalink conf-adatype conf-systype

ada-srcmap:\
conf-adacomp conf-adatype conf-systype

ada-srcmap-all:\
ada-srcmap conf-adacomp conf-adatype conf-systype

cc-compile:\
conf-cc conf-cctype conf-systype

cc-link:\
conf-ld conf-ldtype conf-systype

cc-slib:\
conf-systype

conf-adatype:\
mk-adatype
	./mk-adatype > conf-adatype.tmp && mv conf-adatype.tmp conf-adatype

conf-cctype:\
conf-cc mk-cctype
	./mk-cctype > conf-cctype.tmp && mv conf-cctype.tmp conf-cctype

conf-ldtype:\
conf-ld mk-ldtype
	./mk-ldtype > conf-ldtype.tmp && mv conf-ldtype.tmp conf-ldtype

conf-systype:\
mk-systype
	./mk-systype > conf-systype.tmp && mv conf-systype.tmp conf-systype

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
conf-cc

mk-systype:\
conf-cc

sdl-ada.a:\
cc-slib sdl-ada.sld sdl-error.o sdl-mouse.o sdl-timer.o sdl-video.o sdl.o
	./cc-slib sdl-ada sdl-error.o sdl-mouse.o sdl-timer.o sdl-video.o sdl.o

sdl-error.ali:\
ada-compile sdl-error.adb sdl-error.ads
	./ada-compile sdl-error.adb

sdl-error.o:\
sdl-error.ali

sdl-mouse.ali:\
ada-compile sdl-mouse.ads sdl-mouse.ads sdl-video.ads
	./ada-compile sdl-mouse.ads

sdl-mouse.o:\
sdl-mouse.ali

sdl-timer.ali:\
ada-compile sdl-timer.ads sdl-timer.ads
	./ada-compile sdl-timer.ads

sdl-timer.o:\
sdl-timer.ali

sdl-video.ali:\
ada-compile sdl-video.adb sdl-video.ads
	./ada-compile sdl-video.adb

sdl-video.o:\
sdl-video.ali

sdl.ali:\
ada-compile sdl.ads sdl.ads
	./ada-compile sdl.ads

sdl.o:\
sdl.ali

clean-all: obj_clean ext_clean
clean: obj_clean
obj_clean:
	rm -f sdl-ada.a sdl-error.ali sdl-error.o sdl-mouse.ali sdl-mouse.o \
	sdl-timer.ali sdl-timer.o sdl-video.ali sdl-video.o sdl.ali sdl.o
ext_clean:
	rm -f conf-adatype conf-cctype conf-ldtype conf-systype mk-ctxt

regen:\
ada-srcmap ada-srcmap-all
	./ada-srcmap-all
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile
