-- Main window --
mainWindow = Turbine.UI.Lotro.GoldWindow();
mainWindow:SetText("Song Manager");
mainWindow:SetVisible(true);
mainWindow:SetPosition(Scripts.settings["windowPosition"]["xPos"], Scripts.settings["windowPosition"]["yPos"]);
mainWindow:SetSize(1050, 470);


-- Label for lute song list --
luteSongListLabel = Turbine.UI.Label();
luteSongListLabel:SetParent(mainWindow);
luteSongListLabel:SetText("Lute Songs");
luteSongListLabel:SetSize(200, 50);
luteSongListLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
luteSongListLabel:SetPosition(50, 80);

-- Scrollbar for lute songs List --
luteScrollbar = Turbine.UI.Lotro.ScrollBar();
luteScrollbar:SetParent(mainWindow);
luteScrollbar:SetOrientation(Turbine.UI.Orientation.Vertical);
luteScrollbar:SetPosition(270, 120);
luteScrollbar:SetSize(10, 280);
luteScrollbar:SetVisible(false);

-- List for lute songs --
luteSongList = Turbine.UI.ListBox();
luteSongList:SetParent(mainWindow);
luteSongList:SetPosition(50, 120);
luteSongList:SetSize(220, 280);
luteSongList:SetOrientation(Turbine.UI.Orientation.Vertical);
luteSongList:SetVerticalScrollBar(luteScrollbar);


-- Label for clarinet song list --
clarinetSongListLabel = Turbine.UI.Label();
clarinetSongListLabel:SetParent(mainWindow);
clarinetSongListLabel:SetText("Clarinet Songs");
clarinetSongListLabel:SetSize(200, 50);
clarinetSongListLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
clarinetSongListLabel:SetPosition(300, 80);

-- Scrollbar for clarinet songs List --
clarinetScrollbar = Turbine.UI.Lotro.ScrollBar();
clarinetScrollbar:SetParent(mainWindow);
clarinetScrollbar:SetOrientation(Turbine.UI.Orientation.Vertical);
clarinetScrollbar:SetPosition(520, 120);
clarinetScrollbar:SetSize(10, 280);
clarinetScrollbar:SetVisible(false);

-- List for clarinet songs --
clarinetSongList = Turbine.UI.ListBox();
clarinetSongList:SetParent(mainWindow);
clarinetSongList:SetPosition(300, 120);
clarinetSongList:SetSize(220, 280);
clarinetSongList:SetOrientation(Turbine.UI.Orientation.Vertical);
clarinetSongList:SetVerticalScrollBar(clarinetScrollbar);


-- Label for fiddle song list --
fiddleSongListLabel = Turbine.UI.Label();
fiddleSongListLabel:SetParent(mainWindow);
fiddleSongListLabel:SetText("Fiddle Songs");
fiddleSongListLabel:SetSize(200, 50);
fiddleSongListLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
fiddleSongListLabel:SetPosition(550, 80);

-- Scrollbar for fiddle songs List --
fiddleScrollbar = Turbine.UI.Lotro.ScrollBar();
fiddleScrollbar:SetParent(mainWindow);
fiddleScrollbar:SetOrientation(Turbine.UI.Orientation.Vertical);
fiddleScrollbar:SetPosition(770, 120);
fiddleScrollbar:SetSize(10, 280);
fiddleScrollbar:SetVisible(false);

-- List for fiddle songs --
fiddleSongList = Turbine.UI.ListBox();
fiddleSongList:SetParent(mainWindow);
fiddleSongList:SetPosition(550, 120);
fiddleSongList:SetSize(220, 280);
fiddleSongList:SetOrientation(Turbine.UI.Orientation.Vertical);
fiddleSongList:SetVerticalScrollBar(fiddleScrollbar);


-- Label for harp song list --
harpSongListLabel = Turbine.UI.Label();
harpSongListLabel:SetParent(mainWindow);
harpSongListLabel:SetText("Harp Songs");
harpSongListLabel:SetSize(200, 50);
harpSongListLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
harpSongListLabel:SetPosition(800, 80);

-- Scrollbar for harp songs List --
harpScrollbar = Turbine.UI.Lotro.ScrollBar();
harpScrollbar:SetParent(mainWindow);
harpScrollbar:SetOrientation(Turbine.UI.Orientation.Vertical);
harpScrollbar:SetPosition(1020, 120);
harpScrollbar:SetSize(10, 280);
harpScrollbar:SetVisible(false);

-- List for harp songs --
harpSongList = Turbine.UI.ListBox();
harpSongList:SetParent(mainWindow);
harpSongList:SetPosition(800, 120);
harpSongList:SetSize(220, 280);
harpSongList:SetOrientation(Turbine.UI.Orientation.Vertical);
harpSongList:SetVerticalScrollBar(harpScrollbar);


