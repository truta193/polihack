# This Python file uses the following encoding: utf-8
import sys
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuickControls2 import QQuickStyle
from PySide6.QtCore import QObject, Signal, Slot

#Client side omu meu se logheaza isi scrie simptomele ii se prezice ceare si are un buton request meeting, te programeaza medicul urgent/anytime
#Birocratie sa poata sa request adeverinta si request trimitere si reteta


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

#Signals are for me to send data to the UI
    setName = Signal(str)
    sendElementCount = Signal(int)
    sendElement = Signal(str)

#Slots are for the UI to send data
    @Slot(str)
    def validateCNP(self, cnp):
        print(cnp)

    def sendElementList(self, lst):

        for elem in lst:
            self.sendElement(elem)


if __name__ == "__main__":
    QQuickStyle.setStyle("Universal")
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    main = MainWindow()

    engine.rootContext().setContextProperty("backend", main)


    qml_file = Path(__file__).resolve().parent / "qml/main.qml"
    engine.load(qml_file)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
