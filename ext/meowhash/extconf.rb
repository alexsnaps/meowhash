require "mkmf"

$CFLAGS = "-O3 -Wall -mavx -maes"

abort "Requires CLANG!" unless CONFIG['CC']&.end_with? 'clang'

create_makefile "meowhash/meowhash"
