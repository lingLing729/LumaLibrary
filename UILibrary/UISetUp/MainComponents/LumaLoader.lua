local LumaLibrary = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

local function createNotification()
    local NotifGui = Instance.new("ScreenGui")
    NotifGui.Name = "LumaNotification"
    NotifGui.ResetOnSpawn = false
    NotifGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    pcall(function()
        NotifGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end)
    
    local NotifFrame = Instance.new("Frame")
    NotifFrame.Size = UDim2.new(0, 350, 0, 120)
    NotifFrame.Position = UDim2.new(1, 370, 1, -140)
    NotifFrame.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
    NotifFrame.BackgroundTransparency = 0.2
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Parent = NotifGui
    
    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 15)
    NotifCorner.Parent = NotifFrame
    
    local NotifStroke = Instance.new("UIStroke")
    NotifStroke.Color = Color3.fromRGB(180, 50, 130)
    NotifStroke.Thickness = 2
    NotifStroke.Transparency = 0.3
    NotifStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    NotifStroke.Parent = NotifFrame
    
    local NotifGlow = Instance.new("UIStroke")
    NotifGlow.Color = Color3.fromRGB(200, 80, 160)
    NotifGlow.Thickness = 4
    NotifGlow.Transparency = 0.7
    NotifGlow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    NotifGlow.Parent = NotifFrame
    
    local NotifTitle = Instance.new("TextLabel")
    NotifTitle.Size = UDim2.new(1, -20, 0, 25)
    NotifTitle.Position = UDim2.new(0, 10, 0, 10)
    NotifTitle.BackgroundTransparency = 1
    NotifTitle.Text = "LumaLibrary"
    NotifTitle.TextColor3 = Color3.fromRGB(255, 200, 240)
    NotifTitle.TextSize = 18
    NotifTitle.Font = Enum.Font.FredokaOne
    NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
    NotifTitle.Parent = NotifFrame
    
    local NotifText = Instance.new("TextLabel")
    NotifText.Size = UDim2.new(1, -20, 1, -45)
    NotifText.Position = UDim2.new(0, 10, 0, 35)
    NotifText.BackgroundTransparency = 1
    NotifText.Text = "This script was made using the UI Library LumaLibrary. You can find it at:\ngithub.com/lingling729/LumaLibrary\nHave fun using the script!"
    NotifText.TextColor3 = Color3.fromRGB(220, 220, 220)
    NotifText.TextSize = 12
    NotifText.Font = Enum.Font.Gotham
    NotifText.TextXAlignment = Enum.TextXAlignment.Left
    NotifText.TextYAlignment = Enum.TextYAlignment.Top
    NotifText.TextWrapped = true
    NotifText.Parent = NotifFrame
    
    TweenService:Create(NotifFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(1, -370, 1, -140)}):Play()
    
    task.spawn(function()
        for i = 1, 3 do
            TweenService:Create(NotifGlow, TweenInfo.new(1, Enum.EasingStyle.Sine), {Transparency = 0.3}):Play()
            task.wait(1)
            TweenService:Create(NotifGlow, TweenInfo.new(1, Enum.EasingStyle.Sine), {Transparency = 0.8}):Play()
            task.wait(1)
        end
    end)
    
    task.wait(5)
    
    TweenService:Create(NotifFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(1, 370, 1, -140)}):Play()
    TweenService:Create(NotifFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(NotifTitle, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(NotifText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(NotifStroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
    TweenService:Create(NotifGlow, TweenInfo.new(0.5), {Transparency = 1}):Play()
    
    task.wait(0.6)
    NotifGui:Destroy()
end

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
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 90
    Title.Font = Enum.Font.Michroma
    Title.TextScaled = false
    Title.Parent = Container
    
    local OuterGlow = Instance.new("UIStroke")
    OuterGlow.Color = Color3.fromRGB(255, 50, 150)
    OuterGlow.Thickness = 8
    OuterGlow.Transparency = 0.5
    OuterGlow.Parent = Title
    
    local InnerStroke = Instance.new("UIStroke")
    InnerStroke.Color = Color3.fromRGB(255, 100, 200)
    InnerStroke.Thickness = 3
    InnerStroke.Transparency = 0
    InnerStroke.Parent = Title
    
    task.spawn(function()
        while OuterGlow.Parent do
            TweenService:Create(OuterGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {Transparency = 0.2, Thickness = 10}):Play()
            task.wait(1.5)
            TweenService:Create(OuterGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {Transparency = 0.7, Thickness = 6}):Play()
            task.wait(1.5)
        end
    end)
    
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
    
    return ScreenGui, Title, Underline, Background, BackgroundImage, Overlay, BoxStroke, OuterGlow, InnerStroke, Credit
end

local function typeText(label, underline, text, speed)
    local textBounds = game:GetService("TextService"):GetTextSize(text, label.TextSize, label.Font, Vector2.new(9999, 9999))
    local textWidth = textBounds.X
    
    for i = 1, #text do
        label.Text = text:sub(1, i)
        
        local currentWidth = (i / #text) * textWidth
        TweenService:Create(
            underline,
            TweenInfo.new(speed, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, currentWidth, 0, 6)}
        ):Play()
        
        task.wait(speed)
    end
end

function LumaLibrary:Load()
    local screenGui, title, underline, background, bgImage, overlay, boxStroke, outerGlow, innerStroke, credit = createLoadingScreen()
    
    if not screenGui then
        warn("Failed to create loading screen")
        return self
    end
    
    task.wait(0.5)
    typeText(title, underline, "LumaHub", 0.2)
    task.wait(2)
    
    local fadeOut = TweenService:Create(background, TweenInfo.new(1), {BackgroundTransparency = 1})
    local fadeImageOut = TweenService:Create(bgImage, TweenInfo.new(1), {ImageTransparency = 1})
    local fadeOverlayOut = TweenService:Create(overlay, TweenInfo.new(1), {BackgroundTransparency = 1})
    local fadeTitleOut = TweenService:Create(title, TweenInfo.new(1), {TextTransparency = 1})
    local fadeOuterGlowOut = TweenService:Create(outerGlow, TweenInfo.new(1), {Transparency = 1})
    local fadeInnerStrokeOut = TweenService:Create(innerStroke, TweenInfo.new(1), {Transparency = 1})
    local fadeBoxStrokeOut = TweenService:Create(boxStroke, TweenInfo.new(1), {Transparency = 1})
    local fadeUnderlineOut = TweenService:Create(underline, TweenInfo.new(1), {BackgroundTransparency = 1})
    local fadeCreditOut = TweenService:Create(credit, TweenInfo.new(1), {TextTransparency = 1})
    
    fadeOut:Play()
    fadeImageOut:Play()
    fadeOverlayOut:Play()
    fadeTitleOut:Play()
    fadeOuterGlowOut:Play()
    fadeInnerStrokeOut:Play()
    fadeBoxStrokeOut:Play()
    fadeUnderlineOut:Play()
    fadeCreditOut:Play()
    
    task.wait(1.2)
    screenGui:Destroy()
    
    task.spawn(createNotification)
    
    local success, mainLib = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/lingling729/LumaLibrary/main/UILibrary/UISetUp/Main.lua"))()
    end)
    
    if success and mainLib then
        return mainLib
    else
        return LumaLibrary
    end
end

return LumaLibrary
