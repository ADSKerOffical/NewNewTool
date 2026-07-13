-- StarterCharacterScripts: BackpackLock 
game.Players.LocalPlayer.Character:GetPropertyChangedSignal("Tools_Stunned"):Connect(function()
   if game.Players.LocalPlayer.Character:GetAttribute("Tools_Stunned") == true then
      game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
   else
      game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
   end
end)
