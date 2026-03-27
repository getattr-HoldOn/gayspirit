local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local Data = LocalPlayer:WaitForChild('Data')

local Coins = Data:WaitForChild('Currency'):WaitForChild('Coins')
local Bacon = Data:WaitForChild('Resources'):WaitForChild('Bacon')
local Meat = Data:WaitForChild('Resources'):WaitForChild('Meat')

local function formatNumber(n)
    local s = tostring(n)
    while true do
        s, k = s:gsub("^(-?%d+)(%d%d%d)", "%1.%2")
        if k == 0 then break end
    end
    return s
end

do
    local Gui = Instance.new('ScreenGui', LocalPlayer:WaitForChild('PlayerGui'))
    Gui.IgnoreGuiInset = true
    Gui.ResetOnSpawn = false
    Gui.DisplayOrder = 999999
    Gui.ZIndexBehavior = Enum.ZIndexBehavior.Global

    local Frame = Instance.new('Frame', Gui)
    Frame.Size = UDim2.new(1,0,1,0)
    Frame.BackgroundColor3 = Color3.new(0,0,0)
    Frame.BackgroundTransparency = 0
    Frame.ZIndex = 999998

    local Text = Instance.new('TextLabel', Frame)
    Text.AnchorPoint = Vector2.new(0.5,0.5)
    Text.Position = UDim2.new(0.5,0,0.5,0)
    Text.Size = UDim2.new(0.8,0,0.2,0)
    Text.BackgroundTransparency = 1
    Text.TextScaled = true
    Text.Font = Enum.Font.GothamBold
    Text.ZIndex = 999999
    Text.TextStrokeTransparency = 0
    Text.TextStrokeColor3 = Color3.new(0,0,0)
    Text.RichText = true

    local function Update()
        Text.Text =
            '<font color="rgb(255,215,0)">'..formatNumber(Coins.Value)..'</font>'..
            '\n<font color="rgb(255,60,60)">'..formatNumber(Meat.Value)..'</font>'..
            '\n<font color="rgb(255,105,180)">'..formatNumber(Bacon.Value)..'</font>'
    end

    Coins:GetPropertyChangedSignal('Value'):Connect(Update)
    Meat:GetPropertyChangedSignal('Value'):Connect(Update)
    Bacon:GetPropertyChangedSignal('Value'):Connect(Update)

    Update()
end
