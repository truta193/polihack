import QtQuick
import QtQuick.Controls

Rectangle {
    id: dropdownMenu
    color: "#00000000"
    height: 500
    width: 800

    property string labelText: ""
    property int itemCount: 0


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

        Pane {
            id: pane
            height: 4
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: categoryLabel.right
            anchors.right: parent.right
            anchors.leftMargin: 15
            anchors.rightMargin: 15
        }

        Label {
            id: categoryLabel
            color: "#ffffff"
            text: qsTr(dropdownMenu.labelText)
            anchors.left: parent.left
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            font.pointSize: 12
            anchors.topMargin: 5
            anchors.leftMargin: 15
        }

    }

    Rectangle {
        id: container
        color: "#00000000"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: topContainer.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 0

        Flow {
            id: flowStuff
            anchors.fill: parent

            Repeater {
                model: dropdownMenu.itemCount
                id: repeater
                anchors.fill: parent
                delegate: FormEntry {}
            }

        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:400;width:900}D{i:2}D{i:3}D{i:1}
}
##^##*/
