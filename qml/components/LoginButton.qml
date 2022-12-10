import QtQuick
import QtQuick.Controls

RoundButton {
    id: loginButton

    implicitWidth: 250
    implicitHeight: 70


    property color defaultColor: "#4678E5"
    property color hoverColor: "#7EA1EE"
    property color clickColor: "#3155A1"

    QtObject {
        id: internal

        property var dynamicColor: if (loginButton.down) {
                                       loginButton.down ? loginButton.clickColor : loginButton.defaultColor
                                   } else {
                                       loginButton.hovered ? loginButton.hoverColor : loginButton.defaultColor
                                   }

    }

    background: Rectangle {
        id: buttonBackground
        color: internal.dynamicColor
        radius: 20
        Text {
            text: "Verify"
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
