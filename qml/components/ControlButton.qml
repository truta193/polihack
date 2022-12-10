import QtQuick
import QtQuick.Controls

Button {
    id: controlButton

    width: 35
    height: 35

    property url iconSource: "../../assets/images/window-maximize.png"
    property color defaultColor: "#1e232b"
    property color hoverColor: "#4C566A"
    property color clickColor: "#4678E5"

    QtObject {
        id: internal

        property var dynamicColor: if (controlButton.down) {
                                       controlButton.down ? controlButton.clickColor : controlButton.defaultColor
                                   } else {
                                       controlButton.hovered ? controlButton.hoverColor : controlButton.defaultColor
                                   }

    }

    background: Rectangle {
        id: buttonBackground
        color: internal.dynamicColor

        Image {
            id: buttonIcon
            source: iconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 25
            width: 25
            fillMode: Image.PreserveAspectFit
        }
    }
}
