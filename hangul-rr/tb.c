#include <assert.h>
#include <stdio.h>

#include "tb.h"

// no final consonant, CV instead of CVC
#define NE  (void*)0

// initial consonant inherits final consonant pf revious syllable
#define IHT (void*)-1

// obselete consonant
#define ILL (void*)-2

const TB tb_i[]={
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
  { IHT  , L'ㅇ' },
  { "j"  , L'ㅈ' },
  { "jj" , L'ㅉ' },
  { "ch" , L'ㅊ' },
  { "k"  , L'ㅋ' },
  { "t"  , L'ㅌ' },
  { "p"  , L'ㅍ' },
  { "h"  , L'ㅎ' }
};

const TB tb_m[]={
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

const TB tb_f[]={
  { NE   , L'\0' },
  { "k"  , L'ㄱ' },
  { "k"  , L'ㄲ' },
  { ILL  , L'ㄳ' },
  { "n"  , L'ㄴ' },
  { ILL  , L'ㄵ' },
  { ILL  , L'ㄶ' },
  { "t"  , L'ㄷ' },
  { "l"  , L'ㄹ' },
  { ILL  , L'ㄺ' },
  { ILL  , L'ㄻ' },
  { ILL  , L'ㄼ' },
  { ILL  , L'ㄽ' },
  { ILL  , L'ㄾ' },
  { ILL  , L'ㄿ' },
  { "lt" , L'ㅀ' }, // I:rh F:lt
  { "m"  , L'ㅁ' },
  { "p"  , L'ㅂ' },
  { "ps" , L'ㅄ' }, // I:bs F:pt // https://en.wiktionary.org/wiki/%E3%85%84
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

_Static_assert(TB_I_N+1==sizeof(tb_i)/sizeof(TB), "");
_Static_assert(TB_M_N+1==sizeof(tb_m)/sizeof(TB), "");
_Static_assert(TB_F_N+1==sizeof(tb_f)/sizeof(TB), "");

const char *const empty="";
const char *tb_previous_ending_consonant=empty;
void tb_romanize(const wint_t hangul){

  wint_t initial=0, medial=0, final=0;

  assert(tb_issyllable(hangul));

  final=hangul-44032;
  initial=final/588; final%=588;
  medial=final/28; final%=28;

  assert(hangul == initial*588 + medial*28 + final + 44032);

  // wprintf(L"%lc   ", hangul);
  // wprintf(L"%2d %2d %2d ", initial, medial, final);
  // fflush(stdout);

  /*if(NE!=tb_f[final].r){
    wprintf(L"%lc%lc%lc ", tb_i[initial].j, tb_m[medial].j, tb_f[final].j);
    // wprintf(L"%s%s%s ", tb_i[initial].r, tb_m[medial].r, tb_f[final].r);
  }else{
    wprintf(L"%lc%lc ", tb_i[initial].j, tb_m[medial].j);
    // wprintf(L"%s%s ", tb_i[initial].r, tb_m[medial].r);
  }*/

  {

    const char *ir=tb_i[initial].r;
    const char *mr=tb_m[medial].r;
    const char *fr=tb_f[final].r;
    fflush(stdout); assert(ILL!=fr);

    // initial
    if(IHT==tb_i[initial].r) wprintf(L"%s", tb_previous_ending_consonant);
    else                     wprintf(L"%s", ir);

    // medial
    wprintf(L"%s", mr);

    // final
    if(NE!=tb_f[final].r){
      wprintf(L"%s", fr);
      tb_previous_ending_consonant=fr;
    }

  }

  // wprintf(L" ");

  fflush(stdout);
  assert(initial<=TB_I_N);
  assert(medial<=TB_M_N);
  assert(final<=TB_F_N);

}

bool tb_issyllable(const wint_t wc){
  return (0xAC00<=wc&&wc<=0xD7AF);
}
