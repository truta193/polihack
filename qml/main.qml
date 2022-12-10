import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "components"
import "pages"

Window {
    flags: Qt.Window | Qt.FramelessWindowHint
    id: window
    width: 930
    height: 580
    visible: true
    color: "#00000000"
    title: qsTr("PFR")

    property alias stack: stackView

    property bool windowStatus: false
    property bool leftBarStatus: false

    QtObject {
        id: internal

        function maximizeRestore() {
            if (window.windowStatus == false) {
                window.windowStatus = true;
                window.showMaximized();
            } else {
                window.windowStatus = false;
                window.showNormal();
            }
        }

        function toggleLeftBar() {
            if (window.leftBarStatus == false) {
                window.leftBarStatus = true;
                leftbar.width = 250;
            } else {
                window.leftBarStatus = false;
                leftbar.width = 70;
            }
        }

        function validateUser() {

            leftbar.color = "#1e232b"
            menuToggle.enabled = true
            draftButton.enabled = true
            formButton.enabled = true
            formButton.isActive = true
            stackView.pop()
            stackView.push(Qt.resolvedUrl("pages/formPage.qml"))

        }


        function gotoPdf() {
            stackView.pop()
            stackView.push(Qt.resolvedUrl("pages/pdfPage.qml"))
        }
    }


    Rectangle {
        id: bg
        x: 10
        y: 10
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
                    id: menuToggle
                    defaultColor: "#1e232b"
                    onClicked: {
                        leftbarAnimation.start()
                    }
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
                        onClicked: window.showMinimized()
                    }

                    ControlButton {
                        id: maximizeButton
                        iconSource: "../../assets/images/window-maximize.png"
                        onClicked: internal.maximizeRestore()
                    }

                    ControlButton {
                        id: closeButton
                        clickColor: "#e54646"
                        iconSource: "../../assets/images/window-close.png"
                        onClicked: {Qt.callLater(Qt.quit)}
                    }
                }

                Rectangle {
                    id: topBarDraggable
                    height: 35
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: windowControls.left
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.topMargin: 0

                    MouseArea{
                        id: dragBar
                        property int prevX: 0
                        property int prevY: 0
                        x: -70
                        y: 0
                        anchors.fill: parent
                        onPressed: (mouse) => {
                                       prevX=mouse.x;
                                       prevY=mouse.y;
                                   }
                        onPositionChanged: (mouse) => {
                                               var deltaX = mouse.x - prevX;
                                               window.setX(window.x + deltaX);
                                               prevX = mouse.x - deltaX;

                                               var deltaY = mouse.y - prevY;
                                               window.setY(window.y + deltaY);
                                               prevY = mouse.y - deltaY;
                                           }
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

                    PropertyAnimation {
                        id: leftbarAnimation
                        target: leftbar
                        property: "width"
                        to: (leftbar.width == 70) ? 250 : 70
                        duration: 500
                        easing.type: Easing.OutExpo
                    }

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
                            title: "My documents"
                            onClicked: {
                                //ADD BUTTONS HERE
                                formButton.isActive = true
                                draftButton.isActive = false
                                stackView.push(Qt.resolvedUrl("pages/formPage.qml"))
                            }

                        }

                        LeftMenuButton {
                            id: draftButton
                            width: leftbar.width
                            title: "All documents"
                            onClicked:  {
                                //ADD BUTTONS HERE
                                formButton.isActive = false
                                draftButton.isActive = true
                                stackView.push(Qt.resolvedUrl("pages/homePage.qml"))
                            }
                        }
                    }
                }

                Rectangle {
                    id: pageContainer
                    color: "#2e3440"
                    anchors.left: leftbar.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    StackView {
                        id: stackView
                        anchors.fill: parent
                        initialItem: Qt.resolvedUrl("pages/loginPage.qml")
                        Component.onCompleted: {
                            menuToggle.enabled = false;
                            draftButton.enabled = false;
                            formButton.enabled = false;
                            leftbar.color = "#3B4252";

                            stackView.clear();

                            var list2 = stackView.push(Qt.resolvedUrl("pages/loginPage.qml"));
                            list2.loginSucceeded.connect(internal.validateUser);


                        }
                    }


                }

            }

        }
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
