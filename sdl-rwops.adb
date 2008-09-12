package body sdl.rwops is

  function rwclose (ctx : rwops_access_t) return c.int is
  begin
    return ctx.close (ctx);
  end rwclose;

  function rwread
   (ctx  : rwops_access_t;
    ptr  : void_ptr_t;
    size : c.int;
    num  : c.int) return c.int is
  begin
    return ctx.read (ctx, ptr, size, num);
  end rwread;

  function rwseek
   (ctx    : rwops_access_t;
    offset : c.int;
    whence : c.int) return c.int is
  begin
    return ctx.seek (ctx, offset, whence);
  end rwseek;

  function rwtell (ctx : rwops_access_t) return c.int is
  begin
    return ctx.seek (ctx, 0, c.int (c_streams.SEEK_CUR));
  end rwtell;

  function rwwrite
   (ctx  : rwops_access_t;
    ptr  : void_ptr_t;
    size : c.int;
    num  : c.int) return c.int is
  begin
    return ctx.write (ctx, ptr, size, num);
  end rwwrite;

  function rwfromfile
   (file : string;
    mode : string) return rwops_access_t
  is
    ch_file : aliased c.char_array := c.To_C (file);
    ch_mode : aliased c.char_array := c.To_C (mode);
  begin
    return rwfromfile
     (cs.to_chars_ptr (ch_file'unchecked_access),
      cs.to_chars_ptr (ch_mode'unchecked_access));
  end rwfromfile;

end sdl.rwops;
