#ifndef UDPCONNECT_H
#define UDPCONNECT_H

#include <QObject>
#include <QUdpSocket>
#include <QString>

class UdpConnect:public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString username READ userName WRITE setUsername NOTIFY usernameChanged)
    Q_PROPERTY(QString password READ passWord WRITE setPassword NOTIFY passwordChanged)
public:
    UdpConnect(QObject *parent = nullptr);

    QString userName() const;
    void setUsername(const QString &username);

    QString passWord() const;
    void setPassword(const QString &password);

    Q_INVOKABLE void connectByUdp();

signals:
    void usernameChanged();
    void passwordChanged();

private:
    QUdpSocket *udpConnect;
    QString name;
    QString pass;

};

#endif // UDPCONNECT_H
