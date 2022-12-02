#ifndef FILEDIALOG_H
#define FILEDIALOG_H

#include <QString>
#include <QObject>

class AppleDialog : public QObject
{
    Q_OBJECT

public:
    Q_INVOKABLE QString openFile();
};

#endif // FILEDIALOG_H
