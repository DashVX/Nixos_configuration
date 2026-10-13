import QtQuick
import Quickshell
import "../services"

Rectangle {

  width: 100 
  height: 20


  color: Everforest.bgDim

  RamData {
    id: ramProvider
  }

  Text {

    text: "RAM: " + ramProvider.ramUsage
    font.family: Everforest.fontFamily
    font.bold: true
    font.pixelSize: Everforest.fontSize
    color: Everforest.purple

    anchors.centerIn: parent
  }
}
