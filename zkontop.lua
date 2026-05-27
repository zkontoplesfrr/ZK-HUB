-- // ZKONTOP HUB X - REWRITTEN & OPTIMIZED // --
if not game:IsLoaded() then game.Loaded:Wait() end

local players = game:GetService("Players")
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")
local run = game:GetService("RunService")
local light = game:GetService("Lighting")
local cg = game:GetService("CoreGui")

local plr = players.LocalPlayer or players.PlayerAdded:Wait()
local ui_parent = (cg:FindFirstChild("RobloxGui") or cg) or plr:WaitForChild("PlayerGui", 10)

if ui_parent:FindFirstChild("ZK_RUNNING") then ui_parent["ZK_RUNNING"]:Destroy() end
if plr:WaitForChild("PlayerGui"):FindFirstChild("ZK_RUNNING") then plr.PlayerGui["ZK_RUNNING"]:Destroy() end

local sgui = Instance.new("ScreenGui")
sgui.Name = "ZK_RUNNING"
sgui.ResetOnSpawn = false
sgui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
sgui.Parent = ui_parent

local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0, 50, 0, 50)
toggle.Position = UDim2.new(0, 25, 0.5, -25)
toggle.BackgroundColor3 = Color3.fromRGB(10, 12, 22)
toggle.Text = "ZK"
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 18
toggle.TextColor3 = Color3.fromRGB(50, 110, 255)
toggle.BorderSizePixel = 0
toggle.ZIndex = 10
toggle.Parent = sgui

local uic_toggle = Instance.new("UICorner")
uic_toggle.CornerRadius = UDim.new(1, 0)
uic_toggle.Parent = toggle

local t_stroke = Instance.new("UIStroke")
t_stroke.Color = Color3.fromRGB(40, 90, 230)
t_stroke.Thickness = 2
t_stroke.Parent = toggle

local btnDrag, btnStart, btnPos
toggle.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        btnDrag = true
        btnStart = i.Position
        btnPos = toggle.Position
        i.Changed:Connect(function() 
            if i.UserInputState == Enum.UserInputState.End then btnDrag = false end 
        end)
    end
end)

uis.InputChanged:Connect(function(i)
    if btnDrag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local d = i.Position - btnStart
        toggle.Position = UDim2.new(btnPos.X.Scale, btnPos.X.Offset + d.X, btnPos.Y.Scale, btnPos.Y.Offset + d.Y)
    end
end)

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 600, 0, 380)
main.Position = UDim2.new(0.5, -300, 0.5, -190)
main.BackgroundColor3 = Color3.fromRGB(8, 9, 13)
main.BorderSizePixel = 0
main.Visible = true
main.Parent = sgui

local uic_main = Instance.new("UICorner")
uic_main.CornerRadius = UDim.new(0, 6)
uic_main.Parent = main

local m_stroke = Instance.new("UIStroke")
m_stroke.Color = Color3.fromRGB(24, 35, 65)
m_stroke.Thickness = 1
m_stroke.Parent = main

toggle.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
    t_stroke.Color = main.Visible and Color3.fromRGB(50, 110, 255) or Color3.fromRGB(30, 45, 80)
end)

local top = Instance.new("Frame")
top.Size = UDim2.new(1, 0, 0, 50)
top.BackgroundTransparency = 1
top.Parent = main

local logo_lbl = Instance.new("TextLabel")
logo_lbl.Size = UDim2.new(0, 140, 0, 30)
logo_lbl.Position = UDim2.new(0, 15, 0.5, -15)
logo_lbl.BackgroundColor3 = Color3.fromRGB(12, 18, 36)
logo_lbl.Text = "+  ZK OFFICIAL  +"
logo_lbl.Font = Enum.Font.GothamBold
logo_lbl.TextSize = 12
logo_lbl.TextColor3 = Color3.fromRGB(60, 140, 255)
logo_lbl.Parent = top

local uic_logo = Instance.new("UICorner")
uic_logo.CornerRadius = UDim.new(0, 4)
uic_logo.Parent = logo_lbl

