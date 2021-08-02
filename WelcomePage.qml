import QtQuick 2.0
import QtQuick.Layouts 1.2

Item {

    Rectangle {
        id: top_rec
        width: root.width
//        height: 55
        color: "#fafbfd"

        Image {
            id: pro_logo
            source: "images/logo@2x.png"
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 15
        }

        Rectangle {
            width: 86
            height: 30
            border.color: "#0b5dd9"
            border.width: 2
            radius: 5
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 15

            Text {
                text: qsTr("登    录")
                anchors.centerIn: parent
                color: "#0b5dd9"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {

                }
            }

        }


        RowLayout {
            width: root.width
            height: 50
            Text {
                id: pro_title
                text: qsTr("西镇高速项目信息化管理平台")
                font.pointSize: 32
                Layout.alignment: Qt.AlignCenter
                height: 30
            }




        }


  }
//    Rectangle {
//        width: root.width - 10
//        height: 5
//        color: "#e5e9ec"
//        anchors.top: top_rec.bottom
//        anchors.topMargin: 52
//        anchors.horizontalCenter: top_rec.horizontalCenter
//    }

    ColumnLayout {

    }

}
