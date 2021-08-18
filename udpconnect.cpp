#include "udpconnect.h"
#include <QHostAddress>

UdpConnect::UdpConnect(QObject *parent):QObject(parent), name(""), pass("")
{

}

QString UdpConnect::userName() const
{
    return name;
}

void UdpConnect::setUsername(const QString &username)
{
    name = username;
    emit usernameChanged();
}

QString UdpConnect::passWord() const
{
    return pass;
}

void UdpConnect::setPassword(const QString &password)
{
    pass = password;
    emit passwordChanged();
}

void UdpConnect::connectByUdp()
{
    udpConnect =  new QUdpSocket(this);
    QString ip = QString("127.0.0.1");
    quint16 port = 11000;
    QString str = name + "##" + pass;
    udpConnect->writeDatagram(str.toUtf8(),QHostAddress(ip), port);
}
