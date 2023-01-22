#pragma once

#include <stdbool.h>
#include <wchar.h>

// definitions

#define TB_I_N 18
#define TB_M_N 20
#define TBB_F_N 27

typedef struct {
  const char *const r; // romaja
  const wint_t      j; // jamo
} TB;

typedef struct {
  const char *const ri; // romaja initial (IHT)
  const char *const rf; // romaja final
  const wint_t      j; // jamo
} TBB;

// global variables

extern const TB  tb_i[];
extern const TB  tb_m[];
extern const TBB tb_f[];

// public functions
void tb_emit(const int, const int, const int, const bool);
bool tb_issyllable(const wint_t);
