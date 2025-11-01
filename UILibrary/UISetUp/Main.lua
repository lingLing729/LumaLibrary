local MainLibrary = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function MainLibrary:CreateWindow(config)
    local WindowName = config.Name or "LumaHub"
    local WindowIcon = config.Icon or nil
    local WindowFont = config.Font or Enum.Font.GothamBold
    local AccentColor = config.AccentColor or Color3.fromRGB(255, 50, 150)
    local LoadSound = config.LoadSound or "rbxassetid://6026984224"
    
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
    MainFrame.Size = UDim2.new(0, 600, 0, 450)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -225)
    MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 23)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame
    
    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = AccentColor
    MainStroke.Thickness = 2
    MainStroke.Transparency = 0.5
    MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    MainStroke.Parent = MainFrame
    
    task.spawn(function()
        while MainStroke.Parent do
            TweenService:Create(MainStroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.2}):Play()
            task.wait(2)
            TweenService:Create(MainStroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.6}):Play()
            task.wait(2)
        end
    end)
    
    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Size = UDim2.new(1, 0, 0, 50)
    Header.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    Header.BorderSizePixel = 0
    Header.Parent = MainFrame
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 12)
    HeaderCorner.Parent = Header
    
    local HeaderBottom = Instance.new("Frame")
    HeaderBottom.Size = UDim2.new(1, 0, 0, 12)
    HeaderBottom.Position = UDim2.new(0, 0, 1, -12)
    HeaderBottom.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    HeaderBottom.BorderSizePixel = 0
    HeaderBottom.Parent = Header
    
    local IconHolder = Instance.new("Frame")
    IconHolder.Name = "IconHolder"
    IconHolder.Size = UDim2.new(0, 35, 0, 35)
    IconHolder.Position = UDim2.new(0, 10, 0.5, -17.5)
    IconHolder.BackgroundColor3 = AccentColor
    IconHolder.BorderSizePixel = 0
    IconHolder.Parent = Header
    
    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 8)
    IconCorner.Parent = IconHolder
    
    local IconStroke = Instance.new("UIStroke")
    IconStroke.Color = AccentColor
    IconStroke.Thickness = 2
    IconStroke.Transparency = 0.3
    IconStroke.Parent = IconHolder
    
    if WindowIcon then
        local Icon = Instance.new("ImageLabel")
        Icon.Size = UDim2.new(1, -6, 1, -6)
        Icon.Position = UDim2.new(0, 3, 0, 3)
        Icon.BackgroundTransparency = 1
        Icon.Image = WindowIcon
        Icon.ScaleType = Enum.ScaleType.Fit
        Icon.Parent = IconHolder
    else
        local IconText = Instance.new("TextLabel")
        IconText.Size = UDim2.new(1, 0, 1, 0)
        IconText.BackgroundTransparency = 1
        IconText.Text = "L"
        IconText.TextColor3 = Color3.fromRGB(255, 255, 255)
        IconText.TextSize = 24
        IconText.Font = Enum.Font.FredokaOne
        IconText.Parent = IconHolder
    end
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, -140, 1, 0)
    Title.Position = UDim2.new(0, 55, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = WindowName
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.Font = WindowFont
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Header
    
    local TitleStroke = Instance.new("UIStroke")
    TitleStroke.Color = AccentColor
    TitleStroke.Thickness = 1
    TitleStroke.Transparency = 0.7
    TitleStroke.Parent = Title
    
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Size = UDim2.new(0, 35, 0, 35)
    MinimizeButton.Position = UDim2.new(1, -80, 0.5, -17.5)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    MinimizeButton.Text = "−"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
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
    CloseButton.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 24
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Parent = Header
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 8)
    CloseCorner.Parent = CloseButton
    
    local ReopenButton = Instance.new("TextButton")
    ReopenButton.Name = "ReopenButton"
    ReopenButton.Size = UDim2.new(0, 50, 0, 20)
    ReopenButton.Position = UDim2.new(0.5, -25, 0, 5)
    ReopenButton.BackgroundColor3 = AccentColor
    ReopenButton.BackgroundTransparency = 0.3
    ReopenButton.Text = "▼"
    ReopenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ReopenButton.TextSize = 14
    ReopenButton.Font = Enum.Font.GothamBold
    ReopenButton.Visible = false
    ReopenButton.Parent = ScreenGui
    
    local ReopenCorner = Instance.new("UICorner")
    ReopenCorner.CornerRadius = UDim.new(0, 10)
    ReopenCorner.Parent = ReopenButton
    
    local ReopenStroke = Instance.new("UIStroke")
    ReopenStroke.Color = AccentColor
    ReopenStroke.Thickness = 2
    ReopenStroke.Transparency = 0.5
    ReopenStroke.Parent = ReopenButton
    
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Size = UDim2.new(1, -20, 1, -70)
    ContentContainer.Position = UDim2.new(0, 10, 0, 60)
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Parent = MainFrame
    
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(0, 140, 1, 0)
    TabContainer.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
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
    PageContainer.Size = UDim2.new(1, -160, 1, 0)
    PageContainer.Position = UDim2.new(0, 150, 0, 0)
    PageContainer.BackgroundTransparency = 1
    PageContainer.Parent = ContentContainer
    
    local dragging = false
    local dragInput, mousePos, framePos
    
    Header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = MainFrame.Position
        end
    end)
    
    Header.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - mousePos
            TweenService:Create(
                MainFrame,
                TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)}
            ):Play()
        end
    end)
    
    local isOpen = true
    
    local function toggleUI()
        isOpen = not isOpen
        if isOpen then
            MainFrame.Visible = true
            TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 600, 0, 450)}):Play()
            TweenService:Create(ReopenButton, TweenInfo.new(0.3), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
            task.wait(0.3)
            ReopenButton.Visible = false
        else
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
            task.wait(0.3)
            MainFrame.Visible = false
            ReopenButton.Visible = true
            TweenService:Create(ReopenButton, TweenInfo.new(0.3), {BackgroundTransparency = 0.3, TextTransparency = 0}):Play()
        end
    end
    
    CloseButton.MouseButton1Click:Connect(toggleUI)
    MinimizeButton.MouseButton1Click:Connect(toggleUI)
    ReopenButton.MouseButton1Click:Connect(toggleUI)
    
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
            toggleUI()
        end
    end)
    
    MinimizeButton.MouseEnter:Connect(function()
        TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 50)}):Play()
    end)
    
    MinimizeButton.MouseLeave:Connect(function()
        TweenService:Create(MinimizeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 38)}):Play()
    end)
    
    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = AccentColor}):Play()
    end)
    
    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 38)}):Play()
    end)
    
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Visible = true
    TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 600, 0, 450)}):Play()
    
    local Window = {
        AccentColor = AccentColor,
        Font = WindowFont
    }
    
    function Window:CreateTab(tabName)
        local Tab = {}
        
        local TabButton = Instance.new("TextButton")
        TabButton.Name = tabName
        TabButton.Size = UDim2.new(1, 0, 0, 38)
        TabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabButton.TextSize = 14
        TabButton.Font = WindowFont
        TabButton.Parent = TabContainer
        
        local TabBtnCorner = Instance.new("UICorner")
        TabBtnCorner.CornerRadius = UDim.new(0, 8)
        TabBtnCorner.Parent = TabButton
        
        local TabPage = Instance.new("ScrollingFrame")
        TabPage.Name = tabName .. "Page"
        TabPage.Size = UDim2.new(1, 0, 1, 0)
        TabPage.BackgroundTransparency = 1
        TabPage.ScrollBarThickness = 4
        TabPage.ScrollBarImageColor3 = AccentColor
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
        PagePadding.PaddingRight = UDim.new(0, 5)
        PagePadding.Parent = TabPage
        
        TabButton.MouseButton1Click:Connect(function()
            for _, page in pairs(PageContainer:GetChildren()) do
                if page:IsA("ScrollingFrame") then
                    page.Visible = false
                end
            end
            
            for _, btn in pairs(TabContainer:GetChildren()) do
                if btn:IsA("TextButton") then
                    TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 38), TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
                end
            end
            
            TabPage.Visible = true
            TweenService:Create(TabButton, TweenInfo.new(0.2), {BackgroundColor3 = AccentColor, TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        end)
        
        if #TabContainer:GetChildren() == 2 then
            TabButton.BackgroundColor3 = AccentColor
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabPage.Visible = true
        end
        
        TabButton.MouseEnter:Connect(function()
            if TabPage.Visible == false then
                TweenService:Create(TabButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 50)}):Play()
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if TabPage.Visible == false then
                TweenService:Create(TabButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 38)}):Play()
            end
        end)
        
        Tab.Page = TabPage
        Tab.AccentColor = AccentColor
        Tab.Font = WindowFont
        
        return Tab
    end
    
    return Window
end

return MainLibrary
