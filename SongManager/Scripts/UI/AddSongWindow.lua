addSongWindow = class(Turbine.UI.Lotro.GoldWindow);

-- Constructor --
function addSongWindow:Constructor()
    Turbine.UI.Lotro.GoldWindow.Constructor(self);
	self:SetText("Add Song");
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

	-- Song Name label --
	self.songNameLabel = Turbine.UI.Label();
	self.songNameLabel:SetParent(self);
	self.songNameLabel:SetText("Song name");
	self.songNameLabel:SetSize(200, 30);
	self.songNameLabel:SetPosition(30, 50);

	-- Song Name textbox --
	self.songNameInput = Turbine.UI.TextBox();
	self.songNameInput:SetParent(self);
	self.songNameInput:SetSize(240, 20);
	self.songNameInput:SetPosition(30, 70);
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
	self.fileNameLabel:SetPosition(30, 110);

	-- File Name textbox --
	self.fileNameInput = Turbine.UI.TextBox();
	self.fileNameInput:SetParent(self);
	self.fileNameInput:SetSize(240, 20);
	self.fileNameInput:SetPosition(30, 130);
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
	self.instrumentLabel:SetPosition(30, 170);

	-- Instrument Name textbox --
	self.instrumentInput = Turbine.UI.TextBox();
	self.instrumentInput:SetParent(self);
	self.instrumentInput:SetSize(240, 20);
	self.instrumentInput:SetPosition(30, 190);
	self.instrumentInput:SetMultiline(false);
	self.instrumentInput:SetTextAlignment(Turbine.UI.ContentAlignment.LeftCenter);
	self.instrumentInput:SetFont(Turbine.UI.Lotro.Font.Verdana18);
	self.instrumentInput:SetForeColor(Scripts.color["black"]);
	self.instrumentInput:SetBackColor(Scripts.color["white"]);

	-- Button to add Song --
	self.addPlayerButton = Turbine.UI.Lotro.Button();
	self.addPlayerButton:SetParent(self);
	self.addPlayerButton:SetText("Add Song");
	self.addPlayerButton:SetSize(120, 30);
	self.addPlayerButton:SetPosition(30, 240);
	self.addPlayerButton.Click = function( sender, args)
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
		if Scripts.songLibrary[self.songNameInput:GetText()] ~= nil then
			feedbackLabel:SetForeColor(Scripts.color["red"]);
			feedbackLabel:SetText("Song " .. self.songNameInput:GetText() .. " already exists in the library");
			return;
		end

		-- Update and save song library --
		Scripts.songLibrary[self.songNameInput:GetText()] = self.fileNameInput:GetText();
		Scripts.saveSongLibrary();

		-- Add song to song select list --
		Scripts.createSong(self.songNameInput:GetText(), self.fileNameInput:GetText());

		-- Give feedback to user --
		feedbackLabel:SetForeColor(Scripts.color["green"]);
		feedbackLabel:SetText("Song " .. self.songNameInput:GetText() .. " added into the song library");

		-- Reset add song window --
		closeSideWindows();
		self.songNameInput:SetText("");
		self.fileNameInput:SetText("");
		self.instrumentInput:SetText("");
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