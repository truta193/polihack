# This Python file uses the following encoding: utf-8
import sys
import os
import shutil
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuickControls2 import QQuickStyle
from PySide6.QtCore import QObject, Slot, Signal, QStandardPaths
from PySide6.QtWebEngineQuick import QtWebEngineQuick
import resources_rc

import mysql.connector

db = mysql.connector.connect(
  host="localhost",
  user="root",
  password="calculator12",
  database="DocQT"
)

print(db)
dbcursor = db.cursor(buffered=True)

class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

    #Signal
    searchReady = Signal(str, int)

    @Slot(str)
    def searchList(self, name):
        if (name == ""):
            return
        if (name[0] in "01234567890"):
            dbcursor.execute("SELECT * FROM people WHERE CNP LIKE \'{0}%\'".format(name))
            resultByFirst = dbcursor.fetchall()
            for x in resultByFirst:
                self.searchReady.emit(x[1] + " " + x[2], x[0])
        else:


            dbcursor.execute("SELECT * FROM people WHERE LastName LIKE \'{0}%\'".format(name))
            resultByFirst = dbcursor.fetchall()

            nameSet = set(resultByFirst)

            dbcursor.execute("SELECT * FROM people WHERE FirstName LIKE \'{0}%\'".format(name))
            resultBySecond = dbcursor.fetchall()

            nameSet.update(resultBySecond)

            for x in nameSet:
                self.searchReady.emit(x[1] + " " + x[2], x[0])


    pacientReady = Signal(str)

    @Slot(int)
    def pacientLoad(self, pid):
        print(pid)
        #Fetch from database
        for filename in os.scandir(docqtPath + "/p{0}".format(pid)):
            if filename.is_file():
                self.pfileReady.emit("file:///" + str(os.path.abspath(filename)).replace("\\", "/"))
                print("file:///" + str(os.path.abspath(filename)).replace("\\", "/"))

    # Signal
    pfileReady = Signal(str)

    @Slot(str, int)
    def pfileUpload(self, file, pid):
        print(file)
        defaultPath = QStandardPaths.writableLocation(QStandardPaths.StandardLocation.DocumentsLocation)
        docqtPath = defaultPath + "/DocQT/p{0}/".format(pid)
        print(str(file).removeprefix("file:///"))
        print(docqtPath)
        print(docqtPath + os.path.basename(file))
        shutil.copy(str(file).removeprefix("file:///"), docqtPath + os.path.basename(file))
        nfile = file.replace("\\", "/")
        print(nfile)
        self.pfileReady.emit(nfile)

    # Signal
    fileReady = Signal(str)

    @Slot(str)
    def fileUpload(self, file):
        print(file)
        defaultPath = QStandardPaths.writableLocation(QStandardPaths.StandardLocation.DocumentsLocation)
        docqtPath = defaultPath + "/DocQT/"
        print(str(file).removeprefix("file:///"))
        print(docqtPath)
        print(docqtPath + os.path.basename(file))
        shutil.copy(str(file).removeprefix("file:///"), docqtPath + os.path.basename(file).replace("\\", "/"))
        self.fileReady.emit(file)


class DocumentBorwserWindow(QObject):
    def __init__(self):
        QObject.__init__(self)


class PacientDocumenBrowserWindow(QObject):
    def __init__(self):
        QObject.__init__(self)




if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)


    QtWebEngineQuick.initialize()
    QQuickStyle.setStyle("Universal")
    qml_file = Path(__file__).resolve().parent / "App.qml"
    engine.load(qml_file)

    # Create documents directory if it doesn't exist
    defaultPath = QStandardPaths.writableLocation(QStandardPaths.StandardLocation.DocumentsLocation)
    docqtPath = defaultPath + "/DocQT"
    if not os.path.exists(docqtPath):
        os.makedirs(docqtPath)

    # Load personal files
    for filename in os.scandir(docqtPath):
        if filename.is_file():
            main.fileReady.emit("file:///" + str(os.path.abspath(filename)).replace("\\", "/"))
            print(str(os.path.abspath(filename)))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
