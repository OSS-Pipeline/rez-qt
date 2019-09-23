#!/usr/bin/bash

# Will exit the Bash script the moment any command will itself exit with a non-zero status, thus an error.
set -e

EXTRACT_PATH=$1
INSTALL_PATH=${REZ_BUILD_INSTALL_PATH}
qt_version=$3

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "================="
echo -e "=== CONFIGURE ==="
echo -e "================="
echo -e "\n"

echo -e "[CONFIGURE][ARGS] EXTRACT PATH: ${EXTRACT_PATH}"
echo -e "[CONFIGURE][ARGS] INSTALL PATH: ${INSTALL_PATH}"
echo -e "[CONFIGURE][ARGS] QT VERSION: ${qt_version}"

cd ${EXTRACT_PATH}

# We run the configuration script of Qt
echo -e "\n"
echo -e "[CONFIGURE] Running the configuration script from Qt-${qt_version}..."
echo -e "\n"

# if [ -d build ]; then
#     cd build
# else
#     mkdir build
#     cd build

# ./configure -prefix ${INSTALL_PATH} -opensource -confirm-license -shared -c++std c++14 -opengl desktop -qt-zlib -qt-libjpeg -qt-libpng -qt-xcb -qt-freetype -qt-pcre -qt-harfbuzz -qt-doubleconversion -qt-sqlite -qt-tiff -qt-webp -recheck-all -verbose
./configure -prefix ${INSTALL_PATH} -opensource -confirm-license -static -nomake examples -no-opengl -qt-zlib -qt-libjpeg -qt-libpng -qt-freetype -qt-doubleconversion -qt-sqlite -qt-tiff -recheck-all -verbose
# fi

echo -e "\n"
echo -e "[CONFIGURE] Finished configuring Qt-${qt_version}!"
echo -e "\n"
