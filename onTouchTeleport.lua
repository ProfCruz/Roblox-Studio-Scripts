--Where tem de ser parent de Teleport
local function onTouchTeleport(hit)
	if hit and hit.Parent:FindFirstChild("Humanoid") then
		hit.Parent:MoveTo(script.Parent.Where.Position)
	end
end
game.workspace.Teleport.Touched:Connect(onTouchTeleport)
