game.ReplicatedStorage.BlindEffect.OnClientEvent:Connect(function(tim, name)
   if not game.Lighting:FindFirstChild(name) then
      game.SoundService.AmbientReverb = Enum.ReverbType.UnderWater
      
      local blur = Instance.new("BlurEffect")
      blur.Size = 40
      blur.Parent = game.Lighting
      game.Debris:AddItem(blur, 8)
      
      local bloom = Instance.new("BloomEffect")
      bloom.Intensity = 4
      bloom.Name = name
      bloom.Size = 24
      bloom.Threshold = 0
      bloom.Parent = game.Lighting
      game.Debris:AddItem(bloom, 8)
      
      local sound = Instance.new("Sound")
      sound.SoundId = "rbxassetid://121693428376737"
      sound.Volume = 2
      sound.PlaybackSpeed = math.random(10, 13) / 10
      sound.Looped = true
      sound:Play()
      sound.Parent = workspace
      game.Debris:AddItem(sound, 8)
      
      task.delay(tim, function()
         game:GetService("TweenService"):Create(blur, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
            Size = 0
         }):Play()
         game:GetService("TweenService"):Create(sound, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
            Volume = 0
         }):Play()
         game:GetService("TweenService"):Create(bloom, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), {
            Size = 0,
            Intensity = 0,
            Threshold = 1
         }):Play()
         task.wait(1.5)
         game.SoundService.AmbientReverb = Enum.ReverbType.NoReverb
      end)
   end
end)
