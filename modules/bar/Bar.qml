import "root:/widgets"
import "root:/services"
import "root:/config"
import "popouts" as BarPopouts
import "components"
import "components/workspaces"
import Quickshell
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    required property ShellScreen screen
    required property PersistentProperties visibilities
    required property BarPopouts.Wrapper popouts

    function checkPopout(x: real): void {
        const padding = Appearance.padding.extraLarge;
        const spacing = Appearance.spacing.small;
        const tx = padding + tray.x;
        const tw = tray.implicitWidth;
        const trayItems = tray.items;

        const leftPosX = padding + statusIcons.x + statusIconsInner.x;
        const p = statusIconsInner.performance;
        const px = leftPosX + p.x - spacing / 2;

        const ns = leftPosX + statusIconsInner.ns - spacing / 2;
        const ne = leftPosX + statusIconsInner.ne + spacing / 2;

        const ds = leftPosX + statusIconsInner.ds - spacing / 2;
        const de = leftPosX + statusIconsInner.de + spacing / 2;

        const aus = leftPosX + statusIconsInner.aus - spacing / 2;
        const aue = leftPosX + statusIconsInner.aue + spacing / 2;

        const ms = leftPosX + statusIconsInner.ms - spacing / 2;
        const me = leftPosX + statusIconsInner.me + spacing / 2;

        const bls = leftPosX + statusIconsInner.bs - spacing / 2;
        const ble = leftPosX + statusIconsInner.be + spacing / 2;

        const b = statusIconsInner.battery;
        const bx = leftPosX + b.x - spacing / 2;

        if (x > tx && x < tx + tw) {
            const index = Math.floor(((x - tx) / tw) * trayItems.count);
            const item = trayItems.itemAt(index);

            popouts.currentName = `traymenu${index}`;
            popouts.currentCenter = Qt.binding(() => tx + item.x + item.implicitWidth / 2);
            popouts.hasCurrent = true;
        } else if (x >= px && x <= px + p.implicitWidth + spacing) {
            popouts.currentName = "performance";
            popouts.currentCenter = Qt.binding(() => statusIcons.x + statusIconsInner.x + p.x + p.implicitWidth / 2);
            popouts.hasCurrent = true;
        } else if (x >= ns && x <= ne) {
            popouts.currentName = "network";
            popouts.currentCenter = Qt.binding(() => statusIcons.x + statusIconsInner.x + statusIconsInner.ns + (statusIconsInner.ne - statusIconsInner.ns) / 2);
            popouts.hasCurrent = true;
        } else if (x >= ds && x <= de) {
            popouts.currentName = "display";
            popouts.currentCenter = Qt.binding(() => statusIcons.x + statusIconsInner.x + statusIconsInner.ds + (statusIconsInner.de - statusIconsInner.ds) / 2);
            popouts.hasCurrent = true;
        } else if (x >= aus && x <= aue) {
            popouts.currentName = "audio";
            popouts.currentCenter = Qt.binding(() => statusIcons.x + statusIconsInner.x + statusIconsInner.aus + (statusIconsInner.aue - statusIconsInner.aus) / 2);
            popouts.hasCurrent = true;
        } else if (x >= ms && x <= me) {
            // Maybe get rid of one = so that when media is off, there isn't a pixel that can be hovered on
            popouts.currentName = "media";
            popouts.currentCenter = Qt.binding(() => statusIcons.x + statusIconsInner.x + statusIconsInner.ms + (statusIconsInner.me - statusIconsInner.ms) / 2);
            popouts.hasCurrent = true;
        } else if (x >= bls && x <= ble) {
            popouts.currentName = "bluetooth";
            popouts.currentCenter = Qt.binding(() => statusIcons.x + statusIconsInner.x + statusIconsInner.bs + (statusIconsInner.be - statusIconsInner.bs) / 2);
            popouts.hasCurrent = true;
        } else if (x >= bx && x <= bx + b.implicitWidth + spacing) {
            popouts.currentName = "battery";
            popouts.currentCenter = Qt.binding(() => statusIcons.x + statusIconsInner.x + b.x + b.implicitWidth / 2);
            popouts.hasCurrent = true;
        } else {
            popouts.hasCurrent = false;
        }
    }

    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top

    implicitHeight: child.implicitHeight + Config.border.thickness * 2

    RowLayout {
        id: child
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: Appearance.padding.extraLarge
        anchors.rightMargin: Appearance.padding.extraLarge
        anchors.verticalCenter: parent.verticalCenter

        spacing: Appearance.spacing.normal

        OsIcon {
            Layout.alignment: Qt.AlignVCenter
        }

        StyledRect {
            id: workspaces

            radius: Appearance.rounding.full
            color: Colours.palette.m3surfaceContainer

            implicitHeight: workspacesInner.implicitHeight + Appearance.padding.small
            implicitWidth: workspacesInner.implicitWidth + Appearance.padding.small * 2

            // Layout.fillHeight: true
            Layout.alignment: Qt.AlignVCenter

            CustomMouseArea {
                anchors.fill: parent
                anchors.topMargin: -Config.border.thickness
                anchors.bottomMargin: -Config.border.thickness

                function onWheel(event: WheelEvent): void {
                    const activeWs = Hyprland.activeToplevel?.workspace?.name;
                    if (activeWs?.startsWith("special:"))
                        Hyprland.dispatch(`togglespecialworkspace ${activeWs.slice(8)}`);
                    else if (event.angleDelta.x < 0 || Hyprland.activeWsId > 1)
                        Hyprland.dispatch(`workspace r${event.angleDelta.x > 0 ? "-" : "+"}1`);
                }
            }

            Workspaces {
                id: workspacesInner

                anchors.centerIn: parent
                // anchors.topMargin: parent
            }
        }

        Item {
            Layout.fillWidth: true
        }

        Clock {
            id: clock

            // Layout.anchors.horizontalCenter: parent.anchors.horizontalCenter
            Layout.alignment: Qt.AlignVCenter
            // Layout.alignment: Qt.AlignHCenter (Idk now how to center clock to screen)
        }

        Item {
            Layout.fillWidth: true
        }

        Tray {
            id: tray

            Layout.alignment: Qt.AlignVCenter
        }

        StyledRect {
            id: statusIcons

            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: power.left
            anchors.rightMargin: Appearance.spacing.normal

            // // Next is an optional replacement for the anchors above
            // Layout.fillHeight: true
            // Layout.alignment: Qt.AlignVCenter

            radius: Appearance.rounding.full
            color: Colours.palette.m3surfaceContainer

            implicitWidth: statusIconsInner.implicitWidth + Appearance.padding.normal * 2

            StatusIcons {
                id: statusIconsInner

                anchors.centerIn: parent
            }
        }

        Power {
            Layout.alignment: Qt.AlignVCenter

            visibilities: root.visibilities
        }
    }
}
