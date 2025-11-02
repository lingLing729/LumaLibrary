local MainLibrary = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Themes = {
    Pink = {
        Accent = Color3.fromRGB(255, 50, 150),
        Background = Color3.fromRGB(18, 18, 23),
        Secondary = Color3.fromRGB(22, 22, 28),
        Tertiary = Color3.fromRGB(30, 30, 38),
        Text = Color3.fromRGB(255, 255, 255)
    },
    DarkGreen = {
        Accent = Color3.fromRGB(50, 255, 150),
        Background = Color3.fromRGB(10, 20, 15),
        Secondary = Color3.fromRGB(15, 25, 20),
        Tertiary = Color3.fromRGB(20, 35, 25),
        Text = Color3.fromRGB(255, 255, 255)
    },
    Crimson = {
        Accent = Color3.fromRGB(220, 20, 60),
        Background = Color3.fromRGB(20, 10, 15),
        Secondary = Color3.fromRGB(25, 15, 18),
        Tertiary = Color3.fromRGB(35, 20, 25),
        Text = Color3.fromRGB(255, 255, 255)
    },
    Light = {
        Accent = Color3.fromRGB(100, 150, 255),
        Background = Color3.fromRGB(240, 240, 245),
        Secondary = Color3.fromRGB(230, 230, 240),
        Tertiary = Color3.fromRGB(220, 220, 235),
        Text = Color3.fromRGB(20, 20, 20)
    },
    SleekDark = {
        Accent = Color3.fromRGB(120, 120, 255),
        Background = Color3.fromRGB(12, 12, 16),
        Secondary = Color3.fromRGB(16, 16, 22),
        Tertiary = Color3.fromRGB(22, 22, 30),
        Text = Color3.fromRGB(255, 255, 255)
    }
}

