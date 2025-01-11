-- New example script written by wally
-- You can suggest changes with a pull request or something

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'rainware v2 loader',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    Size = UDim2.fromOffset(550, 300)
})

-- CALLBACK NOTE:
-- Passing in callback functions via the initial element parameters (i.e. Callback = function(Value)...) works
-- HOWEVER, using Toggles/Options.INDEX:OnChanged(function(Value) ... ) is the RECOMMENDED way to do this.
-- I strongly recommend decoupling UI code from logic code. i.e. Create your UI elements FIRST, and THEN setup :OnChanged functions later.

-- You do not have to set your tabs & groups up this way, just a prefrence.
local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Main'),
}
local loadergb = Tabs.Main:AddLeftGroupbox("Loader")
local infoGb = Tabs.Main:AddRightGroupbox("Info")

getgenv().correct = false

local input = nil
local key = gethwid()
local ver = "2.0.7"

loadergb:AddInput('Key', {
    Default = '',
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Key',

    Placeholder = 'Enter Key Here', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text

    Callback = function(Value)
        input = Value
    end
})

loadergb:AddButton({
    Text = 'Enter Key',
    Func = function()
        if input ~= key then
            return Library:Notify("Incorrect key!", 3)
        elseif input == key then
            getgenv().correct = true
            Library:Unload()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/lonelyhippo3/rainware/refs/heads/main/script.lua"))()     
        end
    end,
})

infoGb:AddLabel('User: ' .. game.Players.LocalPlayer.Name)
infoGb:AddLabel('Game: ' .. game.Name)
infoGb:AddLabel('PlaceId: ' .. game.PlaceId)
infoGb:AddLabel('Build Version: ' .. ver)

setclipboard(gethwid())
