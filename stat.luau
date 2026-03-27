local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local Data = LocalPlayer:WaitForChild('Data')

local Coins = Data:WaitForChild('Currency'):WaitForChild('Coins')
local Bacon = Data:WaitForChild('Resources'):WaitForChild('Bacon')
local Meat = Data:WaitForChild('Resources'):WaitForChild('Meat')
do
    local Gui = Instance.new('ScreenGui', LocalPlayer:WaitForChild('PlayerGui'))
    Gui.IgnoreGuiInset = true
    Gui.ResetOnSpawn = false
    Gui.DisplayOrder = 999999
    Gui.ZIndexBehavior = Enum.ZIndexBehavior.Global

    local Text = Instance.new('TextLabel', Gui)
    Text.Size = UDim2.new(1,0,0,100)
    Text.Position = UDim2.new(0,0,0,0)
    Text.BackgroundTransparency = 1
    Text.TextColor3 = Color3.new(1,1,1)
    Text.TextScaled = true
    Text.Font = Enum.Font.Code
    Text.ZIndex = 999999

    local function Update()
        Text.Text =
            'Coins: '..Coins.Value..
            ' | Meat: '..Meat.Value..
            ' | Bacon: '..Bacon.Value
    end

    Coins:GetPropertyChangedSignal('Value'):Connect(Update)
    Meat:GetPropertyChangedSignal('Value'):Connect(Update)
    Bacon:GetPropertyChangedSignal('Value'):Connect(Update)

    Update()
end
