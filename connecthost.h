#ifndef CONNECTHOST_H
#define CONNECTHOST_H

#include <QObject>
#include <QTcpSocket>
#include <QString>

class ConnectHost : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString username READ username WRITE userName)
    Q_PROPERTY(QString password READ password WRITE passWord)

public:
    explicit ConnectHost(QObject *parent = nullptr);

    QString username() const;

    QString password() const;

    QString userName(const QString &username);

    QString passWord(const QString &password);

    Q_INVOKABLE  void myConnentToSever();

    Q_INVOKABLE  void myDoConnent();

    Q_INVOKABLE  void closeConnent();
//    Q_INVOKABLE  void readConnent();

     ~ ConnectHost();





signals:
    void loginSuccessfully();
    void loginFailure();
    void networkError();



private:
    QTcpSocket *tcpSocket;
    QString name;
    QString pass;
//    QString flag;

};

#endif // CONNECTHOST_H
