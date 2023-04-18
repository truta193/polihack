import QtQuick 2.15
import QtQuick.Controls 2.0
import QtWebEngine 1.10


Rectangle {
    id: documentsContainer
    implicitWidth: 1920
    implicitHeight: 1080

    property string file: ""

    width: parent.width
    height: parent.height
    
        WebEngineView {
            id: webview
            visible: true
            anchors.fill: parent
            settings.pluginsEnabled: true
            settings.pdfViewerEnabled: true
            url: Qt.resolvedUrl(file)
        }
    
//        Button {
//            id: webviewClose
//            anchors.right: parent.right
//            anchors.rightMargin: 60
//            anchors.top: parent.top
//            anchors.topMargin: 5
//            width: 50
//            height: 50
//            onClicked: {
//                webview.visible = 0
//                webviewClose.width = 0
//            }
//        }

//    ListModel {
//        id: myModel
//        ListElement { name: "Matematica.pdf"; src: "../assets/t.pdf" }
//        ListElement { type: "Cat"; age: 5 }
//    }




//    Component {
//        id: myDelegate
//        Image {
//            source: src
//            width: 300
//            height: 400
//        }
//    }

//    ListView {
//        anchors.fill: parent
//        model: myModel
//        delegate: myDelegate
//    }

}
