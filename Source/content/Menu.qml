import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4



Rectangle {
    id: menu_context
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    x: 0
    width: 300
    state: "CLOSE"
    color: "#17171b"
    opacity: 0.97
    states: [
        State {
            name: "OPEN"
            PropertyChanges { target: menu_context; x: 0}
        },
        State {
            name: "CLOSE"
            PropertyChanges { target: menu_context; x: -300}
        }
    ]

    ScrollView {
        anchors.fill: parent

        flickableItem.interactive: true

        ListView {
            id: menuListView
            model: menuModel
            delegate: Item {
                id: root
                width: parent.width
                height: 70
                Text {
                    id: menu_name
                    anchors.verticalCenter: parent.verticalCenter
                    color: "white"
                    height: 55
                    font.pixelSize: 40
                    text: name
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                }
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 15
                    height: 1
                    color: "#424246"
                }

                Image {
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    anchors.verticalCenter: parent.verticalCenter
                    source: "/content/images/navigation_next_item.png"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        if (name === "Home") {
                            stackView.pop(1)
                        } else {
                            stackView.push(Qt.resolvedUrl(page));
                        }
                        menuListView.currentIndex = index;
                        menu_context.state = 'CLOSE'
                    }
                }
            }
            highlightMoveDuration: 500
            focus: true
            highlight: Rectangle {
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 5
                radius: 4
                color: "#254757"
            }
        }
        style: ScrollViewStyle {
            transientScrollBars: true
            handle: Item {
                implicitWidth: 14
                implicitHeight: 26
                Rectangle {
                    color: "#424246"
                    anchors.fill: parent
                    anchors.topMargin: 2
                    anchors.leftMargin: 4
                    anchors.rightMargin: 4
                    anchors.bottomMargin: 8
                }
            }
            scrollBarBackground: Item {
                implicitWidth: 14
                implicitHeight: 26
            }
        }
    }
    transitions: Transition {
        NumberAnimation {
            properties: "x"
            duration: 160
            easing.type: Easing.OutQuint
        }
    }
    Rectangle {
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.right: parent.right
        width: 4
        height: parent.height - 10
        color: "#33bef2"
        border.color: "#3b7891"
        border.width: 1
    }
}
