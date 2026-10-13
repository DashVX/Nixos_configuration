import Quickshell
import QtQuick
import "../services"

Rectangle {
  width: 65 
  height: 20

  color: Everforest.bgDim

  CpuData {
    id: myCpuData
  }

  Text {
    anchors.centerIn: parent
    text: "CPU: " + myCpuData.cpuUsage + "%" 
    color: Everforest.yellow
    font.family: Everforest.fontFamily
    font.pixelSize: Everforest.fontSize
    font.bold: true
  }
}
