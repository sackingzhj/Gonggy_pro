import QtQuick 2.0

Item {
    width: root.width - 210
    height: root.height - 50

    Text {
        id: name
        text: qsTr("主要内容")
        anchors.centerIn: parent
        font.pointSize: 20
    }

    Component.onCompleted: {
        console.log(width+"----"+height)
    }

}
