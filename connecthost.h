#ifndef CONNECTHOST_H
#define CONNECTHOST_H

#include <QObject>
#include <QTcpSocket>
#include <QString>

class ConnectHost : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString username WRITE userName)
    Q_PROPERTY(QString password WRITE passWord)

public:
    explicit ConnectHost(QObject *parent = nullptr);

    QString userName(const QString &username);

    QString passWord(const QString &password);

    Q_INVOKABLE  void myConnentToSever();



signals:
    void loginSuccessfully();
    void loginFailure();


private:
    QTcpSocket *tcpSocket;
    QString name;
    QString pass;

};

#endif // CONNECTHOST_H
