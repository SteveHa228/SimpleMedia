import QtQuick

Item {
    id: root

    property double maximum: 10
    property double value:    0
    property double minimum:  0

    signal clicked(double value);  //

    width: 200;  height: 30 // default size
    opacity: enabled  &&  !mouseArea.pressed? 1: 0.3 // disabled/pressed state

    Repeater { // left and right trays (so tray doesn't shine through pill in disabled state)
        model: 2

        delegate: Rectangle {
            x:     !index?               0: pill.x + pill.width - radius
            width: !index? pill.x + radius: root.width - x;  height: 0.1 * root.height
            radius: 0.5 * height
            color: 'black'
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle { // pill
        id: pill

        x: (value - minimum) / (maximum - minimum) * (root.width - pill.width) // pixels from value
        width: parent.height;  height: width
        border.width: 0.05 * root.height
        radius: 0.5 * height
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        drag {
            target:   pill
            axis:     Drag.XAxis
            maximumX: root.width - pill.width
            minimumX: 0
        }

        onPositionChanged:  if(drag.active) setPixels(pill.x + 0.5 * pill.width) // drag pill
        onClicked: setPill(mouseArea.mouseX ) // tap tray

    }

    function setPixels(pixels) {
        var value = (maximum - minimum) / (root.width - pill.width) * (pixels - pill.width / 2) + minimum // value from pixels
        clicked(Math.min(Math.max(minimum, value), maximum)) // emit
    }

    function setPill(pixels) {
        if(pixels >= pill.width/2 && pixels <= root.width - pill.width/2){
            pill.x = pixels - pill.width/2
            var value = (maximum - minimum) / (root.width - pill.width) * (pixels - pill.width / 2) + minimum // value from pixels
            clicked(Math.min(Math.max(minimum, value), maximum)) // emit
        }
    }
}
