#include "ctxt.h"
#include "install.h"

struct install_item insthier[] = {
  {INST_MKDIR, 0, 0, ctxt_bindir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_incdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_dlibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_slibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_repos, 0, 0, 0755},
  {INST_COPY, "sdl-ada-conf.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-audio.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-audio.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl-error.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-error.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl-events.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-events.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl-joystick.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-joystick.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl-keyboard.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-keyboard.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl-keysym.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-keysym.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl-mouse.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-mouse.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl-rwops.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-rwops.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl-timer.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-timer.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl-video.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-video.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl-audio.adb", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-audio.adb", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl-error.adb", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-error.adb", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl-rwops.adb", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-rwops.adb", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl-video.adb", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-video.adb", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl.adb", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl.adb", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "sdl-audio.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-audio.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "sdl-error.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-error.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "sdl-events.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-events.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "sdl-joystick.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-joystick.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "sdl-keyboard.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-keyboard.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "sdl-keysym.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-keysym.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "sdl-mouse.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-mouse.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "sdl-rwops.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-rwops.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "sdl-timer.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-timer.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "sdl-video.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-video.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "sdl.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "sdl-ada.sld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "sdl-ada.a", "libsdl-ada.a", ctxt_slibdir, 0, 0, 0644},
  {INST_COPY, "sdl-ada-conf.ld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY_EXEC, "sdl-ada-conf", 0, ctxt_bindir, 0, 0, 0755},
};
unsigned long insthier_len = sizeof(insthier) / sizeof(struct install_item);
