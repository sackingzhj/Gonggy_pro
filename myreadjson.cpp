#include "myreadjson.h"
#include <QByteArray>
#include <QFile>
#include <QIODevice>
#include <QJsonParseError>
#include <QDebug>
#include <QJsonObject>
#include <QJsonArray>

MyReadJson::MyReadJson(QObject *parent): QObject(parent), fileName("")
{

}

QString MyReadJson::jsonFileName() const
{
    return fileName;
}

void MyReadJson::setJsonFileName(const QString &jsonFileName)
{

    fileName = jsonFileName;
    emit fileNameChanged(fileName);
}

void MyReadJson::readJsonFile()
{
    qDebug() << "2------wenjianmingshi:" << fileName;
    QFile *file = new QFile(fileName);
    file->open(QIODevice::ReadOnly);
    QByteArray arr = file->readAll();
    QJsonParseError *err = new QJsonParseError();
    QJsonDocument jDocument=QJsonDocument::fromJson(arr,err);

    if (err->error == QJsonParseError::NoError)
    {
        if(jDocument.isObject())
        {
            QJsonObject obj = jDocument.object();

            for (QJsonObject::Iterator it = obj.begin();it != obj.end(); it++)
            {
               QJsonValue value=it.value();
               QJsonArray Array=value.toArray();

            }

        }

    }else{
        qDebug() << "出错了" << err->errorString();
    }
    return ;

}
