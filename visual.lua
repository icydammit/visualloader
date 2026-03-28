-- Loading Screen | icydammit
-- Candy Theme Loading Screen

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Hapus yang lama jika ada
pcall(function()
    if game:GetService("CoreGui"):FindFirstChild("icydammit") then
        game:GetService("CoreGui"):FindFirstChild("icydammit"):Destroy()
    end
end)
if LocalPlayer.PlayerGui:FindFirstChild("icydammit") then
    LocalPlayer.PlayerGui:FindFirstChild("icydammit"):Destroy()
end

-- ========== SCREENGUI ==========
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "icydammit"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999999

if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = game:GetService("CoreGui")
elseif gethui then
    ScreenGui.Parent = gethui()
elseif get_hidden_gui then
    ScreenGui.Parent = get_hidden_gui()
else
    ScreenGui.Parent = game:GetService("CoreGui")
end

-- ========== BACKGROUND (Dark Pink / Hot Pink) ==========
local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(180, 40, 100) -- Dark pink / Hot pink
Background.BorderSizePixel = 0
Background.ZIndex = 1
Background.Parent = ScreenGui

-- Candy rain effect (falling candies)
local CandyRain = Instance.new("Frame")
CandyRain.Size = UDim2.new(1, 0, 1, 0)
CandyRain.BackgroundTransparency = 1
CandyRain.ZIndex = 2
CandyRain.Parent = Background

local candyEmojis = {"🍬", "🍭", "🍫", "🍩", "🍪", "🎀", "💖", "🌸", "✨", "⭐"}