local l_stroke = Instance.new("UIStroke")
l_stroke.Color = Color3.fromRGB(30, 60, 150)
l_stroke.Thickness = 1
l_stroke.Parent = logo_lbl

task.spawn(function()
    while sgui and sgui.Parent do
        ts:Create(l_stroke, TweenInfo.new(0.6), {Color = Color3.fromRGB(80, 170, 255)}):Play()
        task.wait(0.6)
        ts:Create(l_stroke, TweenInfo.new(0.6), {Color = Color3.fromRGB(30, 60, 150)}):Play()
        task.wait(1.5)
    end
end)

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(0, 200, 1, 0)
subtitle.Position = UDim2.new(0, 170, 0, 0)
subtitle.BackgroundTransparency = 1
subtitle.Text = "RAPIDE ★ FIABLE ★ SÉCURISÉ"
subtitle.Font = Enum.Font.GothamSemibold
subtitle.TextSize = 10
subtitle.TextColor3 = Color3.fromRGB(70, 85, 115)
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = top

local sep = Instance.new("Frame")
sep.Size = UDim2.new(1, 0, 0, 1)
sep.Position = UDim2.new(0, 0, 0, 50)
sep.BackgroundColor3 = Color3.fromRGB(20, 28, 48)
sep.BorderSizePixel = 0
sep.Parent = main

local side = Instance.new("Frame")
side.Position = UDim2.new(0, 0, 0, 51)
side.Size = UDim2.new(0, 140, 1, -51)
side.BackgroundColor3 = Color3.fromRGB(6, 7, 10)
side.BorderSizePixel = 0
side.Parent = main

local s_layout = Instance.new("UIListLayout")
s_layout.Padding = UDim.new(0, 4)
s_layout.Parent = side

local s_pad = Instance.new("UIPadding")
s_pad.PaddingTop = UDim.new(0, 10)
s_pad.PaddingLeft = UDim.new(0, 8)
s_pad.PaddingRight = UDim.new(0, 8)
s_pad.Parent = side

local p_container = Instance.new("Frame")
p_container.Position = UDim2.new(0, 155, 0, 65)
p_container.Size = UDim2.new(1, -170, 1, -80)
p_container.BackgroundTransparency = 1
p_container.Parent = main

local pages, buttons = {}, {}

local function make_page(name)
    local pf = Instance.new("ScrollingFrame")
    pf.Size = UDim2.new(1, 0, 1, 0)
    pf.BackgroundTransparency = 1
    pf.ScrollBarThickness = 2
    pf.ScrollBarImageColor3 = Color3.fromRGB(40, 90, 230)
    pf.Visible = false
    pf.CanvasSize = UDim2.new(0, 0, 0, 0)
    pf.Parent = p_container

    local p_lay = Instance.new("UIListLayout")
    p_lay.Padding = UDim.new(0, 6)
    p_lay.Parent = pf
    
    p_lay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        pf.CanvasSize = UDim2.new(0, 0, 0, p_lay.AbsoluteContentSize.Y + 5)
    end)

    pages[name] = pf

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = Color3.fromRGB(12, 14, 20)
    btn.Text = "  " .. name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.TextColor3 = Color3.fromRGB(100, 115, 140)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.BorderSizePixel = 0
    btn.Parent = side
    
    local uic_btn = Instance.new("UICorner")
    uic_btn.CornerRadius = UDim.new(0, 4)
    uic_btn.Parent = btn
    
    buttons[name] = btn

    btn.MouseButton1Click:Connect(function()
        for n, f in pairs(pages) do
            f.Visible = false
            ts:Create(buttons[n], TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(12, 14, 20), TextColor3 = Color3.fromRGB(100, 115, 140)}):Play()
        end
        pf.Visible = true
        ts:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(35, 80, 220), TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end)

    return pf
end

local main_p = make_page("UNIVERSAL")
local plyr_p = make_page("PLAYER")
local vis_p  = make_page("VISUALS")
local fun_p  = make_page("FUN")

pages["UNIVERSAL"].Visible = true
buttons["UNIVERSAL"].BackgroundColor3 = Color3.fromRGB(35, 80, 220)
buttons["UNIVERSAL"].TextColor3 = Color3.fromRGB(255, 255, 255)

