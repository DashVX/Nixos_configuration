var categoryIcons = {
  "terminal": "",
  "browser": "󰊯",
  "spotify": "",
  "vinegar": "",
  "discord": "",
  "default": "",
}

var titleCategories = {
  "kitty": "terminal",
  "alacritty": "terminal",
  "bash": "terminal",

  //browser
  "chromium-browser": "browser",
  "firefox": "browser",

  //spotify
  "spotify": "spotify",

  "discord": "discord",
}

function getIcon(title) {
  var key = title.toString();

  if (title == undefined || title == null || !title) {
    return categoryIcons["default"];
  }

  var category = titleCategories[key] || "default";

  return categoryIcons[category];
}
