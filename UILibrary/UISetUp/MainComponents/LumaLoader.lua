local LumaLibrary = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

local function createLoadingScreen()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "LumaHubLoader"
    ScreenGui.ResetOnSpawn = false
    
    local success = pcall(function()
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end)
    
    if not success then
        return nil
    end
    
    local Background = Instance.new("Frame")
    Background.Name = "Background"
    Background.Size = UDim2.new(0, 700, 0, 700)
    Background.Position = UDim2.new(0.5, -350, 0.5, -350)
    Background.BackgroundColor3 = Color3.fromRGB(220, 200, 220)
    Background.BorderSizePixel = 0
    Background.Parent = ScreenGui
    
    local BackgroundCorner = Instance.new("UICorner")
    BackgroundCorner.CornerRadius = UDim.new(0, 20)
    BackgroundCorner.Parent = Background
    
    local BackgroundImage = Instance.new("ImageLabel")
    BackgroundImage.Size = UDim2.new(1, 0, 1, 0)
    BackgroundImage.BackgroundTransparency = 1
    BackgroundImage.Image = "rbxassetid://125073427434619"
    BackgroundImage.ScaleType = Enum.ScaleType.Crop
    BackgroundImage.Parent = Background
    
    local ImageCorner = Instance.new("UICorner")
    ImageCorner.CornerRadius = UDim.new(0, 20)
    ImageCorner.Parent = BackgroundImage
    
    local Overlay = Instance.new("Frame")
    Overlay.Size = UDim2.new(1, 0, 1, 0)
    Overlay.BackgroundColor3 = Color3.fromRGB(255, 240, 250)
    Overlay.BackgroundTransparency = 0.6
    Overlay.BorderSizePixel = 0
    Overlay.Parent = Background
    
    local OverlayCorner = Instance.new("UICorner")
    OverlayCorner.CornerRadius = UDim.new(0, 20)
    OverlayCorner.Parent = Overlay
    
    local BoxStroke = Instance.new("UIStroke")
    BoxStroke.Color = Color3.fromRGB(200, 50, 120)
    BoxStroke.Thickness = 4
    BoxStroke.Transparency = 0
    BoxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    BoxStroke.Parent = Background
    
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, -40, 0, 200)
    Container.Position = UDim2.new(0.5, 0, 0.5, 0)
    Container.AnchorPoint = Vector2.new(0.5, 0.5)
    Container.BackgroundTransparency = 1
    Container.Parent = Background
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 100)
    Title.Position = UDim2.new(0.5, 0, 0, 0)
    Title.AnchorPoint = Vector2.new(0.5, 0)
    Title.BackgroundTransparency = 1
    Title.Text = ""
    Title.TextColor3 = Color3.fromRGB(255, 50, 150)
    Title.TextSize = 90
    Title.Font = Enum.Font.FredokaOne
    Title.TextScaled = false
    Title.Parent = Container
    
    local OuterStroke = Instance.new("UIStroke")
    OuterStroke.Color = Color3.fromRGB(255, 100, 200)
    OuterStroke.Thickness = 4
    OuterStroke.Transparency = 0.3
    OuterStroke.Parent = Title
    
    local Underline = Instance.new("Frame")
    Underline.Size = UDim2.new(0, 0, 0, 6)
    Underline.Position = UDim2.new(0.5, 0, 0, 110)
    Underline.AnchorPoint = Vector2.new(0.5, 0)
    Underline.BackgroundColor3 = Color3.fromRGB(255, 50, 150)
    Underline.BorderSizePixel = 0
    Underline.Parent = Container
    
    local UnderlineCorner = Instance.new("UICorner")
    UnderlineCorner.CornerRadius = UDim.new(1, 0)
    UnderlineCorner.Parent = Underline
    
    local UnderlineGradient = Instance.new("UIGradient")
    UnderlineGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 50, 150)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 150, 200)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 50, 150))
    }
    UnderlineGradient.Parent = Underline
    
    local Credit = Instance.new("TextLabel")
    Credit.Size = UDim2.new(1, 0, 0, 30)
    Credit.Position = UDim2.new(0.5, 0, 0, 130)
    Credit.AnchorPoint = Vector2.new(0.5, 0)
    Credit.BackgroundTransparency = 1
    Credit.Text = "made by revin :P"
    Credit.TextColor3 = Color3.fromRGB(200, 50, 120)
    Credit.TextSize = 18
    Credit.Font = Enum.Font.GothamBold
    Credit.TextTransparency = 0
    Credit.Parent = Container
    
    task.spawn(function()
        while OuterStroke.Parent do
            TweenService:Create(OuterStroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0}):Play()
            task.wait(1.5)
            TweenService:Create(OuterStroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.6}):Play()
            task.wait(1.5)
        end
    end)
    
    return ScreenGui, Title, Underline, Background, BackgroundImage, Overlay, BoxStroke, OuterStroke, Credit
end

local function typeText(label, underline, text, speed)
    for i = 1, #text do
        label.Text = text:sub(1, i)
        
        local letterWidth = 100
        TweenService:Create(
            underline,
            TweenInfo.new(speed, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, i * letterWidth, 0, 6)}
        ):Play()
        
        task.wait(speed)
    end
end

function LumaLibrary:Load()
    local screenGui, title, underline, background, bgImage, overlay, boxStroke, stroke, credit = createLoadingScreen()
    
    if not screenGui then
        warn("Failed to create loading screen")
        return self
    end
    
    task.wait(0.5)
    typeText(title, underline, "LumaHub", 0.18)
    task.wait(2)
    
    local fadeOut = TweenService:Create(background, TweenInfo.new(1), {BackgroundTransparency = 1})
    local fadeImageOut = TweenService:Create(bgImage, TweenInfo.new(1), {ImageTransparency = 1})
    local fadeOverlayOut = TweenService:Create(overlay, TweenInfo.new(1), {BackgroundTransparency = 1})
    local fadeTitleOut = TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 1})
    local fadeStrokeOut = TweenService:Create(stroke, TweenInfo.new(1), {Transparency = 1})
    local fadeBoxStrokeOut = TweenService:Create(boxStroke, TweenInfo.new(1), {Transparency = 1})
    local fadeUnderlineOut = TweenService:Create(underline, TweenInfo.new(1), {BackgroundTransparency = 1})
    local fadeCreditOut = TweenService:Create(credit, TweenInfo.new(1), {TextTransparency = 1})
    
    fadeOut:Play()
    fadeImageOut:Play()
    fadeOverlayOut:Play()
    fadeTitleOut:Play()
    fadeStrokeOut:Play()
    fadeBoxStrokeOut:Play()
    fadeUnderlineOut:Play()
    fadeCreditOut:Play()
    
    task.wait(1.2)
    screenGui:Destroy()
    
    return self
end

return LumaLibrary
