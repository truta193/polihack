import QtQuick
import QtQuick.Controls

Rectangle {
    id: bg
    color: "#434c5e"
    border.color: "#434c5e"
    border.width: 1

    implicitWidth: 150
    implicitHeight: 200

    property url iconSource: "../../assets/images/save_icon.svg"

    MouseArea{
        id: clickChecker
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            slideUpAnim.start()
        }
        onExited: {
            slideDownAnim.start()
        }
        onClicked: {
            window.stack.push("../pages/pdfPage.qml")
        }
    }

    Menu {
        id: contextMenu
        MenuItem { text: "Request" }
        MenuItem { text: "About" }
    }

    Rectangle {
        id: textHolder
        y: 155
        height: 60
        color: "#1e232b"
        border.color: "#1e232b"
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        state: "base state0"
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0


        PropertyAnimation {
            id: slideUpAnim
            target: textHolder
            property: "height"
            to: 200
            duration: 100
            easing.type: Easing.InCirc
        }
        PropertyAnimation {
            id: slideDownAnim
            target: textHolder
            property: "height"
            to: 60
            duration: 100
            easing.type: Easing.InCirc
        }

        Label {
            id: label
            color: "#ffffff"
            text: qsTr("Placeholder")
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            font.pointSize: 12
        }
    }

    Rectangle {
        id: imageHolder
        color: "#00000000"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: textHolder.top
        anchors.bottomMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0


        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            source: iconSource

            width: 100
            height: 100
            fillMode: Image.PreserveAspectFit

        }
    }
}
