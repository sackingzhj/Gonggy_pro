import QtQuick 2.9
import QtQuick.Controls 2.5
//import QTableView 1.0
//import MyReadJson 1.0


Item {
    width: root.width - 210
    height: root.height - 50

    Button {
        text: "点击"

        onClicked: {
            if (leftrec.visible)
            {
                leftrec.visible = false
            }else
            {
                leftrec.visible = true
            }

        }
    }

    ListModel{
        id:listModel
        ListElement{
            PARTNO:"20201130"
            PLACE:"小山村"
            ADDRESS:"265454"
            JD:"105.0265"
            WD:"26.3265"
            BACKUP:" 2020-11-30 09:59:19"
            asdfa:" 2020-11-30 09:59:19"
        }
        ListElement{
            PARTNO:"20201130"
            PLACE:"大山村"
            ADDRESS:"265454"
            JD:"105.0265"
            WD:"26.3265"
            BACKUP:" 2020-11-30 09:59:19"
            asdfa:" 2020-11-30 09:59:19"
        }
    }

    DataTableView {
        id: dataListView
        anchors.fill: parent
//        anchors.margins: 100
//        anchors.left: parent.left
        anchors.leftMargin: 50;
//        anchors.right: parent.right
        anchors.rightMargin: 20;
//        anchors.top: parent.top
        anchors.topMargin: 100
        columnsWidth: 110
        headerList: ["日期","地点","地址","经度","纬度","备注","备注"]//不自己设置时，表头使用model数据列名
        model:listModel
        Component.onCompleted: {
            var c2 = dataListView.getColumnWidth(2)
            var c5 = dataListView.getColumnWidth(5)
            dataListView.setColumnWidth(2,c2-50)
            dataListView.setColumnWidth(5,c5+100)
        }
    }

    Rectangle {
        id: leftrec
        width: parent.width / 2
        height: parent.height
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        visible: false
        color: "red"
    }
}
