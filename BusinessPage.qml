import QtQuick 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.3


Item {

    MyListviewModel {
        id:my_list_view_model

    }

    function menu_list_tile(model_title){
        switch (model_title){
            case "CommandingCommunication" :
                mainloader.source = "CommandingCommunication.qml"
                break;
            case "CostAndSchedule" :
                listview.model = my_list_view_model.resources[0];
                break;
            case "QualityControl" :
                listview.model = my_list_view_model.resources[1];
                break;
            case "SafetyManagement" :
                listview.model = my_list_view_model.resources[2];
                break;
            case "LaborRealName" :
                listview.model = my_list_view_model.resources[3];
                break;
            case "PhysicalMonitoring" :
                listview.model = my_list_view_model.resources[4];
                break;
            case "EngineeringLog" :
                listview.model = my_list_view_model.resources[5];
                break;
            case "RecordFile" :
                listview.model = my_list_view_model.resources[6];
                break;
            default:
                 break;


        }

    }

    Rectangle {
        id: left_menu
        width: 210
        height: root.height
        color: "#001529"

        Image {
            id: menu_logo
            source: "./images/menu_logo.png"
            width: 32
            height: 32
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 3
        }

        Text {
            id: pro_name
            text: page_title_xml
            font.pointSize: 12
            font.bold: true
            color: "white"
            anchors.top: parent.top
            anchors.topMargin: 25
            anchors.left: menu_logo.right
            anchors.leftMargin: (175 - width) / 2
        }



        ListView {
            id:listview
            model: menu_list_tile(page_xml)
            delegate: menu_delegate
            anchors.top: pro_name.bottom
            anchors.topMargin: 80
            anchors.fill: parent
            focus: true
            section.property: "menugroup"
            section.delegate: section_delegate
            section.criteria: ViewSection.FullString

        }


        Component {
            id:menu_delegate
            Item{
                id:menu_delegate_item
                width: 210
                height: 45
                anchors.left: parent.left

               Rectangle {
                   width: 210
                   height: 45
                   color: menu_delegate_item.ListView.isCurrentItem ? "#1890ff" : "#000c17"
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.left: parent.left
                    Text {
                        id:menu_text
                        text: nametitle
                        font.pointSize: 10
                        color: menu_delegate_item.ListView.isCurrentItem ? "white" : "#a6adb4"
                        font.bold: menu_delegate_item.ListView.isCurrentItem ? true : false
                        anchors.left: parent.left
                        anchors.leftMargin: 40
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: {
                            menu_delegate_item.ListView.view.currentIndex = index

                            content_info_loader.source = menuurl
                        }

                    }
                }
            }

        }

        Component {
            id:section_delegate
            Rectangle {
                width: 210
                height: 45
                color: "#001529"
                Image {
                    id: meun_icon
                    width: 10
                    height: 10
                    source: "./images/menu_icon.png"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }
                Text {
                    text: section
                    color: "white"
                    font.pointSize: 12
                    font.bold:true
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: meun_icon.right
                    anchors.leftMargin: 5

                }
            }

        }

    }

    Rectangle {
        id: top_info
        width: root.width - 210
        height: 50
        color: "#ffffff"
        anchors.left:left_menu.right
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

    Rectangle {
        id: content_info
        width: root.width - 210
        height: root.height - 50
        color: "#f0f2f5"
        anchors.left:left_menu.right
        anchors.top: top_info.bottom

        Loader {
            id: content_info_loader
        }

        Component.onCompleted: {
            content_info_loader.source = "MainDetails.qml"
        }


    }
}

