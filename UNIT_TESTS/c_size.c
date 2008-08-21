#include <SDL.h>

#include <stdio.h>
#include <string.h>

struct {
  const char *type_name;
  unsigned int type_size;
} types[] = {
  /* auto generated - do not edit */
  { "SDL_AudioCVT *", sizeof (SDL_AudioCVT *) },
  { "struct SDL_AudioCVT *", sizeof (struct SDL_AudioCVT *) },
  { "SDL_AudioCVT", sizeof (SDL_AudioCVT) },
  { "struct SDL_AudioCVT", sizeof (struct SDL_AudioCVT) },
  { "SDL_AudioSpec *", sizeof (SDL_AudioSpec *) },
  { "struct SDL_AudioSpec *", sizeof (struct SDL_AudioSpec *) },
  { "SDL_AudioSpec", sizeof (SDL_AudioSpec) },
  { "struct SDL_AudioSpec", sizeof (struct SDL_AudioSpec) },
  { "SDL_audiostatus", sizeof (SDL_audiostatus) },
  { "SDL_errorcode", sizeof (SDL_errorcode) },
  { "SDL_eventaction", sizeof (SDL_eventaction) },
  { "SDL_ActiveEvent *", sizeof (SDL_ActiveEvent *) },
  { "struct SDL_ActiveEvent *", sizeof (struct SDL_ActiveEvent *) },
  { "SDL_ActiveEvent", sizeof (SDL_ActiveEvent) },
  { "struct SDL_ActiveEvent", sizeof (struct SDL_ActiveEvent) },
  { "SDL_Event *", sizeof (SDL_Event *) },
  { "union SDL_Event *", sizeof (union SDL_Event *) },
  { "SDL_Event", sizeof (SDL_Event) },
  { "union SDL_Event", sizeof (union SDL_Event) },
  { "SDL_EventFilter", sizeof (SDL_EventFilter) },
  { "SDL_JoyAxisEvent *", sizeof (SDL_JoyAxisEvent *) },
  { "struct SDL_JoyAxisEvent *", sizeof (struct SDL_JoyAxisEvent *) },
  { "SDL_JoyAxisEvent", sizeof (SDL_JoyAxisEvent) },
  { "struct SDL_JoyAxisEvent", sizeof (struct SDL_JoyAxisEvent) },
  { "SDL_JoyBallEvent *", sizeof (SDL_JoyBallEvent *) },
  { "struct SDL_JoyBallEvent *", sizeof (struct SDL_JoyBallEvent *) },
  { "SDL_JoyBallEvent", sizeof (SDL_JoyBallEvent) },
  { "struct SDL_JoyBallEvent", sizeof (struct SDL_JoyBallEvent) },
  { "SDL_JoyButtonEvent *", sizeof (SDL_JoyButtonEvent *) },
  { "struct SDL_JoyButtonEvent *", sizeof (struct SDL_JoyButtonEvent *) },
  { "SDL_JoyButtonEvent", sizeof (SDL_JoyButtonEvent) },
  { "struct SDL_JoyButtonEvent", sizeof (struct SDL_JoyButtonEvent) },
  { "SDL_JoyHatEvent *", sizeof (SDL_JoyHatEvent *) },
  { "struct SDL_JoyHatEvent *", sizeof (struct SDL_JoyHatEvent *) },
  { "SDL_JoyHatEvent", sizeof (SDL_JoyHatEvent) },
  { "struct SDL_JoyHatEvent", sizeof (struct SDL_JoyHatEvent) },
  { "SDL_KeyboardEvent *", sizeof (SDL_KeyboardEvent *) },
  { "struct SDL_KeyboardEvent *", sizeof (struct SDL_KeyboardEvent *) },
  { "SDL_KeyboardEvent", sizeof (SDL_KeyboardEvent) },
  { "struct SDL_KeyboardEvent", sizeof (struct SDL_KeyboardEvent) },
  { "SDL_EventMask", sizeof (SDL_EventMask) },
  { "SDL_MouseButtonEvent *", sizeof (SDL_MouseButtonEvent *) },
  { "struct SDL_MouseButtonEvent *", sizeof (struct SDL_MouseButtonEvent *) },
  { "SDL_MouseButtonEvent", sizeof (SDL_MouseButtonEvent) },
  { "struct SDL_MouseButtonEvent", sizeof (struct SDL_MouseButtonEvent) },
  { "SDL_MouseMotionEvent *", sizeof (SDL_MouseMotionEvent *) },
  { "struct SDL_MouseMotionEvent *", sizeof (struct SDL_MouseMotionEvent *) },
  { "SDL_MouseMotionEvent", sizeof (SDL_MouseMotionEvent) },
  { "struct SDL_MouseMotionEvent", sizeof (struct SDL_MouseMotionEvent) },
  { "SDL_QuitEvent *", sizeof (SDL_QuitEvent *) },
  { "struct SDL_QuitEvent *", sizeof (struct SDL_QuitEvent *) },
  { "SDL_QuitEvent", sizeof (SDL_QuitEvent) },
  { "struct SDL_QuitEvent", sizeof (struct SDL_QuitEvent) },
  { "SDL_ResizeEvent *", sizeof (SDL_ResizeEvent *) },
  { "struct SDL_ResizeEvent *", sizeof (struct SDL_ResizeEvent *) },
  { "SDL_ResizeEvent", sizeof (SDL_ResizeEvent) },
  { "struct SDL_ResizeEvent", sizeof (struct SDL_ResizeEvent) },
  { "SDL_SysWMEvent *", sizeof (SDL_SysWMEvent *) },
  { "struct SDL_SysWMEvent *", sizeof (struct SDL_SysWMEvent *) },
  { "SDL_SysWMEvent", sizeof (SDL_SysWMEvent) },
  { "struct SDL_SysWMEvent", sizeof (struct SDL_SysWMEvent) },
  { "SDL_SysWMmsg *", sizeof (SDL_SysWMmsg *) },
  { "struct SDL_SysWMmsg *", sizeof (struct SDL_SysWMmsg *) },
  { "SDL_EventType", sizeof (SDL_EventType) },
  { "SDL_UserEvent *", sizeof (SDL_UserEvent *) },
  { "struct SDL_UserEvent *", sizeof (struct SDL_UserEvent *) },
  { "SDL_UserEvent", sizeof (SDL_UserEvent) },
  { "struct SDL_UserEvent", sizeof (struct SDL_UserEvent) },
  { "SDL_Joystick *", sizeof (SDL_Joystick *) },
  { "SDL_keysym *", sizeof (SDL_keysym *) },
  { "struct SDL_keysym *", sizeof (struct SDL_keysym *) },
  { "SDL_keysym *", sizeof (SDL_keysym *) },
  { "struct SDL_keysym *", sizeof (struct SDL_keysym *) },
  { "SDL_keysym", sizeof (SDL_keysym) },
  { "struct SDL_keysym", sizeof (struct SDL_keysym) },
  { "SDLKey", sizeof (SDLKey) },
  { "SDLMod", sizeof (SDLMod) },
  { "SDL_Cursor *", sizeof (SDL_Cursor *) },
  { "struct SDL_Cursor *", sizeof (struct SDL_Cursor *) },
  { "SDL_Cursor", sizeof (SDL_Cursor) },
  { "struct SDL_Cursor", sizeof (struct SDL_Cursor) },
  { "SDL_RWops", sizeof (SDL_RWops) },
  { "struct SDL_RWops", sizeof (struct SDL_RWops) },
  { "SDL_NewTimerCallback", sizeof (SDL_NewTimerCallback) },
  { "SDL_TimerID", sizeof (SDL_TimerID) },
  { "SDL_TimerCallback", sizeof (SDL_TimerCallback) },
  { "SDL_Color *", sizeof (SDL_Color *) },
  { "struct SDL_Color *", sizeof (struct SDL_Color *) },
  { "SDL_Color", sizeof (SDL_Color) },
  { "struct SDL_Color", sizeof (struct SDL_Color) },
  { "SDL_Palette *", sizeof (SDL_Palette *) },
  { "struct SDL_Palette *", sizeof (struct SDL_Palette *) },
  { "SDL_Palette", sizeof (SDL_Palette) },
  { "struct SDL_Palette", sizeof (struct SDL_Palette) },
  { "SDL_PixelFormat *", sizeof (SDL_PixelFormat *) },
  { "struct SDL_PixelFormat *", sizeof (struct SDL_PixelFormat *) },
  { "SDL_PixelFormat", sizeof (SDL_PixelFormat) },
  { "struct SDL_PixelFormat", sizeof (struct SDL_PixelFormat) },
  { "SDL_Rect *", sizeof (SDL_Rect *) },
  { "struct SDL_Rect *", sizeof (struct SDL_Rect *) },
  { "SDL_Rect", sizeof (SDL_Rect) },
  { "struct SDL_Rect", sizeof (struct SDL_Rect) },
  { "SDL_Surface *", sizeof (SDL_Surface *) },
  { "struct SDL_Surface *", sizeof (struct SDL_Surface *) },
  { "SDL_Surface", sizeof (SDL_Surface) },
  { "struct SDL_Surface", sizeof (struct SDL_Surface) },
  { "SDL_VideoInfo *", sizeof (SDL_VideoInfo *) },
  { "struct SDL_VideoInfo *", sizeof (struct SDL_VideoInfo *) },
  { "SDL_VideoInfo", sizeof (SDL_VideoInfo) },
  { "struct SDL_VideoInfo", sizeof (struct SDL_VideoInfo) },
};
const unsigned int types_size = sizeof (types) / sizeof (types[0]);

void
find (const char *name)
{
  unsigned int pos;
  for (pos = 0; pos < types_size; ++pos) {
    if (strcmp (types[pos].type_name, name) == 0) {
      printf ("%u\n", types[pos].type_size * 8);
      return;
    }
  }
  fprintf (stderr, "fatal: unknown C type\n");
  exit (112);
}

int
main (int argc, char *argv[])
{
  if (argc != 2) exit (111);
  find (argv[1]);
  return 0;
}
