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
    NotifFrame.Size = UDim2.new(0, 380, 0, 140)
    NotifFrame.Position = UDim2.new(1, 400, 1, -160)
    NotifFrame.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
    NotifFrame.BackgroundTransparency = 0.15
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Parent = NotifGui
    
    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 18)
    NotifCorner.Parent = NotifFrame
    
    local NotifStroke = Instance.new("UIStroke")
    NotifStroke.Color = Color3.fromRGB(200, 60, 140)
    NotifStroke.Thickness = 2.5
    NotifStroke.Transparency = 0.2
    NotifStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    NotifStroke.Parent = NotifFrame
    
    local NotifGlow = Instance.new("ImageLabel")
    NotifGlow.Size = UDim2.new(1, 40, 1, 40)
    NotifGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
    NotifGlow.AnchorPoint = Vector2.new(0.5, 0.5)
    NotifGlow.BackgroundTransparency = 1
    NotifGlow.Image = "rbxassetid://4996891970"
    NotifGlow.ImageColor3 = Color3.fromRGB(255, 80, 160)
    NotifGlow.ImageTransparency = 0.7
    NotifGlow.ZIndex = 0
    NotifGlow.Parent = NotifFrame
    
    local AccentBar = Instance.new("Frame")
    AccentBar.Size = UDim2.new(0, 4, 1, 0)
    AccentBar.BackgroundColor3 = Color3.fromRGB(255, 60, 150)
    AccentBar.BorderSizePixel = 0
    AccentBar.Parent = NotifFrame
    
    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = AccentBar
    
    local NotifIcon = Instance.new("ImageLabel")
    NotifIcon.Size = UDim2.new(0, 40, 0, 40)
    NotifIcon.Position = UDim2.new(0, 15, 0, 15)
    NotifIcon.BackgroundColor3 = Color3.fromRGB(255, 60, 150)
    NotifIcon.BackgroundTransparency = 0.2
    NotifIcon.BorderSizePixel = 0
    NotifIcon.Image = "rbxassetid://101168459537585"
    NotifIcon.ScaleType = Enum.ScaleType.Fit
    NotifIcon.Parent = NotifFrame
    
    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 10)
    IconCorner.Parent = NotifIcon
    
    local NotifTitle = Instance.new("TextLabel")
    NotifTitle.Size = UDim2.new(1, -75, 0, 30)
    NotifTitle.Position = UDim2.new(0, 65, 0, 15)
    NotifTitle.BackgroundTransparency = 1
    NotifTitle.Text = "✨ LumaLibrary"
    NotifTitle.TextColor3 = Color3.fromRGB(255, 220, 245)
    NotifTitle.TextSize = 20
    NotifTitle.Font = Enum.Font.GothamBold
    NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
    NotifTitle.Parent = NotifFrame
    
    local TitleStroke = Instance.new("UIStroke")
    TitleStroke.Color = Color3.fromRGB(255, 100, 180)
    TitleStroke.Thickness = 1
    TitleStroke.Transparency = 0.6
    TitleStroke.Parent = NotifTitle
    
    local NotifText = Instance.new("TextLabel")
    NotifText.Size = UDim2.new(1, -75, 0, 75)
    NotifText.Position = UDim2.new(0, 65, 0, 50)
    NotifText.BackgroundTransparency = 1
    NotifText.Text = "This script uses LumaLibrary!\n\nFind it at: github.com/lingling729\n\nHave fun! 💖"
    NotifText.TextColor3 = Color3.fromRGB(230, 230, 230)
    NotifText.TextSize = 13
    NotifText.Font = Enum.Font.Gotham
    NotifText.TextXAlignment = Enum.TextXAlignment.Left
    NotifText.TextYAlignment = Enum.TextYAlignment.Top
    NotifText.TextWrapped = true
    NotifText.Parent = NotifFrame
    
    TweenService:Create(NotifFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(1, -400, 1, -160)}):Play()
    
    task.spawn(function()
        for i = 1, 4 do
            TweenService:Create(NotifGlow, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {ImageTransparency = 0.4}):Play()
            task.wait(1.2)
            TweenService:Create(NotifGlow, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {ImageTransparency = 0.8}):Play()
            task.wait(1.2)
        end
    end)
    
    task.wait(6)
    
    TweenService:Create(NotifFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(1, 400, 1, -160)}):Play()
    TweenService:Create(NotifFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(NotifTitle, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(NotifText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    TweenService:Create(NotifStroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
    TweenService:Create(NotifGlow, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
    TweenService:Create(AccentBar, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(NotifIcon, TweenInfo.new(0.5), {ImageTransparency = 1, BackgroundTransparency = 1}):Play()
    TweenService:Create(TitleStroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
    
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
