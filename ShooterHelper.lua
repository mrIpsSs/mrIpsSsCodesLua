local players = game:GetService('Players')
local runService = game:GetService('RunService')
local playergui = players.LocalPlayer.PlayerGui
local player = players.LocalPlayer
local humanoid = player.Character and player.Character:FindFirstChildOfClass('Humanoid')
local walkspeed = game:GetService('Players').LocalPlayer.Character.Humanoid.WalkSpeed
local playertotp = nil
local playerRoot = game:GetService'Players'.LocalPlayer.Character.HumanoidRootPart

local maingui = Instance.new("ScreenGui")
maingui.Parent = playergui

local mainframe = Instance.new("Frame")
mainframe.Parent = maingui
mainframe.Size = UDim2.new(0.25, 0, 0.4, 0)
mainframe.BackgroundColor3 = Color3.fromRGB(50, 50, 255)
mainframe.BackgroundTransparency = 0.75

local dragging, dragStart, startPos

mainframe.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainframe.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainframe.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        local newPos = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
        mainframe.Position = newPos
    end
end)

mainframe.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

local mainframeCorners = Instance.new("UICorner")
mainframeCorners.CornerRadius = UDim.new(0, 10)
mainframeCorners.Parent = mainframe

local welcomeframe = Instance.new("Frame")
welcomeframe.Parent = mainframe
welcomeframe.Size = UDim2.new(1, 0, 0.15, 0)
welcomeframe.BackgroundColor3 = Color3.fromRGB(50, 50, 255)
welcomeframe.BackgroundTransparency = 0.75

local welcomeframecorners = Instance.new("UICorner")
welcomeframecorners.CornerRadius = UDim.new(0, 10)
welcomeframecorners.Parent = welcomeframe

local welcomelabel = Instance.new("TextLabel")
welcomelabel.Parent = welcomeframe
welcomelabel.Size = UDim2.new(1, 0, 1, 0)
welcomelabel.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
welcomelabel.BackgroundTransparency = 1
welcomelabel.Text = 'mrIpsSs scripts, welcome'
welcomelabel.TextColor3 = Color3.fromRGB(255, 255, 255)
welcomelabel.TextSize = 20
welcomelabel.Font = Enum.Font.GothamBold

local wklabel = Instance.new("TextLabel")
wklabel.Parent = mainframe
wklabel.Size = UDim2.new(0.4, 0, 0.1, 0)
wklabel.Position = UDim2.new(0.050, 0, 0.175, 0)
wklabel.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
wklabel.BackgroundTransparency = 1
wklabel.Text = 'Dont set too high'
wklabel.TextColor3 = Color3.fromRGB(255, 255, 255)
wklabel.TextSize = 15
wklabel.Font = Enum.Font.GothamBold

local speedinput = Instance.new("TextBox")
speedinput.Parent = mainframe
speedinput.Size = UDim2.new(0.4, 0, 0.1, 0)
speedinput.Position = UDim2.new(0.05, 0, 0.3, 0)
speedinput.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
speedinput.BackgroundTransparency = 0.8
speedinput.Text = 'Walkspeed'
speedinput.TextColor3 = Color3.fromRGB(255, 255, 255)
speedinput.TextSize = 15
speedinput.Font = Enum.Font.GothamBold

local corners1 = Instance.new("UICorner")
corners1.CornerRadius = UDim.new(0, 10)
corners1.Parent = speedinput

local speedsetbutton = Instance.new("TextButton")
speedsetbutton.Parent = mainframe
speedsetbutton.Size = UDim2.new(0.4, 0, 0.1, 0)
speedsetbutton.Position = UDim2.new(0.5, 0, 0.3, 0)
speedsetbutton.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
speedsetbutton.BackgroundTransparency = 0.8
speedsetbutton.Text = 'Set'
speedsetbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
speedsetbutton.TextSize = 15
speedsetbutton.Font = Enum.Font.GothamBold

local corners2 = Instance.new("UICorner")
corners2.CornerRadius = UDim.new(0, 10)
corners2.Parent = speedsetbutton

local playerinput = Instance.new("TextBox")
playerinput.Parent = mainframe
playerinput.Size = UDim2.new(0.4, 0, 0.1, 0)
playerinput.Position = UDim2.new(0.05, 0, 0.5, 0)
playerinput.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
playerinput.BackgroundTransparency = 0.8
playerinput.Text = 'Teleport To'
playerinput.TextColor3 = Color3.fromRGB(255, 255, 255)
playerinput.TextSize = 15
playerinput.Font = Enum.Font.GothamBold

local corners3 = Instance.new("UICorner")
corners3.CornerRadius = UDim.new(0, 10)
corners3.Parent = playerinput

