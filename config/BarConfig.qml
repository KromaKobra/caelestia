import Quickshell.Io

JsonObject {
    property bool persistent: true
    property bool showOnHover: true
    property int dragThreshold: 20
    property JsonObject sizes
    property JsonObject workspaces

    sizes: JsonObject {
        property int innerHeight: 22
        // property int windowPreviewSize: 400
        property int trayMenuWidth: 300
        property int batteryWidth: 250
    }

    workspaces: JsonObject {
        property int shown: 10
        property bool rounded: true
        property bool activeIndicator: true
        property bool occupiedBg: false
        property bool showWindows: false // Set to true to see the windows for each workspace
        property bool activeTrail: false
        property string label: " "//"󰻂 "
        property string occupiedLabel: "󰄯 "
        property string activeLabel: "󰄯 " //󰲠 󰲢
    }

}
