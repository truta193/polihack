import QtQuick
import QtQuick.Controls

Rectangle {
    id: dropdownMenu
    color: "#004ddd"
    implicitHeight: 400
    implicitWidth: 900

    Rectangle {
        id: topContainer
        height: 40
        color: "#00000000"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Image {
            id: dropArrow
            width: 30
            height: 30
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.leftMargin: 5
            fillMode: Image.PreserveAspectFit
        }

        ToolSeparator {
            id: toolSeparator
            y: 15
            height: 5
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: dropArrow.right
            anchors.right: parent.right
            anchors.leftMargin: 15
            anchors.rightMargin: 5
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:400;width:900}D{i:2}D{i:3}D{i:1}
}
##^##*/
