#!/usr/bin/bash

extract_path=$1
install_path=$2
qt_version=$3

# We print the arguments passed to the Bash script
echo -e "\n"
echo -e "================="
echo -e "=== CONFIGURE ==="
echo -e "================="
echo -e "\n"

echo -e "[CONFIGURE][ARGS] EXTRACT PATH: ${extract_path}"
echo -e "[CONFIGURE][ARGS] INSTALL PATH: ${install_path}"
echo -e "[CONFIGURE][ARGS] QT VERSION: ${qt_version}"

cd ${extract_path}

# We run the configuration script of Qt
echo -e "\n"
echo -e "[CONFIGURE] Running the configuration script from Qt-${qt_version}..."
echo -e "\n"

# if [ -d build ]; then
#     cd build
# else
#     mkdir build
#     cd build

# ./configure -prefix ${install_path} -opensource -confirm-license -shared -c++std c++14 -opengl desktop -qt-zlib -qt-libjpeg -qt-libpng -qt-xcb -qt-freetype -qt-pcre -qt-harfbuzz -qt-doubleconversion -qt-sqlite -qt-tiff -qt-webp -recheck-all -verbose
./configure -prefix ${install_path} -opensource -confirm-license -static -no-opengl -qt-zlib -qt-libjpeg -qt-libpng -qt-freetype -qt-doubleconversion -qt-sqlite -qt-tiff -no-qtwebengine -recheck-all -verbose
# fi

echo -e "\n"
echo -e "[CONFIGURE] Finished configuring Qt-${qt_version}!"
echo -e "\n"
