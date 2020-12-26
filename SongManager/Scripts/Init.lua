-- Plugin's name --
pluginName = "Song Manager";

-- File names --
settingsFileName = "Song_Manager_Settings";
songLibraryFileName = "Song_Manager_Library";

-- Song library --
songLibrary = {};

-- Default settings --
settings = {
    windowPosition = {
        xPos = 0,
        yPos = 0
    }
};

-- RGB color codes --
rgb = {
    pluginName = "<rgb=#DAA520>",
    error = "<rgb=#FF0000>",
    clear = "</rgb>"
};

-- UI color codes --
color = {
    black = Turbine.UI.Color(0, 0, 0),
    white = Turbine.UI.Color(1, 1, 1),
    red = Turbine.UI.Color(1, 0, 0),
    green = Turbine.UI.Color(0, 1, 0),
};

-- Load settings and song library --
loadSettings();
loadSongLibrary();