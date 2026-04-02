-- Loading Screen | icydammit
-- Popcorn + Candy Theme (FINAL TERMINAL VERSION)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

pcall(function()
    if game:GetService("CoreGui"):FindFirstChild("icydammit") then
        game:GetService("CoreGui"):FindFirstChild("icydammit"):Destroy()
    end
end)

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "icydammit"
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999999
ScreenGui.Parent = game:GetService("CoreGui")

-- BACKGROUND
local Background = Instance.new("Frame")
Background.Size = UDim2.new(1,0,1,0)
Background.BackgroundColor3 = Color3.fromRGB(35,20,50)
Background.Parent = ScreenGui

local grad = Instance.new("UIGradient", Background)
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35,20,50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80,50,20))
}

-- BYPASS (LEFT)
local BypassText = Instance.new("TextLabel")
BypassText.Size = UDim2.new(0,150,0,40)
BypassText.Position = UDim2.new(0,20,0.35,0)
BypassText.BackgroundTransparency = 1
BypassText.Text = "🍬 BYPASS"
BypassText.TextColor3 = Color3.fromRGB(255,200,120)
BypassText.Font = Enum.Font.GothamBold
BypassText.TextSize = 22
BypassText.TextXAlignment = Enum.TextXAlignment.Left
BypassText.Parent = Background

task.spawn(function()
    while true do
        BypassText.TextTransparency = 0
        task.wait(0.6)
        BypassText.TextTransparency = 0.5
        task.wait(0.6)
    end
end)

-- PROCESSING (RIGHT)
local ProcessingText = Instance.new("TextLabel")
ProcessingText.Size = UDim2.new(0,220,0,40)
ProcessingText.Position = UDim2.new(1,-240,0.35,0)
ProcessingText.BackgroundTransparency = 1
ProcessingText.TextColor3 = Color3.fromRGB(255,200,120)
ProcessingText.Font = Enum.Font.GothamBold
ProcessingText.TextSize = 22
ProcessingText.TextXAlignment = Enum.TextXAlignment.Right
ProcessingText.Parent = Background

task.spawn(function()
    local dot = 1
    while true do
        ProcessingText.Text = "PROCESSING" .. string.rep(".", dot) .. " 🍭"
        dot += 1
        if dot > 3 then dot = 1 end
        task.wait(0.5)
    end
end)

-- CARD
local Card = Instance.new("Frame")
Card.Size = UDim2.new(0,380,0,440)
Card.Position = UDim2.new(0.5,-190,0.5,-220)
Card.BackgroundColor3 = Color3.fromRGB(255,235,200)
Card.Parent = Background
Instance.new("UICorner",Card).CornerRadius = UDim.new(0,25)

-- TITLE (HACKER TYPING)
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,-20,0,30)
Title.Position = UDim2.new(0,10,0,10)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(120,70,20)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Text = ""
Title.Parent = Card

local fullText = "🍿 ICYDAMMIT LOADING 🍬"

task.spawn(function()
    while true do
        for i = 1, #fullText do
            Title.Text = string.sub(fullText, 1, i) .. "_"
            task.wait(0.05)
        end

        for i = 1, 6 do
            Title.Text = fullText .. "_"
            task.wait(0.3)
            Title.Text = fullText
            task.wait(0.3)
        end

        Title.Text = ""
        task.wait(0.5)
    end
end)

-- LOG FRAME (TERMINAL STYLE)
local LogFrame = Instance.new("Frame")
LogFrame.Size = UDim2.new(1,-25,0,200)
LogFrame.Position = UDim2.new(0,12,0,80)
LogFrame.BackgroundColor3 = Color3.fromRGB(255,220,170)
LogFrame.BackgroundTransparency = 0.3
LogFrame.Parent = Card
Instance.new("UICorner", LogFrame).CornerRadius = UDim.new(0,10)

local layout = Instance.new("UIListLayout", LogFrame)
layout.SortOrder = Enum.SortOrder.LayoutOrder

local logLines = {}
local logIndex = 0

-- TYPE LOG FUNCTION (🔥 INI YANG KAMU MAU)
local function typeLine(text, color)
    logIndex += 1
    
    local line = Instance.new("TextLabel")
    line.Size = UDim2.new(1, 0, 0, 14)
    line.BackgroundTransparency = 1
    line.Text = ""
    line.TextColor3 = color or Color3.fromRGB(120,70,20)
    line.TextSize = 9
    line.Font = Enum.Font.Code
    line.TextXAlignment = Enum.TextXAlignment.Left
    line.LayoutOrder = logIndex
    line.Parent = LogFrame

    table.insert(logLines, line)

    -- typing effect
    for i = 1, #text do
        line.Text = string.sub(text, 1, i) .. "_"
        task.wait(0.01)
    end

    line.Text = text

    -- limit
    if #logLines > 12 then
        local old = table.remove(logLines, 1)
        old:Destroy()
    end
end

-- LOG DATA
local logMessages = {
    "[SUCCESS] Candy module initialized.",
    "Pouring sugar crystals...",
    "Mixing sweet ingredients...",
    "Adding rainbow sprinkles...",
    "[SUCCESS] Candy core loaded.",
    "Preparing candy wrapper...",
    "Inserting sweet payload...",
    "[SUCCESS] Sweet module verified.",
    "Adding lollipop effect...",
    "Finalizing candy coating...",
    "[SUCCESS] Lollipop verified.",
}

-- LOOP LOG (🔥 STREAM EFFECT)
task.spawn(function()
    while true do
        for _, msg in ipairs(logMessages) do
            typeLine(msg)
            task.wait(math.random(0.2,0.5))
        end
    end
end)

-- CANDY RAIN
local candyEmojis = {"🍬","🍭","🍫","🍩","🍪","🍿","✨"}

task.spawn(function()
    while true do
        local txt = Instance.new("TextLabel")
        txt.Text = candyEmojis[math.random(1,#candyEmojis)]
        txt.Size = UDim2.new(0,30,0,30)
        txt.Position = UDim2.new(math.random(),0,0,0)
        txt.BackgroundTransparency = 1
        txt.TextSize = 20
        txt.Parent = Background

        TweenService:Create(txt,TweenInfo.new(3),{
            Position = UDim2.new(txt.Position.X.Scale,0,1,0)
        }):Play()

        game:GetService("Debris"):AddItem(txt,3)
        task.wait(0.2)
    end
end)

-- PROGRESS
local bar = Instance.new("Frame")
bar.Size = UDim2.new(1,-40,0,6)
bar.Position = UDim2.new(0,20,0,350)
bar.BackgroundColor3 = Color3.fromRGB(200,150,80)
bar.Parent = Card

local fill = Instance.new("Frame")
fill.Size = UDim2.new(0,0,1,0)
fill.BackgroundColor3 = Color3.fromRGB(255,200,100)
fill.Parent = bar

local text = Instance.new("TextLabel")
text.Size = UDim2.new(1,0,0,20)
text.Position = UDim2.new(0,0,0,360)
text.BackgroundTransparency = 1
text.Text = "0%"
text.TextColor3 = Color3.fromRGB(120,70,20)
text.Font = Enum.Font.GothamBold
text.Parent = Card

local progress = 0
while progress < 96.2 do
    progress += 0.5
    fill.Size = UDim2.new(progress/100,0,1,0)
    text.Text = string.format("%.1f%%",progress)
    task.wait(0.05)
end

text.Text = "96.2%"
