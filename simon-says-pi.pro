# Qt Dependencies
QT += phonon


# Installation settings
TARGET = simon-says-pi
target.path = /
INSTALLS += target


# Header files
INCLUDEPATH += include

HEADERS += \
    include/game/types.hpp \
    include/game/gui/appwindow.hpp \
    include/game/gui/board.hpp \
    include/game/gui/button.hpp \
    include/game/gui/palette.hpp \
    include/game/gui/score.hpp \
    include/game/gui/stackedwidget.hpp \
    include/game/gui/graphics/tile.hpp \
    include/game/gui/graphics/turn.hpp \
    include/game/gui/screen/about.hpp \
    include/game/gui/screen/base.hpp \
    include/game/gui/screen/more.hpp \
    include/game/gui/screen/simon.hpp \
    include/game/gui/screen/title.hpp \
    include/game/settings/manager.hpp \
    include/game/sound/mediaplayer.hpp


# Source files
SOURCES += \
    src/game/main.cpp \
    src/game/gui/appwindow.cpp \
    src/game/gui/board.cpp \
    src/game/gui/button.cpp \
    src/game/gui/score.cpp \
    src/game/gui/stackedwidget.cpp \
    src/game/gui/graphics/tile.cpp \
    src/game/gui/graphics/turn.cpp \
    src/game/gui/screen/about.cpp \
    src/game/gui/screen/base.cpp \
    src/game/gui/screen/more.cpp \
    src/game/gui/screen/simon.cpp \
    src/game/gui/screen/title.cpp \
    src/game/settings/manager.cpp \
    src/game/sound/mediaplayer.cpp


# Resources files
RESOURCES += \
    resources.qrc


# Build directory
CONFIG(debug, debug|release) {
    DESTDIR = build/debug
} else {
    DESTDIR = build/release
}

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc
RCC_DIR = $$DESTDIR/.qrc
UI_DIR = $$DESTDIR/.ui


# Enable C++11
QMAKE_CXXFLAGS += -std=c++11


# Custom Makefile targets
create.target = create
create.commands = touch src/game/${ARGS}.cpp \
    && touch include/game/${ARGS}.hpp \
    && echo Created ${ARGS} class

delete.target = delete
delete.commands = rm src/game/${ARGS}.cpp \
    && rm include/game/${ARGS}.hpp \
    && echo Deleted ${ARGS} class

QMAKE_EXTRA_TARGETS += create delete
