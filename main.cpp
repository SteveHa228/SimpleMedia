#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>

#include "AppleDialog.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    qmlRegisterType<AppleDialog>("SimpleMedia.AppleDialog",1,0,"AppleDialog");

    engine.load(url);

    return app.exec();
}
