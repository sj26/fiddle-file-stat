#include <extconf.h>
#include <ruby/ruby.h>

#if SIZEOF_VOIDP == SIZEOF_LONG
# define PTR2NUM(x)   (LONG2NUM((long)(x)))
# define NUM2PTR(x)   ((void*)(NUM2ULONG(x)))
#else
/* # error --->> Ruby/DL2 requires sizeof(void*) == sizeof(long) to be compiled. <<--- */
# define PTR2NUM(x)   (LL2NUM((LONG_LONG)(x)))
# define NUM2PTR(x)   ((void*)(NUM2ULL(x)))
#endif

VALUE mFiddle, eFiddleError, cFiddlePointer;

static VALUE
rb_file_stat_to_ptr(VALUE self)
{
    struct stat* st;
    VALUE args[2], ptr;

    if (!RTEST(rb_obj_is_kind_of(self, rb_cStat))){
        rb_raise(eFiddleError, "File::Stat was expected");
    }

    st = RTYPEDDATA_DATA(self);

    args[0] = PTR2NUM(st);
    args[1] = INT2NUM(sizeof(struct stat));

    ptr = rb_class_new_instance(2, args, cFiddlePointer);

    return ptr;
}

void Init_fiddle_file_stat_ext() {
    mFiddle = rb_const_get(rb_cObject, rb_intern("Fiddle"));
    eFiddleError = rb_const_get(mFiddle, rb_intern("Error"));
    cFiddlePointer = rb_const_get(mFiddle, rb_intern("Pointer"));
    rb_define_method(rb_cStat, "to_ptr", rb_file_stat_to_ptr, 0);
}
