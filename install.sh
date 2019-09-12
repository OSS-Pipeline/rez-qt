#!/usr/bin/bash

build_path=$1
qt_version=$2

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] BUILD PATH: ${build_path}"
echo -e "[INSTALL][ARGS] QT VERSION: ${qt_version}"

cd $build_path

# We finally install Qt
echo -e "\n"
echo -e "[INSTALL] Installing Qt-${qt_version}..."
echo -e "\n"

gmake -j${REZ_BUILD_THREAD_COUNT} install

echo -e "\n"
echo -e "[INSTALL] Finished installing Qt-${qt_version}!"
echo -e "\n"
