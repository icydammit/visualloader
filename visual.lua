-- Loading Screen | icydammit
-- Popcorn + Candy Theme (Dark Cinema Version)

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

-- ========== BACKGROUND (Popcorn Cinema Theme) ==========
local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(35, 20, 50) -- dark purple
Background.BorderSizePixel = 0
Background.ZIndex = 1
Background.Parent = ScreenGui

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 20, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 50, 20)) -- caramel
}
UIGradient.Rotation = 45
UIGradient.Parent = Background

-- Candy + Popcorn rain
local CandyRain = Instance.new("Frame")
CandyRain.Size = UDim2.new(1, 0, 1, 0)
CandyRain.BackgroundTransparency = 1
CandyRain.ZIndex = 2
CandyRain.Parent = Background

local candyEmojis = {"🍬","🍭","🍫","🍩","🍪","🍿","✨","⭐"}

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
        column.TextColor3 = Color3.fromRGB(255, 220, 150)
        column.TextSize = 20
        column.Font = Enum.Font.SourceSansBold
        column.TextTransparency = 0.3
        column.ZIndex = 2
        column.Parent = CandyRain

        drops[i] = {
            label = column,
            y = math.random(0, 100),
            speed = math.random(2, 6),
        }
    end

    task.spawn(function()
        while ScreenGui.Parent do
            for i, drop in ipairs(drops) do
                drop.y += drop.speed
                if drop.y > 100 then
                    drop.y = -10
                end
                drop.label.Position = UDim2.new(0, i * 45, 0, drop.y)

                local text = ""
                for j = 1, 3 do
                    text ..= candyEmojis[math.random(1, #candyEmojis)] .. " "
                end
                drop.label.Text = text
            end
            task.wait(0.2)
        end
    end)
end

task.spawn(createCandyRain)

-- ========== CARD ==========
local Card = Instance.new("Frame")
Card.Size = UDim2.new(0, 380, 0, 440)
Card.Position = UDim2.new(0.5, -190, 0.5, -220)
Card.BackgroundColor3 = Color3.fromRGB(255, 235, 200) -- popcorn cream
Card.BorderSizePixel = 0
Card.ZIndex = 2
Card.Parent = Background

Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 25)

local CardStroke = Instance.new("UIStroke", Card)
CardStroke.Color = Color3.fromRGB(255, 180, 80) -- caramel gold
CardStroke.Thickness = 2

-- ========== TITLE ==========
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -25, 0, 32)
Title.Position = UDim2.new(0, 12, 0, 12)
Title.BackgroundTransparency = 1
Title.Text = "🍿 ICYDAMMIT LOADING 🍬"
Title.TextColor3 = Color3.fromRGB(120, 70, 20)
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold
Title.Parent = Card

-- ========== LOG FRAME ==========
local LogFrame = Instance.new("Frame")
LogFrame.Size = UDim2.new(1, -25, 0, 200)
LogFrame.Position = UDim2.new(0, 12, 0, 80)
LogFrame.BackgroundColor3 = Color3.fromRGB(255, 220, 170)
LogFrame.BackgroundTransparency = 0.3
LogFrame.Parent = Card

Instance.new("UICorner", LogFrame).CornerRadius = UDim.new(0, 10)

-- ========== PROGRESS ==========
local ProgressTrack = Instance.new("Frame")
ProgressTrack.Size = UDim2.new(1, -25, 0, 6)
ProgressTrack.Position = UDim2.new(0, 12, 0, 300)
ProgressTrack.BackgroundColor3 = Color3.fromRGB(200, 150, 80)
ProgressTrack.Parent = Card

Instance.new("UICorner", ProgressTrack).CornerRadius = UDim.new(1, 0)

local ProgressFill = Instance.new("Frame")
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(255, 200, 100)
ProgressFill.Parent = ProgressTrack

Instance.new("UICorner", ProgressFill).CornerRadius = UDim.new(1, 0)

local ProgressPct = Instance.new("TextLabel")
ProgressPct.Size = UDim2.new(1, -25, 0, 20)
ProgressPct.Position = UDim2.new(0, 12, 0, 310)
ProgressPct.BackgroundTransparency = 1
ProgressPct.Text = "0%"
ProgressPct.TextColor3 = Color3.fromRGB(120, 70, 20)
ProgressPct.Font = Enum.Font.GothamBold
ProgressPct.Parent = Card

-- progress anim
local progress = 0
while progress < 96.2 do
    progress += 0.4
    ProgressFill.Size = UDim2.new(progress/100,0,1,0)
    ProgressPct.Text = string.format("%.1f%%", progress)
    task.wait(0.05)
end

ProgressPct.Text = "96.2%"
print("[icydammit] Loaded (stuck style)")
