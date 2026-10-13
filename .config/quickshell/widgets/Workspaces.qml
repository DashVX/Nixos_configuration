import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import Quickshell.Widgets
import "../services"

import "IconHelper.js" as IconHelper

Row {
    spacing: 0

    Repeater {
      model: Hyprland.workspaces

        Rectangle {
            required property var modelData

            width: childrenRect.width + 15
            height: 30
 
            color: Everforest.bgDim

            Row {
              x: 20
              anchors.verticalCenter: parent.verticalCenter
              Repeater {
                model: modelData.toplevels

                Text {
                  required property var modelData
                  property var title: modelData.wayland?.appId ? modelData.wayland?.appId : "unnamed"
                  property var icon: IconHelper.getIcon(title)

                  text: icon
                  font.family: Everforest.fontFamily
                  font.pixelSize: Everforest.fontSize + 2
                  padding: 3
                  font.bold: true
                  color: Everforest.fg
                }
              }
            }

            Text {
              text: modelData.id
              color: modelData.active ? Everforest.green : Everforest.bgGreen
              font.pixelSize: Everforest.fontSize
              font.family: Everforest.fontFamily
              font.bold: true
              padding: 5
            }
        }
    }
}

