import QtQuick 2.15
import QtQuick.Window 2.15
import QtQml 2.1

Window {
    id:root
    width:1280
    height: 800
    minimumWidth: 1280
    minimumHeight: 800
    visible: true
    title: qsTr("Hello World")
    visibility: "Maximized"




    Loader {
        id:mainloader

        Component.onCompleted: {
            mainloader.source = "WelcomePage.qml"
        }
    }


}
