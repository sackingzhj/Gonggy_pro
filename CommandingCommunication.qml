import QtQuick 2.0
import QtCharts 2.1

Item {
    width: root.width
    height: root.height

    Rectangle {
        id: top_info
        width: root.width
        height: 50
        color: "#ffffff"
        anchors.top: parent.top

        Rectangle {
            id: back_welcomepage_rec
            width: 86
            height: 30
            border.color: "#0b5dd9"
            border.width: 2
            radius: 5
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 10

            Text {
                id: back_welcomepage
                text: qsTr("返回主菜单")
                anchors.centerIn: parent
                color: "#0b5dd9"
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    mainloader.source = "WelcomePage.qml"
                }

                onEntered: {
                    parent.color = "#0b5dd9"
                    back_welcomepage.color = "white"

                }

                onExited: {
                    parent.color = "white"
                    back_welcomepage.color = "#0b5dd9"
                }
            }

        }
        Rectangle {
            id: user_rec
            anchors.right:  back_welcomepage_rec.left
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            width: 120
            height: 48

            Image {
                id: user_avatar
                source: "./images/user_avatr.png"
                width: 24
                height: 24
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
            }

            Text {
                id: user_name
                text: qsTr("周惠杰")
                font.pointSize: 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: user_avatar.right
                anchors.leftMargin: 10
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onClicked: {
                    content_info_loader.source = "MainDetails.qml"
                }

                onEntered: {
                    parent.color = "#f9f9f9"
                }

                onExited: {
                    parent.color = "white"
                }
            }
        }

        Rectangle {
            id: message_rec
            anchors.right:  user_rec.left
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            width: 38
            height: 48

            Image {
                id: message_img
                source: "./images/message_img.png"
                width: 24
                height: 24
                anchors.centerIn: parent
            }

            Rectangle {
                width: 30
                height: 20
                radius: 10
                anchors.horizontalCenter: message_img.right
                anchors.verticalCenter: message_img.top
                color: "red"

                Text {
                    id: message_count
                    text: qsTr("99+")
                    font.pointSize: 8
                    font.bold: true
                    color: "white"
                    anchors.centerIn: parent
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onClicked: {
                    content_info_loader.source = "MainDetails.qml"
                }

                onEntered: {
                    parent.color = "#f9f9f9"
                }

                onExited: {
                    parent.color = "white"
                }
            }
        }

        Rectangle {
            id: help_rec
            anchors.right:  message_rec.left
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            width: 38
            height: 48

            Image {
                id: help_img
                source: "./images/help_img.png"
                width: 24
                height: 24
                anchors.centerIn: parent
            }


            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onClicked: {
                    content_info_loader.source = "MainDetails.qml"
                }

                onEntered: {
                    parent.color = "#f9f9f9"
                }

                onExited: {
                    parent.color = "white"
                }
            }
        }
    }

    ChartView {
         width: 400
         height: 300
         theme: ChartView.ChartThemeBrownSand
         antialiasing: true

         PieSeries {
             id: pieSeries
             PieSlice { label: "eaten"; value: 94.9 }
             PieSlice { label: "not yet eaten"; value: 5.1 }
         }

    }

    ChartView {
         title: "Bar series"
         width: 400
         height: 300
         legend.alignment: Qt.AlignBottom
         antialiasing: true
         anchors.centerIn: parent

         BarSeries {
             id: mySeries
             axisX: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }
             BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
             BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
             BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
         }
     }
}
