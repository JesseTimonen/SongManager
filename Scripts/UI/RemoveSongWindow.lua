removeSongWindow = class(Turbine.UI.Lotro.GoldWindow);

-- Constructor --
function removeSongWindow:Constructor()
    Turbine.UI.Lotro.GoldWindow.Constructor(self);
	self:SetText("Remove Song");
	self:SetVisible(false);
	self:SetWantsKeyEvents(true);
	self:SetSize(300, 300);
	self:SetPosition(0, 0);
	self:SetZOrder(1000);
	self.KeyDown = function(sender,args)
		if (args.Action == 145) then
			self:SetVisible(false);
		end
	end

	-- Song select drop down list --
	self.songSelect = SongManager.Utility.DropDownList();
	self.songSelect:SetParent(self);
	self.songSelect:SetDropRows(6);
	self.songSelect:SetSize(200, 20);
	self.songSelect:SetPosition(50, 50);
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
		Scripts.Utility.table_removeKey(Scripts.songLibrary, self.songSelect:GetValue());
		Scripts.saveSongLibrary();

		-- Give feedback to user --
		feedbackLabel:SetForeColor(Scripts.color["white"]);
		feedbackLabel:SetText("Deleted song with name " .. self.songSelect:GetValue() .. "!");

		-- Update remove song list --
		SongManager.UI.removeSongWindow:updateGroupList();

		-- Update song select list --
		Scripts.CreateSongSelection();
	end
end



-- Update Group dropdown list --
function removeSongWindow:updateGroupList()
	self.songSelect:ClearList();

	if Scripts.songLibrary ~= {} then
		for songName, fileName in pairs(Scripts.songLibrary) do
			self.songSelect:AddItem(songName, songName);
		end
	end
end



-- Set Visibility --
function removeSongWindow:SetVisibility(state)
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
SongManager.UI.removeSongWindow = removeSongWindow();