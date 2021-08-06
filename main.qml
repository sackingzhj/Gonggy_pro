import QtQuick 2.15
import QtQuick.Window 2.15
import QtQml 2.1

Window {
    id:root
    visibility: "Maximized"
    width:1280
    height: 800
    minimumWidth: 1280
    minimumHeight: 800
    visible: true
    title: qsTr("工管云_工程施工信息化管理云平台")
    property string page_xml: ""
    property string page_title_xml: ""





    Loader {
        id:mainloader

        Component.onCompleted: {
            mainloader.source = "WelcomePage.qml"
        }
    }


}
