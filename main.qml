import QtQuick 2.15
import QtMultimedia

Window{
    id: root
    width: 600
    height: 600
    visible: true
    title: qsTr("Simple Media")

    MediaPlayer {
        id: mediaPlayer
        audioOutput: AudioOutput {}
        videoOutput: videoOutput
    }

    VideoOutput {
        id: videoOutput
        width: parent.width
        height: parent.height
        //anchors.fill: parent

        MouseArea {
            anchors.fill: parent
            drag.target: videoOutput
            drag.axis: Drag.XAndYAxis
        }

        PinchArea{
            anchors.fill: parent
            pinch.target: videoOutput
            pinch.maximumScale: 10.0
            pinch.minimumScale: 0.1
            pinch.maximumRotation: 360
            pinch.minimumRotation: 0
            pinch.dragAxis: Pinch.XAndYAxis
        }
    }


    property real prevx : 0
    property real prevy : 0

    MouseArea{
        id: mouseWindow

        anchors.fill: parent

        onPressed: {
            var globalPosition = mapToGlobal(mouseX, mouseY)
            prevx = globalPosition.x
            prevy = globalPosition.y
        }

        onPositionChanged: {

            var globalPosition = mapToGlobal(mouseX, mouseY)

            root.x += globalPosition.x - prevx
            root.y += globalPosition.y - prevy
            prevx = globalPosition.x
            prevy = globalPosition.y

        }
    }


    PlayerMenu {
        id: menuBar

        anchors.left: parent.left
        anchors.right: parent.right

        visible: !videoOutput.fullScreen

        mediaPlayer: mediaPlayer
        videoOutput: videoOutput
    }

}



