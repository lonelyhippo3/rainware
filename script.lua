getgenv().key = "andrewelibryandalenlove1322"
if getgenv().key ~= "andrewelibryandalenlove1322" then return game.Players.LocalPlayer:Kick("get out") end
--a lot of bugs

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Teams = game:GetService("Teams")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local SoundService = game:GetService("SoundService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CurrentCamera = workspace.CurrentCamera
local currentMS = tick()

local r15 = {
	"Head",
	"UpperTorso",
	"LowerTorso",
	"LeftUpperArm",
	"LeftLowerArm",
	"LeftHand",
	"RightUpperArm",
	"RightLowerArm",
	"RightHand",
	"LeftUpperLeg",
	"LeftLowerLeg",
	"LeftFoot",
	"RightUpperLeg",
	"RightLowerLeg",
	"RightFoot"
}

local r6 = {
    "Head",
    "Torso",
    "Left Arm",
    "Right Arm",
    "Left Leg",
    "Right Leg"
}

repeat wait() until game:IsLoaded()

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({

    Title = 'rainware v2 | Unnamed Shooter' ,
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0
})

local Tabs = {
    Main = Window:AddTab('Legit'),
    Visuals = Window:AddTab('Visuals'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local AimbotTabbox = Tabs.Main:AddLeftTabbox()
local Aimbot = AimbotTabbox:AddTab('Aimbot')
local AimbotFOVTab = AimbotTabbox:AddTab('FOV Circle')

local ESP = Tabs.Visuals:AddLeftGroupbox('ESP')
local Viewmodel = Tabs.Visuals:AddRightGroupbox('Viewmodel')
local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = false

local function IsAlive(plr)
	if plr and plr.Character and plr.Character.FindFirstChild(plr.Character, "Humanoid") and plr.Character.Humanoid.Health > 0 then
		return true
	end

	return false
end

local function IsVisible(pos, ignoreList)
	return #CurrentCamera:GetPartsObscuringTarget({LocalPlayer.Character.Head.Position, pos}, ignoreList) == 0 and true or false
end

local function GetTeam(plr)
    if plr.Team ~= nil then
	    return Teams[plr.Team.Name]
    end
    
    if plr == LocalPlayer then
        return "Local"
    else
        return "FFA"
    end
end

local function GetLegitbotTarget()
	local target,oldval = nil,math.huge
	
	for i,v in pairs(Players:GetPlayers()) do
		if IsAlive(v) and v ~= LocalPlayer and not v.Character:FindFirstChild("ForceField") and v.Character:FindFirstChild("HumanoidRootPart") then
			if Toggles.AimbotTeamCheck.Value == false or GetTeam(v) ~= GetTeam(LocalPlayer) then
				if Toggles.AimbotVisCheck.Value == false or IsVisible(v.Character.Head.Position, {v.Character, LocalPlayer.Character, CurrentCamera}) == true then
                    local Vector, onScreen = CurrentCamera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
					local FOV = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Vector.X, Vector.Y)).magnitude
					
					if FOV < Options.AimbotFOV.Value or Options.AimbotFOV.Value == 0 then
						if math.floor((LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude) < Options.AimbotDistance.Value or Options.AimbotDistance.Value == 0 then
                            if Options.AimbotTargetPriority.Value == "FOV" then
								local Vector, onScreen = CurrentCamera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
								local FOV = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Vector.X, Vector.Y)).magnitude
									
								if onScreen and FOV < oldval then
									target = v
									oldval = FOV
								end
							elseif Options.AimbotTargetPriority.Value == "Distance" then
								local Distance = math.floor((v.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude)
								
								if Distance < oldval then
									target = v
									oldval = Distance
								end
							end
						end
					end
				end
			end
		end
	end
	
	if target ~= nil then
		return target
	end
	
	return nil
end

local function GetLegitbotHitbox(plr)
	local target,oldval = nil,math.huge
	
	for i,v in next, Options.AimbotHitbox.Value do
        targetpart = plr.Character:FindFirstChild(i)
        
        if targetpart ~= nil then
            if Options.AimbotHitPriority.Value == "FOV" then
                local Vector, onScreen = CurrentCamera:WorldToScreenPoint(targetpart.Position)
                local FOV = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Vector.X, Vector.Y)).magnitude
                
                if FOV < oldval then
                    target = targetpart
                    oldval = FOV
                end
            elseif Options.AimbotHitPriority.Value == "Distance" then
                local Distance = math.floor((targetpart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude)
                
                if Distance < oldval then
                    target = targetpart
                    oldval = Distance
                end
            end
        end
    end
	
	if target ~= nil then
		return target
	end
	
	return nil
end

local aimbotEnabled = Aimbot:AddToggle('AimbotEnabled', {
    Text = 'Enabled',
    Default = false, -- Default value (true / false)
    Tooltip = "might be a lil buggy; im working on it :3",

    Callback = function(Value)
        if Value == true then
            LegitbotLoop = RunService.RenderStepped:Connect(function()
                if IsAlive(LocalPlayer) then
                    if Options.AimbotEnabledKP:GetState() then
                        plr = GetLegitbotTarget()
                        
                        if plr ~= nil then
                            hitboxpart = GetLegitbotHitbox(plr)
                            
                            if hitboxpart ~= nil then
                                --local Vector, onScreen = CurrentCamera:WorldToScreenPoint(hitboxpart.Position)
                                --local PositionX = (Mouse.X-Vector.X)/Options.AimbotSmoothness.Value + 1
                                --local PositionY = (Mouse.Y-Vector.Y)/Options.AimbotSmoothness.Value + 1
                                local velocity = hitboxpart.Velocity
                                CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(CFrame.new(CurrentCamera.CFrame.Position, (hitboxpart.Position+ (velocity * Options.AimbotPrediction.Value))), Options.AimbotSmoothness.Value)
                            end
                        end
                    end
                end
            end)
        elseif Value == false and LegitbotLoop then
            LegitbotLoop:Disconnect()
        end
    end
})

aimbotEnabled:AddKeyPicker('AimbotEnabledKP', {

    Default = 'MB2',
    SyncToggleState = false,


    Mode = 'Hold',
    Text = 'Aimbot',
    NoUI = false,
})

Aimbot:AddToggle('AimbotVisCheck', {
    Text = 'Visibility Check',
    Default = false,
})

Aimbot:AddToggle('AimbotTeamCheck', {
    Text = 'Team Check',
    Default = false,
})

Aimbot:AddDropdown('AimbotHitbox', {
    Values = { 'Head', 'HumanoidRootPart' },
    Default = 1, 
    Multi = true,

    Text = 'Hitbox',
})

Aimbot:AddDropdown('AimbotHitPriority', {
    Values = { 'FOV', 'Distance' },
    Default = 1,
    Multi = false,

    Text = 'Hitbox Priority',
})

Aimbot:AddDropdown('AimbotTargetPriority', {
    Values = { 'FOV', 'Distance' },
    Default = 1,
    Multi = false, 

    Text = 'Target Priority',
})

Aimbot:AddSlider('AimbotFOV', {
    Text = 'Field of View',
    Default = 90,
    Min = 0,
    Max = 360,
    Suffix = "°",
    Rounding = 0,
    Compact = false,

    Callback = function(Value)
        FOVCircle.Radius = Value
    end
})

Aimbot:AddSlider('AimbotDistance', {
    Text = 'Distance',
    Default = 0,
    Min = 0,
    Max = 2048,
    Suffix = " studs",
    Rounding = 0,
    Compact = false,
})

Aimbot:AddSlider('AimbotSmoothness', {
    Text = 'Smoothness',
    Default = 1,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Compact = false,
})

Aimbot:AddSlider('AimbotPrediction', {
    Text = 'Prediction Factor',
    Default = 0,
    Min = 0,
    Max = 0.1,
    Rounding = 3,
    Compact = false,
})

local aimFOV = AimbotFOVTab:AddToggle('AimbotFOVCircle', {
    Text = 'Enabled',
    Default = false,

    Callback = function(Value)
        FOVCircle.Visible = Value
    end
})

aimFOV:AddColorPicker('AimFOVColor', {
    Default = Color3.new(1,1,1),
    Title = 'FOV Circle Color',
    Transparency = 0,

    Callback = function(Value)
        FOVCircle.Color = Value
    end
})
Options.AimFOVColor:OnChanged(function()
    FOVCircle.Transparency = 1-Options.AimFOVColor.Transparency
end)

AimbotFOVTab:AddToggle('AimFOVFilled', {
    Text = 'Filled',
    Default = false,

    Callback = function(Value)
        FOVCircle.Filled = Value
    end
})

AimbotFOVTab:AddSlider('AimFOVThickness', {
    Text = 'Thickness',
    Default = 1,
    Min = 1,
    Max = 30,
    Rounding = 0,
    Compact = false,

    Callback = function(Value)
        FOVCircle.Thickness = Value
    end
})

AimbotFOVTab:AddSlider('AimFOVNumSides', {
    Text = 'NumSides',
    Default = 1,
    Min = 1,
    Max = 20,
    Rounding = 0,
    Compact = false,

    Callback = function(Value)
        if Value >= 3 then
            FOVCircle.NumSides = Value
        else
            FOVCircle.NumSides = 100
        end
    end
})

------------------------------------ VISUALS TAB

local function chamsPlr(v)
    if IsAlive(v) and v ~= LocalPlayer and v.Character:FindFirstChild("HumanoidRootPart") then
        if Toggles.ESPShowTeam.Value == true or GetTeam(v) ~= GetTeam(LocalPlayer) then
            for i2, v2 in next, v.Character:GetChildren() do
                if v2:IsA("Accoutrement") then
                    v2:Destroy()
                end;
                if (v.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and table.find(r6, v2.Name)) or (v.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 and table.find(r15, v2.Name)) then
                    if v2:FindFirstChild("inner") or v2:FindFirstChild("outer") then
                        continue;
                    end;
                    local L_1197_;
                    local L_1198_;
                    if v2.Name == "Head" then
                        L_1197_ = Instance.new("CylinderHandleAdornment", v2)
                        L_1198_ = Instance.new("CylinderHandleAdornment", v2)
                        L_1197_.CFrame = L_1197_.CFrame * CFrame.Angles(math.rad(90), 0, 0)
                        L_1198_.CFrame = L_1198_.CFrame * CFrame.Angles(math.rad(90), 0, 0)
                        L_1197_.Radius = 0.54;
                        L_1198_.Radius = 0.62;
                        L_1197_.Height = 1.12;
                        L_1198_.Height = 1.3
                    else
                        L_1197_ = Instance.new("BoxHandleAdornment", v2)
                        L_1198_ = Instance.new("BoxHandleAdornment", v2)
                        L_1197_.Size = v2.Size + Vector3.new(0.02, 0.02, 0.02)
                        L_1198_.Size = v2.Size + Vector3.new(0.12, 0.12, 0.12)
                    end;
                    L_1197_.Name = "inner"
                    L_1198_.Name = "outer"
                    L_1197_.Adornee = v2;
                    L_1198_.Adornee = v2;
                    L_1197_.Color3 = Options.InnerChams.Value
                    L_1198_.Color3 = Options.OuterChams.Value
                    L_1197_.Transparency = Options.InnerChams.Transparency
                    L_1198_.Transparency = Options.OuterChams.Transparency
                    L_1197_.AlwaysOnTop = true;
                    L_1198_.AlwaysOnTop = false;
                    L_1197_.ZIndex = 5;
                    v.Character.HumanoidRootPart.AncestryChanged:connect(function()
                        L_1197_:Destroy()
                        L_1198_:Destroy()
                    end)
                end
            end
        end
    end
end

local espEnabled = ESP:AddToggle('ESPEnabled', {
    Text = 'Enabled',
    Default = false, 

    Callback = function(Value) -- big esp loooop
        if Value then
            if Toggles.Chams.Value then
                for i, v in next, Players:GetPlayers() do
                    if v.Character ~= nil then
                        chamsPlr(v)
                    end
                end;
            end
        elseif not Value then
            for i, v in next, Players:GetPlayers() do
                if v.Character ~= nil then
                    for i2, v2 in next, v.Character:GetDescendants() do
                        if v2.Name == "inner" or v2.Name == "outer" then
                            v2:Destroy()
                        end
                    end
                end
            end
        end
    end
})

local chams = ESP:AddToggle('Chams', {
    Text = 'Chams',
    Default = false,

    Callback = function(Value)
        if Value and Toggles.ESPEnabled.Value then
            for i, v in next, Players:GetPlayers() do
                if v.Character ~= nil then
                    chamsPlr(v)
                end
            end;
            for k, t in next, Players:GetPlayers() do
				if t.Character then
					for k2, t2 in next, t.Character:GetDescendants() do
						if t2.Name == "inner" then
							t2.Color3 = Options.InnerChams.Value;
							t2.Transparency = Options.InnerChams.Transparency;
						elseif t2.Name == "outer" then
							t2.Transparency = Options.OuterChams.Transparency;
							t2.Color3 = Options.OuterChams.Value;
							t2.AlwaysOnTop = false
						end
					end;
					if Toggles.ESPShowTeam.Value == true and GetTeam(v) == GetTeam(LocalPlayer) then
						for k2, t2 in next, t.Character:GetDescendants() do
							if t2.Name == "inner" or t2.Name == "outer" then
								t2:Destroy()
							end
						end
					end
				end
			end
        elseif not Value or not Toggles.ESPEnabled.Value then
            for i, v in next, Players:GetPlayers() do
                if v.Character ~= nil then
                    for i2, v2 in next, v.Character:GetDescendants() do
                        if v2.Name == "inner" or v2.Name == "outer" then
                            v2:Destroy()
                        end
                    end
                end
            end
        end
    end
})

chams:AddColorPicker('OuterChams', {
    Default = Color3.new(0, 1, 0),
    Title = 'Outer Chams Color', 
    Transparency = 0.5
})

chams:AddColorPicker('InnerChams', {
    Default = Color3.new(1, 0, 0),
    Title = 'Inner Chams Color',
    Transparency = 0.5
})

ESP:AddToggle('ESPShowTeam', {
    Text = 'Show Team',
    Default = false,
})

local vmEnabled = Viewmodel:AddToggle('VMEnabled', {
    Text = 'Enabled',
    Default = false, 
})

Viewmodel:AddToggle('HideVM', {
    Text = 'Hide Viewmodel',
    Default = false,

    Callback = function(Value)
        if Value and Toggles.VMEnabled.Value then --- set charadded connction later
            for i, v in workspace.ViewModel:GetDescendants() do
                if v:IsA("BasePart") then
                    v.Transparency = 1
                end
            end
        else
            for i, v in workspace.ViewModel:GetDescendants() do
                if v:IsA("BasePart") and v.Name ~= "WeaponRoot" and v.Name ~= "CamRoot" then
                    v.Transparency = 0
                end
            end
        end
    end
})

Viewmodel:AddLabel("Arm Color"):AddColorPicker('ArmColor', {
    Default = Color3.new(1, 0, 0),
    Title = 'Arm Color',
    Transparency = 0,

    Callback = function(Value)
        if Toggles.VMEnabled.Value then --- set charadded connction later
            for i, v in workspace.ViewModel:GetChildren() do
                if v.Name == "Left Arm" or v.Name == "Right Arm" then
                    v.Color = Options.ArmColor.Value
                    v.Transparency = Options.ArmColor.Transparency
                end
            end
        end
    end
})

Viewmodel:AddDropdown('ArmMaterial', {
    Values = { 'Neon', 'SmoothPlastic', 'Glass', 'Wood', 'Foil' },
    Default = 1,
    Multi = false,

    Text = 'Arm Material',

    Callback = function(Value)
        if Toggles.VMEnabled.Value then --- set charadded connction later
            for i, v in workspace.ViewModel:GetChildren() do
                if v.Name == "Left Arm" or v.Name == "Right Arm" then
                    v.Material = Value
                end
            end
        end
    end
})

Viewmodel:AddLabel("Gun Color"):AddColorPicker('GunColor', {
    Default = Color3.new(1, 0, 0), -- Bright green
    Title = 'Gun Color', -- Optional. Allows you to have a custom color picker title (when you open it)
    Transparency = 0,

    Callback = function(Value)
        if Toggles.VMEnabled.Value then --- set charadded connction later
            for i, v in workspace.ViewModel:GetChildren() do
                if v:IsA("Model") then
                    for k, t in v:GetDescendants() do
                        if t:IsA("BasePart") and t.Name ~= "WeaponRoot" then
                            t.Color = Options.GunColor.Value
                            t.Transparency = Options.GunColor.Transparency
                        end
                    end
                end
            end
        end
    end
})

Viewmodel:AddDropdown('GunMaterial', {
    Values = { 'Neon', 'SmoothPlastic', 'Glass', 'Wood', 'Foil' },
    Default = 1,
    Multi = false,

    Text = 'Gun Material',

    Callback = function(Value)
        if Toggles.VMEnabled.Value then --- set charadded connction later
            for i, v in workspace.ViewModel:GetChildren() do
                if v:IsA("Model") then
                    for k, t in v:GetDescendants() do
                        if t:IsA("BasePart") and t.Name ~= "WeaponRoot" then
                            t.Material = Value
                        end
                    end
                end
            end
        end
    end
})

for i, v in next, Players:GetPlayers() do
    v.CharacterAdded:Connect(function(char)
        if Toggles.Chams.Value then
            task.wait(0.5)
            chamsPlr(v)
        end
    end)
end;

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function(char)
        if Toggles.Chams.Value then
            task.wait(0.5)
            chamsPlr(plr)
        end
    end)
end)

for i, v in next, Teams:GetChildren() do
	v.PlayerAdded:Connect(function(plr)
        task.wait(0.5)
        for k, t in next, Players:GetPlayers() do
            if t.Character then
                for k2, t2 in next, t.Character:GetDescendants() do
                    if t2:IsA"CylinderHandleAdornment" or t2:IsA"BoxHandleAdornment" then
                        t2:Destroy()
                    end
                end
            end
        end;
        task.wait(1)
        for k, t in next, Players:GetPlayers() do
            if t.Character then
                chamsPlr(t)
            end
        end
    end)
end;

Library:SetWatermarkVisibility(true)

local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('%s | %s fps | %s ms'):format(
        game:GetService("Players").LocalPlayer.Name,
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

Library.KeybindFrame.Visible = true; -- todo: add a function for this

Library:OnUnload(function()
    WatermarkConnection:Disconnect()

    print('Unloaded!')
    Library.Unloaded = true
end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings'])

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()

Library:Notify("Finished loading" .. " in " .. string.format("%.2f", tick()-currentMS)*100 .. "ms", 3)

Mouse.Move:Connect(function()
	FOVCircle.Position = UserInputService:GetMouseLocation()
end)
