-- Made by ArasOfficial#8439

getgenv().Workspace = game:GetService("Workspace")
getgenv().UserInputService  = game:GetService("UserInputService")
getgenv().ReplicatedStorage = game:GetService("ReplicatedStorage")
getgenv().StarterPlayer = game:GetService("StarterPlayer")
getgenv().StarterPack = game:GetService("StarterPack")
getgenv().StarterGui = game:GetService("StarterGui")
getgenv().TeleportService = game:GetService("TeleportService")
getgenv().CoreGui = game:GetService("CoreGui")
getgenv().TweenService = game:GetService("TweenService")
getgenv().HttpService = game:GetService("HttpService")
getgenv().TextService = game:GetService("TextService")
getgenv().MarketplaceService = game:GetService("MarketplaceService")
getgenv().Chat = game:GetService("Chat")
getgenv().Teams = game:GetService("Teams")
getgenv().SoundService = game:GetService("SoundService")
getgenv().Lighting = game:GetService("Lighting")
getgenv().ScriptContext = game:GetService("ScriptContext")
getgenv().Stats = game:GetService("Stats")
getgenv().RunService = game:GetService("RunService")
getgenv().Players = game:GetService("Players")
getgenv().LocalPlayer = Players.LocalPlayer
getgenv().Mouse = LocalPlayer:GetMouse ""

getgenv().Character = function(Player)
    if not Player then
        return LocalPlayer.Character
    end

    return Player.Character
end

getgenv().Humanoid = function(Player)
    if not Player then
        return LocalPlayer.Character.Humanoid
    end

    return Player.Character.Humanoid
end

getgenv().HumanoidRootPart = function(Player)
    if not Player then
        return LocalPlayer.Character.HumanoidRootPart
    end

    return Player.Character.HumanoidRootPart
end

getgenv().IsR6 = function(Player)
    if Humanoid(Player).RigType == Enum.HumanoidRigType.R6 then
        return true
    end
end

getgenv().equiptools = function()
    for i,v in pairs(LocalPlayer.Backpack) do
        if v:IsA("Tool") then
            v.Parent = Character()
        end
    end
end

getgenv().filter = function(tbl, ret) -- By Fates.
    if (type(tbl) == 'table') then
        local new = {}
        for i, v in next, tbl do
            if (ret(i, v)) then
                new[#new + 1] = v
            end
        end
        return new
    end
end

getgenv().equiptools2 = function()
    local Tools = filter(game.GetChildren(LocalPlayer.Backpack), function(i, Child) -- By Fates.
         return game.IsA(Child, "Tool")
    end)

    for i, v in next, Tools do
        v.Parent = LocalPlayer.Character
    end
end

getgenv().activatetools = function(Number)
    for i,v in pairs(Character():GetChildren()) do
        if v:IsA("Tool") then
            for i=1, Number do
                v:Activate()
                wait()
            end
        end
    end
end
