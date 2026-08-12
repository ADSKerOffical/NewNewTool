local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Settings"
ScreenGui.ResetOnSpawn = false 
ScreenGui.DisplayOrder = -10
ScreenGui.ClipToDeviceSafeArea = false
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Size = UDim2.new(0.65, 0, 0.65, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BorderSizePixel = 4
MainFrame.BorderColor3 = Color3.new(0.4, 0.4, 0.4)
MainFrame.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ScrollingFrame.Size = UDim2.new(0.9, 0, 0.7, 0)
ScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Parent = MainFrame

local Layout = Instance.new("UIGridLayout")
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.CellSize = UDim2.new(0, 200, 0, 20)
Layout.CellPadding = UDim2.new(0, 5, 0, 5)
Layout.Parent = ScrollingFrame

Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
  ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y)
end)



local CloseButton = Instance.new("TextButton")
CloseButton.Position = UDim2.new(0.9, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
CloseButton.Text = "–"
CloseButton.Size = UDim2.new(0.1, 0, 0.1, 0)
CloseButton.Parent = MainFrame

local DropButton = Instance.new("TextButton")
DropButton.Text = "Drop tool"
DropButton.BorderColor3 = Color3.new(1, 1, 1)
DropButton.BackgroundTransparency = 0
DropButton.Parent = ScrollingFrame

local ErrorSound = Instance.new("Sound")
ErrorSound.SoundId = "rbxassetid://3779045779"
ErrorSound.Parent = workspace

DropButton.MouseButton1Click:Connect(function()
   local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
   if tool and tool:FindFirstChild("Handle") then
      tool.Parent = workspace
   else
      ErrorSound:Play()
   end
end)



local Icon = Instance.new("ImageButton")
Icon.Name = "IconToggle"
Icon.Image = "rbxassetid://9405931578"
Icon.BorderSizePixel = 0
Icon.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
Icon.Position = UDim2.new(0.9, 0, -0.1, 0)
Icon.Size = UDim2.new(0, math.floor(math.max(32, math.min(game.Players.LocalPlayer:GetMouse().ViewSizeX, game.Players.LocalPlayer:GetMouse().ViewSizeY) * 0.15)), 0, math.floor(math.max(32, math.min(game.Players.LocalPlayer:GetMouse().ViewSizeX, game.Players.LocalPlayer:GetMouse().ViewSizeY) * 0.15)))
Icon.Parent = ScreenGui

Icon.MouseButton1Click:Connect(function()
   MainFrame.Visible = not MainFrame.Visible
end)

workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
   Icon.Size = UDim2.new(0, math.floor(math.max(32, math.min(game.Players.LocalPlayer:GetMouse().ViewSizeX, game.Players.LocalPlayer:GetMouse().ViewSizeY) * 0.15)), 0, math.floor(math.max(32, math.min(game.Players.LocalPlayer:GetMouse().ViewSizeX, game.Players.LocalPlayer:GetMouse().ViewSizeY) * 0.15)))
end)

CloseButton.MouseButton1Click:Connect(function()
   MainFrame.Visible = false
end)

local Icon_Corner = Instance.new("UICorner")
Icon_Corner.CornerRadius = UDim.new(0.2, 0)
Icon_Corner.Parent = Icon
