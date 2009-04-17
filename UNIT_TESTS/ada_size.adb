-- auto generated, do not edit

with Ada.Text_IO;
with Ada.Command_Line;

with SDL;
with SDL.Audio;
with SDL.Error;
with SDL.Events;
with SDL.Joystick;
with SDL.Keyboard;
with SDL.Keysym;
with SDL.Mouse;
with SDL.RWops;
with SDL.Timer;
with SDL.Video;

procedure Ada_Size is
  package IO renames Ada.Text_IO;
  package Command_Line renames Ada.Command_Line;

  -- generic types
  -- type generic_t is new Integer;
  -- type generic_access_t is access all generic_t;

  -- package instantiations

  -- type names
  SDL_Audio_CVT_Access_t : aliased String := "SDL.Audio.CVT_Access_t";
  SDL_Audio_CVT_t : aliased String := "SDL.Audio.CVT_t";
  SDL_Audio_Spec_Access_t : aliased String := "SDL.Audio.Spec_Access_t";
  SDL_Audio_Spec_t : aliased String := "SDL.Audio.Spec_t";
  SDL_Audio_Status_t : aliased String := "SDL.Audio.Status_t";
  SDL_Error_Code_t : aliased String := "SDL.Error.Code_t";
  SDL_Events_Action_t : aliased String := "SDL.Events.Action_t";
  SDL_Events_Active_Event_Access_t : aliased String := "SDL.Events.Active_Event_Access_t";
  SDL_Events_Active_Event_t : aliased String := "SDL.Events.Active_Event_t";
  SDL_Events_Event_Access_t : aliased String := "SDL.Events.Event_Access_t";
  SDL_Events_Event_t : aliased String := "SDL.Events.Event_t";
  SDL_Events_Filter_t : aliased String := "SDL.Events.Filter_t";
  SDL_Events_Joy_Axis_Event_Access_t : aliased String := "SDL.Events.Joy_Axis_Event_Access_t";
  SDL_Events_Joy_Axis_Event_t : aliased String := "SDL.Events.Joy_Axis_Event_t";
  SDL_Events_Joy_Ball_Event_Access_t : aliased String := "SDL.Events.Joy_Ball_Event_Access_t";
  SDL_Events_Joy_Ball_Event_t : aliased String := "SDL.Events.Joy_Ball_Event_t";
  SDL_Events_Joy_Button_Event_Access_t : aliased String := "SDL.Events.Joy_Button_Event_Access_t";
  SDL_Events_Joy_Button_Event_t : aliased String := "SDL.Events.Joy_Button_Event_t";
  SDL_Events_Joy_Hat_Event_Access_t : aliased String := "SDL.Events.Joy_Hat_Event_Access_t";
  SDL_Events_Joy_Hat_Event_t : aliased String := "SDL.Events.Joy_Hat_Event_t";
  SDL_Events_Keyboard_Event_Access_t : aliased String := "SDL.Events.Keyboard_Event_Access_t";
  SDL_Events_Keyboard_Event_t : aliased String := "SDL.Events.Keyboard_Event_t";
  SDL_Events_Mask_t : aliased String := "SDL.Events.Mask_t";
  SDL_Events_Mouse_Button_Event_Access_t : aliased String := "SDL.Events.Mouse_Button_Event_Access_t";
  SDL_Events_Mouse_Button_Event_t : aliased String := "SDL.Events.Mouse_Button_Event_t";
  SDL_Events_Mouse_Motion_Event_Access_t : aliased String := "SDL.Events.Mouse_Motion_Event_Access_t";
  SDL_Events_Mouse_Motion_Event_t : aliased String := "SDL.Events.Mouse_Motion_Event_t";
  SDL_Events_Quit_Event_Access_t : aliased String := "SDL.Events.Quit_Event_Access_t";
  SDL_Events_Quit_Event_t : aliased String := "SDL.Events.Quit_Event_t";
  SDL_Events_Resize_Event_Access_t : aliased String := "SDL.Events.Resize_Event_Access_t";
  SDL_Events_Resize_Event_t : aliased String := "SDL.Events.Resize_Event_t";
  SDL_Events_Sys_WM_Event_Access_t : aliased String := "SDL.Events.Sys_WM_Event_Access_t";
  SDL_Events_Sys_WM_Event_t : aliased String := "SDL.Events.Sys_WM_Event_t";
  SDL_Events_Sys_WM_Message_Access_t : aliased String := "SDL.Events.Sys_WM_Message_Access_t";
  SDL_Events_Type_t : aliased String := "SDL.Events.Type_t";
  SDL_Events_User_Event_Access_t : aliased String := "SDL.Events.User_Event_Access_t";
  SDL_Events_User_Event_t : aliased String := "SDL.Events.User_Event_t";
  SDL_Joystick_Joystick_Access_t : aliased String := "SDL.Joystick.Joystick_Access_t";
  SDL_Keyboard_Keysym_Const_Access_t : aliased String := "SDL.Keyboard.Keysym_Const_Access_t";
  SDL_Keyboard_Keysym_Access_t : aliased String := "SDL.Keyboard.Keysym_Access_t";
  SDL_Keyboard_Keysym_t : aliased String := "SDL.Keyboard.Keysym_t";
  SDL_Keysym_Key_t : aliased String := "SDL.Keysym.Key_t";
  SDL_Keysym_ModKey_t : aliased String := "SDL.Keysym.ModKey_t";
  SDL_Mouse_Cursor_Access_t : aliased String := "SDL.Mouse.Cursor_Access_t";
  SDL_Mouse_Cursor_t : aliased String := "SDL.Mouse.Cursor_t";
  SDL_RWops_RWops_t : aliased String := "SDL.RWops.RWops_t";
  SDL_Timer_Add_Timer_Callback_t : aliased String := "SDL.Timer.Add_Timer_Callback_t";
  SDL_Timer_ID_t : aliased String := "SDL.Timer.ID_t";
  SDL_Timer_Set_Timer_Callback_t : aliased String := "SDL.Timer.Set_Timer_Callback_t";
  SDL_Video_Color_Access_t : aliased String := "SDL.Video.Color_Access_t";
  SDL_Video_Color_t : aliased String := "SDL.Video.Color_t";
  SDL_Video_Palette_Access_t : aliased String := "SDL.Video.Palette_Access_t";
  SDL_Video_Palette_t : aliased String := "SDL.Video.Palette_t";
  SDL_Video_Pixel_Format_Access_t : aliased String := "SDL.Video.Pixel_Format_Access_t";
  SDL_Video_Pixel_Format_t : aliased String := "SDL.Video.Pixel_Format_t";
  SDL_Video_Rect_Access_t : aliased String := "SDL.Video.Rect_Access_t";
  SDL_Video_Rect_t : aliased String := "SDL.Video.Rect_t";
  SDL_Video_Surface_Access_t : aliased String := "SDL.Video.Surface_Access_t";
  SDL_Video_Surface_t : aliased String := "SDL.Video.Surface_t";
  SDL_Video_Video_Info_Access_t : aliased String := "SDL.Video.Video_Info_Access_t";
  SDL_Video_Video_Info_t : aliased String := "SDL.Video.Video_Info_t";

  type Type_t is record
    Name : access String;
    Size : Natural;
  end record;
  type Type_Lookup_t is array (Natural range <>) of Type_t;

  Types : aliased constant Type_Lookup_t := (
    (SDL_Audio_CVT_Access_t'Access, SDL.Audio.CVT_Access_t'Size),
    (SDL_Audio_CVT_t'Access, SDL.Audio.CVT_t'Size),
    (SDL_Audio_Spec_Access_t'Access, SDL.Audio.Spec_Access_t'Size),
    (SDL_Audio_Spec_t'Access, SDL.Audio.Spec_t'Size),
    (SDL_Audio_Status_t'Access, SDL.Audio.Status_t'Size),
    (SDL_Error_Code_t'Access, SDL.Error.Code_t'Size),
    (SDL_Events_Action_t'Access, SDL.Events.Action_t'Size),
    (SDL_Events_Active_Event_Access_t'Access, SDL.Events.Active_Event_Access_t'Size),
    (SDL_Events_Active_Event_t'Access, SDL.Events.Active_Event_t'Size),
    (SDL_Events_Event_Access_t'Access, SDL.Events.Event_Access_t'Size),
    (SDL_Events_Event_t'Access, SDL.Events.Event_t'Size),
    (SDL_Events_Filter_t'Access, SDL.Events.Filter_t'Size),
    (SDL_Events_Joy_Axis_Event_Access_t'Access, SDL.Events.Joy_Axis_Event_Access_t'Size),
    (SDL_Events_Joy_Axis_Event_t'Access, SDL.Events.Joy_Axis_Event_t'Size),
    (SDL_Events_Joy_Ball_Event_Access_t'Access, SDL.Events.Joy_Ball_Event_Access_t'Size),
    (SDL_Events_Joy_Ball_Event_t'Access, SDL.Events.Joy_Ball_Event_t'Size),
    (SDL_Events_Joy_Button_Event_Access_t'Access, SDL.Events.Joy_Button_Event_Access_t'Size),
    (SDL_Events_Joy_Button_Event_t'Access, SDL.Events.Joy_Button_Event_t'Size),
    (SDL_Events_Joy_Hat_Event_Access_t'Access, SDL.Events.Joy_Hat_Event_Access_t'Size),
    (SDL_Events_Joy_Hat_Event_t'Access, SDL.Events.Joy_Hat_Event_t'Size),
    (SDL_Events_Keyboard_Event_Access_t'Access, SDL.Events.Keyboard_Event_Access_t'Size),
    (SDL_Events_Keyboard_Event_t'Access, SDL.Events.Keyboard_Event_t'Size),
    (SDL_Events_Mask_t'Access, SDL.Events.Mask_t'Size),
    (SDL_Events_Mouse_Button_Event_Access_t'Access, SDL.Events.Mouse_Button_Event_Access_t'Size),
    (SDL_Events_Mouse_Button_Event_t'Access, SDL.Events.Mouse_Button_Event_t'Size),
    (SDL_Events_Mouse_Motion_Event_Access_t'Access, SDL.Events.Mouse_Motion_Event_Access_t'Size),
    (SDL_Events_Mouse_Motion_Event_t'Access, SDL.Events.Mouse_Motion_Event_t'Size),
    (SDL_Events_Quit_Event_Access_t'Access, SDL.Events.Quit_Event_Access_t'Size),
    (SDL_Events_Quit_Event_t'Access, SDL.Events.Quit_Event_t'Size),
    (SDL_Events_Resize_Event_Access_t'Access, SDL.Events.Resize_Event_Access_t'Size),
    (SDL_Events_Resize_Event_t'Access, SDL.Events.Resize_Event_t'Size),
    (SDL_Events_Sys_WM_Event_Access_t'Access, SDL.Events.Sys_WM_Event_Access_t'Size),
    (SDL_Events_Sys_WM_Event_t'Access, SDL.Events.Sys_WM_Event_t'Size),
    (SDL_Events_Sys_WM_Message_Access_t'Access, SDL.Events.Sys_WM_Message_Access_t'Size),
    (SDL_Events_Type_t'Access, SDL.Events.Type_t'Size),
    (SDL_Events_User_Event_Access_t'Access, SDL.Events.User_Event_Access_t'Size),
    (SDL_Events_User_Event_t'Access, SDL.Events.User_Event_t'Size),
    (SDL_Joystick_Joystick_Access_t'Access, SDL.Joystick.Joystick_Access_t'Size),
    (SDL_Keyboard_Keysym_Const_Access_t'Access, SDL.Keyboard.Keysym_Const_Access_t'Size),
    (SDL_Keyboard_Keysym_Access_t'Access, SDL.Keyboard.Keysym_Access_t'Size),
    (SDL_Keyboard_Keysym_t'Access, SDL.Keyboard.Keysym_t'Size),
    (SDL_Keysym_Key_t'Access, SDL.Keysym.Key_t'Size),
    (SDL_Keysym_ModKey_t'Access, SDL.Keysym.ModKey_t'Size),
    (SDL_Mouse_Cursor_Access_t'Access, SDL.Mouse.Cursor_Access_t'Size),
    (SDL_Mouse_Cursor_t'Access, SDL.Mouse.Cursor_t'Size),
    (SDL_RWops_RWops_t'Access, SDL.RWops.RWops_t'Size),
    (SDL_Timer_Add_Timer_Callback_t'Access, SDL.Timer.Add_Timer_Callback_t'Size),
    (SDL_Timer_ID_t'Access, SDL.Timer.ID_t'Size),
    (SDL_Timer_Set_Timer_Callback_t'Access, SDL.Timer.Set_Timer_Callback_t'Size),
    (SDL_Video_Color_Access_t'Access, SDL.Video.Color_Access_t'Size),
    (SDL_Video_Color_t'Access, SDL.Video.Color_t'Size),
    (SDL_Video_Palette_Access_t'Access, SDL.Video.Palette_Access_t'Size),
    (SDL_Video_Palette_t'Access, SDL.Video.Palette_t'Size),
    (SDL_Video_Pixel_Format_Access_t'Access, SDL.Video.Pixel_Format_Access_t'Size),
    (SDL_Video_Pixel_Format_t'Access, SDL.Video.Pixel_Format_t'Size),
    (SDL_Video_Rect_Access_t'Access, SDL.Video.Rect_Access_t'Size),
    (SDL_Video_Rect_t'Access, SDL.Video.Rect_t'Size),
    (SDL_Video_Surface_Access_t'Access, SDL.Video.Surface_Access_t'Size),
    (SDL_Video_Surface_t'Access, SDL.Video.Surface_t'Size),
    (SDL_Video_Video_Info_Access_t'Access, SDL.Video.Video_Info_Access_t'Size),
    (SDL_Video_Video_Info_t'Access, SDL.Video.Video_Info_t'Size)
  );

  procedure Find (Name : String) is
  begin
    for Index in Types'Range loop
      if Types (Index).Name.all = Name then
        IO.Put_Line (Natural'Image (Types (Index).Size));
        return;
      end if;
    end loop;
    raise Program_Error with "fatal: unknown ada type";
  end Find;

begin
  if Command_Line.Argument_Count /= 1 then
    raise Program_Error with "fatal: incorrect number of args";
  end if;
  Find (Command_Line.Argument (1));
end Ada_Size;