local function createCandyRain()
    local columns = math.floor(workspace.CurrentCamera.ViewportSize.X / 50)
    if columns > 20 then columns = 20 end
    local drops = {}
    
    for i = 1, columns do
        local column = Instance.new("TextLabel")
        column.Size = UDim2.new(0, 30, 1, 0)
        column.Position = UDim2.new(0, i * 45, 0, 0)
        column.BackgroundTransparency = 1
        column.Text = ""
        column.TextColor3 = Color3.fromRGB(255, 200, 220)
        column.TextSize = 20
        column.Font = Enum.Font.SourceSansBold
        column.TextTransparency = 0.3
        column.ZIndex = 2
        column.Parent = CandyRain
        
        drops[i] = {
            label = column,
            y = math.random(0, 100),
            speed = math.random(2, 6),
            chars = {}
        }
    end
    
    task.spawn(function()
        while ScreenGui.Parent do
            for i, drop in ipairs(drops) do
                drop.y = drop.y + drop.speed
                if drop.y > 100 then
                    drop.y = -10
                    drop.speed = math.random(2, 6)
                end
                drop.label.Position = UDim2.new(0, i * 45, 0, drop.y)
                
                local candyText = ""
                for j = 1, 3 do
                    local candy = candyEmojis[math.random(1, #candyEmojis)]
                    candyText = candyText .. candy .. " "
                end
                drop.label.Text = candyText
            end
            task.wait(0.2)
        end
    end)
end

task.spawn(createCandyRain)

-- ========== BYPASS (Left Side - Candy Style) ==========
local BypassText = Instance.new("TextLabel")
BypassText.Size = UDim2.new(0, 120, 0, 40)
BypassText.Position = UDim2.new(0, 20, 0.35, -20)
BypassText.BackgroundTransparency = 1
BypassText.Text = "🍬 BYPASS"
BypassText.TextColor3 = Color3.fromRGB(255, 180, 200)
BypassText.TextSize = 22
BypassText.Font = Enum.Font.GothamBold
BypassText.TextXAlignment = Enum.TextXAlignment.Left
BypassText.ZIndex = 3
BypassText.Parent = Background

-- Blinking effect for BYPASS
task.spawn(function()
    local blink = false
    while ScreenGui.Parent do
        blink = not blink
        if blink then
            BypassText.Text = "🍬 BYPASS"
            BypassText.TextColor3 = Color3.fromRGB(255, 180, 200)
        else
            BypassText.Text = "🍬 BYPASS"
            BypassText.TextColor3 = Color3.fromRGB(200, 120, 150)
        end
        task.wait(0.8)
    end
end)

-- ========== PROCESSING (Right Side - Candy Style) ==========
local ProcessingText = Instance.new("TextLabel")
ProcessingText.Size = UDim2.new(0, 160, 0, 40)
ProcessingText.Position = UDim2.new(1, -180, 0.35, -20)
ProcessingText.BackgroundTransparency = 1
ProcessingText.Text = "PROCESSING 🍭 >"
ProcessingText.TextColor3 = Color3.fromRGB(255, 180, 200)
ProcessingText.TextSize = 22
ProcessingText.Font = Enum.Font.GothamBold
ProcessingText.TextXAlignment = Enum.TextXAlignment.Right
ProcessingText.ZIndex = 3
ProcessingText.Parent = Background

-- Blinking effect for PROCESSING
task.spawn(function()
    local dot = 0
    while ScreenGui.Parent do
        dot = dot + 1
        if dot > 3 then dot = 1 end
        ProcessingText.Text = "PROCESSING" .. string.rep(".", dot) .. " 🍭 >"
        task.wait(0.5)
    end
end)

-- Click blocker
local Blocker = Instance.new("TextButton")
Blocker.Size = UDim2.new(1, 0, 1, 0)
Blocker.BackgroundTransparency = 1
Blocker.Text = ""
Blocker.ZIndex = 0
Blocker.Parent = ScreenGui

-- ========== CARD (Candy Themed) ==========
local Card = Instance.new("Frame")
Card.Size = UDim2.new(0, 380, 0, 440)
Card.Position = UDim2.new(0.5, -190, 0.5, -220)
Card.BackgroundColor3 = Color3.fromRGB(255, 220, 230)
Card.BackgroundTransparency = 0.05
Card.BorderSizePixel = 0
Card.ZIndex = 2
Card.Parent = Background

local CardCorner = Instance.new("UICorner", Card)
CardCorner.CornerRadius = UDim.new(0, 25)

local CardStroke = Instance.new("UIStroke", Card)
CardStroke.Color = Color3.fromRGB(255, 150, 180)
CardStroke.Thickness = 2
CardStroke.Transparency = 0.2

-- ========== HEADER ==========
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -25, 0, 32)
Title.Position = UDim2.new(0, 12, 0, 12)
Title.BackgroundTransparency = 1
Title.Text = "🍭 ICYDAMMIT LOADING 🍬"
Title.TextColor3 = Color3.fromRGB(255, 100, 130)
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold
Title.ZIndex = 3
Title.Parent = Card

-- Blinking cursor effect
task.spawn(function()
    local cursor = false
    while ScreenGui.Parent do
        cursor = not cursor
        if cursor then
            Title.Text = "🍭 ICYDAMMIT LOADING 🍬"
        else
            Title.Text = "🍭 ICYDAMMIT LOADING 🍬 _"
        end
        task.wait(0.5)
    end
end)

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, -25, 0, 18)
SubTitle.Position = UDim2.new(0, 12, 0, 48)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = ">> SWEET CANDY CORE v2.0 <<"
SubTitle.TextColor3 = Color3.fromRGB(255, 120, 150)
SubTitle.TextSize = 10
SubTitle.Font = Enum.Font.GothamBold
SubTitle.ZIndex = 3
SubTitle.Parent = Card

local EstTime = Instance.new("TextLabel")
EstTime.Size = UDim2.new(1, -25, 0, 14)
EstTime.Position = UDim2.new(0, 12, 0, 70)
EstTime.BackgroundTransparency = 1
EstTime.Text = "🍬 TIME: " .. os.date("%H:%M:%S") .. " | SWEET NODE"
EstTime.TextColor3 = Color3.fromRGB(255, 140, 170)
EstTime.TextSize = 9
EstTime.Font = Enum.Font.GothamBold
EstTime.ZIndex = 3
EstTime.Parent = Card

-- Update time
task.spawn(function()
    while ScreenGui.Parent do
        EstTime.Text = "🍬 TIME: " .. os.date("%H:%M:%S") .. " | SWEET NODE"
        task.wait(1)
    end
end)

