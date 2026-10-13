import Quickshell
import Quickshell.Io
import QtQuick.Layouts
import QtQuick
import "../services"

Item {
  id: root
  property string time 

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData
      color: Everforest.bgDim

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30 

      ClockWidget {
        anchors.centerIn: parent
      }

      Workspaces {
        padding: 3
        anchors.verticalCenter: parent.verticalCenter

      }

      Row {
        padding: 3
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        spacing: 20 
        
        CpuWidget {
        }

        RamWidget {

        }

      }

    }
  }
}
