# /*******************************************************************
# Part of the Fritzing project - http://fritzing.org
# Copyright (c) 2019 Fritzing
# Fritzing is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# Fritzing is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with Fritzing. If not, see <http://www.gnu.org/licenses/>.
# ********************************************************************/

include(../../pri/common.pri)

HEADERS += $$files(*.h)
SOURCES += $$files(*.cpp)

# contains(DEFINES, QUAZIP_INSTALLED) {
#     !build_pass:message("using installed QuaZIP library")
#     LIBS += -lquazip5
# } else {
#     include(../lib/quazip/quazip.pri)
# }
LIBGIT2LIB = $$_PRO_FILE_PWD_/../../../libgit2/build

INCLUDEPATH += ..

FLIBS = eagle referencemodel partseditor autoroute partsbinpalette help dialogs program infoview dock version kitchensink sketch mainwindow svg connectors model items utils
for(libname, FLIBS) {
    LIBS += -L../$${libname}/$$DESTDIR -l$${libname}
}
LIBS += -L../lib/qtsysteminfo/$$DESTDIR -lqtsysteminfo
LIBS += -L../lib/quazip/$$DESTDIR -lquazip

# Linux specific
LIBS += $$LIBGIT2LIB/libgit2.a -lssl -lcrypto
LIBS += -lz

RESOURCES += ../../fritzingresources.qrc

TEMPLATE = app
TARGET= Fritzing
