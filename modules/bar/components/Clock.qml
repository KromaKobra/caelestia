import QtQuick
import "root:/config"
import "root:/services"
import "root:/widgets"

Row {
    id: root

    property color colour: Colours.palette.m3tertiary

    spacing: Appearance.spacing.small

    StyledText {
        id: timeText

        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: StyledText.AlignHCenter
        text: Time.format("hh:mm")
        font.pointSize: Appearance.font.size.smaller
        font.family: Appearance.font.family.mono
        color: root.colour
    }

    MaterialIcon {
        id: icon

        text: "calendar_month"
        color: root.colour
        anchors.verticalCenter: parent.verticalCenter
    }

    StyledText {
        id: dateText

        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: StyledText.AlignHCenter
        text: Time.format("ddd d")
        font.pointSize: Appearance.font.size.smaller
        font.family: Appearance.font.family.mono
        color: root.colour
    }

}
