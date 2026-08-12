-- ServerScriptService → Script: AwardAlphaBadge
game.Players.PlayerAdded:Connect(function(player)
   local BadgeService = game:GetService("BadgeService")
   if not BadgeService:UserHasBadgeAsync(player.UserId, 2427725071107197) then
      BadgeService:AwardBadgeAsync(player.UserId, 2427725071107197)
   end
end)
