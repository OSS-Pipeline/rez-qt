#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

BUILD_PATH=$1
qt_version=$2

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "==============="
echo -e "=== INSTALL ==="
echo -e "==============="
echo -e "\n"

echo -e "[INSTALL][ARGS] BUILD PATH: ${BUILD_PATH}"
echo -e "[INSTALL][ARGS] QT VERSION: ${qt_version}"

cd ${BUILD_PATH}

# We install Qt
echo -e "\n"
echo -e "[INSTALL] Installing Qt-${qt_version}..."
echo -e "\n"

gmake -j${REZ_BUILD_THREAD_COUNT} install

echo -e "\n"
echo -e "[INSTALL] Finished installing Qt-${qt_version}!"
echo -e "\n"