function MainLibrary:CreateWindow(config)
    local WindowName = config.Name or "LumaHub"
    local WindowIcon = config.Icon or "rbxassetid://101168459537585"
    local WindowFont = config.Font or Enum.Font.GothamBold
    local ThemeName = config.Theme or "Pink"
    local LoadSound = config.LoadSound or "rbxassetid://6026984224"
    
    local Theme = Themes[ThemeName] or Themes.Pink
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "LumaHubUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    pcall(function()
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end)
    
    if LoadSound then
        local sound = Instance.new("Sound")
        sound.SoundId = LoadSound
        sound.Volume = 0.5
        sound.Parent = game:GetService("SoundService")
        sound:Play()
        game:GetService("Debris"):AddItem(sound, 5)
    end
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 650, 0, 480)
    MainFrame.Position = UDim2.new(0.5, -325, 0.5, -240)
    MainFrame.BackgroundColor3 = Theme.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = false
    MainFrame.Parent = ScreenGui
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame
    
    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = Theme.Accent
    MainStroke.Thickness = 2
    MainStroke.Transparency = 0.5
    MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    MainStroke.Parent = MainFrame
    
    task.spawn(function()
        while MainStroke.Parent do
            TweenService:Create(MainStroke, TweenInfo.new(2, Enum.EasingStyle.Sine), {Transparency = 0.2}):Play()
            task.wait(2)
            TweenService:Create(MainStroke, TweenInfo.new(2, Enum.EasingStyle.Sine), {Transparency = 0.6}):Play()
            task.wait(2)
        end
    end)
    
    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Size = UDim2.new(1, 0, 0, 50)
    Header.BackgroundColor3 = Theme.Secondary
    Header.BorderSizePixel = 0
    Header.Parent = MainFrame
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 12)
    HeaderCorner.Parent = Header
    
    local HeaderBottom = Instance.new("Frame")
    HeaderBottom.Size = UDim2.new(1, 0, 0, 12)
    HeaderBottom.Position = UDim2.new(0, 0, 1, -12)
    HeaderBottom.BackgroundColor3 = Theme.Secondary
    HeaderBottom.BorderSizePixel = 0
    HeaderBottom.Parent = Header
    
    local IconHolder = Instance.new("ImageLabel")
    IconHolder.Name = "IconHolder"
    IconHolder.Size = UDim2.new(0, 35, 0, 35)
    IconHolder.Position = UDim2.new(0, 10, 0.5, -17.5)
    IconHolder.BackgroundColor3 = Theme.Accent
    IconHolder.BorderSizePixel = 0
    IconHolder.Image = WindowIcon
    IconHolder.ScaleType = Enum.ScaleType.Fit
    IconHolder.Parent = Header
    
    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 8)
    IconCorner.Parent = IconHolder
    
    local IconStroke = Instance.new("UIStroke")
    IconStroke.Color = Theme.Accent
    IconStroke.Thickness = 2
    IconStroke.Transparency = 0.3
    IconStroke.Parent = IconHolder
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, -200, 1, 0)
    Title.Position = UDim2.new(0, 55, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = WindowName
    Title.TextColor3 = Theme.Text
    Title.TextSize = 18
    Title.Font = WindowFont
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Header
    
    local TitleStroke = Instance.new("UIStroke")
    TitleStroke.Color = Theme.Accent
    TitleStroke.Thickness = 1
    TitleStroke.Transparency = 0.7
    TitleStroke.Parent = Title
    
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Size = UDim2.new(0, 35, 0, 35)
    MinimizeButton.Position = UDim2.new(1, -80, 0.5, -17.5)
    MinimizeButton.BackgroundColor3 = Theme.Tertiary
    MinimizeButton.Text = "−"
    MinimizeButton.TextColor3 = Theme.Text
    MinimizeButton.TextSize = 20
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Parent = Header
    
    local MinCorner = Instance.new("UICorner")
    MinCorner.CornerRadius = UDim.new(0, 8)
    MinCorner.Parent = MinimizeButton
    
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 35, 0, 35)
    CloseButton.Position = UDim2.new(1, -40, 0.5, -17.5)
    CloseButton.BackgroundColor3 = Theme.Tertiary
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Theme.Text
    CloseButton.TextSize = 24
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Parent = Header
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 8)
    CloseCorner.Parent = CloseButton
    
    local ReopenButton = Instance.new("Frame")
    ReopenButton.Name = "ReopenButton"
    ReopenButton.Size = UDim2.new(0, 220, 0, 60)
    ReopenButton.Position = UDim2.new(0.5, -110, 0, 10)
    ReopenButton.BackgroundColor3 = Theme.Secondary
    ReopenButton.BackgroundTransparency = 0.1
    ReopenButton.BorderSizePixel = 0
    ReopenButton.Visible = false
    ReopenButton.Parent = ScreenGui
    
    local ReopenCorner = Instance.new("UICorner")
    ReopenCorner.CornerRadius = UDim.new(0, 14)
    ReopenCorner.Parent = ReopenButton
    
    local ReopenStroke = Instance.new("UIStroke")
    ReopenStroke.Color = Theme.Accent
    ReopenStroke.Thickness = 2.5
    ReopenStroke.Transparency = 0.4
    ReopenStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    ReopenStroke.Parent = ReopenButton
    
    local ReopenGlow = Instance.new("ImageLabel")
    ReopenGlow.Size = UDim2.new(1, 30, 1, 30)
    ReopenGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
    ReopenGlow.AnchorPoint = Vector2.new(0.5, 0.5)
    ReopenGlow.BackgroundTransparency = 1
    ReopenGlow.Image = "rbxassetid://4996891970"
    ReopenGlow.ImageColor3 = Theme.Accent
    ReopenGlow.ImageTransparency = 0.8
    ReopenGlow.ZIndex = 0
    ReopenGlow.Parent = ReopenButton
    
    task.spawn(function()
        while ReopenGlow.Parent do
            TweenService:Create(ReopenGlow, TweenInfo.new(2, Enum.EasingStyle.Sine), {ImageTransparency = 0.5}):Play()
            task.wait(2)
            TweenService:Create(ReopenGlow, TweenInfo.new(2, Enum.EasingStyle.Sine), {ImageTransparency = 0.9}):Play()
            task.wait(2)
        end
    end)
    
    local ReopenIconHolder = Instance.new("Frame")
    ReopenIconHolder.Size = UDim2.new(0, 45, 0, 45)
    ReopenIconHolder.Position = UDim2.new(0, 10, 0.5, -22.5)
    ReopenIconHolder.BackgroundColor3 = Theme.Accent
    ReopenIconHolder.BackgroundTransparency = 0.2
    ReopenIconHolder.BorderSizePixel = 0
    ReopenIconHolder.Parent = ReopenButton
    
    local ReopenIconCorner = Instance.new("UICorner")
    ReopenIconCorner.CornerRadius = UDim.new(0, 10)
    ReopenIconCorner.Parent = ReopenIconHolder
    
    local ReopenIcon = Instance.new("ImageLabel")
    ReopenIcon.Size = UDim2.new(1, -8, 1, -8)
    ReopenIcon.Position = UDim2.new(0, 4, 0, 4)
    ReopenIcon.BackgroundTransparency = 1
    ReopenIcon.Image = WindowIcon
    ReopenIcon.ScaleType = Enum.ScaleType.Fit
    ReopenIcon.Parent = ReopenIconHolder
    
    local ReopenTextContainer = Instance.new("Frame")
    ReopenTextContainer.Size = UDim2.new(1, -70, 1, 0)
    ReopenTextContainer.Position = UDim2.new(0, 60, 0, 0)
    ReopenTextContainer.BackgroundTransparency = 1
    ReopenTextContainer.Parent = ReopenButton
    
    local ReopenText = Instance.new("TextLabel")
    ReopenText.Size = UDim2.new(1, -5, 0, 25)
    ReopenText.Position = UDim2.new(0, 0, 0, 10)
    ReopenText.BackgroundTransparency = 1
    ReopenText.Text = WindowName
    ReopenText.TextColor3 = Theme.Text
    ReopenText.TextSize = 16
    ReopenText.Font = WindowFont
    ReopenText.TextXAlignment = Enum.TextXAlignment.Left
    ReopenText.TextTruncate = Enum.TextTruncate.AtEnd
    ReopenText.Parent = ReopenTextContainer
    
    local ReopenTextStroke = Instance.new("UIStroke")
    ReopenTextStroke.Color = Theme.Accent
    ReopenTextStroke.Thickness = 1
    ReopenTextStroke.Transparency = 0.7
    ReopenTextStroke.Parent = ReopenText
    
    local ReopenSubtext = Instance.new("TextLabel")
    ReopenSubtext.Size = UDim2.new(1, -5, 0, 18)
    ReopenSubtext.Position = UDim2.new(0, 0, 1, -28)
    ReopenSubtext.BackgroundTransparency = 1
    ReopenSubtext.Text = "Click to open • RShift"
    ReopenSubtext.TextColor3 = Theme.Text
    ReopenSubtext.TextTransparency = 0.4
    ReopenSubtext.TextSize = 11
    ReopenSubtext.Font = Enum.Font.Gotham
    ReopenSubtext.TextXAlignment = Enum.TextXAlignment.Left
    ReopenSubtext.Parent = ReopenTextContainer
    
    local ReopenClick = Instance.new("TextButton")
    ReopenClick.Size = UDim2.new(1, 0, 1, 0)
    ReopenClick.BackgroundTransparency = 1
    ReopenClick.Text = ""
    ReopenClick.Parent = ReopenButton
    
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Size = UDim2.new(1, -20, 1, -70)
    ContentContainer.Position = UDim2.new(0, 10, 0, 60)
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Parent = MainFrame
    
    local TabToggleButton = Instance.new("TextButton")
    TabToggleButton.Name = "TabToggle"
    TabToggleButton.Size = UDim2.new(0, 40, 0, 40)
    TabToggleButton.Position = UDim2.new(0, 5, 0, 5)
    TabToggleButton.BackgroundColor3 = Theme.Accent
    TabToggleButton.BackgroundTransparency = 0.2
    TabToggleButton.Text = "☰"
    TabToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabToggleButton.TextSize = 22
    TabToggleButton.Font = Enum.Font.GothamBold
    TabToggleButton.Parent = ContentContainer
    
    local TabToggleCorner = Instance.new("UICorner")
    TabToggleCorner.CornerRadius = UDim.new(0, 10)
    TabToggleCorner.Parent = TabToggleButton
    
    local TabToggleStroke = Instance.new("UIStroke")
    TabToggleStroke.Color = Theme.Accent
    TabToggleStroke.Thickness = 2
    TabToggleStroke.Transparency = 0.3
    TabToggleStroke.Parent = TabToggleButton
    
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(0, 150, 1, 0)
    TabContainer.Position = UDim2.new(0, 50, 0, 0)
    TabContainer.BackgroundColor3 = Theme.Secondary
    TabContainer.BorderSizePixel = 0
    TabContainer.Parent = ContentContainer
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 10)
    TabCorner.Parent = TabContainer
    
    local TabList = Instance.new("UIListLayout")
    TabList.SortOrder = Enum.SortOrder.LayoutOrder
    TabList.Padding = UDim.new(0, 8)
    TabList.Parent = TabContainer
    
    local TabPadding = Instance.new("UIPadding")
    TabPadding.PaddingTop = UDim.new(0, 8)
    TabPadding.PaddingBottom = UDim.new(0, 8)
    TabPadding.PaddingLeft = UDim.new(0, 8)
    TabPadding.PaddingRight = UDim.new(0, 8)
    TabPadding.Parent = TabContainer
    
    local PageContainer = Instance.new("Frame")
    PageContainer.Name = "PageContainer"
    PageContainer.Size = UDim2.new(1, -215, 1, 0)
    PageContainer.Position = UDim2.new(0, 210, 0, 0)
    PageContainer.BackgroundTransparency = 1
    PageContainer.Parent = ContentContainer
    
    local tabsVisible = true
    
    TabToggleButton.MouseButton1Click:Connect(function()
        tabsVisible = not tabsVisible
        if tabsVisible then
            TweenService:Create(TabContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(0, 50, 0, 0)}):Play()
            TweenService:Create(PageContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -215, 1, 0), Position = UDim2.new(0, 210, 0, 0)}):Play()
            TweenService:Create(TabToggleButton, TweenInfo.new(0.2), {Rotation = 0}):Play()
        else
            TweenService:Create(TabContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(0, -160, 0, 0)}):Play()
            TweenService:Create(PageContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -60, 1, 0), Position = UDim2.new(0, 55, 0, 0)}):Play()
            TweenService:Create(TabToggleButton, TweenInfo.new(0.2), {Rotation = 90}):Play()
        end
    end)
    
    TabToggleButton.MouseEnter:Connect(function()
        TweenService:Create(TabToggleButton, TweenInfo.new(0.2), {BackgroundTransparency = 0, Size = UDim2.new(0, 45, 0, 45)}):Play()
        TweenService:Create(TabToggleStroke, TweenInfo.new(0.2), {Thickness = 3, Transparency = 0.1}):Play()
    end)
    
    TabToggleButton.MouseLeave:Connect(function()
        TweenService:Create(TabToggleButton, TweenInfo.new(0.2), {BackgroundTransparency = 0.2, Size = UDim2.new(0, 40, 0, 40)}):Play()
        TweenService:Create(TabToggleStroke, TweenInfo.new(0.2), {Thickness = 2, Transparency = 0.3}):Play()
    end)
    
    TabContainer.MouseEnter:Connect(function()
        if not tabsVisible then
            TweenService:Create(TabContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(0, 50, 0, 0)}):Play()
            TweenService:Create(PageContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -215, 1, 0), Position = UDim2.new(0, 210, 0, 0)}):Play()
        end
    end)
    
    ContentContainer.MouseLeave:Connect(function()
        if not tabsVisible then
            TweenService:Create(TabContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(0, -160, 0, 0)}):Play()
            TweenService:Create(PageContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -60, 1, 0), Position = UDim2.new(0, 55, 0, 0)}):Play()
        end
    end)
    
    local dragging = false
    local dragInput, mousePos, framePos
    
    Header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            mousePos = input.Position
            framePos = MainFrame.Position
        end
    end)
    
    Header.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - mousePos
            TweenService:Create(
                MainFrame,
                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)}
            ):Play()
        end
    end)
    
    local isOpen = true
    local isMinimized = false
    
    local function closeUI()
        isOpen = false
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
        task.wait(0.3)
        MainFrame.Visible = false
        ReopenButton.Visible = true
        ReopenButton.Position = UDim2.new(0.5, -110, 0, -70)
        ReopenButton.BackgroundTransparency = 1
        TweenService:Create(ReopenButton, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -110, 0, 10), BackgroundTransparency = 0.1}):Play()
        TweenService:Create(ReopenStroke, TweenInfo.new(0.5), {Transparency = 0.4}):Play()
        TweenService:Create(ReopenText, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
        TweenService:Create(ReopenTextStroke, TweenInfo.new(0.5), {Transparency = 0.7}):Play()
        TweenService:Create(ReopenSubtext, TweenInfo.new(0.5), {TextTransparency = 0.4}):Play()
        TweenService:Create(ReopenIcon, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
        TweenService:Create(ReopenIconHolder, TweenInfo.new(0.5), {BackgroundTransparency = 0.2}):Play()
    end
    
    local function minimizeUI()
        isMinimized = not isMinimized
        if isMinimized then
            ContentContainer.Visible = false
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 650, 0, 50)}):Play()
        else
            ContentContainer.Visible = true
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 650, 0, 480)}):Play()
        end
    end
    
    local function openUI()
        isOpen = true
        isMinimized = false
        ContentContainer.Visible = true
        TweenService:Create(ReopenButton, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -110, 0, -70), BackgroundTransparency = 1}):Play()
        TweenService:Create(ReopenStroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
        TweenService:Create(ReopenText, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
        TweenService:Create(ReopenTextStroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
        TweenService:Create(ReopenSubtext, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
        TweenService:Create(ReopenIcon, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
        TweenService:Create(ReopenIconHolder, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
        task.wait(0.3)
        ReopenButton.Visible = false
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 650, 0, 480), Position = UDim2.new(0.5, -325, 0.5, -240)}):Play()
    end
    
    CloseButton.MouseButton1Click:Connect(closeUI)
    MinimizeButton.MouseButton1Click:Connect(minimizeUI)
    ReopenClick.MouseButton1Click:Connect(openUI)
    
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
            if isOpen then
                closeUI()
            else
                openUI()
            end
        end
    end)
    
    ReopenButton.MouseEnter:Connect(function()
        TweenService:Create(ReopenButton, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Size = UDim2.new(0, 240, 0, 65), BackgroundTransparency = 0.05}):Play()
        TweenService:Create(ReopenStroke, TweenInfo.new(0.3), {Thickness = 3.5, Transparency = 0.2}):Play()
        TweenService:Create(ReopenIconHolder, TweenInfo.new(0.3), {Size = UDim2.new(0, 50, 0, 50), BackgroundTransparency = 0.1}):Play()
        TweenService:Create(ReopenGlow, TweenInfo.new(0.3), {ImageTransparency = 0.3}):Play()
    end)
    
    ReopenButton.MouseLeave:Connect(function()
        TweenService:Create(ReopenButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 220, 0, 60), BackgroundTransparency = 0.1}):Play()
        TweenService:Create(ReopenStroke, TweenInfo.new(0.3), {Thickness = 2.5, Transparency = 0.4}):Play()
        TweenService:Create(ReopenIconHolder, TweenInfo.new(0.3), {Size = UDim2.new(0, 45, 0, 45), BackgroundTransparency = 0.2}):Play()
        TweenService:Create(ReopenGlow, TweenInfo.new(0.3), {ImageTransparency = 0.8}):Play()
    end)
    
    MinimizeButton.MouseEnter:Connect(function()
        TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Accent}):Play()
    end)
    
    MinimizeButton.MouseLeave:Connect(function()
        TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Tertiary}):Play()
    end)
    
    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 50, 50)}):Play()
    end)
    
    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Tertiary}):Play()
    end)
    
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 650, 0, 480), Position = UDim2.new(0.5, -325, 0.5, -240)}):Play()
    
    local Window = {
        Theme = Theme,
        Font = WindowFont,
        MainFrame = MainFrame,
        TabContainer = TabContainer,
        PageContainer = PageContainer
    }
    
    function Window:CreateTab(tabName)
        local Tab = {
            Theme = Theme,
            Font = WindowFont
        }
        
        local TabButton = Instance.new("TextButton")
        TabButton.Name = tabName
        TabButton.Size = UDim2.new(1, 0, 0, 38)
        TabButton.BackgroundColor3 = Theme.Tertiary
        TabButton.Text = tabName
        TabButton.TextColor3 = Theme.Text
        TabButton.TextSize = 14
        TabButton.Font = WindowFont
        TabButton.ClipsDescendants = true
        TabButton.Parent = TabContainer
        
        local TabBtnCorner = Instance.new("UICorner")
        TabBtnCorner.CornerRadius = UDim.new(0, 8)
        TabBtnCorner.Parent = TabButton
        
        local TabFill = Instance.new("Frame")
        TabFill.Name = "Fill"
        TabFill.Size = UDim2.new(0, 0, 1, 0)
        TabFill.BackgroundColor3 = Theme.Accent
        TabFill.BackgroundTransparency = 0.7
        TabFill.BorderSizePixel = 0
        TabFill.ZIndex = 0
        TabFill.Parent = TabButton
        
        local TabStroke = Instance.new("UIStroke")
        TabStroke.Color = Theme.Accent
        TabStroke.Thickness = 0
        TabStroke.Transparency = 1
        TabStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        TabStroke.Parent = TabButton
        
        local TabPage = Instance.new("ScrollingFrame")
        TabPage.Name = tabName .. "Page"
        TabPage.Size = UDim2.new(1, 0, 1, 0)
        TabPage.BackgroundTransparency = 1
        TabPage.ScrollBarThickness = 4
        TabPage.ScrollBarImageColor3 = Theme.Accent
        TabPage.BorderSizePixel = 0
        TabPage.Visible = false
        TabPage.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
        TabPage.Parent = PageContainer
        
        local PageList = Instance.new("UIListLayout")
        PageList.SortOrder = Enum.SortOrder.LayoutOrder
        PageList.Padding = UDim.new(0, 10)
        PageList.Parent = TabPage
        
        local PagePadding = Instance.new("UIPadding")
        PagePadding.PaddingTop = UDim.new(0, 5)
        PagePadding.PaddingBottom = UDim.new(0, 5)
        PagePadding.PaddingLeft = UDim.new(0, 5)
        PagePadding.PaddingRight = UDim.new(0, 10)
        PagePadding.Parent = TabPage
        
        TabButton.MouseButton1Click:Connect(function()
            for _, page in pairs(PageContainer:GetChildren()) do
                if page:IsA("ScrollingFrame") then
                    page.Visible = false
                end
            end
            
            for _, btn in pairs(TabContainer:GetChildren()) do
                if btn:IsA("TextButton") then
                    local fill = btn:FindFirstChild("Fill")
                    if fill then
                        TweenService:Create(fill, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 1, 0)}):Play()
                    end
                    TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Tertiary, TextColor3 = Theme.Text}):Play()
                    local stroke = btn:FindFirstChild("UIStroke")
                    if stroke then
                        TweenService:Create(stroke, TweenInfo.new(0.2), {Thickness = 0, Transparency = 1}):Play()
                    end
                end
            end
            
            TabPage.Visible = true
            TweenService:Create(TabFill, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 1, 0)}):Play()
            TweenService:Create(TabButton, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Accent, TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            TweenService:Create(TabStroke, TweenInfo.new(0.2), {Thickness = 2, Transparency = 0.3}):Play()
        end)
        
        if #TabContainer:GetChildren() == 2 then
            TabButton.BackgroundColor3 = Theme.Accent
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabFill.Size = UDim2.new(1, 0, 1, 0)
            TabStroke.Thickness = 2
            TabStroke.Transparency = 0.3
            TabPage.Visible = true
        end
        
        TabButton.MouseEnter:Connect(function()
            if TabPage.Visible == false then
                TweenService:Create(TabFill, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0.3, 0, 1, 0)}):Play()
                TweenService:Create(TabStroke, TweenInfo.new(0.2), {Thickness = 1, Transparency = 0.6}):Play()
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if TabPage.Visible == false then
                TweenService:Create(TabFill, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 0, 1, 0)}):Play()
                TweenService:Create(TabStroke, TweenInfo.new(0.2), {Thickness = 0, Transparency = 1}):Play()
            end
        end)
        
        function Tab:CreateSection(sectionName)
            local SectionFrame = Instance.new("Frame")
            SectionFrame.Name = sectionName
            SectionFrame.Size = UDim2.new(1, -5, 0, 35)
            SectionFrame.BackgroundTransparency = 1
            SectionFrame.Parent = TabPage
            
            local SectionLabel = Instance.new("TextLabel")
            SectionLabel.Size = UDim2.new(1, 0, 1, 0)
            SectionLabel.BackgroundTransparency = 1
            SectionLabel.Text = sectionName
            SectionLabel.TextColor3 = Theme.Accent
            SectionLabel.TextSize = 16
            SectionLabel.Font = Enum.Font.GothamBold
            SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
            SectionLabel.Parent = SectionFrame
            
            local SectionLine = Instance.new("Frame")
            SectionLine.Size = UDim2.new(1, 0, 0, 2)
            SectionLine.Position = UDim2.new(0, 0, 1, -2)
            SectionLine.BackgroundColor3 = Theme.Accent
            SectionLine.BackgroundTransparency = 0.7
            SectionLine.BorderSizePixel = 0
            SectionLine.Parent = SectionFrame
            
            local LineCorner = Instance.new("UICorner")
            LineCorner.CornerRadius = UDim.new(1, 0)
            LineCorner.Parent = SectionLine
            
            return SectionFrame
        end
        
        function Tab:CreateButton(config)
            local ButtonName = config.Name or "Button"
            local Callback = config.Callback or function() end
            
            local ButtonFrame = Instance.new("TextButton")
            ButtonFrame.Name = ButtonName
            ButtonFrame.Size = UDim2.new(1, -5, 0, 40)
            ButtonFrame.BackgroundColor3 = Theme.Tertiary
            ButtonFrame.AutoButtonColor = false
            ButtonFrame.Text = ""
            ButtonFrame.Parent = TabPage
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 8)
            ButtonCorner.Parent = ButtonFrame
            
            local ButtonStroke = Instance.new("UIStroke")
            ButtonStroke.Color = Theme.Accent
            ButtonStroke.Thickness = 0
            ButtonStroke.Transparency = 1
            ButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            ButtonStroke.Parent = ButtonFrame
            
            local ButtonLabel = Instance.new("TextLabel")
            ButtonLabel.Size = UDim2.new(1, -20, 1, 0)
            ButtonLabel.Position = UDim2.new(0, 10, 0, 0)
            ButtonLabel.BackgroundTransparency = 1
            ButtonLabel.Text = ButtonName
            ButtonLabel.TextColor3 = Theme.Text
            ButtonLabel.TextSize = 14
            ButtonLabel.Font = WindowFont
            ButtonLabel.TextXAlignment = Enum.TextXAlignment.Left
            ButtonLabel.Parent = ButtonFrame
            
            ButtonFrame.MouseEnter:Connect(function()
                TweenService:Create(ButtonFrame, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Secondary}):Play()
                TweenService:Create(ButtonStroke, TweenInfo.new(0.2), {Thickness = 2, Transparency = 0.5}):Play()
            end)
            
            ButtonFrame.MouseLeave:Connect(function()
                TweenService:Create(ButtonFrame, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Tertiary}):Play()
                TweenService:Create(ButtonStroke, TweenInfo.new(0.2), {Thickness = 0, Transparency = 1}):Play()
            end)
            
            ButtonFrame.MouseButton1Down:Connect(function()
                TweenService:Create(ButtonFrame, TweenInfo.new(0.1), {BackgroundColor3 = Theme.Accent}):Play()
                TweenService:Create(ButtonLabel, TweenInfo.new(0.1), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            end)
            
            ButtonFrame.MouseButton1Up:Connect(function()
                TweenService:Create(ButtonFrame, TweenInfo.new(0.1), {BackgroundColor3 = Theme.Secondary}):Play()
                TweenService:Create(ButtonLabel, TweenInfo.new(0.1), {TextColor3 = Theme.Text}):Play()
            end)
            
            ButtonFrame.MouseButton1Click:Connect(function()
                Callback()
            end)
            
            return ButtonFrame
        end
        
        function Tab:CreateToggle(config)
            local ToggleName = config.Name or "Toggle"
            local Default = config.Default or false
            local Callback = config.Callback or function() end
            
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Size = UDim2.new(1, -5, 0, 40)
            ToggleFrame.BackgroundColor3 = Theme.Tertiary
            ToggleFrame.Parent = TabPage
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 8)
            ToggleCorner.Parent = ToggleFrame
            
            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Size = UDim2.new(1, -70, 1, 0)
            ToggleLabel.Position = UDim2.new(0, 10, 0, 0)
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Text = ToggleName
            ToggleLabel.TextColor3 = Theme.Text
            ToggleLabel.TextSize = 14
            ToggleLabel.Font = WindowFont
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            ToggleLabel.Parent = ToggleFrame
            
            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Size = UDim2.new(0, 45, 0, 22)
            ToggleButton.Position = UDim2.new(1, -55, 0.5, -11)
            ToggleButton.BackgroundColor3 = Default and Theme.Accent or Theme.Secondary
            ToggleButton.Text = ""
            ToggleButton.Parent = ToggleFrame
            
            local ToggleBtnCorner = Instance.new("UICorner")
            ToggleBtnCorner.CornerRadius = UDim.new(1, 0)
            ToggleBtnCorner.Parent = ToggleButton
            
            local ToggleCircle = Instance.new("Frame")
            ToggleCircle.Size = UDim2.new(0, 18, 0, 18)
            ToggleCircle.Position = Default and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
            ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleCircle.Parent = ToggleButton
            
            local CircleCorner = Instance.new("UICorner")
            CircleCorner.CornerRadius = UDim.new(1, 0)
            CircleCorner.Parent = ToggleCircle
            
            local CircleStroke = Instance.new("UIStroke")
            CircleStroke.Color = Theme.Accent
            CircleStroke.Thickness = 2
            CircleStroke.Transparency = Default and 0.3 or 1
            CircleStroke.Parent = ToggleCircle
            
            local toggled = Default
            
            ToggleButton.MouseButton1Click:Connect(function()
                toggled = not toggled
                
                TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = toggled and Theme.Accent or Theme.Secondary}):Play()
                TweenService:Create(ToggleCircle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Position = toggled and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)}):Play()
                TweenService:Create(CircleStroke, TweenInfo.new(0.2), {Transparency = toggled and 0.3 or 1}):Play()
                
                Callback(toggled)
            end)
            
            ToggleFrame.MouseEnter:Connect(function()
                TweenService:Create(ToggleFrame, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Secondary}):Play()
            end)
            
            ToggleFrame.MouseLeave:Connect(function()
                TweenService:Create(ToggleFrame, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Tertiary}):Play()
            end)
            
            return ToggleFrame
        end
        
        function Tab:CreateSlider(config)
            local SliderName = config.Name or "Slider"
            local Min = config.Min or 0
            local Max = config.Max or 100
            local Default = config.Default or 50
            local Callback = config.Callback or function() end
            
            local SliderFrame = Instance.new("Frame")
            SliderFrame.Size = UDim2.new(1, -5, 0, 60)
            SliderFrame.BackgroundColor3 = Theme.Tertiary
            SliderFrame.Parent = TabPage
            
            local SliderCorner = Instance.new("UICorner")
            SliderCorner.CornerRadius = UDim.new(0, 8)
            SliderCorner.Parent = SliderFrame
            
            local SliderLabel = Instance.new("TextLabel")
            SliderLabel.Size = UDim2.new(1, -70, 0, 20)
            SliderLabel.Position = UDim2.new(0, 10, 0, 8)
            SliderLabel.BackgroundTransparency = 1
            SliderLabel.Text = SliderName
            SliderLabel.TextColor3 = Theme.Text
            SliderLabel.TextSize = 14
            SliderLabel.Font = WindowFont
            SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            SliderLabel.Parent = SliderFrame
            
            local ValueLabel = Instance.new("TextLabel")
            ValueLabel.Size = UDim2.new(0, 60, 0, 20)
            ValueLabel.Position = UDim2.new(1, -65, 0, 8)
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.Text = tostring(Default)
            ValueLabel.TextColor3 = Theme.Accent
            ValueLabel.TextSize = 14
            ValueLabel.Font = Enum.Font.GothamBold
            ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
            ValueLabel.Parent = SliderFrame
            
            local SliderBack = Instance.new("Frame")
            SliderBack.Size = UDim2.new(1, -20, 0, 6)
            SliderBack.Position = UDim2.new(0, 10, 1, -20)
            SliderBack.BackgroundColor3 = Theme.Secondary
            SliderBack.BorderSizePixel = 0
            SliderBack.Parent = SliderFrame
            
            local SliderBackCorner = Instance.new("UICorner")
            SliderBackCorner.CornerRadius = UDim.new(1, 0)
            SliderBackCorner.Parent = SliderBack
            
            local SliderFill = Instance.new("Frame")
            SliderFill.Size = UDim2.new((Default - Min) / (Max - Min), 0, 1, 0)
            SliderFill.BackgroundColor3 = Theme.Accent
            SliderFill.BorderSizePixel = 0
            SliderFill.Parent = SliderBack
            
            local SliderFillCorner = Instance.new("UICorner")
            SliderFillCorner.CornerRadius = UDim.new(1, 0)
            SliderFillCorner.Parent = SliderFill
            
            local SliderDot = Instance.new("Frame")
            SliderDot.Size = UDim2.new(0, 14, 0, 14)
            SliderDot.Position = UDim2.new(1, -7, 0.5, -7)
            SliderDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderDot.BorderSizePixel = 0
            SliderDot.Parent = SliderFill
            
            local DotCorner = Instance.new("UICorner")
            DotCorner.CornerRadius = UDim.new(1, 0)
            DotCorner.Parent = SliderDot
            
            local DotStroke = Instance.new("UIStroke")
            DotStroke.Color = Theme.Accent
            DotStroke.Thickness = 2
            DotStroke.Parent = SliderDot
            
            local dragging = false
            
            SliderBack.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                end
            end)
            
            SliderBack.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    local pos = math.clamp((input.Position.X - SliderBack.AbsolutePosition.X) / SliderBack.AbsoluteSize.X, 0, 1)
                    local val = math.floor(Min + (Max - Min) * pos)
                    
                    TweenService:Create(SliderFill, TweenInfo.new(0.1), {Size = UDim2.new(pos, 0, 1, 0)}):Play()
                    ValueLabel.Text = tostring(val)
                    Callback(val)
                end
            end)
            
            SliderFrame.MouseEnter:Connect(function()
                TweenService:Create(SliderFrame, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Secondary}):Play()
                TweenService:Create(SliderDot, TweenInfo.new(0.2), {Size = UDim2.new(0, 18, 0, 18), Position = UDim2.new(1, -9, 0.5, -9)}):Play()
            end)
            
            SliderFrame.MouseLeave:Connect(function()
                TweenService:Create(SliderFrame, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Tertiary}):Play()
                TweenService:Create(SliderDot, TweenInfo.new(0.2), {Size = UDim2.new(0, 14, 0, 14), Position = UDim2.new(1, -7, 0.5, -7)}):Play()
            end)
            
            return SliderFrame
        end
        
        function Tab:CreateLabel(config)
            local LabelText = config.Text or "Label"
            
            local LabelFrame = Instance.new("Frame")
            LabelFrame.Size = UDim2.new(1, -5, 0, 35)
            LabelFrame.BackgroundColor3 = Theme.Tertiary
            LabelFrame.Parent = TabPage
            
            local LabelCorner = Instance.new("UICorner")
            LabelCorner.CornerRadius = UDim.new(0, 8)
            LabelCorner.Parent = LabelFrame
            
            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -20, 1, 0)
            Label.Position = UDim2.new(0, 10, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Text = LabelText
            Label.TextColor3 = Theme.Text
            Label.TextSize = 14
            Label.Font = WindowFont
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextWrapped = true
            Label.Parent = LabelFrame
            
            local LabelFunctions = {}
            
            function LabelFunctions:SetText(newText)
                Label.Text = newText
            end
            
            return LabelFunctions
        end
        
        function Tab:CreateInput(config)
            local InputName = config.Name or "Input"
            local Placeholder = config.Placeholder or "Enter text..."
            local Callback = config.Callback or function() end
            
            local InputFrame = Instance.new("Frame")
            InputFrame.Size = UDim2.new(1, -5, 0, 65)
            InputFrame.BackgroundColor3 = Theme.Tertiary
            InputFrame.Parent = TabPage
            
            local InputCorner = Instance.new("UICorner")
            InputCorner.CornerRadius = UDim.new(0, 8)
            InputCorner.Parent = InputFrame
            
            local InputLabel = Instance.new("TextLabel")
            InputLabel.Size = UDim2.new(1, -20, 0, 20)
            InputLabel.Position = UDim2.new(0, 10, 0, 8)
            InputLabel.BackgroundTransparency = 1
            InputLabel.Text = InputName
            InputLabel.TextColor3 = Theme.Text
            InputLabel.TextSize = 14
            InputLabel.Font = WindowFont
            InputLabel.TextXAlignment = Enum.TextXAlignment.Left
            InputLabel.Parent = InputFrame
            
            local InputBox = Instance.new("TextBox")
            InputBox.Size = UDim2.new(1, -20, 0, 28)
            InputBox.Position = UDim2.new(0, 10, 1, -35)
            InputBox.BackgroundColor3 = Theme.Secondary
            InputBox.PlaceholderText = Placeholder
            InputBox.PlaceholderColor3 = Theme.Text
            InputBox.Text = ""
            InputBox.TextColor3 = Theme.Text
            InputBox.TextSize = 13
            InputBox.Font = Enum.Font.Gotham
            InputBox.ClearTextOnFocus = false
            InputBox.Parent = InputFrame
            
            local InputBoxCorner = Instance.new("UICorner")
            InputBoxCorner.CornerRadius = UDim.new(0, 6)
            InputBoxCorner.Parent = InputBox
            
            local InputStroke = Instance.new("UIStroke")
            InputStroke.Color = Theme.Accent
            InputStroke.Thickness = 0
            InputStroke.Transparency = 1
            InputStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            InputStroke.Parent = InputBox
            
            InputBox.Focused:Connect(function()
                TweenService:Create(InputStroke, TweenInfo.new(0.2), {Thickness = 2, Transparency = 0.5}):Play()
            end)
            
            InputBox.FocusLost:Connect(function(enter)
                TweenService:Create(InputStroke, TweenInfo.new(0.2), {Thickness = 0, Transparency = 1}):Play()
                if enter then
                    Callback(InputBox.Text)
                end
            end)
            
            return InputFrame
        end
        
        function Tab:CreateDropdown(config)
            local DropdownName = config.Name or "Dropdown"
            local Options = config.Options or {"Option 1", "Option 2"}
            local Default = config.Default or Options[1]
            local Callback = config.Callback or function() end
            
            local DropdownFrame = Instance.new("Frame")
            DropdownFrame.Size = UDim2.new(1, -5, 0, 40)
            DropdownFrame.BackgroundColor3 = Theme.Tertiary
            DropdownFrame.ClipsDescendants = true
            DropdownFrame.Parent = TabPage
            
            local DropdownCorner = Instance.new("UICorner")
            DropdownCorner.CornerRadius = UDim.new(0, 8)
            DropdownCorner.Parent = DropdownFrame
            
            local DropdownButton = Instance.new("TextButton")
            DropdownButton.Size = UDim2.new(1, 0, 0, 40)
            DropdownButton.BackgroundTransparency = 1
            DropdownButton.Text = ""
            DropdownButton.Parent = DropdownFrame
            
            local DropdownLabel = Instance.new("TextLabel")
            DropdownLabel.Size = UDim2.new(1, -50, 0, 40)
            DropdownLabel.Position = UDim2.new(0, 10, 0, 0)
            DropdownLabel.BackgroundTransparency = 1
            DropdownLabel.Text = DropdownName
            DropdownLabel.TextColor3 = Theme.Text
            DropdownLabel.TextSize = 14
            DropdownLabel.Font = WindowFont
            DropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
            DropdownLabel.Parent = DropdownFrame
            
            local SelectedLabel = Instance.new("TextLabel")
            SelectedLabel.Size = UDim2.new(0, 120, 0, 40)
            SelectedLabel.Position = UDim2.new(1, -130, 0, 0)
            SelectedLabel.BackgroundTransparency = 1
            SelectedLabel.Text = Default
            SelectedLabel.TextColor3 = Theme.Accent
            SelectedLabel.TextSize = 13
            SelectedLabel.Font = Enum.Font.GothamBold
            SelectedLabel.TextXAlignment = Enum.TextXAlignment.Right
            SelectedLabel.Parent = DropdownFrame
            
            local Arrow = Instance.new("TextLabel")
            Arrow.Size = UDim2.new(0, 20, 0, 40)
            Arrow.Position = UDim2.new(1, -25, 0, 0)
            Arrow.BackgroundTransparency = 1
            Arrow.Text = "▼"
            Arrow.TextColor3 = Theme.Text
            Arrow.TextSize = 12
            Arrow.Font = Enum.Font.GothamBold
            Arrow.Parent = DropdownFrame
            
            local OptionsContainer = Instance.new("Frame")
            OptionsContainer.Size = UDim2.new(1, 0, 0, 0)
            OptionsContainer.Position = UDim2.new(0, 0, 0, 40)
            OptionsContainer.BackgroundTransparency = 1
            OptionsContainer.Parent = DropdownFrame
            
            local OptionsList = Instance.new("UIListLayout")
            OptionsList.SortOrder = Enum.SortOrder.LayoutOrder
            OptionsList.Padding = UDim.new(0, 2)
            OptionsList.Parent = OptionsContainer
            
            local isOpen = false
            
            for _, option in ipairs(Options) do
                local OptionButton = Instance.new("TextButton")
                OptionButton.Size = UDim2.new(1, 0, 0, 30)
                OptionButton.BackgroundColor3 = Theme.Secondary
                OptionButton.Text = option
                OptionButton.TextColor3 = Theme.Text
                OptionButton.TextSize = 13
                OptionButton.Font = Enum.Font.Gotham
                OptionButton.Parent = OptionsContainer
                
                OptionButton.MouseEnter:Connect(function()
                    TweenService:Create(OptionButton, TweenInfo.new(0.1), {BackgroundColor3 = Theme.Accent}):Play()
                end)
                
                OptionButton.MouseLeave:Connect(function()
                    TweenService:Create(OptionButton, TweenInfo.new(0.1), {BackgroundColor3 = Theme.Secondary}):Play()
                end)
                
                OptionButton.MouseButton1Click:Connect(function()
                    SelectedLabel.Text = option
                    Callback(option)
                    isOpen = false
                    TweenService:Create(DropdownFrame, TweenInfo.new(0.3), {Size = UDim2.new(1, -5, 0, 40)}):Play()
                    TweenService:Create(Arrow, TweenInfo.new(0.2), {Rotation = 0}):Play()
                end)
            end
            
            DropdownButton.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                if isOpen then
                    local optionHeight = #Options * 32 + 40
                    TweenService:Create(DropdownFrame, TweenInfo.new(0.3), {Size = UDim2.new(1, -5, 0, optionHeight)}):Play()
                    TweenService:Create(Arrow, TweenInfo.new(0.2), {Rotation = 180}):Play()
                else
                    TweenService:Create(DropdownFrame, TweenInfo.new(0.3), {Size = UDim2.new(1, -5, 0, 40)}):Play()
                    TweenService:Create(Arrow, TweenInfo.new(0.2), {Rotation = 0}):Play()
                end
            end)
            
            return DropdownFrame
        end
        
        function Tab:CreateImage(config)
            local ImageId = config.Image or ""
            local ImageSize = config.Size or UDim2.new(1, -5, 0, 150)
            
            local ImageFrame = Instance.new("Frame")
            ImageFrame.Size = ImageSize
            ImageFrame.BackgroundColor3 = Theme.Tertiary
            ImageFrame.Parent = TabPage
            
            local ImageCorner = Instance.new("UICorner")
            ImageCorner.CornerRadius = UDim.new(0, 8)
            ImageCorner.Parent = ImageFrame
            
            local Image = Instance.new("ImageLabel")
            Image.Size = UDim2.new(1, -10, 1, -10)
            Image.Position = UDim2.new(0, 5, 0, 5)
            Image.BackgroundTransparency = 1
            Image.Image = ImageId
            Image.ScaleType = Enum.ScaleType.Fit
            Image.Parent = ImageFrame
            
            local ImageImgCorner = Instance.new("UICorner")
            ImageImgCorner.CornerRadius = UDim.new(0, 6)
            ImageImgCorner.Parent = Image
            
            local ImageFunctions = {}
            
            function ImageFunctions:SetImage(newImage)
                Image.Image = newImage
            end
            
            return ImageFunctions
        end
        
        function Tab:CreateKeybind(config)
            local KeybindName = config.Name or "Keybind"
            local Default = config.Default or Enum.KeyCode.E
            local Callback = config.Callback or function() end
            
            local KeybindFrame = Instance.new("Frame")
            KeybindFrame.Size = UDim2.new(1, -5, 0, 40)
            KeybindFrame.BackgroundColor3 = Theme.Tertiary
            KeybindFrame.Parent = TabPage
            
            local KeybindCorner = Instance.new("UICorner")
            KeybindCorner.CornerRadius = UDim.new(0, 8)
            KeybindCorner.Parent = KeybindFrame
            
            local KeybindLabel = Instance.new("TextLabel")
            KeybindLabel.Size = UDim2.new(1, -110, 1, 0)
            KeybindLabel.Position = UDim2.new(0, 10, 0, 0)
            KeybindLabel.BackgroundTransparency = 1
            KeybindLabel.Text = KeybindName
            KeybindLabel.TextColor3 = Theme.Text
            KeybindLabel.TextSize = 14
            KeybindLabel.Font = WindowFont
            KeybindLabel.TextXAlignment = Enum.TextXAlignment.Left
            KeybindLabel.Parent = KeybindFrame
            
            local KeybindButton = Instance.new("TextButton")
            KeybindButton.Size = UDim2.new(0, 90, 0, 28)
            KeybindButton.Position = UDim2.new(1, -100, 0.5, -14)
            KeybindButton.BackgroundColor3 = Theme.Secondary
            KeybindButton.Text = Default.Name
            KeybindButton.TextColor3 = Theme.Accent
            KeybindButton.TextSize = 13
            KeybindButton.Font = Enum.Font.GothamBold
            KeybindButton.Parent = KeybindFrame
            
            local KeybindBtnCorner = Instance.new("UICorner")
            KeybindBtnCorner.CornerRadius = UDim.new(0, 6)
            KeybindBtnCorner.Parent = KeybindButton
            
            local KeybindStroke = Instance.new("UIStroke")
            KeybindStroke.Color = Theme.Accent
            KeybindStroke.Thickness = 0
            KeybindStroke.Transparency = 1
            KeybindStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            KeybindStroke.Parent = KeybindButton
            
            local currentKey = Default
            local binding = false
            
            KeybindButton.MouseButton1Click:Connect(function()
                binding = true
                KeybindButton.Text = "..."
                TweenService:Create(KeybindStroke, TweenInfo.new(0.2), {Thickness = 2, Transparency = 0.3}):Play()
            end)
            
            UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if binding and not gameProcessed then
                    if input.UserInputType == Enum.UserInputType.Keyboard then
                        currentKey = input.KeyCode
                        KeybindButton.Text = input.KeyCode.Name
                        binding = false
                        TweenService:Create(KeybindStroke, TweenInfo.new(0.2), {Thickness = 0, Transparency = 1}):Play()
                    end
                elseif input.KeyCode == currentKey and not gameProcessed then
                    Callback()
                end
            end)
            
            return KeybindFrame
        end
        
        function Tab:CreateColorPicker(config)
            local ColorName = config.Name or "Color Picker"
            local Default = config.Default or Color3.fromRGB(255, 50, 150)
            local Callback = config.Callback or function() end
            
            local ColorFrame = Instance.new("Frame")
            ColorFrame.Size = UDim2.new(1, -5, 0, 40)
            ColorFrame.BackgroundColor3 = Theme.Tertiary
            ColorFrame.Parent = TabPage
            
            local ColorCorner = Instance.new("UICorner")
            ColorCorner.CornerRadius = UDim.new(0, 8)
            ColorCorner.Parent = ColorFrame
            
            local ColorLabel = Instance.new("TextLabel")
            ColorLabel.Size = UDim2.new(1, -70, 1, 0)
            ColorLabel.Position = UDim2.new(0, 10, 0, 0)
            ColorLabel.BackgroundTransparency = 1
            ColorLabel.Text = ColorName
            ColorLabel.TextColor3 = Theme.Text
            ColorLabel.TextSize = 14
            ColorLabel.Font = WindowFont
            ColorLabel.TextXAlignment = Enum.TextXAlignment.Left
            ColorLabel.Parent = ColorFrame
            
            local ColorDisplay = Instance.new("Frame")
            ColorDisplay.Size = UDim2.new(0, 50, 0, 28)
            ColorDisplay.Position = UDim2.new(1, -60, 0.5, -14)
            ColorDisplay.BackgroundColor3 = Default
            ColorDisplay.BorderSizePixel = 0
            ColorDisplay.Parent = ColorFrame
            
            local ColorDisplayCorner = Instance.new("UICorner")
            ColorDisplayCorner.CornerRadius = UDim.new(0, 6)
            ColorDisplayCorner.Parent = ColorDisplay
            
            local ColorDisplayStroke = Instance.new("UIStroke")
            ColorDisplayStroke.Color = Theme.Accent
            ColorDisplayStroke.Thickness = 2
            ColorDisplayStroke.Transparency = 0.5
            ColorDisplayStroke.Parent = ColorDisplay
            
            local ColorButton = Instance.new("TextButton")
            ColorButton.Size = UDim2.new(1, 0, 1, 0)
            ColorButton.BackgroundTransparency = 1
            ColorButton.Text = ""
            ColorButton.Parent = ColorDisplay
            
            ColorButton.MouseButton1Click:Connect(function()
                local r = math.random(0, 255)
                local g = math.random(0, 255)
                local b = math.random(0, 255)
                local newColor = Color3.fromRGB(r, g, b)
                
                TweenService:Create(ColorDisplay, TweenInfo.new(0.3), {BackgroundColor3 = newColor}):Play()
                Callback(newColor)
            end)
            
            ColorFrame.MouseEnter:Connect(function()
                TweenService:Create(ColorFrame, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Secondary}):Play()
            end)
            
            ColorFrame.MouseLeave:Connect(function()
                TweenService:Create(ColorFrame, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Tertiary}):Play()
            end)
            
            return ColorFrame
        end
        
        Tab.Page = TabPage
        
        return Tab
    end
    
    return Window
end

return MainLibrary
