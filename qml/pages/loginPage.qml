import QtQuick
import QtQuick.Controls
import "../components"

Rectangle {
    id: loginContainer
    color: "#2e3440"
    anchors.fill: parent

    signal loginSucceeded()

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
        id: loginBUtton
        width: 199
        height: 51
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 77
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {if (textField.text.length == 13) loginSucceeded()}

    }

}



/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:580;width:1000}D{i:1}D{i:2}D{i:3}
}
##^##*/
