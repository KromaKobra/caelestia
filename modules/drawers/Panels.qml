import "root:/services"
import "root:/config"
import "root:/modules/osd" as Osd
import "root:/modules/notifications" as Notifications
import "root:/modules/session" as Session
import "root:/modules/launcher" as Launcher
import "root:/modules/dashboard" as Dashboard
import "root:/modules/bar/popouts" as BarPopouts
import Quickshell
import QtQuick

Item {
    id: root

    required property ShellScreen screen
    required property PersistentProperties visibilities
    required property Item bar

    readonly property Osd.Wrapper osd: osd
    readonly property Notifications.Wrapper notifications: notifications
    readonly property Session.Wrapper session: session
    readonly property Launcher.Wrapper launcher: launcher
    readonly property Dashboard.Wrapper dashboard: dashboard
    readonly property BarPopouts.Wrapper popouts: popouts

    anchors.fill: parent
    anchors.margins: Config.border.thickness
    anchors.topMargin: bar.implicitHeight

    Osd.Wrapper {
        id: osd

        clip: root.visibilities.session
        screen: root.screen
        visibility: root.visibilities.osd

        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: session.width
    }

    Notifications.Wrapper {
        id: notifications

        visibilities: root.visibilities
        panel: root

        anchors.top: parent.top
        anchors.right: parent.right
    }

    Session.Wrapper {
        id: session

        visibilities: root.visibilities

        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
    }

    Launcher.Wrapper {
        id: launcher

        visibilities: root.visibilities

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }

    Dashboard.Wrapper {
        id: dashboard

        visibilities: root.visibilities

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
    }

    BarPopouts.Wrapper {
        id: popouts

        screen: root.screen

        // x: (root.width - nonAnimWidth) / 2
        // y: (root.height - nonAnimHeight) / 2

        // y: 0
        // x: {
        //     if (isDetached) return (root.width - nonAnimWidth) / 2;

        //     let off = currentCenter - Config.border.thickness - nonAnimWidth / 2;
        //     if (off < 0) return 0;
        //     if (off + nonAnimWidth > root.width) return root.width - nonAnimWidth;
        //     return off;
        // }

        y: isDetached ? (root.height - nonAnimHeight) / 2 : 0
        x: {
            if (isDetached)
                return (root.width - nonAnimWidth) / 2;

            const off = currentCenter - Config.border.thickness - nonAnimWidth / 2;
            const diff = root.width - Math.floor(off + nonAnimWidth);
            if (diff < 0)
                return off + diff;
            return off;
        }

        // y: bar.implicitHeight
        // x: {
        //     if (isDetached) return (root.width - nonAnimWidth) / 2;

        //     let off = currentCenter - Config.border.thickness - nonAnimWidth / 2;
        //     if (off < 0) off = 0;
        //     if (off + nonAnimWidth > root.width) off = root.width - nonAnimWidth;
        //     return off;
        // }

        // Component.onCompleted: {
        //     currentName = "battery";
        //     hasCurrent = true;
        // }

        // visible: hasCurrent

        // y: bar.implicitHeight
        // x: {
        //     if (isDetached) return (root.width - nonAnimWidth) / 2;

        //     let off = currentCenter - Config.border.thickness - nonAnimWidth / 2;
        //     if (off < 0) off = 0;
        //     if (off + nonAnimWidth > root.width) off = root.width - nonAnimWidth;
        //     return off;
        // }
    }

    // Utilities.Wrapper {
    //     id: utilities

    //     visibility: root.visibilities.utilities
    //     anchors.bottom: parent.bottom
    //     anchors.right: parent.right
    // }

}