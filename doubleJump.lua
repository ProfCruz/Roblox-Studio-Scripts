local UserInputService = game:GetService("UserInputService")
local character = script.Parent

local humanoid = character:WaitForChild("Humanoid")
local doubleJumpEnabled = false
--function that checks what the character is doing: Jumping or Falling, then allows or denies the jump
function CheckState(oldState, newState)
	if newState == Enum.HumanoidStateType.Jumping then
		--if it is jumping and did not do the double jump, then
		if not doubleJumpEnabled then
			wait(.2)
			if humanoid:GetState() == Enum.HumanoidStateType.Freefall then
				doubleJumpEnabled = true
			end
		end
		--else, if the player has landed, then we can do the double jump again
	elseif newState == Enum.HumanoidStateType.Landed then
		doubleJumpEnabled = false
	end
end
--function that checks if the Space bar is pressed and organizes a double jump.
function GetJump(inputObject)
	if inputObject.KeyCode == Enum.KeyCode.Space then
		if doubleJumpEnabled then
			--if the humanoid is not in the jump state, then we change its state to jump
			if humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
				humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				spawn(function()
					doubleJumpEnabled = false
				end)
			end
		end
	end
end
humanoid.StateChanged:Connect(CheckState)
UserInputService.InputBegan:Connect(GetJump)
