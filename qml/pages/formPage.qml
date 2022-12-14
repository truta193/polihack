import QtQuick
import QtQuick.Controls
import "../components"

Item {
    Rectangle {
        id: container
        color: "#2e3440"

        anchors.fill: parent

        ScrollView {
            id: scrollView
            anchors.fill: parent
            contentWidth: parent.width

            Column {
                id: column
                anchors.fill: parent
                width: parent.width
                padding: 5
                rightPadding: 5
                bottomPadding: 5
                leftPadding: 5
                topPadding: 5
                spacing: 5

                CategoryDropdown {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    labelText: "Retete"
                    itemCount: 7


                }
                CategoryDropdown {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    labelText: "Adeverinte"
                    itemCount: 6

                }
                CategoryDropdown {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0
                    labelText: "Trimiteri"
                    itemCount: 8

                }
            }



        }


    }

}
