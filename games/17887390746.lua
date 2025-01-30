--open source

repeat wait() until game:IsLoaded()

--a lot of bugs

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local NetworkClient = game:GetService("NetworkClient")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
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

getgenv().holdE = false;

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
local L_48_ = Vector3.new(0, 0, 0)

local L_5_ = {}

local L_52_ = {}

local L_122_ = {}

fonts = {
	UI = 0,
	System = 1,
	Plex = 2,
	Monospace = 3
}

Skyboxes = {
	["Purple Nebula"] = {
		["SkyboxBk"] = "rbxassetid://159454299",
		["SkyboxDn"] = "rbxassetid://159454296",
		["SkyboxFt"] = "rbxassetid://159454293",
		["SkyboxLf"] = "rbxassetid://159454286",
		["SkyboxRt"] = "rbxassetid://159454300",
		["SkyboxUp"] = "rbxassetid://159454288"
	},
	["Night Sky"] = {
		["SkyboxBk"] = "rbxassetid://12064107",
		["SkyboxDn"] = "rbxassetid://12064152",
		["SkyboxFt"] = "rbxassetid://12064121",
		["SkyboxLf"] = "rbxassetid://12063984",
		["SkyboxRt"] = "rbxassetid://12064115",
		["SkyboxUp"] = "rbxassetid://12064131"
	},
	["Pink Daylight"] = {
		["SkyboxBk"] = "rbxassetid://271042516",
		["SkyboxDn"] = "rbxassetid://271077243",
		["SkyboxFt"] = "rbxassetid://271042556",
		["SkyboxLf"] = "rbxassetid://271042310",
		["SkyboxRt"] = "rbxassetid://271042467",
		["SkyboxUp"] = "rbxassetid://271077958"
	},
	["Morning Glow"] = {
		["SkyboxBk"] = "rbxassetid://1417494030",
		["SkyboxDn"] = "rbxassetid://1417494146",
		["SkyboxFt"] = "rbxassetid://1417494253",
		["SkyboxLf"] = "rbxassetid://1417494402",
		["SkyboxRt"] = "rbxassetid://1417494499",
		["SkyboxUp"] = "rbxassetid://1417494643"
	},
	["Setting Sun"] = {
		["SkyboxBk"] = "rbxassetid://626460377",
		["SkyboxDn"] = "rbxassetid://626460216",
		["SkyboxFt"] = "rbxassetid://626460513",
		["SkyboxLf"] = "rbxassetid://626473032",
		["SkyboxRt"] = "rbxassetid://626458639",
		["SkyboxUp"] = "rbxassetid://626460625"
	},
	["Fade Blue"] = {
		["SkyboxBk"] = "rbxassetid://153695414",
		["SkyboxDn"] = "rbxassetid://153695352",
		["SkyboxFt"] = "rbxassetid://153695452",
		["SkyboxLf"] = "rbxassetid://153695320",
		["SkyboxRt"] = "rbxassetid://153695383",
		["SkyboxUp"] = "rbxassetid://153695471"
	},
	["Elegant Morning"] = {
		["SkyboxBk"] = "rbxassetid://153767241",
		["SkyboxDn"] = "rbxassetid://153767216",
		["SkyboxFt"] = "rbxassetid://153767266",
		["SkyboxLf"] = "rbxassetid://153767200",
		["SkyboxRt"] = "rbxassetid://153767231",
		["SkyboxUp"] = "rbxassetid://153767288"
	},
	["Neptune"] = {
		["SkyboxBk"] = "rbxassetid://218955819",
		["SkyboxDn"] = "rbxassetid://218953419",
		["SkyboxFt"] = "rbxassetid://218954524",
		["SkyboxLf"] = "rbxassetid://218958493",
		["SkyboxRt"] = "rbxassetid://218957134",
		["SkyboxUp"] = "rbxassetid://218950090"
	},
	["Redshift"] = {
		["SkyboxBk"] = "rbxassetid://401664839",
		["SkyboxDn"] = "rbxassetid://401664862",
		["SkyboxFt"] = "rbxassetid://401664960",
		["SkyboxLf"] = "rbxassetid://401664881",
		["SkyboxRt"] = "rbxassetid://401664901",
		["SkyboxUp"] = "rbxassetid://401664936"
	},
	["Aesthetic Night"] = {
		["SkyboxBk"] = "rbxassetid://1045964490",
		["SkyboxDn"] = "rbxassetid://1045964368",
		["SkyboxFt"] = "rbxassetid://1045964655",
		["SkyboxLf"] = "rbxassetid://1045964655",
		["SkyboxRt"] = "rbxassetid://1045964655",
		["SkyboxUp"] = "rbxassetid://1045962969"
	}
}
local L_60_ = {
	SmoothPlastic = "",
	ForceField = "4573037993"
}
hitSounds = {
	Bameware = "rbxassetid://3124331820",
	Bell = "rbxassetid://6534947240",
	Bubble = "rbxassetid://6534947588",
	Pick = "rbxassetid://1347140027",
	Pop = "rbxassetid://198598793",
	Rust = "rbxassetid://1255040462",
	Sans = "rbxassetid://3188795283",
	Fart = "rbxassetid://130833677",
	Big = "rbxassetid://5332005053",
	Vine = "rbxassetid://5332680810",
	Bruh = "rbxassetid://4578740568",
	Skeet = "rbxassetid://5633695679",
	Neverlose = "rbxassetid://6534948092",
	Fatality = "rbxassetid://6534947869",
	Bonk = "rbxassetid://5766898159",
	Minecraft = "rbxassetid://4018616850",
}

local cachedfov = CurrentCamera.FieldOfView

local repo = 'https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua'))()
local Options = Library.Options
local Toggles = Library.Toggles

Library.ShowToggleFrameInKeybinds = false -- Make toggle keybinds work inside the keybinds UI (aka adds a toggle to the UI). Good for mobile users (Default value = true)
-- Toggles the Linoria cursor globaly (Default value = true)
-- Changes the side of the notifications globaly (Left, Right) (Default value = Left)

local Window = Library:CreateWindow({
	-- Set Center to true if you want the menu to appear in the center
	-- Set AutoShow to true if you want the menu to appear when it is created
	-- Set Resizable to true if you want to have in-game resizable Window
	-- Set ShowCustomCursor to false if you don't want to use the Linoria cursor
	-- NotifySide = Changes the side of the notifications (Left, Right) (Default value = Left)
	-- Position and Size are also valid options here
	-- but you do not need to define them unless you are changing them :)

	Title = 'rainware v2 | Unnamed Shooter' ,
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    ShowCustomCursor = false,
    NotifySide = "Left",
    MenuFadeTime = 0
})

local Tabs = {
    Main = Window:AddTab('Legit'),
    Rage = Window:AddTab('Rage'),
    Visuals = Window:AddTab('Visuals'),
    Misc = Window:AddTab('Misc'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local AimbotTabbox = Tabs.Main:AddLeftTabbox()
local Aimbot = AimbotTabbox:AddTab('Aimbot')
local AimbotFOVTab = AimbotTabbox:AddTab('FOV Circle')
local RiflesTabbox = Tabs.Main:AddRightTabbox()
local RiflesTab = RiflesTabbox:AddTab('Rifles')

local ESP = Tabs.Visuals:AddLeftGroupbox('ESP')
local Viewmodel = Tabs.Visuals:AddRightGroupbox('Local')
local MiscESP = Tabs.Visuals:AddLeftGroupbox('Misc')
local WorldESP = Tabs.Visuals:AddRightGroupbox('World')
local ViewmodelESP = Tabs.Visuals:AddLeftGroupbox('Viewmodel')
local FOVCircle = Drawing.new("Circle")
FOVCircle.Radius = 90
FOVCircle.Thickness = 1
FOVCircle.Filled = false
FOVCircle.Visible = false

local AntiAim = Tabs.Rage:AddLeftGroupbox("Anti-Aim")

local MiscMain = Tabs.Misc:AddLeftGroupbox('Main')
local MiscPlrs = Tabs.Misc:AddRightGroupbox('Players')
local Movement = Tabs.Misc:AddLeftGroupbox('Movement')
local MiscOther = Tabs.Misc:AddRightGroupbox('Other')

local function IsAlive(plr)
	if plr and plr.Character and plr.Character.FindFirstChild(plr.Character, "Humanoid") and plr.Character.Humanoid.Health > 0 then
		return true
	end

	return false
end

local function IsVisible(pos, ignoreList)
    if LocalPlayer.Character.Head then
	    return #CurrentCamera:GetPartsObscuringTarget({LocalPlayer.Character.Head.Position, pos}, ignoreList) == 0 and true or false
    end
end

local function GetTeam(plr)
    if plr and plr.Team ~= nil then
	    return Teams[plr.Team.Name]
    end
    
    if plr and plr == LocalPlayer then
        return "Local"
    elseif plr ~= LocalPlayer then
        return "FFA"
    end
end

local targett = nil;
local function GetLegitbotTarget()
	local target,oldval = nil,math.huge
	
	for i,v in pairs(Players:GetPlayers()) do
		if IsAlive(v) and IsAlive(LocalPlayer) and v ~= LocalPlayer and v.Character:FindFirstChild("HumanoidRootPart") and not L_52_[v.Name].aimWL then
			if Toggles.AimbotTeamCheck.Value == false or GetTeam(v) ~= GetTeam(LocalPlayer) then
				if Toggles.AimbotVisCheck.Value == false or IsVisible(v.Character.Head.Position, {v.Character, LocalPlayer.Character, CurrentCamera, workspace.Debris}) == true then
                    if Toggles.ForcefieldCheck.Value == false or not v.Character:FindFirstChild("ForceField") then
                        local Vector, onScreen = CurrentCamera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                        local FOV = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Vector.X, Vector.Y)).magnitude

                        if FOV < Options.AimbotFOV.Value or Options.AimbotFOV.Value == 0 then
                            if math.floor((LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude) < Options.AimbotDistance.Value or Options.AimbotDistance.Value == 0 then
                                if Options.AimbotTargetPriority.Value == "FOV" then
                                    local Vector, onScreen = CurrentCamera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                                    local FOV = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Vector.X, Vector.Y)).magnitude
                                        
                                    if onScreen and FOV < oldval and L_52_[v.Name].aimPL then
                                        oldval = FOV
                                        return v
                                    end

                                    if onScreen and FOV < oldval then
                                        target = v
                                        oldval = FOV
                                    end
                                elseif Options.AimbotTargetPriority.Value == "Distance" then
                                    local Distance = math.floor((v.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude)
                                    
                                    if onScreen and Distance < oldval and L_52_[v.Name].aimPL then
                                        oldval = FOV
                                        return v
                                    end

                                    if Distance < oldval then
                                        target = v
                                        oldval = FOV
                                    end
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
    Default = false,
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
                                targett = plr
                                local velocity = hitboxpart.Velocity
                                CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(CFrame.new(CurrentCamera.CFrame.Position, (hitboxpart.Position+ (velocity * Options.AimbotPrediction.Value))), Options.AimbotSmoothness.Value)
                            end
                        end
                    end
                end
            end)
        elseif Value == false and LegitbotLoop then
            LegitbotLoop:Disconnect()
            targett = nil
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

