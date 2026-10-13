pragma Singleton
import QtQuick
import Quickshell

Singleton {
  id: root
  readonly property string time: {

    Qt.formatDateTime(clock.date, "ddd hh:mm MMM d")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }
}
