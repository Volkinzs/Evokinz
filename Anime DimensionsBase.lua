
repeat wait() until game:IsLoaded()
if game.PlaceId == 6938803436 or game.PlaceId == 6990129309 or game.PlaceId == 6990133340 or game.PlaceId == 6990131029 or game.PlaceId == 7338881230 or game.PlaceId == 7274690025 then
function hopserver()local v0=game.PlaceId;local v1={};local v2="";local v3=os.date("!*t").hour;local v4=false;local v5=pcall(function()v1=game:GetService("HttpService"):JSONDecode(readfile("NotSameServers.json"));end);if  not v5 then table.insert(v1,v3);writefile("NotSameServers.json",game:GetService("HttpService"):JSONEncode(v1));end function TPReturner()local v6;if (v2=="") then v6=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. v0   .. "/servers/Public?sortOrder=Asc&limit=100" ));else v6=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. v0   .. "/servers/Public?sortOrder=Asc&limit=100&cursor="   .. v2 ));end local v7="";if (v6.nextPageCursor and (v6.nextPageCursor~="null") and (v6.nextPageCursor~=nil)) then v2=v6.nextPageCursor;end local v8=0;for v9,v10 in pairs(v6.data) do local v11=true;v7=tostring(v10.id);if (tonumber(v10.maxPlayers)>tonumber(v10.playing)) then for v13,v14 in pairs(v1) do if (v8~=0) then if (v7==tostring(v14)) then v11=false;end elseif (tonumber(v3)~=tonumber(v14)) then local v15=pcall(function()delfile("NotSameServers.json");v1={};table.insert(v1,v3);end);end v8=v8 + 1 ;end if (v11==true) then table.insert(v1,v7);wait();pcall(function()writefile("NotSameServers.json",game:GetService("HttpService"):JSONEncode(v1));wait();game:GetService("TeleportService"):TeleportToPlaceInstance(v0,v7,game.Players.LocalPlayer);end);wait(4);end end end end function Teleport()while wait() do pcall(function()TPReturner();if (v2~="") then TPReturner();end end);end end Teleport();end
    if game.PlaceId == 6938803436 or game.PlaceId == 7274690025 then
        repeat wait(.5) until game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.PlayFrame.Frame.PlayRoomFrame.MapSelectionScrollingFrame:FindFirstChildOfClass("ImageButton")
        MapSelection = {"TimeChallenge"}
        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.PlayFrame.Frame.PlayRoomFrame.MapSelectionScrollingFrame:GetChildren()) do
            if v.ClassName == "ImageButton" and v.Name ~= "MapSelectionTemplate" then
                table.insert(MapSelection, v.Name)
            end
        end
    elseif game.PlaceId == 7338881230 then
        repeat wait(.5) until game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.PlayFrame.Frame.PlayRoomFrame.MapSelectionScrollingFrame:FindFirstChildOfClass("ImageButton")
        RaidSelection = {}
        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.PlayFrame.Frame.PlayRoomFrame.MapSelectionScrollingFrame:GetChildren()) do
            if v.ClassName == "ImageButton" and v.Name ~= "MapSelectionTemplate" then
                table.insert(RaidSelection, v.Name)
            end
        end
    end
    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Volkinzz/Evokinz/main/GUI"))()
    local Window = library:CreateWindow("Farm Insano")
    local Tab1 = Window:CreateTab("Farmzada")
	local Sector1 = Tab1:CreateSector("Farming", "left")
    Sector1:AddDropdown("MapSelection(AutoUpdate!)",MapSelection, false ,false , function(v)
        _G.MapSelection = v
    end)
    Sector1:AddDropdown("SelectDifficulty",{"Easy" , "Hard" , "Nightmare" }, false ,false , function(v)
        _G.Difficulty = v
    end)
    Sector1:AddTextbox("WaitOnLobbyAfterJoin(OnlyNumber)" , "10" , function(w)
        _G.CooldownOnlobby = w
    end)
    Sector1:AddToggle("AutoPlay", false, function(t)
		_G.AutoPlay = t
	end)
    Sector1:AddToggle("Hardcore", false, function(t)
		_G.Hardcore = t
	end)
    Sector1:AddToggle("AutoReplay", false, function(t)
		_G.Replay = t
	end)
    Sector1:AddToggle("FriendOnly", false, function(t)
		_G.FriendOnly = t
	end)
    Sector1:AddToggle("AutoSelectMap(DetectedLevel)", false, function(t)
		_G.AutoSelectMap = t
	end)
    Sector1:AddToggle("GetAllDimensionCharacter", false, function(t)
		_G.GetAllDimensionCharacter = t
	end)


    local Sector2 = Tab1:CreateSector("InGame", "Right")
    Sector2:AddDropdown("Method",{"Behind" , "Front" , "Over" , "Under" }, "Behind" ,false , function(v)
        _G.Method = v
    end)
    Sector2:AddTextbox("ImportDistance(OnlyNumber)" , "6" , function(w)
        _G.Distance = tonumber(w)
    end)
    Sector2:AddTextbox("TweenSpeed(OnlyNumber)" , "200" , function(w)
        _G.TWSpeed = w
    end)
	Sector2:AddToggle("AutoMob", false, function(t)
		_G.Automob = t
	end)
    Sector2:AddTextbox("DistanceToSkill(OnlyNumber)" , "30" , function(w)
        _G.DistanceToSkill = tonumber(w)
    end)
    Sector2:AddToggle("AutoSkill", false, function(t)
		_G.AutoSkill = t
	end)
    Sector2:AddToggle("AutoAssistSkill", false, function(t)
		_G.AutoAssistSkill = t
	end)
    Sector2:AddDropdown("SelectAttackMethod",{"Remote" , "Click" }, "Remote" ,false , function(v)
        _G.SelectAttackMethod = v
    end)
    Sector2:AddToggle("AutoMelee", false, function(t)
		_G.AutoMelee = t
	end)

    local Tab2 = Window:CreateTab("More")
    local Sector1 = Tab2:CreateSector("JoiningCombo", "left")
    Sector1:AddLabel("JoinRaidLobby To ShowRaid",true)
    Sector1:AddDropdown("RaidSelection",RaidSelection, false ,false , function(v)
        _G.RaidSelection = v
    end)
    Sector1:AddTextbox("Cooldown JoinRaid(OnlyNumber)" , "10" , function(w)
        _G.waitonJoinRiad = w
    end)
    Sector1:AddToggle("AutoRaid", false, function(t)
		_G.AutoRaid = t
	end)
    Sector1:AddToggle("FreeBossRush", false, function(t)
		_G.FreeBossRush = t
	end)
    Sector1:AddToggle("BossRush", false, function(t)
		_G.BossRush = t
	end)
    Sector1:AddToggle("AutoSpeedRaid(RandomSelect)", false, function(t)
		_G.AutoSpeedRaid = t
	end)
    Sector1:AddToggle("AutoTraitTokens(Need LV:20)", false, function(t)
		_G.AutoTraitTokens = t
	end)
    local Sector1 = Tab2:CreateSector("AutoEventMadokiRaid", "left")
    Sector1:AddToggle("MadokiRaid(Need Raid Token)", false, function(t)
		_G.AutoMadokiRaid = t
	end)
    Sector1:AddToggle("JoinMadokiRaid(AutoJoinRaidLobby)", false, function(t)
		_G.AutoJoinMadokiRaid = t
	end)
    local Sector4 = Tab2:CreateSector("MoreFunction", "Right")
    Sector4:AddToggle("AutoDodgeSkill", false, function(t)
		_G.AutoDodgeSkill = t
	end)
    Sector4:AddToggle("BackToLobbyIfGotExploitsDetected", false, function(t)
		_G.BackToLobbyIfGotExploitsDetected = t
	end)
    Sector4:AddToggle("HideName", false, function(t)
        _G.HideName = t
    end)
    Sector4:AddToggle("DashNoCooldown", false, function(t)
        _G.DashNoCooldown = t
    end)
    Sector4:AddToggle("AutoWalk(Only Boss)", false, function(t)
        _G.AutoWalk = t
    end)
    Sector4:AddToggle("AutoClaimQuestAndReward", false, function(t)
		_G.AutoClaimQuestAndReward = t
	end)
    Sector4:AddDropdown("GoLobbyMethod",{"ResetCharacter" , "TeleportToLobby" }, false ,false , function(v)
        _G.GoLobbyMethod = v
    end)
    Sector4:AddToggle("BackToLobbyIfRaidOpen", false, function(t)
		_G.OnRaidOpen = t
	end)
    Sector4:AddToggle("StopReplayIfRaidOpen", false, function(t)
		_G.StopReplay = t
	end)
    Sector4:AddToggle("Disable Noclip", false, function(t)
		_G.DontNoclip = t
	end)
    Sector4:AddToggle("DoNotThingIfHavePlayer", false, function(t)
		_G.DoNotThingIfHavePlayer = t
	end)
    local Config = {}
    function Save_Config()
        writefile("Character_SLH.json" , game:GetService("HttpService"):JSONEncode(Config))
        for i,v in pairs(Config) do
            Notification(1, "SmellLikehacker Hub", ("ConfigSaved: "..tostring(i).." "..tostring(v)), 10)
            wait(1)
        end
    end

    if isfile("Character_SLH.json") then
        Config = game:GetService("HttpService"):JSONDecode(readfile("Character_SLH.json"))
    end



    local Tab3 = Window:CreateTab("Character")
    local Sector1 = Tab3:CreateSector("AutoEquip", "left")
    Sector1:AddToggle("AutoEquip Character", false, function(t)
		_G.AutoEquipCharacter = t
	end)
    Sector1:AddButton("SaveCharacter" , function()
        Config["Character1"] = game:GetService("ReplicatedStorage")[game.Players.LocalPlayer.Name.."StatDisplay"].CharacterName.Value
        Config["Character2"] = game:GetService("ReplicatedStorage")[game.Players.LocalPlayer.Name.."StatDisplay"].AssistCharacterName1.Value
        Config["Character3"] = game:GetService("ReplicatedStorage")[game.Players.LocalPlayer.Name.."StatDisplay"].AssistCharacterName2.Value
        Save_Config()
    end)
	local Sector2 = Tab3:CreateSector("SellCard", "Right")
    Cardtabel = {}
    Sector2:AddDropdown("SelectRarity",{"Common" , "Uncommon" , "Rare", "Epic", "Legendary" }, false ,true , function(v)
        Cardtabel = v
        table.foreach(Cardtabel , print)
    end)
    Sector2:AddToggle("AutoSellCard", false, function(t)
		_G.AutoSell = t
	end)

	local Sector3 = Tab3:CreateSector("EquipCard", "Right")
    Sector3:AddToggle("EquipBestCard(Ruim)", false, function(t)
		_G.EquipBestCard = t
	end)

    local Tab9 = Window:CreateTab("Setting")
    local Sector1 = Tab9:CreateSector("Setting DodgeSkill", "left")
    Sector1:AddTextbox("SizeDodgePart (OnlyNumber)" , "3.5" , function(w)
        _G.SizeDodgePart = w
    end)
    Sector1:AddTextbox("SizeDodgePart Y (OnlyNumber)" , "100" , function(w)
        _G.SizeDodgePartY = w
    end)
    Sector1:AddTextbox("TweenSpeedDodgePart (Sec)" , "0.25" , function(w)
        _G.TweenDodgePart = w
    end)
    Sector1:AddTextbox("DodgePartTransparency (OnlyNumber)" , "0.9" , function(w)
        _G.DodgePartTransparency = w
    end)
    local Sector5 = Tab9:CreateSector("MoreFunction2", "left")
    Sector5:AddToggle("Go AFK (If Raid Not Open)", false, function(t)
		_G.AutoGoAFK = t
	end)
    Sector5:AddTextbox("SelectWaveToReset" , "100" , function(w)
        _G.SelectWaveToEnd = w
    end)
    Sector5:AddToggle("Reset INF Mode (SelectWave)", false, function(t)
		_G.ResetifWave = t
	end)
    local Sector1 = Tab9:CreateSector("Setting AutoSkill", "Right")
    Sector1:AddDropdown("SkillFirst",{"1","2","3","4","5"},"4",false , function(v)
        _G.skill1 = v
    end)
    Sector1:AddDropdown("SkillSecond",{"1","2","3","4","5"},"3",false , function(v)
        _G.skill2 = v
    end)
    Sector1:AddDropdown("SkillThird",{"1" , "2" , "3", "4","5"},"5",false , function(v)
        _G.skill3 = v
    end)
    Sector1:AddDropdown("SkillFourth",{"1","2","3","4","5"}, "1" ,false , function(v)
        _G.skill4 = v
    end)
    Sector1:AddDropdown("SkillFifth",{"1","2","3","4","5"}, "2" ,false , function(v)
        _G.skill5 = v
    end)
    local Tab10 = Window:CreateTab("Buy")
	local Sector1 = Tab10:CreateSector("AutoBuy", "left")
    Sector1:AddDropdown("Select method buy",{"(Raid)" , "(Gem)"}, false ,false , function(v)
        _G.methodbuy = v
    end)
    Sector1:AddToggle("BuyRushTicket", false, function(t)
		_G.BuyRushTicket = t
	end)
    Sector1:AddToggle("BuyMadokiKey(Raid Token)", false, function(t)
		_G.BuyKey = t
	end)
    local Tab11 = Window:CreateTab("Webhook")
    local Sector1 = Tab11:CreateSector("Risk Game Crash", "left")
    Sector1:AddLabel("⬇ Why Crash ⬇",true)
    Sector1:AddLabel("")
    Sector1:AddLabel("After SendWebhook will FPS Drop")
    Sector1:AddLabel("Everytimes FPS Drop can Crash")
    Sector1:AddLabel("")
    Sector1:AddTextbox("Url Webhook" , "" , function(w)
        _G.UrlWebhook = w
    end)
    Sector1:AddToggle("Send(DropsResult)", false, function(t)
		_G.SendDropsResult = t
	end)
    Sector1:AddToggle("Send(IfLevelUp)", false, function(t)
		_G.SendIfLevelUp = t
	end)

    local function PlayerDetect()
        local Players = game.Players:GetPlayers()
        return tonumber(#Players)
    end
    spawn(function()
        pcall(function()
            while task.wait() do
                pcall(function()
                    if tonumber(os.date("!*t").min) <= 9 then
                        _G.RaidOpened = true
                    else
                        _G.RaidOpened = false
                    end
                end)
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while wait(1) do
                spawn(function()
                    if _G.BuyRushTicket == true then
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("MainRemoteFunction"):InvokeServer({[1] = "BuyBossRushShopItem",[2] = "Boss Rush Ticket ".._G.methodbuy})
                    end
                end)
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while wait(1) do
                spawn(function()
                    if _G.BuyKey == true then
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("MainRemoteFunction"):InvokeServer({[1] = "BuyRaidShopItem",[2] = "Madoki Raid Key (2 Per Day)"})
                    end
                end)
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while task.wait() do
                task.spawn(function()
                    if _G.AutoJoinMadokiRaid == true then
                        for _,v in pairs(game.Players.LocalPlayer.PlayerGui.MainGui.CenterUIFrame.PlayFrame.Frame.PlayRoomFrame.PlayRoomScrollingFrame:GetChildren()) do
                            if v.Name == "Goddess Madoki RaidEasy" and v.Players.Text ~= "Players: 5/5" and v.FriendsOnly.Visible == false then
                                for _,vv in pairs({"MouseButton1Click"}) do
                                    firesignal(v.JoinButton[vv])
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while task.wait() do
                pcall(function()
                    if tonumber(#game.Players:GetPlayers()) > 1 then
                        _G.CheckPlayer = true
                    else
                        _G.CheckPlayer = false
                    end
                end)
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while wait(1) do
                pcall(function()
                    if _G.AutoJoinMadokiRaid == true then
                        if game:GetService("Players").LocalPlayer.PlayerGui.BattleGui.CenterUIFrame.RaidDataFrame.Visible == false and game:GetService("Players").LocalPlayer.PlayerGui.BattleGui.CenterUIFrame.BossHealthFrame.Visible == false then
                            if game.PlaceId ~= 7338881230 and game.PlaceId ~= 6990129309 then
                                game:GetService("TeleportService"):Teleport(7338881230)
                                wait(10)
                            end
                        end
                    end
                end)
            end
        end)
    end)

    local function getClosestwalk()
        local dist, thing = math.huge
        for i, v in next, workspace.Folders.Monsters:GetChildren() do
            if v:FindFirstChildOfClass("BillboardGui") then
                local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
                if mag < dist then
                    dist = mag 
                    thing = v
                end
            end
        end
    return thing
    end

    local function getClosestBoss()
        local dist, thing = math.huge
            for i, v in next, workspace.Folders.Monsters:GetChildren() do
                if v:FindFirstChildOfClass("BillboardGui") and v.EnemyHealthBarGui.Enabled == false then
                    local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
                    if mag < dist then
                        dist = mag 
                        thing = v
                    end
                end
            end
        return thing
    end

    local function getClosestMob()
        local dist, thing = math.huge
            for i, v in next, workspace.Folders.Monsters:GetChildren() do
                if v:FindFirstChildOfClass("BillboardGui") then
                    local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
                    if mag < dist then
                        dist = mag 
                        thing = v
                    end
                end
            end
        return thing
    end

    function walk(P)
        if game:GetService("Players").LocalPlayer.PlayerGui.BattleGui.CenterUIFrame.RaidDataFrame.Visible == true and _G.DoNotThingIfHavePlayer == true and _G.CheckPlayer == true then
        else
            game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = (P.HumanoidRootPart.Position)
        end
    end

    function Tween(P)
        if game:GetService("Players").LocalPlayer.PlayerGui.BattleGui.CenterUIFrame.RaidDataFrame.Visible == true and _G.DoNotThingIfHavePlayer == true and _G.CheckPlayer == true then
        else
            game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new((getClosestMob().HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/tonumber(_G.TWSpeed), Enum.EasingStyle.Linear),{CFrame = P}):Play()
        end
    end

    function melee()
        if _G.AutoMelee == true then
            if _G.SelectAttackMethod == "Remote" then
                if game.Players.LocalPlayer.Character:FindFirstChild("Bow") then
                    game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(getClosestMob().HumanoidRootPart.Position),["combo"] = 3},"BasicAttack")
                else
                    game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(getClosestMob().HumanoidRootPart.Position),["attackNumber"] = 4},"BasicAttack")
                end
            elseif _G.SelectAttackMethod == "Click" then
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 1)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 1)
            end
        end
    end
    function skill()
        if _G.AutoSkill == true then
            if _G.skill1 == "5" and game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder["Skill5"].Visible == true and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder["Skill".._G.skill1].SkillName.Text) == nil then
                game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(getClosestMob().HumanoidRootPart.Position)},tonumber(_G.skill1))
            elseif _G.skill1 ~= "5" and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder["Skill".._G.skill1].SkillName.Text) == nil then
                game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(getClosestMob().HumanoidRootPart.Position)},tonumber(_G.skill1))
            elseif _G.skill2 == "5" and game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder["Skill5"].Visible == true and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder["Skill".._G.skill2].SkillName.Text) == nil then
                game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(getClosestMob().HumanoidRootPart.Position)},tonumber(_G.skill2))
            elseif _G.skill2 ~= "5" and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder["Skill".._G.skill2].SkillName.Text) == nil then
                game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(getClosestMob().HumanoidRootPart.Position)},tonumber(_G.skill2))
            elseif _G.skill3 == "5" and game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder["Skill5"].Visible == true and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder["Skill".._G.skill3].SkillName.Text) == nil then
                game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(getClosestMob().HumanoidRootPart.Position)},tonumber(_G.skill3))
            elseif _G.skill3 ~= "5" and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder["Skill".._G.skill3].SkillName.Text) == nil then
                game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(getClosestMob().HumanoidRootPart.Position)},tonumber(_G.skill3))
            elseif _G.skill4 == "5" and game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder["Skill5"].Visible == true and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder["Skill".._G.skill4].SkillName.Text) == nil then
                game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(getClosestMob().HumanoidRootPart.Position)},tonumber(_G.skill4))
            elseif _G.skill4 ~= "5" and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder["Skill".._G.skill4].SkillName.Text) == nil then
                game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(getClosestMob().HumanoidRootPart.Position)},tonumber(_G.skill4))
            elseif _G.skill5 == "5" and game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder["Skill5"].Visible == true and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder["Skill".._G.skill5].SkillName.Text) == nil then
                game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(getClosestMob().HumanoidRootPart.Position)},tonumber(_G.skill5))
            elseif _G.skill5 ~= "5" and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder["Skill".._G.skill5].SkillName.Text) == nil then
                game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("UseSkill",{["hrpCFrame"] = CFrame.new(getClosestMob().HumanoidRootPart.Position)},tonumber(_G.skill5))
            end
        end
    end

    function skillmelee()
        if _G.AutoSkill == true and _G.AutoMelee == true then
            skill()
            melee()
        end
    end

    spawn(function()
        pcall(function()
            while wait(0.2) do
                pcall(function()
                    if game:GetService("Players").LocalPlayer.PlayerGui.BattleGui.CenterUIFrame.RaidDataFrame.Visible == true and _G.DoNotThingIfHavePlayer == true and _G.CheckPlayer == true then
                    else
                    Distance = (getClosestMob().HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if game.PlaceId ~= 6938803436 and game.PlaceId ~= 7274690025 and game.PlaceId ~= 7338881230 and Distance <= tonumber(_G.DistanceToSkill) then
                            if _G.AutoMelee == true and _G.AutoSkill == true then
                                skillmelee()
                            elseif _G.AutoMelee == true and _G.AutoSkill == false then
                                melee()
                            elseif _G.AutoMelee == false and _G.AutoSkill == true then
                                skill()
                            end
                        end
                    end
                end)
            end
        end)
    end)
    
    spawn(function()
        pcall(function()
            while wait(1) do
                pcall(function()
                    Distance = (getClosestMob().HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if game.PlaceId ~= 6938803436 and game.PlaceId ~= 7274690025 and game.PlaceId ~= 7338881230 then
                        if Distance > 500 then
                            if workspace.GameMap:FindFirstChild("Curse Dimension") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.GameMap["Curse Dimension"].CurseTeleportDestination.CFrame
                            elseif workspace.GameMap:FindFirstChild("Fate Dimension") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.GameMap["Fate Dimension"].CenterTeleportDestination.CFrame
                            elseif workspace.GameMap:FindFirstChild("Pirate Dimension") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.GameMap["Pirate Dimension"].Part2TeleportDestination.CFrame
                            end
                        end
                    end
                end)
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while wait(0.2) do
                pcall(function()
                    Distance = (getClosestMob().HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if game.PlaceId ~= 6938803436 and game.PlaceId ~= 7274690025 and game.PlaceId ~= 7338881230 then
                        if Distance <= 30 then
                            if _G.AutoAssistSkill == true and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.SkillAssist1.SkillName.Text) == nil or tonumber(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.SkillAssist1.SkillName.Text) == 0 then
                                game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("UseAssistSkill",{["hrpCFrame"] = CFrame.new(getClosestMob().HumanoidRootPart.Position)},1)
                            elseif _G.AutoAssistSkill == true and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.SkillAssist2.SkillName.Text) == nil or tonumber(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.SkillAssist2.SkillName.Text) == 0 then
                                game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("UseAssistSkill",{["hrpCFrame"] = CFrame.new(getClosestMob().HumanoidRootPart.Position)},2)
                            end
                        end
                    end
                end)
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while wait() do
                pcall(function()
                    if _G.ResetifWave then
                        if tonumber(game:GetService("Players").LocalPlayer.PlayerGui.BattleGui.CenterUIFrame.WaveClearClearText.Text) >= tonumber(_G.SelectWaveToEnd) and game:GetService("Players").LocalPlayer.PlayerGui.BattleGui.CenterUIFrame.BossHealthFrame.Visible == false then
                            game.Players.LocalPlayer.Character.Humanoid.Health = 0
                        end
                    end
                end)
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while wait(1) do
                pcall(function()
                    if _G.DashNoCooldown then
                        game.ReplicatedStorage[game.Players.LocalPlayer.Name .. "StatDisplay"].No_DashCooldown.Value = true
                    end
                end)
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while wait(1) do
                pcall(function()
                    if _G.AutoClaimQuestAndReward then
                        if game.PlaceId == 6938803436 or game.PlaceId == 7274690025 or game.PlaceId == 7338881230 then
                            for i = 1,9 do
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("ClaimWeeklySpeedRaidReward",i)
                            end
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("GiveFreeDailyGemFromShop")
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CompleteDailyQuest","DailyQuest_Login")
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CompleteDailyQuest","DailyQuest_DungeonClear")
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CompleteDailyQuest","DailyQuest_Enemies")
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CompleteDailyQuest","DailyQuest_TimeChallenge")
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CompleteDailyQuest","DailyQuest_Raid")
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CompleteDailyQuest","DailyQuest_BossRush")
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CompleteDailyQuest","DailyQuest_AllQuestClear")
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CompleteDailyQuest","WeeklyQuest_Logins")
                            wait(600)
                        end
                    end
                end)
            end
        end)
    end)
    spawn(function()
    pcall(function()
        while task.wait() do
            pcall(function()
                if _G.AutoWalk == true then
                    if game.PlaceId ~= 6938803436 and game.PlaceId ~= 7274690025 and game.PlaceId ~= 7338881230 then
                        walk(getClosestBoss())
                    end
                end
            end)
        end
    end)
    end)

    spawn(function()
    pcall(function()
        while task.wait() do
            pcall(function()
                if _G.Automob then
                    if game.PlaceId ~= 6938803436 and game.PlaceId ~= 7274690025 and game.PlaceId ~= 7338881230 then
                        if _G.Method == "Behind" then
                            MethodFarm = CFrame.new(0,0,_G.Distance) * CFrame.Angles(math.rad(0),0,0)
                        elseif _G.Method == "Front" then
                            MethodFarm = CFrame.new(0,0,-_G.Distance) * CFrame.Angles(math.rad(0),1800,0)
                        elseif _G.Method == "Under" then
                            MethodFarm = CFrame.new(0,-_G.Distance,0) * CFrame.Angles(math.rad(90),0,0)
                        elseif _G.Method == "Over" then
                            MethodFarm = CFrame.new(0,_G.Distance,0)  * CFrame.Angles(math.rad(-90),0,0)
                        else
                            MethodFarm = CFrame.new(0,0,_G.Distance)
                        end
                        local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                        for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                            if v.IsA(v, "BasePart") then
                                v.Velocity, v.RotVelocity = V3, V3
                            end
                        end
                        if game:GetService("Players").LocalPlayer.PlayerGui.BattleGui.CenterUIFrame.BossHealthFrame.Visible == true then
                            Tween(getClosestBoss().HumanoidRootPart.CFrame * MethodFarm or CFrame.new(0,0,_G.Distance))
                        elseif game:GetService("Players").LocalPlayer.PlayerGui.BattleGui.CenterUIFrame.BossHealthFrame.Visible == false then
                            Tween(getClosestMob().HumanoidRootPart.CFrame * MethodFarm or CFrame.new(0,0,_G.Distance))
                        end
                    end
                end
            end)
        end
    end)
    end)
    spawn(function()
        pcall(function()
            while wait(3) do
                pcall(function()
                    if _G.EquipBestCard then
                        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CardInventoryFrame.CardInventoryScrollingFrame:GetChildren()) do
                            if v:IsA("ImageButton") and v.Name ~= "CardInventorySlot" then
                                if v.CardImage.BackgroundColor3 == Color3.fromRGB(255, 223, 167) then
                                    game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("UnequipCard",v.Name)
                                    wait()
                                end
                            end
                        end
                        aw = {}
                        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CardInventoryFrame.CardInventoryScrollingFrame:GetChildren()) do
                            if v:IsA("ImageButton") and v.Name ~= "CardInventorySlot" then
                                a = v.LevelReq.Text
                                if a:find("Lv. ") then
                                    a = a:gsub("Lv. ","")
                                    table.insert(aw , tonumber(a))
                                end
                            end
                        end
                        max = math.max(unpack(aw))
                        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CardInventoryFrame.CardInventoryScrollingFrame:GetChildren()) do
                            if v:IsA("ImageButton") and v.Name ~= "CardInventorySlot" then
                                a = v.LevelReq.Text
                                if a:find("Lv. ") then
                                    a = a:gsub("Lv. ","")
                                    if tonumber(a) == max then
                                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("EquipCard",v.Name)
                                        wait()
                                    end
                                end
                            end
                        end
                        wait(60000)
                    end
                end)
            end
        end)
    end)
    spawn(function()
        pcall(function()
            wait(5)
            while wait(1) do
                pcall(function()
                    if _G.AutoSell == true then
                        local I = Cardtabel
                        local J = game.Players.LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory
                        local K = J.Frame.CardInventoryFrame.CardInventoryScrollingFrame
                        for M, N in pairs(K:GetChildren()) do
                            if N:IsA("ImageButton") then
                                for O, P in next, getconnections(N.CardClick.MouseButton1Down) do
                                    P:Fire()
                                    local Q = J.Frame.InvOverlayOuterFrame.CardInventoryOverlay.Rarity.Text
                                    for R, S in next, I do
                                        if Q == S then
                                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("SellCard",N.Name)
                                        end
                                    end
                                end
                            end
                        end
                        wait(60000)
                    end
                end)
            end
        end)
    end)

    
    spawn(function()
        pcall(function()
            wait(10)
            while wait(1) do
                pcall(function()
                    if game.PlaceId ~= 6938803436 and game.PlaceId ~= 7274690025 and game.PlaceId ~= 7338881230 then
                        if _G.GoLobbyMethod == "ResetCharacter" and _G.OnRaidOpen == true and _G.RaidOpened == true and game:GetService("Players").LocalPlayer.PlayerGui.BattleGui.CenterUIFrame.BossHealthFrame.Visible == false then
                            game.Players.LocalPlayer.Character.Humanoid.Health = 0
                        elseif _G.GoLobbyMethod == "TeleportToLobby" and _G.OnRaidOpen == true and _G.RaidOpened == true and game:GetService("Players").LocalPlayer.PlayerGui.BattleGui.CenterUIFrame.BossHealthFrame.Visible == false then
                            game:GetService("TeleportService"):Teleport(6938803436)
                            wait(60)
                        end
                    end
                end)
            end
        end)
    end)


    spawn(function()
        pcall(function()
            Notification(1, "SmellLikehacker Hub", "Waiting on join raid", tonumber(_G.waitonJoinRiad))
            wait(tonumber(_G.waitonJoinRiad))
            while wait() do
                pcall(function()
                    if _G.AutoMadokiRaid == true and tonumber(game:GetService("ReplicatedStorage")[game.Players.LocalPlayer.Name.."StatDisplay"]["Madoki Raid Key"].Value) <= 0 then
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("BuyRaidShopItem","Madoki Raid Key (2 Per Day)")
                    elseif game:GetService("ReplicatedStorage")[game.Players.LocalPlayer.Name.."StatDisplay"]:FindFirstChild("Madoki Raid Key") and tonumber(game:GetService("ReplicatedStorage")[game.Players.LocalPlayer.Name.."StatDisplay"]["Madoki Raid Key"].Value) > 0 and _G.AutoMadokiRaid == true then
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Easy",["FriendsOnly"] = _G.FriendOnly,["MapName"] = "Goddess Madoki Raid",["Hardcore"] = false})
                        wait(1)
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("TeleportPlayers")
                    else
                        if _G.AutoRaid == true and _G.AutoGoAFK == true then
                            if _G.RaidOpened == true then
                                if game.PlaceId == 6938803436 or game.PlaceId == 7274690025 or game.PlaceId == 7338881230 then
                                    game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Easy",["FriendsOnly"] = _G.FriendOnly,["MapName"] = tostring(_G.RaidSelection),["Hardcore"] = false})
                                    wait()
                                    game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("TeleportPlayers")
                                elseif game.PlaceId == 6990131029 then
                                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("MainRemoteFunction"):InvokeServer("TeleportToLobbyAFK",true)
                                end
                            elseif _G.RaidOpened == false and game.PlaceId ~= 6990131029 then
                                Notification(1, "SmellLikehacker Hub", "Go AFK in 10 Sec", 10)
                                wait(10)
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("TeleportToAFK")
                            end
                        elseif _G.AutoRaid == true and _G.AutoGoAFK == false then
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Easy",["FriendsOnly"] = _G.FriendOnly,["MapName"] = tostring(_G.RaidSelection),["Hardcore"] = false})
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("TeleportPlayers")
                        end
                    end
                end)
            end
        end)
    end)


    spawn(function()
        pcall(function()
            Notification(1, "SmellLikehacker Hub", "Waiting CooldownOnlobby", tonumber(_G.CooldownOnlobby))
            wait(tonumber(_G.CooldownOnlobby))
            while wait() do
                pcall(function()
                    if _G.AutoRaid == true then
                        if _G.FreeBossRush == true and game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.BossRushFrame.BossRushFreeEntry.Text == "1 Free Entry Left" and _G.RaidOpened == false then
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("TeleportToBossRush")
                        elseif _G.BossRush == true and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.BossRushFrame.BossRushEntryPassCount.Text) > 0 and _G.RaidOpened == false then
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("TeleportToBossRush")
                        elseif _G.AutoTraitTokens == true and _G.RaidOpened == false then
                            game:GetService("TeleportService"):Teleport(6990129309)
                        elseif _G.AutoSpeedRaid == true and game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.PlayButtonsFrame.Frame.SpeedRaidBanner.SpeedRaidBannerOpenText.Text == "Ready to enter" and _G.RaidOpened == false then
                            for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.SpeedRaidCharacterSelector.Shade.SpeedRaidCharacterInventoryScrollingFrame:GetChildren()) do
                                if v.ClassName == "ImageButton" then
                                    for ii,vv in pairs(v:GetChildren()) do
                                        if vv.ClassName == "ImageButton" and vv.Name == "CharacterImage" and vv.ImageTransparency == 0 then
                                            if v.Name ~= game:GetService("ReplicatedStorage")[game.Players.LocalPlayer.Name.."StatDisplay"].AssistCharacterName1.Value and v.Name ~= game:GetService("ReplicatedStorage")[game.Players.LocalPlayer.Name.."StatDisplay"].AssistCharacterName2.Value then
                                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("TeleportToShadowRaid",v.Name)
                                                wait(60)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    elseif _G.AutoRaid == false then
                        if _G.FreeBossRush == true and game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.BossRushFrame.BossRushFreeEntry.Text == "1 Free Entry Left" then
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("TeleportToBossRush")
                        elseif _G.BossRush == true and tonumber(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.BossRushFrame.BossRushEntryPassCount.Text) > 0 then
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("TeleportToBossRush")
                        elseif _G.AutoTraitTokens == true and _G.RaidOpened == false then
                            game:GetService("TeleportService"):Teleport(6990129309)
                        elseif _G.AutoSpeedRaid == true and game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.PlayButtonsFrame.Frame.SpeedRaidBanner.SpeedRaidBannerOpenText.Text == "Ready to enter" then
                            for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.SpeedRaidCharacterSelector.Shade.SpeedRaidCharacterInventoryScrollingFrame:GetChildren()) do
                                if v.ClassName == "ImageButton" then
                                    for ii,vv in pairs(v:GetChildren()) do
                                        if vv.ClassName == "ImageButton" and vv.Name == "CharacterImage" and vv.ImageTransparency == 0 then
                                            if v.Name ~= game:GetService("ReplicatedStorage")[game.Players.LocalPlayer.Name.."StatDisplay"].AssistCharacterName1.Value and v.Name ~= game:GetService("ReplicatedStorage")[game.Players.LocalPlayer.Name.."StatDisplay"].AssistCharacterName2.Value then
                                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("TeleportToShadowRaid",v.Name)
                                                wait(60)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    wait(60)
                end)
            end
        end)
    end)

    spawn(function()
        pcall(function()
            wait(tonumber(_G.CooldownOnlobby))
            wait(5)
            while wait() do
                pcall(function()
                    if _G.AutoPlay == true then
                        if _G.GetAllDimensionCharacter == true then
                            if not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Sakura") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Easy",["FriendsOnly"] = true,["MapName"] = "Titan Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Natsu") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Hard",["FriendsOnly"] = true,["MapName"] = "Titan Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Killua") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Nightmare",["FriendsOnly"] = true,["MapName"] = "Titan Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Asta") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Easy",["FriendsOnly"] = true,["MapName"] = "Demon Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Itadori") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Hard",["FriendsOnly"] = true,["MapName"] = "Demon Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Akaza") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Nightmare",["FriendsOnly"] = true,["MapName"] = "Demon Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Sasuke") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Easy",["FriendsOnly"] = true,["MapName"] = "Curse Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Gray") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Hard",["FriendsOnly"] = true,["MapName"] = "Curse Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Sukuna") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Nightmare",["FriendsOnly"] = true,["MapName"] = "Curse Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Rukia") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Easy",["FriendsOnly"] = true,["MapName"] = "Villain Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Shinra") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Hard",["FriendsOnly"] = true,["MapName"] = "Villain Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("All Might") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Nightmare",["FriendsOnly"] = true,["MapName"] = "Villain Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Zoro") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Easy",["FriendsOnly"] = true,["MapName"] = "Sword Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("AsunaCharacter") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Nightmare",["FriendsOnly"] = true,["MapName"] = "Sword Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Emiya Archer") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Easy",["FriendsOnly"] = true,["MapName"] = "Ghoul Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("KanekiCharacter") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Nightmare",["FriendsOnly"] = true,["MapName"] = "Ghoul Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Lancer") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Easy",["FriendsOnly"] = true,["MapName"] = "Fate Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Saber Alter Character") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Nightmare",["FriendsOnly"] = true,["MapName"] = "Fate Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Diablo") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Easy",["FriendsOnly"] = true,["MapName"] = "Slime Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Rimuru") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Nightmare",["FriendsOnly"] = true,["MapName"] = "Slime Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("PowerCharacter") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Nightmare",["FriendsOnly"] = true,["MapName"] = "Devil Dimension",["Hardcore"] = _G.Hardcore})
                            elseif not game:GetService("Players").LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory.Frame.CharacterInventoryFrame.CharacterInventoryScrollingFrame:FindFirstChild("Yamato") then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Nightmare",["FriendsOnly"] = true,["MapName"] = "Pirate Dimension",["Hardcore"] = _G.Hardcore})
                            elseif _G.MapSelection == "Infinite Mode" then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Infinite",["FriendsOnly"] = _G.FriendOnly,["MapName"] = "Infinite Mode",["Hardcore"] = false})
                            elseif _G.MapSelection == "TimeChallenge" then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("TeleportToTimeChallenge")
                            elseif _G.MapSelection ~= "Infinite Mode" then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = _G.Difficulty,["FriendsOnly"] = _G.FriendOnly,["MapName"] = _G.MapSelection,["Hardcore"] = _G.Hardcore})
                            end
                        else
                            if _G.MapSelection == "Infinite Mode" then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = "Infinite",["FriendsOnly"] = _G.FriendOnly,["MapName"] = "Infinite Mode",["Hardcore"] = false})
                            elseif _G.MapSelection == "TimeChallenge" then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("TeleportToTimeChallenge")
                            elseif _G.MapSelection ~= "Infinite Mode" then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("CreateRoom",{["Difficulty"] = _G.Difficulty,["FriendsOnly"] = _G.FriendOnly,["MapName"] = _G.MapSelection,["Hardcore"] = _G.Hardcore})
                            end
                        end
                        wait(1)
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("TeleportPlayers")
                        wait(60)
                    end
                end)
            end
        end)
    end)

    spawn(function()
        pcall(function()
            while task.wait() do
                pcall(function()
                    if _G.AutoSelectMap == true then
                        Lvl = game.Players.LocalPlayer.leaderstats.Level.Value
                        if Lvl > 0 and Lvl < 6 then
                            _G.Difficulty = "Easy"
                            _G.MapSelection = "Titan Dimension"
                        elseif Lvl > 5 and Lvl < 11 then
                            _G.Difficulty = "Hard"
                             _G.MapSelection = "Titan Dimension"
                        elseif Lvl > 10 and Lvl < 16 then
                            _G.Difficulty = "Nightmare"
                            _G.MapSelection = "Titan Dimension"
                        elseif Lvl > 15 and Lvl < 21 then
                            _G.Difficulty = "Easy"
                            _G.MapSelection = "Demon Dimension"
                        elseif Lvl > 20 and Lvl < 26 then
                            _G.Difficulty = "Hard"
                            _G.MapSelection = "Demon Dimension"
                        elseif Lvl > 25 and Lvl < 31 then
                            _G.Difficulty = "Nightmare"
                            _G.MapSelection = "Demon Dimension"
                        elseif Lvl > 30 and Lvl < 36 then
                            _G.Difficulty = "Easy"
                            _G.MapSelection = "Curse Dimension"
                        elseif Lvl > 35 and Lvl < 41 then
                            _G.Difficulty = "Hard"
                            _G.MapSelection = "Curse Dimension"
                        elseif Lvl > 40 and Lvl < 46 then
                            _G.Difficulty = "Nightmare"
                            _G.MapSelection = "Curse Dimension"
                        elseif Lvl > 45 and Lvl < 51 then
                            _G.Difficulty = "Easy"
                            _G.MapSelection = "Villain Dimension"
                        elseif Lvl > 50 and Lvl < 56 then
                            _G.Difficulty = "Hard"
                            _G.MapSelection = "Villain Dimension"
                        elseif Lvl > 55 and Lvl < 61 then
                            _G.Difficulty = "Nightmare"
                            _G.MapSelection = "Villain Dimension"
                        elseif Lvl > 60 and Lvl < 68 then
                            _G.Difficulty = "Easy"
                            _G.MapSelection = "Sword Dimension"
                        elseif Lvl > 67 and Lvl < 76 then
                            _G.Difficulty = "Nightmare"
                            _G.MapSelection = "Sword Dimension"
                        elseif Lvl > 75 and Lvl < 83 then
                            _G.Difficulty = "Easy"
                            _G.MapSelection = "Ghoul Dimension"
                        elseif Lvl > 82 and Lvl < 91 then
                            _G.Difficulty = "Nightmare"
                            _G.MapSelection = "Ghoul Dimension"
                        elseif Lvl > 90 and Lvl < 98 then
                            _G.Difficulty = "Easy"
                            _G.MapSelection = "Fate Dimension"
                        elseif Lvl > 97 and Lvl < 106 then
                            _G.Difficulty = "Nightmare"
                            _G.MapSelection = "Fate Dimension"
                        elseif Lvl > 105 and Lvl < 113 then
                            _G.Difficulty = "Easy"
                            _G.MapSelection = "Slime Dimension"
                        elseif Lvl > 112 and Lvl < 121 then
                            _G.Difficulty = "Nightmare"
                            _G.MapSelection = "Slime Dimension"
                        elseif Lvl > 120 and Lvl < 131 then
                            _G.Difficulty = "Nightmare"
                            _G.MapSelection = "Devil Dimension"
                        elseif Lvl > 130 then
                            _G.Difficulty = "Nightmare"
                            _G.MapSelection = "Pirate Dimension"
                        end
                    end
                end)
            end
        end)
    end)

    spawn(function()
        pcall(function()
            while wait(1) do
                pcall(function()
                    if _G.AutoEquipCharacter then
                        if isfile("Character_SLH.json") then
                            Config = game:GetService("HttpService"):JSONDecode(readfile("Character_SLH.json"))
                        end
                        for i,v in pairs(Config) do
                            if tostring(i) == "Character1" then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("EquipCharacter",tostring(v))
                                print("Character1 : "..tostring(v))
                            elseif tostring(i) == "Character2" then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("EquipCharacterAssist",tostring(v),1)
                                print("Character2 : "..tostring(v))
                            elseif tostring(i) == "Character3" then
                                game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("EquipCharacterAssist",tostring(v),2)
                                print("Character3 : "..tostring(v))
                            end
                        end
                        wait(6000)
                    end
                end)
            end
        end)
    end)

    spawn(function()
        pcall(function()
            while wait(1) do
                pcall(function()
                    if _G.Replay == true then
                        if game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.ResultUI.Visible == true then
                            wait(1)
                            if _G.RaidOpened == true and _G.StopReplay == true then
                            elseif game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.ResultUI.RetryDungeonButton.Visible == true and game:GetService("Players").LocalPlayer.PlayerGui.BattleGui.CenterUIFrame.WaveClearClearText.Text ~= "1" then
                            elseif game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.ResultUI.RetryDungeonButton.Visible == true and game:GetService("Players").LocalPlayer.PlayerGui.BattleGui.CenterUIFrame.WaveClearClearText.Text == "1" then
                                game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("RetryDungeon")
                            end
                        end
                    end
                end)
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while wait(1) do
                pcall(function()
                    if _G.SendIfLevelUp == true then
                        repeat wait(1) until game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.LevelUpImage.Visible == true
                        function webhook(data)
                            local request = http_request or request or HttpPost or syn.request
                            request({Url = _G.UrlWebhook,
                            Method = "POST",
                            Headers = {["Content-Type"] = "application/json"},
                            Body = game:GetService("HttpService"):JSONEncode({embeds = {data}, content = nil})})
                        end
                        local data = {
                            ["title"] = "**".."Level UP!".."**",
                            ["type"] = "rich",
                            ["thumbnail"] = {
                                ["url"] = "https://media.discordapp.net/attachments/1109186199429599425/1110915284732231780/SLH.png"
                            },
                            ["description"] = "Player: ".."||".."**"..game.Players.LocalPlayer.Name.."**".."||"..
                            "\n".."Level:".."**"..game.Players.LocalPlayer.leaderstats.Level.Value.."**",
                            ["fields"] = {},
                            ["timestamp"] = DateTime.now():ToIsoDate()
                        }
                        webhook(data)
                        wait(60)
                    end
                end)
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while wait(1) do
                pcall(function()
                    if _G.SendDropsResult == true then 
                        repeat wait(1) until game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.RaidResultUI.Visible == true or game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.ResultUI.Visible == true
                        wait(5)
                        item = {}
                        card = {}
                        itemnum = {}
                        if game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.ResultUI.RewardFrame.RewardGridFrame:FindFirstChildOfClass("ImageLabel") then
                            for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.ResultUI.RewardFrame.RewardGridFrame:GetChildren()) do
                                if not v:IsA("UIGridLayout") then
                                    if tonumber(v.LevelReq.Text) then
                                        if not item[v.Name] then
                                            item[v.Name] = {}
                                        end
                                        table.insert(item[v.Name] , tonumber(v.LevelReq.Text))
                                    else
                                        if not card[v.Name] then
                                            card[v.Name] = {}
                                        end
                                        if not v:FindFirstChild("Gradient") then
                                            if not card[v.Name]["Rarity"] then
                                                card[v.Name]["Rarity"] = "[Common]"
                                            end
                                        elseif tostring(v.Gradient.Color) == "0 0.352941 1 0.407843 0 1 0.513726 1 0.635294 0 " then
                                            if not card[v.Name]["Rarity"] then
                                                card[v.Name]["Rarity"] = "[UnCommon]"
                                            end
                                        elseif tostring(v.Gradient.Color) == "0 0 0.666667 1 0 1 0.6 0.780392 1 0 " then
                                            if not card[v.Name]["Rarity"] then
                                                card[v.Name]["Rarity"] = "[Rare]"
                                            end
                                        elseif tostring(v.Gradient.Color) == "0 0.666667 0.333333 1 0 1 0.352941 0.494118 1 0 " then
                                            if not card[v.Name]["Rarity"] then
                                                card[v.Name]["Rarity"] = "[Epic]"
                                            end
                                        elseif tostring(v.Gradient.Color) == "0 1 0.380392 0.392157 0 1 1 0.639216 0.278431 0 " then
                                            if not card[v.Name]["Rarity"] then
                                                card[v.Name]["Rarity"] = "[Legend]"
                                            end
                                        else
                                            if not card[v.Name]["Rarity"] then
                                                card[v.Name]["Rarity"] = "[Mythic]"
                                            end
                                        end
                                        table.insert(card[v.Name] , card[v.Name]["Rarity"])
                                    end
                                end
                            end
                        elseif not game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.ResultUI.RewardFrame.RewardGridFrame:FindFirstChildOfClass("ImageLabel") then
                            for o,a in pairs(game:GetService("Players").LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.RaidResultUI.Frame:GetChildren()) do
                                if a:FindFirstChild("RaidRewardGridFrame") then
                                    for i,v in pairs(a.RaidRewardGridFrame:GetChildren()) do
                                        if not v:IsA("UIGridLayout") then
                                            if tonumber(v.LevelReq.Text) then
                                                if not item[v.Name] then
                                                    item[v.Name] = {}
                                                end
                                                table.insert(item[v.Name] , tonumber(v.LevelReq.Text))
                                            else
                                                if not card[v.Name] then
                                                    card[v.Name] = {}
                                                end
                                                if not v:FindFirstChild("Gradient") then
                                                    if not card[v.Name]["Rarity"] then
                                                        card[v.Name]["Rarity"] = "[Common]"
                                                    end
                                                elseif tostring(v.Gradient.Color) == "0 0.352941 1 0.407843 0 1 0.513726 1 0.635294 0 " then
                                                    if not card[v.Name]["Rarity"] then
                                                        card[v.Name]["Rarity"] = "[UnCommon]"
                                                    end
                                                elseif tostring(v.Gradient.Color) == "0 0 0.666667 1 0 1 0.6 0.780392 1 0 " then
                                                    if not card[v.Name]["Rarity"] then
                                                        card[v.Name]["Rarity"] = "[Rare]"
                                                    end
                                                elseif tostring(v.Gradient.Color) == "0 0.666667 0.333333 1 0 1 0.352941 0.494118 1 0 " then
                                                    if not card[v.Name]["Rarity"] then
                                                        card[v.Name]["Rarity"] = "[Epic]"
                                                    end
                                                elseif tostring(v.Gradient.Color) == "0 1 0.380392 0.392157 0 1 1 0.639216 0.278431 0 " then
                                                    if not card[v.Name]["Rarity"] then
                                                        card[v.Name]["Rarity"] = "[Legend]"
                                                    end
                                                else
                                                    if not card[v.Name]["Rarity"] then
                                                        card[v.Name]["Rarity"] = "[Mythic]"
                                                    end
                                                end
                                                table.insert(card[v.Name] , card[v.Name]["Rarity"])
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        for i,v in pairs(item) do
                            local numbers = v
                            local sum = 0
                            for i = 1, #numbers do
                                sum = sum + numbers[i]
                            end
                            text = tostring(i)..": x"..tostring(sum)
                            table.insert(itemnum,text)
                        end
                        for i,v in pairs(card) do
                            text = tostring(table.concat(v[1])).." "..tostring(i)..": x"..tostring(#v)
                            table.insert(itemnum,text)
                        end
                        function webhook(data)
                            local request = http_request or request or HttpPost or syn.request
                            request({
                            Url = _G.UrlWebhook,
                            Method = "POST",
                            Headers = {["Content-Type"] = "application/json"},
                            Body = game:GetService("HttpService"):JSONEncode({embeds = {data}, content = nil})})
                        end
                        local scripttime = game.Workspace.DistributedGameTime
                        local seconds = scripttime%60
                        local minutes = math.floor(scripttime/60%60)
                        local hours = math.floor(scripttime/3600)
                        local data = {
                        ["title"] = "SmellLikeHacker Hub",
                        ["type"] = "rich",
                        ["thumbnail"] = {
                        ["url"] = "https://media.discordapp.net/attachments/1109186199429599425/1110915284732231780/SLH.png"
                        },
                        ["description"] = "**".."Player: ".."**".."||".."**"..game.Players.LocalPlayer.Name.."**".."||"..
                        "\n".."**".."TimeEnd".."**".." (".."**"..string.format("%.0f:%.0f", minutes, seconds).."**"..")"..
                        "\n"..""..
                        "\n".."**".."Drops:".."**"..
                        "\n".."```ini"..
                        "\n".."[+] "..table.concat(itemnum,"\n[+] ")..
                        "\n".."```",
                        ["fields"] = {},
                        ["timestamp"] = DateTime.now():ToIsoDate()}
                        webhook(data)
                        wait(600)
                    end
                end)
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while task.wait() do
                if game:GetService("Players").LocalPlayer.DevCameraOcclusionMode ~= "Invisicam" then
                    game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Invisicam"
                end
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while task.wait() do
                pcall(function()
                    if _G.DontNoclip == true then
                        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = true
                            end
                        end
                    else
                        if _G.DodgeSkill == true and game.PlaceId ~= 6938803436 and game.PlaceId ~= 7274690025 and game.PlaceId ~= 7338881230 then
                            if _G.Automob == false and _G.DodgeSkill == true then
                                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                                    if v:IsA("BasePart") then
                                        v.CanCollide = true
                                    end
                                end
                            elseif workspace.Folders.Debris:FindFirstChild("DodgePart") then
                                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                                    if v:IsA("BasePart") then
                                        v.CanCollide = true
                                    end
                                end
                            elseif not workspace.Folders.Debris:FindFirstChild("DodgePart") then
                                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                                    if v:IsA("BasePart") then
                                        v.CanCollide = false
                                    end
                                end
                            end
                        elseif _G.DodgeSkill == false and game.PlaceId ~= 6938803436 and game.PlaceId ~= 7274690025 and game.PlaceId ~= 7338881230 then
                            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end)
        
    spawn(function()
        pcall(function()
            while task.wait() do
                pcall(function()
                    if _G.BackToLobbyIfGotExploitsDetected then
                        if game.ReplicatedStorage[game.Players.LocalPlayer.Name .. "StatDisplay"].ExploitsDetected.Value == true then
                            game:GetService("TeleportService"):Teleport(6938803436)
                        end
                    end
                end)
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while task.wait() do
                pcall(function()
                    if _G.HideName then
                        for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
                            if v.ClassName == "BillboardGui" then
                                v:Destroy()
                            end
                        end
                    end
                end)
            end
        end)
    end)

    spawn(function()
        pcall(function()
            workspace.Folders.Debris.ChildAdded:Connect(function(v)
                pcall(function()
                    if table.find({"telegraph"},v.Name:lower()) and v.Material ~= Enum.Material.Neon and _G.AutoDodgeSkill == true then
                        local op = v.Material
                        local a = v:Clone()
                        local side = math.clamp(tonumber(_G.SizeDodgePart),0,10)
                        local Sizeto = v.Size + Vector3.new(side,tonumber(_G.SizeDodgePartY),side)
                        a.Size = Vector3.new(0,0,v.Size.Z)
                        if v.ClassName == "MeshPart" then
                            a.Size = Vector3.new(0,0,100)
                            Sizeto = v.Size + Vector3.new(side,side,100)
                        end
                        game:GetService("TweenService"):Create(a,TweenInfo.new(tonumber(_G.TweenDodgePart)),{Size = Sizeto}):Play()
                        a.CFrame = v.CFrame + Vector3.new(0,0,0)
                        a.Anchored = true
                        a.Transparency = tonumber(_G.DodgePartTransparency)
                        a.CanCollide = true
                        a.Name = "DodgePart"
                        a.Parent = v.Parent
                        repeat wait() until not v.Parent
                        a:Destroy()
                    end
                end)
            end)
        end)
    end)

    spawn(function()
        pcall(function()
            while wait(2) do
                pcall(function()
                    if _G.AutoRedeemAllCode == true then
                        Code = {}
                        for i,v in pairs(workspace.Leaderboards.MilestoneBoard.Center.Surface.ScrollingFrame:GetChildren()) do
                            if v.ClassName == "Frame" then
                                Code = {v.MilestoneCode.Text}
                            end
                        end
                        for i,v in pairs(Code) do
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer("RedeemPromoCode",v)
                        end
                        wait(600)
                    end
                end)
            end
        end)
    end)

    local TabSetting = Window:CreateTab("Misc")
    local Setting1 = TabSetting:CreateSector("Section1", "left")
    Setting1:AddTextbox("Speed" , "16" , function(w)
        _G.Speed = w
    end)
    Setting1:AddTextbox("Jump" , "50" , function(w)
        _G.Jump = w
    end)
    Setting1:AddToggle("Raid Challenge", false , function(t)
        _G.AutoTraitTokens = t
    end)
    Setting1:AddToggle("WalkSpeed", false, function(t)
		_G.WalkSpeed = t
	end)
    Setting1:AddToggle("JumpPower", false, function(t)
		_G.JumpPower = t
	end)
    Setting1:AddToggle("Ctrl+ClickTP", false, function(t)
		_G.CtrlClickTP = t
	end)
    Setting1:AddToggle("CloseGuiAfterExecute", false, function(o)
    	_G.CloseGuiAfterExecute = o
    end)
	Setting1:AddButton("Rejoin" , function()
	    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
	end)
	Setting1:AddButton("HopServer" , function()
	    hopserver()
	end)
	Setting1:AddButton("FireProximityPrompt" , function()
        for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                fireproximityprompt(v)
            end
        end
	end)
	Setting1:AddButton("InstantProximityPrompt" , function()
        game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
            prompt.HoldDuration = 0
        end)
	end)
    spawn(function()
    pcall(function()
        while task.wait() do
            pcall(function()
                if _G.WalkSpeed then
                    pcall(function()
                        game.Players.LocalPlayer.character.Humanoid.WalkSpeed = tonumber(_G.Speed)
                    end)
                end
            end)
        end
    end)
    end)
    spawn(function()
    pcall(function()
        while task.wait() do
            pcall(function()
                if _G.JumpPower then
                    pcall(function()
                        game.Players.LocalPlayer.character.Humanoid.JumpPower = tonumber(_G.Jump)
                    end)
                end
            end)
        end
    end)
    end)
    function ClickTP()
        local UIS = game:GetService("UserInputService")
        local Player = game.Players.LocalPlayer
        local Mouse = Player:GetMouse()
        function GetCharacter()
        return game.Players.LocalPlayer.Character
        end
        function Teleport(pos)
        local Char = GetCharacter()
        if Char then
            Char:MoveTo(pos)
        end
        end
        UIS.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) and _G.CtrlClickTP == true then
                Teleport(Mouse.Hit.p)
            end
        end)
    end
	local Setting2 = TabSetting:CreateSector("Section2", "Right")
    Setting2:AddDropdown("StatGuiPosition", {"Center","Left","Right"}, "Right", false, function(h)
        game:GetService("CoreGui").StatBySmell.Frame.UIListLayout.HorizontalAlignment = h
    end)
    Setting2:AddDropdown("CreditGuiPosition", {"Center","Left","Right"}, "Left", false, function(h)
        game:GetService("CoreGui").Credit.FRame.UIListLayout.HorizontalAlignment = h
    end)
    Setting2:AddToggle("StatGui", true, function(o)
    	game:GetService("CoreGui").StatBySmell.Enabled = o
    end)
    Setting2:AddToggle("CreditGui", true, function(o)
    	game:GetService("CoreGui").Credit.Enabled = o
    end)
	Setting2:AddToggle("RejoinIfGotKick", false, function(o)
    	_G.rejoinKick = o
    end)

    spawn(function()
        getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(Kick)
            if ((Kick.Name == "ErrorPrompt") and Kick:FindFirstChild("MessageArea") and Kick.MessageArea:FindFirstChild("ErrorFrame")) then
                if _G.rejoinKick == true then
                    game:GetService("TeleportService"):Teleport(6938803436)
                end
            end
        end)
    end)
    Setting2:AddToggle("BootsWhitescreen", false, function(o)
    	_G.BootsWhitescreen = o
    end)
    Setting2:AddButton("infiniteyield" , function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
    Setting2:AddButton("ResetCamera" , function()
        game:GetService("Workspace").CurrentCamera:Destroy()
        wait(.1)
        game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
        game:GetService("Workspace").CurrentCamera.CameraType = "Custom"
        game:GetService("Players").LocalPlayer.CameraMinZoomDistance = .5
        game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 100000
        game:GetService("Players").LocalPlayer.CameraMode = "Classic"
    end)
    Setting2:AddButton("CopyDiscordLink" , function()
        setclipboard("https://discord.gg/48geaWzacy")
    end)
    Setting2:AddButton("JoinDiscord" , function()
        request = http_request or request or HttpPost or syn.request
        request({Url = "http://127.0.0.1:6463/rpc?v=1",Method = "POST",Headers = {["Content-Type"] = "application/json",["origin"] = "https://discord.com",},Body = game:GetService("HttpService"):JSONEncode({["args"] = {["code"] = "48geaWzacy",},["cmd"] = "INVITE_BROWSER",["nonce"] = "."})})
    end)

    spawn(function()
    pcall(function()
        while wait() do
            pcall(function()
                if _G.CloseGuiAfterExecute then
                    pcall(function()
                        wait()
                        for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
                            if v:FindFirstChild("main") then
                                v.main.Visible = not v.main.Visible
                            end
                        end
                        wait(99999999999999999999999)
                    end)
                end
            end)
        end
    end)
    end)
    spawn(function()
    pcall(function()
    	while wait() do
    		if _G.BootsWhitescreen then
    		    wait()
                local v0;local v1=game;local v2=v1.Workspace;local v3=v1.Lighting;local v4=v2.Terrain;v4.WaterWaveSize=0;v4.WaterWaveSpeed=0;v4.WaterReflectance=0;v4.WaterTransparency=0;v3.GlobalShadows=false;v3.FogEnd=8999999488;v3.Brightness=0;settings().Rendering.QualityLevel="Level01";for v18,v19 in pairs(v1:GetDescendants()) do if (v19:IsA("Part") or v19:IsA("Union") or v19:IsA("CornerWedgePart") or v19:IsA("TrussPart")) then v19.Material="Plastic";v19.Reflectance=0;elseif (v19:IsA("Decal") or (v19:IsA("Texture") and v0)) then v19.Transparency=1;elseif (v19:IsA("ParticleEmitter") or v19:IsA("Trail")) then v19.Lifetime=NumberRange.new(0);elseif v19:IsA("Explosion") then v19.BlastPressure=1;v19.BlastRadius=1;elseif (v19:IsA("Fire") or v19:IsA("SpotLight") or v19:IsA("Smoke")) then v19.Enabled=false;elseif v19:IsA("MeshPart") then v19.Material="Plastic";v19.Reflectance=0;v19.TextureID=10385902758728956;end end for v20,v21 in pairs(v3:GetChildren()) do if (v21:IsA("BlurEffect") or v21:IsA("SunRaysEffect") or v21:IsA("ColorCorrectionEffect") or v21:IsA("BloomEffect") or v21:IsA("DepthOfFieldEffect")) then v21.Enabled=false;end end local v13=game:GetService("UserInputService");local v14=game:GetService("RunService");local v15=function()v14:Set3dRenderingEnabled(false);return;end;local v16=function()v14:Set3dRenderingEnabled(true);return;end;local v17=function()v13.WindowFocusReleased:Connect(v15);v13.WindowFocused:Connect(v16);return;end;v17();
    			wait(99999999999999999999999)
    		end
    	end
    end)
    end)
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		game:GetService("VirtualUser"):CaptureController()
		game:GetService("VirtualUser"):ClickButton2(Vector2.new())
	end)
    ClickTP()
	library:ConfigSystem("AnimeDimensions"):Load()
    while wait(1) do
    	pcall(function()
    		library:ConfigSystem("AnimeDimensions"):Save()
    	end)
	end
end
