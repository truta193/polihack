import QtQuick 2.15
import QtQuick.Controls
import "../components"

Rectangle {
    id: container
    implicitWidth: 1200
    implicitHeight: 600
    width: stackView.width
    height: stackView.height

    property int globalpid: 0

    Connections {
        target: backend

        function onSearchReady(name, pid) {
            searchModel.append({"pname": name, "pid": pid})
        }

        function onPfileReady(string) {
            pdfModel.append({"src" : string})
        }

    }

    function handleMenuSelect(name, pid) {
        searchBar.text = ""
        nameLabel.text = name
        pdfModel.clear()
        backend.pacientLoad(pid)
        globalpid = pid


    }


    Rectangle {
        id: header
        height: 70
        color: "#ffffff"
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        clip: true

        Label {
            id: nameLabel
            width: 350
            height: 40
            text: "Nobody"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 14
            anchors.leftMargin: 30
        }

        TextField {
            id: searchBar
            width: 250
            height: 40
            leftPadding: 40
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 20
            font.pointSize: 14
            placeholderText: qsTr("Search...")

            onTextChanged: {
                searchModel.clear()
                backend.searchList(searchBar.text)
                searchList.open()

            }

            background: Rectangle {
                id: bkground
                radius: 2
                border.width: 1
                border.color: "#D6E6F2"

                Image {
                    id: iconSearch
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    fillMode: Image.PreserveAspectFit
                    sourceSize.height: 20
                    source: "qrc:///assets/images/search-icon.svg"
                }

            }

            Menu {
                id: searchList
                focus: false
                onFocusChanged: {
                    activeFocus = searchBar
                }

                width: searchBar.width
                height: searchList.implicitContentHeight
                x: searchBar.x
                y: 40


                ListModel {
                    id: searchModel
                }

                Repeater {
                    id: searchRepeater
                    model: searchModel
                    MenuItem {
                        id: menuitm
                        text: pname
                        onTriggered: {
                            handleMenuSelect(pname, pid)
                        }
                    }
                }
            }
        }


    }


    Rectangle {
        id: bodyContainer
        color: "#ffffff"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: line.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 0

        ScrollView {
            id: scrollArea
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.topMargin: 10
            anchors.rightMargin: 10
            contentWidth: parent.width - 20
            contentHeight: gridLayout.implicitHeight

            Grid{
                id: gridLayout
                readonly property int elementWidth: 200

                columns: Math.max(Math.floor(parent.width / (elementWidth+10)), 1)
                rows: 2*Math.max(Math.floor((children.length) / columns), 1)

                anchors.fill: parent
                rowSpacing: 5
                columnSpacing: rowSpacing

                ListModel {
                        id: pdfModel
                }

                Repeater {
                    id: gridRepeater
                    model: pdfModel
                    delegate: PdfItem {
                        documentPath: src;
                        onPdfPopup: {
                            pdfViewPopup.curFile = src
                            pdfViewPopup.open()
                        }
                    }
                }

            }

        }

        Rectangle {
            id: dropFiller
            anchors.fill: parent
            color: "#00000000"
            width: 0

            Image {
                id: dropPlus
                source: "qrc:///assets/images/plus.svg"
                antialiasing: true
                mipmap: true
                height: 100
                width: 100
                opacity: 0.4
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                visible: false
            }

        }

        DropArea {
                id: dropArea;
                anchors.fill: parent
                onEntered: {
                    dropFiller.color = "#a0D6E6F2";
                    drag.accept (Qt.LinkAction);
                    dropFiller.width = parent.width
                    dropPlus.visible = true
                }

                onDropped: {
                    backend.pfileUpload(drop.urls, globalpid)
                    //Upload to database
                    dropFiller.color = "#00000000"
                    dropFiller.width = 0;
                    dropPlus.visible = false
                }
                onExited: {
                    dropFiller.color = "#00000000";
                    dropFiller.width = 0;
                    dropPlus.visible = false
                }
            }
    }

    Rectangle {
        id: line
        implicitWidth: 200
        width: parent.width
        height: 2
        color: "#D6E6F2"
        border.width: 0
        anchors.top: header.bottom
        anchors.topMargin: 0
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5;height:800;width:1200}
}
##^##*/
