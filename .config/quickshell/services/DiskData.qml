import QtQuick
import Quickshell
import Quickshell.Io

Item { 
  id: diskData

  property string usedSpace: "0G"

  Process {

    command: ["sh", "-c", "while true; do df -h | awk '/nvme0n1p6/ {print $3}'; sleep 10; done"]

    running: true

    stdout: SplitParser {
      onRead: data => {
        var line = data.trim()
        if (line.length > 0) {
          diskData.usedSpace = line
        }
      } 
    }
  }
}
