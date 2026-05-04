-- Load Orion Library safely
local success, OrionLib = pcall(function()
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()
end)

if not success or not OrionLib then
	warn("Failed to load Orion Library")
	return
end

-- Create Window
local Window = OrionLib:MakeWindow({
	Name = "Value Control UI",
	HidePremium = false,
	SaveConfig = false
})

-- Create Tab
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Notification
OrionLib:MakeNotification({
	Name = "Loaded",
	Content = "UI loaded successfully",
	Image = "rbxassetid://4483345998",
	Time = 3
})

-- Store value
local currentValue = 5

-- Display label (acts like a fake slider display)
local Display = Tab:AddLabel("Current Value: 5")

-- Textbox input
Tab:AddTextbox({
	Name = "Enter Value (0-20)",
	Default = "5",
	TextDisappear = false,
	Callback = function(Value)
		local num = tonumber(Value)

		if num and num >= 0 and num <= 20 then
			currentValue = num
			Display:Set("Current Value: " .. num)
			warn("Value set to:", num)
		else
			warn("Enter a number between 0 and 20")
		end
	end
})

-- Increase button
Tab:AddButton({
	Name = "+1 Increase",
	Callback = function()
		if currentValue < 20 then
			currentValue = currentValue + 1
			Display:Set("Current Value: " .. currentValue)
		end
	end
})

-- Decrease button
Tab:AddButton({
	Name = "-1 Decrease",
	Callback = function()
		if currentValue > 0 then
			currentValue = currentValue - 1
			Display:Set("Current Value: " .. currentValue)
		end
	end
})

-- Check value button
Tab:AddButton({
	Name = "Check Value",
	Callback = function()
		print("Current Value:", currentValue)
	end
})

-- Initialize UI
OrionLib:Init()