local playersetbutton = Instance.new("TextButton")
playersetbutton.Parent = mainframe
playersetbutton.Size = UDim2.new(0.4, 0, 0.1, 0)
playersetbutton.Position = UDim2.new(0.5, 0, 0.5, 0)
playersetbutton.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
playersetbutton.BackgroundTransparency = 0.8
playersetbutton.Text = 'Teleport'
playersetbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
playersetbutton.TextSize = 15
playersetbutton.Font = Enum.Font.GothamBold

local corners4 = Instance.new("UICorner")
corners4.CornerRadius = UDim.new(0, 10)
corners4.Parent = playersetbutton

local enablehitboxes = Instance.new("TextButton")
enablehitboxes.Parent = mainframe
enablehitboxes.Size = UDim2.new(0.4, 0, 0.1, 0)
enablehitboxes.Position = UDim2.new(0.5, 0, 0.85, 0)
enablehitboxes.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
enablehitboxes.BackgroundTransparency = 0.8
enablehitboxes.Text = 'Enable'
enablehitboxes.TextColor3 = Color3.fromRGB(255, 255, 255)
enablehitboxes.TextSize = 15
enablehitboxes.Font = Enum.Font.GothamBold

local corners5 = Instance.new("UICorner")
corners5.CornerRadius = UDim.new(0, 10)
corners5.Parent = enablehitboxes

local disablehitboxes = Instance.new("TextButton")
disablehitboxes.Parent = mainframe
disablehitboxes.Size = UDim2.new(0.4, 0, 0.1, 0)
disablehitboxes.Position = UDim2.new(0.05, 0, 0.85, 0)
disablehitboxes.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
disablehitboxes.BackgroundTransparency = 0.8
disablehitboxes.Text = 'Disable'
disablehitboxes.TextColor3 = Color3.fromRGB(255, 255, 255)
disablehitboxes.TextSize = 15
disablehitboxes.Font = Enum.Font.GothamBold

local corners6 = Instance.new("UICorner")
corners6.CornerRadius = UDim.new(0, 10)
corners6.Parent = disablehitboxes

local TeleportLabel = Instance.new("TextLabel")
TeleportLabel.Parent = mainframe
TeleportLabel.Size = UDim2.new(1, 0, 0.1, 0)
TeleportLabel.Position = UDim2.new(0, 0, 0.7, 0)
TeleportLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
TeleportLabel.BackgroundTransparency = 0.8
TeleportLabel.Text = 'Player Hitboxes'
TeleportLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportLabel.TextSize = 15
TeleportLabel.Font = Enum.Font.GothamBold

local hitboxVisualizers = {}

local function createHitboxVisualizer(character)
    local rootPart = character:FindFirstChild("HumanoidRootPart")

    if rootPart then
        local billboard = Instance.new("BillboardGui")
        billboard.Size = UDim2.new(4, 0, 6, 0)
        billboard.Adornee = rootPart 
        billboard.AlwaysOnTop = true
        billboard.Parent = rootPart
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        frame.BackgroundTransparency = 1
        frame.Parent = billboard

        hitboxVisualizers[character] = frame
    end
end

local function removeHitboxVisualizer(character)
    if hitboxVisualizers[character] then
        hitboxVisualizers[character]:Destroy()
        hitboxVisualizers[character] = nil
    end
end

local function visualizeAllHitboxes()
    for _, player in pairs(players:GetPlayers()) do
        if player.Character then
            createHitboxVisualizer(player.Character)
        end
    end
end

players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        createHitboxVisualizer(character)
    end)
end)

player.CharacterAdded:Connect(function(character)
    createHitboxVisualizer(character)
end)

local function ChangeWalkSpeed()
    local valwalkspeed = tonumber(speedinput.Text)
    if valwalkspeed and valwalkspeed > 0 then
        walkspeed = valwalkspeed
    else
        walkspeed = 16
    end
end

local function disableboxes()
    for _, frame in pairs(hitboxVisualizers) do
        frame.BackgroundTransparency = 1
    end
end

local function enableboxes()
    for _, frame in pairs(hitboxVisualizers) do
        frame.BackgroundTransparency = 0.7
    end
end

local function TeleportToPlayer()
    local playertotp = tostring(playerinput.Text)
    playerRoot.CFrame = game:GetService'Players':FindFirstChild(playertotp).Character.HumanoidRootPart.CFrame
end

speedsetbutton.MouseButton1Click:Connect(ChangeWalkSpeed)
disablehitboxes.MouseButton1Click:Connect(disableboxes)
enablehitboxes.MouseButton1Click:Connect(enableboxes)
playersetbutton.MouseButton1Click:Connect(TeleportToPlayer)

runService.RenderStepped:Connect(function()
    if humanoid then
        humanoid.WalkSpeed = walkspeed
    end
end)

visualizeAllHitboxes()
