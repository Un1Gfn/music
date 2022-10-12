#pragma once

#include <stdbool.h>
#include <wchar.h>

// definitions

#define TB_I_N 18
#define TB_M_N 20
#define TB_F_N 27

typedef struct {
  const char *const r; // roman
  const wint_t      j; // jamo
} TB;

// global variables

extern const TB tb_i[];
extern const TB tb_m[];
extern const TB tb_f[];

// public functions
extern const char *const empty;
extern const char *tb_previous_ending_consonant;
void tb_romanize(const wint_t); 
bool tb_issyllable(const wint_t);
