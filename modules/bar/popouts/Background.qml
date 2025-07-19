import "root:/services"
import "root:/config"
import QtQuick
import QtQuick.Shapes

ShapePath {
    id: root

    required property Wrapper wrapper
    required property bool invertBottomRight
    readonly property real rounding: Config.border.rounding
    readonly property bool flatten: wrapper.height < rounding * 2
    readonly property real roundingY: flatten ? wrapper.height / 2 : rounding
    property real ibr: invertBottomRight ? -1 : 1

    property real sideRounding: startX > 0 ? -1 : 1

    strokeWidth: -1
    fillColor: Colours.palette.m3surface

    PathArc {
        // Top Left
        relativeY: root.roundingY
        relativeX: -(root.rounding * root.sideRounding)
        radiusY: Math.min(root.rounding, root.wrapper.width)
        radiusX: root.rounding
        direction: PathArc.Clockwise
    }
    PathLine {
        // Left
        relativeX: 0
        relativeY: root.wrapper.height - root.roundingY * 2
    }
    PathArc {
        // Bottom Left
        relativeX: root.rounding
        relativeY: root.roundingY * -root.sideRounding
        radiusX: Math.min(root.rounding, root.wrapper.width)
        radiusY: root.roundingY
        direction: PathArc.Counterclockwise
    }
    PathLine {
        // Bottom
        relativeX: root.wrapper.width - root.rounding * 2
        relativeY: 0
    }
    PathArc {
        // Bottom Right
        relativeX: root.rounding
        relativeY: -root.roundingY * root.ibr
        radiusX: Math.min(root.rounding, root.wrapper.width)
        radiusY: root.roundingY
        direction: root.ibr < 0 ? PathArc.Clockwise : PathArc.Counterclockwise
    }
    PathLine {
        // Right
        relativeX: 0
        relativeY: -(root.wrapper.height - (root.roundingY * (1 + root.ibr)))
    }
    PathArc {
        // Top Right
        relativeX: root.rounding
        relativeY: -root.roundingY
        radiusX: Math.min(root.rounding, root.wrapper.width)
        radiusY: root.roundingY
        direction: PathArc.Clockwise
    }

    Behavior on fillColor {
        ColorAnimation {
            duration: Appearance.anim.durations.normal
            easing.type: Easing.BezierSpline
            easing.bezierCurve: Appearance.anim.curves.standard
        }
    }

    Behavior on ibr {
        NumberAnimation {
            duration: Appearance.anim.durations.normal
            easing.type: Easing.BezierSpline
            easing.bezierCurve: Appearance.anim.curves.standard
        }
    }

    Behavior on sideRounding {
        NumberAnimation {
            duration: Appearance.anim.durations.normal
            easing.type: Easing.BezierSpline
            easing.bezierCurve: Appearance.anim.curves.standard
        }
    }
}
