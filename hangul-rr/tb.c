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

void tb_emit(const int cFprev, const int cI, const int cM, const bool breakword){

    const char *rFp=tb_f[cFprev].r;
    const char *rI=tb_i[cI].r;
    const char *rM=tb_m[cM].r;
    fflush(stdout); assert(ILL!=rFp);

    // nosp
    {
      wprintf(L"%s", NE==rFp ? "" : rFp); // previous final
      wprintf(breakword?L"":L"-");
      wprintf(L"%s", IHT==rI ? (NE==rFp?"":rFp) : rI); // initial
    }

    // sp
    // {
    //   // ...
    // }

    wprintf(L"%s", rM); // medial

}

bool tb_issyllable(const wint_t wc){
  return (0xAC00<=wc&&wc<=0xD7AF);
}
