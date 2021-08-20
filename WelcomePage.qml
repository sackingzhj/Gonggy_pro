import QtQuick 2.1
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.1
import ConnectHost 1.0
//import UdpConnect 1.0


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
                id: login_text
                text: qsTr("帮助中心")
                anchors.centerIn: parent
                color: "#0b5dd9"
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {


                }

                onEntered: {
                    parent.color = "#0b5dd9"
                    login_text.color = "white"
                }

                onExited: {
                    parent.color = "white"
                    login_text.color = "#0b5dd9"
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
            ["数 据 指 挥 中 心", "./images/CommandingCommunication.png","CommandingCommunication"],
            ["财务成本与工程进度", "./images/CostAndSchedule.png","CostAndSchedule"],
            ["工 程 质 量 管 控", "./images/QualityControl.png","QualityControl"],
            ["工 程 安 全 管 理", "./images/SafetyManagement.png","SafetyManagement"],
            ["劳务、设备、材料管理", "./images/LaborRealName.png","LaborRealName"],
            ["智 慧 物 联 监 测", "./images/PhysicalMonitoring.png","PhysicalMonitoring"],
            ["施 工 工 程 日 志", "./images/EngineeringLog.png","EngineeringLog"],
            ["竣 工 资 料 档 案", "./images/RecordFile.png","RecordFile"]
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
                        page_xml = rep_content.model[index][2]
                        page_title_xml = rep_content.model[index][0]
                        if(root.isLogin === 1){
                            mainloader.source = "BusinessPage.qml"
                        }else{
                            c_host_socket.myConnentToSever()
                            dialog.visible = true
                        }


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

//    Rectangle {
//        id:bg_apla
//        width: root.width
//        height: root.height
//        color: Qt.rgba(0.2,0.2,0.2,0.3)
//        visible: false
//        z:5
//    }



    Dialog {
         id: dialog
         visible: false
         topInset :20
         bottomInset: 20
         leftInset: 20
         rightInset: 20
         width: 547
         height: 399
         BorderImage {
             source: "images/dialog_bg.png"
             horizontalTileMode: BorderImage.Repeat
             verticalTileMode: BorderImage.Repeat
             width: 547; height: 399
             border.left: 5; border.top: 5
             border.right: 5; border.bottom: 5
             anchors.fill: parent
         }
         closePolicy: Popup.NoAutoClose
         dim: true
         anchors.centerIn: parent
         modal: Qt.WindowModal



         Text {
                  id: name_text
                  text: qsTr("用户名：")
                  anchors.left: parent.left
                  anchors.leftMargin: 80
                  anchors.top:parent.top
                  anchors.topMargin: 170
                  font.pixelSize: 20


              }

              TextField {
                  id: username_field
                  width: 290
                  height: 30
                  placeholderText: qsTr(" 请输入用户名！")
                  font.pixelSize: 16
                  verticalAlignment: TextInput.AlignVCenter;
                  anchors.left: parent.left
                  anchors.leftMargin: 180
                  anchors.top:parent.top
                  anchors.topMargin: 170


                  selectByMouse: true

                  onFocusReasonChanged:{
                      if ( !(text.length > 0) )
                      {
                          username_text_hint.visible = true
                      }else( (text.length > 0) & (username_text_hint.visible == true))
                      {
                          username_text_hint.visible = false
                      }
                  }

//                  onFocusChanged: {
//                        if ( !(text.length > 0) )
//                        {
//                            username_text_hint.visible = true
//                        }
//                  }

                  Component.onCompleted: {
                    forceActiveFocus()

//                    cursorVisible:true
                  }
              }

              Text {
                  id: username_text_hint
                  text: qsTr("请输入用户名!")
                  anchors.left: parent.left
                  anchors.leftMargin: 180
                  anchors.top:parent.top
                  anchors.topMargin: 200
                  font.pixelSize: 12
                  color: "red"
                  visible: false
              }



              Text {
                  id: pass_text
                  text: qsTr("密   码：")
                  anchors.left: parent.left
                  anchors.leftMargin: 80
                  anchors.top:parent.top
                  anchors.topMargin: 230
                  font.pixelSize: 20
              }
              TextField {
                  id: password_field
                  width: 290
                  height: 30
                  placeholderText: qsTr(" 请输入密码！")
                  font.pixelSize: 16
                  verticalAlignment: TextInput.AlignVCenter;
                  anchors.left: parent.left
                  anchors.leftMargin: 180
                  anchors.top:parent.top
                  anchors.topMargin: 230
                  echoMode: TextInput.Password
//                  inputMethodHints:Qt.ImhHiddenText | Qt.ImhNoPredictiveText
                  selectByMouse: true


                  onFocusChanged: {
                      var password_len = password_field.text

                  if ( !(password_len.length > 0) )
                      {
                          pass_text_hint.visible = true
                      }else( (password_len.length > 0) & (pass_text_hint.visible === true))
                      {
                          pass_text_hint.visible = false
                      }
                  }

              }

              Text {
                  id: pass_text_hint
                  text: qsTr("请输入密码!")
                  anchors.left: parent.left
                  anchors.leftMargin: 180
                  anchors.top:parent.top
                  anchors.topMargin: 265
                  font.pixelSize: 12
                  color: "red"
                  visible: false
              }


              ConnectHost {
                  id: c_host_socket

                  username: username_field.text
                  password: password_field.text

                  onNetworkError: {
                        promptarea.visible = true
                        promptarea_text.text = "网络错误，请检查您的网络！"
                  }

                  onLoginFailure: {
                      promptarea.visible = true
                      promptarea_text.text = "用户名密码错误，请检查后重新输入"
                  }

                  onLoginSuccessfully: {
                      if(root.isLogin === 0){
                          root.isLogin = 1
                      }
                      c_host_socket.closeConnent()
                      mainloader.source = "BusinessPage.qml"

                  }
              }

                  Button {
                      width: 150
                      height: 35
                      text: qsTr("登    录")

                      DialogButtonBox.buttonRole: DialogButtonBox.Ok
                      x:100
                      y:285

                      onClicked: {
                          console.log('clicked')
                          if(username_field.text.length >0 )
                          {
                              if(password_field.text > 0)
                              {
//                                  c_host_socket.myConnentToSever()
                                  c_host_socket.username = username_field.text
                                  c_host_socket.password = password_field.text
                                  c_host_socket.myDoConnent()
                              }else{
                                      pass_text_hint.visible = true
                              }
                          }else{
                              username_text_hint.visible = true
                          }
                      }

                  }

                  Button {
                      width: 150
                      height: 35
                      text: qsTr("取    消")
                      DialogButtonBox.buttonRole: DialogButtonBox.Cancel
                      x:300
                      y:285
                      onClicked: {
                          username_field.text = ""
                          password_field.text = ""
                          c_host_socket.closeConnent()
                          dialog.reject()

                      }
                  }


                  Rectangle{
                    id: promptarea
                    width: 400
                    height: 150
                    color: Qt.rgba(0.2,0.2,0.2,0.7)
                    border.color: "#40E0D0"
                    border.width: 1
                    visible: false
                    anchors.centerIn: parent
                    radius: 5

                    Text {
                        id: promptarea_text
                        text: qsTr("text")
                        font.pointSize: 14
                        color: "white"
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            parent.visible = false;
                        }
                    }
                  }


         enter: Transition {
                  NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 ; duration:200}
              }
         exit: Transition {
                  NumberAnimation { property: "opacity"; from: 1.0; to: 0.0 ;duration:200}
              }
    }


}
