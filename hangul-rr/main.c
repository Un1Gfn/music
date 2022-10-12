#include <assert.h>
#include <limits.h>
#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
#include <wctype.h>
#include <stdbool.h>

#include "tb.h"

static inline void splithg(int *initial, int *medial, int *final, const wint_t hangul){
  (*final)=hangul-44032;
  (*initial)=(*final)/588; (*final)%=588;
  (*medial)=(*final)/28; (*final)%=28;
  assert(*initial<=TB_I_N);
  assert(*medial<=TB_M_N);
  assert(*final<=TB_F_N);
  assert((long long)hangul == (*initial)*588 + (*medial)*28 + (*final) + 44032);
}

int main(){

  // define
  wint_t wc=-1;
  int cFprev=-1, cI=-1, cM=-1, cF=-1;
  bool breakword=-1;

  static_assert(16==MB_LEN_MAX);
  assert(setlocale(LC_ALL,"ko_KR.UTF-8"));
  assert(6==MB_CUR_MAX);

  wprintf(L".\n");

  // init
  breakword=true;
  cFprev=0;

  while(WEOF!=(wc=getwchar())){

    if(!tb_issyllable(wc)){
      if((!breakword) && cFprev) wprintf(L"%s", tb_f[cFprev].r);
      breakword=true;
      cFprev=0;
      wprintf(L"%lc", wc);
      continue;
    }

    splithg(         /*-*/ &cI, &cM, &cF, /*-*/ wc);
    tb_emit( cFprev, /*-*/  cI,  cM,      breakword);
    breakword=false;
    cFprev=cF; cF=-1;

  }

  assert(feof(stdin));

  return 0;

}
