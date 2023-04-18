/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import "components"
import "pages"

Rectangle {
    id: centralWidget
    width: parent.width
    height: parent.height
    color: "#d6e6f2"

    //property alias stackView: stackView

    Connections {
        target: backend
    }

    Popup {
        id: pdfViewPopup

        property alias pdfViewPopup: pdfViewPopup
        property string curFile: ""

        x: Math.round((Overlay.overlay.width - width) / 2)
        y: Math.round((Overlay.overlay.height - height) / 2)
        width: Overlay.overlay.width * 0.6
        height: Overlay.overlay.height * 0.95

        Overlay.modal: Rectangle {
                color: "#ca000000"
            }

        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        DocumentViewer {
            id: popupViewer
            file: pdfViewPopup.curFile
        }


    }

    Rectangle {
        id: mainWidget
        color: "#f7fbfc"
        border.width: 0
        anchors.fill: parent
        anchors.rightMargin: 2
        anchors.leftMargin: 2
        anchors.bottomMargin: 2
        anchors.topMargin: 2

        Rectangle {

            property bool isMenuOpen: true
            property int openWidth: 300
            property int closedWidth: 80

            PropertyAnimation {
                id: leftMenuAnimation
                target: leftMenu
                property: "width"
                to: (leftMenu.width === leftMenu.closedWidth) ? leftMenu.openWidth : leftMenu.closedWidth
                duration: 300
                easing.type: Easing.OutExpo
            }

            id: leftMenu
            width: 300
            color: "#d6e6f2"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0

            Rectangle {
                id: leftMenuHeader
                height: 150
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0



                Button {
                    id: leftMenuToggle
                    width: 60
                    height: 60

                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10

                    property color defaultColor: "#D6E6F2"
                    property color hoverColor: "#C8DFEE"
                    property color clickColor: "#769FCD"

                    QtObject {
                        id: internal

                        //property var dynamicColor: {menuButton.hovered ? hoverColor : (menuButton.down ? : clickColor : (menuButton.checked ? "#B9D7EA" : defaultColor))};
                        property var dynamicColor: if (leftMenuToggle.down){
                                                       leftMenuToggle.clickColor
                                                   }else if (leftMenuToggle.hovered) {
                                                       leftMenuToggle.hoverColor
                                                   } else{
                                                       leftMenuToggle.defaultColor
                                                   }
                    }

                    onClicked: {
                        leftMenuAnimation.start();
                        leftMenu.isMenuOpen = !leftMenu.isMenuOpen;
                    }

                    background: Rectangle {
                        id: buttonBackground
                        color: internal.dynamicColor

                        radius: 30

                        Image {
                            id: buttonIcon
                            source: "qrc:///assets/images/menu-icon.svg"
                            mipmap: true
                            layer.mipmap: true
                            smooth: false
                            layer.smooth: true
                            antialiasing: true
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: 45
                            opacity: 1
                            width: 45
                            fillMode: Image.PreserveAspectFit
                        }
                    }

}
                Label {
                    id: leftMenuTitle
                    width: 180
                    height: 30
                    color: "#313131"
                    text: qsTr("DocQT")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: leftMenuToggle.right
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Arial"
                    font.pointSize: 16
                    anchors.leftMargin: 15
                }
            }

            Rectangle {
                id: leftMenuContent
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: leftMenuHeader.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                Column {
                    id: leftMenuColumn
                    anchors.fill: parent

                    LeftMenuButton {
                        id: myDocumentsButton
                        checked: true
                        iconSource: "qrc:///assets/images/documents-folder.svg"
                        text: "My Documents"
                        onClicked: {
                            //stackView.push("pages/DocumentBrowser.qml")
                            stackView.pop()
                        }
                    }
                    LeftMenuButton {
                        iconSource: "qrc:///assets/images/pacients-icon.svg"
                        text: "My Pacients"
                        onClicked: {
                            //stackView.pop()
                            stackView.push("pages/PacientDocumentBrowser.qml")
                        }
                    }
                }
            }
        }

        Rectangle {
            id: content
            color: "#ffffff"
            anchors.left: leftMenu.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.topMargin: 0

            StackView {
                id: stackView
                clip: true
                anchors.fill: parent
                initialItem: DocumentBrowser {}
            }
        }


    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66;height:600;width:1200}
}
##^##*/

