CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

include(RezBuild)
include(RezRepository)
include(ExternalProject)

set(qt_version 5.12.5)

# Qt
rez_set_archive(
    qt_url qt/qt-everywhere-src-${qt_version}.tar.xz
    http://download.qt.io/official_releases/qt/5.12/5.12.5/single/qt-everywhere-src-5.12.5.tar.xz
)

# The environment variable REZ_TMP_PATH is meant to point to a location such as "/tmp/rez".
set(EXTRACT_DIR $ENV{REZ_TMP_PATH}/qt/${qt_version})
set(BUILD_DIR ${EXTRACT_DIR}/build)

SET(ENV{QMAKE_INCDIR_OPENGL} "/usr/include/GL/:$ENV{QMAKE_INCDIR_OPENGL}")
# SET(ENV{QMAKE_INCDIR_OPENGL_ES2} "$ENV{QMAKE_INCDIR_OPENGL}")
SET(ENV{QMAKE_LIBDIR_OPENGL} "/usr/lib64/:$ENV{QMAKE_LIBDIR_OPENGL}")
# SET(ENV{QMAKE_LIBDIR_OPENGL_ES2} "$ENV{QMAKE_LIBDIR_OPENGL}")
SET(ENV{QMAKE_LIBS_OPENGL} "-lGL")
# SET(ENV{QMAKE_LIBS_OPENGL_ES2} "$ENV{QMAKE_LIBS_OPENGL}")
SET(ENV{CFLAGS} "-fPIC")
SET(ENV{CXXFLAGS} "-fPIC")

# We configure/build/install Qt through the ExternalProject_Add macro,
# using three different shell scripts for each of these steps.
# If necessary, it is possible to skip one of these steps by replacing the command
# by "", an empty string.
ExternalProject_Add(
    build_qt
    URL ${qt_url}
    PREFIX qt
    SOURCE_DIR ${EXTRACT_DIR}
    CONFIGURE_COMMAND bash ${CMAKE_SOURCE_DIR}/configure.sh ${EXTRACT_DIR} ${CMAKE_INSTALL_PREFIX} ${qt_version}
    BUILD_COMMAND bash ${CMAKE_SOURCE_DIR}/build.sh ${EXTRACT_DIR} ${qt_version}
    INSTALL_COMMAND bash ${CMAKE_SOURCE_DIR}/install.sh ${EXTRACT_DIR} ${qt_version}
)

# We use a bogus CMake "install" step in order to be able to properly finish
# and get out of the CMake script.
install(
    CODE
    "execute_process(
        COMMAND echo \"\n[CMAKE] Qt-${qt_version} PACKAGE SETUP FINISHED!\n\"
    )"
)
