import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.2

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Click the button")
    color: '#000000';

    MessageDialog {
        id: message
        title: qsTr('You did it')
        informativeText: qsTr("You just clicked the button!")
    }

    Rectangle {
        id: rectangle
        x: (window.width - rectangle.width) / 2
        y: (window.height - rectangle.height) / 2
        width: 79
        height: 29
        color: "#ffffff"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true

            onHoveredChanged: () => {
                rectangle.x = Math.ceil(Math.random() * (window.width - rectangle.width));
                rectangle.y = Math.ceil(Math.random() * (window.height - rectangle.height));
            }

            onClicked: () => {
                message.open();
            }
        }

        Text {
            id: text1
            width: 52
            height: 17
            text: qsTr("Click me!")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Behavior on x {
            NumberAnimation {
                duration: 500
                easing.type: Easing.OutElastic
            }
        }

        Behavior on y {
            NumberAnimation {
                duration: 500
                easing.type: Easing.OutElastic
            }
        }

    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:2}
}
##^##*/
