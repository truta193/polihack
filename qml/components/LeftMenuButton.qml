import QtQuick
import QtQuick.Controls

Button {
    id: menuButton

    implicitWidth: 250
    implicitHeight: 70
    checkable: true

    property url iconSource: "../../assets/images/open_icon.svg"
    property color defaultColor: "#1e232b"
    property color hoverColor: "#4C566A"
    property color clickColor: "#4678E5"
    property int iconWidth: 25
    property int iconHeight: 25
    property bool isActive: false

    QtObject {
        id: internal

        property var dynamicColor: if (menuButton.down) {
                                       menuButton.down ? menuButton.clickColor : menuButton.defaultColor
                                   } else {
                                       menuButton.hovered ? menuButton.hoverColor : menuButton.defaultColor
                                   }

    }

    background: Rectangle {
        id: buttonBackground
        color: internal.dynamicColor

        Image {
            id: buttonIcon
            source: menuButton.iconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: menuButton.iconWidth
            height: menuButton.iconHeight
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: checkedTagLeft
            width: 3
            height: menuButton.height
            color : "#4678E5"
            anchors {
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            visible: isActive
        }

        Rectangle {
            id: checkedTagRight
            width: 3
            height: menuButton.height
            color: "#2e3440"
            anchors {
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }
            visible: isActive
        }
    }


}
