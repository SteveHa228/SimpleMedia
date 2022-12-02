#include "AppleDialog.h"
#import <Cocoa/Cocoa.h>
#include <QStringList>
#include <QDebug>

QString AppleDialog::openFile() {
    NSApplication *application = [NSApplication sharedApplication];
     [application setActivationPolicy:NSApplicationActivationPolicyAccessory];
     NSOpenPanel* openDlg = [NSOpenPanel openPanel];
     [openDlg setCanChooseFiles:YES];
     [openDlg setFloatingPanel:YES];
     QString path;

     if ( [openDlg runModal] == NSModalResponseOK ) {
       for( NSURL* URL in [openDlg URLs] ) {
         //NSLog( @"%@", [URL path] );
         path = QString::fromNSString(URL.path);
       }
     }
     path = QString("file://") + path; //url format
     return path;
}

