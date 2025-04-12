local function a()
    if not IrisNotificationUserMrJack then
        local b = {}
        local c = true
        local d = game:GetService("TweenService")
        
        -- Configurações globais do sistema de notificações
        local CONFIG = {
            MAX_NOTIFICATIONS = 5, -- Máximo de notificações visíveis ao mesmo tempo
            NOTIFICATION_HEIGHT = 70, -- Altura padrão de cada notificação
            NOTIFICATION_SPACING = 5, -- Espaçamento entre notificações
            QUEUE_ENABLED = true, -- Habilita sistema de fila para notificações
        }
        
        -- Fila de notificações pendentes
        local notificationQueue = {}
        
        local function e()
            local f = {
                Duration = 4,
                Position = "BottomRight", -- Nova opção: BottomRight, BottomLeft, TopRight, TopLeft, Center
                TitleSettings = {
                    BackgroundColor3 = Color3.fromRGB(200, 200, 200),
                    TextColor3 = Color3.fromRGB(240, 240, 240),
                    TextScaled = true,
                    TextWrapped = true,
                    TextSize = 18,
                    Font = Enum.Font.SourceSansBold,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center
                },
                DescriptionSettings = {
                    BackgroundColor3 = Color3.fromRGB(200, 200, 200),
                    TextColor3 = Color3.fromRGB(240, 240, 240),
                    TextScaled = true,
                    TextWrapped = true,
                    TextSize = 14,
                    Font = Enum.Font.SourceSans,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top
                },
                IconSettings = {
                    BackgroundTransparency = 1,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    RoundIcon = false, -- Nova opção para ícones redondos
                    IconScale = 1, -- Nova opção para escala do ícone
                },
                GradientSettings = {
                    GradientEnabled = true,
                    SolidColorEnabled = false,
                    SolidColor = Color3.fromRGB(0, 255, 255),
                    Retract = false,
                    Extend = false,
                    -- Novas opções para gradiente
                    Colors = {
                        Color3.fromRGB(255, 8, 231),
                        Color3.fromRGB(64, 0, 255)
                    }
                },
                Main = {
                    BorderColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                    BackgroundTransparency = 0.05,
                    Rounding = true,
                    BorderSizePixel = 1
                },
                -- Novas opções de animação
                Animation = {
                    InStyle = "Slide", -- Slide, Fade, Scale
                    OutStyle = "Slide", -- Slide, Fade, Scale
                    InDuration = 0.4,
                    OutDuration = 0.4,
                    EasingStyle = Enum.EasingStyle.Quad,
                    EasingDirection = Enum.EasingDirection.Out
                }
            }
            return f
        end
        
        local function g(h)
            local i = ""
            local j = {"{","}","[","]","(",")","/","\\","'",'"',"`","~",",","",":",".","<",">","@","#","$","%","1","2","3","4","5","6","7","8","9","0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
            for k = 1, h do
                i = i .. j[math.random(#j)]
            end
            return i
        end
        
        local l = g(8)
        local m = Instance.new("Folder")
        
        -- Função para calcular posição com base nas preferências
        local function calculatePosition(position, index, total)
            local posOffset = (CONFIG.NOTIFICATION_HEIGHT + CONFIG.NOTIFICATION_SPACING) * (index - 1)
            
            if position == "BottomRight" then
                return UDim2.new(1, -280, 1, -posOffset - CONFIG.NOTIFICATION_HEIGHT - 20)
            elseif position == "BottomLeft" then
                return UDim2.new(0, 10, 1, -posOffset - CONFIG.NOTIFICATION_HEIGHT - 20)
            elseif position == "TopRight" then
                return UDim2.new(1, -280, 0, posOffset + 20)
            elseif position == "TopLeft" then
                return UDim2.new(0, 10, 0, posOffset + 20)
            elseif position == "Center" then
                -- Centralizado na tela com offset baseado no número de notificações
                local centerOffset = (total * (CONFIG.NOTIFICATION_HEIGHT + CONFIG.NOTIFICATION_SPACING)) / 2
                return UDim2.new(0.5, -135, 0.5, -centerOffset + posOffset)
            else
                -- Default para BottomRight
                return UDim2.new(1, -280, 1, -posOffset - CONFIG.NOTIFICATION_HEIGHT - 20)
            end
        end
        
        -- Função para processar a fila de notificações
        local function processNotificationQueue()
            if #notificationQueue > 0 and #m:GetChildren() < CONFIG.MAX_NOTIFICATIONS then
                local nextNotif = table.remove(notificationQueue, 1)
                b.InsertNotification(nextNotif[1], nextNotif[2], nextNotif[3], nextNotif[4], nextNotif[5], nextNotif[6])
            end
        end
        
        b.CreateNotification = function(n, o, p, q)
            local r = q.Duration
            local s = q.TitleSettings
            local t = q.DescriptionSettings
            local u = q.IconSettings
            local v = q.GradientSettings
            local w = q.Main
            local animConfig = q.Animation or {InStyle = "Slide", OutStyle = "Slide", InDuration = 0.4, OutDuration = 0.4}
            local position = q.Position or "BottomRight"
            
            m.Name = "NotificationFolder_" .. l
            m.Parent = game:GetService("CoreGui")
            
            local x = Instance.new("ScreenGui")
            local y = (syn and syn.protect_gui) or getgenv().get_hidden_gui or getgenv().protect_gui
            if y then
                y(x)
            end
            
            local z = Instance.new("Frame")
            local A = Instance.new("ImageLabel")
            local B = Instance.new("UIAspectRatioConstraint")
            local C = Instance.new("TextLabel")
            local D = Instance.new("TextLabel")
            local E = Instance.new("UICorner")
            local F = Instance.new("Frame")
            local G = Instance.new("UIGradient")
            
            x.Name = g(15)
            x.Parent = m
            x.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            x.Enabled = true
            
            z.Name = "_Template"
            z.Parent = x
            z.BackgroundColor3 = w.BackgroundColor3
            z.BackgroundTransparency = w.BackgroundTransparency
            z.BorderColor3 = w.BorderColor3
            z.Size = UDim2.new(0, 270, 0, 64)
            z.ZIndex = 9
            z.Visible = false
            
            A.Name = "Icon"
            A.Parent = z
            A.BackgroundColor3 = u.BackgroundColor3
            A.BackgroundTransparency = u.BackgroundTransparency
            A.Position = UDim2.new(0.0277603213, 0, 0.182097465, 0)
            A.Size = UDim2.new(0, 40 * u.IconScale, 0, 40 * u.IconScale)
            A.Image = p
            
            -- Adiciona cantos arredondados para ícones se a configuração estiver ativada
            if u.RoundIcon then
                local iconCorner = Instance.new("UICorner")
                iconCorner.CornerRadius = UDim.new(1, 0)
                iconCorner.Parent = A
            end
            
            B.Parent = A
            
            C.Name = "Title"
            C.Parent = z
            C.BackgroundTransparency = 1
            C.Position = UDim2.new(0, 63, 0, 2)
            C.Size = UDim2.new(0, 129, 0, 21)
            C.Text = n
            C.TextColor3 = s.TextColor3
            C.TextScaled = s.TextScaled
            C.TextSize = s.TextSize
            C.TextWrapped = s.TextWrapped
            C.TextXAlignment = s.TextXAlignment
            C.TextYAlignment = s.TextYAlignment
            C.Font = s.Font
            C.BackgroundColor3 = s.BackgroundColor3
            
            D.Parent = z
            D.BackgroundColor3 = t.BackgroundColor3
            D.BackgroundTransparency = 1
            D.Position = UDim2.new(0, 63, 0, 23)
            D.Size = UDim2.new(0, 178, 0, 35)
            D.Text = o
            D.TextColor3 = t.TextColor3
            D.TextScaled = t.TextScaled
            D.TextSize = t.TextSize
            D.TextWrapped = t.TextWrapped
            D.TextXAlignment = t.TextXAlignment
            D.TextYAlignment = t.TextYAlignment
            D.Font = t.Font
            D.BackgroundColor3 = t.BackgroundColor3
            
            if w.Rounding then
                E.Parent = z
            end
            
            F.Parent = z
            F.BorderSizePixel = 0
            F.Position = UDim2.new(0.0148148146, 0, 0.9375, 0)
            F.Size = UDim2.new(0, 263, 0, 3)
            F.Visible = false
            
            -- Configura gradiente com novas opções
            if v.GradientEnabled then
                F.Visible = true
                -- Cria sequência de cores a partir do array de cores fornecido
                local colorSeq = {}
                if v.Colors and #v.Colors > 0 then
                    for i, col in ipairs(v.Colors) do
                        table.insert(colorSeq, ColorSequenceKeypoint.new((i-1)/(#v.Colors-1), col))
                    end
                else
                    -- Cores padrão se nenhuma for fornecida
                    colorSeq = {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 8, 231)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(64, 0, 255))
                    }
                end
                G.Color = ColorSequence.new(colorSeq)
                G.Parent = F
            elseif v.SolidColorEnabled then
                G:Destroy()
                F.BackgroundColor3 = v.SolidColor
                F.Visible = true
            end
            
            return {z, r, v.Retract, v.Extend, position, animConfig}
        end
        
        b.InsertNotification = function(x, r, H, I, position, animConfig)
            if CONFIG.QUEUE_ENABLED and #m:GetChildren() >= CONFIG.MAX_NOTIFICATIONS then
                -- Adicionar à fila se atingimos o máximo
                table.insert(notificationQueue, {x, r, H, I, position, animConfig})
                return
            end
            
            position = position or "BottomRight"
            animConfig = animConfig or {InStyle = "Slide", OutStyle = "Slide", InDuration = 0.4, OutDuration = 0.4}
            
            repeat
                game:GetService("RunService").Heartbeat:Wait()
            until c
            
            -- Calcula a posição com base nas preferências e no número atual de notificações
            local J = calculatePosition(position, #m:GetChildren(), CONFIG.MAX_NOTIFICATIONS)
            local K
            
            -- Define a posição inicial baseada na animação de entrada
            if animConfig.InStyle == "Slide" then
                if position:find("Right") then
                    K = UDim2.new(1, 0, J.Y.Scale, J.Y.Offset)
                elseif position:find("Left") then
                    K = UDim2.new(0, -270, J.Y.Scale, J.Y.Offset)
                elseif position == "Center" then
                    K = UDim2.new(0.5, -135, 0, -100)
                end
            elseif animConfig.InStyle == "Fade" then
                K = J
                x.BackgroundTransparency = 1
                for _, child in pairs(x:GetChildren()) do
                    if child:IsA("TextLabel") or child:IsA("ImageLabel") then
                        child.BackgroundTransparency = 1
                        child.TextTransparency = 1
                    end
                end
            elseif animConfig.InStyle == "Scale" then
                K = J
                x.Size = UDim2.new(0, 0, 0, 0)
                x.Position = UDim2.new(J.X.Scale, J.X.Offset + 135, J.Y.Scale, J.Y.Offset + 32)
            end
            
            x.Position = K
            x.Visible = true
            
            local L = TweenInfo.new(
                animConfig.InDuration, 
                animConfig.EasingStyle or Enum.EasingStyle.Quad, 
                animConfig.EasingDirection or Enum.EasingDirection.Out
            )
            local M = TweenInfo.new(r)
            
            -- Aplica a animação de entrada
            if animConfig.InStyle == "Slide" then
                d:Create(x, L, {Position = J}):Play()
            elseif animConfig.InStyle == "Fade" then
                d:Create(x, L, {BackgroundTransparency = w.BackgroundTransparency or 0.05}):Play()
                for _, child in pairs(x:GetChildren()) do
                    if child:IsA("TextLabel") then
                        d:Create(child, L, {TextTransparency = 0, BackgroundTransparency = 1}):Play()
                    elseif child:IsA("ImageLabel") then
                        d:Create(child, L, {ImageTransparency = 0, BackgroundTransparency = 1}):Play()
                    end
                end
            elseif animConfig.InStyle == "Scale" then
                d:Create(x, L, {Size = UDim2.new(0, 270, 0, 64), Position = J}):Play()
            end
            
            if H then
                d:Create(x.Frame, M, {Size = UDim2.new(0, 0, 0, 3)}):Play()
            elseif I then
                x.Frame.Size = UDim2.new(0, 0, 0, 3)
                d:Create(x.Frame, M, {Size = UDim2.new(0, 263, 0, 3)}):Play()
            end
            
            task.wait(r)
            c = false
            
            -- Configura a animação de saída
            local outTween
            if animConfig.OutStyle == "Slide" then
                local outPos
                if position:find("Right") then
                    outPos = UDim2.new(1, 0, J.Y.Scale, J.Y.Offset)
                elseif position:find("Left") then
                    outPos = UDim2.new(0, -270, J.Y.Scale, J.Y.Offset)
                elseif position == "Center" then
                    outPos = UDim2.new(0.5, -135, 0, -100)
                end
                outTween = d:Create(x, TweenInfo.new(animConfig.OutDuration, animConfig.EasingStyle, animConfig.EasingDirection), {Position = outPos})
            elseif animConfig.OutStyle == "Fade" then
                outTween = d:Create(x, TweenInfo.new(animConfig.OutDuration, animConfig.EasingStyle, animConfig.EasingDirection), {BackgroundTransparency = 1})
                for _, child in pairs(x:GetChildren()) do
                    if child:IsA("TextLabel") then
                        d:Create(child, TweenInfo.new(animConfig.OutDuration), {TextTransparency = 1}):Play()
                    elseif child:IsA("ImageLabel") then
                        d:Create(child, TweenInfo.new(animConfig.OutDuration), {ImageTransparency = 1}):Play()
                    end
                end
            elseif animConfig.OutStyle == "Scale" then
                outTween = d:Create(x, TweenInfo.new(animConfig.OutDuration, animConfig.EasingStyle, animConfig.EasingDirection), 
                {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(J.X.Scale, J.X.Offset + 135, J.Y.Scale, J.Y.Offset + 32)})
            end
            
            outTween.Completed:Connect(function(O)
                if (O == Enum.PlaybackState.Completed) then
                    pcall(function()
                        x.Parent:Destroy()
                        
                        -- Reposiciona as notificações restantes
                        for i, Q in ipairs(m:GetChildren()) do
                            local template = Q["_Template"]
                            local notifPos = calculatePosition(template.CustomPosition or position, i, #m:GetChildren())
                            d:Create(template, TweenInfo.new(0.25), {Position = notifPos}):Play()
                        end
                    end)
                    c = true
                    
                    -- Processa a próxima notificação na fila, se houver
                    task.spawn(processNotificationQueue)
                end
            end)
            outTween:Play()
        end
        
        b.Notify = function(...)
            coroutine.wrap(function(...)
                local R = {...}
                assert(#R < 5, "Error: Too many arguments for Notify | Expected 3 : 4")
                assert(#R > 2, "Error: Too little arguments for Notify | Expected 3 : 4")
                for S, T in next, R do
                    if (S ~= 4) then
                        R[S] = tostring(T)
                    end
                end
                if (#R == 3) then
                    R[4] = e()
                end
                R[5] = e()
                if (type(R[4]) ~= "table") then
                    warn("Settings table malformed, please make sure you have the exact table copied! { ARG4_INVALID_TABLE }")
                    R[4] = e()
                end
                for U, V in next, R[4] do
                    if (type(V) == "table") then
                        for W, X in next, V do
                            R[5][U][W] = X
                        end
                    else
                        R[5][U] = V
                    end
                end
                local Y = b.CreateNotification(R[1], R[2], R[3], R[5])
                b.InsertNotification(Y[1], Y[2], Y[3], Y[4], Y[5], Y[6])
            end)(...)
        end
        
        local Z = Instance.new("Folder")
        local _ = g(7)
        local function a0()
            local a1 = {Duration=5,TitleSettings={Enabled=true,BackgroundColor3=Color3.fromRGB(200, 200, 200),TextColor3=Color3.fromRGB(240, 240, 240),TextScaled=true,TextWrapped=true,TextSize=18,Font=Enum.Font.SourceSansBold,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center},DescriptionSettings={BackgroundColor3=Color3.fromRGB(200, 200, 200),TextColor3=Color3.fromRGB(240, 240, 240),TextScaled=true,TextWrapped=true,TextSize=14,Font=Enum.Font.SourceSans,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center}}
            return a1
        end
        b.CreateWallNotification = function(a2, a3, q)
            local r = q.Duration
            local s = q.TitleSettings
            local t = q.DescriptionSettings
            Z.Name = "WallNotificationFolder_" .. _
            Z.Parent = game:GetService("CoreGui")
            local a4 = Instance.new("ScreenGui")
            if (syn and syn.protect_gui) then
                syn.protect_gui(a4)
            elseif get_hidden_gui then
                get_hidden_gui(a4)
            end
            local a5 = Instance.new("Frame")
            local C = Instance.new("TextLabel")
            local a6 = Instance.new("TextLabel")
            a4.Name = "Notification"
            a4.Parent = Z
            a4.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            a4.Enabled = true
            a5.Name = "Main"
            a5.Parent = a4
            a5.AnchorPoint = Vector2.new(0.5, 0.5)
            a5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            a5.BackgroundTransparency = 0.2
            a5.BorderColor3 = Color3.fromRGB(255, 255, 255)
            a5.Position = UDim2.new(0.5, 0, 0.5, 0)
            a5.Size = UDim2.new(0, 0, 0.947604775, 0)
            C.Name = "Title"
            C.Parent = a5
            C.BackgroundTransparency = 1
            C.Position = UDim2.new(0.267834008, 0, 0.0142180091, 0)
            C.Size = UDim2.new(0.463035017, 0, 0.0805396363, 0)
            C.Text = a2
            C.TextColor3 = s.TextColor3
            C.TextScaled = s.TextScaled
            C.TextSize = s.TextSize
            C.TextWrapped = s.TextWrapped
            C.TextXAlignment = s.TextXAlignment
            C.TextYAlignment = s.TextYAlignment
            C.Font = s.Font
            C.BackgroundColor3 = s.BackgroundColor3
            C.Visible = s.Enabled
            a6.Name = "Description"
            a6.Parent = a5
            a6.BackgroundTransparency = 1
            a6.Position = UDim2.new(0.0149156936, 0, 0.127962083, 0)
            a6.Size = UDim2.new(0.969520092, 0, 0.830963671, 0)
            a6.Text = a3
            a6.TextColor3 = t.TextColor3
            a6.TextScaled = t.TextScaled
            a6.TextSize = t.TextSize
            a6.TextWrapped = t.TextWrapped
            a6.TextXAlignment = t.TextXAlignment
            a6.TextYAlignment = t.TextYAlignment
            a6.Font = t.Font
            a6.BackgroundColor3 = t.BackgroundColor3
            a5.Visible = false
            return {a5,r}
        end
        b.InsertWallNotification = function(x, r)
            local J = UDim2.new(0.96981132, 0, 0.947604775, 0)
            local K = UDim2.new(0, 0, 0.947604775, 0)
            x.Visible = true
            local L = TweenInfo.new(0.8)
            d:Create(x, L, {Size=J}):Play()
            wait(L.Time)
            wait(r)
            d:Create(x, L, {Size=K}):Play()
            wait(L.Time)
            pcall(function()
                x.Parent:Destroy()
            end)
        end
        b.WallNotification = function(...)
            coroutine.wrap(function(...)
                local R = {...}
                assert(#R < 4, "Error: Too many arguments for WallNotification | Expected 2 : 3")
                assert(#R > 1, "Error: Too little arguments for WallNotification | Expected 2 : 3")
                for S, T in next, R do
                    if (S ~= 3) then
                        R[S] = tostring(T)
                    end
                end
                if (#R == 2) then
                    R[3] = a0()
                end
                R[4] = a0()
                if (type(R[3]) ~= "table") then
                    warn("Settings table malformed, please make sure you have the exact table copied! { ARG4_INVALID_TABLE }")
                    R[3] = a0()
                end
                for U, V in next, R[3] do
                    if (type(V) == "table") then
                        for W, X in next, V do
                            R[4][U][W] = X
                        end
                    else
                        R[4][U] = V
                    end
                end
                local Y = b.CreateWallNotification(R[1], R[2], R[4])
                b.InsertWallNotification(Y[1], Y[2])
            end)(...)
        end
        b.ClearAllNotifications = function()
            for k, a7 in next, game:GetService("CoreGui"):GetChildren() do
                if ((string.match(a7.Name, "WallNotificationFolder") or string.match(a7.Name, "NotificationFolder")) and a7:IsA("Folder")) then
                    for P, a8 in next, a7:GetChildren() do
                        pcall(function()
                            a8:Destroy()
                        end)
                    end
                end
            end
        end
        if not getgenv then
            b.WallNotification("Error", "Your Exploit is not Supported T-T\n\nPlease download a supported Exploit!", {Duration=(8999999488 or 1),TitleSettings={Enabled=true},DescriptionSettings={Font=Enum.Font.Code}})
            while wait() do
            end
        end
        getgenv().IrisNotificationUserMrJack = b
    end
    if not IrisNotificationUserIcon then
        local a9 = 0
        pcall(function()
            a9 = game:GetService("MarketplaceService"):GetProductInfo(game:GetService("AssetService"):GetGamePlacesAsync():GetCurrentPage()[1].PlaceId).IconImageAssetId
        end)
        getgenv().IrisNotificationUserIcon = "rbxassetid://" .. a9
        if (not IrisNotificationUserIcon or (IrisNotificationUserIcon == "rbxassetid://0")) then
            getgenv().IrisNotificationUserIcon = "rbxassetid://7141323263"
        end
    end
end
a()
getgenv().Notification = function(type, aa, ab, ac, ad)
    a()
    if (aa and (aa == "Test")) then
        aa = "Error"
    end
    if (type == 1) then
        IrisNotificationUserMrJack.Notify(aa, ab, ad or "rbxassetid://13241550901", {Duration=(ac or 1),TitleSettings={TextColor3=Color3.fromRGB(255, 0, 0),TextXAlignment=Enum.TextXAlignment.Right},DescriptionSettings={TextColor3=Color3.fromRGB(240, 240, 240),TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center},GradientSettings={GradientEnabled=false,SolidColor=Color3.fromRGB(255, 0, 0),Extend=true},Main={BorderColor3=Color3.fromRGB(0, 0, 0),BackgroundColor3=Color3.fromRGB(0, 0, 0),BackgroundTransparency=0.5,Rounding=false,BorderSizePixel=0}})
    elseif (type == 2) then
        IrisNotificationUserMrJack.WallNotification(aa, ab, {Duration=(ac or 1),TitleSettings={Enabled=true,TextColor3=Color3.fromRGB(255, 0, 0)},DescriptionSettings={Font=Enum.Font.Code}})
    end
end
