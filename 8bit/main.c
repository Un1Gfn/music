#include <assert.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define eprintf(...) fprintf(stderr,__VA_ARGS__)

typedef long double LD;

// Playing raw data 'stdin' : Unsigned 8 bit, Rate 8000 Hz, Mono
static int rate=8000;

static_assert(1==sizeof(char));

// Convert Helmholtz Notation to key no. relative to a'
// [cdefgab]('){0,5}(is|es){0,1}
// [BAGFEDC](,){0,2}(is|es){0,1} // Not implemented
static inline int h2o(const char *__restrict const h){

  assert(h);
  const char *restrict p=&h[0];

  while(' '==*p)++p;

  // a'   -> n=49
  // a'is -> n=50

  int pitch=0;
  switch(*p){
    case 'b':pitch=+2;break;
    case 'a':pitch= 0;break;
    case 'g':pitch=-2;break;
    case 'f':pitch=-4;break;
    case 'e':pitch=-5;break;
    case 'd':pitch=-7;break;
    case 'c':pitch=-9;break;
    default: assert(0);
  }
  ++p;

  // x''''' -> octave=+4;
  // x''''  -> octave=+3;
  // x'''   -> octave=+2;
  // x''    -> octave=+1;
  // x'     -> octave= 0;
  // x      -> octave=-1;
  int octave=-1;
  for(int i=0;i<5;++i){
    if(*p=='\''){
      ++octave;
      ++p;
    }
    else
      break;
  }

  int accidental=0;
  switch(*p){
    case  'i':accidental=+1;++p;assert('s'==*p);++p;break;
    case  'e':accidental=-1;++p;assert('s'==*p);++p;break;
  }

  while(' '==*p)++p;
  assert('\0'==*p);

  // o = - 49 +  n
  //  n  =   49 + o
  const int o=pitch+accidental+octave*12;
  // printf("%d - %s\n",o+49,h);
  return o;

}

// Calculate frequency
static inline LD o2f(const int o){
  const LD f = (LD)440 * powl( (LD)2, (LD)o/(LD)12 );
  // printf("%d - %s - %Lf\n",49+o,h,f);
  return f;
}

/*void h2f_test(){

  h2f("   c'''is  ");
  h2f("   c'''    ");
  h2f("   c'''es  ");puts("");
  h2f("   b''is   ");
  h2f("   b''     ");
  h2f("   b''es   ");puts("");
  h2f("   a''is   ");
  h2f("   a''     ");
  h2f("   a''es   ");puts("");
  h2f("   g''is   ");
  h2f("   g''     ");
  h2f("   g''es   ");puts("");

  h2f("   c''is  ");
  h2f("   c''    ");
  h2f("   c''es  ");puts("");
  h2f("   b'is   ");
  h2f("   b'     ");
  h2f("   b'es   ");puts("");
  h2f("   a'is   ");
  h2f("   a'     ");
  h2f("   a'es   ");puts("");
  h2f("   g'is   ");
  h2f("   g'     ");
  h2f("   g'es   ");puts("");

}*/

static inline void mknote(LD f){

  // + max_vol  255
  // 0  mute    128
  // - max_vol    0

  // https://www.gnu.org/software/libc/manual/html_node/Mathematical-Constants.html
  const LD omega = (LD)2 * (LD)M_PI * f;

  for(LD i=0;i<(rate/2);++i){
    unsigned char vol=floorl(
      (LD)128 * sinl( omega * i * (LD)4 / (LD)rate ) + 128
    );
    // eprintf("%Lf %u\n",i,vol);
    assert(1==fwrite(&(unsigned char){
      vol
    },1,1,stdout));
  }
}

static inline void h2o2f2note(const char *__restrict const h){
  mknote(o2f(h2o(h)));
}

void slide(){

  const char *__restrict const arr[]={

    // "c''''",

    // "b'''",
    // "a'''",
    // "g'''",
    // "f'''",
    // "e'''",
    // "d'''",
    // "c'''",

    // "b''",
    // "a''",
    // "g''",
    // "f''",
    // "e''",
    // "d''",
    // "c''",

    // "b''",
    // "a''is",
    // "a''",
    // "g''is",
    // "g''",
    // "f''is",
    // "f''",
    // "e''",
    // "d''is",
    // "d''",
    // "c''is",
    // "c''",

    // "b'",
    // "a'",
    // "g'",
    // "f'",
    // "e'",
    // "d'",
    // "c'",

    "c'",

    "b",
    "a",
    "g",
    "f",
    "e",
    "d",
    "c",

  NULL};

  // https://stackoverflow.com/a/45060067/
  // Pointer to the last element in array
  const char *__restrict const *__restrict E=&(((const char *__restrict const *__restrict)(&arr + 1))[-1]);
  assert(!(*E));
  for(const char *__restrict const *__restrict sp=E-1    ; sp>=&arr[0];--sp)h2o2f2note(*sp);
  for(const char *__restrict const *__restrict sp=&arr[1];*sp;         ++sp)h2o2f2note(*sp);
}

int main(const int argc, const char *__restrict const *__restrict const argv) {

  assert(argc==2);
  assert(argv[1]);
  assert(4<=strlen(argv[1]));
  rate=strtol(argv[1],NULL,10);

  if(isatty(STDOUT_FILENO)){
    eprintf("error: stdout is a terminal\n");
    return EXIT_FAILURE;
  }
  freopen(NULL,"wb",stdout);

  // h2f_test();
  slide();

  return EXIT_SUCCESS;

}
