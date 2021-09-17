songManagerCommand = Turbine.ShellCommand();


-- Execute command --
function songManagerCommand:Execute(command, args)
	toggleVisibility(true);
end

-- Toggle visibility of the main window --
function toggleVisibility(state)
	UI.mainWindow:SetVisible(state);
end


-- Commands --
Turbine.Shell.AddCommand("songs", songManagerCommand);