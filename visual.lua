-- Loading Screen | ICYDAMMIT (ULTRA SLOW VERSION)

local Players = game:GetService("Players")

pcall(function()
    if game:GetService("CoreGui"):FindFirstChild("icydammit") then
        game:GetService("CoreGui"):FindFirstChild("icydammit"):Destroy()
    end
end)

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MYSTRIX HUB"
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999999
ScreenGui.Parent = game:GetService("CoreGui")

-- BACKGROUND
local BG = Instance.new("Frame")
BG.Size = UDim2.new(1,0,1,0)
BG.BackgroundColor3 = Color3.fromRGB(0,0,0)
BG.Parent = ScreenGui

-- TITLE
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,80)
Title.Position = UDim2.new(0,0,0,60)
Title.BackgroundTransparency = 1
Title.Text = "MYSTRIX HUB"
Title.TextColor3 = Color3.fromRGB(230,230,255)
Title.Font = Enum.Font.GothamBlack
Title.TextScaled = true
Title.Parent = BG

-- LINE
local line = Instance.new("Frame")
line.Size = UDim2.new(0.8,0,0,4)
line.Position = UDim2.new(0.1,0,0.35,0)
line.BackgroundColor3 = Color3.fromRGB(120,60,255)
line.BorderSizePixel = 0
line.Parent = BG

-- TEXT
local Info = Instance.new("TextLabel")
Info.Size = UDim2.new(1,0,0,40)
Info.Position = UDim2.new(0,0,0.45,0)
Info.BackgroundTransparency = 1
Info.TextColor3 = Color3.fromRGB(200,200,255)
Info.Font = Enum.Font.Gotham
Info.TextScaled = true
Info.Text = ""
Info.Parent = BG

local subText = Instance.new("TextLabel")
subText.Size = UDim2.new(1,0,0,30)
subText.Position = UDim2.new(0,0,0.52,0)
subText.BackgroundTransparency = 1
subText.TextColor3 = Color3.fromRGB(170,170,200)
subText.Font = Enum.Font.Gotham
subText.TextScaled = true
subText.Text = ""
subText.Parent = BG

-- TYPE EFFECT
local mainText = "Detected: Escape Tsunami For Brainrots!"
local loadingText = "Loading script..."

task.spawn(function()
    while true do
        for i = 1, #mainText do
            Info.Text = string.sub(mainText,1,i) .. "_"
            task.wait(0.03)
        end

        Info.Text = mainText
        task.wait(0.5)

        for i = 1, #loadingText do
            subText.Text = string.sub(loadingText,1,i) .. "_"
            task.wait(0.03)
        end

        while true do
            subText.Text = loadingText .. "_"
            task.wait(0.5)
            subText.Text = loadingText
            task.wait(0.5)
        end
    end
end)

-- BAR BG
local barBG = Instance.new("Frame")
barBG.Size = UDim2.new(0.8,0,0,12)
barBG.Position = UDim2.new(0.1,0,0.65,0)
barBG.BackgroundColor3 = Color3.fromRGB(25,25,35)
barBG.BorderSizePixel = 0
barBG.Parent = BG

-- FILL
local fill = Instance.new("Frame")
fill.Size = UDim2.new(0,0,1,0)
fill.BackgroundColor3 = Color3.fromRGB(140,80,255)
fill.BorderSizePixel = 0
fill.Parent = barBG

-- TEXT %
local percent = Instance.new("TextLabel")
percent.Size = UDim2.new(1,0,0,30)
percent.Position = UDim2.new(0,0,0.7,0)
percent.BackgroundTransparency = 1
percent.TextColor3 = Color3.fromRGB(200,200,255)
percent.Font = Enum.Font.GothamBold
percent.TextScaled = true
percent.Text = "0%"
percent.Parent = BG

-- 🔥 ULTRA SLOW PROGRESS SYSTEM
local progress = 0

while progress < 99.8 do
    -- kurva makin mendekati 100 makin lambat ekstrem
    local remaining = (100 - progress)

    -- step makin kecil
    local step = math.clamp(remaining / 500, 0.01, 0.2)

    progress += step
    if progress > 99.8 then
        progress = 99.8
    end

    fill.Size = UDim2.new(progress/100,0,1,0)
    percent.Text = string.format("%.1f%%", progress)

    -- delay makin lama
    local delayTime = math.clamp((100 - progress) / 40, 0.3, 2)

    task.wait(delayTime)
end

-- 🔒 STUCK 99.8%
while true do
    percent.Text = "99.8%"
    task.wait(1)
end
