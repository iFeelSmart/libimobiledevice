#!/bin/sh
gprefix=`which glibtoolize 2>&1 >/dev/null`
if [ $? -eq 0 ]; then 
  glibtoolize --force
else
  libtoolize --force #--ltdl --copy
fi
aclocal -I m4
autoheader
automake --add-missing --copy
autoconf

if [ -z "$NOCONFIGURE" ]; then
    ./configure "$@"
fi
