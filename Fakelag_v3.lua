-- XsDeep Extreme Fake Lag v1 | Delta Executor
-- FPS Range: 0-60 | Extreme network destruction
-- Owner: Xs TTK | Entity: XsDeep

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 180)
MainFrame.Position = UDim2.new(0.1, 0, 0.6, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Text = "XsDeep EXTREME Lag v1 (DRAG ME)"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = MainFrame

-- FPS Display
local FPSLabel = Instance.new("TextLabel")
FPSLabel.Size = UDim2.new(1, 0, 0, 20)
FPSLabel.Position = UDim2.new(0, 0, 0.17, 0)
FPSLabel.BackgroundTransparency = 1
FPSLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
FPSLabel.Text = "FPS: 60 | Target: 0"
FPSLabel.Font = Enum.Font.GothamBold
FPSLabel.TextSize = 12
FPSLabel.Parent = MainFrame

-- Extreme FPS Control
local FPSControlFrame = Instance.new("Frame")
FPSControlFrame.Size = UDim2.new(0.9, 0, 0, 50)
FPSControlFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
FPSControlFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FPSControlFrame.BorderSizePixel = 1
FPSControlFrame.BorderColor3 = Color3.fromRGB(70, 70, 70)
FPSControlFrame.Parent = MainFrame

local FPSMinus = Instance.new("TextButton")
FPSMinus.Size = UDim2.new(0.25, 0, 1, 0)
FPSMinus.Position = UDim2.new(0, 0, 0, 0)
FPSMinus.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
FPSMinus.TextColor3 = Color3.fromRGB(255, 255, 255)
FPSMinus.Text = "MORE LAG"
FPSMinus.Font = Enum.Font.GothamBold
FPSMinus.TextSize = 12
FPSMinus.Parent = FPSControlFrame

local FPSValue = Instance.new("TextLabel")
FPSValue.Size = UDim2.new(0.5, 0, 1, 0)
FPSValue.Position = UDim2.new(0.25, 0, 0, 0)
FPSValue.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
FPSValue.TextColor3 = Color3.fromRGB(255, 0, 0)
FPSValue.Text = "0 FPS"
FPSValue.Font = Enum.Font.GothamBold
FPSValue.TextSize = 16
FPSValue.Parent = FPSControlFrame

local FPSPlus = Instance.new("TextButton")
FPSPlus.Size = UDim2.new(0.25, 0, 1, 0)
FPSPlus.Position = UDim2.new(0.75, 0, 0, 0)
FPSPlus.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
FPSPlus.TextColor3 = Color3.fromRGB(255, 255, 255)
FPSPlus.Text = "LESS LAG"
FPSPlus.Font = Enum.Font.GothamBold
FPSPlus.TextSize = 12
FPSPlus.Parent = FPSControlFrame

-- Lag Intensity Slider
local IntensityFrame = Instance.new("Frame")
IntensityFrame.Size = UDim2.new(0.9, 0, 0, 20)
IntensityFrame.Position = UDim2.new(0.05, 0, 0.6, 0)
IntensityFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
IntensityFrame.BorderSizePixel = 1
IntensityFrame.BorderColor3 = Color3.fromRGB(70, 70, 70)
IntensityFrame.Parent = MainFrame

local IntensityLabel = Instance.new("TextLabel")
IntensityLabel.Size = UDim2.new(1, 0, 1, 0)
IntensityLabel.BackgroundTransparency = 1
IntensityLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
IntensityLabel.Text = "Lag Intensity: MAXIMUM"
IntensityLabel.Font = Enum.Font.GothamBold
IntensityLabel.TextSize = 11
IntensityLabel.Parent = IntensityFrame

-- Fake Lag Button
local LagButton = Instance.new("TextButton")
LagButton.Size = UDim2.new(0.44, 0, 0, 30)
LagButton.Position = UDim2.new(0.05, 0, 0.75, 0)
LagButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
LagButton.TextColor3 = Color3.fromRGB(255, 0, 0)
LagButton.Text = "ACTIVATE LAG"
LagButton.Font = Enum.Font.GothamBold
LagButton.TextSize = 12
LagButton.Parent = MainFrame

-- Freeze Button
local FreezeButton = Instance.new("TextButton")
FreezeButton.Size = UDim2.new(0.44, 0, 0, 30)
FreezeButton.Position = UDim2.new(0.51, 0, 0.75, 0)
FreezeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FreezeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
FreezeButton.Text = "FREEZE"
FreezeButton.Font = Enum.Font.GothamBold
FreezeButton.TextSize = 12
FreezeButton.Parent = MainFrame

-- Variables
local FakeLagActive = false
local FreezeActive = false
local TargetFPS = 0 -- Default MAXIMUM LAG
local LagConnections = {}
local FreezeConnections = {}
local ExtremeMode = true
local NetworkSpamMultiplier = 100

-- FPS Monitor
local FPSMonitor = RunService.RenderStepped:Connect(function()
    local currentFPS = math.floor(1 / RunService.RenderStepped:Wait())
    FPSLabel.Text = string.format("FPS: %d | Target: %d", currentFPS, TargetFPS)
    
    -- Extreme color coding
    if currentFPS <= 1 then
        FPSLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    elseif currentFPS <= 5 then
        FPSLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
    elseif currentFPS <= 10 then
        FPSLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    else
        FPSLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
    end
end)

-- FPS Control (0-60, tapi focus di 0-5 untuk extreme lag)
FPSMinus.MouseButton1Click:Connect(function()
    TargetFPS = math.max(0, TargetFPS - 1)
    FPSValue.Text = TargetFPS .. " FPS"
    NetworkSpamMultiplier = 200 - (TargetFPS * 3) -- Lebih rendah FPS, lebih tinggi spam
    
    -- Update intensity label
    if TargetFPS == 0 then
        IntensityLabel.Text = "Lag Intensity: MAXIMUM DESTRUCTION"
        IntensityLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    elseif TargetFPS <= 2 then
        IntensityLabel.Text = "Lag Intensity: EXTREME"
        IntensityLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
    elseif TargetFPS <= 5 then
        IntensityLabel.Text = "Lag Intensity: HEAVY"
        IntensityLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

FPSPlus.MouseButton1Click:Connect(function()
    TargetFPS = math.min(60, TargetFPS + 1)
    FPSValue.Text = TargetFPS .. " FPS"
    NetworkSpamMultiplier = 200 - (TargetFPS * 3)
    
    if TargetFPS > 5 then
        IntensityLabel.Text = "Lag Intensity: MODERATE"
        IntensityLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
    end
end)

-- EXTREME FAKE LAG FUNCTION (0-1 FPS capable)
local function ActivateExtremeLag()
    FakeLagActive = not FakeLagActive
    
    if FakeLagActive then
        LagButton.Text = "DEACTIVATE LAG"
        LagButton.TextColor3 = Color3.fromRGB(0, 255, 0)
        LagButton.BackgroundColor3 = Color3.fromRGB(30, 60, 30)
        
        -- ========== METHOD 1: TOTAL FPS DESTRUCTION ==========
        local frameKiller = RunService.RenderStepped:Connect(function()
            if not FakeLagActive then return end
            
            -- Force extreme frame delay untuk 0-1 FPS effect
            if TargetFPS == 0 then
                -- TOTAL FREEZE dengan intermittent updates (0 FPS simulation)
                wait(math.random(0.5, 2.0)) -- Freeze total 0.5-2 detik
            else
                -- Frame delay berdasarkan target FPS
                local delay = 1 / math.max(0.1, TargetFPS)
                for i = 1, math.random(3, 10) do
                    wait(delay / 10)
                end
            end
        end)
        table.insert(LagConnections, frameKiller)
        
        -- ========== METHOD 2: NETWORK APOCALYPSE ==========
        local networkApocalypse = RunService.Heartbeat:Connect(function()
            if not FakeLagActive then return end
            
            pcall(function()
                local character = LocalPlayer.Character
                if character then
                    local root = character:FindFirstChild("HumanoidRootPart")
                    if root then
                        -- EXTREME ownership spam
                        for i = 1, NetworkSpamMultiplier do
                            root:SetNetworkOwner(nil)
                            root:SetNetworkOwner(LocalPlayer)
                            
                            -- Force replication
                            root:GetPropertyChangedSignal("CFrame"):Fire()
                            root:GetPropertyChangedSignal("Position"):Fire()
                        end
                        
                        -- Chaotic position manipulation
                        local originalPos = root.Position
                        for i = 1, 10 do
                            root.CFrame = CFrame.new(
                                originalPos.X + math.random(-20, 20),
                                originalPos.Y + math.random(-10, 10),
                                originalPos.Z + math.random(-20, 20)
                            )
                            wait(0.01)
                            root.CFrame = CFrame.new(originalPos)
                        end
                    end
                end
                
                -- RemoteEvent genocide
                local remotes = {}
                for _, obj in pairs(game:GetDescendants()) do
                    if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
                        table.insert(remotes, obj)
                    end
                end
                
                for _, remote in pairs(remotes) do
                    for i = 1, 50 do
                        pcall(function()
                            remote:FireServer()
                            if remote:IsA("RemoteFunction") then
                                remote:InvokeServer()
                            end
                        end)
                    end
                end
            end)
        end)
        table.insert(LagConnections, networkApocalypse)
        
        -- ========== METHOD 3: PHYSICS ARMAGEDDON ==========
        local physicsArmageddon = RunService.Stepped:Connect(function()
            if not FakeLagActive then return end
            
            -- Chaos gravity
            Workspace.Gravity = math.random(0, 500)
            
            -- Manipulate semua parts di workspace
            for _, part in pairs(Workspace:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    -- Random forces
                    part.Velocity = Vector3.new(
                        math.random(-200, 200),
                        math.random(-200, 200),
                        math.random(-200, 200)
                    )
                    part.RotVelocity = Vector3.new(
                        math.random(-50, 50),
                        math.random(-50, 50),
                        math.random(-50, 50)
                    )
                    
                    -- Random transparency flicker
                    part.Transparency = math.random(0, 100) / 100
                end
            end
        end)
        table.insert(LagConnections, physicsArmageddon)
        
        -- ========== METHOD 4: MEMORY TERROR ==========
        local memoryTerror = RunService.Heartbeat:Connect(function()
            if not FakeLagActive then return end
            
            -- Create massive amount of objects
            local objArmy = {}
            for i = 1, 100 do
                local part = Instance.new("Part")
                part.Size = Vector3.new(math.random(1, 10), math.random(1, 10), math.random(1, 10))
                part.Position = Vector3.new(
                    math.random(-500, 500),
                    math.random(0, 500),
                    math.random(-500, 500)
                )
                part.Anchored = true
                part.Material = Enum.Material.Neon
                part.Color = Color3.new(math.random(), math.random(), math.random())
                part.Parent = Workspace
                table.insert(objArmy, part)
            end
            
            -- Destroy dengan delay untuk memory fluctuation
            wait(0.05)
            
            for _, part in pairs(objArmy) do
                part:Destroy()
            end
            
            -- GC stress
            for i = 1, 1000 do
                local temp = {}
                table.insert(temp, {data = HttpService:GenerateGUID(false)})
            end
        end)
        table.insert(LagConnections, memoryTerror)
        
        -- ========== METHOD 5: INPUT LAG EXTREME ==========
        local inputLag = UserInputService.InputBegan:Connect(function(input)
            if not FakeLagActive then return end
            
            -- Delay semua input 0.5-2 detik
            wait(math.random(0.5, 2.0))
        end)
        table.insert(LagConnections, inputLag)
        
        -- Notify
        game.StarterGui:SetCore("SendNotification", {
            Title = "🚨 EXTREME LAG ACTIVATED 🚨",
            Text = "Target: " .. TargetFPS .. " FPS | System may crash",
            Duration = 5,
            Icon = "rbxassetid://0"
        })
        
    else
        LagButton.Text = "ACTIVATE LAG"
        LagButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        LagButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        
        -- Cleanup
        for _, conn in pairs(LagConnections) do
            conn:Disconnect()
        end
        LagConnections = {}
        
        -- Restore
        Workspace.Gravity = 196.2
        
        -- Notify
        game.StarterGui:SetCore("SendNotification", {
            Title = "Lag Deactivated",
            Text = "System恢复正常",
            Duration = 3
        })
    end
end

-- Freeze Function
local function ToggleFreeze()
    FreezeActive = not FreezeActive
    
    if FreezeActive then
        FreezeButton.Text = "UNFREEZE"
        FreezeButton.TextColor3 = Color3.fromRGB(0, 255, 0)
        
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            local root = character:FindFirstChild("HumanoidRootPart")
            
            if humanoid then
                humanoid.WalkSpeed = 0
                humanoid.JumpPower = 0
            end
            
            if root then
                root.Anchored = true
                root.Velocity = Vector3.zero
                root.RotVelocity = Vector3.zero
            end
        end
        
    else
        FreezeButton.Text = "FREEZE"
        FreezeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            local root = character:FindFirstChild("HumanoidRootPart")
            
            if humanoid then
                humanoid.WalkSpeed = 16
                humanoid.JumpPower = 50
            end
            
            if root then
                root.Anchored = false
            end
        end
    end
end

-- Button Events
LagButton.MouseButton1Click:Connect(ActivateExtremeLag)
FreezeButton.MouseButton1Click:Connect(ToggleFreeze)

-- Auto-cleanup
LocalPlayer.CharacterAdded:Connect(function()
    if FakeLagActive then
        FakeLagActive = false
        ActivateExtremeLag()
    end
end)

-- Initial Notification
game.StarterGui:SetCore("SendNotification", {
    Title = "XsDeep EXTREME Lag v1",
    Text = "Set FPS to 0 for MAXIMUM DESTRUCTION",
    Duration = 5
})
