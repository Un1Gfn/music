#include <assert.h>
#include <stdio.h>
#include <unistd.h>

#include "tb.h"
#include "sp.h"

// no final consonant, CV instead of CVC
const char *const NE=(void*)0;

// initial consonant inherits final consonant pf revious syllable
const char *const IHT=(void*)-1;

// obselete consonant
const char *const ILL=(void*)-2;

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

#ifdef DISABLE_SP

    {
      wprintf(L"%s", NE==rFp ? "" : rFp);              // [cFprev]-cIcM
      wprintf(breakword?L"":L"-");                     // cFprev[-]cIcM
      wprintf(L"%s", IHT==rI ? (NE==rFp?"":rFp) : rI); // cFprev-[cI]cM
    }

#else

    {

      const SP *sp=sp_lk(cFprev,cI);

      // [cFprev]-cIcM
      // if(NE==rFp)wprintf(L"**");
      #ifdef SYLLABLE_ELE
        wprintf(L"#");
      #endif
      wprintf(L"%s", (NE==rFp||IHT==rI) ? "" : (sp->x?sp->x:rFp));

      // cFprev[-]cIcM
      wprintf(breakword?L"":L"-");

      // cFprev-[cI]cM
      #ifdef SYLLABLE_ELE
        wprintf(L"!");
      #endif
      if(IHT==rI){
        assert(!sp->x);
        // wprintf(L"!%s", sp->y ? sp->y : ((NE==rFp)?"":rFp));
        wprintf(L"%s", (NE==rFp) ? "" : (sp->y?sp->y:rFp));
      }else{
        wprintf(L"%s", sp->y ? sp->y : rI);
      }

    }

#endif

    #ifdef SYLLABLE_ELE
      wprintf(L"@");
    #endif
    wprintf(L"%s", rM); // cFprev-cI[cM]

    fflush(stdout);lb:sleep(0);

}

bool tb_issyllable(const wint_t wc){
  return (0xAC00<=wc&&wc<=0xD7AF);
}
