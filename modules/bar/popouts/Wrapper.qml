pragma ComponentBehavior: Bound

import "root:/services"
import "root:/config"
import Quickshell
import QtQuick

Item {
    id: root

    required property ShellScreen screen

    readonly property real nonAnimHeight: hasCurrent ? content.implicitHeight : 0 // not sure if y > 0 accomplishes anything
    readonly property real nonAnimWidth: content.implicitWidth

    property string currentName
    property real currentCenter
    property bool hasCurrent

    property int animLength: Appearance.anim.durations.normal
    property list<real> animCurve: Appearance.anim.curves.emphasized

    visible: width > 0 && height > 0
    clip: true

    implicitHeight: nonAnimHeight
    implicitWidth: nonAnimWidth

    Loader {
        id: content

        asynchronous: true
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        active: true
        // opacity: 1 // I think that since opacity is at 1 by default, setting it is redundant

        sourceComponent: Content {
            wrapper: root
            screen: root.screen
            currentName: root.currentName
            currentCenter: root.currentCenter
            hasCurrent: root.hasCurrent
        }
    }

    Behavior on x {
        enabled: root.implicitHeight > 0

        NumberAnimation {
            duration: root.animLength
            easing.type: Easing.BezierSpline
            easing.bezierCurve: root.animCurve
        }
    }

    Behavior on implicitHeight {
        NumberAnimation {
            duration: root.animLength
            easing.type: Easing.BezierSpline
            easing.bezierCurve: root.animCurve
        }
    }

    Behavior on implicitWidth {
        enabled: root.implicitHeight > 0

        NumberAnimation {
            duration: root.animLength
            easing.type: Easing.BezierSpline
            easing.bezierCurve: root.animCurve
        }
    }
}
