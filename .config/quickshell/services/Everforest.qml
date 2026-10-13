pragma Singleton
import QtQuick

QtObject {
    // Backgrounds
    readonly property color bgDim: "#232a2e"
    readonly property color bg0: "#2d353b"
    readonly property color bg1: "#343f44"
    readonly property color bg2: "#3d484d"
    readonly property color bg3: "#475258"
    readonly property color bg4: "#4f585e"
    readonly property color bg5: "#56635f"

    // UI & Selections
    readonly property color bgVisual: "#543a48"
    readonly property color bgRed: "#514045"
    readonly property color bgGreen: "#425047"
    readonly property color bgBlue: "#3a515d"
    readonly property color bgYellow: "#4d4c43"

    // Foregrounds & Neutrals
    readonly property color fg: "#d3c6aa"
    readonly property color grey0: "#7a8478"
    readonly property color grey1: "#859289"
    readonly property color grey2: "#9da9a0"

    // Accents
    readonly property color red: "#e67e80"
    readonly property color orange: "#e69875"
    readonly property color yellow: "#dbbc7f"
    readonly property color green: "#a7c080"
    readonly property color aqua: "#83c092"
    readonly property color blue: "#7fbbb3"
    readonly property color purple: "#d699b6"

    // Semantic UI Shortcuts
    readonly property color accent: green
    readonly property color border: bg3
    readonly property color surface: bg1

    // Font Stuff
    readonly property string fontFamily: "JetBrainsMono Nerd Font"
    readonly property int fontSize: 15
}
