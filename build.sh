#!/usr/bin/bash

build_path=$1
qt_version=$2

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "============="
echo -e "=== BUILD ==="
echo -e "============="
echo -e "\n"

echo -e "[BUILD][ARGS] BUILD PATH: ${build_path}"
echo -e "[BUILD][ARGS] QT VERSION: ${qt_version}"

cd $build_path

# We build Qt
echo -e "\n"
echo -e "[BUILD] Building Qt-${qt_version}..."
echo -e "\n"

gmake -j${REZ_BUILD_THREAD_COUNT}

echo -e "\n"
echo -e "[BUILD] Finished building Qt-${qt_version}!"
echo -e "\n"
