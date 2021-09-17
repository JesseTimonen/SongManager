function saveSettings()

    if (UI.mainWindow:GetLeft() < 0) then
        settings["windowPosition"]["xPos"] = "0";
    else
        settings["windowPosition"]["xPos"] = tostring(UI.mainWindow:GetLeft());
    end

    if (UI.mainWindow:GetTop() < 0) then
        settings["windowPosition"]["yPos"] = "0";
    else
        settings["windowPosition"]["yPos"] = tostring(UI.mainWindow:GetTop());
    end

    Turbine.PluginData.Save(Turbine.DataScope.Server, settingsFileName, settings);
end

function loadSettings()
    local _settings = Turbine.PluginData.Load(Turbine.DataScope.Server, settingsFileName);
    if _settings ~= nil then settings = _settings; end
end


function saveSongLibrary()
    Turbine.PluginData.Save(Turbine.DataScope.Server, luteSongLibraryFileName, luteSongLibrary);
    Turbine.PluginData.Save(Turbine.DataScope.Server, clarinetSongLibraryFileName, clarinetSongLibrary);
    Turbine.PluginData.Save(Turbine.DataScope.Server, fiddleSongLibraryFileName, fiddleSongLibrary);
    Turbine.PluginData.Save(Turbine.DataScope.Server, harpSongLibraryFileName, harpSongLibrary);
end

function loadSongLibrary()
    local _songLibrary = {};

    _songLibrary = Turbine.PluginData.Load(Turbine.DataScope.Server, luteSongLibraryFileName);
    if _songLibrary ~= nil then luteSongLibrary = _songLibrary; end

    _songLibrary = Turbine.PluginData.Load(Turbine.DataScope.Server, clarinetSongLibraryFileName);
    if _songLibrary ~= nil then clarinetSongLibrary = _songLibrary; end

    _songLibrary = Turbine.PluginData.Load(Turbine.DataScope.Server, fiddleSongLibraryFileName);
    if _songLibrary ~= nil then fiddleSongLibrary = _songLibrary; end

    _songLibrary = Turbine.PluginData.Load(Turbine.DataScope.Server, harpSongLibraryFileName);
    if _songLibrary ~= nil then harpSongLibrary = _songLibrary; end
end