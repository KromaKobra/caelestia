import qs.widgets
import qs.services
import qs.config
import QtQuick
import QtQuick.Controls

Column {
    id: root
    spacing: Appearance.spacing.normal

    // // Brightness Control Section
    // Column {
    //     width: parent.width
    //     spacing: Appearance.spacing.small

    //     StyledText {
    //         text: "Brightness"
    //         font.pointSize: Appearance.fontSize.medium
    //         color: Colours.palette.m3secondary
    //     }

    //     Row {
    //         width: parent.width
    //         spacing: Appearance.spacing.small

    //         MaterialIcon {
    //             text: "brightness_1"
    //             font.pointSize: Appearance.fontSize.small
    //             color: Colours.palette.m3secondary
    //             anchors.verticalCenter: parent.verticalCenter
    //         }

    //         Slider {
    //             id: brightnessSlider
    //             width: parent.width - 60
    //             from: 0.1
    //             to: 1.0
    //             value: Brightness.brightness || 0.5

    //             // background: StyledRect {
    //             //     width: brightnessSlider.availableWidth
    //             //     height: 4
    //             //     radius: 2
    //             //     color: Appearance.color.surfaceVariant

    //             //     StyledRect {
    //             //         width: brightnessSlider.visualPosition * parent.width
    //             //         height: parent.height
    //             //         color: Appearance.color.primary
    //             //         radius: 2
    //             //     }
    //             // }

    //             // handle: StyledRect {
    //             //     x: brightnessSlider.leftPadding + brightnessSlider.visualPosition * (brightnessSlider.availableWidth - width)
    //             //     y: brightnessSlider.topPadding + brightnessSlider.availableHeight / 2 - height / 2
    //             //     width: 20
    //             //     height: 20
    //             //     radius: 10
    //             //     color: Appearance.color.primary
    //             //     border.color: Appearance.color.outline
    //             //     border.width: 1
    //             // }

    //             // onValueChanged: {
    //             //     if (pressed) {
    //             //         Brightness.brightness = value;
    //             //     }
    //             // }
    //         }

    //         MaterialIcon {
    //             text: "brightness_7"
    //             font.pointSize: Appearance.fontSize.small
    //             color: Colours.palette.m3secondary
    //             anchors.verticalCenter: parent.verticalCenter
    //         }
    //     }
    // }
    StyledText {
        text: "testingggggggggg"
    }

    // Separator
    Rectangle {
        width: parent.width
        height: 1
        color: Colours.palette.m3secondary
    }

    // Blue Light Filter Section
    Column {
        width: parent.width
        spacing: Appearance.spacing.small

        Row {
            width: parent.width
            spacing: Appearance.spacing.small

            StyledText {
                text: "Blue Light Filter"
                font.pointSize: Appearance.fontSize.medium
                color: Colours.palette.m3secondary
                anchors.verticalCenter: parent.verticalCenter
            }

            // Item {
            //     Layout.fillWidth: true
            // }

            Switch {
                id: blueFilterSwitch
                checked: blueFilterEnabled
                anchors.verticalCenter: parent.verticalCenter

                indicator: StyledRect {
                    width: 40
                    height: 20
                    radius: 10
                    color: blueFilterSwitch.checked ? Appearance.color.primary : Appearance.color.surfaceVariant
                    border.color: Appearance.color.outline
                    border.width: 1

                    StyledRect {
                        x: blueFilterSwitch.checked ? parent.width - width - 2 : 2
                        y: 2
                        width: 16
                        height: 16
                        radius: 8
                        color: Appearance.color.onPrimary

                        Behavior on x {
                            NumberAnimation {
                                duration: 150
                            }
                        }
                    }
                }

                onToggled: {
                    blueFilterEnabled = checked;
                    if (checked) {
                        enableBlueFilter(blueFilterIntensity);
                    } else {
                        disableBlueFilter();
                    }
                }
            }
        }

        // // Blue Filter Intensity Control (only shown when enabled)
        // Column {
        //     width: parent.width
        //     spacing: Appearance.spacing.small
        //     visible: blueFilterEnabled

        //     StyledText {
        //         text: "Intensity"
        //         font.pointSize: Appearance.fontSize.small
        //         color: Appearance.color.onSurfaceVariant
        //     }

        //     Row {
        //         width: parent.width
        //         spacing: Appearance.spacing.small

        //         MaterialIcon {
        //             icon: "wb_sunny"
        //             size: Appearance.iconSize.small
        //             color: Appearance.color.onSurfaceVariant
        //             anchors.verticalCenter: parent.verticalCenter
        //         }

        //         Slider {
        //             id: intensitySlider
        //             width: parent.width - 60
        //             from: 1000
        //             to: 6500
        //             value: blueFilterIntensity
        //             stepSize: 100

        //             background: StyledRect {
        //                 width: intensitySlider.availableWidth
        //                 height: 4
        //                 radius: 2
        //                 color: Appearance.color.surfaceVariant

        //                 StyledRect {
        //                     width: intensitySlider.visualPosition * parent.width
        //                     height: parent.height
        //                     color: Qt.rgba(1.0, 0.7, 0.3, 1.0) // Orange color for warmth
        //                     radius: 2
        //                 }
        //             }

        //             handle: StyledRect {
        //                 x: intensitySlider.leftPadding + intensitySlider.visualPosition * (intensitySlider.availableWidth - width)
        //                 y: intensitySlider.topPadding + intensitySlider.availableHeight / 2 - height / 2
        //                 width: 20
        //                 height: 20
        //                 radius: 10
        //                 color: Qt.rgba(1.0, 0.7, 0.3, 1.0)
        //                 border.color: Appearance.color.outline
        //                 border.width: 1
        //             }

        //             onValueChanged: {
        //                 if (pressed) {
        //                     blueFilterIntensity = Math.round(value);
        //                     if (blueFilterEnabled) {
        //                         enableBlueFilter(blueFilterIntensity);
        //                     }
        //                 }
        //             }
        //         }

        //         StyledText {
        //             text: Math.round(intensitySlider.value) + "K"
        //             font.pointSize: Appearance.fontSize.small
        //             color: Appearance.color.onSurfaceVariant
        //             anchors.verticalCenter: parent.verticalCenter
        //         }
        //     }
        // }
    }

    // // Separator
    // Rectangle {
    //     width: parent.width
    //     height: 1
    //     color: Appearance.color.outlineVariant
    // }

    // // Idle Management Section
    // Column {
    //     width: parent.width
    //     spacing: Appearance.spacing.small

    //     Row {
    //         width: parent.width
    //         spacing: Appearance.spacing.small

    //         StyledText {
    //             text: "Screen Idle"
    //             font.pointSize: Appearance.fontSize.medium
    //             color: Appearance.color.onSurfaceVariant
    //             anchors.verticalCenter: parent.verticalCenter
    //         }

    //         Item {
    //             Layout.fillWidth: true
    //         }

    //         Switch {
    //             id: idleSwitch
    //             checked: !idleDisabled
    //             anchors.verticalCenter: parent.verticalCenter

    //             indicator: StyledRect {
    //                 width: 40
    //                 height: 20
    //                 radius: 10
    //                 color: idleSwitch.checked ? Appearance.color.primary : Appearance.color.surfaceVariant
    //                 border.color: Appearance.color.outline
    //                 border.width: 1

    //                 StyledRect {
    //                     x: idleSwitch.checked ? parent.width - width - 2 : 2
    //                     y: 2
    //                     width: 16
    //                     height: 16
    //                     radius: 8
    //                     color: Appearance.color.onPrimary

    //                     Behavior on x {
    //                         NumberAnimation {
    //                             duration: 150
    //                         }
    //                     }
    //                 }
    //             }

    //             onToggled: {
    //                 if (checked) {
    //                     // Show idle duration options
    //                     idleOptionsVisible = true;
    //                 } else {
    //                     // Disable idle immediately
    //                     disableIdle();
    //                     idleDisabled = true;
    //                 }
    //             }
    //         }
    //     }

    //     // Idle Duration Options (only shown when turning on idle)
    //     Column {
    //         width: parent.width
    //         spacing: Appearance.spacing.small
    //         visible: idleOptionsVisible

    //         StyledText {
    //             text: "Enable idle for:"
    //             font.pointSize: Appearance.fontSize.small
    //             color: Appearance.color.onSurfaceVariant
    //         }

    //         Row {
    //             spacing: Appearance.spacing.small

    //             Button {
    //                 text: "15 min"
    //                 onClicked: {
    //                     enableIdleFor(15);
    //                     idleOptionsVisible = false;
    //                     idleDisabled = false;
    //                 }

    //                 background: StyledRect {
    //                     color: parent.pressed ? Appearance.color.primaryContainer : Appearance.color.surface
    //                     border.color: Appearance.color.outline
    //                     border.width: 1
    //                     radius: Appearance.radius.small
    //                 }

    //                 contentItem: StyledText {
    //                     text: parent.text
    //                     color: Appearance.color.onSurface
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                 }
    //             }

    //             Button {
    //                 text: "1 hr"
    //                 onClicked: {
    //                     enableIdleFor(60);
    //                     idleOptionsVisible = false;
    //                     idleDisabled = false;
    //                 }

    //                 background: StyledRect {
    //                     color: parent.pressed ? Appearance.color.primaryContainer : Appearance.color.surface
    //                     border.color: Appearance.color.outline
    //                     border.width: 1
    //                     radius: Appearance.radius.small
    //                 }

    //                 contentItem: StyledText {
    //                     text: parent.text
    //                     color: Appearance.color.onSurface
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                 }
    //             }

    //             Button {
    //                 text: "Custom"
    //                 onClicked: {
    //                     customIdleInput.visible = true;
    //                 }

    //                 background: StyledRect {
    //                     color: parent.pressed ? Appearance.color.primaryContainer : Appearance.color.surface
    //                     border.color: Appearance.color.outline
    //                     border.width: 1
    //                     radius: Appearance.radius.small
    //                 }

    //                 contentItem: StyledText {
    //                     text: parent.text
    //                     color: Appearance.color.onSurface
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                 }
    //             }

    //             Button {
    //                 text: "Indefinite"
    //                 onClicked: {
    //                     enableIdle();
    //                     idleOptionsVisible = false;
    //                     idleDisabled = false;
    //                 }

    //                 background: StyledRect {
    //                     color: parent.pressed ? Appearance.color.primaryContainer : Appearance.color.surface
    //                     border.color: Appearance.color.outline
    //                     border.width: 1
    //                     radius: Appearance.radius.small
    //                 }

    //                 contentItem: StyledText {
    //                     text: parent.text
    //                     color: Appearance.color.onSurface
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                 }
    //             }
    //         }

    //         // Custom idle time input
    //         Row {
    //             spacing: Appearance.spacing.small
    //             visible: customIdleInput.visible

    //             StyledTextField {
    //                 id: customMinutesInput
    //                 width: 80
    //                 placeholderText: "mins"
    //                 validator: IntValidator {
    //                     bottom: 1
    //                     top: 999
    //                 }
    //             }

    //             Button {
    //                 text: "Set"
    //                 onClicked: {
    //                     var minutes = parseInt(customMinutesInput.text);
    //                     if (minutes > 0) {
    //                         enableIdleFor(minutes);
    //                         customIdleInput.visible = false;
    //                         idleOptionsVisible = false;
    //                         idleDisabled = false;
    //                     }
    //                 }

    //                 background: StyledRect {
    //                     color: parent.pressed ? Appearance.color.primaryContainer : Appearance.color.surface
    //                     border.color: Appearance.color.outline
    //                     border.width: 1
    //                     radius: Appearance.radius.small
    //                 }

    //                 contentItem: StyledText {
    //                     text: parent.text
    //                     color: Appearance.color.onSurface
    //                     horizontalAlignment: Text.AlignHCenter
    //                     verticalAlignment: Text.AlignVCenter
    //                 }
    //             }
    //         }

    //         Item {
    //             id: customIdleInput
    //             visible: false
    //         }
    //     }

    //     // Current idle status
    //     StyledText {
    //         text: idleDisabled ? "Idle disabled" : (idleTimeRemaining > 0 ? "Idle in " + formatTime(idleTimeRemaining) : "Idle enabled")
    //         font.pointSize: Appearance.fontSize.small
    //         color: Appearance.color.onSurfaceVariant
    //         visible: !idleOptionsVisible
    //     }
    // }

    // // Properties for state management
    // property bool blueFilterEnabled: false
    // property int blueFilterIntensity: 4000
    // property bool idleDisabled: false
    // property bool idleOptionsVisible: false
    // property int idleTimeRemaining: 0

    // // Timer for idle countdown
    // Timer {
    //     id: idleTimer
    //     interval: 60000 // 1 minute
    //     repeat: true
    //     running: idleTimeRemaining > 0
    //     onTriggered: {
    //         idleTimeRemaining -= 1;
    //         if (idleTimeRemaining <= 0) {
    //             enableIdle();
    //         }
    //     }
    // }

    // // Functions for managing idle
    // function enableIdle() {
    //     runCommand("hypridle");
    //     idleDisabled = false;
    //     idleTimeRemaining = 0;
    // }

    // function disableIdle() {
    //     runCommand("killall hypridle");
    //     idleDisabled = true;
    //     idleTimeRemaining = 0;
    // }

    // function enableIdleFor(minutes) {
    //     disableIdle();
    //     idleTimeRemaining = minutes;
    //     idleTimer.start();
    // }

    // // Functions for managing blue light filter
    // function enableBlueFilter(temperature) {
    //     runCommand("hyprsunset -t " + temperature);
    // }

    // function disableBlueFilter() {
    //     runCommand("killall hyprsunset");
    // }

    // // Utility function to run commands
    // function runCommand(command) {
    //     console.log("Running command:", command);
    //     var process = Qt.createQmlObject('
    //         import QtQuick 2.0
    //         import qs.process 1.0
    //         Process {
    //             command: "' + command + '"
    //             running: true
    //         }
    //     ', root, "dynamicProcess");
    // }

    // // Format time for display
    // function formatTime(minutes) {
    //     if (minutes < 60) {
    //         return minutes + " min";
    //     } else {
    //         var hours = Math.floor(minutes / 60);
    //         var mins = minutes % 60;
    //         return hours + "h " + (mins > 0 ? mins + "m" : "");
    //     }
    // }
}
