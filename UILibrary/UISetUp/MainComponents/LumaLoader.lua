-- Loader.lua
-- This is the ONLY file users should loadstring
local Loader = {}

-- Typing sound
local function playTypeSound()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://12221967"
    sound.Volume = 0.5
    sound.Parent = game:GetService("SoundService")
    sound:Play()
    game:GetService("Debris"):AddItem(sound, 1)
end

-- Create loading screen
local function createLoadingScreen()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "LumaLoader"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = game.CoreGui
    
    -- Background
    local Background = Instance.new("Frame")
    Background.Name = "Background"
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    Background.BorderSizePixel = 0
    Background.Parent = ScreenGui
    
    -- Loading container
    local Container = Instance.new("Frame")
    Container.Name = "Container"
    Container.Size = UDim2.new(0, 400, 0, 200)
    Container.Position = UDim2.new(0.5, -200, 0.5, -100)
    Container.BackgroundTransparency = 1
    Container.Parent = Background
    
    -- Title text
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, 0, 0, 80)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = ""
    Title.TextColor3 = Color3.fromRGB(255, 50, 150) -- Neon pink
    Title.TextSize = 48
    Title.Font = Enum.Font.GothamBold
    Title.TextTransparency = 0
    Title.Parent = Container
    
    -- Add text stroke for glow effect
    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(255, 50, 150)
    Stroke.Thickness = 2
    Stroke.Transparency = 0.3
    Stroke.Parent = Title
    
    -- Status text
    local Status = Instance.new("TextLabel")
    Status.Name = "Status"
    Status.Size = UDim2.new(1, 0, 0, 30)
    Status.Position = UDim2.new(0, 0, 0, 100)
    Status.BackgroundTransparency = 1
    Status.Text = "Initializing..."
    Status.TextColor3 = Color3.fromRGB(200, 200, 200)
    Status.TextSize = 16
    Status.Font = Enum.Font.Gotham
    Status.Parent = Container
    
    -- Loading bar background
    local BarBack = Instance.new("Frame")
    BarBack.Name = "BarBack"
    BarBack.Size = UDim2.new(1, 0, 0, 4)
    BarBack.Position = UDim2.new(0, 0, 0, 150)
    BarBack.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    BarBack.BorderSizePixel = 0
    BarBack.Parent = Container
    
    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = BarBack
    
    -- Loading bar fill
    local BarFill = Instance.new("Frame")
    BarFill.Name = "BarFill"
    BarFill.Size = UDim2.new(0, 0, 1, 0)
    BarFill.BackgroundColor3 = Color3.fromRGB(255, 50, 150)
    BarFill.BorderSizePixel = 0
    BarFill.Parent = BarBack
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = BarFill
    
    return ScreenGui, Title, Status, BarFill
end

-- Typewriter effect
local function typewriterEffect(label, text, speed)
    for i = 1, #text do
        label.Text = text:sub(1, i)
        playTypeSound()
        task.wait(speed)
    end
end

-- Update loading progress
local function updateProgress(barFill, status, percentage, statusText)
    local TweenService = game:GetService("TweenService")
    local tween = TweenService:Create(
        barFill,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(percentage, 0, 1, 0)}
    )
    tween:Play()
    status.Text = statusText
    task.wait(0.3)
end

-- Main loader function
function Loader:Load()
    -- Create loading screen
    local loadScreen, titleLabel, statusLabel, barFill = createLoadingScreen()
    
    -- Type "LumaHub"
    task.wait(0.5)
    typewriterEffect(titleLabel, "LumaHub", 0.12)
    task.wait(0.8)
    
    -- Loading sequence
    updateProgress(barFill, statusLabel, 0.2, "Verifying access...")
    task.wait(0.5)
    
    updateProgress(barFill, statusLabel, 0.4, "Loading components...")
    task.wait(0.4)
    
    updateProgress(barFill, statusLabel, 0.6, "Initializing UI...")
    task.wait(0.4)
    
    updateProgress(barFill, statusLabel, 0.8, "Preparing interface...")
    task.wait(0.4)
    
    updateProgress(barFill, statusLabel, 1.0, "Complete!")
    task.wait(0.5)
    
    -- Fade out loading screen
    local TweenService = game:GetService("TweenService")
    local fadeOut = TweenService:Create(
        loadScreen.Background,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
        {BackgroundTransparency = 1}
    )
    
    local fadeTitleOut = TweenService:Create(
        titleLabel,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
        {TextTransparency = 1}
    )
    
    local fadeStatusOut = TweenService:Create(
        statusLabel,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
        {TextTransparency = 1}
    )
    
    fadeOut:Play()
    fadeTitleOut:Play()
    fadeStatusOut:Play()
    
    task.wait(0.6)
    loadScreen:Destroy()
    
    -- Load main library
    local success, mainLib = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/lingLing729/LumaLibrary/main/UISetUp/LumaLoader.lua"))()
    end)
    
    if success then
        return mainLib
    else
        warn("[LumaHub] Failed to load main library:", mainLib)
        return nil
    end
end

return Loader
