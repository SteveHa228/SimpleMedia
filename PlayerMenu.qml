import QtQuick
import QtQuick.Layouts
import QtMultimedia
import SimpleMedia.AppleDialog 1.0

Item {
    id: root

    required property MediaPlayer mediaPlayer
    required property VideoOutput videoOutput

    height: parent.height
    width: parent.width

    //    signal closePlayer

    function loadUrl(url) {
        startButton.icon = "qrc:/pause_icon.svg"
        mediaPlayer.stop()
        mediaPlayer.source = url
        mediaPlayer.play()
    }

    AppleDialog{
        id: myDialog
    }

    Row{
        anchors.bottom: parent.bottom
        spacing: 60
        leftPadding: 25
        Button {
            id: loadButton
            icon: "qrc:/load_icon.svg"
            onClicked: loadUrl(myDialog.openFile())
        }

        Button {
            id: startButton
            icon: "qrc:/play_icon.svg"
            onClicked: (value) => {
                           //print(value)
                           if(value){
                               mediaPlayer.play()
                               startButton.icon = "qrc:/pause_icon.svg"
                           }else{
                               mediaPlayer.pause()
                               startButton.icon = "qrc:/play_icon.svg"
                           }
                       }
        }

        Button {
            id: stopButton
            icon: "qrc:/stop_icon.svg"
            onClicked: mediaPlayer.stop()
        }

        Slider {
            id: mediaSlider

            maximum:  10
            value:    0
            minimum: 0

            onClicked: (value) => {
                           //print(value)
                           mediaPlayer.setPosition(value * mediaPlayer.duration / maximum)
                       }
        }
    }
}
