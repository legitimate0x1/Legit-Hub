-- Made by legitimate0x1!

if not getgenv then
	return
elseif typeof(getgenv) ~= "function" then
	return
end

getgenv().LH = {}

LH.Workspace = game:GetService("Workspace")
LH.UserInputService  = game:GetService("UserInputService")
LH.ReplicatedStorage = game:GetService("ReplicatedStorage")
LH.StarterPlayer = game:GetService("StarterPlayer")
LH.StarterPack = game:GetService("StarterPack")
LH.StarterGui = game:GetService("StarterGui")
LH.TeleportService = game:GetService("TeleportService")
LH.CoreGui = game:GetService("CoreGui")
LH.TweenService = game:GetService("TweenService")
LH.HttpService = game:GetService("HttpService")
LH.TextService = game:GetService("TextService")
LH.MarketplaceService = game:GetService("MarketplaceService")
LH.Chat = game:GetService("Chat")
LH.Teams = game:GetService("Teams")
LH.SoundService = game:GetService("SoundService")
LH.Lighting = game:GetService("Lighting")
LH.ScriptContext = game:GetService("ScriptContext")
LH.Stats = game:GetService("Stats")
LH.RunService = game:GetService("RunService")
LH.Players = game:GetService("Players")
LH.LocalPlayer = LH.Players.LocalPlayer
LH.Mouse = LH.LocalPlayer:GetMouse ""
LH.Camera = LH.Workspace:FindFirstChildWhichIsA("Camera")

LH.Character = function(Player)
	if not Player then
		return LH.LocalPlayer.Character
	end

	return Player.Character
end

LH.Humanoid = function(Player)
	return LH.Character(Player).Humanoid
end

LH.HumanoidRootPart = function(Player)
	return LH.Character(Player).HumanoidRootPart
end

LH.IsR6 = function(Player)
	if LH.Humanoid(Player).RigType == Enum.HumanoidRigType.R6 then
		return true
	end
end

LH.IsFrozen = function(Player)
	for i,v in pairs(LH.Character(Player):GetChildren()) do
		if v:IsA("BasePart") and v.Anchored then
			return true
		end
	end

	return false
end

LH.IsInvincible = function(Player)
	if Player.Character:FindFirstChildOfClass("Humanoid").Health == math.huge or Player.Character:FindFirstChildOfClass("Humanoid").MaxHealth == math.huge then
		return true
	end

	return false
end

LH.HasForcefield = function(Player)
	if LH.Character(Player):FindFirstChildWhichIsA("ForceField") then
		return true
	end

	return false
end

LH.EquipTools = function()
	for i,v in pairs(LH.LocalPlayer.Backpack) do
		if v:IsA("Tool") then
			v.Parent = Character()
		end
	end
end

LH.filter = function(tbl, ret) -- By Fates.
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

LH.EquipTools2 = function() -- By Fates.
	local Tools = filter(game.GetChildren(LH.LocalPlayer.Backpack), function(i, Child)
		return game.IsA(Child, "Tool")
	end)

	for i, v in next, Tools do
		v.Parent = LH.Character()
	end
end

LH.ReplaceCharacter = function(Character) -- By Fates.
	local Char = LH.LocalPlayer.Character or LH.Character() or Character
	local Model = Instance.new("Model")
	LH.LocalPlayer.Character = Model
	LH.LocalPlayer.Character = Char
	Model:Destroy()
	return Char
end

LH.ReplaceHumanoid = function(Hum, R) -- By Fates.
	local Humanoid = Hum or LH.Humanoid()
	local NewHumanoid = Humanoid:Clone()
	if (R) then
		NewHumanoid.Name = "1"
	end
	NewHumanoid.Parent = Humanoid.Parent -- NewHumanoid.Parent = Character()
	NewHumanoid.Name = Humanoid.Name
	LH.Camera.CameraSubject = NewHumanoid
	Humanoid:Destroy()
	return NewHumanoid
end

LH.ActivateTools = function(Number)
	for i,v in pairs(LH.Character():GetChildren()) do
		if v:IsA("Tool") then
			for i=1, Number do
				v:Activate()
				wait()
			end
		end
	end
end

LH.GetServers = function(PlaceId)
	return LH.HttpService:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
end

LH.TeleportServer = function(PlaceId, JobId)
	if not PlaceId and not JobId then return end

	if not JobId then
		LH.TeleportService:Teleport(PlaceId)
	else
		LH.TeleportService:TeleportToPlaceInstance(PlaceId, JobId, LH.LocalPlayer)
	end
end

LH.Rejoin = function()
	if #LH.Players:GetPlayers() == 1 then
		LH.LocalPlayer:Kick("Rejoining...")
		LH.TeleportServer(game.PlaceId)
	else
		LH.TeleportServer(game.PlaceId, game.JobId)
	end
end

LH.Serverhop = function()
	local ServerList = {}

	for _, v in ipairs(LH.GetServers(game.PlaceId)) do
		if v.playing and type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			ServerList[#ServerList + 1] = v.id
		end
	end

	if #ServerList > 0 then
		LH.TeleportServer(game.PlaceId, ServerList[math.random(1, #ServerList)])
	end
end

LH.randomString = function(A_1, A_2) -- By IY
	local length = math.random(A_1, A_2)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end
