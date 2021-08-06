#ifndef MENUXMLMODEL_H
#define MENUXMLMODEL_H

#include <QObject>
#include <QXmlStreamReader>

class MenuXmlModel:public QObject
{
    Q_OBJECT
public:
    MenuXmlModel(QXmlStreamReader *menu_reade,QString page_xml);

private:
    QXmlStreamReader *menu_reader;
    QString page_xml;
};

#endif // MENUXMLMODEL_H
