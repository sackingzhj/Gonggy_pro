#ifndef MYREADJSON_H
#define MYREADJSON_H

#include <QObject>
#include <QJsonDocument>
#include <QJsonObject>
#include <QString>
#include <QJsonArray>

class MyReadJson : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString jsonFileName READ jsonFileName WRITE setJsonFileName NOTIFY fileNameChanged)
public:
    MyReadJson(QObject *parent = nullptr);

    QString jsonFileName() const;

    void setJsonFileName(const QString &jsonFileName);

    Q_INVOKABLE void readJsonFile();

signals:
    void fileNameChanged(const QString &fileName);

private:
    QString fileName;
};

#endif // MYREADJSON_H
