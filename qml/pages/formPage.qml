import QtQuick
import QtQuick.Controls
import "../components"

Item {
    Rectangle {
        id: container
        color: "#4c566a"
        anchors.fill: parent

        ScrollView {
            id: scrollView
            anchors.fill: parent
            contentWidth: parent.width


            Flow {
                id: flow1
                anchors.fill: parent
                anchors.rightMargin: 1
                anchors.leftMargin: 1
                anchors.bottomMargin: 1
                anchors.topMargin: 1
                leftPadding: 10
                padding: 10
                topPadding: 10
                spacing: 10

                FormEntry {

                }
                FormEntry {

                }
                FormEntry {

                }
                FormEntry {

                }            FormEntry {

                }            FormEntry {

                }            FormEntry {

                }            FormEntry {

                }            FormEntry {

                }            FormEntry {

                }            FormEntry {

                }            FormEntry {

                }            FormEntry {

                }            FormEntry {

                }            FormEntry {

                }            FormEntry {

                }            FormEntry {

                }            FormEntry {

                }

            }
        }


    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:520;width:930}D{i:3}D{i:2}D{i:1}
}
##^##*/
