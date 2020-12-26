-- Save data --
function save(dataScope, key, value)
    Turbine.PluginData.Save(getDataScope(dataScope), key, value);
end


-- Load data --
function load(dataScope, key)
    return Turbine.PluginData.Load(getDataScope(dataScope), key);
end


-- Parse datascope from string --
function getDataScope(dataScope)
    if (string.lower(dataScope) == "server") then
        return Turbine.DataScope.Server;
    elseif (string.lower(dataScope) == "character") then
        return Turbine.DataScope.Character;
    end

    return Turbine.DataScope.Server;
end


function saveSettings()
    settings["windowPosition"]["xPos"] = tostring(UI.mainWindow:GetLeft());
    settings["windowPosition"]["yPos"] = tostring(UI.mainWindow:GetTop());
    save("server", settingsFileName, settings);
end

function loadSettings()
    local _settings = load("server", settingsFileName);
    if _settings ~= nil then settings = _settings; end
end


function saveSongLibrary()
    save("server", songLibraryFileName, songLibrary);
end

function loadSongLibrary()
    local _songLibrary = load("server", songLibraryFileName);
    if _songLibrary ~= nil then songLibrary = _songLibrary; end
end