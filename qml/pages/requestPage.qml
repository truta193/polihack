import QtQuick
import QtQuick.Controls

Rectangle {
    id: bg
    color: "#2e3440"
    implicitHeight: 400
    implicitWidth: 800
    anchors.fill: parent

    Rectangle {
        id: container
        color: "#00000000"
        anchors.fill: parent

        Label {
            id: selecterText
            color: "#ffffff"
            text: qsTr("Select type:")
            anchors.top: parent.top
            anchors.topMargin: 18
            font.pointSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }

        ComboBox {
            id: comboBox
            width: 252
            height: 43
            anchors.top: selecterText.bottom
            anchors.topMargin: 18
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextArea {
            id: textArea
            width: 452
            height: 159
            anchors.top: comboBox.bottom
            anchors.topMargin: 23
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Comment...")
        }

        Button {
            id: requestButton
            width: 200
            height: 50
            anchors.horizontalCenter: textArea.horizontalCenter

            visible: true
            anchors.top: textArea.bottom
            anchors.topMargin: 36

            implicitWidth: 250
            implicitHeight: 70

            onClicked: {leftHome.askDoctor(textArea.text)}


            property color defaultColor: "#4678E5"
            property color hoverColor: "#7EA1EE"
            property color clickColor: "#3155A1"
            x: 66

            QtObject {
                id: internal

                property var dynamicColor: if (requestButton.down) {
                                               requestButton.down ? requestButton.clickColor : requestButton.defaultColor
                                           } else {
                                               requestButton.hovered ? requestButton.hoverColor : requestButton.defaultColor
                                           }

            }

            background: Rectangle {
                id: buttonBackground
                color: internal.dynamicColor
                radius: 20
                Text {
                    text: "Request"
                    color: "#ffffff"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    font.pointSize: 12
                }
            }
        }
    }

}
