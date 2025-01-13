repeat wait() until game:IsLoaded()

local games = {
    ["Unnamed Shooter"] = "17887390746"
}

local currGame = tostring(game.PlaceId)

for name, id in next, games do
    if currGame == id then
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/lonelyhippo3/rainware/refs/heads/main/games/" .. currGame .. ".lua"))()
    end
end
