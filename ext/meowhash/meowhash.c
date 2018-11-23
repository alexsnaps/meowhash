#include <ruby.h>

#include "meow_intrinsics.h"
#include "meow_hash.h"

#define VERSION "0.4"

/*
 */
static VALUE 
rb_meow_version(int argc, VALUE *argv, VALUE klass)
{
  return rb_sprintf("v%s", VERSION);
}

static void 
to_chars(unsigned long n, unsigned char *bytes)
{
  bytes[0] = (n >> 24) & 0xFF;
  bytes[1] = (n >> 16) & 0xFF;
  bytes[2] = (n >> 8) & 0xFF;
  bytes[3] = n & 0xFF;
}

static VALUE
rb_meow_hash(VALUE self, VALUE toHash)
{
  Check_Type(toHash, T_STRING);
  
  meow_hash Hash = MeowHash_Accelerated(0, RSTRING_LEN(toHash), StringValuePtr(toHash));
  unsigned char buffer[16];
  to_chars(MeowU32From(Hash, 3), &buffer[0]);
  to_chars(MeowU32From(Hash, 2), &buffer[4]);
  to_chars(MeowU32From(Hash, 1), &buffer[8]);
  to_chars(MeowU32From(Hash, 0), &buffer[12]);
  VALUE rb_binary = rb_str_new(buffer, 16);
  return rb_binary;
}

void
Init_meowhash()
{
  VALUE mMH = rb_define_module("MeowHash");
  VALUE cHasher = rb_define_module_under(mMH, "Hasher");

  rb_define_module_function(cHasher, "version", rb_meow_version, 0);
  rb_define_module_function(cHasher, "digest", rb_meow_hash, 1);

  // todo
  // rb_define_module_function(cHasher, "file", rb_meow_file, 1)
}