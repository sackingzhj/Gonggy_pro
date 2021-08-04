import QtQuick 2.1
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.1


Item {
    id:root_item
    width: root.width
    height: root.height
//    anchors.left: parent.left
//    anchors.right: parent.right
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
            anchors.topMargin: 25
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
            anchors.topMargin: 30

            Text {
                text: qsTr("登    录")
                anchors.centerIn: parent
                color: "#0b5dd9"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    dialog.visible = true
                }
            }

        }


        RowLayout {
            width: root.width
            height: 80
            Text {
                id: pro_title
                text: qsTr("西镇高速项目信息化管理平台")
                height: 50
                font.pointSize: 32
                Layout.alignment: Qt.AlignCenter

            }
        }
  }

    Component {
        id:contactDelegate
        Row{
        Rectangle{
            width: 200
            height: 300
            color: "red"
            Text {
                text: pro_mouduls + mouduls_url
            }
       }
        }
    }



    Rectangle {
        x: 0
        y: 100
        anchors.left: root.left
        anchors.right: root.right
        height: 2
        width:root.width
        color: "#C0C0C0"
    }


    Grid {
        id: grid_content
//        width: parent.width
//        height: parent.height - 200
        columns: 4
        x:0
        y:100
        columnSpacing: 40;
        rowSpacing: 40
        anchors.centerIn: parent

        add:Transition {  //加载时候的过度方式，不设置这属性的话，一进入该界面可看到布局
                    NumberAnimation {
                        properties:"x";
                        duration: 1000
                    } //刚开始进入时慢慢从左往右滑，而不是一进入就显示（执行动画效果）
                }

        move:Transition {  //子项由可见与不可见之间切换执行的过度
                    NumberAnimation {
                        properties:"x";
                        duration: 1000
                    } //当子项的visible发生变化执行的动画
                }

        Repeater {
            id:rep_content

            model:[
            ["指挥中心","./images/CommandingCommunication.png","CommandingCommunication.qml"],
            ["成本与进度","./images/CostAndSchedule.png","CommandingCommunication.qml"],
            ["质量管控","./images/QualityControl.png","CommandingCommunication.qml"],
            ["安全管理","./images/SafetyManagement.png","CommandingCommunication.qml"],
            ["劳务、设备、物料管理","./images/LaborRealName.png","CommandingCommunication.qml"],
            ["物联监测","./images/PhysicalMonitoring.png","CommandingCommunication.qml"],
            ["工程日志","./images/EngineeringLog.png","CommandingCommunication.qml"],
            ["资料档案","./images/RecordFile.png","CommandingCommunication.qml"]
            ]


//                ["指挥中心","成本与进度","质量管控","安全管理","劳务、设备、物料管理","物联监测","工程日志","资料档案"]

            Rectangle {
                width: root.width * 0.22+1
                height: (root.height-200) * 0.4
                color: "white"
                border.color: "#D3D3D3"
                border.width: 1
                radius: 5
                layer.enabled: true

                Image {
                    source: rep_content.model[index][1]
                    width:root.width * 0.22
                    anchors.topMargin: 0
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: (root.height-200) * 0.4 - 40

                }
                Text {
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 10
                    font.pointSize: 14
                    text: rep_content.model[index][0]
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        parent.color = "#D3D3D3"
                        parent.border.color = "#D3D3D3"
                        parent.border.width = 2

                    }

                    onExited: {
                        parent.color = "white"
                        parent.border.color = "#D3D3D3"
                        parent.border.width = 1
                    }

                    onClicked: {
                        mainloader.source = rep_content.model[index][2]
                    }


                }

            }

        }
}

    Rectangle {
        x: 0
        y: root.height-100
        anchors.left: root.left
        anchors.right: root.right
        height: 5
        width:root.width
        color: "#C0C0C0"
    }
    Rectangle {
        x: 0
        y: root.height-95
        anchors.left: root.left
        anchors.right: root.right
        height: 95
        width:root.width
        color: "#D3D3D3"

        Image {
            id: phone_image
            source: "./images/phone.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin:  100
        }

        Text {
            id: phone_num
            text: qsTr("17792258754")
            font.bold: true
            font.pointSize: 14
            color: "#708090"
            anchors.left: phone_image.right
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
        }

        Image {
            id: email_image
            source: "./images/mail.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: phone_num.left
            anchors.leftMargin:  170
        }

        Text {
            id: email_num
            text: qsTr("66813076@qq.com")
            font.bold: true
            font.pointSize: 14
            color: "#708090"
            anchors.left: email_image.right
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
        }

        Image {
            id: or_code
            width: 80
            height: 80
            source: "./images/wx-code.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin:  100
        }
    }

    Dialog {
         id: dialog
         title: "Title"
         visible: false
         width: 500
         height: 400

         standardButtons: Dialog.Ok | Dialog.Cancel
         anchors.centerIn: parent

         onAccepted: console.log("Ok clicked")
         onRejected: console.log("Cancel clicked")
     }

}
