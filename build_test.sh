#!/bin/bash

echo "====build bizlars starting===="

CMD=`realpath $0`
COMMON_DIR=`dirname $CMD`

if [ ! -d "$COMMON_DIR/outPut/Release" ];then
  mkdir -p $COMMON_DIR/outPut/Release
else
  if [ "$(ls -A $COMMON_DIR/outPut/Release)" ]; then
    rm $COMMON_DIR/outPut/Release/*
  fi
fi

if [ ! -d "$COMMON_DIR/outPut/Debug" ];then
  mkdir -p $COMMON_DIR/outPut/Debug
else
  if [ "$(ls -A $COMMON_DIR/outPut/Debug)" ]; then
    rm $COMMON_DIR/outPut/Debug/*
  fi
fi

export PATH=/opt/android-ndk/ndk/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH
echo "current PATH is:$PATH."
# build libTest1
pushd $COMMON_DIR/libTest1
echo "pwd is:"
pwd
make
mv $COMMON_DIR/libTest1/libTest1.so  $COMMON_DIR/outPut/Release/ -v
popd

# build libUSBTest
pushd $COMMON_DIR/libUSBTest
echo "pwd is:"
pwd
make
mv $COMMON_DIR/libUSBTest/libUSBTest.so  $COMMON_DIR/outPut/Release/ -v
popd


# make clean
pushd $COMMON_DIR/libTest1
make clean
popd
pushd $COMMON_DIR/libUSBTest
make clean
popd

#cp $COMMON_DIR/outPut/Release/libTest1.so $COMMON_DIR/../CMake_Tutorial/CMake08_Android_NDK_Windows_build_APK/android/lib -v
#cp $COMMON_DIR/outPut/Release/libUSBTest.so $COMMON_DIR/../CMake_Tutorial/CMake08_Android_NDK_Windows_build_APK/android/lib -v
cp $COMMON_DIR/libTest1/src/test.h $COMMON_DIR/outPut/Release -v
cp $COMMON_DIR/libUSBTest/src/USBTest.h $COMMON_DIR/outPut/Release -v

echo "====build bizlars finished===="
