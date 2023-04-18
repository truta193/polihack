import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material.impl 2.12

Button {
    id: menuButton

    implicitWidth: 300
    implicitHeight: 70
    width: parent.width
    checkable: true
    autoExclusive: true

    property url iconSource: "qrc:///assets/menu_icon.svg"
    property color defaultColor: "#D6E6F2"
    property color hoverColor: "#C8DFEE"
    property color clickColor: "#769FCD"
    property int iconWidth: 25
    property int iconHeight: 25
    property string title: ""

    property int sixWidth: width * 6

    QtObject {
        id: internal

        //property var dynamicColor: {menuButton.hovered ? hoverColor : (menuButton.down ? : clickColor : (menuButton.checked ? "#B9D7EA" : defaultColor))};
        property var dynamicColor: if (menuButton.down || menuButton.hovered) {
                                       hoverColor
                                   } else if (checked) {
                                       "#B9D7EA"
                                   } else {
                                       defaultColor
                                   }
    }

    onCheckedChanged: checked ? checked : !checked


    background: Rectangle {
        color: internal.dynamicColor
        clip: true

        Image {
            id: buttonIcon
            source: menuButton.iconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 27
            width: menuButton.iconWidth
            height: menuButton.iconHeight
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            id: checkedTagLeft
            width: 3
            height: menuButton.height
            color : "#769FCD"
            anchors {
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            visible: menuButton.checked
        }

        Rectangle {
            id: ripple
            property int diameter: 0
            property int pressX: 0
            property int pressY: 0

            x: pressX - radius
            y: pressY - radius

            color: "#A9C9E3"
            radius: diameter / 2
            width: diameter
            height: diameter

            opacity: 1 - diameter / menuButton.sixWidth

            function animate(x, y, size) {
                pressX = x
                pressY = y
                diameter = size
            }

            Behavior on diameter {
                PropertyAnimation {
                    duration: 150
                    onRunningChanged: {
                        if(!running) {
                            duration = 0;
                            ripple.diameter = 0;
                            duration = 150;
                        }
                    }
                }
            }
        }
    }

    onClicked: {
        ripple.animate(pressX, pressY, menuButton.sixWidth)
    }

    contentItem: Item {
        implicitWidth: txt.implicitWidth
        implicitHeight: 40

        Text {
            id: txt
            x: 80
            anchors.verticalCenter: parent.verticalCenter
            text: menuButton.text
            font.pointSize: 16
        }
    }


}
