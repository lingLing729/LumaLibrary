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
    ReopenButton.Size = UDim2.new(0, 180, 0, 50)
    ReopenButton.Position = UDim2.new(0.5, -90, 0, 10)
    ReopenButton.BackgroundColor3 = Theme.Secondary
    ReopenButton.BackgroundTransparency = 0.2
    ReopenButton.BorderSizePixel = 0
    ReopenButton.Visible = false
    ReopenButton.Parent = ScreenGui
    
    local ReopenCorner = Instance.new("UICorner")
    ReopenCorner.CornerRadius = UDim.new(0, 12)
    ReopenCorner.Parent = ReopenButton
    
    local ReopenStroke = Instance.new("UIStroke")
    ReopenStroke.Color = Theme.Accent
    ReopenStroke.Thickness = 2
    ReopenStroke.Transparency = 0.5
    ReopenStroke.Parent = ReopenButton
    
    local ReopenIcon = Instance.new("ImageLabel")
    ReopenIcon.Size = UDim2.new(0, 35, 0, 35)
    ReopenIcon.Position = UDim2.new(0, 10, 0.5, -17.5)
    ReopenIcon.BackgroundTransparency = 1
    ReopenIcon.Image = WindowIcon
    ReopenIcon.ScaleType = Enum.ScaleType.Fit
    ReopenIcon.Parent = ReopenButton
    
    local ReopenText = Instance.new("TextLabel")
    ReopenText.Size = UDim2.new(1, -55, 1, 0)
    ReopenText.Position = UDim2.new(0, 50, 0, 0)
    ReopenText.BackgroundTransparency = 1
    ReopenText.Text = WindowName
    ReopenText.TextColor3 = Theme.Text
    ReopenText.TextSize = 16
    ReopenText.Font = WindowFont
    ReopenText.TextXAlignment = Enum.TextXAlignment.Left
    ReopenText.Parent = ReopenButton
    
    local ReopenClick = Instance.new("TextButton")
    ReopenClick.Size = UDim2.new(1, 0, 1, 0)
    ReopenClick.BackgroundTransparency = 1
    ReopenClick.Text = ""
    ReopenClick.Parent = ReopenButton
    
    local TabToggleButton = Instance.new("TextButton")
    TabToggleButton.Name = "TabToggle"
    TabToggleButton.Size = UDim2.new(0, 35, 1, -20)
    TabToggleButton.Position = UDim2.new(0, 10, 0, 10)
    TabToggleButton.BackgroundColor3 = Theme.Tertiary
    TabToggleButton.Text = "☰"
    TabToggleButton.TextColor3 = Theme.Text
    TabToggleButton.TextSize = 20
    TabToggleButton.Font = Enum.Font.GothamBold
    TabToggleButton.Visible = false
    TabToggleButton.Parent = MainFrame
    
    local TabToggleCorner = Instance.new("UICorner")
    TabToggleCorner.CornerRadius = UDim.new(0, 8)
    TabToggleCorner.Parent = TabToggleButton
    
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Size = UDim2.new(1, -20, 1, -70)
    ContentContainer.Position = UDim2.new(0, 10, 0, 60)
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Parent = MainFrame
    
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(0, 150, 1, 0)
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
    PageContainer.Size = UDim2.new(1, -170, 1, 0)
    PageContainer.Position = UDim2.new(0, 160, 0, 0)
    PageContainer.BackgroundTransparency = 1
    PageContainer.Parent = ContentContainer
    
    local tabsVisible = true
    
    TabContainer.MouseEnter:Connect(function()
        if not tabsVisible then
            TweenService:Create(TabContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(0, 0, 0, 0)}):Play()
            TweenService:Create(PageContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -170, 1, 0), Position = UDim2.new(0, 160, 0, 0)}):Play()
        end
    end)
    
    ContentContainer.MouseLeave:Connect(function()
        if not tabsVisible then
            TweenService:Create(TabContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(0, -160, 0, 0)}):Play()
            TweenService:Create(PageContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0)}):Play()
        end
    end)
    
    TabToggleButton.MouseButton1Click:Connect(function()
        tabsVisible = not tabsVisible
        if tabsVisible then
            TweenService:Create(TabContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(0, 0, 0, 0)}):Play()
            TweenService:Create(PageContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(1, -170, 1, 0), Position = UDim2.new(0, 160, 0, 0)}):Play()
            TabToggleButton.Text = "☰"
        else
            TweenService:Create(TabContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(0, -160, 0, 0)}):Play()
            TweenService:Create(PageContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0)}):Play()
            TabToggleButton.Text = "☰"
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
        ReopenButton.Position = UDim2.new(0.5, -90, 0, -60)
        TweenService:Create(ReopenButton, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -90, 0, 10), BackgroundTransparency = 0.2}):Play()
    end
    
    local function minimizeUI()
        isMinimized = not isMinimized
        if isMinimized then
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 650, 0, 50)}):Play()
        else
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 650, 0, 480)}):Play()
        end
    end
    
    local function openUI()
        isOpen = true
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
        TweenService:Create(ReopenButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 200, 0, 55), BackgroundTransparency = 0.1}):Play()
        TweenService:Create(ReopenStroke, TweenInfo.new(0.2), {Thickness = 3, Transparency = 0.2}):Play()
    end)
    
    ReopenButton.MouseLeave:Connect(function()
        TweenService:Create(ReopenButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 180, 0, 50), BackgroundTransparency = 0.2}):Play()
        TweenService:Create(ReopenStroke, TweenInfo.new(0.2), {Thickness = 2, Transparency = 0.5}):Play()
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
        
        Tab.Page = TabPage
        
        return Tab
    end
    
    return Window
end

return MainLibrary
