import QtQuick
import Quickshell
import "../services"

Rectangle {

  
  color: Everforest.red

  Text {
    text: DiskData.usedSpace
    font.family: Everforest.fontFamily
    font.pixelSize: Everforest.fontSize

    color: Everforest.aqua
  }
}
