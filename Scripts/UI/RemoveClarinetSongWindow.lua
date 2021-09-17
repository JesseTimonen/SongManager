removeClarinetSongWindow = class(Turbine.UI.Lotro.GoldWindow);

-- Constructor --
function removeClarinetSongWindow:Constructor()
    Turbine.UI.Lotro.GoldWindow.Constructor(self);
	self:SetText("Remove Clarinet Song");
	self:SetVisible(false);
	self:SetWantsKeyEvents(true);
	self:SetSize(400, 300);
	self:SetPosition(0, 0);
	self:SetZOrder(1000);
	self.KeyDown = function(sender,args)
		-- Check if escape was pressed
		if (args.Action == 145) then
			self:SetVisible(false);
		end
	end

	-- Song select drop down list --
	self.songSelect = SongManager.Utility.DropDownList();
	self.songSelect:SetParent(self);
	self.songSelect:SetDropRows(6);
	self.songSelect:SetSize(200, 20);
	self.songSelect:SetPosition(100, 50);
	self.songSelect:SetZOrder(1001);
	self.songSelect:SetVisible(true);
	self.songSelect:SetBackColor(Turbine.UI.Color(0, 0, 0));
	self.songSelect:SetTextColor(Turbine.UI.Color(1, 1, 1));
	self.songSelect:SetCurrentBackColor(Turbine.UI.Color(0, 0, 0));

	-- Button to delete Song --
	self.deleteSongButton = Turbine.UI.Lotro.Button();
	self.deleteSongButton:SetParent(self);
	self.deleteSongButton:SetText("Delete Song");
	self.deleteSongButton:SetSize(120, 30);
	self.deleteSongButton:SetPosition(self:GetWidth()/2 - self.deleteSongButton:GetWidth()/2, 240);
	self.deleteSongButton.Click = function( sender, args)
		
		-- Make sure one of the songs is selected --
		if (self.songSelect:GetValue() == nil) then
			feedbackLabel:SetText("You must select a song before deleting it");
			feedbackLabel:SetForeColor(Scripts.color["red"]);
			return;
		end

		-- Update and save song library --
		Scripts.clarinetSongLibrary[self.songSelect:GetValue()] = nil;
		Scripts.saveSongLibrary();

		-- Give feedback to user --
		feedbackLabel:SetForeColor(Scripts.color["white"]);
		feedbackLabel:SetText("Deleted song with name " .. self.songSelect:GetValue() .. "!");

		-- Update remove song list --
		SongManager.UI.removeClarinetSongWindow:updateGroupList();

		-- Update song select list --
		Scripts.sortSongLibrary();
	end
end


-- Update Group dropdown list --
function removeClarinetSongWindow:updateGroupList()
	self.songSelect:ClearList();

	if Scripts.clarinetSongLibrary ~= {} then

		Scripts.sortedSongLibrary = {};
        for id in pairs(Scripts.clarinetSongLibrary) do table.insert(Scripts.sortedSongLibrary, id); end
		table.sort(Scripts.sortedSongLibrary)
		
		for i = 1, Scripts.Utility.tableLenght(Scripts.sortedSongLibrary), 1 do
			self.songSelect:AddItem(Scripts.sortedSongLibrary[i], Scripts.sortedSongLibrary[i]);
		end
	end
end


-- Set Visibility --
function removeClarinetSongWindow:SetVisibility(state)
	if (state == true) then
		if (mainWindow:GetLeft() - self:GetWidth() < 0) then
			self:SetPosition(mainWindow:GetLeft()  +  mainWindow:GetWidth(), mainWindow:GetTop());
		else
			self:SetPosition(mainWindow:GetLeft() - self:GetWidth(), mainWindow:GetTop());
		end
	end
	
	self:SetVisible(state);
end


if (not SongManager.UI) then SongManager.UI = {}; end
SongManager.UI.removeClarinetSongWindow = removeClarinetSongWindow();