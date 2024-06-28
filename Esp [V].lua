local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

local KEYBIND = Enum.KeyCode.V

local isActivated = false

UserInputService.InputBegan:Connect(function(input, gameprocessed)
	if gameprocessed then return end
	
	if input.KeyCode == KEYBIND and isActivated == false then
		isActivated = true
		for i, model in game.Workspace:GetChildren() do
			if model:FindFirstChild("Humanoid") and model.Name ~= player.Character.Name then
				local v__Highlight = Instance.new("Highlight", model)
				v__Highlight.FillTransparency = 0
			end
		end
	elseif input.KeyCode == KEYBIND and isActivated == true then
		isActivated = false
		for i, model in game.Workspace:GetChildren() do
			if model:FindFirstChild("Humanoid") and model:FindFirstChild("Highlight") then
				model.Highlight:Destroy()
			end
		end
	end
end)

game.Workspace.ChildAdded:Connect(function(child)
	if isActivated == true then
		local v__Highlight = Instance.new("Highlight", child)
		v__Highlight.FillTransparency = 0
	end
end)