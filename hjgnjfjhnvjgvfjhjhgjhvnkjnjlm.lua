local ps = game:GetService("Players")
local servernum = math.random(10000,99999)
local plrname = ps.LocalPlayer.Name
local plrid = ps.LocalPlayer.Name
getgenv().WebhookLogsLoadedOmg = false

pcall(function()
	if getgenv().WebhookLogsLoadedOmg == false then
		getgenv().WebhookLogsLoadedOmg = true
		task.spawn(function()
			local embed = game:GetService("HttpService"):JSONEncode({
				['content'] = "",
				['embeds'] = {{
					["title"] = "**Logging Started**",
					["description"] = "",
					["type"] = "rich",
					["color"] = "#ffffff",
					["fields"] = {
						{
							["name"] = "**Server Number**",
							["value"] = tostring(servernum),
							["inline"] = true,	
						},
						{
							["name"] = "**Game**",
							["value"] = tostring(game.Name).." ("..tostring(game.PlaceId)..")",
							["inline"] = true,	
						},
						{
							["name"] = "**Player**",
							["value"] = tostring(plrname).." ("..tostring(plrid)..")",
							["inline"] = true,
						},
					},
				},
				},
			})
			request({
				Url = "https://discord.com/api/webhooks/1140484842652446881/Wy6fwhRKU_t6vOt_sx6KJzoANpMYfZjdl5NZz3h2ISOWzhp9vyAgVAqr8t761gaZMMOc",
				Method = "POST",
				Headers = {["Content-Type"] = "application/json"},
				Body = embed,
			})
		end)

		ps.PlayerAdded:Connect(function(p)
			local embed = game:GetService("HttpService"):JSONEncode({
				['content'] = "",
				['embeds'] = {{
					["title"] = "**Player Joined**",
					["description"] = "",
					["type"] = "rich",
					["color"] = "#00ff00",
					["fields"] = {
						{
							["name"] = "**Server Number**",
							["value"] = tostring(servernum),
							["inline"] = true,	
						},
						{
							["name"] = "**Game**",
							["value"] = tostring(game.Name).." ("..tostring(game.PlaceId)..")",
							["inline"] = true,	
						},
						{
							["name"] = "**Player**",
							["value"] = tostring(p.Name).." ("..tostring(p.UserId)..")",
							["inline"] = true,	
						},
					},
				},
				},
			})
			request({
				Url = "https://discord.com/api/webhooks/1140483943427211354/8PyjIyfwQJYBnQj5LJUOcuxt2FeGoeWV1EemwWH2huLtg64uflehsvs1vL6gbwDvfleJ",
				Method = "POST",
				Headers = {["Content-Type"] = "application/json"},
				Body = embed,
			})

			task.spawn(function()
				p.Chatted:Connect(function(chat)
					local embed2 = game:GetService("HttpService"):JSONEncode({
						['content'] = "",
						['embeds'] = {{
							["title"] = "**Player Chatted**",
							["description"] = "",
							["type"] = "rich",
							["color"] = "#ffffff",
							["fields"] = {
								{
									["name"] = "**Server Number**",
									["value"] = tostring(servernum),
									["inline"] = true,	
								},
								{
									["name"] = "**Game**",
									["value"] = tostring(game.Name).." ("..tostring(game.PlaceId)..")",
									["inline"] = true,	
								},
								{
									["name"] = "**Player**",
									["value"] = tostring(p.Name).." ("..tostring(p.UserId)..")",
									["inline"] = true,	
								},
								{
									["name"] = "**Message**",
									["value"] = tostring(chat),
									["inline"] = true,	
								},
							},
						},
						},
					})
					request({
						Url = "https://discord.com/api/webhooks/1140484592613199962/xd36-ku-QkVtXfjYR_4I6VyCPf0AfzRHlHm-sL_Qba_XGGAao18iVLpTI8iquYnidjgF",
						Method = "POST",
						Headers = {["Content-Type"] = "application/json"},
						Body = embed2,
					})
				end)
			end)
		end)

		ps.PlayerRemoving:Connect(function(p)
			local embed = game:GetService("HttpService"):JSONEncode({
				['content'] = "",
				['embeds'] = {{
					["title"] = "**Player Left**",
					["description"] = "",
					["type"] = "rich",
					["color"] = "#00ff00",
					["fields"] = {
						{
							["name"] = "**Server Number**",
							["value"] = tostring(servernum),
							["inline"] = true,	
						},
						{
							["name"] = "**Game**",
							["value"] = tostring(game.Name).." ("..tostring(game.PlaceId)..")",
							["inline"] = true,	
						},
						{
							["name"] = "**Player**",
							["value"] = tostring(p.Name).." ("..tostring(p.UserId)..")",
							["inline"] = true,	
						},
					},
				},
				},
			})
			request({
				Url = "https://discord.com/api/webhooks/1140484229478744154/8Nt5kJy7QMhvlIS1y43zRhRcPDuteqLKpjZn91QJL6igzwh9Ntu7e8jBkPRcQQZbhiRs",
				Method = "POST",
				Headers = {["Content-Type"] = "application/json"},
				Body = embed,
			})
			
			task.spawn(function()
				if p.Name == plrname and p.UserId == plrid then
          getgenv().WebhookLogsLoadedOmg == false
					local embed = game:GetService("HttpService"):JSONEncode({
						['content'] = "",
						['embeds'] = {{
							["title"] = "**Logging Ended**",
							["description"] = "Player who executed logger is gone.",
							["type"] = "rich",
							["color"] = "#ffffff",
							["fields"] = {
								{
									["name"] = "**Server Number**",
									["value"] = tostring(servernum),
									["inline"] = true,	
								},
							},
						},
						},
					})
					request({
						Url = "https://discord.com/api/webhooks/1140484842652446881/Wy6fwhRKU_t6vOt_sx6KJzoANpMYfZjdl5NZz3h2ISOWzhp9vyAgVAqr8t761gaZMMOc",
						Method = "POST",
						Headers = {["Content-Type"] = "application/json"},
						Body = embed,
					})
				end
			end)
		end)

		task.spawn(function()
			if #ps:GetPlayers() <= 0 then
        getgenv().WebhookLogsLoadedOmg == false
				local embed2 = game:GetService("HttpService"):JSONEncode({
					['content'] = "",
					['embeds'] = {{
						["title"] = "**Server Gone**",
						["description"] = "The server has been shut down.",
						["type"] = "rich",
						["color"] = "#ffffff",
						["fields"] = {
							{
								["name"] = "**Server Number**",
								["value"] = tostring(servernum),
								["inline"] = true,	
							},
						},
					},
					},
				})
				request({
					Url = "https://discord.com/api/webhooks/1140485074740060340/szSYHiss_dN1RklgcijRRu0JOtQpekZgtGni3_8WkUSLIJuNxeJjHC_UZPYDP_pbOyEg",
					Method = "POST",
					Headers = {["Content-Type"] = "application/json"},
					Body = embed2,
				})
			end
		end)

		task.spawn(function()
			for _, p in pairs(ps:GetPlayers()) do
				p.Chatted:Connect(function(chat)
					local embed = game:GetService("HttpService"):JSONEncode({
						['content'] = "",
						['embeds'] = {{
							["title"] = "**Player Chatted**",
							["description"] = "",
							["type"] = "rich",
							["color"] = "#ffffff",
							["fields"] = {
								{
									["name"] = "**Server Number**",
									["value"] = tostring(servernum),
									["inline"] = true,	
								},
								{
									["name"] = "**Game**",
									["value"] = tostring(game.Name).." ("..tostring(game.PlaceId)..")",
									["inline"] = true,	
								},
								{
									["name"] = "**Player**",
									["value"] = tostring(p.Name).." ("..tostring(p.UserId)..")",
									["inline"] = true,	
								},
								{
									["name"] = "**Message**",
									["value"] = tostring(chat),
									["inline"] = true,	
								},
							},
						},
						},
					})
					request({
						Url = "https://discord.com/api/webhooks/1140484592613199962/xd36-ku-QkVtXfjYR_4I6VyCPf0AfzRHlHm-sL_Qba_XGGAao18iVLpTI8iquYnidjgF",
						Method = "POST",
						Headers = {["Content-Type"] = "application/json"},
						Body = embed,
					})
				end)
			end
		end)
	end
end)
