cmake -S . -B build.ios -DPLATFORM=OS64 -DCMAKE_TOOLCHAIN_FILE=./cmake/ios.toolchain.cmake -DRIOS=1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_GENERATOR="Xcode" -DWITH_GFLAGS=0 -DWITH_SNAPPY=0 -DWITH_JEMALLOC=0 -DWITH_JNI=0 -DWITH_BENCHMARK_TOOLS=0 -DWITH_CORE_TOOLS=0 -DWITH_TOOLS=0