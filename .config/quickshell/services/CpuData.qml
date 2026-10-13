import QtQuick
import Quickshell
import Quickshell.Io // Import the IO library for Process

Item {
    id: cpuData

    // Properties to store our calculated metrics
    property var cpuUsage: 0
    property var lastCpuTotal: 0 
    property var lastCpuIdle: 0 

    Process {
        id: cpuProc
        
        // Command to grab the first line of /proc/stat
        command: ["sh", "-c", "head -1 /proc/stat"]
        
        // Run this repeatedly using a Timer, or set it to stream
        running: true
        
        stdout: SplitParser {
          onRead: data => {
            if (!data) return
            var parts = data.trim().split(/\s+/)
            var user = parseInt(parts[1]) || 0
            var nice = parseInt(parts[2]) || 0
            var system = parseInt(parts[3]) || 0
            var idle = parseInt(parts[4]) || 0
            var iowait = parseInt(parts[5]) || 0
            var irq = parseInt(parts[6]) || 0
            var softirq = parseInt(parts[7]) || 0

            var total = user + nice + system + idle + iowait + irq + softirq
            var idleTime = idle + iowait

            if (lastCpuTotal > 0) {
              var totalDiff = total - lastCpuTotal
              var idleDiff = idleTime - lastCpuIdle
              cpuData.cpuUsage = Math.round(100 * (totalDiff - idleDiff) / totalDiff) 
            } 
            lastCpuIdle = idleTime
            lastCpuTotal = total
          }
        } 

        Component.onCompleted: running = true
    }

    // Trigger the process periodically
    Timer {
        interval: 2000 // every 2 seconds
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: cpuProc.running = true
    }
}
