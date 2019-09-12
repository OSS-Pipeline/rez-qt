name = "qt"

version = "5.12.5"

authors = [
    "The Qt Company"
]

description = \
    """
    Qt is a free and open-source widget toolkit for creating graphical user interfaces as well as cross-platform
    applications that run on various software and hardware platforms such as Linux, Windows, macOS, Android or
    embedded systems with little or no change in the underlying codebase while still being a native application
    with native capabilities and speed.
    """

requires = [
    "cmake-3+",
    "gcc-6.3.1"
]

variants = [
    ["platform-linux"]
]

tools = [
    "qmake"
]

with scope("config") as config:
    config.build_thread_count = "logical_cores"

#TODO: Use the SHA1 of the archive instead.
uuid = "qt-5.12.5"

def commands():
    env.PATH.prepend("{root}/bin")
