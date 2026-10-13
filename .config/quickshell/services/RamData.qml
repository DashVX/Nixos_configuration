import QtQuick
import Quickshell
import Quickshell.Io

Item {
  id: ramData

  property string ramUsage: "0"

  Process {
    id: ramProc
    // Run a persistent shell loop that prints every 2 seconds.
    // This avoids repeatedly spawning/teardown of processes.
    command: ["sh", "-c", "while true; do free -h | awk '/Mem:/ {print $3}'; sleep 5; done"]
    running: true

    stdout: SplitParser {
      onRead: data => {
        let val = data.trim()
        if (val.length > 0) {
          ramData.ramUsage = data;
        }
      }
    }
  }
}