Aimbot:AddToggle('ForcefieldCheck', {
    Text = 'Forcefield Check',
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

    Callback = function(Value)
        FOVCircle.Color = Value
    end
})

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


local triggerDelay = 0.1
RiflesTab:AddToggle('TriggerbotEnabled', {
    Text = 'Triggerbot',
    Default = false,

    Callback = function(Value)
        if Value then
            trigLoop = RunService.RenderStepped:Connect(function()
                if Mouse.Target and Mouse.Target.Parent:FindFirstChildOfClass("Humanoid") and IsAlive(Players:GetPlayerFromCharacter(Mouse.Target.Parent)) and GetTeam(Players:GetPlayerFromCharacter(Mouse.Target.Parent)) ~= GetTeam(LocalPlayer) then     
                    task.wait(triggerDelay)
                    mouse1press()
                    repeat
                        RunService.RenderStepped:Wait()
                    until not IsAlive(Players:GetPlayerFromCharacter(Mouse.Target.Parent))
                    mouse1release()
                end
            end)
        else
            if trigLoop then
                trigLoop:Disconnect()
            end
        end
    end
        
})

RiflesTab:AddSlider('TrigDelay', {
    Text = 'Triggerbot Delay',
    Default = 100,
    Min = 0,
    Max = 1000,
    Suffix = "ms",
    Rounding = 0,
    Compact = false,

    Callback = function(Value)
        triggerDelay = Value/1000
    end
})

RiflesTab:AddSlider('Deadzone', {
    Text = 'Deadzone',
    Default = 0,
    Min = 0,
    Max = 20,
    Rounding = 0,
    Compact = false,
})


------------------------------------ RAGE TAB
local defaultC0 = LocalPlayer.Character:WaitForChild("Torso"):WaitForChild("Neck").C0
function updatePitch()
    if IsAlive(LocalPlayer) and Toggles.AAEnabled.Value then
        if Options.AAPitch.Value == "Up" then
            LocalPlayer.Character.Torso.Neck.C0 = CFrame.new(0,LocalPlayer.Character.Torso.Neck.C0.Y,0) * CFrame.Angles(math.rad(180),0,0) * CFrame.Angles(0,math.rad(180), 0)
        elseif Options.AAPitch.Value == "Down" then
            LocalPlayer.Character.Torso.Neck.C0 = CFrame.new(0,LocalPlayer.Character.Torso.Neck.C0.Y,0) * CFrame.Angles(math.rad(0),0,0) * CFrame.Angles(0,math.rad(180), 0)
        else
            LocalPlayer.Character.Torso.Neck.C0 = defaultC0
        end
    end
end;
local L_73_ = 0;
local L_74_ = false;
local hipheight = LocalPlayer.Character.Humanoid.HipHeight
function setYaw(L_1122_arg0, L_1123_arg1)
	if L_74_ then
		return
	end;
	L_1122_arg0 = holdE and 0 or L_1122_arg0;
	if Options.AAPitch.Value ~= "None" then
		updatePitch()
	end;
	if Options.AARoll.Value ~= "None" then
		local L_1124_ = 180;
        
		LocalPlayer.Character.Humanoid.HipHeight = 2;
        LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
		LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
		LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
		LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)

        if Options.AARoll.Value == "Sideways" then
            L_1124_ = 90
            LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(LocalPlayer.Character.PrimaryPart.Position) * CFrame.Angles(math.rad(L_1124_), math.rad(180), 0))
        elseif Options.AARoll.Value == "Upside Down" then
            L_1124_ = 180
            LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(LocalPlayer.Character.PrimaryPart.Position) * CFrame.Angles(math.rad(L_1124_), 1, 0))
        end
        return
	end;
	LocalPlayer.Character.Humanoid.HipHeight = hipheight;
	LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
	LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
	LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(workspace.CurrentCamera.CFrame.lookVector.X, 0, workspace.CurrentCamera.CFrame.lookVector.Z)) * CFrame.Angles(0, math.rad(L_1122_arg0), 0)
end;

local L_109_, L_110_, L_111_ = false, false, true;
AntiAim:AddToggle('AAEnabled', {
    Text = 'Enabled',
    Default = false,
})

AntiAim:AddDropdown('AAPitch', {
    Values = { 'None', 'Down', 'Up' },
    Default = 1, 
    Multi = false,

    Text = 'Pitch',

    Callback = updatePitch
})

AntiAim:AddDropdown('AAYaw', {
    Values = { 'None', 'Manual', 'Backwards', 'Spin', 'Random', 'Jitter' },
    Default = 1, 
    Multi = false,

    Text = 'Yaw',

    Callback = updatePitch
})

AntiAim:AddDropdown('AARoll', {
    Values = { 'None', 'Sideways', 'Upside Down' },
    Default = 1, 
    Multi = false,

    Text = 'Roll',
})

