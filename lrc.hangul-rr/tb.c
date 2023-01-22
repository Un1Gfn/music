#include <assert.h>
#include <stdio.h>
#include <unistd.h>

#include "tb.h"
#include "sp.h"

// #define CONNECT L"."
// #define CONNECT L"-"
#define CONNECT L"_"

#define NE (void*)0   // no final consonant, CV instead of CVC
#define IHT (void*)-1 // initial consonant inherits final consonant pf revious syllable
#define ILL (void*)-2 // obselete consonant

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

const TBB tb_f[]={
  {NE   , NE   , L'\0'},
  {"g"  , "k"  , L'ㄱ'},
  {"kk" , "k"  , L'ㄲ'},
  {ILL  , ILL  , L'ㄳ'},
  {"n"  , "n"  , L'ㄴ'},
  {ILL  , ILL  , L'ㄵ'},
  {ILL  , "nh" , L'ㄶ'},
  {"d"  , "t"  , L'ㄷ'},
  {"r"  , "l"  , L'ㄹ'},
  {ILL  , ILL  , L'ㄺ'},
  {ILL  , ILL  , L'ㄻ'},
  {ILL  , ILL  , L'ㄼ'},
  {ILL  , ILL  , L'ㄽ'},
  {ILL  , ILL  , L'ㄾ'},
  {ILL  , ILL  , L'ㄿ'},
  {"rh" , "lt" , L'ㅀ'}, // I:rh F:lt
  {"m"  , "m"  , L'ㅁ'},
  {"b"  , "p"  , L'ㅂ'},
  {"ps" , "ps" , L'ㅄ'}, // I:bs F:pt // https://en.wiktionary.org/wiki/%E3%85%84
  {"s"  , "t"  , L'ㅅ'},
  {"ss" , "t"  , L'ㅆ'},
  {"ng" , "ng" , L'ㅇ'},
  {"j"  , "t"  , L'ㅈ'},
  {"ch" , "t"  , L'ㅊ'},
  {"k"  , "k"  , L'ㅋ'},
  {"t"  , "t"  , L'ㅌ'},
  {"p"  , "p"  , L'ㅍ'},
  {"h"  , "t"  , L'ㅎ'}
};

_Static_assert(TB_I_N+1==sizeof(tb_i)/sizeof(TB), "");
_Static_assert(TB_M_N+1==sizeof(tb_m)/sizeof(TB), "");
_Static_assert(TBB_F_N+1==sizeof(tb_f)/sizeof(TBB), "");

void tb_emit(const int cFprev, const int cI, const int cM, const bool breakword){

    const char *rFp=tb_f[cFprev].rf;
    const char *rFp_iht_I=tb_f[cFprev].ri;
    const char *rI=tb_i[cI].r;
    fflush(stdout); assert(ILL!=rFp);

    #ifdef DEBUG_DISABLE_SP

    {
      wprintf(L"%s", (NE==rFp) ? "" : rFp);              // [cFprev]-cIcM
      wprintf(breakword ? L"" : CONNECT);                // cFprev[-]cIcM
      wprintf(L"%s", (IHT==rI) ? (NE==rFp?"":rFp) : rI); // cFprev-[cI]cM
    }

    #else

    {

      const SP *sp=sp_lk(cFprev,cI);

      // [cFprev]-cIcM
      #ifdef DEBUG_SYLLABLE_ELE
        wprintf(L"#");
      #endif
      wprintf(L"%s", (NE==rFp||IHT==rI) ? "" : (sp->x?sp->x:rFp));

      // cFprev[-]cIcM
      wprintf(breakword ? L"" : CONNECT);
      // wprintf(breakword ? L"" : CONNECT);

      // cFprev-[cI]cM
      #ifdef DEBUG_SYLLABLE_ELE
        wprintf(L"!");
      #endif
      if(IHT==rI){
        assert(!sp->x);
        wprintf(L"%s", (NE==rFp) ? "" : (sp->y?sp->y:rFp_iht_I));
      }else{
        wprintf(L"%s", sp->y ? sp->y : rI);
      }

    }

    #endif

    #ifdef DEBUG_SYLLABLE_ELE
      wprintf(L"@");
    #endif
    wprintf(L"%s", tb_m[cM].r); // cFprev-cI[cM]

    // fflush(stdout);lb:sleep(0);

}

bool tb_issyllable(const wint_t wc){
  return (0xAC00<=wc&&wc<=0xD7AF);
}
