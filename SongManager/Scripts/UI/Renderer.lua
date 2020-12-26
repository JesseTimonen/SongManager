-- Main window --
mainWindow = Turbine.UI.Lotro.GoldWindow();
mainWindow:SetText("Song Manager");
mainWindow:SetVisible(true);
mainWindow:SetPosition(Scripts.settings["windowPosition"]["xPos"], Scripts.settings["windowPosition"]["yPos"]);
mainWindow:SetSize(350, 470);

-- Scrollbar for songs List --
scrollbar = Turbine.UI.Lotro.ScrollBar();
scrollbar:SetParent(mainWindow);
scrollbar:SetOrientation(Turbine.UI.Orientation.Vertical);
scrollbar:SetPosition(300, 120);
scrollbar:SetSize(10, 250);
scrollbar:SetVisible(false);

-- List for songs --
songList = Turbine.UI.ListBox();
songList:SetParent(mainWindow);
songList:SetPosition(50, 120);
songList:SetSize(250, 250);
songList:SetOrientation(Turbine.UI.Orientation.Vertical);
songList:SetVerticalScrollBar(scrollbar);

-- Feedback label --
feedbackLabel = Turbine.UI.Label();
feedbackLabel:SetParent(mainWindow);
feedbackLabel:SetText("");
feedbackLabel:SetSize(250, 50);
feedbackLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
feedbackLabel:SetPosition((mainWindow:GetWidth()/2 - feedbackLabel:GetWidth()/2), mainWindow:GetHeight() - 85);


-- ====================================================================================================================== --


-- Toggle Instrument UI --
toggleInstrumentQuickslot = Turbine.UI.Lotro.Quickslot();
toggleInstrumentQuickslot:SetParent(mainWindow);
toggleInstrumentQuickslot:SetSize(35,20);
toggleInstrumentQuickslot:SetPosition(160, 46);
toggleInstrumentQuickslot:SetZOrder(1);
toggleInstrumentQuickslot:SetUseOnRightClick(false);
toggleInstrumentQuickslot:SetVisible(false);
	
toggleInstrumentButton = Turbine.UI.Control();
toggleInstrumentButton:SetParent(mainWindow);
toggleInstrumentButton:SetSize(35,20);
toggleInstrumentButton:SetPosition(160, 46);
toggleInstrumentButton:SetZOrder(2);
toggleInstrumentButton:SetBackColor(Scripts.color["white"]);
toggleInstrumentButton:SetMouseVisible(false);
toggleInstrumentButton:SetVisible(true);

toggleInstrumentLabel = Turbine.UI.Label();
toggleInstrumentLabel:SetParent(mainWindow);
toggleInstrumentLabel:SetVisible(true);
toggleInstrumentLabel:SetSize(120, 30);
toggleInstrumentLabel:SetText("Toggle Instrument");
toggleInstrumentLabel:SetPosition(20, 50);

toggleInstrumentAction = Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, "/music");
toggleInstrumentQuickslot:SetShortcut(toggleInstrumentAction);
toggleInstrumentQuickslot:SetAllowDrop(false);


-- ====================================================================================================================== --


-- Play song UI --
playSongQuickslot = Turbine.UI.Lotro.Quickslot();
playSongQuickslot:SetParent(mainWindow);
playSongQuickslot:SetSize(35,20);
playSongQuickslot:SetPosition(160, 76);
playSongQuickslot:SetZOrder(1);
playSongQuickslot:SetUseOnRightClick(false);
playSongQuickslot:SetVisible(false);
	
playSongButton = Turbine.UI.Control();
playSongButton:SetParent(mainWindow);
playSongButton:SetSize(35,20);
playSongButton:SetPosition(160, 76);
playSongButton:SetZOrder(2);
playSongButton:SetBackColor(Scripts.color["white"]);
playSongButton:SetMouseVisible(false);
playSongButton:SetVisible(true);

playSongLabel = Turbine.UI.Label();
playSongLabel:SetParent(mainWindow);
playSongLabel:SetVisible(true);
playSongLabel:SetSize(140, 30);
playSongLabel:SetText("Play selected song");
playSongLabel:SetPosition(20, 80);

playSongAction = Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, "/play");
playSongQuickslot:SetShortcut(playSongAction);
playSongQuickslot:SetAllowDrop(false);


-- ====================================================================================================================== --


-- Add Song Button --
addSongButton = Turbine.UI.Lotro.Button();
addSongButton:SetText("Add Song");
addSongButton:SetParent(mainWindow);
addSongButton:SetSize(120, 30);
addSongButton:SetPosition((mainWindow:GetWidth()/2 - addSongButton:GetWidth()/2) - 70, mainWindow:GetHeight() - 40);
addSongButton.Click = function( sender, args)
	closeSideWindows();
	SongManager.UI.addSongWindow:SetVisibility(true);
end

-- Remove Song Button --
removeSongButton = Turbine.UI.Lotro.Button();
removeSongButton:SetText("Remove Song");
removeSongButton:SetParent(mainWindow);
removeSongButton:SetSize(120, 30);
removeSongButton:SetPosition((mainWindow:GetWidth()/2 - removeSongButton:GetWidth()/2) + 70, mainWindow:GetHeight() - 40);
removeSongButton.Click = function( sender, args)
	closeSideWindows();
	SongManager.UI.removeSongWindow:updateGroupList();
	SongManager.UI.removeSongWindow:SetVisibility(true);
end

function closeSideWindows()
	SongManager.UI.addSongWindow:SetVisibility(false);
	SongManager.UI.removeSongWindow:SetVisibility(false);
end