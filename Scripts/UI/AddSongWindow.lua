addSongWindow = class(Turbine.UI.Lotro.GoldWindow);

-- Constructor --
function addSongWindow:Constructor()
    Turbine.UI.Lotro.GoldWindow.Constructor(self);
	self:SetText("Add Song");
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

	-- Song Name label --
	self.songNameLabel = Turbine.UI.Label();
	self.songNameLabel:SetParent(self);
	self.songNameLabel:SetText("Song name");
	self.songNameLabel:SetSize(200, 30);
	self.songNameLabel:SetPosition(50, 50);

	-- Song Name textbox --
	self.songNameInput = Turbine.UI.TextBox();
	self.songNameInput:SetParent(self);
	self.songNameInput:SetSize(260, 20);
	self.songNameInput:SetPosition(50, 70);
	self.songNameInput:SetMultiline(false);
	self.songNameInput:SetTextAlignment(Turbine.UI.ContentAlignment.LeftCenter);
	self.songNameInput:SetFont(Turbine.UI.Lotro.Font.Verdana18);
	self.songNameInput:SetForeColor(Scripts.color["black"]);
	self.songNameInput:SetBackColor(Scripts.color["white"]);
	
	-- File Name label --
	self.fileNameLabel = Turbine.UI.Label();
	self.fileNameLabel:SetParent(self);
	self.fileNameLabel:SetText("File name");
	self.fileNameLabel:SetSize(200, 30);
	self.fileNameLabel:SetPosition(50, 110);

	-- File Name textbox --
	self.fileNameInput = Turbine.UI.TextBox();
	self.fileNameInput:SetParent(self);
	self.fileNameInput:SetSize(260, 20);
	self.fileNameInput:SetPosition(50, 130);
	self.fileNameInput:SetMultiline(false);
	self.fileNameInput:SetTextAlignment(Turbine.UI.ContentAlignment.LeftCenter);
	self.fileNameInput:SetFont(Turbine.UI.Lotro.Font.Verdana18);
	self.fileNameInput:SetForeColor(Scripts.color["black"]);
	self.fileNameInput:SetBackColor(Scripts.color["white"]);
	
	-- Instrument Name label --
	self.instrumentLabel = Turbine.UI.Label();
	self.instrumentLabel:SetParent(self);
	self.instrumentLabel:SetText("Instrument");
	self.instrumentLabel:SetSize(200, 30);
	self.instrumentLabel:SetPosition(50, 170);

	-- Instrument Name dropdown --
	self.instrumentInput = SongManager.Utility.DropDownList();
	self.instrumentInput:SetParent(self);
	self.instrumentInput:SetDropRows(4);
	self.instrumentInput:SetSize(200, 20);
	self.instrumentInput:SetPosition(50, 190);
	self.instrumentInput:SetZOrder(1001);
	self.instrumentInput:SetVisible(true);
	self.instrumentInput:SetBackColor(Turbine.UI.Color(0, 0, 0));
	self.instrumentInput:SetTextColor(Turbine.UI.Color(1, 1, 1));
	self.instrumentInput:SetCurrentBackColor(Turbine.UI.Color(0, 0, 0));
	self.instrumentInput:AddItem("Lute", "Lute");
	self.instrumentInput:AddItem("Clarinet", "Clarinet");
	self.instrumentInput:AddItem("Fiddle", "Fiddle");
	self.instrumentInput:AddItem("Harp", "Harp");

	-- Button to add Song --
	self.addSongButton = Turbine.UI.Lotro.Button();
	self.addSongButton:SetParent(self);
	self.addSongButton:SetText("Add Song");
	self.addSongButton:SetSize(120, 30);
	self.addSongButton:SetPosition(50, 240);
	self.addSongButton.Click = function( sender, args)

		-- Make sure song has a name --
		if self.songNameInput:GetText() == "" then
			feedbackLabel:SetForeColor(Scripts.color["red"]);
			feedbackLabel:SetText("Song name can not be empty");
			return;
		end

		-- Make sure song has a file name --
		if self.fileNameInput:GetText() == "" then
			feedbackLabel:SetForeColor(Scripts.color["red"]);
			feedbackLabel:SetText("File name can not be empty");
			return;
		end

		-- Make sure song doesn't already exists --
		if (self.instrumentInput:GetValue() == "Lute") then

			if Scripts.luteSongLibrary[self.songNameInput:GetText()] ~= nil then
				feedbackLabel:SetForeColor(Scripts.color["red"]);
				feedbackLabel:SetText("Song " .. self.songNameInput:GetText() .. " already exists in the library");
				return;
			end
			Scripts.luteSongLibrary[self.songNameInput:GetText()] = self.fileNameInput:GetText();

		elseif (self.instrumentInput:GetValue() == "Clarinet") then

			if Scripts.clarinetSongLibrary[self.songNameInput:GetText()] ~= nil then
				feedbackLabel:SetForeColor(Scripts.color["red"]);
				feedbackLabel:SetText("Song " .. self.songNameInput:GetText() .. " already exists in the library");
				return;
			end
			Scripts.clarinetSongLibrary[self.songNameInput:GetText()] = self.fileNameInput:GetText();

		elseif (self.instrumentInput:GetValue() == "Fiddle") then

			if Scripts.fiddleSongLibrary[self.songNameInput:GetText()] ~= nil then
				feedbackLabel:SetForeColor(Scripts.color["red"]);
				feedbackLabel:SetText("Song " .. self.songNameInput:GetText() .. " already exists in the library");
				return;
			end
			Scripts.fiddleSongLibrary[self.songNameInput:GetText()] = self.fileNameInput:GetText();

			
		elseif (self.instrumentInput:GetValue() == "Harp") then

			if Scripts.harpSongLibrary[self.songNameInput:GetText()] ~= nil then
				feedbackLabel:SetForeColor(Scripts.color["red"]);
				feedbackLabel:SetText("Song " .. self.songNameInput:GetText() .. " already exists in the library");
				return;
			end
			Scripts.harpSongLibrary[self.songNameInput:GetText()] = self.fileNameInput:GetText();
			
		end

		-- Update and save song library --
		Scripts.saveSongLibrary();

		-- Add song to song select list --
		Scripts.sortSongLibrary();

		-- Give feedback to user --
		feedbackLabel:SetForeColor(Scripts.color["green"]);
		feedbackLabel:SetText("Song " .. self.songNameInput:GetText() .. " added into the song library");

		-- Reset add song window --
		closeSideWindows();
		self.songNameInput:SetText("");
		self.fileNameInput:SetText("");
	end
end


-- Set Visibility --
function addSongWindow:SetVisibility(state)
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
SongManager.UI.addSongWindow = addSongWindow();