#include "connecthost.h"
#include <QHostAddress>
#include <QByteArray>
#include <QDebug>
#include <QString>
ConnectHost::ConnectHost(QObject *parent) : QObject(parent), name(""), pass("")
{

}

QString ConnectHost::username() const
{
    return name;
}

QString ConnectHost::password() const
{
    return pass;
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
    enum sysCMD{
        _LOGIN_CMD,
        _LOGOUT_CMD,
        _ERROR_CMD
    };

    struct CMD{
        short _CMD;
        short sysCMD_LEN;
    };

    struct _DataPackage:public CMD{
        _DataPackage()
        {
            sysCMD_LEN = sizeof (_DataPackage);
        }
        char _name[32];
        char _pass[32];

    };

    _DataPackage data;
    data._CMD = _LOGIN_CMD;

    char* ptr;
    QByteArray ba;
    ba = name.toLatin1();
    ptr = ba.data();
    memcpy(data._name,ptr,10); //

    char* ptr2;
    QByteArray ba2;
    ba2 = pass.toLatin1();
    ptr2 = ba2.data();
    memcpy(data._pass,ptr2,10); //

    QByteArray bdata;
    bdata.resize(sizeof(_DataPackage));
    memcpy(bdata.data(), &data, sizeof(_DataPackage));



    tcpSocket = new QTcpSocket(this);
    QString ip = QString("192.168.198.133");
    quint16 port = 8888;


    tcpSocket->connectToHost(QHostAddress(ip),port);

    if(tcpSocket->waitForConnected(10000))
    {

       tcpSocket->write(bdata);
    }else
    {
        emit networkError();
    }

    connect(tcpSocket, &QTcpSocket::readyRead,
            [=]()
            {
                char flag ={};
                tcpSocket->read(&flag, sizeof (flag));
                qDebug() << "flag" << flag;
                if(flag == 'a'){
                    emit loginSuccessfully();
                }else{
                    emit loginFailure();
                }

            }
            );
}






















