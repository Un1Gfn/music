# refer to ~/gtk3/meson.build
project('hangul-rr', 'c',
  default_options: [
    'prefix=/usr/local',
    'backend=ninja',
    'buildtype=debug',
    'debug=true',
    'strip=false',
    'warning_level=3',
    'werror=true',
    'b_lto=true',
    'b_ndebug=false',
    'c_std=gnu18',
  ],
  license: 'AGPL-3.0',
  meson_version: '>=0.63.3',
  version: '0.1',
)

add_global_arguments('-D_GNU_SOURCE',
                     # '-DDISABLE_SP',
                     '-Wdeprecated-declarations',
                     '-Winline',
                     '-Wno-pedantic',
                     '-Wshadow',
                     '-Wno-error=deprecated-declarations',
                     '-Wno-error=unused-but-set-variable',
                     '-Wno-error=unused-parameter',
                     '-Wno-error=unused-variable',
                     language: 'c')

executable(meson.project_name(),
  'main.c',
  'tb.c',
  'sp.c',
  # dependencies: [
  #   dependency(''),
  # ]
)
