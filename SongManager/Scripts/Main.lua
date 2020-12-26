-- Function to create song into the song select list --
function createSong(name, fileName)
	local song = Turbine.UI.Lotro.Button();
    song:SetSize(200, 20);
    song:SetText(name);
    song.Click = function( sender, args)
        UI.playSongQuickslot:SetShortcut(Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, "/play " .. fileName));
        UI.playSongQuickslot:SetAllowDrop(false);
		UI.feedbackLabel:SetForeColor(color["white"]);
		UI.feedbackLabel:SetText("Selected song: " .. name);
	end
	UI.songList:AddItem(song);
end


-- Loop through song library and add songs into the song select list --
function CreateSongSelection()
    UI.songList:ClearItems();

	if songLibrary ~= {} then
        for songName, fileName in pairs(songLibrary) do
            createSong(songName, fileName);
        end
	end
end

CreateSongSelection();