repeat wait();until game:IsLoaded() local v0={["17887390746"]="Unnamed Shooter"};local v1="https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/";local v2=loadstring(game:HttpGet(v1   .. "Library.lua" ))();local v3=v2:CreateWindow({Title="rainware v2 loader $$$",Center=true,AutoShow=true,TabPadding=8,Size=UDim2.fromOffset(550,300)});local v4={Main=v3:AddTab("Main")};local v5=v4.Main:AddLeftGroupbox("Loader");local v6=v4.Main:AddRightGroupbox("Info");local v7="2.0.8";v5:AddInput("Key",{Default="",Numeric=false,Finished=false,Text="Key",Placeholder="Enter Key Here"});function load() v2:Unload();v2.Unloaded=true;getgenv().loaded=true;loadstring(game:HttpGet("https://raw.githubusercontent.com/lonelyhippo3/rainware/refs/heads/main/games/"   .. tostring(game.PlaceId)   .. ".lua" ))();end v5:AddButton({Text="Load",Func=function() load();end});v6:AddLabel("User: "   .. game.Players.LocalPlayer.Name );v6:AddLabel("Game: "   .. v0[game.PlaceId] );v6:AddLabel("PlaceId: "   .. game.PlaceId );v6:AddLabel("Build Version: "   .. v7 );
