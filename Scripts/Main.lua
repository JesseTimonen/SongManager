-- Function to create song into the song select list --
function createSong(name, fileName, instrument)
	local song = Turbine.UI.Lotro.Button();
    song:SetSize(200, 20);
    song:SetText(name);
    song.Click = function( sender, args)
        UI.playSongQuickslot:SetShortcut(Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, "/play " .. fileName));
        UI.playSongQuickslot:SetAllowDrop(false);
		UI.feedbackLabel:SetForeColor(color["white"]);
		UI.feedbackLabel:SetText("Selected song: " .. name);
    end
    
    if (instrument == "lute") then
        UI.luteSongList:AddItem(song);
    elseif (instrument == "clarinet") then
        UI.clarinetSongList:AddItem(song);
    elseif (instrument == "fiddle") then
        UI.fiddleSongList:AddItem(song);
    elseif (instrument == "harp") then
        UI.harpSongList:AddItem(song);
    end
end


-- Loop through song library and add songs into the song select list --
function sortSongLibrary()
    UI.luteSongList:ClearItems();
    UI.clarinetSongList:ClearItems();
    UI.fiddleSongList:ClearItems();
    UI.harpSongList:ClearItems();

    if (luteSongLibrary ~= {}) and (luteSongLibrary ~= nil) then
        sortedSongLibrary = {};
        for id in pairs(luteSongLibrary) do table.insert(sortedSongLibrary, id); end
        table.sort(sortedSongLibrary)

        for i = 1, Utility.tableLenght(sortedSongLibrary), 1 do
            createSong(sortedSongLibrary[i], luteSongLibrary[sortedSongLibrary[i]], "lute");
        end
    end
    
    if (clarinetSongLibrary ~= {}) and (clarinetSongLibrary ~= nil) then
        sortedSongLibrary = {};
        for id in pairs(clarinetSongLibrary) do table.insert(sortedSongLibrary, id); end
        table.sort(sortedSongLibrary)

        for i = 1, Utility.tableLenght(sortedSongLibrary), 1 do
            createSong(sortedSongLibrary[i], clarinetSongLibrary[sortedSongLibrary[i]], "clarinet");
        end
    end
    
    if (fiddleSongLibrary ~= {}) and (fiddleSongLibrary ~= nil) then
        sortedSongLibrary = {};
        for id in pairs(fiddleSongLibrary) do table.insert(sortedSongLibrary, id); end
        table.sort(sortedSongLibrary)

        for i = 1, Utility.tableLenght(sortedSongLibrary), 1 do
            createSong(sortedSongLibrary[i], fiddleSongLibrary[sortedSongLibrary[i]], "fiddle");
        end
    end
    
    if (harpSongLibrary ~= {}) and (harpSongLibrary ~= nil) then
        sortedSongLibrary = {};
        for id in pairs(harpSongLibrary) do table.insert(sortedSongLibrary, id); end
        table.sort(sortedSongLibrary)

        for i = 1, Utility.tableLenght(sortedSongLibrary), 1 do
            createSong(sortedSongLibrary[i], harpSongLibrary[sortedSongLibrary[i]], "harp");
        end
	end
end

sortSongLibrary();