with Interfaces.C_Streams;
with Interfaces.C.Strings;

package SDL.RWops is
  package C_Streams renames Interfaces.C_Streams;
  package CS renames Interfaces.C.Strings;

  type Stdio_File_t is new C_Streams.FILEs;
  type RWops_t;
  type RWops_Access_t is access all RWops_t;

  type Seek_Callback_t is access function
   (Context    : RWops_Access_t;
    Off    : C.int;
    Whence : C.int)
  return     C.int;

  type Read_Callback_t is access function
   (Context    : RWops_Access_t;
    Ptr    : Void_Ptr_t;
    Size   : C.int;
    Maxnum : C.int)
  return     C.int;

  type Write_Callback_t is access function
   (Context  : RWops_Access_t;
    Ptr  : Void_Ptr_t;
    Size : C.int;
    Num  : C.int)
  return   C.int;

  type Close_Callback_t is access function (Context : RWops_Access_t) return C.int;

  pragma Convention (C, Seek_Callback_t);
  pragma Convention (C, Read_Callback_t);
  pragma Convention (C, Write_Callback_t);
  pragma Convention (C, Close_Callback_t);

  type Io_Stdio_t is record
    Auto_Close : C.int;
    Fp         : Stdio_File_t;
  end record;
  pragma Convention (C, Io_Stdio_t);

  type Io_Mem_t is record
    Base : Uint8_Ptr_t;
    Here : Uint8_Ptr_t;
    Stop : Uint8_Ptr_t;
  end record;
  pragma Convention (C, Io_Mem_t);

  type Io_Unknown_t is record
    Data : Void_Ptr_t;
  end record;
  pragma Convention (C, Io_Unknown_t);

  type Type_Selector is (T_Stdio, T_Mem, T_Unknown);
  type Io_Union_t (Selector : Type_Selector := T_Stdio) is record
    case Selector is
      when T_Stdio =>
        Stdio : Io_Stdio_t;
      when T_Mem =>
        Mem : Io_Mem_t;
      when T_Unknown =>
        Unknown : Io_Unknown_t;
    end case;
  end record;
  pragma Convention (C, Io_Union_t);
  pragma Unchecked_Union (Io_Union_t);

  type RWops_t is record
    Seek       : Seek_Callback_t;
    Read       : Read_Callback_t;
    Write      : Write_Callback_t;
    Close      : Close_Callback_t;
    Type_Union : Uint32_t;
    Hidden     : Io_Union_t;
  end record;
  pragma Convention (C, RWops_t);

  Seek_Set : constant C.int := 0;
  Seek_Cur : constant C.int := 1;
  Seek_End : constant C.int := 2;

  function RWFromFile (File : CS.chars_ptr; Mode : CS.chars_ptr) return RWops_Access_t;
  function RW_From_File (File : CS.chars_ptr; Mode : CS.chars_ptr) return RWops_Access_t renames RWFromFile;
  pragma Import (C, RWFromFile, "SDL_RWFromFile");

  function RWFromFile (File : String; Mode : String) return RWops_Access_t;
  function RW_From_File (File : String; Mode : String) return RWops_Access_t renames RWFromFile;
  pragma Inline (RWFromFile);

  function RWFromFP (File : Stdio_File_t; Auto_Close : C.int) return RWops_Access_t;
  function RW_From_Fp (File : Stdio_File_t; Auto_Close : C.int) return RWops_Access_t renames RWFromFP;
  pragma Import (C, RWFromFP, "SDL_RWFromFP");

  function RWFromMem (Mem : Void_Ptr_t; Size : C.int) return RWops_Access_t;
  function RW_From_Mem (Mem : Void_Ptr_t; Size : C.int) return RWops_Access_t renames RWFromMem;
  pragma Import (C, RWFromMem, "SDL_RWFromMem");

  function AllocRW return RWops_Access_t;
  function Alloc_RW return RWops_Access_t renames AllocRW;
  pragma Import (C, AllocRW, "SDL_AllocRW");

  procedure FreeRW (Area : RWops_Access_t);
  procedure Free_RW (Area : RWops_Access_t) renames FreeRW;
  pragma Import (C, FreeRW, "SDL_FreeRW");

  function RWSeek
   (Context    : RWops_Access_t;
    Offset : C.int;
    Whence : C.int)
    return   C.int;
  function RW_Seek
   (Context    : RWops_Access_t;
    Offset : C.int;
    Whence : C.int)
    return   C.int renames RWSeek;
  pragma Inline (RWSeek);

  function RWTell (Context : RWops_Access_t) return C.int;
  function RW_Tell (Context : RWops_Access_t) return C.int renames RWTell;
  pragma Inline (RWTell);

  function RWRead
   (Context  : RWops_Access_t;
    Ptr  : Void_Ptr_t;
    Size : C.int;
    Num  : C.int)
    return C.int;
  function RW_Read
   (Context  : RWops_Access_t;
    Ptr  : Void_Ptr_t;
    Size : C.int;
    Num  : C.int)
    return C.int renames RWRead;
  pragma Inline (RWRead);

  function RWWrite
   (Context : RWops_Access_t;
    Ptr     : Void_Ptr_t;
    Size    : C.int;
    Num     : C.int)
    return C.int;
  function RW_Write
   (Context  : RWops_Access_t;
    Ptr  : Void_Ptr_t;
    Size : C.int;
    Num  : C.int)
    return C.int renames RWWrite;
  pragma Inline (RWWrite);

  function RWClose (Context : RWops_Access_t) return C.int;
  function RW_Close (Context : RWops_Access_t) return C.int renames RWClose;
  pragma Inline (RWClose);

end SDL.RWops;
