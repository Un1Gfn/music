#include <assert.h>
#include <limits.h>
#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
#include <wctype.h>
#include <stdbool.h>

#include "tb.h"

int main(){

  wint_t wc=0;
  bool breakword=false;

  static_assert(16==MB_LEN_MAX);
  assert(setlocale(LC_ALL,"ko_KR.UTF-8"));
  assert(6==MB_CUR_MAX);

  const wint_t *const split=L"------ -------- ------- ---------------------";
  wprintf(L"%ls\n", split);
  wprintf(L"    #   UTF-32    DEC    glyph \n");
  wprintf(L"%ls\n", split);

  for(int i=1; 1; ++i){
    wc=getwchar();
    // printf("%d\n", wc);
    if(WEOF==wc){
      assert(feof(stdin));
      break;
    }else{

      assert(1000>=i);
      wprintf(L" ");
      wprintf(L"%4d   ", i);

      assert(0x0001<=wc&&wc<=0xFFFF);
      _Static_assert(65535==0xFFFF, "");
      wprintf(L"0x%04X   %5d   ", wc, wc);

      // wctype_t chk=wctype("print");
      #define INDT "               "

      if(tb_issyllable(wc)){
        // if(!breakword)
        //   wprintf("-");
        breakword=false;
        tb_romanize(wc);
      }else{
        breakword=true;
        tb_previous_ending_consonant=empty; // ="";
        if(L'\n'==wc)
          wprintf(L""INDT"(\\n)");
        else if(L' '==wc)
          wprintf(L""INDT"( )");
        else if(33<=wc&&wc<=126)
            wprintf(L""INDT"(%lc)", wc);
      }

      wprintf(L"\n");

    }
  }

  wprintf(L"%ls\n", split);

  return 0;

}
