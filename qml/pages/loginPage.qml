import QtQuick
import QtQuick.Controls
import "../components"

Rectangle {
    id: loginContainer
    color: "#2e3440"
    anchors.fill: parent

    signal loginSucceeded()

    Connections {
        target: backend

        function onSetName(stringText) {
            draftButton.text = stringText
        }
    }

    Rectangle {
        id: container
        width: 250
        height: 400
        color: "#00000000"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: greeting
            x: 62
            y: 55
            width: 126
            height: 70
            color: "#ffffff"
            text: qsTr("Login")
            anchors.top: parent.top
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 24
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: inputs
            width: 250
            height: 203
            color: "#00000000"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.topMargin: 59

            TextField {
                id: authField
                x: 10
                y: 220
                width: 229
                height: 0
                anchors.top: textField.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                validator: RegularExpressionValidator {
                    regularExpression: /^[0-9]{1,6}$/
                }
                placeholderText: qsTr("Code")
                hoverEnabled: true
                visible: false

                PropertyAnimation {
                    id: resizeAnim
                    target: authField
                    duration: 500
                    property: "height"
                    to: 37
                    easing.type: Easing.InCirc

                }
            }

            TextField {
                id: textField
                x: 10
                y: 163
                width: 229
                height: 37
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -18
                anchors.horizontalCenter: parent.horizontalCenter
                hoverEnabled: true
                placeholderText: qsTr("CNP")
                validator: RegularExpressionValidator {
                    regularExpression: /^[0-9]{1,13}$/
                }


            }

            Label {
                id: errorLabel
                x: 18
                y: 146
                width: 122
                height: 20
                color: "#e44444"
                text: qsTr("Incorrect length!")
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 9
                anchors.horizontalCenterOffset: -46
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 10
                visible: false
            }

            Rectangle {
                id: rectangle
                width: 200
                height: 200
                color: "#00000000"
                anchors.top: authField.bottom
                anchors.topMargin: 99
                anchors.horizontalCenter: parent.horizontalCenter

                LoginButton {
                    id: loginButton
                    x: 25
                    width: 200
                    height: 50
                    anchors.top: parent.top
                    anchors.topMargin: -76
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        if (textField.text.length == 13) {

                            backend.validateCNP(textField.text);
                            resizeAnim.start();
                            authField.focus = true
                            textField.enabled = false
                            authField.visible = true
                            if (authField.text.length == 6) {
                                loginSucceeded();
                            }
                        } else {
                            errorLabel.visible = true
                        }
                    }

                }
            }
        }
    }



}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
