import QtQuick 2.9
//import MyReadJson 1.0


Item {
    width: root.width - 210
    height: root.height - 50

//    MyReadJson {
//        id: my_json

//        Component.onCompleted:{
//            my_json.jsonFileName = ":/xml/myfile.json"
//        }


//        onFileNameChanged:{
//              console.log("进入信号")
//              my_json.readJsonFile()
//        }
//    }


    Text {
        id: name
        text: /*my_json.jsonFileName*/ "NIHAO"
        anchors.centerIn: parent
        font.pointSize: 20
    }

}