-- Feedback label --
feedbackLabel = Turbine.UI.Label();
feedbackLabel:SetParent(mainWindow);
feedbackLabel:SetText("");
feedbackLabel:SetSize(350, 50);
feedbackLabel:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
feedbackLabel:SetPosition(480, 35);


-- ====================================================================================================================== --


-- Toggle Instrument UI --
toggleInstrumentQuickslot = Turbine.UI.Lotro.Quickslot();
toggleInstrumentQuickslot:SetParent(mainWindow);
toggleInstrumentQuickslot:SetSize(35,20);
toggleInstrumentQuickslot:SetPosition(160, 46);
toggleInstrumentQuickslot:SetZOrder(1);
toggleInstrumentQuickslot:SetUseOnRightClick(false);
toggleInstrumentQuickslot:SetVisible(true);
	
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
playSongQuickslot:SetPosition(365, 46);
playSongQuickslot:SetZOrder(1);
playSongQuickslot:SetUseOnRightClick(false);
playSongQuickslot:SetVisible(true);
	
playSongButton = Turbine.UI.Control();
playSongButton:SetParent(mainWindow);
playSongButton:SetSize(35,20);
playSongButton:SetPosition(365, 46);
playSongButton:SetZOrder(2);
playSongButton:SetBackColor(Scripts.color["white"]);
playSongButton:SetMouseVisible(false);
playSongButton:SetVisible(true);

playSongLabel = Turbine.UI.Label();
playSongLabel:SetParent(mainWindow);
playSongLabel:SetVisible(true);
playSongLabel:SetSize(140, 30);
playSongLabel:SetText("Play selected song");
playSongLabel:SetPosition(220, 50);

playSongAction = Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, "/play");
playSongQuickslot:SetShortcut(playSongAction);
playSongQuickslot:SetAllowDrop(false);


-- ====================================================================================================================== --


-- Add Song Button --
addSongButton = Turbine.UI.Lotro.Button();
addSongButton:SetText("Add Song");
addSongButton:SetParent(mainWindow);
addSongButton:SetSize(120, 30);
addSongButton:SetPosition(900, 50);
addSongButton.Click = function( sender, args)
	closeSideWindows();
	SongManager.UI.addSongWindow:SetVisibility(true);
end


-- Remove Lute Song Button --
removeLuteSongButton = Turbine.UI.Lotro.Button();
removeLuteSongButton:SetText("Remove Lute Song");
removeLuteSongButton:SetParent(mainWindow);
removeLuteSongButton:SetSize(150, 30);
removeLuteSongButton:SetPosition(80, 420);
removeLuteSongButton.Click = function( sender, args)
	closeSideWindows();
	SongManager.UI.removeLuteSongWindow:updateGroupList();
	SongManager.UI.removeLuteSongWindow:SetVisibility(true);
end


-- Remove clarinet Song Button --
removeClarinetSongButton = Turbine.UI.Lotro.Button();
removeClarinetSongButton:SetText("Remove Clarinet Song");
removeClarinetSongButton:SetParent(mainWindow);
removeClarinetSongButton:SetSize(150, 30);
removeClarinetSongButton:SetPosition(330, 420);
removeClarinetSongButton.Click = function( sender, args)
	closeSideWindows();
	SongManager.UI.removeClarinetSongWindow:updateGroupList();
	SongManager.UI.removeClarinetSongWindow:SetVisibility(true);
end


-- Remove fiddle Song Button --
removeFiddleSongButton = Turbine.UI.Lotro.Button();
removeFiddleSongButton:SetText("Remove Fiddle Song");
removeFiddleSongButton:SetParent(mainWindow);
removeFiddleSongButton:SetSize(150, 30);
removeFiddleSongButton:SetPosition(580, 420);
removeFiddleSongButton.Click = function( sender, args)
	closeSideWindows();
	SongManager.UI.removeFiddleSongWindow:updateGroupList();
	SongManager.UI.removeFiddleSongWindow:SetVisibility(true);
end


-- Remove harp Song Button --
removeHarpSongButton = Turbine.UI.Lotro.Button();
removeHarpSongButton:SetText("Remove Harp Song");
removeHarpSongButton:SetParent(mainWindow);
removeHarpSongButton:SetSize(150, 30);
removeHarpSongButton:SetPosition(830, 420);
removeHarpSongButton.Click = function( sender, args)
	closeSideWindows();
	SongManager.UI.removeHarpSongWindow:updateGroupList();
	SongManager.UI.removeHarpSongWindow:SetVisibility(true);
end


function closeSideWindows()
	SongManager.UI.addSongWindow:SetVisibility(false);
	SongManager.UI.removeLuteSongWindow:SetVisibility(false);
	SongManager.UI.removeClarinetSongWindow:SetVisibility(false);
	SongManager.UI.removeFiddleSongWindow:SetVisibility(false);
	SongManager.UI.removeHarpSongWindow:SetVisibility(false);
end