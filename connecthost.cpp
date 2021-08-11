#include "connecthost.h"
#include <QHostAddress>
#include <QByteArray>
#include <QDebug>

ConnectHost::ConnectHost(QObject *parent) : QObject(parent), name(""), pass("")
{

}

QString ConnectHost::userName(const QString &username)
{
    name = username;
    return name;
}


QString ConnectHost::passWord(const QString &password)
{
    pass = password;
    return pass;
}


void ConnectHost::myConnentToSever()
{
    QByteArray userInfo = QString(name +" : "+ pass).toUtf8();
    tcpSocket = new QTcpSocket(this);
    QString ip = QString("192.168.198.130");
    quint16 port = 8888;
    tcpSocket->connectToHost(QHostAddress(ip),port);


    tcpSocket->write(userInfo);



}
