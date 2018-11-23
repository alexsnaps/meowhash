require "mkmf"

$CFLAGS = "-O3 -Wall -mavx -maes"

abort "Requires CLANG!" if CONFIG['CC'] != "clang"

create_makefile "meowhash/meowhash"