function ctx_toggle(parent, text, cb)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, -4, 0, 38)
    f.BackgroundColor3 = Color3.fromRGB(12, 15, 23)
    f.Parent = parent
    
    local uic_f = Instance.new("UICorner")
    uic_f.CornerRadius = UDim.new(0, 4)
    uic_f.Parent = f

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -60, 1, 0)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.Font = Enum.Font.GothamSemibold
    lbl.TextSize = 12
    lbl.TextColor3 = Color3.fromRGB(190, 200, 220)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = f

    local sw = Instance.new("TextButton")
    sw.Size = UDim2.new(0, 34, 0, 16)
    sw.Position = UDim2.new(1, -44, 0.5, -8)
    sw.BackgroundColor3 = Color3.fromRGB(25, 30, 45)
    sw.Text = ""
    sw.Parent = f
    
    local uic_sw = Instance.new("UICorner")
    uic_sw.CornerRadius = UDim.new(1, 0)
    uic_sw.Parent = sw

    local ind = Instance.new("Frame")
    ind.Size = UDim2.new(0, 12, 0, 12)
    ind.Position = UDim2.new(0, 2, 0.5, -6)
    ind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ind.Parent = sw
    
    local uic_ind = Instance.new("UICorner")
    uic_ind.CornerRadius = UDim.new(1, 0)
    uic_ind.Parent = ind

    local active = false
    sw.MouseButton1Click:Connect(function()
        active = not active
        ts:Create(sw, TweenInfo.new(0.15), {BackgroundColor3 = active and Color3.fromRGB(40, 100, 240) or Color3.fromRGB(25, 30, 45)}):Play()
        ts:Create(ind, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = active and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)}):Play()
        pcall(cb, active)
    end)
end

function ctx_slider(parent, text, min, max, def, cb)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, -4, 0, 46)
    f.BackgroundColor3 = Color3.fromRGB(12, 15, 23)
    f.Parent = parent
    
    local uic_f = Instance.new("UICorner")
    uic_f.CornerRadius = UDim.new(0, 4)
    uic_f.Parent = f

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -100, 0, 20)
    lbl.Position = UDim2.new(0, 10, 0, 4)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.Font = Enum.Font.GothamSemibold
    lbl.TextSize = 12
    lbl.TextColor3 = Color3.fromRGB(190, 200, 220)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = f

    local v_lbl = Instance.new("TextLabel")
    v_lbl.Size = UDim2.new(0, 60, 0, 20)
    v_lbl.Position = UDim2.new(1, -70, 0, 4)
    v_lbl.BackgroundTransparency = 1
    v_lbl.Text = tostring(def)
    v_lbl.Font = Enum.Font.GothamBold
    v_lbl.TextSize = 12
    v_lbl.TextColor3 = Color3.fromRGB(50, 120, 255)
    v_lbl.TextXAlignment = Enum.TextXAlignment.Right
    v_lbl.Parent = f

    local track = Instance.new("TextButton")
    track.Size = UDim2.new(1, -20, 0, 4)
    track.Position = UDim2.new(0, 10, 1, -10)
    track.BackgroundColor3 = Color3.fromRGB(25, 32, 50)
    track.Text = ""
    track.Parent = f
    
    local uic_tr = Instance.new("UICorner")
    uic_tr.Parent = track

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(math.clamp((def - min) / (max - min), 0, 1), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(40, 100, 240)
    fill.Parent = track
    
    local uic_fi = Instance.new("UICorner")
    uic_fi.Parent = fill

    local sliding = false
    local function update(input)
        local x = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        fill.Size = UDim2.new(x, 0, 1, 0)
        local v = math.floor(min + (x * (max - min)))
        v_lbl.Text = tostring(v)
        pcall(cb, v)
    end

    track.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then sliding = true; update(i) end
    end)
    uis.InputChanged:Connect(function(i)
        if sliding and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then update(i) end
    end)
    uis.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then sliding = false end
    end)
end

ctx_toggle(main_p, "Fullbright", function(v)
    light.Brightness = v and 4 or 1
    light.Ambient = v and Color3.new(1,1,1) or Color3.fromRGB(127,127,127)
end)

