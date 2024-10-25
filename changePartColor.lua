-- Trocar a cor de uma parte'
-- O script deve ser colocado dentro da parte
function changeColor()
    game.Workspace.Part.BrickColor = BrickColor.new('Lime green')
end
game.Workspace.Part.Touched:Connect(changeColor)