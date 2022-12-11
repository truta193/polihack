# This Python file uses the following encoding: utf-8
import sys
from pathlib import Path
import requests
import json
import smtplib
import random
from Bayes import NaiveBayes
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuickControls2 import QQuickStyle
from PySide6.QtCore import QObject, Signal, Slot

#Client side omu meu se logheaza isi scrie simptomele ii se prezice ceare si are un buton request meeting, te programeaza medicul urgent/anytime
#Birocratie sa poata sa request adeverinta si request trimitere si reteta


NaiveBayes('Jaundice','Jaundice','Jaundice','Jaundice','Jaundice')

def sendEmail(request, reciver, connect):

    if request != "":
        RECIVER = reciver
        print(reciver)
        EMAIL_ADRESS = 'edmund32muir43@gmail.com'
        EMAIL_PASSWORD = 'izagxewsfxutjvbx'
        try:
            with smtplib.SMTP('smtp.gmail.com', 587) as smtp:
                smtp.ehlo()
                smtp.starttls()
                smtp.ehlo()
                smtp.login(EMAIL_ADRESS, EMAIL_PASSWORD)
                subject = "Verification code"
                body = f"{request}: \n {connect}"
                msg = f'Subject: {subject}\n\n{body}'
                try:
                    smtp.sendmail(EMAIL_ADRESS, RECIVER, msg)
                except:
                    return 0
        except:
            return 0
    return 1


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

#Signals are for me to send data to the UI
    setName = Signal(str)


#Slots are for the UI to send data
    @Slot(str)
    def validateCNP(self, CNP):
        response = requests.get(f"http://127.0.0.1:8000/api/v1/people/{CNP}")
        json_data = json.loads(response.text)
        newTag = random.randint(1000,9999)
        json_data['tag'] = newTag
        url = "http://127.0.0.1:8000/api/v1/people/{CNP}"
        response = requests.put(url, json=json_data)
        sendEmail("Connect with the following code:", json_data['contact'], newTag)


# 3431294843244
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