ctx_toggle(main_p, "FPS Boost", function(v)
    settings().Rendering.QualityLevel = v and 1 or 10
end)

local infJmp
ctx_toggle(main_p, "Infinite Jump", function(v)
    if v then
        infJmp = uis.InputBegan:Connect(function(i, p)
            if i.KeyCode == Enum.KeyCode.Space and not p then
                pcall(function() plr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end)
            end
        end)
    else
        if infJmp then infJmp:Disconnect(); infJmp = nil end
    end
end)

local noclip
ctx_toggle(main_p, "No Clip", function(v)
    if v then
        noclip = run.Stepped:Connect(function()
            pcall(function()
                if plr.Character then
                    for _, part in pairs(plr.Character:GetDescendants()) do
                        if part:IsA("BasePart") then part.CanCollide = false end
                    end
                end
            end)
        end)
    else
        if noclip then noclip:Disconnect(); noclip = nil end
    end
end)

local speedVal = 16
local jumpVal = 50

local function setupHumanoid(char)
    local hum = char:WaitForChild("Humanoid", 5)
    if hum then
        hum.WalkSpeed = speedVal
        if hum.UseJumpPower then hum.JumpPower = jumpVal else hum.JumpHeight = (jumpVal / 7) end
        
        hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function() hum.WalkSpeed = speedVal end)
        hum:GetPropertyChangedSignal("JumpPower"):Connect(function() hum.JumpPower = jumpVal end)
        hum:GetPropertyChangedSignal("JumpHeight"):Connect(function() hum.JumpHeight = (jumpVal / 7) end)
    end
end

if plr.Character then task.spawn(setupHumanoid, plr.Character) end
plr.CharacterAdded:Connect(setupHumanoid)

ctx_slider(plyr_p, "WalkSpeed", 16, 250, 16, function(v) 
    speedVal = v 
    pcall(function() plr.Character.Humanoid.WalkSpeed = v end)
end)

ctx_slider(plyr_p, "JumpPower", 50, 300, 50, function(v) 
    jumpVal = v 
    pcall(function() 
        local hum = plr.Character.Humanoid
        if hum.UseJumpPower then hum.JumpPower = v else hum.JumpHeight = (v / 7) end
    end)
end)

local lockConn = nil
local function getClosest()
    local target, near = nil, math.huge
    local camPos = workspace.CurrentCamera.CFrame.Position
    for _, p in pairs(players:GetPlayers()) do
        if p ~= plr and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChildOfClass("Humanoid") then
            if p.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                local d = (p.Character.Head.Position - camPos).Magnitude
                if d < near then near = d; target = p end
            end
        end
    end
    return target
end

ctx_toggle(plyr_p, "Camera Lock Head (Aimbot)", function(v)
    if v then
        lockConn = run.RenderStepped:Connect(function()
            local t = getClosest()
            if t and t.Character and t.Character:FindFirstChild("Head") then
                local cam = workspace.CurrentCamera
                cam.CFrame = CFrame.new(cam.CFrame.Position, t.Character.Head.Position)
            end
        end)
    else
        if lockConn then lockConn:Disconnect(); lockConn = nil end
    end
end)

local espOn = false
local espContainer = Instance.new("Folder")
espContainer.Name = "ZK_ESP_STORAGE"
espContainer.Parent = ui_parent

local function cleanESP(p)
    if espContainer:FindFirstChild(p.Name .. "_ESP") then
        espContainer[p.Name .. "_ESP"]:Destroy()
    end
    pcall(function()
        if p.Character and p.Character:FindFirstChild("ZK_Highlight") then
            p.Character.ZK_Highlight:Destroy()
        end
    end)
end