AntiAim:AddSlider('ManualYawOffset', {
    Text = 'ManualYawOffset',
    Default = 0,
    Min = -89,
    Max = 89,
    Rounding = 0,
    Compact = false,
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

local L_56_ = {}
function countESP()
	local L_1147_ = 0;
	for L_1148_forvar0, L_1149_forvar1 in next, L_56_ do
		if L_1149_forvar1.type == "plr" then
			L_1147_ = L_1147_ + 1
		end
	end;
	return L_1147_
end;
local L_76_ = 0;
function createEsp(L_1150_arg0, L_1151_arg1)
	local L_1152_ = Drawing.new("Text")
	local L_1153_ = Drawing.new("Text")
	local L_1154_ = Drawing.new("Line")
	local L_1155_ = Drawing.new("Square")
	local L_1156_ = Drawing.new("Square")
	local L_1157_ = Drawing.new("Square")
	local L_1158_ = Drawing.new("Square")
	local L_1159_ = "Object" .. tostring(L_76_)
	local L_1160_;
	if L_1150_arg0 == "plr" then
		L_1160_ = Instance.new("Folder", L_46_)
		L_1159_ = L_1151_arg1.Name;
		L_1160_.Name = L_1159_;
		L_1157_.Color = Color3.new(0, 0, 0)
        L_1157_.Filled = true
        L_1157_.ZIndex = 0;
		L_1157_.Thickness = 2;
		L_1157_.Transparency = 1;
		L_1157_.Visible = false;
		L_1158_.Color = Color3.new(0, 1, 0)
        L_1158_.Filled = true
        L_1158_.ZIndex = 1;
		L_1158_.Thickness = 1;
		L_1158_.Transparency = 1;
		L_1158_.Visible = false
	else
		L_76_ = L_76_ + 1
	end;
	L_1155_.Color = Color3.new(0, 0, 0)
	L_1155_.Thickness = 2;
	L_1155_.Transparency = 1;
	L_1155_.Filled = false;
    L_1155_.ZIndex = 0
	L_1155_.Visible = false;
	L_1156_.Color = Color3.new(1, 1, 1)
	L_1156_.Thickness = 1;
	L_1156_.Transparency = 1;
	L_1156_.Filled = false;
    L_1156_.ZIndex = 1;
	L_1156_.Visible = false;
	L_1154_.From = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y * 1)
	L_1154_.Color = Color3.new(1, 1, 1)
	L_1154_.Thickness = 1;
	L_1154_.Transparency = 1;
	L_1154_.Visible = false;
	L_1152_.Text = L_1151_arg1.Name;
	L_1152_.Size = 13;
	L_1152_.Center = true;
	L_1152_.OutlineColor = Color3.new(0, 0, 0)
	L_1152_.Color = Color3.new(1, 1, 1)
	L_1152_.Visible = false;
	L_1153_.Text = "Gun"
	L_1153_.Size = 13;
	L_1153_.Center = true;
	L_1153_.OutlineColor = Color3.new(0, 0, 0)
	L_1153_.Color = Color3.new(1, 1, 1)
	L_1153_.Visible = false;
	function invis()
		L_1156_.Visible = false;
		L_1154_.Visible = false;
		L_1152_.Visible = false;
		L_1158_.Visible = false;
		L_1155_.Visible = false;
		L_1157_.Visible = false;
		L_1153_.Visible = false
	end;
	function remove()
		L_1156_:Remove()
		L_1153_:Remove()
		L_1154_:Remove()
		L_1152_:Remove()
		L_1158_:Remove()
		L_1155_:Remove()
		L_1157_:Remove()
	end;
	local L_1161_ = {
		text = L_1152_,
		weapon = L_1153_,
		tracer = L_1154_,
		box = L_1156_,
		healthb = L_1158_,
		boxoutline = L_1155_,
		healthbo = L_1157_,
		invis = invis,
		remove = remove,
		type = L_1150_arg0,
		object = L_1151_arg1
	}
	L_56_[L_1159_] = L_1161_;
	return L_1161_
end;

local espEnabled = ESP:AddToggle('ESPEnabled', {
    Text = 'Enabled',
    Default = false, 

    Callback = function(Value)
        if Value then
            
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
})

chams:AddColorPicker('OuterChams', {
    Default = Color3.new(0, 1, 0),
    Title = 'OuterChams Color', 
    Transparency = 0.5,
})

chams:AddColorPicker('InnerChams', {
    Default = Color3.new(1, 0, 0),
    Title = 'Inner Chams Color',
    Transparency = 0.5,
})

local box = ESP:AddToggle('BoxESP', {
    Text = 'Box ESP',
    Default = false,
})
box:AddColorPicker('BoxColor', {
    Default = Color3.new(1,1,1),
    Title = 'Box Color', 
})

local name = ESP:AddToggle('NameESP', {
    Text = 'Name ESP',
    Default = false,
})
name:AddColorPicker('NameColor', {
    Default = Color3.new(1,1,1),
    Title = 'Text Color', 
})

local wep = ESP:AddToggle('WeaponESP', {
    Text = 'Weapon ESP',
    Default = false,
})
wep:AddColorPicker('WeaponColor', {
    Default = Color3.new(1,1,1),
    Title = 'Text Color', 
})

local bar = ESP:AddToggle('HealthBar', {
    Text = 'Health Bar',
    Default = false,
})
bar:AddColorPicker('BarColor', {
    Default = Color3.new(0,1,0),
    Title = 'Bar Color', 
})

local trace = ESP:AddToggle('Tracers', {
    Text = 'Tracers',
    Default = false,
})
trace:AddColorPicker('TracerColor', {
    Default = Color3.new(1,1,1),
    Title = 'Tracer Color', 
})

ESP:AddToggle('Outline', {
    Text = 'Outline',
    Default = false,
})

ESP:AddToggle('ESPShowTeam', {
    Text = 'Show Team',
    Default = false,
})

ESP:AddToggle('ESPDistanceCheck', {
    Text = 'Distance Check',
    Default = false,
})

ESP:AddSlider('ESPDistance', {
    Text = 'Distance',
    Default = 200,
    Min = 0,
    Max = 2048,
    Rounding = 0,
    Compact = false,
})

ESP:AddDropdown('Font', {
    Values = { 'UI', 'System', 'Plex', 'Monospace' },
    Default = 1, 
    Multi = false,

    Text = 'Font',
})

ESP:AddDropdown('TextMode', {
    Values = { 'Normal', 'Upper', 'Lower' },
    Default = 1, 
    Multi = false,

    Text = 'Text Mode',
})

function hasProperty(L_230_arg0, L_231_arg1)
    return pcall(function()
        _ = L_230_arg0[L_231_arg1]
    end)
end;

function selfChams()
	if Toggles.SelfChams.Value and LocalPlayer.Character then
		for L_1380_forvar0, L_1381_forvar1 in next, LocalPlayer.Character:GetDescendants() do
			local L_1382_ = Options.SfChamsMaterial.Value
			if L_1381_forvar1.Name == "HumanoidRootPart" or L_1381_forvar1.Name == "Head" or L_1381_forvar1.Name == "CamRoot" or L_1381_forvar1.Name == "WeaponRoot" or L_1381_forvar1.Name == "WeaponRootR" or L_1381_forvar1.Name == "WeaponRootL" then
				continue;
			end;
			if (L_1381_forvar1:IsA"Accoutrement") and Toggles.RemoveHats.Value then
				L_1381_forvar1:Destroy()
			end;
			if L_1381_forvar1:IsA"BasePart" and L_1381_forvar1.Name ~= "CamRoot" and L_1381_forvar1.Name ~= "WeaponRoot" and L_1381_forvar1.Name ~= "WeaponRootR" and L_1381_forvar1.Name ~= "WeaponRootL" then
				L_1381_forvar1.Color = Options.SfChamsColor.Value
				L_1381_forvar1.Transparency = Options.SfChamsColor.Transparency;
				L_1381_forvar1.Material = L_1382_
			end;
			if L_1381_forvar1:IsA"SpecialMesh" then
				local L_1383_ = Options.SfChamsColor.Value
				L_1381_forvar1.VertexColor = Vector3.new(L_1383_.R, L_1383_.G, L_1383_.B)
			end;
			if L_1381_forvar1.Name == "Shirt" then
				L_1381_forvar1.ShirtTemplate = "rbxassetid://0"
			elseif L_1381_forvar1.Name == "Pants" then
				L_1381_forvar1.PantsTemplate = "rbxassetid://0"
			elseif L_1381_forvar1.Name == "Face" then
				L_1381_forvar1.Texture = "rbxassetid://0"
			end;
			if hasProperty(L_1381_forvar1, "TextureID") then
				L_1381_forvar1.TextureID = L_60_[L_1382_]
			end;
			if hasProperty(L_1381_forvar1, "TextureId") then
				L_1381_forvar1.TextureId = L_60_[L_1382_]
			end
		end
	end
end;

local cachedL = LocalPlayer.Character["Left Arm"].Color
local cachedR = LocalPlayer.Character["Right Arm"].Color

-- bugyg sometimes and makes it so cant run script (and fix some other stuff)
function updateViewModelVisuals()
	local L_989_;
    local L_989_2;
	if workspace.ViewModel:FindFirstChild("Left Arm") and workspace.ViewModel:FindFirstChild("Right Arm") then
		L_989_ = workspace.ViewModel["Left Arm"]
        L_989_2 = workspace.ViewModel["Right Arm"]
	end;
	if L_989_ and L_989_2 and workspace.ViewModel:FindFirstChildOfClass("Model") then
		for L_990_forvar0, L_991_forvar1 in next, workspace.ViewModel:FindFirstChildOfClass("Model"):GetDescendants() do
            if Toggles.HideVM.Value then
                if L_991_forvar1:IsA"BasePart" and L_991_forvar1.Name ~= "WeaponRoot" and L_991_forvar1.Name ~= "WeaponRootR" and L_991_forvar1.Name ~= "WeaponRootL" then
                    L_989_.Transparency = 1
                    L_989_2.Transparency = 1
                    L_991_forvar1.Transparency = 1
                end
            else
                if L_991_forvar1:IsA"BasePart" and L_991_forvar1.Name ~= "WeaponRoot" and L_991_forvar1.Name ~= "WeaponRootR" and L_991_forvar1.Name ~= "WeaponRootL" then
                    L_989_.Transparency = 0
                    L_989_2.Transparency = 0
                    L_991_forvar1.Transparency = 0
                end
            end
			if Toggles.WeaponChams.Value then
				if L_991_forvar1:IsA"BasePart" and L_991_forvar1.Name ~= "WeaponRoot" and L_991_forvar1.Name ~= "WeaponRootR" and L_991_forvar1.Name ~= "WeaponRootL" then
					L_991_forvar1.Color = Options.WepChamsColor.Value
					L_991_forvar1.Transparency = Options.WepChamsColor.Transparency
					L_991_forvar1.Material = Options.WepMaterial.Value
					if hasProperty(L_991_forvar1, "TextureID") then
						L_991_forvar1.TextureID = ""
					end;
					if hasProperty(L_991_forvar1, "Reflectance") then
						L_991_forvar1.Reflectance = Options.WeaponReflectance.Value
					end;
					if L_991_forvar1:FindFirstChild("SurfaceAppearance") then
						L_991_forvar1.SurfaceAppearance:Destroy()
					end
				end;
			end
		end
        if Toggles.ArmChams.Value then
            if hasProperty(L_989_, "CastShadow") then
                L_989_.CastShadow = false
            end;
            if hasProperty(L_989_2, "CastShadow") then
                L_989_2.CastShadow = false
            end;
            local L_997_ = Options.ArmMaterial.Value
            if L_989_:IsA"SpecialMesh" then
                if L_997_ == "ForceField" then
                    L_989_.TextureId = L_60_[L_997_]
                else
                    L_989_.TextureId = ""
                end;
                local L_998_ = Options.ArmChamsColor.Value
                L_989_.VertexColor = Vector3.new(L_998_.R, L_998_.G, L_998_.B)
            end;
            if L_989_:IsA"Part" then
                L_989_.Material = L_997_;
                L_989_.Color = Options.ArmChamsColor.Value
                L_989_.Transparency = Options.ArmChamsColor.Transparency
            end
            local L_997_ = Options.ArmMaterial.Value
            if L_989_2:IsA"SpecialMesh" then
                if L_997_ == "ForceField" then
                    L_989_2.TextureId = L_60_[L_997_]
                else
                    L_989_2.TextureId = ""
                end;
                local L_998_ = Options.ArmChamsColor.Value
                L_989_2.VertexColor = Vector3.new(L_998_.R, L_998_.G, L_998_.B)
            end;
            if L_989_2:IsA"Part" then
                L_989_2.Material = L_997_;
                L_989_2.Color = Options.ArmChamsColor.Value
                L_989_2.Transparency = Options.ArmChamsColor.Transparency
            end
        end
	end
end;

local L_78_ = false;
function updateSkybox()
	if Lighting:FindFirstChild("SunRays") then
		Lighting.SunRays.Enabled = false
	end;
	local L_1181_ = Options.Skybox.Value
	if Toggles.SkyboxChanger.Value and Skyboxes[L_1181_] then
		local L_1182_ = Instance.new("Sky", Lighting)
		L_1182_.Name = "customsky"
		L_1182_.SunTextureId = "rbxassetid://"
		L_1182_.CelestialBodiesShown = "rbxassetid://"
		L_78_ = true;
		for L_1183_forvar0, L_1184_forvar1 in next, Skyboxes[L_1181_] do
			L_1182_[L_1183_forvar0] = L_1184_forvar1
		end
	elseif not Toggles.SkyboxChanger.Value and L_78_ then
		if Lighting:FindFirstChild("customsky") then
			Lighting.customsky:Destroy()
		end;
		local L_1185_ = game:GetService("Lighting"):FindFirstChildOfClass("Sky")
		if L_1185_ then
			L_78_ = false;
			L_1185_.Parent = workspace;
			task.wait()
			L_1185_.Parent = Lighting
		end
	end
end;

function CreateThread(L_1125_arg0)
	local L_1126_ = coroutine.create(L_1125_arg0)
	coroutine.resume(L_1126_)
	return L_1126_
end;

local L_79_ = {
	"HumanoidRootPart",
	"WeaponRoot",
	"CamRoot",
}
local L_80_ = false;
function hitChams(L_1186_arg0, L_1187_arg1, L_1188_arg2, L_1189_arg3)
	if L_1186_arg0.Character and not L_80_ then
		L_80_ = true;
		CreateThread(function()
			task.wait(0.05)
			L_80_ = false
		end)
		for L_1190_forvar0, L_1191_forvar1 in next, L_1186_arg0.Character:GetChildren() do
			if L_1191_forvar1:IsA"BasePart" and L_1191_forvar1.Transparency ~= 1 or L_1191_forvar1.Name == "Head" then
				if not L_79_[L_1191_forvar1.Name] then
					local L_1192_ = L_1191_forvar1:Clone()
					L_1192_:ClearAllChildren()
					L_1192_.Material = L_1187_arg1 and "SmoothPlastic" or "ForceField"
					L_1192_.CFrame = L_1191_forvar1.CFrame;
					L_1192_.Size = L_1191_forvar1.Name == "Head" and Vector3.new(1.18, 1.18, 1.18) or L_1192_.Size;
					L_1192_.CanCollide = false;
					L_1192_.Color = L_1187_arg1 or Options.FLChamsColor.Value
					L_1192_.Anchored = true;
					L_1192_.Transparency = L_1188_arg2 or 0;
					L_1192_.Parent = workspace.Debris;
					if hasProperty(L_1192_, "TextureID") then
						L_1192_.TextureID = ""
					end;
					if hasProperty(L_1192_, "UsePartColor") then
						L_1192_.UsePartColor = true
					end;
					Debris:AddItem(L_1192_, L_1189_arg3 or 1.5)
					if not L_1187_arg1 then
						local L_1193_ = TweenService:Create(L_1192_, TweenInfo.new(1.5), {
							Transparency = 1
						})
						L_1193_:Play()
					end
				end
			end
		end
	end
end;
getgenv().hitChams = hitChams;

Viewmodel:AddToggle('ForceCH', {
    Text = 'Force Crosshair',
    Default = false,
})

Viewmodel:AddToggle('RemoveUI', {
    Text = 'Remove UI Elements',
    Default = false,
})

Viewmodel:AddToggle('HideVM', {
    Text = 'Hide Viewmodel',
    Default = false,
    Callback = updateViewModelVisuals,
})

Viewmodel:AddToggle('RemoveHats', {
    Text = 'Remove Hats',
    Default = false,
    Callback = selfChams,
})

local sfchams = Viewmodel:AddToggle('SelfChams', {
    Text = 'Self Chams',
    Default = false,
    Callback = selfChams,
})
sfchams:AddColorPicker('SfChamsColor', {
    Default = Color3.new(1,1,1),
    Title = 'Chams Color', 
    Transparency = 0,
    Callback = selfChams,
})
Viewmodel:AddDropdown('SfChamsMaterial', {
    Values = { 'ForceField', 'SmoothPlastic' },
    Default = 1, 
    Multi = false,

    Text = "Self Chams Material",

    Callback = selfChams,
})

local wepchams = Viewmodel:AddToggle('WeaponChams', {
    Text = 'Weapon Chams',
    Default = false,
    Callback = updateViewModelVisuals,
})
wepchams:AddColorPicker('WepChamsColor', {
    Default = Color3.new(1,1,1),
    Title = 'Chams Color', 
    Transparency = 0,
    Callback = updateViewModelVisuals,
})
Viewmodel:AddDropdown('WepMaterial', {
    Values = { 'ForceField', 'SmoothPlastic' },
    Default = 1, 
    Multi = false,

    Text = "Weapon Chams Material",
    Callback = updateViewModelVisuals,
})

local armchams = Viewmodel:AddToggle('ArmChams', {
    Text = 'Arm Chams',
    Default = false,
    Callback = updateViewModelVisuals,
})
armchams:AddColorPicker('ArmChamsColor', {
    Default = Color3.new(1,1,1),
    Title = 'Chams Color', 
    Transparency = 0,
    Callback = updateViewModelVisuals,
})
Viewmodel:AddDropdown('ArmMaterial', {
    Values = { 'ForceField', 'SmoothPlastic' },
    Default = 1, 
    Multi = false,

    Text = "Arm Chams Material",
    Callback = updateViewModelVisuals,
})

local flChams = Viewmodel:AddToggle('FakeLagChams', {
    Text = 'Fake Lag Chams',
    Default = false,
})
flChams:AddColorPicker('FLChamsColor', {
    Default = Color3.new(1, 0.4, 0.7),
    Title = 'Chams Color', 
    Transparency = 0.5,
})

Viewmodel:AddSlider('WeaponReflectance', {
    Text = 'Weapon Reflectance',
    Default = 0,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Compact = false,
    Callback = updateViewModelVisuals,
})

Viewmodel:AddToggle('FOVChangerEnabled', {
    Text = 'FOV Changer',
    Default = false,
})

Viewmodel:AddSlider('FOVChanger', {
    Text = 'Field of View',
    Default = 90,
    Min = 30,
    Max = 120,
    Rounding = 0,
    Compact = false,
})

MiscESP:AddToggle('RemoveScope', {
    Text = 'Remove Scope',
    Default = false,
})

local mChams = MiscESP:AddToggle('MineChams', {
    Text = 'Mine Chams',
    Default = false,
})

mChams:AddColorPicker('mChamsColor', {
    Default = Color3.new(1,1,1),
    Title = 'Chams Color', 
    Transparency = 0.5,
})

local L_120_ = CurrentCamera.ViewportSize.Y - 50;
local L_121_ = L_120_;
local vGraph = MiscESP:AddToggle('VelocityGraph', {
    Text = 'Velocity Graph',
    Default = false,

    Callback = function(Value)
        while Toggles.VelocityGraph.Value do
            wait()
            local L_1448_ = 0;
            L_120_ = CurrentCamera.ViewportSize.Y - 50;
            if IsAlive(LocalPlayer) and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				L_1448_ = math.floor(math.clamp((LocalPlayer.Character.HumanoidRootPart.Velocity * Vector3.new(1, 0, 1)).magnitude * 14.85, 0, 400))
			end;
            if Toggles.VelocityGraph.Value then
                local L_1449_ = Drawing.new("Line")
                table.insert(L_122_, L_1449_)
                L_1449_.From = Vector2.new(CurrentCamera.ViewportSize.X / 2 + 110 - 2, L_121_)
                L_1449_.To = Vector2.new(CurrentCamera.ViewportSize.X / 2 + 110, L_120_ - L_1448_ / 6.5)
                L_1449_.Thickness = 1;
                L_1449_.Transparency = 1;
                L_1449_.Color = Options.VGraphColor.Value
                L_1449_.Visible = true;
                if # L_122_ > 1 then
                    if # L_122_ > 110 then
                        L_122_[1]:Remove()
                        table.remove(L_122_, 1)
                        for L_1451_forvar0 = 2, 8 do
                            L_122_[L_1451_forvar0].Transparency = L_1451_forvar0 / 10
                        end;
                        local L_1450_ = 0;
                        for L_1452_forvar0 = 110, 104, -1 do
                            L_1450_ = L_1450_ + 1;
                            L_122_[L_1452_forvar0].Transparency = L_1450_ / 10
                        end;
                        L_122_[103].Transparency = 1
                    end;
                    for L_1453_forvar0, L_1454_forvar1 in ipairs(L_122_) do
                        L_1454_forvar1.To = L_1454_forvar1.To - Vector2.new(2, 0)
                        L_1454_forvar1.From = L_1454_forvar1.From - Vector2.new(2, 0)
                    end
                end;
                L_121_ = L_1449_.To.Y
            else
                for L_1455_forvar0, L_1456_forvar1 in ipairs(L_122_) do
                    L_1456_forvar1:Remove()
                    table.remove(L_122_, L_1455_forvar0)
                end
            end
        end
    end
})

vGraph:AddColorPicker('VGraphColor', {
    Default = Color3.fromRGB(255, 255, 255),
    Title = 'Graph Color', 
})

local thirdp = MiscESP:AddToggle('ThirdPerson', {
    Text = 'Third Person',
    Default = false,

    Callback = function(Value)
        if Value then
            LocalPlayer.CameraMode = "Classic"
            RunService:BindToRenderStep("thirdperson", 1, function()
				LocalPlayer.CameraMaxZoomDistance = Options.TPDistance.Value
				LocalPlayer.CameraMinZoomDistance = Options.TPDistance.Value
			end)
        else
			RunService:UnbindFromRenderStep("thirdperson")
            LocalPlayer.CameraMode = "LockFirstPerson"
        end
    end
})


thirdp:AddKeyPicker('TPEnabledKP', {

    Default = 'X',
    SyncToggleState = true,


    Mode = 'Toggle',
    Text = 'Third Person',
    NoUI = false,
})

MiscESP:AddSlider('TPDistance', {
    Text = 'Third Person Distance',
    Default = 10,
    Min = 5,
    Max = 15,
    Rounding = 1,
    Compact = false,
})

WorldESP:AddToggle('Compatibility', {
    Text = 'Compatibility Mode',
    Default = false,

    Callback = function(Value)
        sethiddenproperty(Lighting, "Technology", Value and Enum.Technology.Compatibility or Enum.Technology.Future)
    end
})

WorldESP:AddToggle('Saturation', {
    Text = 'Saturation',
    Default = false,
})

WorldESP:AddSlider('SaturationVal', {
    Text = 'Saturation Amount',
    Default = 0,
    Min = -2,
    Max = 2,
    Rounding = 1,
    Compact = false,
})

local gradient = WorldESP:AddToggle('Gradient', {
    Text = 'Gradient',
    Default = false,
})

gradient:AddColorPicker('GradientColor', {
    Default = Color3.fromRGB(255, 255, 255),
    Title = 'Gradient Color', 
})

gradient:AddColorPicker('OutGradientColor', {
    Default = Color3.fromRGB(255, 255, 255),
    Title = 'Outdoors Gradient Color', 
})

WorldESP:AddSlider('TimeofDay', {
    Text = 'Time of Day',
    Default = 14.5,
    Min = 0,
    Max = 24,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        Lighting.ClockTime = Value
    end
})

local asuswalls = WorldESP:AddToggle('AsusWalls', {
    Text = 'Asus Walls',
    Default = false,
    Callback = function(Value)
        if Toggles.AsusWalls.Value then
			for L_1385_forvar0, L_1386_forvar1 in pairs(workspace:WaitForChild("Map"):GetDescendants()) do
				if L_1386_forvar1:IsA"BasePart" and L_1386_forvar1.Transparency ~= 1 then
					L_1386_forvar1.Transparency = Options.AsusTransparency.Value / 100
				end;
				if L_1385_forvar0 % 75 == 75 then
					wait()
				end
			end
		else
			for L_1387_forvar0, L_1388_forvar1 in pairs(workspace:WaitForChild("Map"):GetDescendants()) do
				if L_1388_forvar1:IsA"BasePart" and L_1388_forvar1.Transparency ~= 1 then
					L_1388_forvar1.Transparency = 0
				end;
				if L_1387_forvar0 % 75 == 75 then
					wait()
				end
			end
		end
    end
})

WorldESP:AddSlider('AsusTransparency', {
    Text = 'Asus Walls Transparency',
    Default = 0,
    Min = 0,
    Max = 99,
    Rounding = 0,
    Compact = false,
    Callback = asuswalls.Callback
})

WorldESP:AddToggle('SkyboxChanger', {
    Text = 'Skybox Changer',
    Default = false,
    Callback = updateSkybox
})

WorldESP:AddDropdown('Skybox', {
    Values = { 'Purple Nebula', 'Night Sky', 'Pink Daylight', 'Morning Glow', 'Setting Sun', 'Fade Blue', 'Elegant Morning', 'Neptune', 'Redshift', "Aesthetic Night" },
    Default = 1, 
    Multi = false,
    Callback = updateSkybox
})

ViewmodelESP:AddToggle('ViewmodelEnabled', {
    Text = 'Enabled',
    Default = false,
})

ViewmodelESP:AddToggle('VisualizeSA', {
    Text = 'Visualize Silent Angles',
    Default = false,
})

ViewmodelESP:AddSlider('ViewmodelX', {
    Text = 'X',
    Default = 180,
    Min = 0,
    Max = 360,
    Suffix = "°",
    Rounding = 0,
    Compact = false,
})

ViewmodelESP:AddSlider('ViewmodelY', {
    Text = 'Y',
    Default = 180,
    Min = 0,
    Max = 360,
    Suffix = "°",
    Rounding = 0,
    Compact = false,
})

ViewmodelESP:AddSlider('ViewmodelZ', {
    Text = 'Z',
    Default = 180,
    Min = 0,
    Max = 360,
    Suffix = "°",
    Rounding = 0,
    Compact = false,
})

ViewmodelESP:AddSlider('ViewmodelRoll', {
    Text = 'Roll',
    Default = 180,
    Min = 0,
    Max = 360,
    Suffix = "°",
    Rounding = 0,
    Compact = false,
})

workspace.ViewModel.ChildAdded:Connect(function()
    task.wait(0.1)
    selfChams()
    updateViewModelVisuals()
end)

L_5_.round = function(L_713_arg0, L_714_arg1)
    L_714_arg1 = L_714_arg1 or 1;
    local L_715_;
    if typeof(L_713_arg0) == "Vector2" then
        L_715_ = Vector2.new(L_5_.round(L_713_arg0.X), L_5_.round(L_713_arg0.Y))
    elseif typeof(L_713_arg0) == "Color3" then
        return L_5_.round(L_713_arg0.r * 255), L_5_.round(L_713_arg0.g * 255), L_5_.round(L_713_arg0.b * 255)
    else
        L_715_ = math.floor(L_713_arg0 / L_714_arg1 + math.sign(L_713_arg0) * 0.5) * L_714_arg1;
        if L_715_ < 0 then
            L_715_ = L_715_ + L_714_arg1
        end;
        return L_715_
    end;
    return L_715_
end;
local L_1426_ = nil;
-- fix distance check thingy?? and some visual bugs with esp
invissed = false
RunService.RenderStepped:Connect(function(L_1691_arg0)
	if #Players:GetPlayers() ~= countESP() then
		for L_1692_forvar0, L_1693_forvar1 in next, Players:GetPlayers() do
			if not L_56_[L_1693_forvar1.Name] and L_1693_forvar1.Name ~= LocalPlayer.Name then
				createEsp("plr", L_1693_forvar1)
			end
		end
	end;

	if Toggles.ESPEnabled.Value then
        if Toggles.Chams.Value then
            for i, v in next, Players:GetPlayers() do
                if v.Character ~= nil then
                    if Toggles.ESPShowTeam.Value == true or GetTeam(v) ~= GetTeam(LocalPlayer) then
                        chamsPlr(v)
                    elseif Toggles.ESPShowTeam.Value == false and GetTeam(v) == GetTeam(LocalPlayer) then
                        for k2, t2 in next, v.Character:GetDescendants() do
                            if t2.Name == "inner" or t2.Name == "outer" then
                                t2:Destroy()
                            end
                        end
                    end
                end
            end;
            for k, t in next, Players:GetPlayers() do
				if t.Character then
					for k2, t2 in next, t.Character:GetDescendants() do
						if t2.Name == "inner" then
							t2.Color3 = (L_52_[t.Name] and L_52_[t.Name].TargetESP == true and Options.TargetInnerChams.Value) or Options.InnerChams.Value;
							t2.Transparency = (L_52_[t.Name] and L_52_[t.Name].TargetESP == true and Options.TargetInnerChams.Transparency) or Options.InnerChams.Transparency;
						elseif t2.Name == "outer" then
							t2.Transparency = (L_52_[t.Name] and L_52_[t.Name].TargetESP == true and Options.TargetOuterChams.Transparency) or Options.OuterChams.Transparency;
							t2.Color3 = (L_52_[t.Name] and L_52_[t.Name].TargetESP == true and Options.TargetOuterChams.Value) or Options.OuterChams.Value;
							t2.AlwaysOnTop = false
						end
					end;
				end
			end
        else
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
		invissed = false;
		for L_1694_forvar0, L_1695_forvar1 in next, L_56_ do
			local L_1696_ = L_1695_forvar1.type == "plr"
			if L_1696_ and not Players:FindFirstChild(L_1694_forvar0) or not L_1696_ and L_1695_forvar1.object == nil then
				L_1695_forvar1.invis()
				L_1695_forvar1.remove()
				L_56_[L_1694_forvar0] = nil;
				continue;
			end;
			if L_1696_ and (Toggles.ESPShowTeam.Value == true or GetTeam(Players[L_1694_forvar0]) ~= GetTeam(LocalPlayer)) and Players[L_1694_forvar0].Character and Players[L_1694_forvar0].Character:FindFirstChild("Humanoid") and Players[L_1694_forvar0].Character:FindFirstChild("HumanoidRootPart") and IsAlive(Players[L_1694_forvar0]) and LocalPlayer.Character:FindFirstChild("Head") and Players[L_1694_forvar0].Character:FindFirstChild("Head") or not L_1696_ and L_1695_forvar1.object then
                if not IsAlive(LocalPlayer) then
                    L_1695_forvar1.invis()
                    continue;
                end;
                local L_1697_;
				local L_1698_ = L_48_;
				local L_1699_ = L_48_;
				if L_1696_ then
					L_1697_ = Players[L_1694_forvar0]
					local L_1712_ = L_1697_.Character.HumanoidRootPart.Position;
					L_1698_ = Vector3.new(L_1712_.x, L_1712_.y + 2.45, L_1712_.z)
					L_1699_ = Vector3.new(L_1712_.x, L_1712_.y - 3.1, L_1712_.z)
				elseif L_1695_forvar1.type == "weapon" and L_1695_forvar1.object and L_1695_forvar1.object then
					L_1698_ = L_1695_forvar1.object.Position;
					L_1699_ = L_1695_forvar1.object.Position
				end;
				local L_1701_, L_1702_ = CurrentCamera:WorldToViewportPoint(L_1698_)
				local L_1703_, L_1704_ = CurrentCamera:WorldToViewportPoint(L_1699_)
				if not L_1702_ or not L_1704_ then
					L_1695_forvar1.invis()
					continue;
				end;
				local L_1705_ = (L_1703_.y - L_1701_.y) / 2;
				local L_1706_ = true;
				--[[if library_flags["Visible Only ESP"] and LocalPlayer.Character or not L_1696_ and L_1695_forvar1.object then
					L_1706_ = false;
					local L_1713_ = L_1696_ and L_1697_.Character.Head.Position or L_1695_forvar1.object.Position;
					local L_1714_ = Ray.new(CurrentCamera.CFrame.p, (L_1713_ - CurrentCamera.CFrame.p).unit * 500)
					local L_1715_, L_1716_ = workspace:FindPartOnRayWithIgnoreList(L_1714_, {
						CurrentCamera,
						LocalPlayer.Character,
					})
					if L_1696_ and L_1697_.Character then
						L_1706_ = L_1715_:IsDescendantOf(L_1697_.Character)
					elseif L_1715_ then
						L_1706_ = L_1715_ == L_1695_forvar1.object
					end
				end;]]
				if IsAlive(LocalPlayer) and L_1697_ and Toggles.ESPDistanceCheck.Value == true then
					if (L_1697_.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > Options.ESPDistance.Value then
						L_1706_ = false
					end
				end;
				if not L_1706_ then
					L_1695_forvar1.invis()
					continue;
				end;
				local L_1707_ = Options.Font.Value
				local L_1708_ = ""
				if L_1696_ then
					if L_1697_.Character:FindFirstChild("Equipped") then
						L_1708_ = tostring(L_1697_.Character:FindFirstChild("Equipped").Value)
					end;
					local L_1717_ = Toggles.BoxESP.Value
					local L_1718_ = Toggles.HealthBar.Value
					L_1695_forvar1.text.Visible = Toggles.NameESP.Value
					L_1695_forvar1.weapon.Text = L_1708_;
					L_1695_forvar1.weapon.Visible = Toggles.WeaponESP.Value
					L_1695_forvar1.tracer.Visible = Toggles.Tracers.Value
					L_1695_forvar1.boxoutline.Visible = L_1717_ and Toggles.Outline.Value and true or false;
					L_1695_forvar1.box.Visible = L_1717_;
					L_1695_forvar1.healthb.Visible = L_1718_;
					L_1695_forvar1.healthbo.Visible = L_1718_;
					L_1695_forvar1.tracer.To = L_5_.round(Vector2.new(L_1703_.X, L_1703_.Y))
					if L_1718_ then
						L_1695_forvar1.healthb.Position = L_5_.round(Vector2.new(L_1701_.X - L_1705_ / 2 - 4, L_1703_.Y - 1))
						L_1695_forvar1.healthb.Size = L_5_.round(Vector2.new(2, -L_1697_.Character.Humanoid.Health / math.clamp(L_1697_.Character.Humanoid.MaxHealth, 0, 100) * (L_1703_.Y - L_1701_.Y) + 2))
						L_1695_forvar1.healthbo.Position = L_5_.round(Vector2.new((L_1701_.X - L_1705_ / 2) - 4, L_1703_.Y - 1))
						L_1695_forvar1.healthbo.Size = L_5_.round(Vector2.new(2, -(L_1703_.Y - L_1701_.Y) + 2))
					end;
					if L_1717_ then
						L_1695_forvar1.boxoutline.Size = L_5_.round(Vector2.new(L_1705_, L_1703_.y - L_1701_.Y))
						L_1695_forvar1.boxoutline.Position = L_5_.round(Vector2.new(L_1701_.X - L_1705_ / 2, L_1701_.Y))
						L_1695_forvar1.box.Position = L_5_.round(Vector2.new(L_1701_.X - L_1705_ / 2, L_1701_.Y))
						L_1695_forvar1.box.Size = L_5_.round(Vector2.new(L_1705_, L_1703_.y - L_1701_.Y))
					end;
                    if L_52_[L_1697_.Name] and L_52_[L_1697_.Name].TargetESP then
						L_1695_forvar1.box.Color = Options.TargetBox.Value
                        L_1695_forvar1.text.Color = Options.TargetName.Value
                        L_1695_forvar1.weapon.Color = Options.TargetWeapon.Value
                        L_1695_forvar1.tracer.Color = Options.TargetTracer.Value
                        L_1695_forvar1.healthb.Color = Options.TargetHB.Value
					else
                        L_1695_forvar1.box.Color = Options.BoxColor.Value
                        L_1695_forvar1.text.Color = Options.NameColor.Value
                        L_1695_forvar1.weapon.Color = Options.WeaponColor.Value
                        L_1695_forvar1.tracer.Color = Options.TracerColor.Value
                        L_1695_forvar1.healthb.Color = Options.BarColor.Value
                    end
				end;
				local L_1709_ = L_1696_ and L_1694_forvar0 or L_1695_forvar1.object.Name;
				local L_1710_ = Toggles.Outline.Value
				L_1695_forvar1.text.Position = Vector2.new(L_1701_.X, L_1701_.Y - 15)
				L_1695_forvar1.text.Font = fonts[L_1707_]
				L_1695_forvar1.text.Outline = L_1710_;
				L_1695_forvar1.weapon.Position = L_5_.round(Vector2.new(L_1701_.X, L_1703_.Y + 3))
				L_1695_forvar1.weapon.Outline = L_1710_;
				L_1695_forvar1.weapon.Font = fonts[L_1707_]
				local L_1711_ = Options.TextMode.Value
				if L_1711_ == "Upper" then
					L_1695_forvar1.text.Text = string.upper(L_1709_)
					L_1695_forvar1.weapon.Text = string.upper(L_1708_)
				end;
				if L_1711_ == "Lower" then
					L_1695_forvar1.text.Text = string.lower(L_1709_)
					L_1695_forvar1.weapon.Text = string.lower(L_1708_)
				end;
				if L_1711_ == "Normal" then
					L_1695_forvar1.text.Text = L_1709_
				end
			else
				L_1695_forvar1.invis()
			end
		end
	else
		if not invissed then
			invissed = true;
			for L_1719_forvar0, L_1720_forvar1 in next, L_56_ do
				L_1720_forvar1.invis()
			end
		end
        if not Toggles.Chams.Value then
            for i, v in next, Players:GetPlayers() do
                if v.Character ~= nil and (L_52_[v.Name] and not L_52_[v.Name].TargetESP == true) then
                    for i2, v2 in next, v.Character:GetDescendants() do
                        if v2.Name == "inner" or v2.Name == "outer" then
                            v2:Destroy()
                        end
                    end
                end
            end
        end
	end;

    for i, v in next, Players:GetPlayers() do
        if v.Character ~= nil and L_52_[v.Name] and L_52_[v.Name].TargetESP == true then
            chamsPlr(Players:FindFirstChild(v.Name))
        end
    end


    if not Toggles.VelocityGraph.Value then
        for L_1459_forvar0, L_1460_forvar1 in ipairs(L_122_) do
            L_1460_forvar1:Remove()
            table.remove(L_122_, L_1459_forvar0)
        end
    end

    if Toggles.ForceCH.Value then
        if LocalPlayer.PlayerGui ~= nil and LocalPlayer.PlayerGui:FindFirstChild("Main") then
            LocalPlayer.PlayerGui.Main.Crosshair.Visible = true
        end
    end

    if not Toggles.ThirdPerson.Value and Toggles.FOVChangerEnabled.Value then
        CurrentCamera.FieldOfView = Options.FOVChanger.Value
    else
        CurrentCamera.FieldOfView = cachedfov
    end

    if Toggles.Gradient.Value then
		Lighting.Ambient = Options.GradientColor.Value
		Lighting.OutdoorAmbient = Options.OutGradientColor.Value
	else
        Lighting.Ambient = Color3.new(1,1,1)
		Lighting.OutdoorAmbient = Color3.new(1,1,1)
    end

    if Toggles.ViewmodelEnabled.Value and workspace.ViewModel ~= nil and workspace.ViewModel.PrimaryPart ~= nil then
        local a = workspace.ViewModel:GetPrimaryPartCFrame() * CFrame.new(Vector3.new(math.rad(Options.ViewmodelX.Value-180),math.rad(Options.ViewmodelY.Value-180),math.rad(Options.ViewmodelZ.Value-180))) * CFrame.Angles(0, 0, math.rad(Options.ViewmodelRoll.Value-180))
        if Toggles.VisualizeSA.Value and targett ~= nil and targett.Character ~= nil and targett.Character.PrimaryPart ~= nil then
            workspace.ViewModel:SetPrimaryPartCFrame(CFrame.new(a.p,targett.Character.PrimaryPart.CFrame.p))
        elseif not Toggles.VisualizeSA.Value or targett == nil then
            workspace.ViewModel:SetPrimaryPartCFrame(a)
        end
    end

    Lighting.Correction.Saturation = Toggles.Saturation.Value and Options.SaturationVal.Value or 0;

    if Toggles.AAEnabled.Value and LocalPlayer.Character and LocalPlayer.Character.PrimaryPart and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local L_141_, L_142_ = 0, 90;
		L_141_ = L_141_ + 15;
		L_142_ = L_142_ == 90 and -90 or 90;
		LocalPlayer.Character.Humanoid.AutoRotate = false;
		local L_1746_ = true;
		if Options.AAPitch.Value == "Down" or Options.AAPitch.Value == "None" then
			L_1746_ = false
		end;
		if Options.AAYaw.Value == "None" then
			setYaw(L_1746_ and 180 or 0)
		elseif Options.AAYaw.Value == "Backwards" then
			setYaw(L_1746_ and 0 or 180)
		elseif Options.AAYaw.Value == "Manual" then
			local L_1747_ = nil;
			if L_111_ then
				setYaw(L_1746_ and 0 or 180)
			end;
			if Options.AAPitch.Value == "Down" or Options.AAPitch.Value == "None" then
				if L_109_ then
					L_1747_ = -90 + Options.ManualYawOffset.Value
				elseif L_110_ then
					L_1747_ = 90 - Options.ManualYawOffset.Value
				elseif L_111_ then
					L_1747_ = 180
				end
			else
				if L_109_ then
					L_1747_ = 90 + Options.ManualYawOffset.Value
				elseif L_110_ then
					L_1747_ = -90 - Options.AAYaw.Value
				elseif L_111_ then
					L_1747_ = 0
				end
			end;
			setYaw(L_1747_, L_1747_ + 180)
		elseif Options.AAYaw.Value == "Spin" then
			setYaw(L_141_, L_141_ + 180)
		elseif Options.AAYaw.Value == "Random" then
			local L_1750_ = math.random(0, 360)
			setYaw(L_1750_, L_1750_ + 180)
		elseif Options.AAYaw.Value == "Jitter" then
			setYaw(L_142_, - L_142_)
		end
	else
		if IsAlive(LocalPlayer) then
			LocalPlayer.Character.Humanoid.AutoRotate = true;
			LocalPlayer.Character.Humanoid.HipHeight = hipheight
		end
	end;
end)

------------------------------------ MISC TAB

fakeLagDebounce = false
MiscMain:AddToggle('FakeLag', {
    Text = 'Fake Lag',
    Default = false,

    Callback = function()
        NetworkClient:SetOutgoingKBPSLimit(0)
		while Toggles.FakeLag.Value do
            task.wait(Options.FakeLagInterval.Value)
            fakeLagDebounce = not fakeLagDebounce;
            NetworkClient:SetOutgoingKBPSLimit(fakeLagDebounce and 1 or 0)
            if not fakeLagDebounce and Toggles.ThirdPerson.Value and Toggles.FakeLagChams.Value then
                hitChams(LocalPlayer, Options.FLChamsColor.Value, Options.FLChamsColor.Transparency, Options.FakeLagInterval.Value * 2)
            end
		end;
		NetworkClient:SetOutgoingKBPSLimit(0)
    end
})

MiscMain:AddSlider('FakeLagInterval', {
    Text = 'Lag Interval',
    Default = 0.25,
    Min = 0.05,
    Max = 1,
    Rounding = 2,
    Compact = false,
})

MiscMain:AddToggle('Hitsounds', {
    Text = 'Hitsounds',
    Default = false,
    Callback = function()
        if Toggles.Hitsounds.Value and hitSounds[Options.HitsoundsSound.Value] then
            ReplicatedStorage.Audio.Game.HitMarker.SoundId = hitSounds[Options.HitsoundsSound.Value]
        end
    end
})

MiscMain:AddDropdown('HitsoundsSound', {
    Values = {
		"Bameware",
		"Bubble",
		"Pick",
		"Pop",
		"Rust",
		"Sans",
		"Fart",
		"Big",
		"Vine",
		"Bruh",
		"Skeet",
		"Neverlose",
		"Fatality",
		"Bonk",
		"Minecraft"
	},
    Default = 1, 
    Multi = false,
    Callback = function()
        if Toggles.Hitsounds.Value and hitSounds[Options.HitsoundsSound.Value] then
            ReplicatedStorage.Audio.Game.HitMarker.SoundId = hitSounds[Options.HitsoundsSound.Value]
        end
    end
})

MiscMain:AddSlider('HitsoundVol', {
    Text = 'Hitsound Volume',
    Default = 0.75,
    Min = 0.01,
    Max = 2,
    Rounding = 2,
    Compact = false,

    Callback = function(Value)
        if Toggles.Hitsounds.Value and hitSounds[Options.HitsoundsSound.Value] then
            ReplicatedStorage.Audio.Game.HitMarker.Volume = Value
        end
    end
})

changing = false;
AgeT = nil;
TeamT = nil;
MiscPlrs:AddDropdown('PlayersDropdown', {
	SpecialType = 'Player',
	ExcludeLocalPlayer = true, -- true / false, excludes the localplayer from the Player type
	Text = 'Player',

	Callback = function(Value)
		changing = true;
        if L_52_[tostring(Value)] and Players[tostring(Value)] then
            L_1426_ = tostring(Value)
			local L_1426_2 = Players[tostring(Value)]

			TeamT:SetText("Team: " .. tostring(L_1426_2.Team))
			AgeT:SetText("Account Age: " .. tostring(L_1426_2.AccountAge))
			Toggles.TargetESP:SetValue(L_52_[tostring(Value)].TargetESP)
			Toggles.AimbotWhitelist:SetValue(L_52_[tostring(Value)].aimWL)
            Toggles.AimbotPriority:SetValue(L_52_[tostring(Value)].aimPL)
		end;
		changing = false
	end
})
MiscPlrs:AddToggle('TargetESP', {
    Text = 'Target ESP',
    Default = false,
    Callback = function(Value)
        if not changing and L_52_[L_1426_] then
			L_52_[L_1426_].TargetESP = Value;
		end
    end
})
MiscPlrs:AddToggle('AimbotWhitelist', {
    Text = 'Aimbot Whitelist',
    Default = false,
    Callback = function(Value)
        if not changing and L_52_[L_1426_] then
			L_52_[L_1426_].aimWL = Value;
		end
    end
})
MiscPlrs:AddToggle('AimbotPriority', {
    Text = 'Aimbot Priority',
    Default = false,
    Callback = function(Value)
        if not changing and L_52_[L_1426_] then
			L_52_[L_1426_].aimPL = Value;
		end
    end
})
MiscPlrs:AddLabel('Target Box Color'):AddColorPicker('TargetBox', { Default = Color3.new(0.8, 0.8, 0), });
MiscPlrs:AddLabel('Target Name Color'):AddColorPicker('TargetName', { Default = Color3.new(0.8, 0.8, 0.2), });
MiscPlrs:AddLabel('Target Weapon Color'):AddColorPicker('TargetWeapon', { Default = Color3.new(0.8, 0.8, 0.2), });
MiscPlrs:AddLabel('Target Tracer Color'):AddColorPicker('TargetTracer', { Default = Color3.new(0.8, 0.8, 0.2), });
MiscPlrs:AddLabel('Target Health Bar Color'):AddColorPicker('TargetHB', { Default = Color3.new(0.8, 0.8, 0.1), });
local aLabel = MiscPlrs:AddLabel('Target Chams Color')
aLabel:AddColorPicker('TargetOuterChams', {
    Default = Color3.new(0.65, 0.65, 0.65),
    Title = 'Outer Chams Color', 
    Transparency = 0.5,
})

aLabel:AddColorPicker('TargetInnerChams', {
    Default = Color3.new(1, 1, 1),
    Title = 'Inner Chams Color',
    Transparency = 0.5,
})

TeamT = MiscPlrs:AddLabel("Team:")
AgeT = MiscPlrs:AddLabel("Account Age:")
task.spawn(function()
	while wait() do
        for L_1440_forvar0, L_1441_forvar1 in next, L_52_ do
			if L_52_[L_1441_forvar1] and not Players:FindFirstChild(L_1441_forvar1) then
				L_52_[L_1441_forvar1] = nil
			end
		end;
		for L_1442_forvar0, L_1443_forvar1 in next, Players:GetPlayers() do
			if not L_52_[L_1443_forvar1.Name] and L_1443_forvar1.Name ~= LocalPlayer.Name then
				L_52_[L_1443_forvar1.Name] = {
					name = L_1443_forvar1.Name,
					TargetESP = false,
					aimWL = false,
					aimPL = false,
				}
			end
		end;
	end
end)

MiscMain:AddToggle('MedkitSniper', {
    Text = 'Medkit Sniper',
    Default = false,
})

workspace.Debris.ChildAdded:Connect(function(c)
    if Toggles.MedkitSniper.Value == true then
        if c.Name == "Medkit" then
            local pp = LocalPlayer.Character
            if pp:FindFirstChildOfClass("Humanoid").Health < 90 then
                local curr = pp:GetPrimaryPartCFrame()
                pp:SetPrimaryPartCFrame(c.CFrame)
                task.wait(Options.MedkitSniperDelay.Value)
                pp:SetPrimaryPartCFrame(curr)
            end
        end
    end

    if Toggles.MineChams.Value == true then
        if c.Name == "ShockMine" or c.Name == "Mine" then
            local box = Instance.new("BoxHandleAdornment", c)
            repeat wait() until c:FindFirstChild("Hitbox")
            if c:FindFirstChild("SafeHighlight") or GetTeam(c:FindFirstChild("Creator").Value) == GetTeam(LocalPlayer) then return end
            box.Size = c.Hitbox.Size
            box.AlwaysOnTop = true
            box.Adornee = c.Hitbox
            box.Color3 = Options.mChamsColor.Value
            box.Transparency = Options.mChamsColor.Transparency
            box.ZIndex = 1;
        end
    end
end)

MiscMain:AddSlider('MedkitSniperDelay', {
    Text = 'Snipe Delay',
    Default = 0.15,
    Min = 0.01,
    Max = 1,
    Rounding = 2,
    Compact = false,
})

local fly = Movement:AddToggle('Fly', {
    Text = 'Fly',
    Default = false,

    Callback = function(val)
        if val == true then
            FlyLoop = RunService.Stepped:Connect(function()
                if IsAlive(LocalPlayer) then
                    spawn(function()
                        pcall(function()
                            local speed = Options.FlySpeed.Value   
                            local velocity = Vector3.new(0, 1, 0)
                            
                            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                                velocity = velocity + (CurrentCamera.CoordinateFrame.lookVector * speed)
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                                velocity = velocity + (CurrentCamera.CoordinateFrame.rightVector * -speed)
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                                velocity = velocity + (CurrentCamera.CoordinateFrame.lookVector * -speed)
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                                velocity = velocity + (CurrentCamera.CoordinateFrame.rightVector * speed)
                            end
                            
                            LocalPlayer.Character.HumanoidRootPart.Velocity = velocity
                        end)
                    end)
                end
            end)
        elseif val == false and FlyLoop then
            pcall(function()
                FlyLoop:Disconnect()
                LocalPlayer.Character.Humanoid.PlatformStand = false
            end)
        end
    end
})

fly:AddKeyPicker('FlyKB', {

    Default = 'LeftControl',
    SyncToggleState = true,


    Mode = 'Toggle',
    Text = 'Fly',
    NoUI = false,
})

Movement:AddSlider('FlySpeed', {
    Text = 'Fly Speed',
    Default = 50,
    Min = 16,
    Max = 200,
    Rounding = 0,
    Compact = false,
})

Movement:AddToggle('AutoStrafe', {
    Text = 'Auto Strafe',
    Default = false,
})

last = Vector3.new(0,0,0)
Movement:AddToggle('MaintainVelocity', {
    Text = 'MaintainVelocity',
    Default = false,
})

Movement:AddToggle('BunnyHop', {
    Text = 'Bunny Hop',
    Default = false,
})

Movement:AddSlider('BHOPSpeed', {
    Text = 'Bunny Hop Speed',
    Default = 18,
    Min = 18,
    Max = 500,
    Rounding = 0,
    Compact = false,
})

Movement:AddDropdown('BHOPMethod', {
    Values = { 'AutoHop', 'Velocity', 'CFrame' },
    Default = 2, 
    Multi = false,
})

MiscOther:AddToggle('BypassSpawns', {
    Text = 'Bypass Spawn Barriers',
    Default = false,
    Callback = function(Value)
        if Toggles.BypassSpawns.Value then
            if workspace:WaitForChild("Map"):FindFirstChild("Forcefields") then
                for i, v in workspace.Map.Forcefields:GetDescendants() do
                    if v:IsA("BasePart") and v.CanCollide == true then
                        v.CanCollide = false 
                    end
                end
            end
        end
    end
})

workspace.ChildAdded:Connect(function(c)
    if c.Name == "Map" then
        if Toggles.BypassSpawns.Value == true then
            task.wait(2)
            if workspace.Map:FindFirstChild("Forcefields") then
                for i, v in workspace.Map.Forcefields:GetDescendants() do
                    if v:IsA("BasePart") and v.CanCollide == true then
                        v.CanCollide = false 
                    end
                end
            end
        end
        if Toggles.AsusWalls.Value then
			for L_1385_forvar0, L_1386_forvar1 in pairs(workspace:WaitForChild("Map"):GetDescendants()) do
				if L_1386_forvar1:IsA"BasePart" and L_1386_forvar1.Transparency ~= 1 then
					L_1386_forvar1.Transparency = Options.AsusTransparency.Value / 100
				end;
				if L_1385_forvar0 % 75 == 75 then
					wait()
				end
			end
        end
    end
end)

MiscOther:AddToggle('ChatSpammer', {
    Text = 'Chat Spammer',
    Default = false,

    Callback = function(Value)
        while Toggles.ChatSpammer.Value do
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(Options.ChatText.Value)
            task.wait(2)
        end
    end
})

MiscOther:AddInput('ChatText', {
    Default = 'rainware winning $$$',
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Input Message',
    Tooltip = 'This is a tooltip', -- Information shown when you hover over the textbox

    Placeholder = 'Input', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})


local L_54_ = false
RunService.RenderStepped:Connect(function()
    if Toggles.BunnyHop.Value and IsAlive(LocalPlayer) and not L_54_ then
		local L_1739_ = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		local L_1740_ = L_48_;
		local L_1741_;
		local L_1742_;
		if L_1739_ then
			L_1741_ = CurrentCamera.CFrame.LookVector or LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector;
			L_1742_ = CurrentCamera.CFrame.p or L_1739_.Position
		end;
		--[[if library_flags["Override Game Movement"] and not edgebugDebounce then
			return
		end;]]
		if not UserInputService:GetFocusedTextBox() and L_1739_ and UserInputService:IsKeyDown(Enum.KeyCode.Space) and LocalPlayer.Character:FindFirstChild("Humanoid") then
			L_53_ = true;
			if Options.BHOPMethod.Value == "CFrame" or Options.BHOPMethod.Value == "Velocity" then
				L_1740_ = UserInputService:IsKeyDown(Enum.KeyCode.W) and L_1740_ + L_1741_ or L_1740_;
				L_1740_ = UserInputService:IsKeyDown(Enum.KeyCode.S) and L_1740_ - L_1741_ or L_1740_;
				L_1740_ = UserInputService:IsKeyDown(Enum.KeyCode.D) and L_1740_ + Vector3.new(- L_1741_.Z, 0, L_1741_.X) or L_1740_;
				L_1740_ = UserInputService:IsKeyDown(Enum.KeyCode.A) and L_1740_ + Vector3.new(L_1741_.Z, 0, - L_1741_.X) or L_1740_;
				local L_1743_ = Options.BHOPSpeed.Value
				if Options.BHOPMethod.Value == "CFrame" and L_1740_ ~= L_48_ then
					L_1743_ = L_1743_ / 300;
					L_1740_ = L_1740_.Unit;
					LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(L_1740_.X * L_1743_, 0, L_1740_.Z * L_1743_)
					LocalPlayer.Character.Humanoid.Jump = true;
					return
				end;
				local L_1744_ = UserInputService:IsKeyDown(Enum.KeyCode.S) or UserInputService:IsKeyDown(Enum.KeyCode.D) or UserInputService:IsKeyDown(Enum.KeyCode.A)
				if L_1740_.Unit.X == L_1740_.Unit.X and not Toggles.AutoStrafe.Value or L_1740_.Unit.X == L_1740_.Unit.X and Toggles.AutoStrafe.Value and L_1744_ then
					L_1740_ = L_1740_.Unit;
					L_1739_.Velocity = Vector3.new(L_1740_.X * L_1743_, L_1739_.Velocity.Y, L_1740_.Z * L_1743_)
				elseif Toggles.AutoStrafe.Value and not UserInputService:IsKeyDown(Enum.KeyCode.S) and not UserInputService:IsKeyDown(Enum.KeyCode.D) and not UserInputService:IsKeyDown(Enum.KeyCode.A) then
					L_1740_ = L_1740_ + L_1741_;
					L_1740_ = L_1740_.Unit;
					L_1739_.Velocity = Vector3.new(L_1740_.X * L_1743_, L_1739_.Velocity.Y, L_1740_.Z * L_1743_)
					LocalPlayer.Character.Humanoid:MoveTo(L_1742_ + L_1741_)
				end;
				last = L_1739_.Velocity
			end;
			LocalPlayer.Character.Humanoid.Jump = true
        else
			if L_53_ and Toggles.MaintainVelocity.Value then
				local L_1737_ = 0;
				L_54_ = true;
				repeat
					wait()
					L_1737_ = L_1737_ + 1;
					local L_1738_ = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					if L_1738_ then
						L_1738_.Velocity = Vector3.new(last.X, L_1738_.Velocity.Y, last.Z)
					end
				until not IsAlive(LocalPlayer) or UserInputService:IsKeyDown(Enum.KeyCode.Space) or LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall or LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Landed or L_1737_ == 15;
				last = Vector3.new()
				L_54_ = false
			end;
			L_53_ = false
		end
	end;
end)

Library.Watermark.Position = UDim2.new(0, 1500, 0, -35)

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

    local X, Y = Library:GetTextBounds(Library.WatermarkText.Text, Library.Font, 14);
    Library.Watermark.Size = UDim2.new(0, X + 15, 0, (Y * 1.5) + 3);

    Library.WatermarkText.Text = ('%s | %s fps | %s ms'):format(
        game:GetService("Players").LocalPlayer.Name,
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    )
end);

Library:SetWatermarkVisibility(false)
Library.KeybindFrame.Visible = false;

Library:OnUnload(function()
    WatermarkConnection:Disconnect()

    print('Unloaded!')
    Library.Unloaded = true
end)

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddToggle("Watermark", { Default = false, Text = "Watermark", Callback = function(value) Library:SetWatermarkVisibility(value) end})
MenuGroup:AddToggle("KeybindMenuOpen", { Default = Library.KeybindFrame.Visible, Text = "Open Keybind Menu", Callback = function(value) Library.KeybindFrame.Visible = value end})
MenuGroup:AddDivider()
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind 
repeat wait() until Library and ThemeManager and SaveManager and Toggles and Options


ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('rainware')
SaveManager:SetFolder('rainware/' .. tostring(game.PlaceId))

SaveManager:BuildConfigSection(Tabs['UI Settings'])

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()

Library:Notify("Finished loading" .. " in " .. string.format("%.2f", tick()-currentMS)*100 .. "ms", 3)
Library:Notify("Notice!!!! Press F9 and if you see an error index nil with Value, rejoin and reexecute until it's gone", 10)

Mouse.Move:Connect(function()
	FOVCircle.Position = UserInputService:GetMouseLocation()
end)
