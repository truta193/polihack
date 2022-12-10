import QtQuick
import QtQuick.Controls

Rectangle {
    id: container
    property url pdfFile: "../../assets/t.pdf"

    Rectangle {
        id: background
        color: "#ffffff"
        anchors.fill: parent
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10

        ScrollView {
            id: scrollView
            contentWidth: parent.width
            Image {
                y: 0
                source: pdfFile
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                fillMode: Image.PreserveAspectFit
            }
            anchors.fill: parent
        }


    }

    anchors.fill: parent
    color: "#00000000"
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:3}
}
##^##*/