local function addAdvancedESP(p)
    if p == plr or not espOn then return end
    cleanESP(p)

    local function setupVisuals(c)
        local head = c:WaitForChild("Head", 5)
        local hrp = c:WaitForChild("HumanoidRootPart", 5)
        local hum = c:WaitForChild("Humanoid", 5)
        if not head or not hrp or not hum then return end

        local pFolder = Instance.new("Folder")
        pFolder.Name = p.Name .. "_ESP"
        pFolder.Parent = espContainer

        local hl = Instance.new("Highlight")
        hl.Name = "ZK_Highlight"
        hl.FillColor = Color3.fromRGB(50, 110, 255)
        hl.FillTransparency = 0.5
        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
        hl.OutlineTransparency = 0.2
        hl.Adornee = c
        hl.Parent = c

        local bb = Instance.new("BillboardGui")
        bb.Size = UDim2.new(0, 200, 0, 50)
        bb.AlwaysOnTop = true
        bb.ExtentsOffset = Vector3.new(0, 3.5, 0)
        bb.Adornee = head
        bb.Parent = pFolder

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.TextStrokeTransparency = 0
        textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextSize = 13
        textLabel.Text = p.DisplayName .. " (@" .. p.Name .. ") \n[?? m]"
        textLabel.Parent = bb

        local tracerFrame = Instance.new("Frame")
        tracerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        tracerFrame.BackgroundColor3 = Color3.fromRGB(50, 110, 255)
        tracerFrame.BorderSizePixel = 0
        tracerFrame.Parent = pFolder

        local connection
        connection = run.RenderStepped:Connect(function()
            if not espOn or not p.Parent or not c.Parent or not hrp.Parent or hum.Health <= 0 then
                pFolder:Destroy()
                if hl then hl:Destroy() end
                connection:Disconnect()
                return
            end

            local cam = workspace.CurrentCamera
            local myHrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
            
            if myHrp then
                local dist = math.floor((hrp.Position - myHrp.Position).Magnitude)
                textLabel.Text = p.DisplayName .. "\n[" .. dist .. "m]"
            end

            local screenPos, onScreen = cam:WorldToViewportPoint(hrp.Position)
            if onScreen then
                local startX, startY = cam.ViewportSize.X / 2, cam.ViewportSize.Y
                local stopX, stopY = screenPos.X, screenPos.Y

                local distanceX = stopX - startX
                local distanceY = stopY - startY
                local angle = math.atan2(distanceY, distanceX)
                local magnitude = math.sqrt(distanceX^2 + distanceY^2)

                tracerFrame.Size = UDim2.new(0, magnitude, 0, 1.5)
                tracerFrame.Position = UDim2.new(0, startX + (distanceX / 2), 0, startY + (distanceY / 2))
                tracerFrame.Rotation = math.deg(angle)
                tracerFrame.Visible = true
            else
                tracerFrame.Visible = false
            end
        end)
    end

    p.CharacterAdded:Connect(setupVisuals)
    if p.Character then task.spawn(setupVisuals, p.Character) end
end

ctx_toggle(vis_p, "Advanced Player ESP", function(v)
    espOn = v
    if v then
        for _, p in pairs(players:GetPlayers()) do addAdvancedESP(p) end
        players.PlayerAdded:Connect(addAdvancedESP)
        players.PlayerRemoving:Connect(cleanESP)
    else
        espContainer:ClearAllChildren()
        for _, p in pairs(players:GetPlayers()) do
            pcall(function()
                if p.Character and p.Character:FindFirstChild("ZK_Highlight") then
                    p.Character.ZK_Highlight:Destroy()
                end
            end)
        end
    end
end)

local spinConn
ctx_toggle(fun_p, "Spinbot", function(v)
    if v then
        spinConn = run.Heartbeat:Connect(function()
            pcall(function() 
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then 
                    plr.Character.HumanoidRootPart.CFrame *= CFrame.Angles(0, math.rad(30), 0) 
                end 
            end)
        end)
    else
        if spinConn then spinConn:Disconnect(); spinConn = nil end
    end
end)

local drag, dInput, dStart, sPos
top.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        drag = true; dStart = i.Position; sPos = main.Position
        i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then drag = false end end)
    end
end)
top.InputChanged:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then dInput = i end end)
uis.InputChanged:Connect(function(i)
    if i == dInput and drag then
        local d = i.Position - dStart
        main.Position = UDim2.new(sPos.X.Scale, sPos.X.Offset + d.X, sPos.Y.Scale, sPos.Y.Offset + d.Y)
    end
end)
