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
    property string title: ""

    QtObject {
        id: internal

        property var dynamicColor: if (menuButton.down) {
                                       menuButton.down ? menuButton.clickColor : menuButton.defaultColor
                                   } else if (menuButton.enabled){
                                       menuButton.hovered ? menuButton.hoverColor : menuButton.defaultColor
                                   } else {
                                       "#3B4252"
                                   }

    }

    background: Rectangle {
        id: buttonBackground
        color: internal.dynamicColor

        Image {
            id: buttonIcon
            source: menuButton.iconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 22
            width: menuButton.iconWidth
            height: menuButton.iconHeight
            fillMode: Image.PreserveAspectFit
        }

        Text {
            text: menuButton.title
            color: "#ffffff"
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 75
            font.pointSize: 12

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
