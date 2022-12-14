export STRIP="E:/android-ndk-r21d/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64/bin/"
#export BUILD_TOOL_PATH="C:/Program Files (x86)/Microsoft Visual Studio/2019/Professional/Common7/IDE/CommonExtensions/Microsoft/CMake/Ninja/"
NDK="E:/android-ndk-r21d"
TOOLCHAIN="E:/android-ndk-r21d/build/cmake/android.toolchain.cmake"
GENERATOR="Ninja"

function build(){
    ABI=$1
    BUILD_PATH=build.android.${ABI}
	OUT_PATH="./Plugins/Android/libs/${ABI}"
    cmake -S . -B ${BUILD_PATH} -DANDROID=1 -DCMAKE_MAKE_PROGRAM="ninja" -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN} -DANDROID_NDK=${NDK} -DANDROID_ABI=${ABI} -DCMAKE_GENERATOR=${GENERATOR} -DWITH_GFLAGS=0 -DWITH_SNAPPY=0 -DWITH_JEMALLOC=0 -DWITH_JNI=0 -DWITH_BENCHMARK_TOOLS=0 -DWITH_CORE_TOOLS=0 -DWITH_TOOLS=0
    cmake --build ${BUILD_PATH} --config Release
    mkdir -p Plugins/Android/libs/${ABI}/
    cp ${BUILD_PATH}/librocksdb.so ${OUT_PATH}/librocksdb.so
}

#build armeabi-v7a
build arm64-v8a