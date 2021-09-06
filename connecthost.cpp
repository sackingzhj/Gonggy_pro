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
    tcpSocket = new QTcpSocket(this);
    QString ip = QString("192.168.198.133"); //192.168.198.133 //123.57.51.96
    quint16 port = 12000;

    tcpSocket->connectToHost(QHostAddress(ip),port);

    if(tcpSocket->waitForConnected(10000))
    {

//        myDoConnent();
    }else
    {
        emit networkError();
    }

}

void ConnectHost::myDoConnent()
{
    qDebug() << "myDoConnent";
//    enum sysCMD{
//        _LOGIN_CMD,
//        _LOGOUT_CMD,
//        _ERROR_CMD
//    };

//    struct CMD{
//        short _CMD;
//        short sysCMD_LEN;
//    };

//    struct _DataPackage:public CMD{
//        _DataPackage()
//        {
//            sysCMD_LEN = sizeof (_DataPackage);
//        }
//        char _name[32];
//        char _pass[32];

//    };

    enum sysCMD {
        _LOGIN_CMD,
        _LOGOUT_CMD,
        _ERROR_CMD
    };

    struct CMDHead {
        sysCMD cmdOrder;
        short sysCMD_LEN;
    };

    struct CMD_Result{
        bool isSucced = false;
    };

    struct loginData :public CMDHead {
        loginData()
        {
            sysCMD_LEN = sizeof(loginData);
        }
        char _name[32];
        char _pass[32];

    };

    loginData data = {};
    qDebug() << "data._name1" << data._name;
    qDebug() << "data._pass1" << data._pass;

    data.cmdOrder = _LOGIN_CMD;

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

    qDebug() << "data._name2" << data._name;
    qDebug() << "data._pass2" << data._pass;

    QByteArray bdata;
    bdata.resize(sizeof(loginData));
    memcpy(bdata.data(), &data, sizeof(loginData));

    tcpSocket->write(bdata);
//    tcpSocket->write("bdata");
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

void ConnectHost::closeConnent()
{

    tcpSocket->disconnectFromHost();
}
ConnectHost::~ ConnectHost()
{
  qDebug() << "xigou\n";
}






















