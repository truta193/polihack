import QtQuick
import QtQuick.Controls
import "../components"


Rectangle {
    id: bg

    color: "#2e3440"

    implicitHeight: 400
    implicitWidth: 800
    anchors.fill: parent

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

        function askDoctor(comment) {

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

            Flow {
                id: flow2
                anchors.fill: parent

                Rectangle {
                    id: leftSide
                    width: parent.width / 2
                    height: parent.height
                    color: "#00000000"

                    Label {
                        id: label1
                        color: "#ffffff"
                        text: qsTr("Diagnosis: ")
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: 15
                        anchors.topMargin: 0
                        font.pointSize: 16

                        visible: true
                    }

                    Label {
                        id: label2
                        x: 16
                        y: 372
                        color: "#ffffff"
                        text: qsTr("Over the counter medicine: ")
                        anchors.left: parent.left
                        anchors.top: label1.bottom
                        anchors.topMargin: 5
                        anchors.leftMargin: 15

                        font.pointSize: 16
                        visible: true
                    }

                    TextArea {
                        id: textArea
                        y: 420
                        width: 300
                        height: 120
                        visible: true
                        anchors.left: parent.left
                        anchors.top: label2.bottom
                        font.pointSize: 12
                        anchors.topMargin: 10
                        anchors.leftMargin: 15
                        placeholderText: qsTr("Comment...")
                        wrapMode: "WrapAtWordBoundaryOrAnywhere"
                        anchors.horizontalCenter: parent.horizontalCenter

                    }

                    Button {

                        id: requestButton
                        width: 200
                        height: 50
                        anchors.horizontalCenter: textArea.horizontalCenter

                        visible: true
                        anchors.top: textArea.bottom
                        anchors.topMargin: 19

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
                                text: "Ask my doctor"
                                color: "#ffffff"
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                font.pointSize: 12
                            }
                        }
                    }
                }

                Rectangle {
                    id: rightSide
                    width: parent.width / 2
                    height: parent.height
                    color: "#00000000"

                    ScrollView {
                        id: scrollView
                        contentWidth: rightSide.width - 35
                        y: 0
                        width: scrollView.contentWidth
                        height: 190
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.rightMargin: 15
                        anchors.horizontalCenterOffset: 0
                        anchors.topMargin: 0
                        anchors.horizontalCenter: parent.horizontalCenter

                        Column {
                            id: scheduleColumn
                            width: parent.width
                            height: 20 * 30
                            visible: true

                            spacing: 1
                            Repeater {
                                model: 20
                                delegate: ScheduleButton {
                                    neededWidth: scheduleColumn.width
                                }
                            }
                        }
                    }

                    Button {

                        id: appointmentButton
                        width: 200
                        height: 50
                        anchors.horizontalCenter: scrollView.horizontalCenter

                        visible: true
                        anchors.top: scrollView.bottom
                        anchors.topMargin: 19

                        implicitWidth: 250
                        implicitHeight: 70

                        onClicked: {leftHome.askDoctor(textArea.text)}


                        property color defaultColor: "#4678E5"
                        property color hoverColor: "#7EA1EE"
                        property color clickColor: "#3155A1"

                        QtObject {
                            id: internal2

                            property var dynamicColor: if (appointmentButton.down) {
                                                           appointmentButton.down ? appointmentButton.clickColor : appointmentButton.defaultColor
                                                       } else {
                                                           appointmentButton.hovered ? appointmentButton.hoverColor : appointmentButton.defaultColor
                                                       }

                        }

                        enabled: false

                        background: Rectangle {
                            id: buttonBackground2
                            color: internal2.dynamicColor
                            radius: 20
                            Text {
                                text: "Request appointment"
                                color: "#ffffff"
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                font.pointSize: 12
                            }
                        }
                    }
                }

            }


        }

        Rectangle {
            id: inputContainer
            height: 123
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            Flow {
                id: flow1
                height: parent.height - 35
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 35
                anchors.rightMargin: 0

                anchors.leftMargin: 0
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

            Rectangle {
                id: titleContainer
                height: 35
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                Label {
                    id: label
                    x: 15
                    width: 50
                    height: 20
                    color: "#ffffff"
                    text: qsTr("Symptoms:")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pointSize: 16
                    anchors.leftMargin: 15
                    anchors.topMargin: 0
                }
            }
        }
    }


}

/*##^##
Designer {
    D{i:0;height:400;width:800}D{i:8}D{i:13}D{i:17}D{i:22}D{i:29}D{i:28}
}
##^##*/
