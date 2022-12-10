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

    Text {
        id: greeting
        width: 126
        height: 70
        color: "#ffffff"
        text: qsTr("Login")
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenterOffset: -110
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
        id: textField
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

    LoginButton {
        id: loginButton
        width: 200
        height: 50
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 77
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            if (textField.text.length == 13) {
                loginSucceeded();
                backend.validateCNP(textField.text);
            } else {
                errorLabel.visible = true
            }
        }

    }

    Label {
        id: errorLabel
        width: 122
        height: 20
        color: "#e44444"
        text: qsTr("Incorrect length!")
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 15
        anchors.horizontalCenterOffset: -46
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 10
        visible: false
    }

}



/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:580;width:1000}D{i:1}D{i:2}D{i:3}
}
##^##*/
