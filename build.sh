#!/bin/bash

NDK_ROOT=$NDK_HOME
PREBUILT=$NDK_ROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
PLATFORM=$NDK_ROOT/platforms/android-19/arch-arm

export PATH=$PATH:$PREBUILT/bin:$PLATFORM/usr/include

export LDFLAGS="-L$PLATFORM/usr/lib -L$PREBUILT/arm-linux-androideabi/lib -march=armv7-a"
export CFLAGS="-I$PLATFORM/usr/include -march=armv7-a -mfloat-abi=softfp -mfpu=vfp -ffast-math -O2"

export CPPFLAGS="$CFALGS"
export CFLAGS="$CFLAGS"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="$LDFLAGS"

export AS=$PREBUILT/bin/arm-linux-androideabi-as
export LD=$PREBUILT/bin/arm-linux-androideabi-ld
export CXX="$PREBUILT/bin/arm-linux-androideabi-g++ --sysroot=${PLATFORM}"
export CC="$PREBUILT/bin/arm-linux-androideabi-gcc --sysroot=${PLATFORM} -march=armv7-a "
export NM=$PREBUILT/bin/arm-linux-androideabi-nm
export STRIP=$PREBUILT/bin/arm-linux-androideabi-strip
export RANLIB=$PREBUILT/bin/arm-linux-androideabi-ranlib
export AR=$PREBUILT/bin/arm-linux-androideabi-ar

./configure --host=arm-linux \
--disable-shared \
--disable-frontend \
--enable-static \
--prefix=`pwd`/armv7a/

make clean
make
make install



