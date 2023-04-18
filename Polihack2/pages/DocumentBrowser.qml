import QtQuick 2.15
import QtQuick.Controls 2.0
import "../components"

Rectangle {
    color: "#00000000"
    implicitHeight: 600
    implicitWidth: 800
    height: stackView.height
    width: stackView.width

    Connections {
        target: backend

        function onFileReady(string) {
            pdfModel.append({"src" : string})
            console.log(string)
        }
    }

    ScrollView {
        id: scrollArea1
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 10
        contentWidth: parent.width - 20
        contentHeight: gridLayout.implicitHeight

        Grid{
            id: gridLayout
            readonly property int elementWidth: 200

            columns: Math.max(Math.floor(parent.width / (elementWidth+10)), 1)
            rows: 2*Math.max(Math.floor((children.length) / columns), 1)

            anchors.fill: parent
            rowSpacing: 5
            columnSpacing: rowSpacing

            ListModel {
                    id: pdfModel
            }

            Repeater {
                id: gridRepeater
                model: pdfModel
                delegate: PdfItem {
                    documentPath: src;
                    onPdfPopup: {
                        pdfViewPopup.curFile = src
                        pdfViewPopup.open()
                    }
                }
            }

        }

    }

    Rectangle {
        id: dropFiller
        anchors.fill: parent
        color: "#00000000"
        width: 0

        Image {
            id: dropPlus
            source: "qrc:///assets/images/plus.svg"
            antialiasing: true
            mipmap: true
            height: 100
            width: 100
            opacity: 0.4
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            visible: false
        }

    }

    DropArea {
            id: dropArea;
            anchors.fill: parent
            onEntered: {
                dropFiller.color = "#a0D6E6F2";
                drag.accept (Qt.LinkAction);
                dropFiller.width = parent.width
                dropPlus.visible = true
            }

            onDropped: {
                backend.fileUpload(drop.urls)
                dropFiller.color = "#00000000"
                dropFiller.width = 0;
                dropPlus.visible = false
            }
            onExited: {
                dropFiller.color = "#00000000";
                dropFiller.width = 0;
                dropPlus.visible = false
            }
        }

}
