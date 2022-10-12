#include <assert.h>
#include <limits.h>
#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
#include <wctype.h>

#include "tb.h"

int main(){

  wint_t wc=0;

  static_assert(16==MB_LEN_MAX);
  assert(setlocale(LC_ALL,"ko_KR.UTF-8"));
  assert(6==MB_CUR_MAX);

  const wint_t *const split=L"-------- ------- ---------------------";
  wprintf(L"%ls\n", split);
  wprintf(L" UTF-32    DEC    glyph \n");
  wprintf(L"%ls\n", split);

  for(;;){
    wc=getwchar();
    // printf("%d\n", wc);
    if(WEOF==wc){
      assert(feof(stdin));
      break;
    }else{

      // wprintf(L"(");

      wprintf(L" ");

      assert(0x0001<=wc&&wc<=0xFFFF);
      _Static_assert(65535==0xFFFF, "");
      wprintf(L"0x%04X   %5d   ", wc, wc);

      // wctype_t chk=wctype("print");
      #define INDT "               "
      if(L'\n'==wc)
        wprintf(L""INDT"(\\n)");
      else if(L' '==wc)
        wprintf(L""INDT"( )");
      else if(33<=wc&&wc<=126)
          wprintf(L""INDT"(%lc)", wc);
      else{
          wint_t initial=0, medial=0, final=0;
          assert(0xAC00<=wc&&wc<=0xD7AF);

          // wprintf(L"%lc %2d %2d %2d ", wc, initial, medial, final);
          final=wc-44032;
          // wprintf(L"%lc %2d %2d %2d ", wc, initial, medial, final);
          initial=final/588; final%=588;
          // wprintf(L"%lc %2d %2d %2d ", wc, initial, medial, final);
          medial=final/28; final%=28;
          assert(wc == initial*588 + medial*28 + final + 44032);
          wprintf(L"%lc   ", wc);
          // wprintf(L"%2d %2d %2d ", initial, medial, final);
          wprintf(L"%lc%lc%lc ", tb_i[initial].j, tb_m[medial].j, tb_f[final].j);

          fflush(stdout);
          assert(initial<=TB_I_N);
          assert(medial<=TB_M_N);
          assert(final<=TB_F_N);

      }

      // if
      //   wprintf( L"%ls ", (L'\n'==wc) ? L"\\n" : wc );
      // else
      //   putwchar(wc);


      // wprintf(L")");
      wprintf(L"\n");

    }
  }

  wprintf(L"%ls\n", split);

  return 0;

}