-- ========== LOG FRAME ==========
local LogFrame = Instance.new("Frame")
LogFrame.Size = UDim2.new(1, -25, 0, 195)
LogFrame.Position = UDim2.new(0, 12, 0, 90)
LogFrame.BackgroundColor3 = Color3.fromRGB(255, 210, 220)
LogFrame.BackgroundTransparency = 0.3
LogFrame.BorderSizePixel = 0
LogFrame.ZIndex = 3
LogFrame.ClipsDescendants = true
LogFrame.Parent = Card

Instance.new("UICorner", LogFrame).CornerRadius = UDim.new(0, 10)

local LogLayout = Instance.new("UIListLayout", LogFrame)
LogLayout.SortOrder = Enum.SortOrder.LayoutOrder
LogLayout.Padding = UDim.new(0, 2)

local logLines = {}
local logIndex = 0

-- Candy themed log messages
local logMessages = {
    {txt = "🍬 [SUCCESS] Candy module initialized.",          color = Color3.fromRGB(255, 100, 130)},
    {txt = "🍭 Pouring sugar crystals...",                    color = Color3.fromRGB(255, 120, 150)},
    {txt = "🍬 Mixing sweet ingredients...",                  color = Color3.fromRGB(255, 130, 160)},
    {txt = "🍭 Adding rainbow sprinkles...",                  color = Color3.fromRGB(255, 140, 170)},
    {txt = "🍬 [SUCCESS] Candy core loaded.",                 color = Color3.fromRGB(255, 100, 130)},
    {txt = "🍭 Preparing candy wrapper...",                   color = Color3.fromRGB(255, 120, 150)},
    {txt = "🍬 Inserting sweet payload...",                   color = Color3.fromRGB(255, 130, 160)},
    {txt = "🍭 [SUCCESS] Sweet module verified.",             color = Color3.fromRGB(255, 100, 130)},
    {txt = "🍬 Adding lollipop effect...",                    color = Color3.fromRGB(255, 120, 150)},
    {txt = "🍭 Finalizing candy coating...",                  color = Color3.fromRGB(255, 130, 160)},
    {txt = "🍬 [SUCCESS] Lollipop verified.",                 color = Color3.fromRGB(255, 100, 130)},
}

local function addLog(msg, color)
    logIndex += 1
    local line = Instance.new("TextLabel")
    line.Size = UDim2.new(1, 0, 0, 13)
    line.BackgroundTransparency = 1
    line.Text = msg
    line.TextColor3 = color or Color3.fromRGB(255, 120, 150)
    line.TextSize = 9
    line.Font = Enum.Font.Code
    line.TextXAlignment = Enum.TextXAlignment.Left
    line.LayoutOrder = logIndex
    line.ZIndex = 4
    line.Parent = LogFrame

    table.insert(logLines, line)

    if #logLines > 12 then
        local old = table.remove(logLines, 1)
        old:Destroy()
    end
end

-- ========== PROGRESS BAR (Candy Colors) ==========
local ProgressTrack = Instance.new("Frame")
ProgressTrack.Size = UDim2.new(1, -25, 0, 6)
ProgressTrack.Position = UDim2.new(0, 12, 0, 295)
ProgressTrack.BackgroundColor3 = Color3.fromRGB(255, 200, 210)
ProgressTrack.BorderSizePixel = 0
ProgressTrack.ZIndex = 3
ProgressTrack.Parent = Card
Instance.new("UICorner", ProgressTrack).CornerRadius = UDim.new(1, 0)

local ProgressFill = Instance.new("Frame")
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(255, 100, 130)
ProgressFill.BorderSizePixel = 0
ProgressFill.ZIndex = 4
ProgressFill.Parent = ProgressTrack
Instance.new("UICorner", ProgressFill).CornerRadius = UDim.new(1, 0)

