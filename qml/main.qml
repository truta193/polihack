import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "components"

Window {
    flags: Qt.FramelessWindowHint
    id: window
    width: 1000
    height: 580
    visible: true
    color: "#00000000"
    title: qsTr("Hello World")

    Rectangle {
        id: bg
        color: "#2e3440"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10

        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#1e232b"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleButton {
                    defaultColor: "#1e232b"

                }

                Row {
                    id: windowControls
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.rightMargin: 0

                    ControlButton {
                        id: minimizeButton
                        iconSource: "../../assets/images/window-minimize.png"

                    }

                    ControlButton {
                        id: maximizeButton
                        iconSource: "../../assets/images/window-maximize.png"
                    }

                    ControlButton {
                        id: closeButton
                        iconSource: "../../assets/images/window-close.png"
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0

                Rectangle {
                    id: leftbar
                    width: 70
                    color: "#1e232b"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0

                    property int activeChild: -1

                    Column {
                        id: column
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0


                        LeftMenuButton {
                            id: formButton
                            width: leftbar.width
                            onClicked: {
                                //ADD BUTTONS HERE
                                formButton.isActive = true
                                draftButton.isActive = false
                            }

                        }

                        LeftMenuButton {
                            id: draftButton
                            width: leftbar.width
                            onClicked:  {
                                //ADD BUTTONS HERE
                                formButton.isActive = false
                                draftButton.isActive = true
                            }
                        }
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:7}D{i:8}D{i:3}D{i:13}D{i:11}D{i:10}D{i:9}D{i:2}D{i:1}
}
##^##*/
