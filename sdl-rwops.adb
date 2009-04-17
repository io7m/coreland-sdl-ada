package body SDL.RWops is

  function RWClose (Context : RWops_Access_t) return C.int is
  begin
    return Context.all.Close (Context);
  end RWClose;

  function RWRead
   (Context : RWops_Access_t;
    Ptr     : Void_Ptr_t;
    Size    : C.int;
    Num     : C.int) return C.int is
  begin
    return Context.all.Read (Context, Ptr, Size, Num);
  end RWRead;

  function RWSeek
   (Context : RWops_Access_t;
    Offset  : C.int;
    Whence  : C.int) return C.int is
  begin
    return Context.all.Seek (Context, Offset, Whence);
  end RWSeek;

  function RWTell (Context : RWops_Access_t) return C.int is
  begin
    return Context.all.Seek (Context, 0, C.int (C_Streams.SEEK_CUR));
  end RWTell;

  function RWWrite
   (Context : RWops_Access_t;
    Ptr     : Void_Ptr_t;
    Size    : C.int;
    Num     : C.int) return C.int is
  begin
    return Context.all.Write (Context, Ptr, Size, Num);
  end RWWrite;

  function RWFromFile
    (File : String;
     Mode : String) return RWops_Access_t
  is
    Ch_File : aliased C.char_array := C.To_C (File);
    Ch_Mode : aliased C.char_array := C.To_C (Mode);
  begin
    return RWFromFile (CS.To_Chars_Ptr (Ch_File'Unchecked_Access), CS.To_Chars_Ptr (Ch_Mode'Unchecked_Access));
  end RWFromFile;

end SDL.RWops;
