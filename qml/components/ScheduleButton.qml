import QtQuick
import QtQuick.Controls

Button {
    id: scheduleButton


    checkable: true

    property color defaultColor: "#1e232b"
    property color hoverColor: "#4C566A"
    property color clickColor: "#4678E5"
    property bool isActive: false
    property string title: "Monday, 14/12/2022 13:20"
    property int neededWidth: 300


    implicitWidth: neededWidth
    implicitHeight: 30

    QtObject {
        id: internal

        property var dynamicColor: if (scheduleButton.down) {
                                       scheduleButton.down ? scheduleButton.clickColor : scheduleButton.defaultColor
                                   } else if (scheduleButton.enabled){
                                       scheduleButton.hovered ? scheduleButton.hoverColor : scheduleButton.defaultColor
                                   } else {
                                       "#3B4252"
                                   }

    }

    background: Rectangle {
        id: buttonBackground
        color: internal.dynamicColor

        Text {
            text: scheduleButton.title
            color: "#ffffff"
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 10
            font.pointSize: 12

        }

    }


}
