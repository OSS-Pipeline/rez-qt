#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

BUILD_PATH=$1
qt_version=$2

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "============="
echo -e "=== BUILD ==="
echo -e "============="
echo -e "\n"

echo -e "[BUILD][ARGS] BUILD PATH: ${BUILD_PATH}"
echo -e "[BUILD][ARGS] QT VERSION: ${qt_version}"

cd ${BUILD_PATH}

# We build Qt
echo -e "\n"
echo -e "[BUILD] Building Qt-${qt_version}..."
echo -e "\n"

gmake -j${REZ_BUILD_THREAD_COUNT}

echo -e "\n"
echo -e "[BUILD] Finished building Qt-${qt_version}!"
echo -e "\n"
