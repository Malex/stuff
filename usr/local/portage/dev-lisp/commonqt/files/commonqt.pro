unix:TEMPLATE     = lib

HEADERS     += commonqt.h
SOURCES     += commonqt.cpp
CONFIG      += qt thread debug dll

unix:INCLUDEPATH  += /usr/include/smoke/

unix:LIBS += -lsmokeqtcore
