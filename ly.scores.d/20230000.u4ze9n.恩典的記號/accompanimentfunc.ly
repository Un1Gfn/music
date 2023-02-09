% accompanimentfunc.ly

% end
endX = #(define-music-function (x) (ly:pitch?) #{ < \transpose c c, $x \transpose c e, $x \transpose c g, $x \transpose c c $x > 4 #})
endY = #(define-music-function (x) (ly:pitch?) #{ < \transpose c e, $x \transpose c g, $x \transpose c c $x  \transpose c e $x > 4 #})
end  = #(define-music-function (x) (ly:pitch?) #{ | \endX $x \endY $x \endX $x r4 | #})
% end  = #(define-music-function (x) (ly:pitch?) #{ |
%   < \transpose c c, $x \transpose c e, $x \transpose c g, $x \transpose c c $x > 4
%   < \transpose c e, $x \transpose c g, $x \transpose c c $x  \transpose c e $x > 4
%   < \transpose c c, $x \transpose c e, $x \transpose c g, $x \transpose c c $x > 2
% | #})

% major
MA = #(define-music-function (x) (ly:pitch?) #{ < \transpose c c, $x \transpose c e, $x \transpose c g, $x > 4 #})
MB = #(define-music-function (x) (ly:pitch?) #{ < \transpose c e, $x \transpose c g, $x \transpose c c $x > 4 #})
MC = #(define-music-function (x) (ly:pitch?) #{ < \transpose c g, $x \transpose c c $x  \transpose c e $x > 4 #})
MD = #(define-music-function (x) (ly:pitch?) #{ \MB $x #})
M  = #(define-music-function (x) (ly:pitch?) #{ | \MA $x \MB $x \MC $x \MD $x | #})

% seven
% https://en.wikipedia.org/wiki/Dominant_seventh_chord
viiA = #(define-music-function (x) (ly:pitch?) #{ < \transpose c c, $x \transpose c e, $x    \transpose c g, $x > 4 #})
viiB = #(define-music-function (x) (ly:pitch?) #{ < \transpose c e, $x \transpose c g, $x    \transpose c bes, $x > 4 #})
viiC = #(define-music-function (x) (ly:pitch?) #{ < \transpose c g, $x \transpose c bes, $x  \transpose c e $x > 4 #})
viiD = #(define-music-function (x) (ly:pitch?) #{ \viiB $x #})
vii  = #(define-music-function (x) (ly:pitch?) #{ | \viiA $x \viiB $x \viiC $x \viiD $x | #})

mA = #(define-music-function (x) (ly:pitch?) #{ < \transpose c c, $x   \transpose c ees, $x \transpose c g, $x > 4 #})
mB = #(define-music-function (x) (ly:pitch?) #{ < \transpose c ees, $x \transpose c g, $x   \transpose c c $x > 4 #})
mC = #(define-music-function (x) (ly:pitch?) #{ < \transpose c g, $x   \transpose c c $x    \transpose c ees $x > 4 #})
mD = #(define-music-function (x) (ly:pitch?) #{ \mB $x #})
m  = #(define-music-function (x) (ly:pitch?) #{ | \mA $x \mB $x \mC $x \mD $x | #})

% sus4
% https://en.wikipedia.org/wiki/Suspended_chord
sfA = #(define-music-function (x) (ly:pitch?) #{ < \transpose c c, $x \transpose c f, $x \transpose c g, $x > 4 #})
sfB = #(define-music-function (x) (ly:pitch?) #{ < \transpose c f, $x \transpose c g, $x \transpose c c $x > 4 #})
sfC = #(define-music-function (x) (ly:pitch?) #{ < \transpose c g, $x \transpose c c $x  \transpose c f $x > 4 #})
sfD = #(define-music-function (x) (ly:pitch?) #{ \sfB $x #})
sf  = #(define-music-function (x) (ly:pitch?) #{ | \sfA $x \sfB $x \sfC $x \sfD $x | #})

% placeholder
% xA = #(define-music-function (x) (ly:pitch?) #{ \MA d,, #})
% xB = #(define-music-function (x) (ly:pitch?) #{ \MB d,, #})
% xC = #(define-music-function (x) (ly:pitch?) #{ \MC d,, #})
% xD = #(define-music-function (x) (ly:pitch?) #{ \MD d,, #})
% x  = #(define-music-function (x) (ly:pitch?) #{ | \xA d,, \xB d,, \xC d,, \xD d,, | #})

% https://en.wikipedia.org/wiki/Slash_chord

sceA = #(define-music-function (x) (ly:pitch?) #{ < \transpose c e,, $x \transpose c e, $x \transpose c g, $x > 4 #})
sceB = #(define-music-function (x) (ly:pitch?) #{ < \transpose c e,, $x \transpose c e, $x \transpose c c $x > 4 #})
sceC = #(define-music-function (x) (ly:pitch?) #{ < \transpose c e, $x  \transpose c g, $x \transpose c e $x > 4 #})
sceD = #(define-music-function (x) (ly:pitch?) #{ < \transpose c e,, $x \transpose c e, $x \transpose c c $x > 4 #})
sce  = #(define-music-function (x) (ly:pitch?) #{ | \sceA $x \sceB $x \sceC $x \sceD $x | #})

scgA = #(define-music-function (x) (ly:pitch?) #{ < \transpose c g,, $x \transpose c e, $x \transpose c g, $x > 4 #})
scgB = #(define-music-function (x) (ly:pitch?) #{ < \transpose c g,, $x \transpose c e, $x \transpose c c $x > 4 #})
scgC = #(define-music-function (x) (ly:pitch?) #{ < \transpose c e, $x  \transpose c g, $x \transpose c g $x > 4 #})
scgD = #(define-music-function (x) (ly:pitch?) #{ < \transpose c g,, $x \transpose c e, $x \transpose c c $x > 4 #})
scg  = #(define-music-function (x) (ly:pitch?) #{ | \scgA $x \scgB $x \scgC $x \scgD $x | #})

% C
%    ceg
%     egc
%      gce
%     egc

% C/E
%  e  eg_
%  e  e_c
%     eg_e
%  e  e_c

% C/E
%   g eg_
%   g e_c
%     eg_ g
%   g e_c

% C
%  c
%   e
%    g
%     c
%    g
%   e
%  c
%   e
%     c
%    g
%   e 
%    g

% C/E
% e
%   e
%    g
%     c
%    g
%   e
% e
%   e
%     c
%    g
%   e 
%    g
