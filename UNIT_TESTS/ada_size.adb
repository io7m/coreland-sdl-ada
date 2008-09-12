-- auto generated, do not edit

with ada.text_io;
with ada.command_line;

with SDL;
with sdl.audio;
with sdl.error;
with sdl.events;
with sdl.joystick;
with sdl.keyboard;
with sdl.keysym;
with sdl.mouse;
with sdl.rwops;
with sdl.timer;
with sdl.video;

procedure ada_size is
  package io renames ada.text_io;
  package cmdline renames ada.command_line;

  -- generic types
  -- type generic_t is new integer;
  -- type generic_access_t is access all generic_t;

  -- package instantiations

  -- type names
  sdl_audio_cvt_access_t : aliased string := "sdl.audio.cvt_access_t";
  sdl_audio_cvt_t : aliased string := "sdl.audio.cvt_t";
  sdl_audio_spec_access_t : aliased string := "sdl.audio.spec_access_t";
  sdl_audio_spec_t : aliased string := "sdl.audio.spec_t";
  sdl_audio_status_t : aliased string := "sdl.audio.status_t";
  sdl_error_code_t : aliased string := "sdl.error.code_t";
  sdl_events_action_t : aliased string := "sdl.events.action_t";
  sdl_events_active_event_access_t : aliased string := "sdl.events.active_event_access_t";
  sdl_events_active_event_t : aliased string := "sdl.events.active_event_t";
  sdl_events_event_access_t : aliased string := "sdl.events.event_access_t";
  sdl_events_event_t : aliased string := "sdl.events.event_t";
  sdl_events_filter_t : aliased string := "sdl.events.filter_t";
  sdl_events_joy_axis_event_access_t : aliased string := "sdl.events.joy_axis_event_access_t";
  sdl_events_joy_axis_event_t : aliased string := "sdl.events.joy_axis_event_t";
  sdl_events_joy_ball_event_access_t : aliased string := "sdl.events.joy_ball_event_access_t";
  sdl_events_joy_ball_event_t : aliased string := "sdl.events.joy_ball_event_t";
  sdl_events_joy_button_event_access_t : aliased string := "sdl.events.joy_button_event_access_t";
  sdl_events_joy_button_event_t : aliased string := "sdl.events.joy_button_event_t";
  sdl_events_joy_hat_event_access_t : aliased string := "sdl.events.joy_hat_event_access_t";
  sdl_events_joy_hat_event_t : aliased string := "sdl.events.joy_hat_event_t";
  sdl_events_keyboard_event_access_t : aliased string := "sdl.events.keyboard_event_access_t";
  sdl_events_keyboard_event_t : aliased string := "sdl.events.keyboard_event_t";
  sdl_events_mask_t : aliased string := "sdl.events.mask_t";
  sdl_events_mouse_button_event_access_t : aliased string := "sdl.events.mouse_button_event_access_t";
  sdl_events_mouse_button_event_t : aliased string := "sdl.events.mouse_button_event_t";
  sdl_events_mouse_motion_event_access_t : aliased string := "sdl.events.mouse_motion_event_access_t";
  sdl_events_mouse_motion_event_t : aliased string := "sdl.events.mouse_motion_event_t";
  sdl_events_quit_event_access_t : aliased string := "sdl.events.quit_event_access_t";
  sdl_events_quit_event_t : aliased string := "sdl.events.quit_event_t";
  sdl_events_resize_event_access_t : aliased string := "sdl.events.resize_event_access_t";
  sdl_events_resize_event_t : aliased string := "sdl.events.resize_event_t";
  sdl_events_sys_wm_event_access_t : aliased string := "sdl.events.sys_wm_event_access_t";
  sdl_events_sys_wm_event_t : aliased string := "sdl.events.sys_wm_event_t";
  sdl_events_sys_wm_msg_access_t : aliased string := "sdl.events.sys_wm_msg_access_t";
  sdl_events_type_t : aliased string := "sdl.events.type_t";
  sdl_events_user_event_access_t : aliased string := "sdl.events.user_event_access_t";
  sdl_events_user_event_t : aliased string := "sdl.events.user_event_t";
  sdl_joystick_joystick_access_t : aliased string := "sdl.joystick.joystick_access_t";
  sdl_keyboard_keysym_const_access_t : aliased string := "sdl.keyboard.keysym_const_access_t";
  sdl_keyboard_keysym_access_t : aliased string := "sdl.keyboard.keysym_access_t";
  sdl_keyboard_keysym_t : aliased string := "sdl.keyboard.keysym_t";
  sdl_keysym_key_t : aliased string := "sdl.keysym.key_t";
  sdl_keysym_modkey_t : aliased string := "sdl.keysym.modkey_t";
  sdl_mouse_cursor_access_t : aliased string := "sdl.mouse.cursor_access_t";
  sdl_mouse_cursor_t : aliased string := "sdl.mouse.cursor_t";
  sdl_rwops_rwops_t : aliased string := "sdl.rwops.rwops_t";
  sdl_timer_add_timer_callback_t : aliased string := "sdl.timer.add_timer_callback_t";
  sdl_timer_id_t : aliased string := "sdl.timer.id_t";
  sdl_timer_set_timer_callback_t : aliased string := "sdl.timer.set_timer_callback_t";
  sdl_video_color_access_t : aliased string := "sdl.video.color_access_t";
  sdl_video_color_t : aliased string := "sdl.video.color_t";
  sdl_video_palette_access_t : aliased string := "sdl.video.palette_access_t";
  sdl_video_palette_t : aliased string := "sdl.video.palette_t";
  sdl_video_pixel_format_access_t : aliased string := "sdl.video.pixel_format_access_t";
  sdl_video_pixel_format_t : aliased string := "sdl.video.pixel_format_t";
  sdl_video_rect_access_t : aliased string := "sdl.video.rect_access_t";
  sdl_video_rect_t : aliased string := "sdl.video.rect_t";
  sdl_video_surface_access_t : aliased string := "sdl.video.surface_access_t";
  sdl_video_surface_t : aliased string := "sdl.video.surface_t";
  sdl_video_video_info_access_t : aliased string := "sdl.video.video_info_access_t";
  sdl_video_video_info_t : aliased string := "sdl.video.video_info_t";

  type type_t is record
    name : access string;
    size : natural;
  end record;
  type type_lookup_t is array (natural range <>) of type_t;

  types : aliased constant type_lookup_t := (
    (sdl_audio_cvt_access_t'access, sdl.audio.cvt_access_t'size),
    (sdl_audio_cvt_t'access, sdl.audio.cvt_t'size),
    (sdl_audio_spec_access_t'access, sdl.audio.spec_access_t'size),
    (sdl_audio_spec_t'access, sdl.audio.spec_t'size),
    (sdl_audio_status_t'access, sdl.audio.status_t'size),
    (sdl_error_code_t'access, sdl.error.code_t'size),
    (sdl_events_action_t'access, sdl.events.action_t'size),
    (sdl_events_active_event_access_t'access, sdl.events.active_event_access_t'size),
    (sdl_events_active_event_t'access, sdl.events.active_event_t'size),
    (sdl_events_event_access_t'access, sdl.events.event_access_t'size),
    (sdl_events_event_t'access, sdl.events.event_t'size),
    (sdl_events_filter_t'access, sdl.events.filter_t'size),
    (sdl_events_joy_axis_event_access_t'access, sdl.events.joy_axis_event_access_t'size),
    (sdl_events_joy_axis_event_t'access, sdl.events.joy_axis_event_t'size),
    (sdl_events_joy_ball_event_access_t'access, sdl.events.joy_ball_event_access_t'size),
    (sdl_events_joy_ball_event_t'access, sdl.events.joy_ball_event_t'size),
    (sdl_events_joy_button_event_access_t'access, sdl.events.joy_button_event_access_t'size),
    (sdl_events_joy_button_event_t'access, sdl.events.joy_button_event_t'size),
    (sdl_events_joy_hat_event_access_t'access, sdl.events.joy_hat_event_access_t'size),
    (sdl_events_joy_hat_event_t'access, sdl.events.joy_hat_event_t'size),
    (sdl_events_keyboard_event_access_t'access, sdl.events.keyboard_event_access_t'size),
    (sdl_events_keyboard_event_t'access, sdl.events.keyboard_event_t'size),
    (sdl_events_mask_t'access, sdl.events.mask_t'size),
    (sdl_events_mouse_button_event_access_t'access, sdl.events.mouse_button_event_access_t'size),
    (sdl_events_mouse_button_event_t'access, sdl.events.mouse_button_event_t'size),
    (sdl_events_mouse_motion_event_access_t'access, sdl.events.mouse_motion_event_access_t'size),
    (sdl_events_mouse_motion_event_t'access, sdl.events.mouse_motion_event_t'size),
    (sdl_events_quit_event_access_t'access, sdl.events.quit_event_access_t'size),
    (sdl_events_quit_event_t'access, sdl.events.quit_event_t'size),
    (sdl_events_resize_event_access_t'access, sdl.events.resize_event_access_t'size),
    (sdl_events_resize_event_t'access, sdl.events.resize_event_t'size),
    (sdl_events_sys_wm_event_access_t'access, sdl.events.sys_wm_event_access_t'size),
    (sdl_events_sys_wm_event_t'access, sdl.events.sys_wm_event_t'size),
    (sdl_events_sys_wm_msg_access_t'access, sdl.events.sys_wm_msg_access_t'size),
    (sdl_events_type_t'access, sdl.events.type_t'size),
    (sdl_events_user_event_access_t'access, sdl.events.user_event_access_t'size),
    (sdl_events_user_event_t'access, sdl.events.user_event_t'size),
    (sdl_joystick_joystick_access_t'access, sdl.joystick.joystick_access_t'size),
    (sdl_keyboard_keysym_const_access_t'access, sdl.keyboard.keysym_const_access_t'size),
    (sdl_keyboard_keysym_access_t'access, sdl.keyboard.keysym_access_t'size),
    (sdl_keyboard_keysym_t'access, sdl.keyboard.keysym_t'size),
    (sdl_keysym_key_t'access, sdl.keysym.key_t'size),
    (sdl_keysym_modkey_t'access, sdl.keysym.modkey_t'size),
    (sdl_mouse_cursor_access_t'access, sdl.mouse.cursor_access_t'size),
    (sdl_mouse_cursor_t'access, sdl.mouse.cursor_t'size),
    (sdl_rwops_rwops_t'access, sdl.rwops.rwops_t'size),
    (sdl_timer_add_timer_callback_t'access, sdl.timer.add_timer_callback_t'size),
    (sdl_timer_id_t'access, sdl.timer.id_t'size),
    (sdl_timer_set_timer_callback_t'access, sdl.timer.set_timer_callback_t'size),
    (sdl_video_color_access_t'access, sdl.video.color_access_t'size),
    (sdl_video_color_t'access, sdl.video.color_t'size),
    (sdl_video_palette_access_t'access, sdl.video.palette_access_t'size),
    (sdl_video_palette_t'access, sdl.video.palette_t'size),
    (sdl_video_pixel_format_access_t'access, sdl.video.pixel_format_access_t'size),
    (sdl_video_pixel_format_t'access, sdl.video.pixel_format_t'size),
    (sdl_video_rect_access_t'access, sdl.video.rect_access_t'size),
    (sdl_video_rect_t'access, sdl.video.rect_t'size),
    (sdl_video_surface_access_t'access, sdl.video.surface_access_t'size),
    (sdl_video_surface_t'access, sdl.video.surface_t'size),
    (sdl_video_video_info_access_t'access, sdl.video.video_info_access_t'size),
    (sdl_video_video_info_t'access, sdl.video.video_info_t'size)
  );

  procedure find (name : string) is
  begin
    for index in types'range loop
      if types (index).name.all = name then
        io.put_line (natural'image (types (index).size));
        return;
      end if;
    end loop;
    raise program_error with "fatal: unknown ada type";
  end find;

begin
  if cmdline.argument_count /= 1 then
    raise program_error with "fatal: incorrect number of args";
  end if;
  find (cmdline.argument (1));
end ada_size;
