package sdl.keysym is

  type key_t is new c.int;
  type modkey_t is new uint32_t;
  pragma convention (c, key_t);
  pragma convention (c, modkey_t);

  k_unknown    : constant key_t := 0;
  k_first      : constant key_t := 0;
  k_backspace  : constant key_t := 8;
  k_tab        : constant key_t := 9;
  k_clear      : constant key_t := 12;
  k_return     : constant key_t := 13;
  k_pause      : constant key_t := 19;
  k_escape     : constant key_t := 27;
  k_space      : constant key_t := 32;
  k_exclaim    : constant key_t := 33;
  k_quotedbl   : constant key_t := 34;
  k_hash       : constant key_t := 35;
  k_dollar     : constant key_t := 36;
  k_ampersand  : constant key_t := 38;
  k_quote      : constant key_t := 39;
  k_leftparen  : constant key_t := 40;
  k_rightparen : constant key_t := 41;
  k_asterisk   : constant key_t := 42;
  k_plus       : constant key_t := 43;
  k_comma      : constant key_t := 44;
  k_minus      : constant key_t := 45;
  k_period     : constant key_t := 46;
  k_slash      : constant key_t := 47;
  k_0          : constant key_t := 48;
  k_1          : constant key_t := 49;
  k_2          : constant key_t := 50;
  k_3          : constant key_t := 51;
  k_4          : constant key_t := 52;
  k_5          : constant key_t := 53;
  k_6          : constant key_t := 54;
  k_7          : constant key_t := 55;
  k_8          : constant key_t := 56;
  k_9          : constant key_t := 57;
  k_colon      : constant key_t := 58;
  k_semicolon  : constant key_t := 59;
  k_less       : constant key_t := 60;
  k_equals     : constant key_t := 61;
  k_greater    : constant key_t := 62;
  k_question   : constant key_t := 63;
  k_at         : constant key_t := 64;

  k_leftbracket  : constant key_t := 91;
  k_backslash    : constant key_t := 92;
  k_rightbracket : constant key_t := 93;
  k_caret        : constant key_t := 94;
  k_underscore   : constant key_t := 95;
  k_backquote    : constant key_t := 96;
  k_a            : constant key_t := 97;
  k_b            : constant key_t := 98;
  k_c            : constant key_t := 99;
  k_d            : constant key_t := 100;
  k_e            : constant key_t := 101;
  k_f            : constant key_t := 102;
  k_g            : constant key_t := 103;
  k_h            : constant key_t := 104;
  k_i            : constant key_t := 105;
  k_j            : constant key_t := 106;
  k_k            : constant key_t := 107;
  k_l            : constant key_t := 108;
  k_m            : constant key_t := 109;
  k_n            : constant key_t := 110;
  k_o            : constant key_t := 111;
  k_p            : constant key_t := 112;
  k_q            : constant key_t := 113;
  k_r            : constant key_t := 114;
  k_s            : constant key_t := 115;
  k_t            : constant key_t := 116;
  k_u            : constant key_t := 117;
  k_v            : constant key_t := 118;
  k_w            : constant key_t := 119;
  k_x            : constant key_t := 120;
  k_y            : constant key_t := 121;
  k_z            : constant key_t := 122;
  k_delete       : constant key_t := 127;

  k_world_0  : constant key_t := 160;
  k_world_1  : constant key_t := 161;
  k_world_2  : constant key_t := 162;
  k_world_3  : constant key_t := 163;
  k_world_4  : constant key_t := 164;
  k_world_5  : constant key_t := 165;
  k_world_6  : constant key_t := 166;
  k_world_7  : constant key_t := 167;
  k_world_8  : constant key_t := 168;
  k_world_9  : constant key_t := 169;
  k_world_10 : constant key_t := 170;
  k_world_11 : constant key_t := 171;
  k_world_12 : constant key_t := 172;
  k_world_13 : constant key_t := 173;
  k_world_14 : constant key_t := 174;
  k_world_15 : constant key_t := 175;
  k_world_16 : constant key_t := 176;
  k_world_17 : constant key_t := 177;
  k_world_18 : constant key_t := 178;
  k_world_19 : constant key_t := 179;
  k_world_20 : constant key_t := 180;
  k_world_21 : constant key_t := 181;
  k_world_22 : constant key_t := 182;
  k_world_23 : constant key_t := 183;
  k_world_24 : constant key_t := 184;
  k_world_25 : constant key_t := 185;
  k_world_26 : constant key_t := 186;
  k_world_27 : constant key_t := 187;
  k_world_28 : constant key_t := 188;
  k_world_29 : constant key_t := 189;
  k_world_30 : constant key_t := 190;
  k_world_31 : constant key_t := 191;
  k_world_32 : constant key_t := 192;
  k_world_33 : constant key_t := 193;
  k_world_34 : constant key_t := 194;
  k_world_35 : constant key_t := 195;
  k_world_36 : constant key_t := 196;
  k_world_37 : constant key_t := 197;
  k_world_38 : constant key_t := 198;
  k_world_39 : constant key_t := 199;
  k_world_40 : constant key_t := 200;
  k_world_41 : constant key_t := 201;
  k_world_42 : constant key_t := 202;
  k_world_43 : constant key_t := 203;
  k_world_44 : constant key_t := 204;
  k_world_45 : constant key_t := 205;
  k_world_46 : constant key_t := 206;
  k_world_47 : constant key_t := 207;
  k_world_48 : constant key_t := 208;
  k_world_49 : constant key_t := 209;
  k_world_50 : constant key_t := 210;
  k_world_51 : constant key_t := 211;
  k_world_52 : constant key_t := 212;
  k_world_53 : constant key_t := 213;
  k_world_54 : constant key_t := 214;
  k_world_55 : constant key_t := 215;
  k_world_56 : constant key_t := 216;
  k_world_57 : constant key_t := 217;
  k_world_58 : constant key_t := 218;
  k_world_59 : constant key_t := 219;
  k_world_60 : constant key_t := 220;
  k_world_61 : constant key_t := 221;
  k_world_62 : constant key_t := 222;
  k_world_63 : constant key_t := 223;
  k_world_64 : constant key_t := 224;
  k_world_65 : constant key_t := 225;
  k_world_66 : constant key_t := 226;
  k_world_67 : constant key_t := 227;
  k_world_68 : constant key_t := 228;
  k_world_69 : constant key_t := 229;
  k_world_70 : constant key_t := 230;
  k_world_71 : constant key_t := 231;
  k_world_72 : constant key_t := 232;
  k_world_73 : constant key_t := 233;
  k_world_74 : constant key_t := 234;
  k_world_75 : constant key_t := 235;
  k_world_76 : constant key_t := 236;
  k_world_77 : constant key_t := 237;
  k_world_78 : constant key_t := 238;
  k_world_79 : constant key_t := 239;
  k_world_80 : constant key_t := 240;
  k_world_81 : constant key_t := 241;
  k_world_82 : constant key_t := 242;
  k_world_83 : constant key_t := 243;
  k_world_84 : constant key_t := 244;
  k_world_85 : constant key_t := 245;
  k_world_86 : constant key_t := 246;
  k_world_87 : constant key_t := 247;
  k_world_88 : constant key_t := 248;
  k_world_89 : constant key_t := 249;
  k_world_90 : constant key_t := 250;
  k_world_91 : constant key_t := 251;
  k_world_92 : constant key_t := 252;
  k_world_93 : constant key_t := 253;
  k_world_94 : constant key_t := 254;
  k_world_95 : constant key_t := 255;

  k_kp0         : constant key_t := 256;
  k_kp1         : constant key_t := 257;
  k_kp2         : constant key_t := 258;
  k_kp3         : constant key_t := 259;
  k_kp4         : constant key_t := 260;
  k_kp5         : constant key_t := 261;
  k_kp6         : constant key_t := 262;
  k_kp7         : constant key_t := 263;
  k_kp8         : constant key_t := 264;
  k_kp9         : constant key_t := 265;
  k_kp_period   : constant key_t := 266;
  k_kp_divide   : constant key_t := 267;
  k_kp_multiply : constant key_t := 268;
  k_kp_minus    : constant key_t := 269;
  k_kp_plus     : constant key_t := 270;
  k_kp_enter    : constant key_t := 271;
  k_kp_equals   : constant key_t := 272;

  k_up       : constant key_t := 273;
  k_down     : constant key_t := 274;
  k_right    : constant key_t := 275;
  k_left     : constant key_t := 276;
  k_insert   : constant key_t := 277;
  k_home     : constant key_t := 278;
  k_end      : constant key_t := 279;
  k_pageup   : constant key_t := 280;
  k_pagedown : constant key_t := 281;

  k_f1  : constant key_t := 282;
  k_f2  : constant key_t := 283;
  k_f3  : constant key_t := 284;
  k_f4  : constant key_t := 285;
  k_f5  : constant key_t := 286;
  k_f6  : constant key_t := 287;
  k_f7  : constant key_t := 288;
  k_f8  : constant key_t := 289;
  k_f9  : constant key_t := 290;
  k_f10 : constant key_t := 291;
  k_f11 : constant key_t := 292;
  k_f12 : constant key_t := 293;
  k_f13 : constant key_t := 294;
  k_f14 : constant key_t := 295;
  k_f15 : constant key_t := 296;

  k_numlock   : constant key_t := 300;
  k_capslock  : constant key_t := 301;
  k_scrollock : constant key_t := 302;
  k_rshift    : constant key_t := 303;
  k_lshift    : constant key_t := 304;
  k_rctrl     : constant key_t := 305;
  k_lctrl     : constant key_t := 306;
  k_ralt      : constant key_t := 307;
  k_lalt      : constant key_t := 308;
  k_rmeta     : constant key_t := 309;
  k_lmeta     : constant key_t := 310;
  k_lsuper    : constant key_t := 311;
  k_rsuper    : constant key_t := 312;
  k_mode      : constant key_t := 313;
  k_compose   : constant key_t := 314;

  k_help   : constant key_t := 315;
  k_print  : constant key_t := 316;
  k_sysreq : constant key_t := 317;
  k_break  : constant key_t := 318;
  k_menu   : constant key_t := 319;
  k_power  : constant key_t := 320;
  k_euro   : constant key_t := 321;
  k_last   : constant key_t := 322;

  kmod_none     : constant modkey_t := 16#0000#;
  kmod_lshift   : constant modkey_t := 16#0001#;
  kmod_rshift   : constant modkey_t := 16#0002#;
  kmod_lctrl    : constant modkey_t := 16#0040#;
  kmod_rctrl    : constant modkey_t := 16#0080#;
  kmod_lalt     : constant modkey_t := 16#0100#;
  kmod_ralt     : constant modkey_t := 16#0200#;
  kmod_lmeta    : constant modkey_t := 16#0400#;
  kmod_rmeta    : constant modkey_t := 16#0800#;
  kmod_num      : constant modkey_t := 16#1000#;
  kmod_caps     : constant modkey_t := 16#2000#;
  kmod_mode     : constant modkey_t := 16#4000#;
  kmod_reserved : constant modkey_t := 16#8000#;

  kmod_ctrl  : constant modkey_t := (kmod_lctrl or kmod_rctrl);
  kmod_shift : constant modkey_t := (kmod_lshift or kmod_rshift);
  kmod_alt   : constant modkey_t := (kmod_lalt or kmod_ralt);
  kmod_meta  : constant modkey_t := (kmod_lmeta or kmod_rmeta);

end sdl.keysym;