local ProgressPct = Instance.new("TextLabel")
ProgressPct.Size = UDim2.new(1, -25, 0, 20)
ProgressPct.Position = UDim2.new(0, 12, 0, 305)
ProgressPct.BackgroundTransparency = 1
ProgressPct.Text = "0%"
ProgressPct.TextColor3 = Color3.fromRGB(255, 100, 130)
ProgressPct.TextSize = 13
ProgressPct.Font = Enum.Font.GothamBold
ProgressPct.ZIndex = 3
ProgressPct.Parent = Card

-- ========== FOOTER ==========
local FooterLine = Instance.new("Frame")
FooterLine.Size = UDim2.new(1, -25, 0, 2)
FooterLine.Position = UDim2.new(0, 12, 0, 380)
FooterLine.BackgroundColor3 = Color3.fromRGB(255, 150, 180)
FooterLine.BackgroundTransparency = 0.5
FooterLine.BorderSizePixel = 0
FooterLine.ZIndex = 3
FooterLine.Parent = Card

local Footer1 = Instance.new("TextLabel")
Footer1.Size = UDim2.new(1, -25, 0, 16)
Footer1.Position = UDim2.new(0, 12, 0, 390)
Footer1.BackgroundTransparency = 1
Footer1.Text = "🍬 Sweet loading in progress..."
Footer1.TextColor3 = Color3.fromRGB(255, 140, 170)
Footer1.TextSize = 9
Footer1.Font = Enum.Font.Gotham
Footer1.ZIndex = 3
Footer1.Parent = Card

local Footer2 = Instance.new("TextLabel")
Footer2.Size = UDim2.new(1, -25, 0, 16)
Footer2.Position = UDim2.new(0, 12, 0, 406)
Footer2.BackgroundTransparency = 1
Footer2.Text = "🍭 ADDING CANDY SPRINKLES..."
Footer2.TextColor3 = Color3.fromRGB(255, 100, 130)
Footer2.TextSize = 9
Footer2.Font = Enum.Font.Gotham
Footer2.ZIndex = 3
Footer2.Parent = Card

-- Blinking footer effect
task.spawn(function()
    local dot = 1
    while ScreenGui.Parent do
        dot = dot + 1
        if dot > 3 then dot = 1 end
        Footer2.Text = "🍭 ADDING CANDY SPRINKLES" .. string.rep(".", dot)
        task.wait(0.5)
    end
end)

-- ========== APPEARANCE ANIMATION ==========
Background.BackgroundTransparency = 1
Card.BackgroundTransparency = 0.05
TweenService:Create(Background, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()
TweenService:Create(Card, TweenInfo.new(0.4), {BackgroundTransparency = 0.05}):Play()
task.wait(0.15)

-- ========== LOGS ==========
task.spawn(function()
    for _, log in ipairs(logMessages) do
        task.wait(math.random(3, 7) * 0.1)
        addLog(log.txt, log.color)
    end
    while ScreenGui.Parent do
        for _, log in ipairs(logMessages) do
            task.wait(math.random(4, 9) * 0.1)
            addLog(log.txt, log.color)
        end
    end
end)

-- ========== PROGRESS — stops at 96.2% (unchanged) ==========
local progress = 0

local steps = {
    {target = 8,    speed = 0.8},
    {target = 18,   speed = 1.0},
    {target = 29,   speed = 1.2},
    {target = 41,   speed = 1.4},
    {target = 55,   speed = 1.6},
    {target = 67,   speed = 1.4},
    {target = 76,   speed = 1.8},
    {target = 84,   speed = 2.0},
    {target = 91,   speed = 1.8},
    {target = 96.2, speed = 2.5},
}

for _, step in ipairs(steps) do
    while progress < step.target do
        progress = math.min(progress + 0.3, step.target)
        TweenService:Create(ProgressFill, TweenInfo.new(0.1), {
            Size = UDim2.new(progress / 100, 0, 1, 0)
        }):Play()
        ProgressPct.Text = string.format("%.1f%%", progress)
        task.wait(step.speed * 0.15)
    end
    task.wait(step.speed)
end

-- Stuck at 96.2% forever
ProgressPct.Text = "96.2%"
print("[icydammit] Loading stuck at 96.2%")
