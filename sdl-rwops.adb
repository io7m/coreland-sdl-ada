package body SDL.rwops is

  function RWclose (ctx : rwops_ptr_t) return c.int is
  begin
     return ctx.close (ctx);
  end RWclose;

  function RWread
   (ctx  : rwops_ptr_t;
    ptr  : void_ptr_t;
    size : c.int;
    num  : c.int) return c.int is
  begin
     return ctx.read (ctx, ptr, size, num);
  end RWread;

  function RWSeek
   (ctx    : rwops_ptr_t;
    offset : c.int;
    whence : c.int) return c.int is
  begin
     return ctx.seek (ctx, offset, whence);
  end RWSeek;

  function RWtell (ctx : rwops_ptr_t) return c.int is
  begin
     return ctx.seek (ctx, 0, c.int (c_streams.seek_cur));
  end RWtell;

  function RWwrite
   (ctx  : rwops_ptr_t;
    ptr  : void_ptr_t;
    size : c.int;
    num  : c.int) return c.int is
  begin
     return ctx.write (ctx, ptr, size, num);
  end RWwrite;

  function RWFromFile
   (file : string;
    mode : string) return rwops_ptr_t
  is
    ch_file : aliased c.char_array := c.to_c (file);
    ch_mode : aliased c.char_array := c.to_c (mode);
  begin
     return RWFromFile
      (cs.to_chars_ptr (ch_file'unchecked_access),
       cs.to_chars_ptr (ch_mode'unchecked_access));
  end RWFromFile;

end SDL.rwops;
