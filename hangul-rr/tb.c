// #include <stdbool.h>
#include "tb.h"

const JR tb_i[]={
  { "g"  , L'ㄱ' },
  { "kk" , L'ㄲ' },
  { "n"  , L'ㄴ' },
  { "d"  , L'ㄷ' },
  { "tt" , L'ㄸ' },
  { "r"  , L'ㄹ' },
  { "m"  , L'ㅁ' },
  { "b"  , L'ㅂ' },
  { "pp" , L'ㅃ' },
  { "s"  , L'ㅅ' },
  { "ss" , L'ㅆ' },
  { "."  , L'ㅇ' },
  { "j"  , L'ㅈ' },
  { "jj" , L'ㅉ' },
  { "ch" , L'ㅊ' },
  { "k"  , L'ㅋ' },
  { "t"  , L'ㅌ' },
  { "p"  , L'ㅍ' },
  { "h"  , L'ㅎ' }
};

const JR tb_m[]={
  { "a"   , L'ㅏ' },
  { "ae"  , L'ㅐ' },
  { "ya"  , L'ㅑ' },
  { "yae" , L'ㅒ' },
  { "eo"  , L'ㅓ' },
  { "e"   , L'ㅔ' },
  { "yeo" , L'ㅕ' },
  { "ye"  , L'ㅖ' },
  { "o"   , L'ㅗ' },
  { "wa"  , L'ㅘ' },
  { "wae" , L'ㅙ' },
  { "oe"  , L'ㅚ' },
  { "yo"  , L'ㅛ' },
  { "u"   , L'ㅜ' },
  { "wo"  , L'ㅝ' },
  { "we"  , L'ㅞ' },
  { "wi"  , L'ㅟ' },
  { "yu"  , L'ㅠ' },
  { "eu"  , L'ㅡ' },
  { "ui"  , L'ㅢ' },
  { "i"   , L'ㅣ' }
};

const JR tb_f[]={
  { "."  , L' ' },
  { "k"  , L'ㄱ' },
  { "k"  , L'ㄲ' },
  { "?"  , L'ㄳ' },
  { "n"  , L'ㄴ' },
  { "?"  , L'ㄵ' },
  { "?"  , L'ㄶ' },
  { "t"  , L'ㄷ' },
  { "l"  , L'ㄹ' },
  { "?"  , L'ㄺ' },
  { "?"  , L'ㄻ' },
  { "?"  , L'ㄼ' },
  { "?"  , L'ㄽ' },
  { "?"  , L'ㄾ' },
  { "?"  , L'ㄿ' },
  { "?"  , L'ㅀ' },
  { "m"  , L'ㅁ' },
  { "p"  , L'ㅂ' },
  { "?"  , L'ㅄ' },
  { "t"  , L'ㅅ' },
  { "t"  , L'ㅆ' },
  { "ng" , L'ㅇ' },
  { "t"  , L'ㅈ' },
  { "t"  , L'ㅊ' },
  { "k"  , L'ㅋ' },
  { "t"  , L'ㅌ' },
  { "p"  , L'ㅍ' },
  { "t"  , L'ㅎ' }
};

_Static_assert(TB_I_N+1==sizeof(tb_i)/sizeof(JR), "");
_Static_assert(TB_M_N+1==sizeof(tb_m)/sizeof(JR), "");
_Static_assert(TB_F_N+1==sizeof(tb_f)/sizeof(JR), "");

// bool 
