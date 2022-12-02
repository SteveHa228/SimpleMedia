import QtQuick

Rectangle {
    id: root

    property string text:  ''
    property bool status:  false
    property string icon:  ''

    signal clicked(bool status);

    width: 30;  height: 30 // default size

    border.color: text? 'black': 'transparent' // Keyboard
    border.width: 0.05 * root.height
    radius:       0.5  * root.height
    opacity:      enabled  &&  !mouseArea.pressed? 1: 0.3 // disabled/pressed state

    Text {
        text: root.text
        font.pixelSize: 0.5 * root.height
        anchors.centerIn: parent
    }

    Image {
        id: _icon
        width: root.width
        height: root.height
        anchors.fill: parent
        source: icon
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        onClicked:  pressButton()
    }

    function pressButton(){
        status = !status
        clicked(status);
    }
}
