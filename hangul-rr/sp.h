#pragma once

typedef struct {
  const char *const x;
  const char *const y;
} SP;

const SP *sp_lk(const int, const int);
