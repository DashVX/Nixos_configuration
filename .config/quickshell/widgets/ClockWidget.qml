import QtQuick
import Quickshell
import "../services"

Rectangle {
  width: clockText.implicitWidth + 32
  height: clockText.implicitHeight + 16
  color: Everforest.bgDim

  Text {
    id: clockText
    text: ClockData.time 
    anchors.centerIn: parent
    color: Everforest.blue
    font.family: Everforest.fontFamily
    font.pixelSize: Everforest.fontSize
    font.bold: true
  }
}
