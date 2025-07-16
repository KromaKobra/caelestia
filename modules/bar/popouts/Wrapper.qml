pragma ComponentBehavior: Bound

import "root:/services"
import "root:/config"
import "root:/modules/windowinfo"
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick

Item {
    id: root

    required property ShellScreen screen

    readonly property real nonAnimHeight: y > 0 || hasCurrent ? children.find(c => c.shouldBeActive)?.implicitHeight ?? content.implicitHeight : 0
    readonly property real nonAnimWidth: children.find(c => c.shouldBeActive)?.implicitWidth ?? content.implicitWidth

    property string currentName
    property real currentCenter
    property bool hasCurrent

    property int animLength: Appearance.anim.durations.normal
    property list<real> animCurve: Appearance.anim.curves.emphasized

    visible: width > 0 && height > 0
    clip: true

    implicitHeight: nonAnimHeight
    implicitWidth: nonAnimWidth

    Comp {
        id: content

        shouldBeActive: true
        asynchronous: true
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        sourceComponent: Content {
            wrapper: root
            screen: root.screen
            currentName: root.currentName
            currentCenter: root.currentCenter
            hasCurrent: root.hasCurrent
        }
    }

    Behavior on y {
        Anim {
            duration: root.animLength
            easing.bezierCurve: root.animCurve
        }
    }

    Behavior on x {
        enabled: root.implicitHeight > 0

        Anim {
            duration: root.animLength
            easing.bezierCurve: root.animCurve
        }
    }

    Behavior on implicitHeight {
        Anim {
            duration: root.animLength
            easing.bezierCurve: root.animCurve
        }
    }

    Behavior on implicitWidth {
        enabled: root.implicitHeight > 0

        Anim {
            duration: root.animLength
            easing.bezierCurve: root.animCurve
        }
    }

    component Comp: Loader {
        id: comp

        property bool shouldBeActive

        asynchronous: true
        active: false
        opacity: 0

        states: State {
            name: "active"
            when: comp.shouldBeActive

            PropertyChanges {
                comp.opacity: 1
                comp.active: true
            }
        }

        transitions: [
            Transition {
                from: ""
                to: "active"

                SequentialAnimation {
                    PropertyAction {
                        property: "active"
                    }
                    Anim {
                        property: "opacity"
                        easing.bezierCurve: Appearance.anim.curves.standard
                    }
                }
            },
            Transition {
                from: "active"
                to: ""

                SequentialAnimation {
                    Anim {
                        property: "opacity"
                        easing.bezierCurve: Appearance.anim.curves.standard
                    }
                    PropertyAction {
                        property: "active"
                    }
                }
            }
        ]
    }

    component Anim: NumberAnimation {
        duration: Appearance.anim.durations.normal
        easing.type: Easing.BezierSpline
        easing.bezierCurve: Appearance.anim.curves.emphasized
    }
}
