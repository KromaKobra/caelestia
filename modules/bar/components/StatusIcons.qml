import "root:/widgets"
import "root:/services"
import "root:/utils"
import "root:/config"
import Quickshell
import Quickshell.Services.UPower
import Quickshell.Services.Mpris
import QtQuick

Item {
    id: root

    property color colour: Colours.palette.m3secondary

    readonly property Item performance: performance
    readonly property real ns: network.x
    readonly property real ne: network.x + network.implicitWidth
    readonly property real ds: display.x
    readonly property real de: display.x + display.implicitWidth
    readonly property real aus: audio.x
    readonly property real aue: audio.x + audio.implicitWidth
    readonly property real ms: media.x
    readonly property real me: media.x + media.implicitWidth
    readonly property real bs: bluetooth.x
    readonly property real be: repeater.count > 0 ? devices.x + devices.implicitWidth : bluetooth.x + bluetooth.implicitWidth
    readonly property Item battery: battery

    clip: true
    implicitHeight: Math.max(performance.implicitHeight, network.implicitHeight, display.implicitHeight, audio.implicitHeight, media.implicitHeight, bluetooth.implicitHeight, devices.implicitHeight, battery.implicitHeight)
    implicitWidth: performance.implicitWidth + network.implicitWidth + network.anchors.leftMargin + display.implicitWidth + display.anchors.leftMargin + audio.implicitWidth + audio.anchors.leftMargin + media.implicitWidth + media.anchors.leftMargin + bluetooth.implicitWidth + bluetooth.anchors.leftMargin + (repeater.count > 0 ? devices.implicitWidth + devices.anchors.leftMargin : 0) + battery.implicitWidth + battery.anchors.leftMargin

    MaterialIcon {
        id: performance

        animate: true
        text: "speed"
        color: root.colour

        anchors.verticalCenter: parent.verticalCenter
    }

    MaterialIcon {
        id: network

        anchors.verticalCenter: performance.verticalCenter
        anchors.left: performance.right
        anchors.leftMargin: Appearance.spacing.smaller / 2

        animate: true
        text: Network.active ? Icons.getNetworkIcon(Network.active.strength ?? 0) : "wifi_off"
        color: root.colour
    }

    MaterialIcon {
        id: display

        anchors.verticalCenter: network.verticalCenter
        anchors.left: network.right
        anchors.leftMargin: Appearance.spacing.smaller / 2

        animate: true
        text: "clear_day"
        color: root.colour
    }

    MaterialIcon {
        id: audio

        anchors.verticalCenter: display.verticalCenter
        anchors.left: display.right
        anchors.leftMargin: Appearance.spacing.smaller / 2

        animate: true
        text: "volume_up"
        color: root.colour
    }

    MaterialIcon {
        id: media

        anchors.verticalCenter: audio.verticalCenter
        anchors.left: audio.right
        anchors.leftMargin: !!Players.active ? Appearance.spacing.smaller / 2 : 0

        animate: true
        text: !!Players.active ? "music_note" : ""
        color: root.colour
    }

    MaterialIcon {
        id: bluetooth

        anchors.verticalCenter: media.verticalCenter
        anchors.left: media.right
        anchors.leftMargin: Appearance.spacing.smaller / 2

        animate: true
        text: Bluetooth.powered ? "bluetooth" : "bluetooth_disabled"
        color: root.colour
    }

    Row {
        id: devices

        anchors.verticalCenter: bluetooth.verticalCenter
        anchors.left: bluetooth.right
        anchors.leftMargin: Appearance.spacing.smaller / 2

        spacing: Appearance.spacing.smaller / 2

        Repeater {
            id: repeater

            model: ScriptModel {
                values: Bluetooth.devices.filter(d => d.connected)
            }

            MaterialIcon {
                required property Bluetooth.Device modelData

                animate: true
                text: Icons.getBluetoothIcon(modelData.icon)
                color: root.colour
                fill: 1
            }
        }
    }

    MaterialIcon {
        id: battery

        anchors.verticalCenter: devices.verticalCenter
        anchors.left: repeater.count > 0 ? devices.right : bluetooth.right
        anchors.leftMargin: Appearance.spacing.smaller / 2

        animate: true
        text: {
            if (!UPower.displayDevice.isLaptopBattery) {
                if (PowerProfiles.profile === PowerProfile.PowerSaver)
                    return "energy_savings_leaf";
                if (PowerProfiles.profile === PowerProfile.Performance)
                    return "rocket_launch";
                return "balance";
            }

            const perc = UPower.displayDevice.percentage;
            const charging = !UPower.onBattery;
            if (perc === 1)
                return charging ? "battery_charging_full" : "battery_full";
            let level = Math.floor(perc * 7);
            if (charging && (level === 4 || level === 1))
                level--;
            return charging ? `battery_charging_${(level + 3) * 10}` : `battery_${level}_bar`;
        }
        color: !UPower.onBattery || UPower.displayDevice.percentage > 0.2 ? root.colour : Colours.palette.m3error
        fill: 1
    }

    Behavior on implicitHeight {
        NumberAnimation {
            duration: Appearance.anim.durations.normal
            easing.type: Easing.BezierSpline
            easing.bezierCurve: Appearance.anim.curves.emphasized
        }
    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: Appearance.anim.durations.normal
            easing.type: Easing.BezierSpline
            easing.bezierCurve: Appearance.anim.curves.emphasized
        }
    }
}
