import QtQuick
import QtQuick.Controls

Button {
    id: toggleButton

    implicitWidth: 70
    implicitHeight: 60

    property color defaultColor: "#1e232b"
    property color hoverColor: "#4C566A"
    property color clickColor: "#4678E5"

    QtObject {
        id: internal

        property var dynamicColor: if (toggleButton.down) {
                                       toggleButton.down ? toggleButton.clickColor : toggleButton.defaultColor
                                   } else {
                                       toggleButton.hovered ? toggleButton.hoverColor : toggleButton.defaultColor
                                   }

    }

    background: Rectangle {
        id: buttonBackground
        color: internal.dynamicColor

        Image {
            id: buttonIcon
            source: "../../assets/images/menu_icon.svg"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 35
            width: 35
            fillMode: Image.PreserveAspectFit
        }
    }
}
