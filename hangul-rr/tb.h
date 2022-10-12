#pragma once

#include <wchar.h>

#define TB_I_N 18
#define TB_M_N 20
#define TB_F_N 27

typedef struct {
  const char *const r; // roman
  const wint_t      j; // jamo
} JR;

extern const JR tb_i[];
extern const JR tb_m[];
extern const JR tb_f[];
