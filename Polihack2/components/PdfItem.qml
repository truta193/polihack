import QtQuick
import QtQuick.Controls

Rectangle {
    id: container
    property string documentPath : ""
    property color baseColor: "#D6E6F2"
    width: 200
    height: 300

    signal pdfPopup

    MouseArea {
                id: mouseArea
                enabled: true
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    container.pdfPopup()
                }
                onEntered: {
                    externalButton.visible=true
                }
                onExited: {
                    externalButton.visible=false
                }
            }

    QtObject {
        id: internal
        property var dynamicColor : {if (mouseArea.containsMouse) {
                                        "#C8DFEE"} else {baseColor}
        }
        property var dynamicColorTextBg: {if (mouseArea.containsMouse) {
                                        "#C8DFEE"} else {"#e8e8e8"}

        }
    }

    color: internal.dynamicColor

    function basename(str) {
        return (str.slice(str.lastIndexOf("/")+1))
    }


    Rectangle {
        id: pdfPreview
        color: "#ffffff"
        border.color: "#00000000"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 70
        anchors.topMargin: 3
        anchors.rightMargin: 3
        anchors.leftMargin: 3

        Image {
            id: preview
            source: documentPath
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }

    }

    Button {
        id: externalButton
        width: 50
        height: 50
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 5
        anchors.topMargin: 5
        visible: false
        onClicked: {
            Qt.openUrlExternally(documentPath)
        }

        background: Rectangle {
            id: buttonBackground
            color: "#00000000"

            Image {
                id: buttonIcon
                source: "qrc:///assets/images/open-external.svg"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                height: 35
                width: 35
                fillMode: Image.PreserveAspectFit
            }
        }

    }

    Rectangle {
        id: pdfLabel
        color: internal.dynamicColorTextBg
        border.color: "#00000000"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: pdfPreview.bottom
        anchors.bottom: parent.bottom
        anchors.rightMargin: 3
        anchors.topMargin: 0
        anchors.leftMargin: 3
        anchors.bottomMargin: 3


        Label {
            text: basename(documentPath)
            anchors.fill: parent
            anchors.topMargin: 5
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
            font.styleName: "Regular"
            font.pointSize: 12
        }
    }



}

