export NDK=E:/android-ndk-r21d
export STRIP=E:/android-ndk-r21d/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64/bin
export toolchain=E:/android-ndk-r21d/build/cmake/android.toolchain.cmake
gernerator="Ninja"

function build(){
    ABI=$1
    BUILD_PATH=build.android.${ABI}
    cmake -S . -B ${BUILD_PATH} -DANDROID=1 -DCMAKE_TOOLCHAIN_FILE=${toolchains} -DANDROID_NDK=${NDK} -DANDROID_ABI=${ABI} -DCMAKE_GENERATOR=${gernerator} -DWITH_GFLAGS=0 -DWITH_SNAPPY=0 -DWITH_JEMALLOC=0 -DWITH_JNI=0 -DWITH_BENCHMARK_TOOLS=0 -DWITH_CORE_TOOLS=0 -DWITH_TOOLS=0
    cmake --build ${BUILD_PATH} --config Release
    mkdir -p Plugins/Android/libs/${ABI}/
    cp ${BUILD_PATH}/librocksdb.so Plugins/Android/libs/${ABI}/librocksdb.so
}

build armeabi-v7a 
build arm64-v8a