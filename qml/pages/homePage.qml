import QtQuick
import QtQuick.Controls

Rectangle {
    id: bg
    color: "#2e3440"
    implicitHeight: 400
    implicitWidth: 800

    Rectangle {
        id: leftHome
        color: "#00000000"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0


        function showStuff(diag, otcm) {
            label1.visible = true
            label1.text += diag
            label2.visible = true
            label2.text += otcm
            textArea.visible = true
            requestButton.visible = true
        }


        Rectangle {
            id: outputContainer
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: inputContainer.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 0

            Label {
                id: label1
                y: 24
                color: "#ffffff"
                text: qsTr("Diagnosis: ")
                anchors.left: parent.left
                anchors.leftMargin: 16
                font.pointSize: 16
                visible: false
            }

            Label {
                id: label2
                color: "#ffffff"
                text: qsTr("Over the counter medicine: ")
                anchors.left: parent.left
                anchors.top: label1.bottom
                anchors.topMargin: 20
                anchors.leftMargin: 16
                font.pointSize: 16
                visible: false
            }

            Button {
                id: requestButton
                width: 200
                height: 50
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 100
                anchors.horizontalCenter: parent.horizontalCenter

                visible: false

                implicitWidth: 250
                implicitHeight: 70


                property color defaultColor: "#4678E5"
                property color hoverColor: "#7EA1EE"
                property color clickColor: "#3155A1"

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
                        text: "Request an Appointment"
                        color: "#ffffff"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        font.pointSize: 12
                    }
                }
            }

            TextArea {
                id: textArea
                width: 300
                height: 150
                visible: false
                anchors.left: parent.left
                anchors.top: label2.bottom
                font.pointSize: 12
                anchors.topMargin: 20
                anchors.leftMargin: 16
                placeholderText: qsTr("Comment...")
            }


        }

        Rectangle {
            id: inputContainer
            height: 100
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            Flow {
                id: flow1
                height: 400
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: label.bottom
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 5
                spacing: 1
                padding: 10

                ComboBox {
                    id: symptop1
                    width: 150
                    height: 35
                    model: ["", "Firstttttttttttttttt", "Second", "Third", "First", "Second",, "Fitttttttttrst", "Sectttttttttttttttttond",, "First", "Second",, "First", "Second",, "First", "Second",, "First", "Second",, "First", "Second",]

                    onActivated: {
                        leftHome.showStuff("1", "1")
                    }
                }

                ComboBox {
                    id: symptop2
                    width: 150
                    height: 35
                    model: ["", "First", "Second", "Third"]
                    onActivated: {
                        leftHome.showStuff()
                    }
                }

                ComboBox {
                    id: symptop3
                    width: 150
                    height: 35
                    model: ["", "First", "Second", "Third"]
                    onActivated: {
                        leftHome.showStuff()
                    }
                }

                ComboBox {
                    id: symptop4
                    width: 150
                    height: 35
                    model: ["", "First", "Second", "Third"]
                    onActivated: {
                        leftHome.showStuff()
                    }
                }

                ComboBox {
                    id: symptop5
                    width: 150
                    height: 35
                    model: ["", "First", "Second", "Third"]
                    onActivated: {
                        leftHome.showStuff("5", "5")
                    }
                }
            }

            Label {
                id: label
                x: 15
                y: 10
                width: 50
                height: 20
                color: "#ffffff"
                text: qsTr("Symptoms:")
                anchors.left: parent.left
                anchors.top: parent.top
                font.pointSize: 16
                anchors.leftMargin: 15
                anchors.topMargin: 10
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:400;width:800}D{i:3}D{i:4}D{i:9}D{i:2}D{i:11}D{i:10}D{i:1}
}
##^##*/
