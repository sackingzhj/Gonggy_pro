import QtQuick 2.0

Item {
    resources:[
    ListModel {
        id: costAndSchedule_list
        ListElement{
            nametitle: "重点工程形象进度";
            menugroup: "工程形象进度";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "重点工程设置";
            menugroup: "工程形象进度";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "施工计划管理";
            menugroup: "施工进度计划";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "施工进度管理";
            menugroup: "施工进度计划";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "合同计量";
            menugroup: "计量支付业务";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "变更管理";
            menugroup: "计量支付业务";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "施工图复核";
            menugroup: "计量支付业务";
            menuurl:"MainDetails.qml";
        }
    },

    ListModel {
        id: qualityControl_list
        ListElement{
            nametitle: "排查任务管理";
            menugroup: "质量隐患排查";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "排查台账";
            menugroup: "质量隐患排查";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "隐患台账";
            menugroup: "质量隐患排查";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "排查表单设置";
            menugroup: "质量隐患排查";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "质检数据控制";
            menugroup: "施工质检控制";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "工程划分";
            menugroup: "施工质检控制";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "施工质检基础数据";
            menugroup: "施工质检控制";
            menuurl:"MainDetails.qml";
        }
    },

    ListModel {
        id: safetyManagement_list
        ListElement{
            nametitle: "排查任务管理";
            menugroup: "隐患排查管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "排查台账";
            menugroup: "隐患排查管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "隐患台账";
            menugroup: "隐患排查管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "排查表单设置";
            menugroup: "隐患排查管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "危险源辨识与评价";
            menugroup: "危大工程安全管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "重大危险源监管";
            menugroup: "危大工程安全管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "危大工程管理";
            menugroup: "危大工程安全管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "危险作业管理";
            menugroup: "危大工程安全管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "隐患排查设置";
            menugroup: "安全基础管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "危大工程设置";
            menugroup: "安全基础管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "重大危险源设置";
            menugroup: "安全基础管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "风险清单库";
            menugroup: "安全基础管理";
            menuurl:"MainDetails.qml";
        }
    },

    ListModel {
        id: laborRealName_list
        ListElement{
            nametitle: "经济合同登记";
            menugroup: "参建单位登记";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "人员进出场登记";
            menugroup: "劳务实名制";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "安全教育培训";
            menugroup: "劳务实名制";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "人员奖惩与预警";
            menugroup: "劳务实名制";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "设备进出场登记";
            menugroup: "设备管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "设备维修保养";
            menugroup: "设备管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "设备台账";
            menugroup: "设备管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "材料进出场登记";
            menugroup: "材料管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "材料检验台账";
            menugroup: "材料管理";
            menuurl:"MainDetails.qml";
        }
    },

    ListModel {
        id: physicalMonitoring_list
        ListElement{
            nametitle: "压力机";
            menugroup: "试验室设备监测";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "物联检测1";
            menugroup: "试验室设备监测";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "物联检测2";
            menugroup: "试验室设备监测";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "物联检测3";
            menugroup: "试验室设备监测";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "设备进出场登记";
            menugroup: "设备管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "特种设备作业人员";
            menugroup: "设备管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "设备巡检保养";
            menugroup: "设备管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "材料进出场登记";
            menugroup: "物资管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "材料进厂检验";
            menugroup: "物资管理";
            menuurl:"MainDetails.qml";
        }
    },

    ListModel {
        id: engineeringLog_list
        ListElement{
            nametitle: "施工日志";
            menugroup: "施工方工程日志";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "安全日志";
            menugroup: "施工方工程日志";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "监理日志";
            menugroup: "监理方工程日志";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "监理旁站记录";
            menugroup: "监理方工程日志";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "监理巡视记录";
            menugroup: "监理方工程日志";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "工程影像资料";
            menugroup: "工程影像资料管理";
            menuurl:"MainDetails.qml";
        }
    },

    ListModel {
        id: recordFile_list
        ListElement{
            nametitle: "资料档案导入";
            menugroup: "竣工资料档案管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "资料档案鉴定";
            menugroup: "竣工资料档案管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "资料档案分类";
            menugroup: "竣工资料档案管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "资料档案检索";
            menugroup: "竣工资料档案管理";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "档案生成";
            menugroup: "竣工资料生成";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "卷内目录管理";
            menugroup: "竣工资料生成";
            menuurl:"MainDetails.qml";
        }
        ListElement{
            nametitle: "预约导出电子档案";
            menugroup: "竣工资料生成";
            menuurl:"MainDetails.qml";
        }
    }
   ]

}
