if getgenv().DaraHubExecuted then
firesignal(game:GetService("ReplicatedStorage").GameEvents.Notification.OnClientEvent, "Script Is Already Loaded, rejoin if you want to re-execute!")
return
end
getgenv().DaraHubExecuted = true
loadstring(game:HttpGet("https://darahub.pages.dev/Module/Library/GUI/LoadAll.lua"))() 
WindUI = loadstring(game:HttpGet("https://darahub.pages.dev/Module/Library/GUI/WindUI-Moded/main.lua"))() 
Window = WindUI:CreateWindow({
NewElements = true,
Title = "Dara Hub | Grow A Garden",
Icon = "rbxassetid://137330250139083",
Author = "Made by: Pnsdg And Yomka",
Folder = "DaraHub/Games/Grow-A-Garden",
Size = UDim2.fromOffset(580, 490),
Theme = "Dark",
HidePanelBackground = false,
Acrylic = false,
HideSearchBar = false,
SideBarWidth = 200,
OpenButton = {
Enabled = false,
Scale = 0
},
})
WindUI.TransparencyValue = 0.7
Window:ToggleTransparency(true)
Window:DisableTopbarButtons({ "Fullscreen" })
Window:Tag({
Title = "v1.1.2",
Color = Color3.fromHex("#30ff6a")
})
executor = identifyexecutor()
if type(executor) == "table" then
for key, value in pairs(executor) do
print(key .. ": " .. tostring(value))
end
elseif type(executor) == "string" then
Window:Tag({
Title = "" .. executor
})
else
print("The injector does not support identifyexecutor()")
end
--[[Window:Tag({
Title = "BETA",
Color = Color3.fromHex("#ffd700")
})
]]
Tabs = {
Main = Window:Tab({ Title = "Main", Icon = "layout-grid" }),
Player = Window:Tab({ Title = "Player", Icon = "user" }),
Garden = Window:Tab({ Title = "Garden", Icon = "fence" }),
Pet = Window:Tab({ Title = "Pet", Icon = "paw-print" }),
Item = Window:Tab({ Title = "Item", Icon = "hammer" }),
Visuals = Window:Tab({ Title = "Visuals", Icon = "camera" }),
Esp = Window:Tab({ Title = "Esp", Icon = "eye" }),
Event = Window:Tab({ Title = "Event", Icon = "calendar-plus-2" }),
Teleport = Window:Tab({ Title = "Teleport", Icon = "navigation" }),
Troll = Window:Tab({ Title = "Troll Shit stuffs", Icon = "rbxassetid://6862780932" }),
Misc = Window:Tab({ Title = "Misc", Icon = "star" }),
Utility = Window:Tab({ Title = "Utility", Icon = "wrench" }),
Shop = Window:Tab({ Title = "Shop", Icon = "shopping-cart" }),
Settings = Window:Tab({ Title = "Settings", Icon = "settings" }),
info = Window:Tab({ Title = "Info", Icon = "info" }),
Others = Window:Tab({ Title = "Others", Icon = "https://em-content.zobj.net/source/apple/419/pile-of-poo_1f4a9.png" })
}
Tabs.Main:Section({ Title = "Main", TextSize = 40 })
local UniverseServerTools = loadstring(game:HttpGet("https://darahub.pages.dev/Module/UniverseServerTools.lua"))()
UniverseServerTools(Tabs)
Window:OnOpen(function()
ButtonLib:OpenButton(false)
end)
Window:OnClose(function()
ButtonLib:OpenButton(true)
end)
Window:OnDestroy(function()
ButtonLib:DestroyScreengui()
end)
local socialsModule = loadstring(game:HttpGet("https://darahub.pages.dev/Module/info.lua"))()
socialsModule(Tabs)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer
local Backpack = LocalPlayer:FindFirstChild("Backpack")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local PathfindingService = game:GetService("PathfindingService")
local Character
local Humanoid
local HumanoidRootPart
local function setupCharacter(CharacterInstance)
Character = CharacterInstance
Humanoid = Character:FindFirstChildOfClass("Humanoid")
HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
end
if LocalPlayer.Character then
setupCharacter(LocalPlayer.Character)
end
LocalPlayer.CharacterAdded:Connect(setupCharacter)
InfiniteJump = false
TPWALK = false
TpwalkValue = 1
JumpBoost = false
JumpPower = 5
SpeedHack = false
SpeedValue = 16
Noclip = false
coroutine.resume(coroutine.create(function()
frame = PlayerGui:WaitForChild("Teleport_UI"):WaitForChild("Frame")
if not frame:GetAttribute("UIScaled") then
SCALE_FACTOR = 0.7
COSMETICS_SCALE_FACTOR = 0.5
function scaleUDim2(udim2, scale)
return UDim2.new(udim2.X.Scale * scale, udim2.X.Offset * scale, udim2.Y.Scale * scale, udim2.Y.Offset * scale)
end
function scaleVector2(vector2, scale)
return Vector2.new(vector2.X * scale, vector2.Y * scale)
end
frame.Size = scaleUDim2(UDim2.new(0.4, 0, 0.085, 0), SCALE_FACTOR)
function ensureSizeConstraint(uiElement, minSize)
sizeConstraint = uiElement:FindFirstChildOfClass("UISizeConstraint")
if not sizeConstraint then
sizeConstraint = Instance.new("UISizeConstraint")
sizeConstraint.Parent = uiElement
end
sizeConstraint.MinSize = scaleVector2(minSize, SCALE_FACTOR)
end
function removeHoverEffects(button)
button.HoverImage = ""
button.PressedImage = ""
button.AutoButtonColor = false
hoverEffects = button:FindFirstChild("HoverEffects")
if hoverEffects then
hoverEffects:Destroy()
end
clickEffects = button:FindFirstChild("ClickEffects")
if clickEffects then
clickEffects:Destroy()
end
end
sellButton = frame:WaitForChild("Sell")
sellButton.Size = scaleUDim2(UDim2.new(0.22, 0, 0.791, 0), SCALE_FACTOR)
ensureSizeConstraint(sellButton, Vector2.new(50, 1))
removeHoverEffects(sellButton)
seedsButton = frame:WaitForChild("Seeds")
seedsButton.Size = scaleUDim2(UDim2.new(0.22, 0, 0.791, 0), SCALE_FACTOR)
ensureSizeConstraint(seedsButton, Vector2.new(50, 1))
removeHoverEffects(seedsButton)
gardenButton = frame:WaitForChild("Garden")
gardenButton.Size = scaleUDim2(UDim2.new(0.35, 0, 0.985, 0), SCALE_FACTOR)
ensureSizeConstraint(gardenButton, Vector2.new(100, 1))
removeHoverEffects(gardenButton)
petsButton = frame:WaitForChild("Pets")
removeHoverEffects(petsButton)
gearButton = frame:WaitForChild("Gear")
removeHoverEffects(gearButton)
cosmeticsCraftingButton = frame:FindFirstChild("COSMETICS_and_crafting") or gearButton:Clone()
cosmeticsCraftingButton.Name = "COSMETICS_and_crafting"
cosmeticsCraftingButton.Size = scaleUDim2(UDim2.new(0.35, 0, 0.985, 0), COSMETICS_SCALE_FACTOR)
cosmeticsCraftingButton.Position = scaleUDim2(UDim2.new(0, 0, 0, 250), COSMETICS_SCALE_FACTOR)
cosmeticsCraftingButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
cosmeticsCraftingButton.BackgroundTransparency = 0
cosmeticsCraftingButton.Image = ""
cosmeticsCraftingButton.Visible = false
removeHoverEffects(cosmeticsCraftingButton)
gearVisibility = cosmeticsCraftingButton:FindFirstChild("GearVisiblity")
if gearVisibility then
gearVisibility:Destroy()
end
cosmeticsCraftingStroke = cosmeticsCraftingButton:FindFirstChild("UIStroke") or Instance.new("UIStroke")
cosmeticsCraftingStroke.Name = "UIStroke"
cosmeticsCraftingStroke.Color = Color3.fromRGB(100, 0, 100)
cosmeticsCraftingStroke.Thickness = 1 * COSMETICS_SCALE_FACTOR
cosmeticsCraftingStroke.Parent = cosmeticsCraftingButton
cosmeticsCraftingTextLabel = cosmeticsCraftingButton:FindFirstChild("Txt")
if cosmeticsCraftingTextLabel and cosmeticsCraftingTextLabel:IsA("TextLabel") then
cosmeticsCraftingTextLabel.Text = "COSM/CRAFT"
cosmeticsCraftingTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
cosmeticsCraftingTextLabel.TextSize = cosmeticsCraftingTextLabel.TextSize * COSMETICS_SCALE_FACTOR
else
cosmeticsCraftingTextLabel = Instance.new("TextLabel")
cosmeticsCraftingTextLabel.Name = "Txt"
cosmeticsCraftingTextLabel.Text = "COSM/CRAFT"
cosmeticsCraftingTextLabel.Size = UDim2.new(1, 0, 1, 0)
cosmeticsCraftingTextLabel.BackgroundTransparency = 1
cosmeticsCraftingTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
cosmeticsCraftingTextLabel.TextScaled = true
cosmeticsCraftingTextLabel.Parent = cosmeticsCraftingButton
end
textStroke = cosmeticsCraftingTextLabel:FindFirstChild("UIStroke") or Instance.new("UIStroke")
textStroke.Name = "UIStroke"
textStroke.Color = Color3.fromRGB(58, 0, 0)
textStroke.Thickness = 1 * COSMETICS_SCALE_FACTOR
textStroke.Parent = cosmeticsCraftingTextLabel
ensureSizeConstraint(cosmeticsCraftingButton, Vector2.new(100, 1))
cosmeticsCraftingButton.Parent = frame
eventButton = frame:FindFirstChild("Event") or gardenButton:Clone()
eventButton.Name = "Event"
eventButton.Size = scaleUDim2(UDim2.new(0.35, 0, 0.985, 0), SCALE_FACTOR)
eventButton.Position = scaleUDim2(UDim2.new(0, 0, 0, 200), SCALE_FACTOR)
eventButton.Image = "rbxassetid://110208924430993"
removeHoverEffects(eventButton)
eventTextLabel = eventButton:FindFirstChild("Txt")
if eventTextLabel and eventTextLabel:IsA("TextLabel") then
eventTextLabel.Text = "EVENT"
eventTextLabel.TextSize = eventTextLabel.TextSize * SCALE_FACTOR
else
eventTextLabel = Instance.new("TextLabel")
eventTextLabel.Name = "Txt"
eventTextLabel.Text = "EVENT"
eventTextLabel.Size = UDim2.new(1, 0, 1, 0)
eventTextLabel.BackgroundTransparency = 1
eventTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
eventTextLabel.TextScaled = true
eventTextLabel.Parent = eventButton
end
ensureSizeConstraint(eventButton, Vector2.new(100, 1))
eventButton.Parent = frame
petsButton.Size = scaleUDim2(petsButton.Size, SCALE_FACTOR)
gearButton.Size = scaleUDim2(gearButton.Size, SCALE_FACTOR)
function scaleButtonText(button)
textLabel = button:FindFirstChild("Txt")
if textLabel and textLabel:IsA("TextLabel") then
if not textLabel.TextScaled then
textLabel.TextSize = textLabel.TextSize * SCALE_FACTOR
end
end
end
scaleButtonText(petsButton)
scaleButtonText(gearButton)
scaleButtonText(sellButton)
scaleButtonText(seedsButton)
scaleButtonText(gardenButton)
petsButton.Visible = true
gearButton.Visible = true
eventButton.Visible = true
task.spawn(function()
task.wait(0)
cosmeticsCraftingButton.Visible = true
end)
frame:SetAttribute("UIScaled", true)
TeleportPlayer = require(ReplicatedStorage.Modules.TeleportPlayer)
function teleportToTutorialPoint(pointName, displayName)
tutorialPoints = workspace:FindFirstChild("Tutorial_Points")
if tutorialPoints then
targetPoint = tutorialPoints:FindFirstChild(pointName)
if targetPoint then
TeleportPlayer(LocalPlayer, targetPoint.CFrame, displayName)
else
warn("Tutorial point not found: " .. pointName)
end
else
warn("Tutorial_Points folder not found in workspace")
end
end
petsButton.MouseButton1Click:Connect(function()
teleportToTutorialPoint("Tutorial_Point_4", "Pet Stand")
end)
gearButton.MouseButton1Click:Connect(function()
teleportToTutorialPoint("Tutorial_Point_3", "Gear Stands")
end)
eventButton.MouseButton1Click:Connect(function()
eventPoint = workspace:FindFirstChild("Event_Point", true)
if eventPoint then
TeleportPlayer(LocalPlayer, eventPoint.CFrame, "Event")
else
warn("Event_Point not found in workspace.Interaction")
end
end)
cosmeticsCraftingButton.MouseButton1Click:Connect(function()
craftingTables = workspace:FindFirstChild("CraftingTables")
if craftingTables then
targetCFrame = craftingTables:GetPivot()
offsetPosition = targetCFrame.Position + Vector3.new(5, 0, 5)
rotatedCFrame = CFrame.new(offsetPosition) * CFrame.Angles(0, math.rad(90), 0)
TeleportPlayer(LocalPlayer, rotatedCFrame, "Crafting")
else
warn("CraftingTables not found in workspace")
end
end)
end
end))
function IsAlive(Player, currentRoles)
for i, v in pairs(currentRoles) do
if Player.Name == i then
if not v.Killed and not v.Dead then
return true
else
return false
end
end
end
return false
end
function getOutlineColor(c)
local lum = 0.299 * c.R + 0.587 * c.G + 0.114 * c.B
if lum > 0.5 then
return Color3.new(0,0,0)
else
return Color3.new(1,1,1)
end
end
Tabs.Main:Section({ Title = "Scan Highest Fruit from My Garden" })
Tabs.Main:Divider()
gardenFruitList = {}
gardenFruitParagraph = Tabs.Main:Paragraph({
Title = "No fruits found",
Desc = "Click Refresh to scan your garden"
})
function scanGardenFruits()
gardenFruitList = {}
local myPlots = getMyFarmPlots()
if not myPlots or #myPlots == 0 then
return gardenFruitList
end
for _, plot in pairs(myPlots) do
local important = plot:FindFirstChild("Important")
if important then
local plantsPhysical = important:FindFirstChild("Plants_Physical")
if plantsPhysical then
for _, plant in pairs(plantsPhysical:GetChildren()) do
if plant:IsA("Model") then
local fruitsFolder = plant:FindFirstChild("Fruits")
if fruitsFolder then
for _, fruit in pairs(fruitsFolder:GetChildren()) do
local prompt = fruit:FindFirstChildWhichIsA("ProximityPrompt", true)
if prompt and prompt.Enabled == false then
continue
end
local weight = getFruitWeight(fruit) or 0
local value = getFruitValue(fruit) or 0
local mutation = checkMutation(fruit)
local variant = checkVariant(fruit)
table.insert(gardenFruitList, {
Fruit = fruit,
Plant = plant,
Name = fruit.Name,
Weight = weight,
Value = value,
Mutation = mutation,
Variant = variant
})
end
end
end
end
end
end
end
table.sort(gardenFruitList, function(a, b) 
return (a.Value or 0) > (b.Value or 0) 
end)
return gardenFruitList
end
function collectGardenFruit(fruitObj, plantObj)
if not fruitObj then return false end
local prompt = fruitObj:FindFirstChildWhichIsA("ProximityPrompt", true)
if prompt and prompt.Enabled then
fireproximityprompt(prompt, 0)
if plantObj then
task.spawn(function()
pcall(function()
ReplicatedStorage.GameEvents.Crops.Collect:FireServer({plantObj})
end)
end)
end
playCollectSound()
return true
else
if plantObj then
task.spawn(function()
pcall(function()
ReplicatedStorage.GameEvents.Crops.Collect:FireServer({plantObj})
end)
end)
playCollectSound()
return true
end
end
return false
end
Tabs.Main:Button({
Title = "Refresh Garden Fruits",
Callback = function()
gardenFruitList = scanGardenFruits()
if #gardenFruitList > 0 then
local top = gardenFruitList[1]
local mutationText = top.Mutation or "None"
local variantText = top.Variant or "None"
gardenFruitParagraph:SetTitle(top.Name)
gardenFruitParagraph:SetDesc(string.format(
[[Mutation: %s
Weight: %s KG
Value: $%s
Variant: %s]],
mutationText,
tostring(top.Weight),
tostring(math.floor(top.Value)),
variantText
))
WindUI:Notify({
Title = "Scan Complete",
Content = string.format("Found %d fruit(s). Highest: %s ($%s)", 
#gardenFruitList, top.Name, math.floor(top.Value)),
Duration = 3
})
else
gardenFruitParagraph:SetTitle("No fruits found")
gardenFruitParagraph:SetDesc("No fruits in your garden")
WindUI:Notify({
Title = "Scan Complete",
Content = "No fruits found in your garden",
Duration = 2
})
end
end
})
Tabs.Main:Button({
Title = "Collect Highest Fruit",
Callback = function()
gardenFruitList = scanGardenFruits()
if #gardenFruitList == 0 then
WindUI:Notify({
Title = "Collection Failed",
Content = "No fruits found in your garden",
Duration = 3
})
return
end
local target = gardenFruitList[1]
if target and target.Fruit and target.Plant then
local success = collectGardenFruit(target.Fruit, target.Plant)
if success then
WindUI:Notify({
Title = "Collection Success",
Content = string.format("Collected %s (Value: $%s)", 
target.Name, math.floor(target.Value)),
Duration = 3
})
task.wait(0.5)
gardenFruitList = scanGardenFruits()
if #gardenFruitList > 0 then
local nextFruit = gardenFruitList[1]
gardenFruitParagraph:SetTitle(nextFruit.Name)
gardenFruitParagraph:SetDesc(string.format(
[[Mutation: %s
Weight: %s KG
Value: $%s
Variant: %s]],
nextFruit.Mutation or "None",
tostring(nextFruit.Weight),
tostring(math.floor(nextFruit.Value)),
nextFruit.Variant or "None"
))
else
gardenFruitParagraph:SetTitle("No fruits found")
gardenFruitParagraph:SetDesc("All fruits collected")
end
else
WindUI:Notify({
Title = "Collection Failed",
Content = "Could not collect fruit. Try refreshing.",
Duration = 3
})
end
else
WindUI:Notify({
Title = "Collection Failed",
Content = "Invalid fruit data",
Duration = 3
})
end
end
})
Tabs.Main:Divider()
Tabs.Main:Section({ Title = "Steal Fruit" })
Tabs.Main:Divider()
fruitList = {}
fruitParagraph = Tabs.Main:Paragraph({
Title = "No fruits found",
Desc = "Click Refresh to scan for fruits"
})
local function findProximityPrompt(obj)
if not obj then return nil end
local prompt = obj:FindFirstChild("ProximityPrompt")
if prompt then return prompt end
for _, child in pairs(obj:GetChildren()) do
prompt = findProximityPrompt(child)
if prompt then return prompt end
end
return nil
end
Tabs.Main:Button({
Title = "Scan highest value Fruits",
Callback = function()
fruitList = {}
farmFolder = workspace:FindFirstChild("Farm")
if not farmFolder then 
fruitParagraph:SetDesc("Farm folder not found")
return
end
for _, plot in pairs(farmFolder:GetChildren()) do
sign = plot:FindFirstChild("Sign")
owner = sign and sign:GetAttribute("_owner")
if owner and owner ~= LocalPlayer then
important = plot:FindFirstChild("Important")
if important then
plantsPhysical = important:FindFirstChild("Plants_Physical")
if plantsPhysical then
for _, plant in pairs(plantsPhysical:GetChildren()) do
fruitsFolder = plant:FindFirstChild("Fruits")
if fruitsFolder then
for _, fruit in pairs(fruitsFolder:GetChildren()) do
local proximityPrompt = findProximityPrompt(fruit)
if proximityPrompt and proximityPrompt.Enabled == false then
else
weight = fruit:FindFirstChild("Weight")
weightValue = weight and weight.Value or 0
value = 0
pcall(function()
value = require(ReplicatedStorage.Modules.CalculatePlantValue)(fruit)
end)
mutations = {}
for attr, val in pairs(fruit:GetAttributes()) do
if type(val) == "boolean" and val == true then
table.insert(mutations, attr)
end
end
variant = fruit:FindFirstChild("Variant")
variantName = variant and variant.Value or "None"
table.insert(fruitList, {
Fruit = fruit,
Name = fruit.Name,
Owner = owner,
Weight = weightValue,
Value = value,
Mutations = mutations,
Variant = variantName,
Plant = plant,
ProximityPrompt = proximityPrompt
})
end
end
end
end
end
end
end
end
table.sort(fruitList, function(a, b) return (a.Value or 0) > (b.Value or 0) end)
if #fruitList > 0 then
top = fruitList[1]
mutationText = #top.Mutations > 0 and table.concat(top.Mutations, ", ") or "None"
fruitParagraph:SetTitle(top.Name)
fruitParagraph:SetDesc(string.format(
"Owner: %s\nMutation: %s\nWeight: %s\nValue: $%s\nVariant: %s",
top.Owner,
mutationText,
tostring(top.Weight),
tostring(math.floor(top.Value)),
top.Variant
))
else
fruitParagraph:SetTitle("No fruits found")
fruitParagraph:SetDesc("No fruits available to steal from other players")
end
end
})
Tabs.Main:Button({
Title = "Steal Now",
Callback = function()
if #fruitList == 0 then 
WindUI:Notify({
Title = "Steal Failed",
Content = "No fruits available to steal",
Duration = 3
})
return 
end
target = fruitList[1]
if target and target.Fruit then
local collectEvent = ReplicatedStorage.GameEvents.Crops.Collect
if collectEvent then
local fruitParent = target.Fruit.Parent
if fruitParent then
fruitParent = fruitParent.Parent
end
if fruitParent then
collectEvent:FireServer({fruitParent})
WindUI:Notify({
Title = "Steal Attempt",
Content = string.format("Attempted to steal %s from %s", target.Name, target.Owner),
Duration = 3
})
else
WindUI:Notify({
Title = "Steal Failed",
Content = "Could not find fruit parent",
Duration = 3
})
end
else
WindUI:Notify({
Title = "Steal Failed",
Content = "Collect event not found",
Duration = 3
})
end
end
end
})
Tabs.Main:Section({ Title = "Scan Best Fruit in Inventory" })
Tabs.Main:Divider()
inventoryList = {}
inventoryParagraph = Tabs.Main:Paragraph({
Title = "No items in inventory",
Desc = "Click Find Highest price to scan your inventory"
})
Tabs.Main:Button({
Title = "Find Highest price",
Callback = function()
inventoryList = {}
if Backpack then
for _, item in pairs(Backpack:GetChildren()) do
if item:IsA("Tool") and item:FindFirstChild("Item_Seed") then
value = 0
pcall(function()
value = require(ReplicatedStorage.Modules.CalculatePlantValue)(item)
end)
weightObj = item:FindFirstChild("Weight")
weight = weightObj and weightObj.Value or 0
mutations = {}
for attr, val in pairs(item:GetAttributes()) do
if type(val) == "boolean" and val == true then
table.insert(mutations, attr)
end
end
variant = item:FindFirstChild("Variant")
variantName = variant and variant.Value or "None"
table.insert(inventoryList, {
Item = item,
Name = item.Name,
Value = value,
Weight = weight,
Mutations = mutations,
Variant = variantName
})
end
end
end
if Character then
for _, item in pairs(Character:GetChildren()) do
if item:IsA("Tool") and item:FindFirstChild("Item_Seed") then
value = 0
pcall(function()
value = require(ReplicatedStorage.Modules.CalculatePlantValue)(item)
end)
weightObj = item:FindFirstChild("Weight")
weight = weightObj and weightObj.Value or 0
mutations = {}
for attr, val in pairs(item:GetAttributes()) do
if type(val) == "boolean" and val == true then
table.insert(mutations, attr)
end
end
variant = item:FindFirstChild("Variant")
variantName = variant and variant.Value or "None"
table.insert(inventoryList, {
Item = item,
Name = item.Name,
Value = value,
Weight = weight,
Mutations = mutations,
Variant = variantName
})
end
end
end
table.sort(inventoryList, function(a, b) return (a.Value or 0) > (b.Value or 0) end)
if #inventoryList > 0 then
top = inventoryList[1]
mutationText = #top.Mutations > 0 and table.concat(top.Mutations, ", ") or "None"
cleanTitle = top.Name:gsub("%[.-%]", ""):gsub("%s+", " "):gsub("^%s*(.-)%s*$", "%1")
inventoryParagraph:SetTitle(cleanTitle)
inventoryParagraph:SetDesc(string.format(
"Weight: %s KG\nValue: $%s\nMutation: %s\nVariant: %s",
tostring(top.Weight),
tostring(math.floor(top.Value)),
mutationText,
top.Variant
))
else
inventoryParagraph:SetTitle("No fruits found")
inventoryParagraph:SetDesc("No fruits in your inventory")
end
end
})
Tabs.Main:Button({
Title = "Equip Best Item",
Callback = function()
if #inventoryList == 0 then 
WindUI:Notify({
Title = "Equip Failed",
Content = "No fruits in inventory",
Duration = 3
})
return 
end
target = inventoryList[1]
if target and target.Item then
Character = LocalPlayer.Character
Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
if Humanoid and target.Item.Parent == LocalPlayer.Backpack then
Humanoid:EquipTool(target.Item)
WindUI:Notify({
Title = "Equipped",
Content = string.format("Equipped %s (Value: $%s)", target.Name, math.floor(target.Value)),
Duration = 3
})
end
end
end
})
Tabs.Main:Divider()
Tabs.Main:Section({ Title = "Scan Best Pet in Inventory" })
Tabs.Main:Divider()
petList = {}
petParagraph = Tabs.Main:Paragraph({
Title = "No pets in inventory",
Desc = "Click Find Best Pet to scan your pets"
})
Tabs.Main:Button({
Title = "Find Best Pet",
Callback = function()
petList = {}
CalculatePetValue = require(ReplicatedStorage.Modules.CalculatePetValue)
scanFunction = function(item)
if item:IsA("Tool") and item:GetAttribute("ItemType") == "Pet" then
value = 0
pcall(function()
value = CalculatePetValue(item)
end)
mutations = {}
for attr, val in pairs(item:GetAttributes()) do
if type(val) == "boolean" and val == true then
table.insert(mutations, attr)
end
end
level = item:GetAttribute("Level") or 1
itemName = item.Name
weight = 0
weightMatch = itemName:match("%[(%d+%.?%d*)%s*KG%]")
if not weightMatch then
weightMatch = itemName:match("%[(%d+)%s*KG%]")
end
if weightMatch then
weight = tonumber(weightMatch) or 0
end
age = 0
ageMatch = itemName:match("%[Age%s*(%d+)%]")
if not ageMatch then
ageMatch = itemName:match("%[(%d+)%s*Age%]")
end
if ageMatch then
age = tonumber(ageMatch) or 0
end
cleanName = itemName
cleanName = cleanName:gsub("%[%d+%.?%d*%s*KG%]", "")
cleanName = cleanName:gsub("%[Age%s*%d+%]", "")
cleanName = cleanName:gsub("%[%d+%s*Age%]", "")
cleanName = cleanName:gsub("%s+", " ")
cleanName = cleanName:gsub("^%s*(.-)%s*$", "%1")
if #cleanName == 0 then
cleanName = itemName
end
table.insert(petList, {
Pet = item,
Name = itemName,
CleanName = cleanName,
Value = value,
Mutations = mutations,
Level = level,
Age = age,
Weight = weight
})
end
end
if Backpack then
for _, item in pairs(Backpack:GetChildren()) do
scanFunction(item)
end
end
if Character then
for _, item in pairs(Character:GetChildren()) do
scanFunction(item)
end
end
table.sort(petList, function(a, b) return (a.Value or 0) > (b.Value or 0) end)
if #petList > 0 then
top = petList[1]
mutationText = #top.Mutations > 0 and table.concat(top.Mutations, ", ") or "None"
displayText = string.format("Value: $%s\nLevel: %s\nMutation: %s", 
tostring(math.floor(top.Value)),
tostring(top.Level),
mutationText
)
if top.Weight and top.Weight > 0 then
displayText = displayText .. string.format("\nWeight: %s KG", tostring(top.Weight))
end
if top.Age and top.Age > 0 then
displayText = displayText .. string.format("\nAge: %s", tostring(top.Age))
end
petParagraph:SetTitle(top.CleanName)
petParagraph:SetDesc(displayText)
else
petParagraph:SetTitle("No pets found")
petParagraph:SetDesc("No pets in your inventory")
end
end
})
Tabs.Main:Button({
Title = "Equip Best Pet",
Callback = function()
if #petList == 0 then 
WindUI:Notify({
Title = "Equip Failed",
Content = "No pets in inventory",
Duration = 3
})
return 
end
target = petList[1]
if target and target.Pet then
Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
if Humanoid and target.Pet.Parent == LocalPlayer.Backpack then
Humanoid:EquipTool(target.Pet)
WindUI:Notify({
Title = "Equipped",
Content = string.format("Equipped %s (Value: $%s)", target.CleanName, math.floor(target.Value)),
Duration = 3
})
end
end
end
})
Tabs.Main:Divider()
Tabs.Main:Section({ Title = "Current Hand Scanner" })
Tabs.Main:Divider()
handParagraph = Tabs.Main:Paragraph({
Title = "Nothing in hand",
Desc = "Check your current item"
})
Tabs.Main:Button({
Title = "Calculate Hand Value",
Callback = function()
handItem = nil
if Character then
for _, item in pairs(Character:GetChildren()) do
if item:IsA("Tool") then
handItem = item
break
end
end
end
if not handItem then 
handParagraph:SetTitle("Nothing in hand")
handParagraph:SetDesc("Your hand is empty")
WindUI:Notify({
Title = "Calculate Failed",
Content = "Nothing in your hand",
Duration = 3
})
return 
end
value = 0
itemType = handItem:GetAttribute("ItemType")
itemName = handItem.Name
cleanTitle = itemName:gsub("%[.-%]", ""):gsub("%s+", " "):gsub("^%s*(.-)%s*$", "%1")
if itemType == "Pet" then
CalculatePetValue = require(ReplicatedStorage.Modules.CalculatePetValue)
pcall(function()
value = CalculatePetValue(handItem)
end)
mutations = {}
for attr, val in pairs(handItem:GetAttributes()) do
if type(val) == "boolean" and val == true then
table.insert(mutations, attr)
end
end
level = handItem:GetAttribute("Level") or 1
mutationText = #mutations > 0 and table.concat(mutations, ", ") or "None"
weight = 0
weightMatch = itemName:match("%[(%d+%.?%d*)%s*KG%]")
if not weightMatch then
weightMatch = itemName:match("%[(%d+)%s*KG%]")
end
if weightMatch then
weight = tonumber(weightMatch) or 0
end
age = 0
ageMatch = itemName:match("%[Age%s*(%d+)%]")
if not ageMatch then
ageMatch = itemName:match("%[(%d+)%s*Age%]")
end
if ageMatch then
age = tonumber(ageMatch) or 0
end
weightObj = handItem:FindFirstChild("Weight")
if weightObj and weight == 0 then
weight = weightObj.Value
end
displayText = string.format("Value: $%s\nType: Pet\nLevel: %s\nMutation: %s", 
tostring(math.floor(value)),
tostring(level),
mutationText
)
if weight and weight > 0 then
displayText = displayText .. string.format("\nWeight: %s KG", tostring(weight))
end
if age and age > 0 then
displayText = displayText .. string.format("\nAge: %s", tostring(age))
end
handParagraph:SetTitle(cleanTitle)
handParagraph:SetDesc(displayText)
else
pcall(function()
value = require(ReplicatedStorage.Modules.CalculatePlantValue)(handItem)
end)
weightObj = handItem:FindFirstChild("Weight")
weight = weightObj and weightObj.Value or 0
mutations = {}
for attr, val in pairs(handItem:GetAttributes()) do
if type(val) == "boolean" and val == true then
table.insert(mutations, attr)
end
end
variant = handItem:FindFirstChild("Variant")
variantName = variant and variant.Value or "None"
mutationText = #mutations > 0 and table.concat(mutations, ", ") or "None"
handParagraph:SetTitle(cleanTitle)
handParagraph:SetDesc(string.format(
"Value: $%s\nType: %s\nWeight: %s KG\nMutation: %s\nVariant: %s",
tostring(math.floor(value)),
itemType or "Fruit",
tostring(weight),
mutationText,
variantName
))
end
WindUI:Notify({
Title = "Hand Value",
Content = string.format("%s: $%s", cleanTitle, math.floor(value)),
Duration = 4
})
end
})
Tabs.Player:Section({ Title = "Player", TextSize = 40 })
Tabs.Player:Divider()
function onCharacterAdded(newCharacter)
Character = newCharacter
Humanoid = Character:WaitForChild("Humanoid", 5)
rootPart = Character:WaitForChild("HumanoidRootPart", 5)
if JumpBoost and Humanoid then
Humanoid.JumpPower = JumpPower
Humanoid.JumpHeight = JumpPower
setupJumpBoost()
end
if SpeedHack and Humanoid then
Humanoid.WalkSpeed = SpeedValue
end
end
LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
if LocalPlayer.Character then
onCharacterAdded(LocalPlayer.Character)
end
UserInputService.JumpRequest:connect(function()
if InfiniteJump then
LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
end
end)
InfiniteJumpToggle = Tabs.Player:Toggle({
Title = "Infinite Jump",
Flag = "InfiniteJumpToggle",
Value = InfiniteJump,
Callback = function(state)
InfiniteJump = state
end
})
Tabs.Player:Space()
SpeedToggle = Tabs.Player:Toggle({
Title = "Speed Hack",
Flag = "SpeedToggle",
Value = SpeedHack,
Callback = function(state)
SpeedHack = state
if state and Humanoid then
Humanoid.WalkSpeed = SpeedValue
elseif Humanoid then
Humanoid.WalkSpeed = 16
end
end
})
SpeedSlider = Tabs.Player:Slider({
Title = "Speed Value",
Flag = "SpeedSlider",
Desc = "Adjust walk speed",
Value = { Min = 16, Max = 200, Default = SpeedValue, Step = 1 },
Callback = function(value)
SpeedValue = value
if SpeedHack and Humanoid then
Humanoid.WalkSpeed = value
end
end
})
Tabs.Player:Space()
Noclip = nil
Clip = nil
function noclip()
Clip = false
function Nocl()
if Clip == false and LocalPlayer.Character ~= nil then
for _,v in pairs(LocalPlayer.Character:GetDescendants()) do
if v:IsA('BasePart') and v.CanCollide then
v.CanCollide = false
end
end
end
wait(0.21)
end
Noclip = RunService.Stepped:Connect(Nocl)
end
function clip()
if Noclip then 
Noclip:Disconnect() 
end
Clip = true
if LocalPlayer.Character then
for _,v in pairs(LocalPlayer.Character:GetDescendants()) do
if v:IsA('BasePart') then
v.CanCollide = true
end
end
end
end
NoclipToggle = Tabs.Player:Toggle({
Title = "Noclip",
Flag = "NoclipToggle",
Value = Noclip,
Callback = function(state)
Noclip = state
if state then
noclip()
else
clip()
end
end
})
IsOnMobile = false
xpcall(function()
IsOnMobile = table.find({Enum.Platform.Android, Enum.Platform.IOS}, UserInputService:GetPlatform()) ~= nil
end, function()
IsOnMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
end)
if IsOnMobile then
LocalPlayer:WaitForChild("PlayerGui")
local touchGui = LocalPlayer.PlayerGui:WaitForChild("TouchGui")
local touchControlFrame = touchGui:WaitForChild("TouchControlFrame")
local originalJumpButton = touchControlFrame:WaitForChild("JumpButton")
local DownWardJumpBtn = nil
function createDownwardButton()
if DownWardJumpBtn and DownWardJumpBtn.Parent then
DownWardJumpBtn:Destroy()
end
DownWardJumpBtn = Instance.new("ImageButton")
DownWardJumpBtn.Name = "DownWardJumpBtn"
DownWardJumpBtn.Size = originalJumpButton.Size
DownWardJumpBtn.Image = originalJumpButton.Image
DownWardJumpBtn.ImageRectOffset = originalJumpButton.ImageRectOffset
DownWardJumpBtn.ImageRectSize = originalJumpButton.ImageRectSize
DownWardJumpBtn.BackgroundTransparency = 1
DownWardJumpBtn.AnchorPoint = Vector2.new(1, 0)
DownWardJumpBtn.AutoButtonColor = false
DownWardJumpBtn.Position = UDim2.new(1, 0, originalJumpButton.Position.Y.Scale, originalJumpButton.Position.Y.Offset)
DownWardJumpBtn.Rotation = 180
local originalRectOffset = originalJumpButton.ImageRectOffset
local isHoldingDown = false
DownWardJumpBtn.MouseButton1Down:Connect(function()
isHoldingDown = true
DownWardJumpBtn.ImageRectOffset = Vector2.new(146, 146)
flyDownPressed = true
end)
DownWardJumpBtn.MouseButton1Up:Connect(function()
if isHoldingDown then
isHoldingDown = false
DownWardJumpBtn.ImageRectOffset = originalRectOffset
flyDownPressed = false
end
end)
DownWardJumpBtn.MouseLeave:Connect(function()
if isHoldingDown then
isHoldingDown = false
DownWardJumpBtn.ImageRectOffset = originalRectOffset
flyDownPressed = false
end
end)
DownWardJumpBtn.Parent = touchControlFrame
function preventOverlap()
if not DownWardJumpBtn or not DownWardJumpBtn.Parent then return end
local buttonWidth = DownWardJumpBtn.AbsoluteSize.X
local originalButton = touchControlFrame:FindFirstChild("JumpButton")
if originalButton then
local originalRightEdge = originalButton.AbsolutePosition.X + originalButton.AbsoluteSize.X
local duplicateLeftEdge = DownWardJumpBtn.AbsolutePosition.X
local distance = duplicateLeftEdge - originalRightEdge
if distance < 1 then
local neededOffset = 1 - distance
local newXOffset = DownWardJumpBtn.Position.X.Offset - neededOffset
DownWardJumpBtn.Position = UDim2.new(1, newXOffset, DownWardJumpBtn.Position.Y.Scale, DownWardJumpBtn.Position.Y.Offset)
elseif distance > 1 then
local neededOffset = distance - 1
local newXOffset = DownWardJumpBtn.Position.X.Offset + neededOffset
DownWardJumpBtn.Position = UDim2.new(1, newXOffset, DownWardJumpBtn.Position.Y.Scale, DownWardJumpBtn.Position.Y.Offset)
end
end
end
DownWardJumpBtn:GetPropertyChangedSignal("AbsoluteSize"):Connect(preventOverlap)
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(preventOverlap)
preventOverlap()
end
local isHoldingJump = false
local originalJumpRectOffset = originalJumpButton.ImageRectOffset
originalJumpButton.MouseButton1Down:Connect(function()
isHoldingJump = true
originalJumpButton.ImageRectOffset = Vector2.new(146, 146)
flyUpPressed = true
end)
originalJumpButton.MouseButton1Up:Connect(function()
if isHoldingJump then
isHoldingJump = false
originalJumpButton.ImageRectOffset = originalJumpRectOffset
flyUpPressed = false
end
end)
originalJumpButton.MouseLeave:Connect(function()
if isHoldingJump then
isHoldingJump = false
originalJumpButton.ImageRectOffset = originalJumpRectOffset
flyUpPressed = false
end
end)
end
FLYING = false
flyspeed = 5
flyKeyDown = nil
flyKeyUp = nil
flyVelocityHandlerName = "FlyVelocity_" .. math.random(1000, 9999)
flyGyroHandlerName = "FlyGyro_" .. math.random(1000, 9999)
mfly1 = nil
mfly2 = nil
flyUpPressed = false
flyDownPressed = false
function getRoot(Humanoid)
return Character and (Character:FindFirstChild("HumanoidRootPart") or Character:FindFirstChild("Torso") or Character:FindFirstChild("UpperTorso"))
end
function unmobilefly(speaker)
pcall(function()
FLYING = false
flyUpPressed = false
flyDownPressed = false
root = getRoot(speaker.Character)
if root then
bv = root:FindFirstChild(flyVelocityHandlerName)
bg = root:FindFirstChild(flyGyroHandlerName)
if bv then bv:Destroy() end
if bg then bg:Destroy() end
end
if speaker.Character and speaker.Character:FindFirstChildWhichIsA("Humanoid") then
speaker.Character:FindFirstChildWhichIsA("Humanoid").PlatformStand = false
end
if mfly1 then mfly1:Disconnect() mfly1 = nil end
if mfly2 then mfly2:Disconnect() mfly2 = nil end
if DownWardJumpBtn and DownWardJumpBtn.Parent then
DownWardJumpBtn:Destroy()
DownWardJumpBtn = nil
end
end)
end
function mobilefly(speaker)
unmobilefly(speaker)
FLYING = true
createDownwardButton()
root = getRoot(speaker.Character)
if not root then return end
camera = workspace.CurrentCamera
v3none = Vector3.new()
v3zero = Vector3.new(0, 0, 0)
v3inf = Vector3.new(9e9, 9e9, 9e9)
controlModule = nil
pcall(function()
controlModule = require(speaker.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
end)
bv = Instance.new("BodyVelocity")
bv.Name = flyVelocityHandlerName
bv.Parent = root
bv.MaxForce = v3zero
bv.Velocity = v3zero
bg = Instance.new("BodyGyro")
bg.Name = flyGyroHandlerName
bg.Parent = root
bg.MaxTorque = v3inf
bg.P = 1000
bg.D = 50
mfly2 = RunService.RenderStepped:Connect(function()
currentRoot = getRoot(speaker.Character)
currentCamera = workspace.CurrentCamera
currentHumanoid = speaker.Character and speaker.Character:FindFirstChildWhichIsA("Humanoid")
if currentHumanoid and currentRoot and currentRoot:FindFirstChild(flyVelocityHandlerName) and currentRoot:FindFirstChild(flyGyroHandlerName) then
VelocityHandler = currentRoot:FindFirstChild(flyVelocityHandlerName)
GyroHandler = currentRoot:FindFirstChild(flyGyroHandlerName)
VelocityHandler.MaxForce = v3inf
GyroHandler.MaxTorque = v3inf
currentHumanoid.PlatformStand = true
GyroHandler.CFrame = currentCamera.CoordinateFrame
moveVector = Vector3.new(0, 0, 0)
if controlModule then
direction = controlModule:GetMoveVector()
speed = flyspeed * 50
moveVector = (currentCamera.CFrame.RightVector * direction.X * speed) +
(-currentCamera.CFrame.LookVector * direction.Z * speed)
end
if flyUpPressed then
moveVector = moveVector + Vector3.new(0, flyspeed * 50, 0)
end
if flyDownPressed then
moveVector = moveVector - Vector3.new(0, flyspeed * 50, 0)
end
VelocityHandler.Velocity = moveVector
end
end)
end
function pcfly()
plr = Players.LocalPlayer
char = plr.Character or plr.CharacterAdded:Wait()
Humanoid = char:FindFirstChildOfClass("Humanoid")
if not Humanoid then
repeat task.wait() until char:FindFirstChildOfClass("Humanoid")
Humanoid = char:FindFirstChildOfClass("Humanoid")
end
if flyKeyDown or flyKeyUp then
flyKeyDown:Disconnect()
flyKeyUp:Disconnect()
end
T = getRoot(char)
if not T then return end
WPressed = false
SPressed = false
APressed = false
DPressed = false
SpacePressed = false
CtrlPressed = false
function FLY()
FLYING = true
BG = Instance.new('BodyGyro')
BV = Instance.new('BodyVelocity')
BG.P = 9e4
BG.Parent = T
BV.Parent = T
BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
BG.CFrame = T.CFrame
BV.Velocity = Vector3.new(0, 0, 0)
BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
task.spawn(function()
while FLYING do
task.wait()
camera = workspace.CurrentCamera
Humanoid.PlatformStand = true
moveDirection = Vector3.new(0, 0, 0)
if WPressed then
moveDirection = moveDirection + camera.CFrame.LookVector * flyspeed
end
if SPressed then
moveDirection = moveDirection - camera.CFrame.LookVector * flyspeed
end
if APressed then
moveDirection = moveDirection - camera.CFrame.RightVector * flyspeed
end
if DPressed then
moveDirection = moveDirection + camera.CFrame.RightVector * flyspeed
end
if SpacePressed then
moveDirection = moveDirection + Vector3.new(0, flyspeed * 2, 0)
end
if CtrlPressed then
moveDirection = moveDirection - Vector3.new(0, flyspeed * 2, 0)
end
BV.Velocity = moveDirection * 16
BG.CFrame = camera.CFrame
end
BG:Destroy()
BV:Destroy()
if Humanoid then Humanoid.PlatformStand = false end
end)
end
flyKeyDown = UserInputService.InputBegan:Connect(function(input, processed)
if processed then return end
if input.KeyCode == Enum.KeyCode.W then
WPressed = true
elseif input.KeyCode == Enum.KeyCode.S then
SPressed = true
elseif input.KeyCode == Enum.KeyCode.A then
APressed = true
elseif input.KeyCode == Enum.KeyCode.D then
DPressed = true
elseif input.KeyCode == Enum.KeyCode.Space then
SpacePressed = true
elseif input.KeyCode == Enum.KeyCode.LeftControl then
CtrlPressed = true
end
pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
end)
flyKeyUp = UserInputService.InputEnded:Connect(function(input, processed)
if processed then return end
if input.KeyCode == Enum.KeyCode.W then
WPressed = false
elseif input.KeyCode == Enum.KeyCode.S then
SPressed = false
elseif input.KeyCode == Enum.KeyCode.A then
APressed = false
elseif input.KeyCode == Enum.KeyCode.D then
DPressed = false
elseif input.KeyCode == Enum.KeyCode.Space then
SpacePressed = false
elseif input.KeyCode == Enum.KeyCode.LeftControl then
CtrlPressed = false
end
end)
FLY()
end
function NOFLY()
FLYING = false
flyUpPressed = false
flyDownPressed = false
if flyKeyDown then 
flyKeyDown:Disconnect()
flyKeyDown = nil
end
if flyKeyUp then 
flyKeyUp:Disconnect()
flyKeyUp = nil
end
if IsOnMobile then
unmobilefly(Players.LocalPlayer)
else
if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
end
root = getRoot(Players.LocalPlayer.Character)
if root then
root.Velocity = Vector3.new(0, 0, 0)
end
end
pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end
function onCharacterAdded()
if FlyToggle and FlyToggle.Value then
task.wait(1)
if IsOnMobile then
mobilefly(Players.LocalPlayer)
else
pcfly()
end
end
end
Players.LocalPlayer.CharacterAdded:Connect(function()
NOFLY()
onCharacterAdded()
end)
Tabs.Player:Space()
FlyToggle = Tabs.Player:Toggle({
Title = "Fly",
Flag = "FlyToggle",
Value = false,
Callback = function(state)
if state then
if IsOnMobile then
mobilefly(Players.LocalPlayer)
else
pcfly()
end
else
NOFLY()
end
end
})
FlySpeedInput = Tabs.Player:Input({
Title = "Fly Speed",
Flag = "FlySpeedInput",
Placeholder = "Enter speed value",
Value = tostring(flyspeed),
NumbersOnly = true,
Callback = function(value)
speed = tonumber(value)
if speed and speed > 0 then
flyspeed = speed
end
end
})
ShowFlyButtonToggle = Tabs.Player:Toggle({
Title = "Fly Button",
Flag = "ShowFlyButton",
Value = false,
Callback = function(state)
IY = IY or {}
IY.FlightBtn = state
if ButtonLib and ButtonLib.Flight then
ButtonLib.Flight:SetVisible(state)
end
end
})
ButtonLib.Create:Toggle({
Text = "Flight",
Flag = "Flight",
Default = false,
Visible = false,
Callback = function(s) 
if FlyToggle then
FlyToggle:Set(s)
end
end
}).Position = UDim2.new(0.5, -125, 0.4, 0)
Tabs.Player:Space()
ToggleTpwalk = false
TpwalkConnection = nil
function Tpwalking()
if ToggleTpwalk and Character and Humanoid and rootPart then
moveDirection = Humanoid.MoveDirection
moveDistance = TpwalkValue
origin = rootPart.Position
direction = moveDirection * moveDistance
targetPosition = origin + direction
raycastParams = RaycastParams.new()
raycastParams.FilterDescendantsInstances = {Character}
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
raycastResult = workspace:Raycast(origin, direction, raycastParams)
if raycastResult then
hitPosition = raycastResult.Position
distanceToHit = (hitPosition - origin).Magnitude
if distanceToHit < math.abs(moveDistance) then
targetPosition = origin + (direction.Unit * (distanceToHit - 0.1))
end
end
rootPart.CFrame = CFrame.new(targetPosition) * rootPart.CFrame.Rotation
rootPart.CanCollide = true
end
end
function startTpwalk()
ToggleTpwalk = true
if TpwalkConnection then
TpwalkConnection:Disconnect()
end
TpwalkConnection = RunService.Heartbeat:Connect(Tpwalking)
end
function stopTpwalk()
ToggleTpwalk = false
if TpwalkConnection then
TpwalkConnection:Disconnect()
TpwalkConnection = nil
end
if rootPart then
rootPart.CanCollide = false
end
end
TPWALKToggle = Tabs.Player:Toggle({
Title = "TP WALK",
Flag = "TPWALKToggle",
Value = TPWALK,
Callback = function(state)
TPWALK = state
if state then
startTpwalk()
else
stopTpwalk()
end
end
})
TPWALKSlider = Tabs.Player:Slider({
Title = "TPWALK VALUE",
Flag = "TPWALKSlider",
Desc = "Adjust TPWALK speed",
Value = { Min = 1, Max = 200, Default = TpwalkValue, Step = 1 },
Callback = function(value)
TpwalkValue = value
end
})
Tabs.Player:Space()
jumpCount = 0
MAX_JUMPS = math.huge
function setupJumpBoost()
if not Character or not Humanoid then return end
Humanoid.StateChanged:Connect(function(oldState, newState)
if newState == Enum.HumanoidStateType.Landed then
jumpCount = 0
end
end)
Humanoid.Jumping:Connect(function(isJumping)
if isJumping and JumpBoost and jumpCount < MAX_JUMPS then
jumpCount = jumpCount + 1
Humanoid.JumpHeight = JumpPower
if jumpCount > 1 then
rootPart:ApplyImpulse(Vector3.new(0, JumpPower * rootPart.Mass, 0))
end
end
end)
end
function startJumpBoost()
if Humanoid then
Humanoid.JumpPower = JumpPower
Humanoid.JumpHeight = JumpPower
end
setupJumpBoost()
end
function stopJumpBoost()
jumpCount = 0
if Humanoid then
Humanoid.JumpPower = 50
Humanoid.JumpHeight = 50
end
end
JumpBoostToggle = Tabs.Player:Toggle({
Title = "Jump Height",
Flag = "JumpBoostToggle",
Value = JumpBoost,
Callback = function(state)
JumpBoost = state
if state then
startJumpBoost()
else
stopJumpBoost()
end
end
})
JumpBoostSlider = Tabs.Player:Slider({
Title = "Jump Power",
Flag = "JumpBoostSlider",
Desc = "Adjust jump height",
Value = { Min = 1, Max = 200, Default = JumpPower, Step = 1 },
Callback = function(value)
JumpPower = value
if JumpBoost then
if Humanoid then
Humanoid.JumpPower = JumpPower
Humanoid.JumpHeight = JumpPower
end
end
end
})
Tabs.Player:Space()
Tabs.Player:Button({
Title = "Force Reset Character",
Callback = function()
RblxCallDialog({
Title = "Reset Character",
Desc = [[Are you sure you want to Reset Character? Press ''Reset'' to continue]],
Button1 = {
Title = "Cancel",
Type = "GreyOutline",
},
Button2 = {
Title = "Reset",
Type = "White",
WaitTimeClick = 5,
Callback = function()
local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
if hum then hum.Health = 0 end
end
}
})
end
})
Tabs.Garden:Section({ Title = "Auto Plant", TextSize = 20 })
AutoPlantEnabled = false
AutoPlantTask = nil
AutoPlantSelectedSeeds = {}
AutoPlantBlacklistedSeeds = {}
AutoPlantMode = "Random"
AutoPlantEquipSeed = true
AutoPlantDelay = 0.1
GameEvents = ReplicatedStorage.GameEvents
Plant_RE = GameEvents.Plant_RE
seedDataModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("SeedData")
function LoadSeedNames()
local dropdownItems = {}
local success, seedData = pcall(require, seedDataModule)
if success then
local seedsList = {}
for seedName, seedInfo in pairs(seedData) do
if seedInfo.SeedName and not string.find(seedName:lower(), "pack") then
local rarity = seedInfo.SeedRarity or "Unknown"
table.insert(seedsList, {
Name = seedName,
DisplayName = seedInfo.SeedName,
Icon = seedInfo.FruitIcon or seedInfo.Asset or "",
Rarity = rarity
})
end
end
table.sort(seedsList, function(a, b)
return a.DisplayName < b.DisplayName
end)
for _, seed in ipairs(seedsList) do
table.insert(dropdownItems, {
Title = seed.DisplayName,
Desc = "Rarity: " .. seed.Rarity,
Icon = seed.Icon,
Value = seed.Name,
Data = {Name = seed.Name, DisplayName = seed.DisplayName, Rarity = seed.Rarity}
})
end
end
return dropdownItems
end
function GetEquippedSeed()
if #AutoPlantSelectedSeeds > 0 then
for _, container in ipairs({Character, Backpack}) do
for _, tool in ipairs(container:GetChildren()) do
if tool:IsA("Tool") then
local itemType = tool:GetAttribute("ItemType")
local seedName = tool:GetAttribute("ItemName") or tool:GetAttribute("Seed") or tool.Name
if (itemType and itemType == "Seed") or (tool.Name:find("Seed") and not tool.Name:find("Pack")) then
for _, selected in ipairs(AutoPlantSelectedSeeds) do
if seedName == selected then
return tool, seedName
end
end
end
end
end
end
else
for _, container in ipairs({Character, Backpack}) do
for _, tool in ipairs(container:GetChildren()) do
if tool:IsA("Tool") then
local itemType = tool:GetAttribute("ItemType")
local seedName = tool:GetAttribute("ItemName") or tool:GetAttribute("Seed") or tool.Name
if (itemType and itemType == "Seed") or (tool.Name:find("Seed") and not tool.Name:find("Pack")) then
if #AutoPlantBlacklistedSeeds == 0 or not table.find(AutoPlantBlacklistedSeeds, seedName) then
return tool, seedName
end
end
end
end
end
end
return nil, nil
end
function EquipSeed(tool)
if tool and AutoPlantEquipSeed then
local humanoid = Character:FindFirstChildOfClass("Humanoid")
if humanoid and tool.Parent == Backpack then
humanoid:EquipTool(tool)
task.wait(0.1)
end
end
end
function GetPlantingPosition()
if not Character then return Vector3.new(0, 4, 0) end
if AutoPlantMode == "Under LocalPlayer" then
local hrp = Character:FindFirstChild("HumanoidRootPart")
if hrp then
return hrp.Position + Vector3.new(0, -2, 0)
end
return Vector3.new(0, 4, 0)
else
local hrp = Character:FindFirstChild("HumanoidRootPart")
if hrp then
local basePos = hrp.Position
local offsetX = math.random(-20, 20)
local offsetZ = math.random(-20, 20)
return basePos + Vector3.new(offsetX, -2, offsetZ)
end
return Vector3.new(math.random(-50, 50), 4, math.random(-50, 50))
end
end
function PlantSeed()
if not Plant_RE then return false end
local tool, seedName = GetEquippedSeed()
if not tool then return false end
EquipSeed(tool)
local position = GetPlantingPosition()
local success = pcall(function()
Plant_RE:FireServer(position, seedName)
end)
return success
end
function StartAutoPlant()
AutoPlantTask = task.spawn(function()
while AutoPlantEnabled do
PlantSeed()
task.wait(AutoPlantDelay)
for i = 1, 5 do
if not AutoPlantEnabled then break end
PlantSeed()
end
task.wait(0.05)
end
end)
end
AutoPlantWhitelistDropdown = Tabs.Garden:Dropdown({
Title = "Select Seed (Whitelist)",
Values = {{Title = "Click Refresh Whitelist", Icon = "refresh-cw"}},
Value = {},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(options)
AutoPlantSelectedSeeds = {}
for _, option in ipairs(options) do
if option.Value then
table.insert(AutoPlantSelectedSeeds, option.Value)
end
end
end
})
Tabs.Garden:Button({
Title = "Refresh Whitelist",
Icon = "refresh-cw",
Callback = function()
local items = LoadSeedNames()
if #items > 0 then
AutoPlantWhitelistDropdown:Refresh(items, {})
else
AutoPlantWhitelistDropdown:Refresh({{Title = "Failed to load", Icon = "x-circle"}})
end
end
})
AutoPlantBlacklistDropdown = Tabs.Garden:Dropdown({
Title = "Blacklist Seeds",
Values = {{Title = "Click Refresh Blacklist", Icon = "refresh-cw"}},
Value = {},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(options)
AutoPlantBlacklistedSeeds = {}
for _, option in ipairs(options) do
if option.Value then
table.insert(AutoPlantBlacklistedSeeds, option.Value)
end
end
end
})
Tabs.Garden:Button({
Title = "Refresh Blacklist",
Icon = "refresh-cw",
Callback = function()
local items = LoadSeedNames()
if #items > 0 then
AutoPlantBlacklistDropdown:Refresh(items, {})
else
AutoPlantBlacklistDropdown:Refresh({{Title = "Failed to load", Icon = "x-circle"}})
end
end
})
AutoPlantModeDropdown = Tabs.Garden:Dropdown({
Title = "Select Mode",
Values = {
{Title = "Random", Icon = "shuffle", Value = "Random"},
{Title = "Under LocalPlayer", Icon = "user", Value = "Under LocalPlayer"}
},
Value = {Title = "Random", Icon = "shuffle", Value = "Random"},
Callback = function(option)
AutoPlantMode = option.Value
end
})
AutoPlantEquipToggle = Tabs.Garden:Toggle({
Title = "Auto Equip Seed",
Value = true,
Callback = function(state)
AutoPlantEquipSeed = state
end
})
AutoPlantToggle = Tabs.Garden:Toggle({
Title = "Auto Plant",
Value = false,
Callback = function(state)
AutoPlantEnabled = state
if state then
StartAutoPlant()
elseif AutoPlantTask then
task.cancel(AutoPlantTask)
AutoPlantTask = nil
end
end
})
AutoPlantDelaySlider = Tabs.Garden:Slider({
Title = "Auto plant Delay",
Step = 0.001,
Value = {Min = 0.001, Max = 2, Default = 0.1},
Callback = function(value)
AutoPlantDelay = value
end
})
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

fruitAuraEnabled = false
fruitAuraDelay = 0.01
fruitAuraRange = 1
fruitAuraThread = nil
fruitAuraConnection = nil
fruitAuraTimer = 0
PickupSoundEvent = ReplicatedStorage.GameEvents:FindFirstChild("PickupSound") or ReplicatedStorage.GameEvents:FindFirstChild("PickupEvent")
fruitWhitelist = {}
fruitBlacklist = {}
mutationWhitelist = {}
mutationBlacklist = {}
variantWhitelist = {}
variantBlacklist = {}
fruitWhitelistNormalized = {}
fruitBlacklistNormalized = {}
mutationWhitelistNormalized = {}
mutationBlacklistNormalized = {}
variantWhitelistNormalized = {}
variantBlacklistNormalized = {}
myFarmPlotsCache = {}
lastFarmUpdate = 0
farmCacheTTL = 5
fruitLimit = 30
weightFilterEnabled = false
minWeight = 0
maxWeight = 999999
maxBackpackCapacity = 0
CalculatePlantValue = require(ReplicatedStorage.Modules.CalculatePlantValue)
valueFilterEnabled = false
minValue = 0
maxValue = 999999999
fruitValueCache = {}
valueCacheTTL = 3
variantFilterEnabled = false
MutationHandler = require(ReplicatedStorage.Modules.MutationHandler)
SeedData = require(ReplicatedStorage.Data.SeedData)

local function getMaxBackpackCapacity()
    return math.ceil(200 + (LocalPlayer:GetAttribute("BonusBackpackSize") or 0))
end

maxBackpackCapacity = getMaxBackpackCapacity()

local function isBackpackFull()
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if not backpack then 
        return false 
    end
    
    local fruitCount = 0
    for _, tool in pairs(backpack:GetChildren()) do
        if tool:IsA("Tool") and tool:FindFirstChild("Item_Seed") then
            fruitCount = fruitCount + 1
        end
    end
    
    return fruitCount >= maxBackpackCapacity
end

local function getAvailableSpace()
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if not backpack then return maxBackpackCapacity end
    
    local fruitCount = 0
    for _, tool in pairs(backpack:GetChildren()) do
        if tool:IsA("Tool") and tool:FindFirstChild("Item_Seed") then
            fruitCount = fruitCount + 1
        end
    end
    
    return math.max(0, maxBackpackCapacity - fruitCount)
end

local function getMaxFruitsToCollect()
    local availableSpace = getAvailableSpace()
    return math.min(fruitLimit, availableSpace)
end

function GetmutationsData()
    local data = {}
    local mutations = MutationHandler:GetMutations()
    for _, mutation in pairs(mutations) do
        if mutation.Name then
            table.insert(data, mutation.Name)
        end
    end
    table.sort(data)
    return data
end

function GetcropsData()
    local data = {}
    for fruitName, fruitInfo in pairs(SeedData) do
        table.insert(data, {
            Title = fruitName,
            Desc = "Rarity: " .. (fruitInfo.SeedRarity or "Unknown"),
            Icon = fruitInfo.FruitIcon or fruitInfo.Asset or "rbxassetid://132438947521974"
        })
    end
    table.sort(data, function(a, b) return a.Title < b.Title end)
    return data
end

function GetvariantData()
    local variantEnums = require(ReplicatedStorage.Data.EnumRegistry.VariantsEnums)
    local data = {}
    if type(variantEnums) == "table" then
        for variantName, _ in pairs(variantEnums) do
            if type(variantName) == "string" then
                table.insert(data, variantName)
            end
        end
    end
    table.sort(data)
    return data
end

function updateWhitelistNormalized()
    fruitWhitelistNormalized = {}
    for _, fruitData in pairs(fruitWhitelist) do
        local fruitName = fruitData.Title or fruitData
        if type(fruitName) == "string" then
            fruitWhitelistNormalized[fruitName:lower()] = true
        end
    end
    fruitBlacklistNormalized = {}
    for _, fruitData in pairs(fruitBlacklist) do
        local fruitName = fruitData.Title or fruitData
        if type(fruitName) == "string" then
            fruitBlacklistNormalized[fruitName:lower()] = true
        end
    end
    mutationWhitelistNormalized = {}
    for _, mutationData in pairs(mutationWhitelist) do
        local mutationName = mutationData.Title or mutationData
        if type(mutationName) == "string" then
            mutationWhitelistNormalized[mutationName:lower()] = true
        end
    end
    mutationBlacklistNormalized = {}
    for _, mutationData in pairs(mutationBlacklist) do
        local mutationName = mutationData.Title or mutationData
        if type(mutationName) == "string" then
            mutationBlacklistNormalized[mutationName:lower()] = true
        end
    end
    variantWhitelistNormalized = {}
    for _, variantData in pairs(variantWhitelist) do
        local variantName = variantData.Title or variantData
        if type(variantName) == "string" then
            variantWhitelistNormalized[variantName:lower()] = true
        end
    end
    variantBlacklistNormalized = {}
    for _, variantData in pairs(variantBlacklist) do
        local variantName = variantData.Title or variantData
        if type(variantName) == "string" then
            variantBlacklistNormalized[variantName:lower()] = true
        end
    end
end

function getMyFarmPlots()
    local now = tick()
    if now - lastFarmUpdate < farmCacheTTL and #myFarmPlotsCache > 0 then
        return myFarmPlotsCache
    end
    local myUsername = LocalPlayer.Name
    local myPlots = {}
    local farmFolder = Workspace:FindFirstChild("Farm")
    if farmFolder then
        for _, plot in pairs(farmFolder:GetChildren()) do
            local sign = plot:FindFirstChild("Sign")
            if sign then
                local owner = sign:GetAttribute("_owner")
                if owner and owner == myUsername then
                    table.insert(myPlots, plot)
                end
            end
        end
    end
    myFarmPlotsCache = myPlots
    lastFarmUpdate = now
    return myPlots
end

function playCollectSound()
    if PickupSoundEvent then
        task.spawn(function()
            pcall(function()
                firesignal(PickupSoundEvent.OnClientEvent, "Collect")
            end)
        end)
    end
end

mutationCache = {}
function checkMutation(fruitObj)
    local fruitId = fruitObj:GetFullName()
    if mutationCache[fruitId] then
        return mutationCache[fruitId]
    end
    local mutation = nil
    for attrName, attrValue in pairs(fruitObj:GetAttributes()) do
        if type(attrValue) == "boolean" and attrValue == true then
            local attrLower = attrName:lower()
            if #mutationWhitelist > 0 and mutationWhitelistNormalized[attrLower] then
                mutation = attrName
                break
            end
            if #mutationBlacklist > 0 and mutationBlacklistNormalized[attrLower] then
                mutation = nil
                break
            end
            if #mutationWhitelist == 0 and #mutationBlacklist == 0 then
                mutation = attrName
                break
            end
        end
    end
    if not mutation then
        local current = fruitObj.Parent
        while current and current ~= Workspace do
            if current.Name == "Fruits" then
                local plant = current.Parent
                if plant and plant:IsA("Model") then
                    for attrName, attrValue in pairs(plant:GetAttributes()) do
                        if type(attrValue) == "boolean" and attrValue == true then
                            local attrLower = attrName:lower()
                            if #mutationWhitelist > 0 and mutationWhitelistNormalized[attrLower] then
                                mutation = attrName
                                break
                            end
                            if #mutationBlacklist > 0 and mutationBlacklistNormalized[attrLower] then
                                mutation = nil
                                break
                            end
                            if #mutationWhitelist == 0 and #mutationBlacklist == 0 then
                                mutation = attrName
                                break
                            end
                        end
                    end
                end
                break
            end
            current = current.Parent
        end
    end
    mutationCache[fruitId] = mutation
    if #mutationCache > 100 then
        local newCache = {}
        local i = 1
        for k, v in pairs(mutationCache) do
            newCache[k] = v
            i = i + 1
            if i > 50 then break end
        end
        mutationCache = newCache
    end
    return mutation
end

function checkVariant(fruitObj)
    if not fruitObj then return nil end
    local variant = fruitObj:FindFirstChild("Variant")
    if variant and variant:IsA("StringValue") and variant.Value ~= "" then
        return variant.Value
    end
    local variantAttr = fruitObj:GetAttribute("Variant")
    if variantAttr and variantAttr ~= "" then
        return tostring(variantAttr)
    end
    local parent = fruitObj.Parent
    if parent then
        local parentVariant = parent:FindFirstChild("Variant")
        if parentVariant and parentVariant:IsA("StringValue") and parentVariant.Value ~= "" then
            return parentVariant.Value
        end
        local parentVariantAttr = parent:GetAttribute("Variant")
        if parentVariantAttr and parentVariantAttr ~= "" then
            return tostring(parentVariantAttr)
        end
        local grandParent = parent.Parent
        if grandParent then
            local grandVariant = grandParent:FindFirstChild("Variant")
            if grandVariant and grandVariant:IsA("StringValue") and grandVariant.Value ~= "" then
                return grandVariant.Value
            end
            local grandVariantAttr = grandParent:GetAttribute("Variant")
            if grandVariantAttr and grandVariantAttr ~= "" then
                return tostring(grandVariantAttr)
            end
        end
    end
    return nil
end

function getFruitWeight(fruitObj)
    local weightAttr = fruitObj:GetAttribute("Weight")
    if weightAttr then
        return tonumber(weightAttr)
    end
    local weightObj = fruitObj:FindFirstChild("Weight")
    if weightObj then
        if weightObj:IsA("NumberValue") or weightObj:IsA("IntValue") then
            return weightObj.Value
        elseif weightObj:IsA("StringValue") then
            return tonumber(weightObj.Value)
        end
    end
    local parent = fruitObj.Parent
    if parent then
        local parentWeightAttr = parent:GetAttribute("Weight")
        if parentWeightAttr then
            return tonumber(parentWeightAttr)
        end
    end
    return nil
end

function getFruitValue(fruitObj)
    local fruitId = fruitObj:GetFullName()
    local now = tick()
    if fruitValueCache[fruitId] and now - fruitValueCache[fruitId].timestamp < valueCacheTTL then
        return fruitValueCache[fruitId].value
    end
    local success, value = pcall(function()
        return CalculatePlantValue(fruitObj)
    end)
    if success and value and type(value) == "number" and value > 0 then
        fruitValueCache[fruitId] = {
            value = value,
            timestamp = now
        }
        if #fruitValueCache > 200 then
            local newCache = {}
            local count = 0
            for k, v in pairs(fruitValueCache) do
                if count < 100 then
                    newCache[k] = v
                    count = count + 1
                else
                    break
                end
            end
            fruitValueCache = newCache
        end
        return value
    end
    return nil
end

function isWhitelisted(fruitObj)
    local fruitName = fruitObj.Name
    local fruitNameLower = fruitName:lower()
    
    if #fruitWhitelist > 0 and not fruitWhitelistNormalized[fruitNameLower] then
        return false
    end
    if #fruitBlacklist > 0 and fruitBlacklistNormalized[fruitNameLower] then
        return false
    end
    
    if #mutationWhitelist > 0 or #mutationBlacklist > 0 then
        local mutation = checkMutation(fruitObj)
        if #mutationWhitelist > 0 then
            if not mutation or not mutationWhitelistNormalized[mutation:lower()] then
                return false
            end
        end
        if #mutationBlacklist > 0 then
            if mutation and mutationBlacklistNormalized[mutation:lower()] then
                return false
            end
        end
    end
    
    if variantFilterEnabled then
        if #variantWhitelist > 0 or #variantBlacklist > 0 then
            local variant = checkVariant(fruitObj)
            if #variantWhitelist > 0 then
                if not variant or not variantWhitelistNormalized[variant:lower()] then
                    return false
                end
            end
            if #variantBlacklist > 0 then
                if variant and variantBlacklistNormalized[variant:lower()] then
                    return false
                end
            end
        end
    end
    
    if weightFilterEnabled then
        local weight = getFruitWeight(fruitObj)
        if weight then
            if weight < minWeight or weight > maxWeight then
                return false
            end
        else
            return false
        end
    end
    
    if valueFilterEnabled then
        local value = getFruitValue(fruitObj)
        if value then
            if value < minValue or value > maxValue then
                return false
            end
        else
            return false
        end
    end
    
    return true
end

function collectFromPlots(plots)
    if isBackpackFull() then
        return false
    end
    
    local character = LocalPlayer.Character
    if not character then return false end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    local hrpPos = hrp.Position
    local allCollectables = {}
    local collectedCount = 0
    
    local maxToCollect = getMaxFruitsToCollect()
    if maxToCollect <= 0 then
        return false
    end
    
    for _, plot in pairs(plots) do
        local descendants = plot:GetDescendants()
        for i = 1, #descendants do
            local obj = descendants[i]
            if obj:IsA("ProximityPrompt") and obj:HasTag("CollectPrompt") then
                if obj.Enabled == false then
                    continue
                end
                local parent = obj.Parent
                if parent then
                    local objPart = parent:IsA("BasePart") and parent or parent:FindFirstChildWhichIsA("BasePart")
                    if objPart then
                        local distance = (hrpPos - objPart.Position).Magnitude
                        if distance > fruitAuraRange then
                            continue
                        end
                    end
                    local grandParent = parent.Parent
                    if grandParent and isWhitelisted(grandParent) then
                        if collectedCount >= maxToCollect then
                            break
                        end
                        fireproximityprompt(obj, 0)
                        parent:SetAttribute("Collected", true)
                        table.insert(allCollectables, grandParent)
                        collectedCount = collectedCount + 1
                    end
                end
            end
        end
        if collectedCount >= maxToCollect then
            break
        end
    end
    
    if #allCollectables > 0 then
        task.delay(1, function()
            for _, collectable in pairs(allCollectables) do
                local parent = collectable.Parent
                if parent then
                    parent:SetAttribute("Collected", nil)
                end
            end
        end)
        task.spawn(function()
            pcall(function()
                ReplicatedStorage.GameEvents.Crops.Collect:FireServer(allCollectables)
            end)
        end)
        return true
    end
    return false
end

function startFruitAura()
    if fruitAuraConnection then
        fruitAuraConnection:Disconnect()
        fruitAuraConnection = nil
    end
    if fruitAuraThread then
        task.cancel(fruitAuraThread)
        fruitAuraThread = nil
    end
    
    mutationCache = {}
    fruitValueCache = {}
    myFarmPlotsCache = {}
    fruitAuraTimer = 0
    
    fruitAuraConnection = RunService.Heartbeat:Connect(function(deltaTime)
        if not fruitAuraEnabled then
            return
        end
        
        fruitAuraTimer = fruitAuraTimer + deltaTime
        
        if fruitAuraTimer >= fruitAuraDelay then
            fruitAuraTimer = 0
            
            if not isBackpackFull() then
                local myPlots = getMyFarmPlots()
                if #myPlots > 0 then
                    collectFromPlots(myPlots)
                end
            end
        end
    end)
end

function stopFruitAura()
    if fruitAuraConnection then
        fruitAuraConnection:Disconnect()
        fruitAuraConnection = nil
    end
    if fruitAuraThread then
        task.cancel(fruitAuraThread)
        fruitAuraThread = nil
    end
    fruitAuraTimer = 0
end

Tabs.Garden:Section({Title = "Fruit Aura", TextSize = 20})

fruitAuraToggle = Tabs.Garden:Toggle({
    Title = "Enable Fruit Aura",
    Flag = "fruitAuraToggle",
    Value = fruitAuraEnabled,
    Callback = function(state)
        fruitAuraEnabled = state
        if fruitAuraEnabled then
            startFruitAura()
        else
            stopFruitAura()
        end
    end
})

FruitAuraDelay = Tabs.Garden:Slider({
    Title = "Collection Delay",
    Flag = "FruitAuraDelay",
    Step = 0.01,
    Value = { Min = 0.01, Max = 2, Default = fruitAuraDelay },
    Callback = function(value)
        fruitAuraDelay = value
    end
})

fruitAuraRangeSlider = Tabs.Garden:Slider({
    Title = "Aura Range",
    Flag = "FruitAuraRange",
    Step = 0.1,
    Value = { Min = 1, Max = 500, Default = fruitAuraRange },
    Callback = function(value)
        fruitAuraRange = value
    end
})

Tabs.Garden:Slider({
    Title = "Fruit Limit",
    Desc = "Auto-limited by available backpack space",
    Flag = "FruitAuraLimit",
    Step = 1,
    Value = { Min = 1, Max = maxBackpackCapacity, Default = fruitLimit },
    Callback = function(value)
        fruitLimit = value
    end
})

Tabs.Garden:Section({Title = "Fruit Whitelist", TextSize = 16})

FruitDropdown = Tabs.Garden:Dropdown({
    Title = "Fruit Whitelist",
    Values = {"Click refresh to load fruits"},
    Multi = true,
    AllowNone = true,
    SearchBarEnabled = true,
    SearchPlaceholder = "Search fruits...",
    Callback = function(selected)
        fruitWhitelist = selected
        updateWhitelistNormalized()
    end
})

Tabs.Garden:Button({
    Title = "Refresh Fruits",
    Callback = function()
        local crops = GetcropsData()
        if #crops > 0 then
            FruitDropdown:Refresh(crops)
        end
    end
})

Tabs.Garden:Section({Title = "Fruit Blacklist", TextSize = 16})

FruitBlacklistDropdown = Tabs.Garden:Dropdown({
    Title = "Fruit Blacklist",
    Values = {"Click refresh to load fruits"},
    Multi = true,
    AllowNone = true,
    SearchBarEnabled = true,
    SearchPlaceholder = "Search fruits to blacklist...",
    Callback = function(selected)
        fruitBlacklist = selected
        updateWhitelistNormalized()
    end
})

Tabs.Garden:Button({
    Title = "Refresh Fruits",
    Callback = function()
        local crops = GetcropsData()
        if #crops > 0 then
            FruitBlacklistDropdown:Refresh(crops)
        end
    end
})

Tabs.Garden:Section({Title = "Mutation Whitelist", TextSize = 16})

MutationDropdown = Tabs.Garden:Dropdown({
    Title = "Mutation Whitelist",
    Values = {"Click refresh to load mutations"},
    Multi = true,
    AllowNone = true,
    SearchBarEnabled = true,
    SearchPlaceholder = "Search mutations...",
    Callback = function(selected)
        mutationWhitelist = selected
        updateWhitelistNormalized()
    end
})

Tabs.Garden:Button({
    Title = "Refresh Mutations",
    Callback = function()
        local mutations = GetmutationsData()
        if #mutations > 0 then
            MutationDropdown:Refresh(mutations)
        end
    end
})

Tabs.Garden:Section({Title = "Mutation Blacklist", TextSize = 16})

MutationBlacklistDropdown = Tabs.Garden:Dropdown({
    Title = "Mutation Blacklist",
    Values = {"Click refresh to load mutations"},
    Multi = true,
    AllowNone = true,
    SearchBarEnabled = true,
    SearchPlaceholder = "Search mutations to blacklist...",
    Callback = function(selected)
        mutationBlacklist = selected
        updateWhitelistNormalized()
    end
})

Tabs.Garden:Button({
    Title = "Refresh Mutations",
    Callback = function()
        local mutations = GetmutationsData()
        if #mutations > 0 then
            MutationBlacklistDropdown:Refresh(mutations)
        end
    end
})

Tabs.Garden:Toggle({
    Title = "Enable Variant Filter",
    Flag = "VariantFilterToggle",
    Value = variantFilterEnabled,
    Callback = function(state)
        variantFilterEnabled = state
    end
})

Tabs.Garden:Section({Title = "Variant Whitelist", TextSize = 16})

VariantDropdown = Tabs.Garden:Dropdown({
    Title = "Variant Whitelist",
    Values = {"Click refresh to load variants"},
    Multi = true,
    AllowNone = true,
    SearchBarEnabled = true,
    SearchPlaceholder = "Search variants...",
    Callback = function(selected)
        variantWhitelist = selected
        updateWhitelistNormalized()
    end
})

Tabs.Garden:Button({
    Title = "Refresh Variants",
    Callback = function()
        local variants = GetvariantData()
        if #variants > 0 then
            VariantDropdown:Refresh(variants)
        end
    end
})

Tabs.Garden:Section({Title = "Variant Blacklist", TextSize = 16})

VariantBlacklistDropdown = Tabs.Garden:Dropdown({
    Title = "Variant Blacklist",
    Values = {"Click refresh to load variants"},
    Multi = true,
    AllowNone = true,
    SearchBarEnabled = true,
    SearchPlaceholder = "Search variants to blacklist...",
    Callback = function(selected)
        variantBlacklist = selected
        updateWhitelistNormalized()
    end
})

Tabs.Garden:Button({
    Title = "Refresh Variants",
    Callback = function()
        local variants = GetvariantData()
        if #variants > 0 then
            VariantBlacklistDropdown:Refresh(variants)
        end
    end
})

Tabs.Garden:Section({Title = "Weight Filter", TextSize = 16})

Tabs.Garden:Toggle({
    Title = "Enable Weight Filter",
    Flag = "WeightFilterToggle",
    Value = weightFilterEnabled,
    Callback = function(state)
        weightFilterEnabled = state
    end
})

Tabs.Garden:Input({
    Title = "Minimum Weight",
    Flag = "MinWeightInput",
    Type = "Input",
    Placeholder = "Enter minimum weight...",
    Value = tostring(minWeight),
    Callback = function(value)
        local num = tonumber(value)
        if num then
            minWeight = num
        end
    end
})

Tabs.Garden:Input({
    Title = "Maximum Weight",
    Flag = "MaxWeightInput",
    Type = "Input",
    Placeholder = "Enter maximum weight...",
    Value = tostring(maxWeight),
    Callback = function(value)
        local num = tonumber(value)
        if num then
            maxWeight = num
        end
    end
})

Tabs.Garden:Section({Title = "Value Filter", TextSize = 16})

Tabs.Garden:Toggle({
    Title = "Enable Value Filter",
    Flag = "ValueFilterToggle",
    Value = valueFilterEnabled,
    Callback = function(state)
        valueFilterEnabled = state
    end
})

Tabs.Garden:Input({
    Title = "Minimum Value",
    Flag = "MinValueInput",
    Type = "Input",
    Placeholder = "Enter minimum value...",
    Value = tostring(minValue),
    Callback = function(value)
        local num = tonumber(value)
        if num then
            minValue = num
        end
    end
})

Tabs.Garden:Input({
    Title = "Maximum Value",
    Flag = "MaxValueInput",
    Type = "Input",
    Placeholder = "Enter maximum value...",
    Value = tostring(maxValue),
    Callback = function(value)
        local num = tonumber(value)
        if num then
            maxValue = num
        end
    end
})
GameEvents = ReplicatedStorage:WaitForChild("GameEvents")
Remove_Item = GameEvents:WaitForChild("Remove_Item")
DeleteObject = GameEvents:WaitForChild("DeleteObject")
GetFarm = require(ReplicatedStorage.Modules.GetFarm)
treeList = {}
selectedTrees = {}
autoRemoveTreeEnabled = false
autoRemoveTreeDelay = 0.01
treeRemovalThread = nil
fruitList = {}
selectedFruits = {}
autoRemoveFruitEnabled = false
autoRemoveFruitDelay = 0.01
weightFilterEnabled = false
minWeight = 0
maxWeight = 999
mutationWhitelist = {}
fruitRemovalThread = nil
function getMyFarmPlots()
myUsername = LocalPlayer.Name
myPlots = {}
farmFolder = Workspace:FindFirstChild("Farm")
if farmFolder then
for _, plot in pairs(farmFolder:GetChildren()) do
sign = plot:FindFirstChild("Sign")
if sign then
owner = sign:GetAttribute("_owner")
if owner and owner == myUsername then
table.insert(myPlots, plot)
end
end
end
end
return myPlots
end
function scanTrees()
treeList = {}
treeCounts = {}
myPlots = getMyFarmPlots()
for _, plot in pairs(myPlots) do
descendants = plot:GetDescendants()
for i = 1, #descendants do
obj = descendants[i]
if obj:IsA("Model") and obj:FindFirstChild("Grow") then
treeName = obj.Name
treeCounts[treeName] = (treeCounts[treeName] or 0) + 1
end
end
end
for treeName, count in pairs(treeCounts) do
table.insert(treeList, {
Title = treeName .. " (x" .. count .. ")",
TreeName = treeName,
Count = count
})
end
table.sort(treeList, function(a, b) return a.TreeName < b.TreeName end)
return treeList
end
function scanFruits()
fruitList = {}
fruitCounts = {}
myPlots = getMyFarmPlots()
for _, plot in pairs(myPlots) do
descendants = plot:GetDescendants()
for i = 1, #descendants do
obj = descendants[i]
if obj:IsA("Model") then
fruitsFolder = obj:FindFirstChild("Fruits")
if fruitsFolder then
for _, fruit in pairs(fruitsFolder:GetChildren()) do
fruitName = fruit.Name
fruitCounts[fruitName] = (fruitCounts[fruitName] or 0) + 1
end
end
end
end
end
for fruitName, count in pairs(fruitCounts) do
table.insert(fruitList, {
Title = fruitName .. " (x" .. count .. ")",
FruitName = fruitName,
Count = count
})
end
table.sort(fruitList, function(a, b) return a.FruitName < b.FruitName end)
return fruitList
end
function getFruitWeight(fruitObj)
weightAttr = fruitObj:GetAttribute("Weight")
if weightAttr then
return tonumber(weightAttr)
end
weightObj = fruitObj:FindFirstChild("Weight")
if weightObj then
if weightObj:IsA("NumberValue") or weightObj:IsA("IntValue") then
return weightObj.Value
elseif weightObj:IsA("StringValue") then
return tonumber(weightObj.Value)
end
end
parent = fruitObj.Parent
if parent then
parentWeightAttr = parent:GetAttribute("Weight")
if parentWeightAttr then
return tonumber(parentWeightAttr)
end
end
return nil
end
function getFruitMutations(fruitObj)
mutations = {}
for attrName, attrValue in pairs(fruitObj:GetAttributes()) do
if type(attrValue) == "boolean" and attrValue == true then
table.insert(mutations, attrName)
end
end
parent = fruitObj.Parent
if parent then
plant = parent.Parent
if plant and plant:IsA("Model") then
for attrName, attrValue in pairs(plant:GetAttributes()) do
if type(attrValue) == "boolean" and attrValue == true then
table.insert(mutations, attrName)
end
end
end
end
return mutations
end
function shouldRemoveFruit(fruitObj)
fruitName = fruitObj.Name
if #selectedFruits > 0 then
found = false
for _, selectedFruit in pairs(selectedFruits) do
if selectedFruit.FruitName == fruitName then
found = true
break
end
end
if not found then
return false
end
end
if weightFilterEnabled then
weight = getFruitWeight(fruitObj)
if weight then
if weight < minWeight or weight > maxWeight then
return false
end
else
return false
end
end
if #mutationWhitelist > 0 then
mutations = getFruitMutations(fruitObj)
hasMutation = false
for _, mutation in pairs(mutations) do
for _, whitelistedMutation in pairs(mutationWhitelist) do
if mutation:lower() == whitelistedMutation:lower() then
hasMutation = true
break
end
end
if hasMutation then break end
end
if not hasMutation then
return false
end
end
return true
end
function removeSelectedTrees()
myPlots = getMyFarmPlots()
treesRemoved = 0
for _, plot in pairs(myPlots) do
descendants = plot:GetDescendants()
for i = 1, #descendants do
obj = descendants[i]
if obj:IsA("Model") and obj:FindFirstChild("Grow") then
treeName = obj.Name
for _, selectedTree in pairs(selectedTrees) do
if selectedTree.TreeName == treeName then
pcall(function()
Remove_Item:FireServer(obj:FindFirstChildWhichIsA("BasePart") or obj)
end)
treesRemoved = treesRemoved + 1
break
end
end
end
end
end
return treesRemoved
end
function removeSelectedFruits()
myPlots = getMyFarmPlots()
fruitsRemoved = 0
for _, plot in pairs(myPlots) do
descendants = plot:GetDescendants()
for i = 1, #descendants do
obj = descendants[i]
if obj:IsA("Model") then
fruitsFolder = obj:FindFirstChild("Fruits")
if fruitsFolder then
for _, fruit in pairs(fruitsFolder:GetChildren()) do
if shouldRemoveFruit(fruit) then
prompt = fruit:FindFirstChildWhichIsA("ProximityPrompt")
if prompt then
pcall(function()
firesignal(prompt.Triggered)
end)
fruitsRemoved = fruitsRemoved + 1
end
end
end
end
end
end
end
return fruitsRemoved
end
function startAutoTreeRemoval()
if treeRemovalThread then
task.cancel(treeRemovalThread)
treeRemovalThread = nil
end
treeRemovalThread = task.spawn(function()
while autoRemoveTreeEnabled and #selectedTrees > 0 do
removed = removeSelectedTrees()
if removed > 0 then
task.wait(autoRemoveTreeDelay)
else
task.wait(1)
end
end
treeRemovalThread = nil
end)
end
function startAutoFruitRemoval()
if fruitRemovalThread then
task.cancel(fruitRemovalThread)
fruitRemovalThread = nil
end
fruitRemovalThread = task.spawn(function()
while autoRemoveFruitEnabled do
removed = removeSelectedFruits()
if removed > 0 then
task.wait(autoRemoveFruitDelay)
else
task.wait(1)
end
end
fruitRemovalThread = nil
end)
end
function stopAutoTreeRemoval()
if treeRemovalThread then
task.cancel(treeRemovalThread)
treeRemovalThread = nil
end
end
function stopAutoFruitRemoval()
if fruitRemovalThread then
task.cancel(fruitRemovalThread)
fruitRemovalThread = nil
end
end
Tabs.Garden:Section({Title = "Remove Tree", TextSize = 20})
treeDropdown = Tabs.Garden:Dropdown({
Title = "Tree List",
Values = {"Click refresh to load trees"},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
SearchPlaceholder = "Search trees...",
Callback = function(selected)
selectedTrees = selected
end
})
Tabs.Garden:Button({
Title = "Refresh Tree List",
Callback = function()
trees = scanTrees()
treeDropdown:Refresh(trees)
end
})
Tabs.Garden:Button({
Title = "Remove Random Selected Tree",
Callback = function()
removeSelectedTrees()
end
})
Tabs.Garden:Toggle({
Title = "Auto Remove Tree",
Flag = "AutoRemoveTree",
Value = autoRemoveTreeEnabled,
Callback = function(state)
autoRemoveTreeEnabled = state
if autoRemoveTreeEnabled then
startAutoTreeRemoval()
else
stopAutoTreeRemoval()
end
end
})
Tabs.Garden:Slider({
Title = "Auto Remove Delay",
Flag = "AutoRemoveTreeDelay",
Step = 0.01,
Value = { Min = 0.01, Max = 5, Default = autoRemoveTreeDelay },
Callback = function(value)
autoRemoveTreeDelay = value
if autoRemoveTreeEnabled and treeRemovalThread then
stopAutoTreeRemoval()
startAutoTreeRemoval()
end
end
})
Tabs.Garden:Section({Title = "Remove Fruit", TextSize = 20})
fruitDropdown = Tabs.Garden:Dropdown({
Title = "Fruit List",
Values = {"Click refresh to load fruits"},
Multi = true,
AllowNone = true,
SearchPlaceholder = "Search fruits...",
Callback = function(selected)
selectedFruits = selected
end
})
Tabs.Garden:Button({
Title = "Refresh Fruit List",
Callback = function()
fruits = scanFruits()
fruitDropdown:Refresh(fruits)
end
})
Tabs.Garden:Button({
Title = "Remove All Selected Fruit",
Callback = function()
removeSelectedFruits()
end
})
Tabs.Garden:Toggle({
Title = "Weight Selecting",
Flag = "WeightFilter",
Value = weightFilterEnabled,
Callback = function(state)
weightFilterEnabled = state
end
})
Tabs.Garden:Input({
Title = "Minimum Weight",
Flag = "MinWeight",
Type = "Input",
Placeholder = "0",
Value = tostring(minWeight),
Callback = function(value)
num = tonumber(value)
if num then
minWeight = num
end
end
})
Tabs.Garden:Input({
Title = "Max Weight",
Flag = "MaxWeight",
Type = "Input",
Placeholder = "999",
Value = tostring(maxWeight),
Callback = function(value)
num = tonumber(value)
if num then
maxWeight = num
end
end
})
mutationDropdown = Tabs.Garden:Dropdown({
Title = "Mutations Whitelist",
Values = {"Click refresh to load mutations"},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
SearchPlaceholder = "Search mutations...",
Callback = function(selected)
mutationWhitelist = selected
end
})
Tabs.Garden:Button({
Title = "Refresh Mutations",
Callback = function()
mutations = GetmutationsData()
if #mutations > 0 then
mutationDropdown:Refresh(mutations)
end
end
})
Tabs.Garden:Toggle({
Title = "Auto Remove Fruit",
Flag = "AutoRemoveFruit",
Value = autoRemoveFruitEnabled,
Callback = function(state)
autoRemoveFruitEnabled = state
if autoRemoveFruitEnabled then
startAutoFruitRemoval()
else
stopAutoFruitRemoval()
end
end
})
Tabs.Garden:Slider({
Title = "Auto Remove Delay",
Flag = "AutoRemoveFruitDelay",
Step = 0.01,
Value = { Min = 0.01, Max = 5, Default = autoRemoveFruitDelay },
Callback = function(value)
autoRemoveFruitDelay = value
if autoRemoveFruitEnabled and fruitRemovalThread then
stopAutoFruitRemoval()
startAutoFruitRemoval()
end
end
})
Tabs.Garden:Section({Title = "Move Tree", TextSize = 20})
MoveTree_RefreshButton = Tabs.Garden:Button({
Title = "Refresh Trees",
Callback = function()
MoveTree_TreeList = {}
MoveTree_TreeCounts = {}
MoveTree_MyPlots = {}
MoveTree_FarmFolder = workspace:FindFirstChild("Farm")
MoveTree_MyUsername = Players.LocalPlayer.Name
if MoveTree_FarmFolder then
for _, MoveTree_Plot in pairs(MoveTree_FarmFolder:GetChildren()) do
MoveTree_Sign = MoveTree_Plot:FindFirstChild("Sign")
if MoveTree_Sign then
MoveTree_Owner = MoveTree_Sign:GetAttribute("_owner")
if MoveTree_Owner and MoveTree_Owner == MoveTree_MyUsername then
table.insert(MoveTree_MyPlots, MoveTree_Plot)
end
end
end
for _, MoveTree_Plot in pairs(MoveTree_MyPlots) do
MoveTree_Descendants = MoveTree_Plot:GetDescendants()
for _, MoveTree_Obj in pairs(MoveTree_Descendants) do
if MoveTree_Obj:IsA("Model") and MoveTree_Obj:FindFirstChild("Grow") then
MoveTree_TreeName = MoveTree_Obj.Name
MoveTree_TreeCounts[MoveTree_TreeName] = (MoveTree_TreeCounts[MoveTree_TreeName] or 0) + 1
end
end
end
for MoveTree_TreeName, MoveTree_Count in pairs(MoveTree_TreeCounts) do
table.insert(MoveTree_TreeList, {
Title = MoveTree_TreeName .. " (x" .. MoveTree_Count .. ")",
TreeName = MoveTree_TreeName,
Count = MoveTree_Count
})
end
table.sort(MoveTree_TreeList, function(MoveTree_A, MoveTree_B) 
return MoveTree_A.TreeName < MoveTree_B.TreeName 
end)
end
MoveTree_TreeDropdown:Refresh(MoveTree_TreeList)
end
})
MoveTree_TreeDropdown = Tabs.Garden:Dropdown({
Title = "Tree List",
Values = {},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(MoveTree_Selected)
MoveTree_SelectedTrees = MoveTree_Selected
end
})
MoveTree_SavePositionButton = Tabs.Garden:Button({
Title = "Save Position",
Callback = function()
MoveTree_Character = Players.LocalPlayer.Character
if MoveTree_Character then
MoveTree_RootPart = MoveTree_Character:FindFirstChild("HumanoidRootPart")
if MoveTree_RootPart then
MoveTree_SavedPos = MoveTree_RootPart.Position
end
end
end
})
MoveTree_ClearPositionButton = Tabs.Garden:Button({
Title = "Clear Position",
Callback = function()
MoveTree_SavedPos = nil
end
})
MoveTree_MoveAllButton = Tabs.Garden:Button({
Title = "Move All Selected",
Callback = function()
MoveTree_MyUsername = Players.LocalPlayer.Name
MoveTree_FarmFolder = workspace:FindFirstChild("Farm")
MoveTree_MyPlots = {}
MoveTree_TargetPos = MoveTree_SavedPos or Vector3.new(0,0,0)
MoveTree_Mode = MoveTree_ModeValue or "Random"
if MoveTree_FarmFolder then
for _, MoveTree_Plot in pairs(MoveTree_FarmFolder:GetChildren()) do
MoveTree_Sign = MoveTree_Plot:FindFirstChild("Sign")
if MoveTree_Sign then
MoveTree_Owner = MoveTree_Sign:GetAttribute("_owner")
if MoveTree_Owner and MoveTree_Owner == MoveTree_MyUsername then
table.insert(MoveTree_MyPlots, MoveTree_Plot)
end
end
end
end
if MoveTree_Mode == "Under LocalPlayer" then
MoveTree_Character = Players.LocalPlayer.Character
if MoveTree_Character then
MoveTree_RootPart = MoveTree_Character:FindFirstChild("HumanoidRootPart")
if MoveTree_RootPart then
MoveTree_TargetPos = MoveTree_RootPart.Position + Vector3.new(0, -2, 0)
end
end
elseif MoveTree_Mode == "Random" then
MoveTree_Character = Players.LocalPlayer.Character
if MoveTree_Character then
MoveTree_RootPart = MoveTree_Character:FindFirstChild("HumanoidRootPart")
if MoveTree_RootPart then
MoveTree_BasePos = MoveTree_RootPart.Position
MoveTree_TargetPos = MoveTree_BasePos + Vector3.new(math.random(-10, 10), -2, math.random(-10, 10))
end
end
end
for _, MoveTree_Plot in pairs(MoveTree_MyPlots) do
MoveTree_Important = MoveTree_Plot:FindFirstChild("Important")
if MoveTree_Important then
MoveTree_PlantsPhysical = MoveTree_Important:FindFirstChild("Plants_Physical")
if MoveTree_PlantsPhysical then
for _, MoveTree_Plant in pairs(MoveTree_PlantsPhysical:GetChildren()) do
if MoveTree_Plant:IsA("Model") and MoveTree_Plant:FindFirstChild("Grow") then
MoveTree_PlantName = MoveTree_Plant.Name
for _, MoveTree_Selected in pairs(MoveTree_SelectedTrees or {}) do
if MoveTree_Selected.TreeName == MoveTree_PlantName then
MoveTree_Trowel = Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
if MoveTree_Trowel and MoveTree_Trowel.Name:match("Trowel") then
MoveTree_Remote = ReplicatedStorage.GameEvents.TrowelRemote
MoveTree_Success = pcall(function()
MoveTree_Remote:InvokeServer("Pickup", MoveTree_Trowel, MoveTree_Plant)
end)
task.wait(0.1)
MoveTree_Success = pcall(function()
MoveTree_Remote:InvokeServer("Place", MoveTree_Trowel, MoveTree_Plant, CFrame.new(MoveTree_TargetPos))
end)
end
break
end
end
end
end
end
end
end
end
})
MoveTree_MoveRandomButton = Tabs.Garden:Button({
Title = "Move Random Selected",
Callback = function()
MoveTree_MyUsername = Players.LocalPlayer.Name
MoveTree_FarmFolder = workspace:FindFirstChild("Farm")
MoveTree_MyPlots = {}
MoveTree_TargetPos = MoveTree_SavedPos or Vector3.new(0,0,0)
MoveTree_Mode = MoveTree_ModeValue or "Random"
if MoveTree_FarmFolder then
for _, MoveTree_Plot in pairs(MoveTree_FarmFolder:GetChildren()) do
MoveTree_Sign = MoveTree_Plot:FindFirstChild("Sign")
if MoveTree_Sign then
MoveTree_Owner = MoveTree_Sign:GetAttribute("_owner")
if MoveTree_Owner and MoveTree_Owner == MoveTree_MyUsername then
table.insert(MoveTree_MyPlots, MoveTree_Plot)
end
end
end
end
if MoveTree_Mode == "Under LocalPlayer" then
MoveTree_Character = Players.LocalPlayer.Character
if MoveTree_Character then
MoveTree_RootPart = MoveTree_Character:FindFirstChild("HumanoidRootPart")
if MoveTree_RootPart then
MoveTree_TargetPos = MoveTree_RootPart.Position + Vector3.new(0, -2, 0)
end
end
elseif MoveTree_Mode == "Random" then
MoveTree_Character = Players.LocalPlayer.Character
if MoveTree_Character then
MoveTree_RootPart = MoveTree_Character:FindFirstChild("HumanoidRootPart")
if MoveTree_RootPart then
MoveTree_BasePos = MoveTree_RootPart.Position
MoveTree_TargetPos = MoveTree_BasePos + Vector3.new(math.random(-10, 10), -2, math.random(-10, 10))
end
end
end
MoveTree_RandomPlants = {}
for _, MoveTree_Plot in pairs(MoveTree_MyPlots) do
MoveTree_Important = MoveTree_Plot:FindFirstChild("Important")
if MoveTree_Important then
MoveTree_PlantsPhysical = MoveTree_Important:FindFirstChild("Plants_Physical")
if MoveTree_PlantsPhysical then
for _, MoveTree_Plant in pairs(MoveTree_PlantsPhysical:GetChildren()) do
if MoveTree_Plant:IsA("Model") and MoveTree_Plant:FindFirstChild("Grow") then
MoveTree_PlantName = MoveTree_Plant.Name
for _, MoveTree_Selected in pairs(MoveTree_SelectedTrees or {}) do
if MoveTree_Selected.TreeName == MoveTree_PlantName then
table.insert(MoveTree_RandomPlants, MoveTree_Plant)
break
end
end
end
end
end
end
end
if #MoveTree_RandomPlants > 0 then
MoveTree_RandomIndex = math.random(1, #MoveTree_RandomPlants)
MoveTree_RandomPlant = MoveTree_RandomPlants[MoveTree_RandomIndex]
MoveTree_Trowel = Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
if MoveTree_Trowel and MoveTree_Trowel.Name:match("Trowel") then
MoveTree_Remote = ReplicatedStorage.GameEvents.TrowelRemote
MoveTree_Success = pcall(function()
MoveTree_Remote:InvokeServer("Pickup", MoveTree_Trowel, MoveTree_RandomPlant)
end)
task.wait(0.1)
MoveTree_Success = pcall(function()
MoveTree_Remote:InvokeServer("Place", MoveTree_Trowel, MoveTree_RandomPlant, CFrame.new(MoveTree_TargetPos))
end)
end
end
end
})
MoveTree_ModeDropdown = Tabs.Garden:Dropdown({
Title = "Select Mode",
Values = {
{Title = "Random", Icon = "shuffle", Value = "Random"},
{Title = "Under LocalPlayer", Icon = "user", Value = "Under LocalPlayer"},
{Title = "Saved Position", Icon = "save", Value = "Saved Position"}
},
Value = {Title = "Random", Icon = "shuffle", Value = "Random"},
Callback = function(MoveTree_Option)
MoveTree_ModeValue = MoveTree_Option.Value
end
})
Tabs.Pet:Section({ Title = "Pet", TextSize = 20 })
ActivePetsService = require(ReplicatedStorage.Modules.PetServices.ActivePetsService)
PetUtilities = require(ReplicatedStorage.Modules.PetServices.PetUtilities)
DataService = require(ReplicatedStorage.Modules.DataService)
PetRegistry = require(ReplicatedStorage.Data.PetRegistry)
GearData = require(ReplicatedStorage.Data.GearData)
PetBoostRegistry = require(ReplicatedStorage.Data.PetRegistry.PetBoostRegistry)
SeedData = require(ReplicatedStorage.Data.SeedData)
MutationHandler = require(ReplicatedStorage.Modules.MutationHandler)
CalculatePlantValue = require(ReplicatedStorage.Modules.CalculatePlantValue)
FoodRecipeData = require(ReplicatedStorage.Data.FoodRecipeData)
function isItemFavorited(item)
if item:GetAttribute("Favorite") then
return true
end
local backpackGui = LocalPlayer.PlayerGui:FindFirstChild("BackpackGui")
if backpackGui then
local backpackFrame = backpackGui:FindFirstChild("Backpack")
if backpackFrame then
local hotbar = backpackFrame:FindFirstChild("Hotbar")
if hotbar then
for _, slot in pairs(hotbar:GetChildren()) do
if slot:IsA("TextButton") then
local favIcon = slot:FindFirstChild("FavIcon")
if favIcon and favIcon.Visible then
local toolName = slot:FindFirstChild("ToolName")
if toolName and toolName.Text == item.Name then
return true
end
end
end
end
end
local inventory = backpackFrame:FindFirstChild("Inventory")
if inventory then
local scrollingFrame = inventory:FindFirstChild("ScrollingFrame")
if scrollingFrame then
local gridFrame = scrollingFrame:FindFirstChild("UIGridFrame")
if gridFrame then
for _, slot in pairs(gridFrame:GetChildren()) do
if slot:IsA("TextButton") then
local favIcon = slot:FindFirstChild("FavIcon")
if favIcon and favIcon.Visible then
local toolName = slot:FindFirstChild("ToolName")
if toolName and toolName.Text == item.Name then
return true
end
end
end
end
end
end
end
end
end
return false
end
function getActivePets()
playerData = DataService:GetData()
if not playerData or not playerData.PetsData then return {} end
equippedPets = playerData.PetsData.EquippedPets or {}
pets = {}
for _, petUUID in pairs(equippedPets) do
pet = PetUtilities:GetPetByUUID(LocalPlayer, petUUID)
if pet then
table.insert(pets, pet)
end
end
return pets
end
function getPhysicalPetsInGarden()
petsPhysical = workspace:FindFirstChild("PetsPhysical")
if not petsPhysical then return {} end
petsInGarden = {}
for _, petMover in pairs(petsPhysical:GetChildren()) do
if petMover:IsA("BasePart") and petMover:GetAttribute("UUID") then
petModel = petMover:FindFirstChildWhichIsA("Model")
if petModel and petModel:FindFirstChild("PrimaryPart") then
petOwner = petMover:GetAttribute("OWNER")
if petOwner == LocalPlayer.Name then
table.insert(petsInGarden, {
mover = petMover,
model = petModel,
uuid = petMover:GetAttribute("UUID")
})
end
end
end
end
return petsInGarden
end
function getPetDisplayInfo(pet)
petData = pet.PetData
petType = pet.PetType
petInfo = PetRegistry.PetList[petType]
mutation = petData.MutationType or "None"
level = petData.Level or "1"
weight = PetUtilities:CalculateWeight(petData.BaseWeight or 1, petData.Level or 1)
name = petData.Name or "Unnamed"
hunger = (petData.Hunger or 0) / (petInfo.DefaultHunger or 1) * 100
xpCost = PetUtilities:GetCurrentLevelXPCost(petData.Level)
xpProgress = 0
if xpCost and xpCost > 0 then
xpProgress = (petData.LevelProgress or 0) / xpCost * 100
end
boosts = {}
if petData.Boosts and type(petData.Boosts) == "table" then
for _, boost in pairs(petData.Boosts) do
if type(boost) == "table" and boost.Time and boost.Time > 0 then
minutes = math.floor(boost.Time / 60)
seconds = boost.Time % 60
table.insert(boosts, string.format("%s: %dm %ds", boost.BoostType or "Unknown", minutes, seconds))
end
end
end
boostsText = #boosts > 0 and table.concat(boosts, ", ") or "None"
cooldowns = ActivePetsService:GetClientPetStateUUID(LocalPlayer.Name, pet.UUID)
cooldownText = "None"
if type(cooldowns) == "table" then
activeCooldowns = {}
for i, cooldown in pairs(cooldowns) do
if type(cooldown) == "table" and cooldown.Time and cooldown.Time > 0 then
minutes = math.floor(cooldown.Time / 60)
seconds = cooldown.Time % 60
table.insert(activeCooldowns, string.format("%s: %dm %ds", cooldown.Passive or "Ability", minutes, seconds))
end
end
if #activeCooldowns > 0 then
cooldownText = table.concat(activeCooldowns, ", ")
end
end
movementType = petInfo and petInfo.MovementType or "Unknown"
scale = petInfo and petInfo.ModelScalePerLevel or 0
variant = petInfo and petInfo.Variant or "None"
icon = petInfo and petInfo.Icon or ""
ageWarning = ""
if tonumber(level) >= 100 then
ageWarning = " [MAX LEVEL]"
end
displayText = string.format("Name: %s | Level: %s%s | Weight: %.1f KG\nHunger: %.1f%% | XP: %.1f%% | Mutation: %s\nMovement: %s | Scale: %.2f | Variant: %s\nBoosts: %s | Cooldowns: %s", 
name, level, ageWarning, weight, hunger, xpProgress, mutation, movementType, scale, variant, boostsText, cooldownText)
return {
Title = petType .. ageWarning,
Desc = displayText,
Icon = icon,
Value = pet.UUID,
Data = {
UUID = pet.UUID,
Type = petType,
Name = name,
Level = tonumber(level),
Weight = weight,
Hunger = hunger,
XP = xpProgress,
Mutation = mutation,
MovementType = movementType,
Scale = scale,
Variant = variant,
Boosts = boostsText,
Cooldowns = cooldownText,
Icon = icon
}
}
end
function getAllPets()
allPets = {}
equippedPets = getActivePets()
for _, pet in pairs(equippedPets) do
table.insert(allPets, pet)
end
physicalPets = getPhysicalPetsInGarden()
for _, physicalPet in pairs(physicalPets) do
petData = PetUtilities:GetPetByUUID(LocalPlayer, physicalPet.uuid)
if petData then
table.insert(allPets, petData)
end
end
uniquePets = {}
seenUUIDs = {}
for _, pet in pairs(allPets) do
if not seenUUIDs[pet.UUID] then
seenUUIDs[pet.UUID] = true
table.insert(uniquePets, pet)
end
end
return uniquePets
end
function refreshPetDropdown()
if not boostPetDropdown then return end
pets = getAllPets()
dropdownItems = {}
for _, pet in pairs(pets) do
item = getPetDisplayInfo(pet)
table.insert(dropdownItems, item)
end
if #dropdownItems > 0 then
boostPetDropdown:Refresh(dropdownItems, selectedBoostPetUUIDs)
feedPetDropdown:Refresh(dropdownItems, selectedFeedPetUUIDs)
else
boostPetDropdown:Refresh({{Title = "No Pets Found", Icon = "paw-print", Desc = "No pets in garden", Value = ""}}, {})
feedPetDropdown:Refresh({{Title = "No Pets Found", Icon = "paw-print", Desc = "No pets in garden", Value = ""}}, {})
end
end
function getBoostItems()
boostItems = {}
petBoosts = ReplicatedStorage:FindFirstChild("Assets") and ReplicatedStorage.Assets:FindFirstChild("Models") and ReplicatedStorage.Assets.Models:FindFirstChild("PetBoosts")
if petBoosts then
for _, item in pairs(petBoosts:GetChildren()) do
if item:IsA("Model") then
gearInfo = GearData[item.Name]
icon = gearInfo and gearInfo.Asset or ""
boostType = PetBoostRegistry.PetModelNameToBoostType[item.Name]
boostData = boostType and PetBoostRegistry.BoostTypeStatData[boostType]
table.insert(boostItems, {
Title = item.Name,
Icon = icon,
Desc = gearInfo and gearInfo.GearDescription or ("Boost Type: " .. (boostType or "Unknown")),
Value = item.Name,
Data = {
Name = item.Name,
Icon = icon,
Description = gearInfo and gearInfo.GearDescription or "",
Rarity = gearInfo and gearInfo.GearRarity or "Unknown",
BoostType = boostType,
BoostData = boostData
}
})
end
end
end
petShards = ReplicatedStorage:FindFirstChild("Assets") and ReplicatedStorage.Assets:FindFirstChild("Models") and ReplicatedStorage.Assets.Models:FindFirstChild("PetShards")
if petShards then
for _, item in pairs(petShards:GetChildren()) do
if item:IsA("Model") then
gearInfo = GearData[item.Name]
icon = gearInfo and gearInfo.Asset or ""
boostType = PetBoostRegistry.PetModelNameToBoostType[item.Name]
boostData = boostType and PetBoostRegistry.BoostTypeStatData[boostType]
table.insert(boostItems, {
Title = item.Name,
Icon = icon,
Desc = gearInfo and gearInfo.GearDescription or ("Boost Type: " .. (boostType or "Unknown")),
Value = item.Name,
Data = {
Name = item.Name,
Icon = icon,
Description = gearInfo and gearInfo.GearDescription or "",
Rarity = gearInfo and gearInfo.GearRarity or "Unknown",
BoostType = boostType,
BoostData = boostData
}
})
end
end
end
return boostItems
end
function getFeedFruits()
feedFruits = {}
for fruitName, fruitInfo in pairs(SeedData) do
cleanName = fruitInfo.SeedName or fruitName
cleanName = cleanName:gsub("%s*[Ss]eed%s*", "")
cleanName = cleanName:gsub("%s+", " ")
cleanName = cleanName:gsub("^%s*(.-)%s*$", "%1")
table.insert(feedFruits, {
Title = cleanName,
Desc = "Rarity: " .. (fruitInfo.SeedRarity or "Unknown"),
Icon = fruitInfo.FruitIcon or fruitInfo.Asset or "",
Value = fruitName,
Data = {
Name = fruitName,
DisplayName = cleanName,
Rarity = fruitInfo.SeedRarity or "Unknown"
}
})
end
table.sort(feedFruits, function(a, b) return a.Title < b.Title end)
return feedFruits
end
function getFeedFoods()
feedFoods = {}
for foodName, foodInfo in pairs(FoodRecipeData.Recipes) do
table.insert(feedFoods, {
Title = foodName,
Desc = string.format("Weight: %.1f | Time: %ds", foodInfo.BaseWeight or 0, foodInfo.BaseTime or 0),
Icon = foodInfo.ImageId or "",
Value = foodName,
Data = {
Name = foodName,
DisplayName = foodName,
Weight = foodInfo.BaseWeight or 0,
Time = foodInfo.BaseTime or 0,
Icon = foodInfo.ImageId or ""
}
})
end
table.sort(feedFoods, function(a, b) return a.Title < b.Title end)
return feedFoods
end
function getFeedMutations()
feedMutations = {}
mutationData = MutationHandler:GetMutations()
for _, mutation in pairs(mutationData) do
if mutation.Name then
table.insert(feedMutations, mutation.Name)
end
end
table.sort(feedMutations)
return feedMutations
end
function getFeedVariants()
variantEnums = require(ReplicatedStorage.Data.EnumRegistry.VariantsEnums)
feedVariants = {}
if type(variantEnums) == "table" then
for variantName, _ in pairs(variantEnums) do
if type(variantName) == "string" then
table.insert(feedVariants, variantName)
end
end
end
table.sort(feedVariants)
return feedVariants
end
function matchesBoostItemName(toolName, itemName)
toolNameLower = string.lower(toolName)
itemNameLower = string.lower(itemName)
local patterns = {
"^" .. itemNameLower,
itemNameLower .. "$",
"^" .. itemNameLower .. " [xX%d]+",
"^" .. itemNameLower .. " [bB][oO][oO][sS][tT]%d*",
"^[hH][iI] " .. itemNameLower,
"^[hH][iI] " .. itemNameLower .. " [xX%d]+",
"^[hH][iI] " .. itemNameLower .. " [bB][oO][oO][sS][tT]%d*",
"^" .. itemNameLower .. " [bB][oO][oO][sS][tT]%d* [xX%d]+$",
itemNameLower .. " [xX%d]+$",
itemNameLower .. " [bB][oO][oO][sS][tT]%d*$",
".*" .. itemNameLower .. ".*"
}
for _, pattern in ipairs(patterns) do
if string.match(toolNameLower, pattern) then
return true
end
end
local words = {}
for word in string.gmatch(toolNameLower, "[%w]+") do
table.insert(words, word)
end
local searchWords = {}
for word in string.gmatch(itemNameLower, "[%w]+") do
table.insert(searchWords, word)
end
local matchCount = 0
for _, searchWord in ipairs(searchWords) do
for _, toolWord in ipairs(words) do
if toolWord == searchWord or string.find(toolWord, searchWord) or string.find(searchWord, toolWord) then
matchCount = matchCount + 1
break
end
end
end
if #searchWords > 0 and matchCount >= #searchWords then
return true
end
return false
end
function findAllBoostItems(itemName)
local items = {}
if Backpack then
for _, tool in pairs(Backpack:GetChildren()) do
if tool:IsA("Tool") and matchesBoostItemName(tool.Name, itemName) and not isItemFavorited(tool) then
table.insert(items, tool)
end
end
end
if Character then
for _, tool in pairs(Character:GetChildren()) do
if tool:IsA("Tool") and matchesBoostItemName(tool.Name, itemName) and not isItemFavorited(tool) then
table.insert(items, tool)
end
end
end
return items
end
function getBoostDelay(boostItemName)
boostType = PetBoostRegistry.PetModelNameToBoostType[boostItemName]
if boostType and PetBoostRegistry.BoostTypeStatData[boostType] then
boostData = PetBoostRegistry.BoostTypeStatData[boostType]
if boostData.Time then
for size, delay in pairs(boostData.Time) do
if string.find(string.lower(boostItemName), string.lower(size)) then
return delay
end
end
return 60
end
end
return 60
end
boostCooldowns = {}
function canApplyBoost(petUUID, boostItemName)
local key = petUUID .. "_" .. boostItemName
local lastApply = boostCooldowns[key]
local delay = getBoostDelay(boostItemName)
if not lastApply then
return true
end
return (tick() - lastApply) >= delay
end
function recordBoostApply(petUUID, boostItemName)
local key = petUUID .. "_" .. boostItemName
boostCooldowns[key] = tick()
end
function equipAndUseBoostItem(item, petUUID, boostItemName)
if not Humanoid then return false end
if not canApplyBoost(petUUID, boostItemName) then
return false
end
if item.Parent == LocalPlayer.Backpack then
item.Parent = Character
Humanoid:EquipTool(item)
else
Humanoid:EquipTool(item)
end
task.wait(0.1)
ReplicatedStorage.GameEvents.PetBoostService:FireServer("ApplyBoost", petUUID)
recordBoostApply(petUUID, boostItemName)
return true
end
function getFeedFruitMutations(item)
mutations = {}
for attrName, attrValue in pairs(item:GetAttributes()) do
if type(attrValue) == "boolean" and attrValue == true then
table.insert(mutations, attrName)
end
end
return mutations
end
function getFeedFruitVariant(item)
variant = item:FindFirstChild("Variant")
if variant and variant:IsA("StringValue") and variant.Value ~= "" then
return variant.Value
end
variantAttr = item:GetAttribute("Variant")
if variantAttr and variantAttr ~= "" then
return tostring(variantAttr)
end
return nil
end
function getFeedFruitWeight(item)
weightAttr = item:GetAttribute("Weight")
if weightAttr then
return tonumber(weightAttr)
end
weightObj = item:FindFirstChild("Weight")
if weightObj then
if weightObj:IsA("NumberValue") or weightObj:IsA("IntValue") then
return weightObj.Value
elseif weightObj:IsA("StringValue") then
return tonumber(weightObj.Value)
end
end
return nil
end
function getFeedFruitValue(fruitObj)
success, value = pcall(function()
return CalculatePlantValue(fruitObj)
end)
if success and value and type(value) == "number" and value > 0 then
return value
end
return 0
end
function getFeedFoodWeight(foodObj)
weightAttr = foodObj:GetAttribute("Weight")
if weightAttr then
return tonumber(weightAttr)
end
return 0
end
function getFeedFoodScale(foodObj)
scaleAttr = foodObj:GetAttribute("Scale")
if scaleAttr then
return tonumber(scaleAttr)
end
return 0
end
function isFoodItem(item)
if item:GetAttribute("ItemType") == "Food" then
return true
end
for foodName in pairs(FoodRecipeData.Recipes) do
if string.find(string.lower(item.Name), string.lower(foodName)) then
return true
end
end
return false
end
selectedBoostPetUUIDs = {}
autoBoostEnabled = false
autoBoostThread = nil
selectedBoostItems = {}
levelupTargetAge = 100
selectedFeedPetUUIDs = {}
autoFeedEnabled = false
autoFeedThread = nil
feedFruitWhitelist = {}
feedFruitMutationWhitelist = {}
feedFruitVariantWhitelist = {}
feedFruitWhitelistNormalized = {}
feedFruitMutationWhitelistNormalized = {}
feedFruitVariantWhitelistNormalized = {}
feedFruitWeightFilterEnabled = false
feedFruitMinWeight = 0
feedFruitMaxWeight = 999999
feedFruitValueFilterEnabled = false
feedFruitMinValue = 0
feedFruitMaxValue = 999999999
feedFruitNameFilterEnabled = false
feedFruitMutationFilterEnabled = false
feedFruitVariantFilterEnabled = false
feedFruitIncluded = true
feedFoodEnabled = false
feedFoodWhitelist = {}
feedFoodWhitelistNormalized = {}
feedFoodWeightFilterEnabled = false
feedFoodMinWeight = 0
feedFoodMaxWeight = 999999
feedFoodScaleFilterEnabled = false
feedFoodMinScale = 0
feedFoodMaxScale = 999999
feedFoodNameFilterEnabled = false
feedEquipFruits = {}
feedEquipFoods = {}
feedEquipType = "Equip All"
function updateFeedFruitWhitelistNormalized()
feedFruitWhitelistNormalized = {}
for _, fruitData in pairs(feedFruitWhitelist) do
fruitName = fruitData.Title or fruitData
if type(fruitName) == "string" then
feedFruitWhitelistNormalized[fruitName:lower()] = true
end
end
end
function updateFeedFruitMutationWhitelistNormalized()
feedFruitMutationWhitelistNormalized = {}
for _, mutationData in pairs(feedFruitMutationWhitelist) do
mutationName = mutationData.Title or mutationData
if type(mutationName) == "string" then
feedFruitMutationWhitelistNormalized[mutationName:lower()] = true
end
end
end
function updateFeedFruitVariantWhitelistNormalized()
feedFruitVariantWhitelistNormalized = {}
for _, variantData in pairs(feedFruitVariantWhitelist) do
variantName = variantData.Title or variantData
if type(variantName) == "string" then
feedFruitVariantWhitelistNormalized[variantName:lower()] = true
end
end
end
function updateFeedFoodWhitelistNormalized()
feedFoodWhitelistNormalized = {}
for _, foodData in pairs(feedFoodWhitelist) do
foodName = foodData.Title or foodData
if type(foodName) == "string" then
feedFoodWhitelistNormalized[foodName:lower()] = true
end
end
end
function shouldEquipFruit(fruitObj)
if not feedFruitIncluded then
return false
end
fruitName = fruitObj.Name:lower()
if feedFruitNameFilterEnabled and #feedFruitWhitelist > 0 then
found = false
for whitelistName, _ in pairs(feedFruitWhitelistNormalized) do
if string.find(fruitName, whitelistName) then
found = true
break
end
end
if not found then return false end
end
if feedFruitMutationFilterEnabled and #feedFruitMutationWhitelist > 0 then
mutations = getFeedFruitMutations(fruitObj)
hasMutation = false
for _, mutation in ipairs(mutations) do
if feedFruitMutationWhitelistNormalized[mutation:lower()] then
hasMutation = true
break
end
end
if not hasMutation then return false end
end
if feedFruitVariantFilterEnabled and #feedFruitVariantWhitelist > 0 then
variant = getFeedFruitVariant(fruitObj)
if not variant or not feedFruitVariantWhitelistNormalized[variant:lower()] then
return false
end
end
if feedFruitWeightFilterEnabled then
weight = getFeedFruitWeight(fruitObj)
if weight then
if weight < feedFruitMinWeight or weight > feedFruitMaxWeight then
return false
end
else
return false
end
end
if feedFruitValueFilterEnabled then
value = getFeedFruitValue(fruitObj)
if value < feedFruitMinValue or value > feedFruitMaxValue then
return false
end
end
return true
end
function shouldEquipFood(foodObj)
if not isFoodItem(foodObj) then
return false
end
foodName = foodObj.Name:lower()
if feedFoodNameFilterEnabled and #feedFoodWhitelist > 0 then
found = false
for whitelistName, _ in pairs(feedFoodWhitelistNormalized) do
if string.find(foodName, whitelistName) then
found = true
break
end
end
if not found then return false end
end
if feedFoodWeightFilterEnabled then
weight = getFeedFoodWeight(foodObj)
if weight then
if weight < feedFoodMinWeight or weight > feedFoodMaxWeight then
return false
end
else
return false
end
end
if feedFoodScaleFilterEnabled then
scale = getFeedFoodScale(foodObj)
if scale then
if scale < feedFoodMinScale or scale > feedFoodMaxScale then
return false
end
else
return false
end
end
return true
end
function updateFeedEquipLists()
feedEquipFruits = {}
feedEquipFoods = {}
if Backpack then
for _, tool in pairs(Backpack:GetChildren()) do
if tool:IsA("Tool") and not isItemFavorited(tool) then
if tool:FindFirstChild("Item_Seed") and shouldEquipFruit(tool) then
table.insert(feedEquipFruits, tool)
elseif feedFoodEnabled and shouldEquipFood(tool) then
table.insert(feedEquipFoods, tool)
end
end
end
end
if Character then
for _, tool in pairs(Character:GetChildren()) do
if tool:IsA("Tool") and not isItemFavorited(tool) then
if tool:FindFirstChild("Item_Seed") and shouldEquipFruit(tool) then
table.insert(feedEquipFruits, tool)
elseif feedFoodEnabled and shouldEquipFood(tool) then
table.insert(feedEquipFoods, tool)
end
end
end
end
end
function equipFeedItems()
if feedEquipType == "Equip All" then
for _, tool in pairs(feedEquipFruits) do
if tool and tool.Parent ~= Character then
tool.Parent = Character
end
end
for _, tool in pairs(feedEquipFoods) do
if tool and tool.Parent ~= Character then
tool.Parent = Character
end
end
elseif feedEquipType == "Equip 1 By 1" then
if #feedEquipFruits > 0 then
local tool = feedEquipFruits[1]
if tool and tool.Parent ~= Character then
tool.Parent = Character
end
elseif #feedEquipFoods > 0 then
local tool = feedEquipFoods[1]
if tool and tool.Parent ~= Character then
tool.Parent = Character
end
end
end
end
function feedPet(petUUID)
ReplicatedStorage.GameEvents.ActivePetService:FireServer("Feed", petUUID)
end
Tabs.Pet:Section({ Title = "Boost Pet" })
boostPetDropdown = Tabs.Pet:Dropdown({
Title = "Boost Pet",
Desc = "Select pets to boost",
Values = {{Title = "Loading pets...", Icon = "loader", Value = ""}},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
SearchPlaceholder = "Search pets...",
Callback = function(selected)
selectedBoostPetUUIDs = {}
for _, pet in pairs(selected) do
if pet.Value then
table.insert(selectedBoostPetUUIDs, pet.Value)
end
end
if autoBoostEnabled then
if autoBoostThread then
task.cancel(autoBoostThread)
autoBoostThread = nil
end
startAutoBoost()
end
end
})
boostItemDropdown = Tabs.Pet:Dropdown({
Title = "Boost Item",
Desc = "Select boost items to use",
Values = {{Title = "Loading boost items...", Icon = "loader", Value = ""}},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
SearchPlaceholder = "Search boost items...",
Callback = function(selected)
selectedBoostItems = {}
for _, item in pairs(selected) do
if item.Value then
table.insert(selectedBoostItems, item.Value)
end
end
if autoBoostEnabled then
if autoBoostThread then
task.cancel(autoBoostThread)
autoBoostThread = nil
end
startAutoBoost()
end
end
})
levelupAgeInput = Tabs.Pet:Input({
Title = "Levelup Lollipop Target Age",
Desc = "Set target age (1-100)",
Placeholder = "100",
Value = "100",
NumbersOnly = true,
Callback = function(value)
num = tonumber(value)
if num and num >= 1 then
if num > 100 then
num = 100
levelupAgeInput:Set("100")
end
levelupTargetAge = num
end
if autoBoostEnabled then
if autoBoostThread then
task.cancel(autoBoostThread)
autoBoostThread = nil
end
startAutoBoost()
end
end
})
function startAutoBoost()
autoBoostThread = task.spawn(function()
while autoBoostEnabled and #selectedBoostPetUUIDs > 0 and #selectedBoostItems > 0 do
for _, boostItemName in pairs(selectedBoostItems) do
if not autoBoostEnabled then break end
local boostItemsList = findAllBoostItems(boostItemName)
if #boostItemsList == 0 then
continue
end
for _, petUUID in pairs(selectedBoostPetUUIDs) do
if not autoBoostEnabled then break end
pet = PetUtilities:GetPetByUUID(LocalPlayer, petUUID)
if pet and pet.PetData then
currentAge = pet.PetData.Level or 1
if boostItemName == "Levelup Lollipop" then
if currentAge >= levelupTargetAge or currentAge >= 100 then
continue
end
end
for _, boostItem in pairs(boostItemsList) do
if not autoBoostEnabled then break end
if not canApplyBoost(petUUID, boostItemName) then
break
end
pet = PetUtilities:GetPetByUUID(LocalPlayer, petUUID)
if pet and pet.PetData then
currentAge = pet.PetData.Level or 1
if boostItemName == "Levelup Lollipop" then
if currentAge >= levelupTargetAge or currentAge >= 100 then
break
end
end
if boostItem and boostItem.Parent then
local success = equipAndUseBoostItem(boostItem, petUUID, boostItemName)
if success then
task.wait(0.5)
end
end
end
end
end
end
end
task.wait(1)
end
end)
end
autoBoostToggle = Tabs.Pet:Toggle({
Title = "Auto Boost Pet",
Desc = "Automatically use selected boost items on chosen pets",
Value = false,
Callback = function(state)
autoBoostEnabled = state
if autoBoostEnabled and #selectedBoostPetUUIDs > 0 and #selectedBoostItems > 0 then
startAutoBoost()
elseif autoBoostThread then
task.cancel(autoBoostThread)
autoBoostThread = nil
end
end
})
Tabs.Pet:Section({ Title = "Feed Pet" })
feedPetDropdown = Tabs.Pet:Dropdown({
Title = "Feed Petlist",
Desc = "Select pets to feed",
Values = {{Title = "Loading pets...", Icon = "loader", Value = ""}},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
SearchPlaceholder = "Search pets...",
Callback = function(selected)
selectedFeedPetUUIDs = {}
for _, pet in pairs(selected) do
if pet.Value then
table.insert(selectedFeedPetUUIDs, pet.Value)
end
end
if autoFeedEnabled then
if autoFeedThread then
task.cancel(autoFeedThread)
autoFeedThread = nil
end
startAutoFeed()
end
end
})
feedEquipTypeDropdown = Tabs.Pet:Dropdown({
Title = "Auto Equip Type",
Desc = "Choose how to equip feed items",
Values = {
{Title = "Equip All", Icon = "layers", Value = "Equip All"},
{Title = "Equip 1 By 1", Icon = "list", Value = "Equip 1 By 1"}
},
Value = {Title = "Equip All", Icon = "layers", Value = "Equip All"},
Callback = function(option)
feedEquipType = option.Value
end
})
Tabs.Pet:Section({ Title = "Fruits" })
feedFruitIncludedToggle = Tabs.Pet:Toggle({
Title = "Include Fruit",
Desc = "Include fruits in feed items",
Value = true,
Callback = function(state)
feedFruitIncluded = state
updateFeedEquipLists()
end
})
feedFruitNameFilterToggle = Tabs.Pet:Toggle({
Title = "Enable Fruit Name Filter",
Desc = "Only equip fruits from whitelist",
Value = false,
Callback = function(state)
feedFruitNameFilterEnabled = state
updateFeedEquipLists()
end
})
feedFruitWhitelistDropdown = Tabs.Pet:Dropdown({
Title = "Fruit Whitelist",
Desc = "Select specific fruits to equip",
Values = {{Title = "Click refresh to load fruits", Value = ""}},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
SearchPlaceholder = "Search fruits...",
Callback = function(selected)
feedFruitWhitelist = selected
updateFeedFruitWhitelistNormalized()
updateFeedEquipLists()
end
})
Tabs.Pet:Button({
Title = "Refresh Fruits",
Callback = function()
fruits = getFeedFruits()
if #fruits > 0 then
feedFruitWhitelistDropdown:Refresh(fruits)
end
end
})
feedFruitMutationFilterToggle = Tabs.Pet:Toggle({
Title = "Enable Mutation Filter",
Desc = "Only equip fruits with specific mutations",
Value = false,
Callback = function(state)
feedFruitMutationFilterEnabled = state
updateFeedEquipLists()
end
})
feedFruitMutationWhitelistDropdown = Tabs.Pet:Dropdown({
Title = "Mutation Whitelist",
Desc = "Select mutations to filter",
Values = {{Title = "Click refresh to load mutations", Value = ""}},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
SearchPlaceholder = "Search mutations...",
Callback = function(selected)
feedFruitMutationWhitelist = selected
updateFeedFruitMutationWhitelistNormalized()
updateFeedEquipLists()
end
})
Tabs.Pet:Button({
Title = "Refresh Mutations",
Callback = function()
mutations = getFeedMutations()
if #mutations > 0 then
feedFruitMutationWhitelistDropdown:Refresh(mutations)
end
end
})
feedFruitVariantFilterToggle = Tabs.Pet:Toggle({
Title = "Enable Variant Filter",
Desc = "Only equip fruits with specific variants",
Value = false,
Callback = function(state)
feedFruitVariantFilterEnabled = state
updateFeedEquipLists()
end
})
feedFruitVariantWhitelistDropdown = Tabs.Pet:Dropdown({
Title = "Variant Whitelist",
Desc = "Select variants to filter",
Values = {{Title = "Click refresh to load variants", Value = ""}},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
SearchPlaceholder = "Search variants...",
Callback = function(selected)
feedFruitVariantWhitelist = selected
updateFeedFruitVariantWhitelistNormalized()
updateFeedEquipLists()
end
})
Tabs.Pet:Button({
Title = "Refresh Variants",
Callback = function()
variants = getFeedVariants()
if #variants > 0 then
feedFruitVariantWhitelistDropdown:Refresh(variants)
end
end
})
feedFruitWeightToggle = Tabs.Pet:Toggle({
Title = "Enable Fruit Weight Filter",
Desc = "Only equip fruits within weight range",
Value = false,
Callback = function(state)
feedFruitWeightFilterEnabled = state
updateFeedEquipLists()
end
})
feedFruitMinWeightInput = Tabs.Pet:Input({
Title = "Minimum Fruit Weight",
Placeholder = "0",
Value = "0",
NumbersOnly = true,
Callback = function(value)
num = tonumber(value)
if num then
feedFruitMinWeight = num
updateFeedEquipLists()
end
end
})
feedFruitMaxWeightInput = Tabs.Pet:Input({
Title = "Maximum Fruit Weight",
Placeholder = "999999",
Value = "999999",
NumbersOnly = true,
Callback = function(value)
num = tonumber(value)
if num then
feedFruitMaxWeight = num
updateFeedEquipLists()
end
end
})
feedFruitValueToggle = Tabs.Pet:Toggle({
Title = "Enable Fruit Value Filter",
Desc = "Only equip fruits within value range",
Value = false,
Callback = function(state)
feedFruitValueFilterEnabled = state
updateFeedEquipLists()
end
})
feedFruitMinValueInput = Tabs.Pet:Input({
Title = "Minimum Fruit Value",
Placeholder = "0",
Value = "0",
NumbersOnly = true,
Callback = function(value)
num = tonumber(value)
if num then
feedFruitMinValue = num
updateFeedEquipLists()
end
end
})
feedFruitMaxValueInput = Tabs.Pet:Input({
Title = "Maximum Fruit Value",
Placeholder = "999999999",
Value = "999999999",
NumbersOnly = true,
Callback = function(value)
num = tonumber(value)
if num then
feedFruitMaxValue = num
updateFeedEquipLists()
end
end
})
Tabs.Pet:Section({ Title = "Food" })
feedFoodToggle = Tabs.Pet:Toggle({
Title = "Include Food",
Desc = "Allow equipping food items to feed",
Value = false,
Callback = function(state)
feedFoodEnabled = state
updateFeedEquipLists()
end
})
feedFoodNameFilterToggle = Tabs.Pet:Toggle({
Title = "Enable Food Name Filter",
Desc = "Only equip food from whitelist",
Value = false,
Callback = function(state)
feedFoodNameFilterEnabled = state
updateFeedEquipLists()
end
})
feedFoodWhitelistDropdown = Tabs.Pet:Dropdown({
Title = "Food Whitelist",
Desc = "Select specific foods to equip",
Values = {{Title = "Click refresh to load foods", Value = ""}},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
SearchPlaceholder = "Search foods...",
Callback = function(selected)
feedFoodWhitelist = selected
updateFeedFoodWhitelistNormalized()
updateFeedEquipLists()
end
})
Tabs.Pet:Button({
Title = "Refresh Foods",
Callback = function()
foods = getFeedFoods()
if #foods > 0 then
feedFoodWhitelistDropdown:Refresh(foods)
end
end
})
feedFoodWeightToggle = Tabs.Pet:Toggle({
Title = "Enable Food Weight Filter",
Desc = "Only equip food within weight range",
Value = false,
Callback = function(state)
feedFoodWeightFilterEnabled = state
updateFeedEquipLists()
end
})
feedFoodMinWeightInput = Tabs.Pet:Input({
Title = "Minimum Food Weight",
Placeholder = "0",
Value = "0",
NumbersOnly = true,
Callback = function(value)
num = tonumber(value)
if num then
feedFoodMinWeight = num
updateFeedEquipLists()
end
end
})
feedFoodMaxWeightInput = Tabs.Pet:Input({
Title = "Maximum Food Weight",
Placeholder = "999999",
Value = "999999",
NumbersOnly = true,
Callback = function(value)
num = tonumber(value)
if num then
feedFoodMaxWeight = num
updateFeedEquipLists()
end
end
})
feedFoodScaleToggle = Tabs.Pet:Toggle({
Title = "Enable Food Scale Filter",
Desc = "Only equip food within scale range",
Value = false,
Callback = function(state)
feedFoodScaleFilterEnabled = state
updateFeedEquipLists()
end
})
feedFoodMinScaleInput = Tabs.Pet:Input({
Title = "Minimum Food Scale",
Placeholder = "0",
Value = "0",
NumbersOnly = true,
Callback = function(value)
num = tonumber(value)
if num then
feedFoodMinScale = num
updateFeedEquipLists()
end
end
})
feedFoodMaxScaleInput = Tabs.Pet:Input({
Title = "Maximum Food Scale",
Placeholder = "999999",
Value = "999999",
NumbersOnly = true,
Callback = function(value)
num = tonumber(value)
if num then
feedFoodMaxScale = num
updateFeedEquipLists()
end
end
})
function startAutoFeed()
autoFeedThread = task.spawn(function()
while autoFeedEnabled and #selectedFeedPetUUIDs > 0 do
updateFeedEquipLists()
if #feedEquipFruits > 0 or #feedEquipFoods > 0 then
equipFeedItems()
task.wait()
for _, petUUID in pairs(selectedFeedPetUUIDs) do
if not autoFeedEnabled then break end
pet = PetUtilities:GetPetByUUID(LocalPlayer, petUUID)
if pet and pet.PetData then
hunger = pet.PetData.Hunger or 0
petInfo = PetRegistry.PetList[pet.PetType]
maxHunger = petInfo and petInfo.DefaultHunger or 100
if hunger < maxHunger then
for i = 1, 50 do
if not autoFeedEnabled then break end
feedPet(petUUID)
task.wait()
end
end
end
end
end
if feedEquipType == "Equip 1 By 1" then
if #feedEquipFruits > 0 then
local tool = feedEquipFruits[1]
if tool and tool.Parent == LocalPlayer.Character then
tool.Parent = LocalPlayer.Backpack
table.remove(feedEquipFruits, 1)
end
elseif #feedEquipFoods > 0 then
local tool = feedEquipFoods[1]
if tool and tool.Parent == LocalPlayer.Character then
tool.Parent = LocalPlayer.Backpack
table.remove(feedEquipFoods, 1)
end
end
end
task.wait()
end
end)
end
autoFeedToggle = Tabs.Pet:Toggle({
Title = "Auto Feed Pet",
Desc = "Automatically equip and feed selected pets with whitelisted items (ignores favorited items)",
Value = false,
Callback = function(state)
autoFeedEnabled = state
if autoFeedEnabled and #selectedFeedPetUUIDs > 0 then
updateFeedEquipLists()
startAutoFeed()
elseif autoFeedThread then
task.cancel(autoFeedThread)
autoFeedThread = nil
end
end
})
task.spawn(function()
boostItems = getBoostItems()
if #boostItems > 0 then
boostItemDropdown:Refresh(boostItems)
else
boostItemDropdown:Refresh({{Title = "No Boost Items Found", Icon = "x-circle", Value = ""}})
end
end)
task.spawn(function()
while wait(5) do
refreshPetDropdown()
end
end)
task.spawn(function()
task.wait(2)
refreshPetDropdown()
updateFeedEquipLists()
end)
PetEggService = ReplicatedStorage.GameEvents.PetEggService
PetEggData = require(ReplicatedStorage.Data.PetRegistry.PetEggs)
function isItemFavorited(item)
if item:GetAttribute("Favorite") then
return true
end
local backpackGui = LocalPlayer.PlayerGui:FindFirstChild("BackpackGui")
if backpackGui then
local backpackFrame = backpackGui:FindFirstChild("Backpack")
if backpackFrame then
local hotbar = backpackFrame:FindFirstChild("Hotbar")
if hotbar then
for _, slot in pairs(hotbar:GetChildren()) do
if slot:IsA("TextButton") then
local favIcon = slot:FindFirstChild("FavIcon")
if favIcon and favIcon.Visible then
local toolName = slot:FindFirstChild("ToolName")
if toolName and toolName.Text == item.Name then
return true
end
end
end
end
end
local inventory = backpackFrame:FindFirstChild("Inventory")
if inventory then
local scrollingFrame = inventory:FindFirstChild("ScrollingFrame")
if scrollingFrame then
local gridFrame = scrollingFrame:FindFirstChild("UIGridFrame")
if gridFrame then
for _, slot in pairs(gridFrame:GetChildren()) do
if slot:IsA("TextButton") then
local favIcon = slot:FindFirstChild("FavIcon")
if favIcon and favIcon.Visible then
local toolName = slot:FindFirstChild("ToolName")
if toolName and toolName.Text == item.Name then
return true
end
end
end
end
end
end
end
end
end
return false
end
function getEggs()
eggs = {}
for eggName, eggInfo in pairs(PetEggData) do
table.insert(eggs, {
Title = eggInfo.EggName or eggName,
Desc = "Rarity: " .. (eggInfo.EggRarity or "Unknown"),
Icon = eggInfo.Icon or "",
Value = eggName,
Data = {
Name = eggName,
DisplayName = eggInfo.EggName or eggName,
Rarity = eggInfo.EggRarity or "Unknown",
Icon = eggInfo.Icon or ""
}
})
end
table.sort(eggs, function(a, b) return a.Title < b.Title end)
return eggs
end
function matchesEggName(toolName, eggName)
toolNameLower = string.lower(toolName)
eggNameLower = string.lower(eggName)
local patterns = {
"^" .. eggNameLower,
eggNameLower .. "$",
"^" .. eggNameLower .. " [xX%d]+",
"^" .. eggNameLower .. " [eE][gG][gG]%d*",
"^[hH][iI] " .. eggNameLower,
"^[hH][iI] " .. eggNameLower .. " [xX%d]+",
"^[hH][iI] " .. eggNameLower .. " [eE][gG][gG]%d*",
"^" .. eggNameLower .. " [eE][gG][gG]%d* [xX%d]+$",
eggNameLower .. " [xX%d]+$",
eggNameLower .. " [eE][gG][gG]%d*$",
".*" .. eggNameLower .. ".*"
}
for _, pattern in ipairs(patterns) do
if string.match(toolNameLower, pattern) then
return true
end
end
local words = {}
for word in string.gmatch(toolNameLower, "[%w]+") do
table.insert(words, word)
end
local searchWords = {}
for word in string.gmatch(eggNameLower, "[%w]+") do
table.insert(searchWords, word)
end
local matchCount = 0
for _, searchWord in ipairs(searchWords) do
for _, toolWord in ipairs(words) do
if toolWord == searchWord or string.find(toolWord, searchWord) or string.find(searchWord, toolWord) then
matchCount = matchCount + 1
break
end
end
end
if #searchWords > 0 and matchCount >= #searchWords then
return true
end
return false
end
function findAllEggs()
eggs = {}
if Backpack then
for _, tool in pairs(Backpack:GetChildren()) do
if tool:IsA("Tool") and not isItemFavorited(tool) then
if tool:GetAttribute("ItemType") == "PetEgg" then
table.insert(eggs, tool)
else
for eggName, eggInfo in pairs(PetEggData) do
if matchesEggName(tool.Name, eggName) then
table.insert(eggs, tool)
break
end
end
end
end
end
end
if Character then
for _, tool in pairs(Character:GetChildren()) do
if tool:IsA("Tool") and not isItemFavorited(tool) then
if tool:GetAttribute("ItemType") == "PetEgg" then
table.insert(eggs, tool)
else
for eggName, eggInfo in pairs(PetEggData) do
if matchesEggName(tool.Name, eggName) then
table.insert(eggs, tool)
break
end
end
end
end
end
end
return eggs
end
function getPlacementPosition()
if not Character then return Vector3.new(0, 5, 0) end
local humanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
if not humanoidRootPart then return Vector3.new(0, 5, 0) end
if placeMode == "Under Player" then
return humanoidRootPart.Position + Vector3.new(0, -2, 0)
elseif placeMode == "Random" then
local basePos = humanoidRootPart.Position
local offsetX = math.random(-15, 15)
local offsetZ = math.random(-15, 15)
return basePos + Vector3.new(offsetX, -2, offsetZ)
elseif placeMode == "Saved Position" then
return savedPosition
end
return Vector3.new(0, 5, 0)
end
function placeEgg(eggItem)
if not eggItem then return false end
local position = getPlacementPosition()
local success = pcall(function()
PetEggService:FireServer("CreateEgg", position)
end)
if success then
if eggItem and eggItem.Parent then
eggItem:Destroy()
end
return true
end
return false
end
function equipEgg(eggItem)
local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
if not Humanoid then return false end
if eggItem.Parent == LocalPlayer.Backpack then
eggItem.Parent = Character
Humanoid:EquipTool(eggItem)
return true
elseif eggItem.Parent == Character then
Humanoid:EquipTool(eggItem)
return true
end
return false
end
selectedEggs = {}
autoPlaceEnabled = false
autoPlaceThread = nil
placeMode = "Random"
savedPosition = Vector3.new(0, 5, 0)
autoEquipEgg = true
placeDelay = 0.1
Tabs.Pet:Section({ Title = "Place Eggs" })
eggDropdown = Tabs.Pet:Dropdown({
Title = "Select Eggs",
Desc = "Select eggs to place",
Values = {{Title = "Loading eggs...", Icon = "loader", Value = ""}},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
SearchPlaceholder = "Search eggs...",
Callback = function(selected)
selectedEggs = {}
for _, egg in pairs(selected) do
if egg.Value then
table.insert(selectedEggs, egg.Value)
end
end
end
})
Tabs.Pet:Button({
Title = "Refresh Eggs",
Callback = function()
eggs = getEggs()
if #eggs > 0 then
eggDropdown:Refresh(eggs)
end
end
})
modeDropdown = Tabs.Pet:Dropdown({
Title = "Place Mode",
Values = {
{Title = "Random", Icon = "shuffle", Value = "Random"},
{Title = "Under Player", Icon = "user", Value = "Under Player"},
{Title = "Saved Position", Icon = "save", Value = "Saved Position"}
},
Value = {Title = "Random", Icon = "shuffle", Value = "Random"},
Callback = function(option)
placeMode = option.Value
end
})
Tabs.Pet:Button({
Title = "Save Current Position",
Callback = function()
if Character then
local humanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
if humanoidRootPart then
savedPosition = humanoidRootPart.Position + Vector3.new(0, -2, 0)
end
end
end
})
Tabs.Pet:Button({
Title = "Clear Saved Position",
Callback = function()
savedPosition = Vector3.new(0, 5, 0)
end
})
autoEquipToggle = Tabs.Pet:Toggle({
Title = "Auto Equip Egg",
Desc = "Automatically equip eggs before placing",
Value = true,
Callback = function(state)
autoEquipEgg = state
end
})
delaySlider = Tabs.Pet:Slider({
Title = "Place Delay",
Step = 0.01,
Value = {Min = 0.01, Max = 2, Default = 0.1},
Callback = function(value)
placeDelay = value
end
})
function getEggsToPlace()
eggsToPlace = {}
if Backpack then
for _, tool in pairs(Backpack:GetChildren()) do
if tool:IsA("Tool") and not isItemFavorited(tool) then
local isSelected = false
if #selectedEggs > 0 then
for _, selectedEgg in pairs(selectedEggs) do
if matchesEggName(tool.Name, selectedEgg) then
isSelected = true
break
end
end
else
for eggName, eggInfo in pairs(PetEggData) do
if matchesEggName(tool.Name, eggName) then
isSelected = true
break
end
end
end
if isSelected then
table.insert(eggsToPlace, tool)
end
end
end
end
if Character then
for _, tool in pairs(Character:GetChildren()) do
if tool:IsA("Tool") and not isItemFavorited(tool) then
local isSelected = false
if #selectedEggs > 0 then
for _, selectedEgg in pairs(selectedEggs) do
if matchesEggName(tool.Name, selectedEgg) then
isSelected = true
break
end
end
else
for eggName, eggInfo in pairs(PetEggData) do
if matchesEggName(tool.Name, eggName) then
isSelected = true
break
end
end
end
if isSelected then
table.insert(eggsToPlace, tool)
end
end
end
end
return eggsToPlace
end
function startAutoPlace()
autoPlaceThread = task.spawn(function()
while autoPlaceEnabled do
eggs = getEggsToPlace()
if #eggs == 0 then
task.wait(1)
continue
end
for _, egg in pairs(eggs) do
if not autoPlaceEnabled then break end
if autoEquipEgg then
equipEgg(egg)
task.wait(0.05)
end
placeEgg(egg)
task.wait(placeDelay)
end
task.wait(0.5)
end
end)
end
autoPlaceToggle = Tabs.Pet:Toggle({
Title = "Auto Place Eggs",
Desc = "Automatically place selected eggs",
Value = false,
Callback = function(state)
autoPlaceEnabled = state
if state then
startAutoPlace()
elseif autoPlaceThread then
task.cancel(autoPlaceThread)
autoPlaceThread = nil
end
end
})
PetEggService = ReplicatedStorage.GameEvents.PetEggService
PetEggData = require(ReplicatedStorage.Data.PetRegistry.PetEggs)
function isItemFavorited(item)
if item:GetAttribute("Favorite") then
return true
end
local backpackGui = LocalPlayer.PlayerGui:FindFirstChild("BackpackGui")
if backpackGui then
local backpackFrame = backpackGui:FindFirstChild("Backpack")
if backpackFrame then
local hotbar = backpackFrame:FindFirstChild("Hotbar")
if hotbar then
for _, slot in pairs(hotbar:GetChildren()) do
if slot:IsA("TextButton") then
local favIcon = slot:FindFirstChild("FavIcon")
if favIcon and favIcon.Visible then
local toolName = slot:FindFirstChild("ToolName")
if toolName and toolName.Text == item.Name then
return true
end
end
end
end
end
local inventory = backpackFrame:FindFirstChild("Inventory")
if inventory then
local scrollingFrame = inventory:FindFirstChild("ScrollingFrame")
if scrollingFrame then
local gridFrame = scrollingFrame:FindFirstChild("UIGridFrame")
if gridFrame then
for _, slot in pairs(gridFrame:GetChildren()) do
if slot:IsA("TextButton") then
local favIcon = slot:FindFirstChild("FavIcon")
if favIcon and favIcon.Visible then
local toolName = slot:FindFirstChild("ToolName")
if toolName and toolName.Text == item.Name then
return true
end
end
end
end
end
end
end
end
end
return false
end
function getCurrentEggCount()
local farm = workspace:FindFirstChild("Farm")
if not farm then return 0 end
local myUsername = LocalPlayer.Name
local eggCount = 0
for _, plot in pairs(farm:GetChildren()) do
local sign = plot:FindFirstChild("Sign")
if sign and sign:GetAttribute("_owner") == myUsername then
local important = plot:FindFirstChild("Important")
if important then
local objectsPhysical = important:FindFirstChild("Objects_Physical")
if objectsPhysical then
for _, obj in pairs(objectsPhysical:GetChildren()) do
if obj.Name == "PetEgg" then
eggCount = eggCount + 1
end
end
end
end
end
end
return eggCount
end
function getEggs()
eggs = {}
for eggName, eggInfo in pairs(PetEggData) do
table.insert(eggs, {
Title = eggInfo.EggName or eggName,
Desc = "Rarity: " .. (eggInfo.EggRarity or "Unknown"),
Icon = eggInfo.Icon or "",
Value = eggName,
Data = {
Name = eggName,
DisplayName = eggInfo.EggName or eggName,
Rarity = eggInfo.EggRarity or "Unknown",
Icon = eggInfo.Icon or ""
}
})
end
table.sort(eggs, function(a, b) return a.Title < b.Title end)
return eggs
end
function matchesEggName(toolName, eggName)
toolNameLower = string.lower(toolName)
eggNameLower = string.lower(eggName)
return string.find(toolNameLower, eggNameLower) ~= nil
end
function getEggsToPlace()
eggsToPlace = {}
if Backpack then
for _, tool in pairs(Backpack:GetChildren()) do
if tool:IsA("Tool") and not isItemFavorited(tool) then
local isSelected = false
if #selectedEggs > 0 then
for _, selectedEgg in pairs(selectedEggs) do
if matchesEggName(tool.Name, selectedEgg) then
isSelected = true
break
end
end
else
for eggName in pairs(PetEggData) do
if matchesEggName(tool.Name, eggName) then
isSelected = true
break
end
end
end
if isSelected then
table.insert(eggsToPlace, tool)
end
end
end
end
if Character then
for _, tool in pairs(Character:GetChildren()) do
if tool:IsA("Tool") and not isItemFavorited(tool) then
local isSelected = false
if #selectedEggs > 0 then
for _, selectedEgg in pairs(selectedEggs) do
if matchesEggName(tool.Name, selectedEgg) then
isSelected = true
break
end
end
else
for eggName in pairs(PetEggData) do
if matchesEggName(tool.Name, eggName) then
isSelected = true
break
end
end
end
if isSelected then
table.insert(eggsToPlace, tool)
end
end
end
end
return eggsToPlace
end
function getPlacementPosition()
if not Character then return Vector3.new(0, 5, 0) end
local humanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
if not humanoidRootPart then return Vector3.new(0, 5, 0) end
if placeMode == "Under Player" then
return humanoidRootPart.Position + Vector3.new(0, -2, 0)
else
local basePos = humanoidRootPart.Position
local offsetX = math.random(-15, 15)
local offsetZ = math.random(-15, 15)
return basePos + Vector3.new(offsetX, -2, offsetZ)
end
end
function placeEgg(eggItem)
if not eggItem then return false end
local position = getPlacementPosition()
local success = pcall(function()
PetEggService:FireServer("CreateEgg", position)
end)
if success then
if eggItem and eggItem.Parent then
eggItem:Destroy()
end
return true
end
return false
end
function equipEgg(eggItem)
local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
if not Humanoid then return false end
if eggItem.Parent == LocalPlayer.Backpack then
eggItem.Parent = Character
Humanoid:EquipTool(eggItem)
return true
elseif eggItem.Parent == Character then
Humanoid:EquipTool(eggItem)
return true
end
return false
end
selectedEggs = {}
autoPlaceEnabled = false
autoPlaceThread = nil
placeMode = "Random"
autoEquipEgg = true
placeDelay = 0.1
maxEggSlots = 3
lastEggCount = 0
eggCountCheckTimer = 0
Tabs.Pet:Section({ Title = "Place Eggs" })
eggDropdown = Tabs.Pet:Dropdown({
Title = "Select Eggs",
Desc = "Select eggs to place",
Values = {{Title = "Loading eggs...", Icon = "loader", Value = ""}},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
SearchPlaceholder = "Search eggs...",
Callback = function(selected)
selectedEggs = {}
for _, egg in pairs(selected) do
if egg.Value then
table.insert(selectedEggs, egg.Value)
end
end
end
})
Tabs.Pet:Button({
Title = "Refresh Eggs",
Callback = function()
eggs = getEggs()
if #eggs > 0 then
eggDropdown:Refresh(eggs)
end
end
})
modeDropdown = Tabs.Pet:Dropdown({
Title = "Place Mode",
Values = {
{Title = "Random", Icon = "shuffle", Value = "Random"},
{Title = "Under Player", Icon = "user", Value = "Under Player"}
},
Value = {Title = "Random", Icon = "shuffle", Value = "Random"},
Callback = function(option)
placeMode = option.Value
end
})
maxEggSlotsInput = Tabs.Pet:Input({
Title = "Max Egg Slots",
Desc = "Maximum number of eggs to place",
Placeholder = "3",
Value = "3",
NumbersOnly = true,
Callback = function(value)
num = tonumber(value)
if num and num > 0 then
maxEggSlots = num
end
end
})
autoEquipToggle = Tabs.Pet:Toggle({
Title = "Auto Equip Egg",
Desc = "Automatically equip eggs before placing",
Value = true,
Callback = function(state)
autoEquipEgg = state
end
})
delaySlider = Tabs.Pet:Slider({
Title = "Place Delay",
Step = 0.01,
Value = {Min = 0.01, Max = 2, Default = 0.1},
Callback = function(value)
placeDelay = value
end
})
function startAutoPlace()
autoPlaceThread = task.spawn(function()
while autoPlaceEnabled do
eggs = getEggsToPlace()
if #eggs == 0 then
task.wait(1)
continue
end
currentEggCount = getCurrentEggCount()
if currentEggCount >= maxEggSlots then
task.wait(1)
continue
end
for _, egg in pairs(eggs) do
if not autoPlaceEnabled then break end
currentEggCount = getCurrentEggCount()
if currentEggCount >= maxEggSlots then
break
end
if autoEquipEgg then
equipEgg(egg)
task.wait(0.05)
end
placeEgg(egg)
task.wait(placeDelay)
end
task.wait(0.5)
end
end)
end
autoPlaceToggle = Tabs.Pet:Toggle({
Title = "Auto Place Eggs",
Desc = "Automatically place selected eggs",
Value = false,
Callback = function(state)
autoPlaceEnabled = state
if state then
startAutoPlace()
elseif autoPlaceThread then
task.cancel(autoPlaceThread)
autoPlaceThread = nil
end
end
})
task.spawn(function()
eggs = getEggs()
if #eggs > 0 then
eggDropdown:Refresh(eggs)
else
eggDropdown:Refresh({{Title = "No Eggs Found", Icon = "x-circle", Value = ""}})
end
end)
Tabs.Pet:Space()
local PetEggService = ReplicatedStorage.GameEvents.PetEggService
local EggReadyToHatch_RE = ReplicatedStorage.GameEvents.EggReadyToHatch_RE
local autoHatchEnabled = false
local autoHatchThread = nil
local hatchedEggsCache = {}
function getPlayerEggs()
local eggs = {}
local farmFolder = workspace:FindFirstChild("Farm")
if farmFolder then
local myPlots = {}
for _, plot in pairs(farmFolder:GetChildren()) do
local sign = plot:FindFirstChild("Sign")
if sign then
local owner = sign:GetAttribute("_owner")
if owner and owner == LocalPlayer.Name then
table.insert(myPlots, plot)
end
end
end
for _, plot in pairs(myPlots) do
local important = plot:FindFirstChild("Important")
if important then
local objectsPhysical = important:FindFirstChild("Objects_Physical")
if objectsPhysical then
for _, obj in pairs(objectsPhysical:GetChildren()) do
if obj:IsA("Model") and obj:FindFirstChild("PetEgg") then
local petEgg = obj:FindFirstChild("PetEgg")
if petEgg then
local promptAtt = petEgg:FindFirstChild("ProximityPromptAtt")
local prompt = promptAtt and promptAtt:FindFirstChild("ProximityPrompt")
if prompt and prompt.Enabled == true then
table.insert(eggs, {
eggObject = obj,
petEgg = petEgg,
prompt = prompt,
uuid = obj:GetAttribute("OBJECT_UUID") or obj.Name
})
end
end
end
end
end
end
end
end
return eggs
end
function hatchEgg(egg)
if not egg or not egg.eggObject then return false end
local eggId = egg.uuid
if hatchedEggsCache[eggId] then
return false
end
local success = pcall(function()
PetEggService:FireServer("HatchPet", egg.eggObject)
end)
if success then
hatchedEggsCache[eggId] = true
task.spawn(function()
task.wait(2)
hatchedEggsCache[eggId] = nil
end)
return true
end
return false
end
function hatchAllReadyEggs()
local eggs = getPlayerEggs()
local hatchedCount = 0
for _, egg in pairs(eggs) do
if autoHatchEnabled then
local success = hatchEgg(egg)
if success then
hatchedCount = hatchedCount + 1
end
task.wait(0.1)
else
break
end
end
return hatchedCount
end
function startAutoHatch()
if autoHatchThread then
task.cancel(autoHatchThread)
autoHatchThread = nil
end
autoHatchThread = task.spawn(function()
while autoHatchEnabled do
local hatched = hatchAllReadyEggs()
if hatched == 0 then
task.wait(2)
else
task.wait(0.5)
end
end
end)
end
function stopAutoHatch()
if autoHatchThread then
task.cancel(autoHatchThread)
autoHatchThread = nil
end
end
EggReadyToHatch_RE.OnClientEvent:Connect(function(eggObject, eggUUID)
if autoHatchEnabled and eggObject and eggObject:GetAttribute("OWNER") == LocalPlayer.Name then
task.spawn(function()
task.wait(0.5)
if autoHatchEnabled then
local eggs = getPlayerEggs()
for _, egg in pairs(eggs) do
if egg.uuid == eggUUID or egg.eggObject == eggObject then
hatchEgg(egg)
break
end
end
end
end)
end
end)
autoHatchToggle = Tabs.Pet:Toggle({
Title = "Auto Hatch Pet",
Desc = "Automatically hatch ready eggs in your garden",
Value = false,
Callback = function(state)
autoHatchEnabled = state
if state then
hatchedEggsCache = {}
startAutoHatch()
else
stopAutoHatch()
end
end
})
task.spawn(function()
while wait(10) do
if autoHatchEnabled then
hatchedEggsCache = {}
end
end
end)
Tabs.Item:Section({ Title = "Item", TextSize = 20 })
Tabs.Item:Section({ Title = "Equip All Items" })
Tabs.Item:Divider()
GearData = require(ReplicatedStorage.Data.GearData)

EquipConfig = {
SelectedTypes = {"Any"},
Blacklist = {},
CustomTypes = {},
SelectedBlacklist = {},
SelectedCustomType = {},
TempBlacklistInput = "",
TempCustomInput = ""
}

function getBlacklistOptions()
return EquipConfig.Blacklist
end

function getCustomOptions()
return EquipConfig.CustomTypes
end

Tabs.Item:Dropdown({
Title = "Select item types",
Values = {"Any", "Egg", "Seed", "Fruit", "Gear", "Crate", "Seed Pack", "Pet"},
Value = "Any",
Multi = true,
Callback = function(val)
EquipConfig.SelectedTypes = val
end
})

BlacklistDropdown = Tabs.Item:Dropdown({
Title = "Blacklist items",
Values = getBlacklistOptions(),
Multi = true,
Callback = function(val)
EquipConfig.SelectedBlacklist = val
end
})

Tabs.Item:Input({
Title = "Add blacklist item name",
Placeholder = "Your Item here",
Callback = function(val)
EquipConfig.TempBlacklistInput = val
end
})

Tabs.Item:Button({
Title = "Apply blacklist",
Callback = function()
if EquipConfig.TempBlacklistInput ~= "" then
table.insert(EquipConfig.Blacklist, EquipConfig.TempBlacklistInput)
BlacklistDropdown:Refresh(getBlacklistOptions())
end
end
})

Tabs.Item:Button({
Title = "Delete black list item",
Callback = function()
selected = EquipConfig.SelectedBlacklist
if #selected > 0 then
for _, sel in ipairs(selected) do
for i = #EquipConfig.Blacklist, 1, -1 do
if EquipConfig.Blacklist[i] == sel then
table.remove(EquipConfig.Blacklist, i)
end
end
end
EquipConfig.SelectedBlacklist = {}
BlacklistDropdown:Refresh(getBlacklistOptions(), {})
end
end
})

CustomTypeDropdown = Tabs.Item:Dropdown({
Title = "Custom Item List",
Values = getCustomOptions(),
Multi = true,
Callback = function(val)
EquipConfig.SelectedCustomType = val
end
})

Tabs.Item:Input({
Title = "Add custom item type/name",
Placeholder = "Custom Type",
Callback = function(val)
EquipConfig.TempCustomInput = val
end
})

Tabs.Item:Button({
Title = "Apply custom",
Callback = function()
if EquipConfig.TempCustomInput ~= "" then
table.insert(EquipConfig.CustomTypes, EquipConfig.TempCustomInput)
CustomTypeDropdown:Refresh(getCustomOptions())
end
end
})

Tabs.Item:Button({
Title = "Delete custom item type",
Callback = function()
selected = EquipConfig.SelectedCustomType
if #selected > 0 then
for _, sel in ipairs(selected) do
for i = #EquipConfig.CustomTypes, 1, -1 do
if EquipConfig.CustomTypes[i] == sel then
table.remove(EquipConfig.CustomTypes, i)
end
end
end
EquipConfig.SelectedCustomType = {}
CustomTypeDropdown:Refresh(getCustomOptions(), {})
end
end
})

-- Get Favorite_Item remote from correct path
local FavoriteItemRemote = game:GetService("ReplicatedStorage").GameEvents.Favorite_Item

Tabs.Item:Button({
Title = "Equip item",
Callback = function()
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local Backpack = plr.Backpack

for _, tool in ipairs(Backpack:GetChildren()) do
if tool:IsA("Tool") then
local shouldEquip = false
local isBlacklisted = false
local toolType = tool:GetAttribute("ItemType") or tool.Name
local display = ""

if GearData[tool.Name] and GearData[tool.Name].GearName then
display = GearData[tool.Name].GearName
end

for _, black in ipairs(EquipConfig.Blacklist) do
if string.find(tool.Name, black) or (display ~= "" and string.find(display, black)) then
isBlacklisted = true
break
end
end

if not isBlacklisted then
local hasSeed = table.find(EquipConfig.SelectedTypes, "Seed")
local hasSeedPack = table.find(EquipConfig.SelectedTypes, "Seed Pack")
local hasFruit = table.find(EquipConfig.SelectedTypes, "Fruit")

for _, typeSel in ipairs(EquipConfig.SelectedTypes) do
if typeSel == "Any" then
shouldEquip = true
elseif typeSel == "Seed" then
if (string.find(toolType, "Seed") or string.find(tool.Name, "Seed")) and not (string.find(toolType, "Seed Pack") or string.find(tool.Name, "Seed Pack")) then
shouldEquip = true
end
elseif typeSel == "Fruit" then
if Backpack:FindFirstChild(tool.Name) and Backpack[tool.Name]:FindFirstChild("Item_Seed") then
shouldEquip = true
end
elseif typeSel == "Gear" then
if GearData[tool.Name] then
shouldEquip = true
end
elseif typeSel == "Pet" then
if tool:GetAttribute("ItemType") == "Pet" then
shouldEquip = true
end
else
if string.find(toolType, typeSel) or string.find(tool.Name, typeSel) then
shouldEquip = true
end
end
end

if hasSeed and not hasSeedPack and (string.find(toolType, "Seed Pack") or string.find(tool.Name, "Seed Pack")) then
shouldEquip = false
end

for _, custom in ipairs(EquipConfig.CustomTypes) do
if string.find(toolType, custom) or string.find(tool.Name, custom) or (display ~= "" and string.find(display, custom)) then
shouldEquip = true
end
end
end

if shouldEquip then
tool.Parent = char
end
end
end
end
})

Tabs.Item:Section({ Title = "Auto Favorite", TextSize = 20 })
Tabs.Item:Divider()
Tabs.Item:Section({ Title = "FRUIT FAVORITE", TextSize = 18 })

local fruitFavoriteEnabled = false
local fruitFavoriteTask = nil
local fruitUnfavoriteTask = nil
local fruitWhitelist = {}
local fruitWhitelistNormalized = {}
local fruitMutationWhitelist = {}
local fruitMutationWhitelistNormalized = {}
local fruitVariantWhitelist = {}
local fruitVariantWhitelistNormalized = {}
local fruitWeightFilterEnabled = false
local fruitMinWeight = 0
local fruitMaxWeight = 999999
local fruitUnfavoriteButton = nil
local fruitUnfavoriteRunning = false
local fruitFavoriteButton = nil
local fruitFavoriteRunning = false

function updateFruitWhitelistNormalized()
fruitWhitelistNormalized = {}
for _, fruitData in pairs(fruitWhitelist) do
local fruitName = fruitData.Title or fruitData
if type(fruitName) == "string" then
fruitWhitelistNormalized[fruitName:lower()] = true
end
end
end

function updateFruitMutationWhitelistNormalized()
fruitMutationWhitelistNormalized = {}
for _, mutationData in pairs(fruitMutationWhitelist) do
local mutationName = mutationData.Title or mutationData
if type(mutationName) == "string" then
fruitMutationWhitelistNormalized[mutationName:lower()] = true
end
end
end

function updateFruitVariantWhitelistNormalized()
fruitVariantWhitelistNormalized = {}
for _, variantData in pairs(fruitVariantWhitelist) do
local variantName = variantData.Title or variantData
if type(variantName) == "string" then
fruitVariantWhitelistNormalized[variantName:lower()] = true
end
end
end

function getFruitMutations(item)
local mutations = {}
for attrName, attrValue in pairs(item:GetAttributes()) do
if type(attrValue) == "boolean" and attrValue == true then
table.insert(mutations, attrName)
end
end
return mutations
end

function getFruitVariant(item)
local variant = item:FindFirstChild("Variant")
if variant and variant:IsA("StringValue") and variant.Value ~= "" then
return variant.Value
end
local variantAttr = item:GetAttribute("Variant")
if variantAttr and variantAttr ~= "" then
return tostring(variantAttr)
end
return nil
end

function getFruitWeight(item)
local weightAttr = item:GetAttribute("Weight")
if weightAttr then
return tonumber(weightAttr)
end
local weightObj = item:FindFirstChild("Weight")
if weightObj then
if weightObj:IsA("NumberValue") or weightObj:IsA("IntValue") then
return weightObj.Value
elseif weightObj:IsA("StringValue") then
return tonumber(weightObj.Value)
end
end
return nil
end

function isItemFavorited(item)
if item:GetAttribute("Favorite") then
return true
end

local LocalPlayer = game:GetService("Players").LocalPlayer
local backpackGui = LocalPlayer.PlayerGui:FindFirstChild("BackpackGui")
if backpackGui then
local backpackFrame = backpackGui:FindFirstChild("Backpack")
if backpackFrame then
local hotbar = backpackFrame:FindFirstChild("Hotbar")
if hotbar then
for _, slot in ipairs(hotbar:GetChildren()) do
if slot:IsA("TextButton") then
local favIcon = slot:FindFirstChild("FavIcon")
if favIcon and favIcon.Visible then
local toolName = slot:FindFirstChild("ToolName")
if toolName and toolName.Text == item.Name then
return true
end
end
end
end
end

local inventory = backpackFrame:FindFirstChild("Inventory")
if inventory then
local scrollingFrame = inventory:FindFirstChild("ScrollingFrame")
if scrollingFrame then
local gridFrame = scrollingFrame:FindFirstChild("UIGridFrame")
if gridFrame then
for _, slot in ipairs(gridFrame:GetChildren()) do
if slot:IsA("TextButton") then
local favIcon = slot:FindFirstChild("FavIcon")
if favIcon and favIcon.Visible then
local toolName = slot:FindFirstChild("ToolName")
if toolName and toolName.Text == item.Name then
return true
end
end
end
end
end
end
end
end
end
return false
end

function waitForFavoriteIconToAppear(item)
local maxWaitTime = 5
local startTime = tick()
local retryDelay = 0.2

while tick() - startTime < maxWaitTime do
if isItemFavorited(item) then
return true
end
task.wait(retryDelay)
end
return false
end

function waitForFavoriteIconToDisappear(item)
local maxWaitTime = 5
local startTime = tick()
local retryDelay = 0.2

while tick() - startTime < maxWaitTime do
if not isItemFavorited(item) then
return true
end
task.wait(retryDelay)
end
return false
end

function shouldFavoriteFruit(item)
if not item or not item:IsA("Tool") then return false end
if isItemFavorited(item) then
return false
end

local itemType = item:GetAttribute("ItemType")
local isFruit = (itemType == "Seed" or itemType == "Fruit" or item:FindFirstChild("Item_Seed")) and 
not string.find(item.Name, "Pack")

if not isFruit then return false end

if #fruitWhitelist > 0 then
local itemName = item.Name:lower()
local found = false
for fruitName, _ in pairs(fruitWhitelistNormalized) do
if itemName:find(fruitName) then
found = true
break
end
end
if not found then return false end
end

if #fruitMutationWhitelist > 0 then
local mutations = getFruitMutations(item)
local hasMutation = false
for _, mutation in ipairs(mutations) do
if fruitMutationWhitelistNormalized[mutation:lower()] then
hasMutation = true
break
end
end
if not hasMutation then return false end
end

if #fruitVariantWhitelist > 0 then
local variant = getFruitVariant(item)
if not variant or not fruitVariantWhitelistNormalized[variant:lower()] then
return false
end
end

if fruitWeightFilterEnabled then
local weight = getFruitWeight(item)
if weight then
if weight < fruitMinWeight or weight > fruitMaxWeight then
return false
end
else
return false
end
end

return true
end

function getFruitsToProcess(itemsToProcess)
local fruits = {}
for _, item in ipairs(itemsToProcess) do
if item:IsA("Tool") and shouldFavoriteFruit(item) then
table.insert(fruits, item)
end
end
return fruits
end

function safeFavoriteItem(item)
if FavoriteItemRemote then
FavoriteItemRemote:FireServer(item)
return true
else
warn("Favorite_Item remote not found at ReplicatedStorage.GameEvents.Favorite_Item")
return false
end
end

fruitFavoriteButton = Tabs.Item:Toggle({
Title = "Auto Favorite Fruits",
Desc = "Automatically favorite fruits matching filters",
Value = false,
Callback = function(state)
fruitFavoriteEnabled = state
if state then
fruitFavoriteRunning = true
fruitFavoriteButton:SetTitle("Stop Task")
fruitFavoriteTask = task.spawn(function()
local LocalPlayer = game:GetService("Players").LocalPlayer
while fruitFavoriteEnabled and fruitFavoriteRunning do
local Backpack = LocalPlayer:FindFirstChild("Backpack")
local Character = LocalPlayer.Character
local allItems = {}

if Backpack then
for _, item in pairs(Backpack:GetChildren()) do
if item:IsA("Tool") then
table.insert(allItems, item)
end
end
end

if Character then
for _, item in pairs(Character:GetChildren()) do
if item:IsA("Tool") then
table.insert(allItems, item)
end
end
end

-- Get only fruits that should be favorited
local fruitsToFavorite = getFruitsToProcess(allItems)
local totalFruits = #fruitsToFavorite

for i, fruit in ipairs(fruitsToFavorite) do
if not fruitFavoriteEnabled or not fruitFavoriteRunning then break end
fruitFavoriteButton:SetTitle(string.format("Favoriting fruit %d/%d", i, totalFruits))
safeFavoriteItem(fruit)
local success = waitForFavoriteIconToAppear(fruit)
if not success then
warn("Timeout waiting for fruit to favorite: " .. fruit.Name)
end
task.wait(0.05)
end

if fruitFavoriteEnabled and fruitFavoriteRunning then
task.wait(1)
end
end
fruitFavoriteRunning = false
fruitFavoriteButton:SetTitle("Auto Favorite Fruits")
end)
else
fruitFavoriteRunning = false
fruitFavoriteButton:SetTitle("Auto Favorite Fruits")
if fruitFavoriteTask then
task.cancel(fruitFavoriteTask)
fruitFavoriteTask = nil
end
end
end
})

fruitNameDropdown = Tabs.Item:Dropdown({
Title = "FRUIT NAME WHITELIST",
Desc = "Select specific fruits to favorite",
Values = {"Click refresh to load fruits"},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(selected)
fruitWhitelist = selected
updateFruitWhitelistNormalized()
end
})

Tabs.Item:Button({
Title = "Refresh Fruit List",
Callback = function()
local items = {}
if SeedData then
for fruitName, fruitInfo in pairs(SeedData) do
table.insert(items, {
Title = fruitInfo.SeedName or fruitName,
Desc = "Rarity: " .. (fruitInfo.SeedRarity or "Unknown"),
Icon = fruitInfo.FruitIcon or fruitInfo.Asset or ""
})
end
table.sort(items, function(a, b) return a.Title < b.Title end)
end
fruitNameDropdown:Refresh(items)
end
})

fruitMutationDropdown = Tabs.Item:Dropdown({
Title = "FRUIT MUTATION WHITELIST",
Desc = "Select mutations to filter",
Values = {"Click refresh to load mutations"},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(selected)
fruitMutationWhitelist = selected
updateFruitMutationWhitelistNormalized()
end
})

Tabs.Item:Button({
Title = "Refresh Mutations",
Callback = function()
local items = {}
if MutationHandler and MutationHandler.GetMutations then
local mutations = MutationHandler:GetMutations()
for _, mutation in pairs(mutations) do
if mutation.Name then
table.insert(items, mutation.Name)
end
end
table.sort(items)
end
fruitMutationDropdown:Refresh(items)
end
})

fruitVariantDropdown = Tabs.Item:Dropdown({
Title = "FRUIT VARIANT WHITELIST",
Desc = "Select variants to filter",
Values = {"Click refresh to load variants"},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(selected)
fruitVariantWhitelist = selected
updateFruitVariantWhitelistNormalized()
end
})

Tabs.Item:Button({
Title = "Refresh Variants",
Callback = function()
local items = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
if ReplicatedStorage and ReplicatedStorage.Data and ReplicatedStorage.Data.EnumRegistry then
local variantEnums = require(ReplicatedStorage.Data.EnumRegistry.VariantsEnums)
if type(variantEnums) == "table" then
for variantName, _ in pairs(variantEnums) do
if type(variantName) == "string" then
table.insert(items, variantName)
end
end
end
end
table.sort(items)
fruitVariantDropdown:Refresh(items)
end
})

Tabs.Item:Toggle({
Title = "FRUIT WEIGHT FILTER",
Desc = "Enable weight filtering for fruits",
Value = false,
Callback = function(state)
fruitWeightFilterEnabled = state
end
})

Tabs.Item:Input({
Title = "Min Weight",
Placeholder = "0",
Value = "0",
Callback = function(value)
local num = tonumber(value)
if num then fruitMinWeight = num end
end
})

Tabs.Item:Input({
Title = "Max Weight",
Placeholder = "999999",
Value = "999999",
Callback = function(value)
local num = tonumber(value)
if num then fruitMaxWeight = num end
end
})

fruitUnfavoriteButton = Tabs.Item:Button({
Title = "Unfavorite All Fruits",
Desc = "Remove favorite from all fruits matching current whitelist",
Callback = function()
if fruitUnfavoriteRunning then
fruitUnfavoriteRunning = false
if fruitUnfavoriteTask then
task.cancel(fruitUnfavoriteTask)
fruitUnfavoriteTask = nil
end
fruitUnfavoriteButton:SetTitle("Unfavorite All Fruits")
if WindUI and WindUI.Notify then
WindUI:Notify({
Title = "Task Stopped",
Content = "Fruit unfavorite task stopped",
Duration = 2
})
end
return
end

local LocalPlayer = game:GetService("Players").LocalPlayer
local Backpack = LocalPlayer:FindFirstChild("Backpack")
local Character = LocalPlayer.Character
local itemsToProcess = {}

if Backpack then
for _, item in pairs(Backpack:GetChildren()) do
if item:IsA("Tool") then
table.insert(itemsToProcess, item)
end
end
end

if Character then
for _, item in pairs(Character:GetChildren()) do
if item:IsA("Tool") then
table.insert(itemsToProcess, item)
end
end
end

function checkForFruitsToUnfavorite()
local fruitCount = 0
for _, item in ipairs(itemsToProcess) do
if not item:IsA("Tool") then continue end
if not isItemFavorited(item) then continue end

local itemType = item:GetAttribute("ItemType")
local isFruit = (itemType == "Seed" or itemType == "Fruit" or item:FindFirstChild("Item_Seed")) and 
not string.find(item.Name, "Pack")

if not isFruit then continue end

if #fruitWhitelist > 0 then
local itemName = item.Name:lower()
local found = false
for fruitName, _ in pairs(fruitWhitelistNormalized) do
if itemName:find(fruitName) then
found = true
break
end
end
if not found then continue end
end

if #fruitMutationWhitelist > 0 then
local mutations = getFruitMutations(item)
local hasMutation = false
for _, mutation in ipairs(mutations) do
if fruitMutationWhitelistNormalized[mutation:lower()] then
hasMutation = true
break
end
end
if not hasMutation then continue end
end

if #fruitVariantWhitelist > 0 then
local variant = getFruitVariant(item)
if not variant or not fruitVariantWhitelistNormalized[variant:lower()] then
continue
end
end

if fruitWeightFilterEnabled then
local weight = getFruitWeight(item)
if weight then
if weight < fruitMinWeight or weight > fruitMaxWeight then
continue
end
else
continue
end
end

fruitCount = fruitCount + 1
end
return fruitCount
end

function getFruitsToUnfavorite()
local fruits = {}
for _, item in ipairs(itemsToProcess) do
if not item:IsA("Tool") then continue end
if not isItemFavorited(item) then continue end

local itemType = item:GetAttribute("ItemType")
local isFruit = (itemType == "Seed" or itemType == "Fruit" or item:FindFirstChild("Item_Seed")) and 
not string.find(item.Name, "Pack")

if not isFruit then continue end

if #fruitWhitelist > 0 then
local itemName = item.Name:lower()
local found = false
for fruitName, _ in pairs(fruitWhitelistNormalized) do
if itemName:find(fruitName) then
found = true
break
end
end
if not found then continue end
end

if #fruitMutationWhitelist > 0 then
local mutations = getFruitMutations(item)
local hasMutation = false
for _, mutation in ipairs(mutations) do
if fruitMutationWhitelistNormalized[mutation:lower()] then
hasMutation = true
break
end
end
if not hasMutation then continue end
end

if #fruitVariantWhitelist > 0 then
local variant = getFruitVariant(item)
if not variant or not fruitVariantWhitelistNormalized[variant:lower()] then
continue
end
end

if fruitWeightFilterEnabled then
local weight = getFruitWeight(item)
if weight then
if weight < fruitMinWeight or weight > fruitMaxWeight then
continue
end
else
continue
end
end

table.insert(fruits, item)
end
return fruits
end

local fruitCount = checkForFruitsToUnfavorite()

if fruitCount == 0 then
if RblxCallDialog then
RblxCallDialog({
Title = "No Fruits to Unfavorite",
Desc = "There are no fruits matching your current filters that are favorited.",
Button1 = {
Title = "OK",
Type = "White",
}
})
end
return
end

if RblxCallDialog then
RblxCallDialog({
Title = "Unfavorite Fruits",
Desc = string.format("Are you sure you want to unfavorite %d fruit(s) matching the current whitelist?", fruitCount),
Button1 = {
Title = "Cancel",
Type = "GreyOutline",
},
Button2 = {
Title = "Unfavorite",
Type = "White",
WaitTimeClick = 3,
Callback = function()
fruitUnfavoriteRunning = true
fruitUnfavoriteButton:SetTitle("Stop Task")
fruitUnfavoriteTask = task.spawn(function()
local fruitsToUnfavorite = getFruitsToUnfavorite()
local totalFruits = #fruitsToUnfavorite
local count = 0

for i, fruit in ipairs(fruitsToUnfavorite) do
if not fruitUnfavoriteRunning then break end
fruitUnfavoriteButton:SetTitle(string.format("Unfavoriting fruit %d/%d", i, totalFruits))
safeFavoriteItem(fruit)
count = count + 1
local success = waitForFavoriteIconToDisappear(fruit)
if not success then
warn("Timeout waiting for fruit to unfavorite: " .. fruit.Name)
end
task.wait(0.05)
end

if fruitUnfavoriteRunning and WindUI and WindUI.Notify then
WindUI:Notify({
Title = "Fruits Unfavorited",
Content = "Removed favorite from " .. count .. " fruits",
Duration = 3
})
end

fruitUnfavoriteRunning = false
fruitUnfavoriteButton:SetTitle("Unfavorite All Fruits")
end)
end
}
})
end
end
})

Tabs.Item:Space()
Tabs.Item:Divider()
Tabs.Item:Section({ Title = "PET FAVORITE", TextSize = 18 })

local petFavoriteEnabled = false
local petFavoriteTask = nil
local petUnfavoriteTask = nil
local petWhitelist = {}
local petWhitelistNormalized = {}
local petMutationWhitelist = {}
local petMutationWhitelistNormalized = {}
local petVariantWhitelist = {}
local petVariantWhitelistNormalized = {}
local petWeightFilterEnabled = false
local petMinWeight = 0
local petMaxWeight = 999999
local petAgeFilterEnabled = false
local petMinAge = 0
local petMaxAge = 999999
local petUnfavoriteButton = nil
local petUnfavoriteRunning = false
local petFavoriteButton = nil
local petFavoriteRunning = false

function updatePetWhitelistNormalized()
petWhitelistNormalized = {}
for _, petData in pairs(petWhitelist) do
local petName = petData.Title or petData
if type(petName) == "string" then
petWhitelistNormalized[petName:lower()] = true
end
end
end

function updatePetMutationWhitelistNormalized()
petMutationWhitelistNormalized = {}
for _, mutationData in pairs(petMutationWhitelist) do
local mutationName = mutationData.Title or mutationData
if type(mutationName) == "string" then
petMutationWhitelistNormalized[mutationName:lower()] = true
end
end
end

function updatePetVariantWhitelistNormalized()
petVariantWhitelistNormalized = {}
for _, variantData in pairs(petVariantWhitelist) do
local variantName = variantData.Title or variantData
if type(variantName) == "string" then
petVariantWhitelistNormalized[variantName:lower()] = true
end
end
end

function getPetMutations(item)
local mutations = {}
for attrName, attrValue in pairs(item:GetAttributes()) do
if type(attrValue) == "boolean" and attrValue == true then
table.insert(mutations, attrName)
end
end
return mutations
end

function getPetVariant(item)
local variant = item:FindFirstChild("Variant")
if variant and variant:IsA("StringValue") and variant.Value ~= "" then
return variant.Value
end
local variantAttr = item:GetAttribute("Variant")
if variantAttr and variantAttr ~= "" then
return tostring(variantAttr)
end
return nil
end

function getPetWeight(item)
local weightAttr = item:GetAttribute("Weight")
if weightAttr then
return tonumber(weightAttr)
end
local name = item.Name
local weightMatch = name:match("%[(%d+%.?%d*)%s*KG%]")
if weightMatch then
return tonumber(weightMatch)
end
return nil
end

function getPetAge(item)
local ageAttr = item:GetAttribute("Age")
if ageAttr then
return tonumber(ageAttr)
end
local name = item.Name
local ageMatch = name:match("%[Age%s*(%d+)%]") or name:match("%[(%d+)%s*Age%]")
if ageMatch then
return tonumber(ageMatch)
end
return nil
end

function shouldFavoritePet(item)
if not item or not item:IsA("Tool") then return false end
if isItemFavorited(item) then
return false
end

local itemType = item:GetAttribute("ItemType")
if itemType ~= "Pet" then return false end

if #petWhitelist > 0 then
local itemName = item.Name:lower()
local found = false
for petName, _ in pairs(petWhitelistNormalized) do
if itemName:find(petName) then
found = true
break
end
end
if not found then return false end
end

if #petMutationWhitelist > 0 then
local mutations = getPetMutations(item)
local hasMutation = false
for _, mutation in ipairs(mutations) do
if petMutationWhitelistNormalized[mutation:lower()] then
hasMutation = true
break
end
end
if not hasMutation then return false end
end

if #petVariantWhitelist > 0 then
local variant = getPetVariant(item)
if not variant or not petVariantWhitelistNormalized[variant:lower()] then
return false
end
end

if petWeightFilterEnabled then
local weight = getPetWeight(item)
if weight then
if weight < petMinWeight or weight > petMaxWeight then
return false
end
else
return false
end
end

if petAgeFilterEnabled then
local age = getPetAge(item)
if age then
if age < petMinAge or age > petMaxAge then
return false
end
else
return false
end
end

return true
end

function getPetsToProcess(itemsToProcess)
local pets = {}
for _, item in ipairs(itemsToProcess) do
if item:IsA("Tool") and shouldFavoritePet(item) then
table.insert(pets, item)
end
end
return pets
end

petFavoriteButton = Tabs.Item:Toggle({
Title = "Auto Favorite Pets",
Desc = "Automatically favorite pets matching filters",
Value = false,
Callback = function(state)
petFavoriteEnabled = state
if state then
petFavoriteRunning = true
petFavoriteButton:SetTitle("Stop Task")
petFavoriteTask = task.spawn(function()
local LocalPlayer = game:GetService("Players").LocalPlayer
while petFavoriteEnabled and petFavoriteRunning do
local Backpack = LocalPlayer:FindFirstChild("Backpack")
local Character = LocalPlayer.Character
local allItems = {}

if Backpack then
for _, item in pairs(Backpack:GetChildren()) do
if item:IsA("Tool") then
table.insert(allItems, item)
end
end
end

if Character then
for _, item in pairs(Character:GetChildren()) do
if item:IsA("Tool") then
table.insert(allItems, item)
end
end
end

-- Get only pets that should be favorited
local petsToFavorite = getPetsToProcess(allItems)
local totalPets = #petsToFavorite

for i, pet in ipairs(petsToFavorite) do
if not petFavoriteEnabled or not petFavoriteRunning then break end
petFavoriteButton:SetTitle(string.format("Favoriting pet %d/%d", i, totalPets))
safeFavoriteItem(pet)
local success = waitForFavoriteIconToAppear(pet)
if not success then
warn("Timeout waiting for pet to favorite: " .. pet.Name)
end
task.wait(0.05)
end

if petFavoriteEnabled and petFavoriteRunning then
task.wait(1)
end
end
petFavoriteRunning = false
petFavoriteButton:SetTitle("Auto Favorite Pets")
end)
else
petFavoriteRunning = false
petFavoriteButton:SetTitle("Auto Favorite Pets")
if petFavoriteTask then
task.cancel(petFavoriteTask)
petFavoriteTask = nil
end
end
end
})

petNameDropdown = Tabs.Item:Dropdown({
Title = "PET NAME WHITELIST",
Desc = "Select specific pets to favorite",
Values = {"Click refresh to load pets"},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(selected)
petWhitelist = selected
updatePetWhitelistNormalized()
end
})

Tabs.Item:Button({
Title = "Refresh Pet List",
Callback = function()
local items = {}
if PetList then
for petName, petInfo in pairs(PetList) do
table.insert(items, {
Title = petInfo.DisplayName or petName,
Desc = "Rarity: " .. (petInfo.Rarity or "Unknown"),
Icon = petInfo.Icon or ""
})
end
table.sort(items, function(a, b) return a.Title < b.Title end)
end
petNameDropdown:Refresh(items)
end
})

petMutationDropdown = Tabs.Item:Dropdown({
Title = "PET MUTATION WHITELIST",
Desc = "Select mutations to filter",
Values = {"Click refresh to load mutations"},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(selected)
petMutationWhitelist = selected
updatePetMutationWhitelistNormalized()
end
})

Tabs.Item:Button({
Title = "Refresh Mutations",
Callback = function()
local items = {}
if MutationHandler and MutationHandler.GetMutations then
local mutations = MutationHandler:GetMutations()
for _, mutation in pairs(mutations) do
if mutation.Name then
table.insert(items, mutation.Name)
end
end
table.sort(items)
end
petMutationDropdown:Refresh(items)
end
})

petVariantDropdown = Tabs.Item:Dropdown({
Title = "PET VARIANT WHITELIST",
Desc = "Select variants to filter",
Values = {"Click refresh to load variants"},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(selected)
petVariantWhitelist = selected
updatePetVariantWhitelistNormalized()
end
})

Tabs.Item:Button({
Title = "Refresh Variants",
Callback = function()
local items = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
if ReplicatedStorage and ReplicatedStorage.Data and ReplicatedStorage.Data.EnumRegistry then
local variantEnums = require(ReplicatedStorage.Data.EnumRegistry.VariantsEnums)
if type(variantEnums) == "table" then
for variantName, _ in pairs(variantEnums) do
if type(variantName) == "string" then
table.insert(items, variantName)
end
end
end
end
table.sort(items)
petVariantDropdown:Refresh(items)
end
})

Tabs.Item:Toggle({
Title = "PET WEIGHT FILTER",
Desc = "Enable weight filtering for pets",
Value = false,
Callback = function(state)
petWeightFilterEnabled = state
end
})

Tabs.Item:Input({
Title = "Min Weight",
Placeholder = "0",
Value = "0",
Callback = function(value)
local num = tonumber(value)
if num then petMinWeight = num end
end
})

Tabs.Item:Input({
Title = "Max Weight",
Placeholder = "999999",
Value = "999999",
Callback = function(value)
local num = tonumber(value)
if num then petMaxWeight = num end
end
})

Tabs.Item:Toggle({
Title = "PET AGE FILTER",
Desc = "Enable age filtering for pets",
Value = false,
Callback = function(state)
petAgeFilterEnabled = state
end
})

Tabs.Item:Input({
Title = "Min Age",
Placeholder = "0",
Value = "0",
Callback = function(value)
local num = tonumber(value)
if num then petMinAge = num end
end
})

Tabs.Item:Input({
Title = "Max Age",
Placeholder = "999999",
Value = "999999",
Callback = function(value)
local num = tonumber(value)
if num then petMaxAge = num end
end
})

petUnfavoriteButton = Tabs.Item:Button({
Title = "Unfavorite All Pets",
Desc = "Remove favorite from all pets matching current whitelist",
Callback = function()
if petUnfavoriteRunning then
petUnfavoriteRunning = false
if petUnfavoriteTask then
task.cancel(petUnfavoriteTask)
petUnfavoriteTask = nil
end
petUnfavoriteButton:SetTitle("Unfavorite All Pets")
if WindUI and WindUI.Notify then
WindUI:Notify({
Title = "Task Stopped",
Content = "Pet unfavorite task stopped",
Duration = 2
})
end
return
end

local LocalPlayer = game:GetService("Players").LocalPlayer
local Backpack = LocalPlayer:FindFirstChild("Backpack")
local Character = LocalPlayer.Character
local itemsToProcess = {}

if Backpack then
for _, item in pairs(Backpack:GetChildren()) do
if item:IsA("Tool") then
table.insert(itemsToProcess, item)
end
end
end

if Character then
for _, item in pairs(Character:GetChildren()) do
if item:IsA("Tool") then
table.insert(itemsToProcess, item)
end
end
end

function checkForPetsToUnfavorite()
local petCount = 0
for _, item in ipairs(itemsToProcess) do
if not item:IsA("Tool") then continue end
if not isItemFavorited(item) then continue end

local itemType = item:GetAttribute("ItemType")
if itemType ~= "Pet" then continue end

if #petWhitelist > 0 then
local itemName = item.Name:lower()
local found = false
for petName, _ in pairs(petWhitelistNormalized) do
if itemName:find(petName) then
found = true
break
end
end
if not found then continue end
end

if #petMutationWhitelist > 0 then
local mutations = getPetMutations(item)
local hasMutation = false
for _, mutation in ipairs(mutations) do
if petMutationWhitelistNormalized[mutation:lower()] then
hasMutation = true
break
end
end
if not hasMutation then continue end
end

if #petVariantWhitelist > 0 then
local variant = getPetVariant(item)
if not variant or not petVariantWhitelistNormalized[variant:lower()] then
continue
end
end

if petWeightFilterEnabled then
local weight = getPetWeight(item)
if weight then
if weight < petMinWeight or weight > petMaxWeight then
continue
end
else
continue
end
end

if petAgeFilterEnabled then
local age = getPetAge(item)
if age then
if age < petMinAge or age > petMaxAge then
continue
end
else
continue
end
end

petCount = petCount + 1
end
return petCount
end

function getPetsToUnfavorite()
local pets = {}
for _, item in ipairs(itemsToProcess) do
if not item:IsA("Tool") then continue end
if not isItemFavorited(item) then continue end

local itemType = item:GetAttribute("ItemType")
if itemType ~= "Pet" then continue end

if #petWhitelist > 0 then
local itemName = item.Name:lower()
local found = false
for petName, _ in pairs(petWhitelistNormalized) do
if itemName:find(petName) then
found = true
break
end
end
if not found then continue end
end

if #petMutationWhitelist > 0 then
local mutations = getPetMutations(item)
local hasMutation = false
for _, mutation in ipairs(mutations) do
if petMutationWhitelistNormalized[mutation:lower()] then
hasMutation = true
break
end
end
if not hasMutation then continue end
end

if #petVariantWhitelist > 0 then
local variant = getPetVariant(item)
if not variant or not petVariantWhitelistNormalized[variant:lower()] then
continue
end
end

if petWeightFilterEnabled then
local weight = getPetWeight(item)
if weight then
if weight < petMinWeight or weight > petMaxWeight then
continue
end
else
continue
end
end

if petAgeFilterEnabled then
local age = getPetAge(item)
if age then
if age < petMinAge or age > petMaxAge then
continue
end
else
continue
end
end

table.insert(pets, item)
end
return pets
end

local petCount = checkForPetsToUnfavorite()

if petCount == 0 then
if RblxCallDialog then
RblxCallDialog({
Title = "No Pets to Unfavorite",
Desc = "There are no pets matching your current filters that are favorited.",
Button1 = {
Title = "OK",
Type = "White",
}
})
end
return
end

if RblxCallDialog then
RblxCallDialog({
Title = "Unfavorite Pets",
Desc = string.format("Are you sure you want to unfavorite %d pet(s) matching the current whitelist?", petCount),
Button1 = {
Title = "Cancel",
Type = "GreyOutline",
},
Button2 = {
Title = "Unfavorite",
Type = "White",
WaitTimeClick = 3,
Callback = function()
petUnfavoriteRunning = true
petUnfavoriteButton:SetTitle("Stop Task")
petUnfavoriteTask = task.spawn(function()
local petsToUnfavorite = getPetsToUnfavorite()
local totalPets = #petsToUnfavorite
local count = 0

for i, pet in ipairs(petsToUnfavorite) do
if not petUnfavoriteRunning then break end
petUnfavoriteButton:SetTitle(string.format("Unfavoriting pet %d/%d", i, totalPets))
safeFavoriteItem(pet)
count = count + 1
local success = waitForFavoriteIconToDisappear(pet)
if not success then
warn("Timeout waiting for pet to unfavorite: " .. pet.Name)
end
task.wait(0.05)
end

if petUnfavoriteRunning and WindUI and WindUI.Notify then
WindUI:Notify({
Title = "Pets Unfavorited",
Content = "Removed favorite from " .. count .. " pets",
Duration = 3
})
end

petUnfavoriteRunning = false
petUnfavoriteButton:SetTitle("Unfavorite All Pets")
end)
end
}
})
end
end
})
Tabs.Visuals:Section({ Title = "Visual", TextSize = 20 })
Tabs.Visuals:Divider()
cameraStretchConnection = nil
function setupCameraStretch()
cameraStretchConnection = nil
stretchHorizontal = 0.80
stretchVertical = 0.80
CameraStretchToggle = Tabs.Visuals:Toggle({
Title = "Camera Stretch",
Flag = "CameraStretchToggle",
Value = false,
Callback = function(state)
if state then
if cameraStretchConnection then cameraStretchConnection:Disconnect() end
cameraStretchConnection = RunService.RenderStepped:Connect(function()
Camera = workspace.CurrentCamera
Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, stretchHorizontal, 0, 0, 0, stretchVertical, 0, 0, 0, 1)
end)
else
if cameraStretchConnection then
cameraStretchConnection:Disconnect()
cameraStretchConnection = nil
end
end
end
})
CameraStretchHorizontalInput = Tabs.Visuals:Input({
Title = "Camera Stretch Horizontal",
Flag = "CameraStretchHorizontalInput",
Placeholder = "0.80",
Numeric = true,
Value = tostring(stretchHorizontal),
Callback = function(value)
num = tonumber(value)
if num then
stretchHorizontal = num
if cameraStretchConnection then
cameraStretchConnection:Disconnect()
cameraStretchConnection = RunService.RenderStepped:Connect(function()
Camera = workspace.CurrentCamera
Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, stretchHorizontal, 0, 0, 0, stretchVertical, 0, 0, 0, 1)
end)
end
end
end
})
CameraStretchVerticalInput = Tabs.Visuals:Input({
Title = "Camera Stretch Vertical",
Flag = "CameraStretchVerticalInput",
Placeholder = "0.80",
Numeric = true,
Value = tostring(stretchVertical),
Callback = function(value)
num = tonumber(value)
if num then
stretchVertical = num
if cameraStretchConnection then
cameraStretchConnection:Disconnect()
cameraStretchConnection = RunService.RenderStepped:Connect(function()
Camera = workspace.CurrentCamera
Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, stretchHorizontal, 0, 0, 0, stretchVertical, 0, 0, 0, 1)
end)
end
end
end
})
end
FullBrightToggle = Tabs.Visuals:Toggle({
Title = "Full Bright",
Flag = "FullBrightToggle",
Desc = "Ya Like drinking Night Vision while mining in da cave and sceard of creeper blow you up dawg?",
Value = false,
Callback = function(state)
FullBright = state
if state then
originalBrightness = Lighting.Brightness
originalAmbient = Lighting.Ambient
originalOutdoorAmbient = Lighting.OutdoorAmbient
originalColorShiftBottom = Lighting.ColorShift_Bottom
originalColorShiftTop = Lighting.ColorShift_Top
function applyFullBright()
if Lighting.Brightness ~= 1 then
Lighting.Brightness = 1
end
if Lighting.Ambient ~= Color3.new(1, 1, 1) then
Lighting.Ambient = Color3.new(1, 1, 1)
end
if Lighting.OutdoorAmbient ~= Color3.new(1, 1, 1) then
Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
end
if Lighting.ColorShift_Bottom ~= Color3.new(1, 1, 1) then
Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
end
if Lighting.ColorShift_Top ~= Color3.new(1, 1, 1) then
Lighting.ColorShift_Top = Color3.new(1, 1, 1)
end
end
applyFullBright()
if fullBrightConnection then
fullBrightConnection:Disconnect()
end
fullBrightConnection = RunService.Heartbeat:Connect(function()
if FullBright then
applyFullBright()
end
end)
fullBrightCharConnection = game.Players.LocalPlayer.CharacterAdded:Connect(function()
task.wait(1)
if FullBright then
applyFullBright()
end
end)
else
if fullBrightConnection then
fullBrightConnection:Disconnect()
fullBrightConnection = nil
end
if fullBrightCharConnection then
fullBrightCharConnection:Disconnect()
fullBrightCharConnection = nil
end
if originalBrightness then
Lighting.Brightness = originalBrightness
Lighting.Ambient = originalAmbient
Lighting.OutdoorAmbient = originalOutdoorAmbient
Lighting.ColorShift_Bottom = originalColorShiftBottom
Lighting.ColorShift_Top = originalColorShiftTop
end
end
end
})
FOVSlider = Tabs.Visuals:Slider({
Title = "Field of View",
Flag = "FOVSlider",
Value = { Min = 1, Max = 120, Default = 70, Step = 1 },
Callback = function(value)
workspace.CurrentCamera.FieldOfView = tonumber(value)
end
})
setupCameraStretch()
xRay = false
Tabs.Visuals:Toggle({
Title = "X-ray Vision",
Compact = true,
Callback = function(state)
xRay = state
for _, part in pairs(workspace:GetDescendants()) do
if part:IsA("BasePart") and not part:IsDescendantOf(LocalPlayer.Character) then
part.LocalTransparencyModifier = state and 0.7 or 0
end
end
end
})
Tabs.Visuals:Button({
Title = "Shit Render", 
Callback = function()
Terrain = workspace:FindFirstChildOfClass("Terrain")
Players = Players
LocalPlayer = Players.LocalPlayer
Lighting.GlobalShadows = false
Lighting.FogEnd = 1e10
Lighting.Brightness = 1
if Terrain then
Terrain.WaterWaveSize = 0
Terrain.WaterWaveSpeed = 0
Terrain.WaterReflectance = 0
Terrain.WaterTransparency = 1
end
for _, obj in ipairs(workspace:GetDescendants()) do
if obj:IsA("BasePart") then
obj.Material = Enum.Material.Plastic
obj.Reflectance = 0
elseif obj:IsA("Decal") or obj:IsA("Texture") then
obj:Destroy()
elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
obj:Destroy()
elseif obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
obj:Destroy()
end
end
for _, LocalPlayer in ipairs(Players:GetPlayers()) do
char = LocalPlayer.Character
if char then
for _, part in ipairs(char:GetDescendants()) do
if part:IsA("Accessory") or part:IsA("Clothing") then
part:Destroy()
end
end
end
end
end
})
local guiController = require(ReplicatedStorage.Modules.GuiController)
local shopControllers = {
TravelingMerchant = require(ReplicatedStorage.Modules.TravelingMerchantShopUIController),
EggShop = require(ReplicatedStorage.Modules.EggShopUIController),
CosmeticShop = require(ReplicatedStorage.Modules.CosmeticShopUIController),
GardenCoinShop = require(ReplicatedStorage.Modules.GardenCoinShopController),
GearShop = require(ReplicatedStorage.Modules.GearShopController),
SeedShop = require(ReplicatedStorage.Modules.SeedShopController),
CarrotCoinShop = require(ReplicatedStorage.Modules.GardenGames.CarrotCoinShopUIController),
SeasonPass = require(ReplicatedStorage.Modules.SeasonPass.SeasonPassUIController)
}
local recipeRegistry = require(ReplicatedStorage.Data.CraftingData.CraftingRecipeRegistry)
local seasonPassToggler = require(ReplicatedStorage.Modules.SeasonPass.SeasonPassToggler)
function openShop(controller, guiName, shopName)
controller:Start()
local shopGui = LocalPlayer.PlayerGui:WaitForChild(guiName, 5)
if not shopGui then
warn("Failed to load " .. shopName .. " UI")
return
end
guiController:Open(shopGui)
local mainFrame = shopGui:FindFirstChild("Frame") or shopGui:FindFirstChild("Shadow") or shopGui:FindFirstChild("SeasonPassFrame")
if mainFrame then
local exitButton = mainFrame:FindFirstChild("ExitButton", true) or mainFrame:FindFirstChild("Close", true)
if exitButton then
exitButton.Activated:Connect(function()
guiController:Close(shopGui)
end)
end
function makeButtonsClickable(container)
if not container then return end
for _, button in ipairs(container:GetDescendants()) do
if button:IsA("TextButton") or button:IsA("ImageButton") then
button.Active = true
end
end
end
local scrollingFrame = mainFrame:FindFirstChild("ScrollingFrame", true)
if scrollingFrame then
for _, item in ipairs(scrollingFrame:GetChildren()) do
if item:IsA("Frame") and not item.Name:match("Padding") then
local mainItemFrame = item:FindFirstChild("Main_Frame") or item:FindFirstChild("MainFrame") or item
if mainItemFrame then
local buyButtons = {"Sheckles_Buy", "Robux_Buy", "Gift", "Buy", "CraftButton", "OddsButton", "InfoButton"}
for _, buttonName in ipairs(buyButtons) do
local button = mainItemFrame:FindFirstChild(buttonName, true)
if button then
button.Active = true
end
end
end
end
end
end
local restockButton = mainFrame:FindFirstChild("Restock", true)
if restockButton then
restockButton.Active = true
end
local adButton = mainFrame:FindFirstChild("RewardAd", true)
if adButton then
adButton.Active = true
end
if shopName == "SeasonPass" then
local topBtns = mainFrame:FindFirstChild("TopBtns")
if topBtns then
makeButtonsClickable(topBtns)
end
local premiumSection = mainFrame:FindFirstChild("PremiumSection")
if premiumSection then
makeButtonsClickable(premiumSection)
end
local main = mainFrame:FindFirstChild("Main")
if main then
for _, section in ipairs({"Rewards", "Quests", "Store"}) do
local sectionFrame = main:FindFirstChild(section)
if sectionFrame then
makeButtonsClickable(sectionFrame)
end
end
end
end
end
end
function openCrafting(machineType)
local tempObject = Instance.new("Part")
tempObject.Name = "TempCraftingObject"
tempObject.Anchored = true
tempObject.CanCollide = false
tempObject.Transparency = 1
tempObject.Parent = workspace
tempObject:SetAttribute("CraftingObjectId", "TempObject_" .. tostring(math.random(1, 999999)))
tempObject:SetAttribute("CraftingObjectType", machineType)
local openRecipeEvent = ReplicatedStorage.GameEvents.OpenRecipeBindableEvent
if openRecipeEvent then
openRecipeEvent:Fire(tempObject)
end
local craftingGui = LocalPlayer.PlayerGui:WaitForChild("RecipeSelection_UI", 5)
if craftingGui then
guiController:Open(craftingGui)
local mainFrame = craftingGui:FindFirstChild("Frame")
if mainFrame then
local exitButton = mainFrame.Frame:FindFirstChild("ExitButton")
if exitButton then
exitButton.Activated:Connect(function()
guiController:Close(craftingGui)
if tempObject and tempObject.Parent then
tempObject:Destroy()
end
end)
end
local scrollingFrame = mainFrame:FindFirstChild("ScrollingFrame")
if scrollingFrame then
for _, item in ipairs(scrollingFrame:GetChildren()) do
if item:IsA("Frame") and item.Name ~= "ItemPadding" then
local mainItemFrame = item:FindFirstChild("Main_Frame")
if mainItemFrame then
local craftButton = mainItemFrame:FindFirstChild("CraftButton")
if craftButton then
craftButton.Active = true
end
local robuxBuy = mainItemFrame:FindFirstChild("Robux_Buy")
if robuxBuy then
robuxBuy.Active = true
end
local infoButton = mainItemFrame:FindFirstChild("InfoButton")
if infoButton then
infoButton.Active = true
end
local oddsButton = mainItemFrame:FindFirstChild("OddsButton")
if oddsButton then
oddsButton.Active = true
end
end
end
end
end
end
end
end
Tabs.Visuals:Section({ Title = "Open Shops UI" })
Tabs.Visuals:Space()
Tabs.Visuals:Button({
Title = "Open Traveling Merchant Shop",
Callback = function()
openShop(shopControllers.TravelingMerchant, "TravelingMerchantShop_UI", "Traveling Merchant")
end
})
Tabs.Visuals:Space()
Tabs.Visuals:Button({
Title = "Open Egg Shop",
Callback = function()
openShop(shopControllers.EggShop, "PetShop_UI", "Egg Shop")
end
})
Tabs.Visuals:Space()
Tabs.Visuals:Button({
Title = "Open Cosmetic Shop",
Callback = function()
openShop(shopControllers.CosmeticShop, "CosmeticShop_UI", "Cosmetic Shop")
end
})
Tabs.Visuals:Space()
Tabs.Visuals:Button({
Title = "Open Garden Coin Shop",
Callback = function()
openShop(shopControllers.GardenCoinShop, "GardenCoinShop_UI", "Garden Coin Shop")
end
})
Tabs.Visuals:Space()
Tabs.Visuals:Button({
Title = "Open Gear Shop",
Callback = function()
openShop(shopControllers.GearShop, "Gear_Shop", "Gear Shop")
end
})
Tabs.Visuals:Space()
Tabs.Visuals:Button({
Title = "Open Seed Shop",
Callback = function()
openShop(shopControllers.SeedShop, "Seed_Shop", "Seed Shop")
end
})
Tabs.Visuals:Space()
Tabs.Visuals:Button({
Title = "Open Carrot Coin Shop",
Callback = function()
openShop(shopControllers.CarrotCoinShop, "BuyCarrotsUI", "Carrot Coin Shop")
end
})
Tabs.Visuals:Section({ Title = "Open Game Pass UI" })
Tabs.Visuals:Space()
Tabs.Visuals:Button({
Title = "Open Season Pass",
Callback = function()
seasonPassToggler:Toggle()
openShop(shopControllers.SeasonPass, "SeasonPassUI", "Season Pass")
end
})
Tabs.Visuals:Section({ Title = "Open Crating Table UI" })
for machineType, _ in pairs(recipeRegistry.RecipiesSortedByMachineType) do
Tabs.Visuals:Button({
Title = "Open " .. machineType .. " Crafting",
Callback = function()
openCrafting(machineType)
end
})
end
CalculatePlantValue = require(ReplicatedStorage.Modules.CalculatePlantValue)
fruitEspBoxes = {}
playerEspBoxes = {}
activeConnections = {}
renderConnection = nil
fruitEspEnabled = false
playerEspEnabled = false
currentFruitBoxType = "2D"
currentPlayerBoxType = "2D"
playerEspElements = {}
fruitEspElements = {}
cachedPlayers = {}
lastPlayerCacheUpdate = 0
lastFruitUpdate = 0
fruitUpdateInterval = 0.2
PlayerESP = {
names = false,
distance = false,
}
PlayerHighlights = false
FruitESP = {
names = false,
distance = false,
weight = false,
mutations = false,
Value = false,
variant = false,
}
FruitHighlights = false
fruitWhitelist = {}
mutationWhitelist = {}
variantWhitelist = {}
fruitWhitelistNormalized = {}
mutationWhitelistNormalized = {}
variantWhitelistNormalized = {}
fruitNamesCache = {}
highlightedFruits = {}
fruitColorCache = {}
fruitValueCache = {}
weightMin = 0
weightMax = 100
weightWhitelistEnabled = false
valueMin = 0
valueMax = 999999999
valueFilterEnabled = false
variantFilterEnabled = false
CONFIG = {
MAX_BOX_SIZE = 100,
MIN_BOX_SIZE = 5,
BASE_MULTIPLIER = 12,
DISTANCE_FALLOFF = 30,
PADDING_X = 4,
PADDING_Y = 6
}
function getFruitPosition(fruitPart)
if fruitPart:IsA("BasePart") then
return fruitPart.Position
elseif fruitPart:IsA("Model") then
return fruitPart:GetPivot().Position
end
return Vector3.new(0, 0, 0)
end
function getFruitVisualPart(fruitPart)
if fruitPart:IsA("BasePart") then
return fruitPart
elseif fruitPart:IsA("Model") then
return fruitPart:FindFirstChildWhichIsA("BasePart") or fruitPart
end
return fruitPart
end
function updateFruitWhitelistNormalized()
fruitWhitelistNormalized = {}
for _, fruitData in pairs(fruitWhitelist) do
fruitName = fruitData.Title or fruitData
if type(fruitName) == "string" then
fruitWhitelistNormalized[fruitName:lower()] = true
end
end
mutationWhitelistNormalized = {}
for _, mutationData in pairs(mutationWhitelist) do
mutationName = mutationData.Title or mutationData
if type(mutationName) == "string" then
mutationWhitelistNormalized[mutationName:lower()] = true
end
end
variantWhitelistNormalized = {}
for _, variantData in pairs(variantWhitelist) do
variantName = variantData.Title or variantData
if type(variantName) == "string" then
variantWhitelistNormalized[variantName:lower()] = true
end
end
end
function getFruitDisplayName(fruitName)
return fruitName
end
function getFruitValue(fruitObj)
if not fruitObj then return 0 end
fruitId = fruitObj:GetFullName()
if fruitValueCache[fruitId] and tick() - fruitValueCache[fruitId].timestamp < 5 then
return fruitValueCache[fruitId].value
end
success, value = pcall(function()
return CalculatePlantValue(fruitObj)
end)
if success and value and type(value) == "number" and value > 0 then
fruitValueCache[fruitId] = {
value = value,
timestamp = tick()
}
if #fruitValueCache > 200 then
newCache = {}
count = 0
for k, v in pairs(fruitValueCache) do
if count < 100 then
newCache[k] = v
count = count + 1
else
break
end
end
fruitValueCache = newCache
end
return value
end
return 0
end
function checkFruitMutation(fruitObj)
if not fruitObj then return nil end
attributes = fruitObj:GetAttributes()
for attrName, attrValue in pairs(attributes) do
if type(attrValue) == "boolean" and attrValue == true then
attrLower = attrName:lower()
if #mutationWhitelist == 0 or mutationWhitelistNormalized[attrLower] then
return attrName
end
end
end
return nil
end
function checkFruitVariant(fruitObj)
if not fruitObj then return nil end
variant = fruitObj:FindFirstChild("Variant")
if variant and variant:IsA("StringValue") and variant.Value ~= "" then
return variant.Value
end
variantAttr = fruitObj:GetAttribute("Variant")
if variantAttr and variantAttr ~= "" then
return tostring(variantAttr)
end
parent = fruitObj.Parent
if parent then
parentVariant = parent:FindFirstChild("Variant")
if parentVariant and parentVariant:IsA("StringValue") and parentVariant.Value ~= "" then
return parentVariant.Value
end
parentVariantAttr = parent:GetAttribute("Variant")
if parentVariantAttr and parentVariantAttr ~= "" then
return tostring(parentVariantAttr)
end
grandParent = parent.Parent
if grandParent then
grandVariant = grandParent:FindFirstChild("Variant")
if grandVariant and grandVariant:IsA("StringValue") and grandVariant.Value ~= "" then
return grandVariant.Value
end
grandVariantAttr = grandParent:GetAttribute("Variant")
if grandVariantAttr and grandVariantAttr ~= "" then
return tostring(grandVariantAttr)
end
end
end
return nil
end
function getFruitWeight(fruitObj)
if not fruitObj then return 0 end
weightObject = fruitObj:FindFirstChild("Weight")
if weightObject and weightObject:IsA("ObjectValue") then
weightValue = weightObject.Value
if weightValue and typeof(weightValue) == "number" then
return weightValue
end
end
numberValue = fruitObj:FindFirstChild("Weight")
if numberValue and numberValue:IsA("NumberValue") then
return numberValue.Value
end
weightAttr = fruitObj:GetAttribute("Weight")
if weightAttr and typeof(weightAttr) == "number" then
return weightAttr
end
return 0
end
function isFruitWhitelisted(fruitObj)
if not fruitObj then return false end
fruitName = fruitObj.Name
fruitNameLower = fruitName:lower()
if #fruitWhitelist > 0 and not fruitWhitelistNormalized[fruitNameLower] then
return false
end
if #mutationWhitelist > 0 then
mutation = checkFruitMutation(fruitObj)
if not mutation or not mutationWhitelistNormalized[mutation:lower()] then
return false
end
end
if variantFilterEnabled and #variantWhitelist > 0 then
variant = checkFruitVariant(fruitObj)
if not variant or not variantWhitelistNormalized[variant:lower()] then
return false
end
end
if weightWhitelistEnabled then
weight = getFruitWeight(fruitObj)
if weight < weightMin or weight > weightMax then
return false
end
end
if valueFilterEnabled then
value = getFruitValue(fruitObj)
if value < valueMin or value > valueMax then
return false
end
end
return true
end
function getMyFarm()
myUsername = LocalPlayer.Name
farmFolder = Workspace:FindFirstChild("Farm")
if not farmFolder then return nil end
for _, plot in pairs(farmFolder:GetChildren()) do
sign = plot:FindFirstChild("Sign")
if sign then
owner = sign:GetAttribute("_owner")
if owner and owner == myUsername then
return plot
end
end
end
return nil
end
function getFruitColor(fruitPart)
if not fruitPart then return Color3.fromRGB(255, 215, 0) end
local visualPart = getFruitVisualPart(fruitPart)
if visualPart and visualPart:IsA("BasePart") then
partColor = visualPart.Color
if partColor.R < 0.95 or partColor.G < 0.95 or partColor.B < 0.95 then
return partColor
end
end
if fruitPart:IsA("Model") then
descendants = fruitPart:GetDescendants()
for _, descendant in ipairs(descendants) do
if descendant:IsA("BasePart") then
descendantColor = descendant.Color
if descendantColor.R < 0.95 or descendantColor.G < 0.95 or descendantColor.B < 0.95 then
return descendantColor
end
elseif descendant:IsA("MeshPart") then
descendantColor = descendant.Color
if descendantColor.R < 0.95 or descendantColor.G < 0.95 or descendantColor.B < 0.95 then
return descendantColor
end
end
end
end
return Color3.fromRGB(255, 215, 0)
end
function getMutationColor(mutationName)
mutationColors = {
["Fire"] = Color3.fromRGB(255, 100, 100),
["Ice"] = Color3.fromRGB(100, 200, 255),
["Poison"] = Color3.fromRGB(150, 255, 100),
["Electric"] = Color3.fromRGB(255, 255, 100),
["Golden"] = Color3.fromRGB(255, 215, 0),
["Crystal"] = Color3.fromRGB(200, 100, 255),
["Mega"] = Color3.fromRGB(255, 150, 50),
["Tiny"] = Color3.fromRGB(150, 150, 255),
["Radioactive"] = Color3.fromRGB(100, 255, 100),
["Shadow"] = Color3.fromRGB(100, 100, 100),
["Rainbow"] = Color3.fromRGB(255, 100, 255)
}
lowerMutation = mutationName:lower()
for mutationKey, color in pairs(mutationColors) do
if lowerMutation:find(mutationKey:lower()) then
return color
end
end
return Color3.fromRGB(200, 200, 200)
end
function getVariantColor(variantName)
variantColors = {
["Normal"] = Color3.fromRGB(200, 200, 200),
["Gold"] = Color3.fromRGB(255, 215, 0),
["Rainbow"] = Color3.fromRGB(255, 100, 255),
["Silver"] = Color3.fromRGB(192, 192, 192),
["Diamond"] = Color3.fromRGB(185, 242, 255),
["Crystal"] = Color3.fromRGB(170, 255, 255),
["Shadow"] = Color3.fromRGB(80, 80, 80),
["Lava"] = Color3.fromRGB(255, 100, 0),
["Frost"] = Color3.fromRGB(150, 255, 255),
["Nature"] = Color3.fromRGB(100, 255, 100)
}
lowerVariant = variantName:lower()
for variantKey, color in pairs(variantColors) do
if lowerVariant:find(variantKey:lower()) then
return color
end
end
return Color3.fromRGB(147, 112, 219)
end
function cleanupPlayerESP()
for target, esp in pairs(playerEspElements) do
if esp.billboardData then
esp.billboardData.billboard:Destroy()
end
end
playerEspElements = {}
end
function cleanupFruitESP()
for target, esp in pairs(fruitEspElements) do
if esp.billboardData then
esp.billboardData.billboard:Destroy()
end
end
fruitEspElements = {}
fruitColorCache = {}
end
function getDistanceFromPlayer(targetPosition)
if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return 0 end
return (targetPosition - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
end
function getTeamColor(LocalPlayer)
local team = LocalPlayer.Team
if team then
return team.TeamColor.Color
end
return Color3.fromRGB(0, 255, 0)
end
function createBillboard(fruitPart, fruitObj)
billboard = Instance.new("BillboardGui")
billboard.Name = "EspBillboard"
billboard.Adornee = getFruitVisualPart(fruitPart)
billboard.AlwaysOnTop = true
billboard.Size = UDim2.new(0, 200, 0, 65)
billboard.StudsOffset = Vector3.new(0, 3, 0)
billboard.MaxDistance = 100
billboard.ClipsDescendants = false
billboard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
billboard.Active = true
container = Instance.new("Frame")
container.Name = "Container"
container.Size = UDim2.new(1, 0, 1, 0)
container.BackgroundTransparency = 1
container.BorderSizePixel = 0
container.Parent = billboard
infoLabel = Instance.new("TextLabel")
infoLabel.Name = "Info"
infoLabel.Size = UDim2.new(1, 0, 1, 0)
infoLabel.Position = UDim2.new(0, 0, 0, 0)
infoLabel.BackgroundTransparency = 1
infoLabel.TextSize = 12
infoLabel.Font = Enum.Font.GothamSemibold
infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
infoLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
infoLabel.TextStrokeTransparency = 0.5
infoLabel.TextXAlignment = Enum.TextXAlignment.Center
infoLabel.TextYAlignment = Enum.TextYAlignment.Center
infoLabel.TextWrapped = true
infoLabel.Visible = false
infoLabel.Parent = container
billboard.Parent = fruitObj
return {
billboard = billboard,
infoLabel = infoLabel
}
end
function getCachedPlayers()
if tick() - lastPlayerCacheUpdate < 1 then
return cachedPlayers
end
lastPlayerCacheUpdate = tick()
cachedPlayers = Players:GetPlayers()
return cachedPlayers
end
function findCollectibleFruits()
fruits = {}
myFarm = getMyFarm()
if not myFarm then return fruits end
importantFolder = myFarm:FindFirstChild("Important")
if not importantFolder then return fruits end
plantsPhysical = importantFolder:FindFirstChild("Plants_Physical")
if not plantsPhysical then return fruits end
for _, plant in pairs(plantsPhysical:GetChildren()) do
fruitsContainer = plant:FindFirstChild("Fruits")
if fruitsContainer then
for _, fruit in pairs(fruitsContainer:GetChildren()) do
if fruit:IsA("BasePart") or fruit:IsA("Model") then
if isFruitWhitelisted(fruit) then
table.insert(fruits, {
part = fruit,
position = getFruitPosition(fruit),
fruitObj = fruit
})
end
end
end
end
end
return fruits
end
function getPlayerBoxColor(LocalPlayer)
return Color3.new(1, 1, 1)
end
function getPlayerModelSize(Character)
local rootPart = Character:FindFirstChild("HumanoidRootPart")
if not rootPart then
return Vector3.new(4, 6, 4)
end
local minX, minY, minZ = math.huge, math.huge, math.huge
local maxX, maxY, maxZ = -math.huge, -math.huge, -math.huge
for _, part in ipairs(Character:GetChildren()) do
if part:IsA("BasePart") and part ~= rootPart then
local pos = part.Position
local size = part.Size
local min = pos - size/2
local max = pos + size/2
minX = math.min(minX, min.X)
minY = math.min(minY, min.Y)
minZ = math.min(minZ, min.Z)
maxX = math.max(maxX, max.X)
maxY = math.max(maxY, max.Y)
maxZ = math.max(maxZ, max.Z)
end
end
if minX == math.huge then
return Vector3.new(4, 6, 4)
end
local width = maxX - minX
local height = maxY - minY
local depth = maxZ - minZ
return Vector3.new(width + 0.5, height + 0.5, depth + 0.5)
end
function createPlayer3DBox(LocalPlayer, Character)
if not Character then return end
local rootPart = Character:FindFirstChild("HumanoidRootPart")
if not rootPart then return end
local adornmentFolder = Character:FindFirstChild("PlayerOutlineAdornments")
if adornmentFolder then
return
end
local modelSize = getPlayerModelSize(Character)
local offsetX = modelSize.X / 2
local offsetY = modelSize.Y / 2
local offsetZ = modelSize.Z / 2
local thickness = 0.15
local transparency = 0.2
local boxColor = getPlayerBoxColor(LocalPlayer)
adornmentFolder = Instance.new("Folder")
adornmentFolder.Name = "PlayerOutlineAdornments"
adornmentFolder.Parent = Character
local edges = {
{Vector3.new(0, offsetY, offsetZ), Vector3.new(modelSize.X, thickness, thickness), "TopFrontEdge"},
{Vector3.new(0, offsetY, -offsetZ), Vector3.new(modelSize.X, thickness, thickness), "TopBackEdge"},
{Vector3.new(-offsetX, offsetY, 0), Vector3.new(thickness, thickness, modelSize.Z), "TopLeftEdge"},
{Vector3.new(offsetX, offsetY, 0), Vector3.new(thickness, thickness, modelSize.Z), "TopRightEdge"},
{Vector3.new(0, -offsetY, offsetZ), Vector3.new(modelSize.X, thickness, thickness), "BottomFrontEdge"},
{Vector3.new(0, -offsetY, -offsetZ), Vector3.new(modelSize.X, thickness, thickness), "BottomBackEdge"},
{Vector3.new(-offsetX, -offsetY, 0), Vector3.new(thickness, thickness, modelSize.Z), "BottomLeftEdge"},
{Vector3.new(offsetX, -offsetY, 0), Vector3.new(thickness, thickness, modelSize.Z), "BottomRightEdge"},
{Vector3.new(-offsetX, 0, offsetZ), Vector3.new(thickness, modelSize.Y, thickness), "FrontLeftEdge"},
{Vector3.new(offsetX, 0, offsetZ), Vector3.new(thickness, modelSize.Y, thickness), "FrontRightEdge"},
{Vector3.new(-offsetX, 0, -offsetZ), Vector3.new(thickness, modelSize.Y, thickness), "BackLeftEdge"},
{Vector3.new(offsetX, 0, -offsetZ), Vector3.new(thickness, modelSize.Y, thickness), "BackRightEdge"}
}
for _, edge in ipairs(edges) do
local position = edge[1]
local size = edge[2]
local name = edge[3]
local boxAdornment = Instance.new("BoxHandleAdornment")
boxAdornment.Name = name
boxAdornment.Adornee = rootPart
boxAdornment.Size = size
boxAdornment.CFrame = CFrame.new(position)
boxAdornment.Color3 = boxColor
boxAdornment.Transparency = transparency
boxAdornment.ZIndex = 10
boxAdornment.AlwaysOnTop = true
boxAdornment.Visible = true
boxAdornment.Parent = adornmentFolder
end
end
function clearPlayer3DBox(Character)
local folder = Character:FindFirstChild("PlayerOutlineAdornments")
if folder then
folder:Destroy()
end
end
function updatePlayer3DBoxColors(LocalPlayer, Character)
if not Character then return end
local newColor = getPlayerBoxColor(LocalPlayer)
local folder = Character:FindFirstChild("PlayerOutlineAdornments")
if folder then
for _, adornment in ipairs(folder:GetChildren()) do
if adornment:IsA("BoxHandleAdornment") then
adornment.Color3 = newColor
end
end
end
end
function createPlayer2DBox(LocalPlayer)
if playerEspBoxes[LocalPlayer] then
return
end
if LocalPlayer == LocalPlayer then return end
if not Character then return end
local billboard = Instance.new("BillboardGui")
billboard.Name = "PlayerESPBox_"..LocalPlayer.Name
billboard.Adornee = Character
billboard.Size = UDim2.new(0, 40, 0, 60)
billboard.StudsOffset = Vector3.new(0, 0, 0)
billboard.AlwaysOnTop = true
billboard.LightInfluence = 0
billboard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
billboard.ClipsDescendants = false
local boxFrame = Instance.new("Frame")
boxFrame.Name = "BoxFrame"
boxFrame.Size = UDim2.new(1, 0, 1, 0)
boxFrame.BackgroundTransparency = 1
boxFrame.BackgroundColor3 = Color3.new(1, 1, 1)
boxFrame.BorderSizePixel = 0
boxFrame.Parent = billboard
local uiStroke = Instance.new("UIStroke")
uiStroke.Thickness = 1.5
uiStroke.Transparency = 0
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiStroke.Color = getPlayerBoxColor(LocalPlayer)
uiStroke.Parent = boxFrame
local nameLabel = Instance.new("TextLabel")
nameLabel.Name = "PlayerName"
nameLabel.Size = UDim2.new(1, 0, 0, 16)
nameLabel.Position = UDim2.new(0, 0, 0, -18)
nameLabel.BackgroundTransparency = 0.5
nameLabel.BackgroundColor3 = Color3.new(0, 0, 0)
nameLabel.TextColor3 = Color3.new(1, 1, 1)
nameLabel.Text = LocalPlayer.Name
nameLabel.Font = Enum.Font.SourceSansBold
nameLabel.TextSize = 12
nameLabel.BorderSizePixel = 0
nameLabel.Parent = billboard
billboard.Parent = Character
playerEspBoxes[LocalPlayer] = billboard
end
function removePlayer2DBox(LocalPlayer)
if playerEspBoxes[LocalPlayer] then
playerEspBoxes[LocalPlayer]:Destroy()
playerEspBoxes[LocalPlayer] = nil
end
end
function getPlayerDimensions(Character, rootPart)
local minX, minY, minZ = math.huge, math.huge, math.huge
local maxX, maxY, maxZ = -math.huge, -math.huge, -math.huge
for _, part in ipairs(Character:GetDescendants()) do
if part:IsA("BasePart") and part ~= rootPart then
local partPos = part.Position
local partSize = part.Size / 2
local relativePos = rootPart.CFrame:PointToObjectSpace(partPos)
minX = math.min(minX, relativePos.X - partSize.X)
maxX = math.max(maxX, relativePos.X + partSize.X)
minY = math.min(minY, relativePos.Y - partSize.Y)
maxY = math.max(maxY, relativePos.Y + partSize.Y)
minZ = math.min(minZ, relativePos.Z - partSize.Z)
maxZ = math.max(maxZ, relativePos.Z + partSize.Z)
end
end
return {
width = math.max(maxX - minX, 3),
height = math.max(maxY - minY, 4)
}
end
function calculateBoxSize(distance, baseWidth, baseHeight)
local widthPx, heightPx
if distance <= CONFIG.DISTANCE_FALLOFF then
widthPx = math.min(baseWidth, CONFIG.MAX_BOX_SIZE)
heightPx = math.min(baseHeight, CONFIG.MAX_BOX_SIZE)
else
local falloffFactor = CONFIG.DISTANCE_FALLOFF / distance
local baseWidthCapped = math.min(baseWidth, CONFIG.MAX_BOX_SIZE)
local baseHeightCapped = math.min(baseHeight, CONFIG.MAX_BOX_SIZE)
widthPx = baseWidthCapped * falloffFactor
heightPx = baseHeightCapped * falloffFactor
end
widthPx = math.max(math.floor(widthPx), CONFIG.MIN_BOX_SIZE)
heightPx = math.max(math.floor(heightPx), CONFIG.MIN_BOX_SIZE)
return widthPx, heightPx
end
function getFruitSize(fruitPart)
local model = fruitPart
if fruitPart:IsA("BasePart") then
model = fruitPart.Parent
end
if model and model:IsA("Model") then
local minX, minY, minZ = math.huge, math.huge, math.huge
local maxX, maxY, maxZ = -math.huge, -math.huge, -math.huge
for _, part in ipairs(model:GetDescendants()) do
if part:IsA("BasePart") then
local pos = part.Position
local size = part.Size / 2
minX = math.min(minX, pos.X - size.X)
maxX = math.max(maxX, pos.X + size.X)
minY = math.min(minY, pos.Y - size.Y)
maxY = math.max(maxY, pos.Y + size.Y)
minZ = math.min(minZ, pos.Z - size.Z)
maxZ = math.max(maxZ, pos.Z + size.Z)
end
end
if minX ~= math.huge then
return Vector3.new(maxX - minX, maxY - minY, maxZ - minZ)
end
elseif fruitPart:IsA("BasePart") then
return fruitPart.Size
end
return Vector3.new(2, 2, 2)
end
function createFruit3DBox(fruitPart)
if not fruitPart then return end
local visualPart = getFruitVisualPart(fruitPart)
if not visualPart then return end
local model = fruitPart.Parent
if not model then return end
local adornmentFolder = model:FindFirstChild("FruitOutlineAdornments")
if adornmentFolder then
return
end
local fruitSize = getFruitSize(fruitPart)
local offsetX = fruitSize.X / 2
local offsetY = fruitSize.Y / 2
local offsetZ = fruitSize.Z / 2
local thickness = 0.1
local transparency = 0.2
local fruitColor = getFruitColor(fruitPart)
adornmentFolder = Instance.new("Folder")
adornmentFolder.Name = "FruitOutlineAdornments"
adornmentFolder.Parent = model
local edges = {
{Vector3.new(0, offsetY, offsetZ), Vector3.new(fruitSize.X, thickness, thickness), "TopFrontEdge"},
{Vector3.new(0, offsetY, -offsetZ), Vector3.new(fruitSize.X, thickness, thickness), "TopBackEdge"},
{Vector3.new(-offsetX, offsetY, 0), Vector3.new(thickness, thickness, fruitSize.Z), "TopLeftEdge"},
{Vector3.new(offsetX, offsetY, 0), Vector3.new(thickness, thickness, fruitSize.Z), "TopRightEdge"},
{Vector3.new(0, -offsetY, offsetZ), Vector3.new(fruitSize.X, thickness, thickness), "BottomFrontEdge"},
{Vector3.new(0, -offsetY, -offsetZ), Vector3.new(fruitSize.X, thickness, thickness), "BottomBackEdge"},
{Vector3.new(-offsetX, -offsetY, 0), Vector3.new(thickness, thickness, fruitSize.Z), "BottomLeftEdge"},
{Vector3.new(offsetX, -offsetY, 0), Vector3.new(thickness, thickness, fruitSize.Z), "BottomRightEdge"},
{Vector3.new(-offsetX, 0, offsetZ), Vector3.new(thickness, fruitSize.Y, thickness), "FrontLeftEdge"},
{Vector3.new(offsetX, 0, offsetZ), Vector3.new(thickness, fruitSize.Y, thickness), "FrontRightEdge"},
{Vector3.new(-offsetX, 0, -offsetZ), Vector3.new(thickness, fruitSize.Y, thickness), "BackLeftEdge"},
{Vector3.new(offsetX, 0, -offsetZ), Vector3.new(thickness, fruitSize.Y, thickness), "BackRightEdge"}
}
for _, edge in ipairs(edges) do
local position = edge[1]
local size = edge[2]
local name = edge[3]
local boxAdornment = Instance.new("BoxHandleAdornment")
boxAdornment.Name = name
boxAdornment.Adornee = visualPart
boxAdornment.Size = size
boxAdornment.CFrame = CFrame.new(position)
boxAdornment.Color3 = fruitColor
boxAdornment.Transparency = transparency
boxAdornment.ZIndex = 10
boxAdornment.AlwaysOnTop = true
boxAdornment.Visible = true
boxAdornment.Parent = adornmentFolder
end
end
function clearFruit3DBox(fruitPart)
local model = fruitPart.Parent
if model then
local folder = model:FindFirstChild("FruitOutlineAdornments")
if folder then
folder:Destroy()
end
end
end
function createFruit2DBox(fruitPart)
if not fruitPart then return end
local visualPart = getFruitVisualPart(fruitPart)
if not visualPart then return end
local model = fruitPart.Parent
if not model then return end
if fruitEspBoxes[fruitPart] then
return
end
local billboard = Instance.new("BillboardGui")
billboard.Name = "FruitESPBox"
billboard.Adornee = visualPart
billboard.Size = UDim2.new(0, 40, 0, 40)
billboard.StudsOffset = Vector3.new(0, 0, 0)
billboard.AlwaysOnTop = true
billboard.LightInfluence = 0
billboard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
billboard.ClipsDescendants = false
local boxFrame = Instance.new("Frame")
boxFrame.Name = "BoxFrame"
boxFrame.Size = UDim2.new(1, 0, 1, 0)
boxFrame.BackgroundTransparency = 1
boxFrame.BackgroundColor3 = Color3.new(1, 1, 1)
boxFrame.BorderSizePixel = 0
boxFrame.Parent = billboard
local uiStroke = Instance.new("UIStroke")
uiStroke.Thickness = 1.5
uiStroke.Transparency = 0
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiStroke.Color = getFruitColor(fruitPart)
uiStroke.Parent = boxFrame
billboard.Parent = model
fruitEspBoxes[fruitPart] = billboard
end
function removeFruit2DBox(fruitPart)
if fruitEspBoxes[fruitPart] then
fruitEspBoxes[fruitPart]:Destroy()
fruitEspBoxes[fruitPart] = nil
end
end
function getFruitDimensions(fruitPart)
local fruitSize = getFruitSize(fruitPart)
return {
width = fruitSize.X,
height = fruitSize.Y
}
end
function updatePlayer2DBoxes()
for LocalPlayer, billboard in pairs(playerEspBoxes) do
if Character and billboard and billboard.Parent then
local Humanoid = Character:FindFirstChild("Humanoid")
local rootPart = Character:FindFirstChild("HumanoidRootPart")
if Humanoid and rootPart and Humanoid.Health > 0 then
local dimensions = getPlayerDimensions(Character, rootPart)
local baseWidth = dimensions.width * CONFIG.BASE_MULTIPLIER + CONFIG.PADDING_X
local baseHeight = dimensions.height * CONFIG.BASE_MULTIPLIER + CONFIG.PADDING_Y
local distance = (Camera.CFrame.Position - rootPart.Position).Magnitude
local widthPx, heightPx = calculateBoxSize(distance, baseWidth, baseHeight)
billboard.Size = UDim2.new(0, widthPx, 0, heightPx)
local boxFrame = billboard:FindFirstChild("BoxFrame")
if boxFrame then
local stroke = boxFrame:FindFirstChild("UIStroke")
if stroke then
stroke.Color = getPlayerBoxColor(LocalPlayer)
end
end
local nameLabel = billboard:FindFirstChild("PlayerName")
if nameLabel then
nameLabel.Size = UDim2.new(1, 0, 0, math.min(16, heightPx * 0.2))
nameLabel.Position = UDim2.new(0, 0, 0, -math.min(18, heightPx * 0.25))
nameLabel.TextSize = math.max(math.min(12, widthPx * 0.15), 8)
end
end
end
end
end
function updateFruit2DBoxes()
for fruitPart, billboard in pairs(fruitEspBoxes) do
if fruitPart and fruitPart.Parent and billboard and billboard.Parent then
local visualPart = getFruitVisualPart(fruitPart)
if not visualPart then continue end
local fruitPosition = getFruitPosition(fruitPart)
local dimensions = getFruitDimensions(fruitPart)
local baseWidth = dimensions.width * CONFIG.BASE_MULTIPLIER + CONFIG.PADDING_X
local baseHeight = dimensions.height * CONFIG.BASE_MULTIPLIER + CONFIG.PADDING_Y
local distance = (Camera.CFrame.Position - fruitPosition).Magnitude
local widthPx, heightPx = calculateBoxSize(distance, baseWidth, baseHeight)
billboard.Size = UDim2.new(0, widthPx, 0, heightPx)
local boxFrame = billboard:FindFirstChild("BoxFrame")
if boxFrame then
local stroke = boxFrame:FindFirstChild("UIStroke")
if stroke then
stroke.Color = getFruitColor(fruitPart)
end
end
end
end
end
function onPlayerCharacterAdded2D(LocalPlayer, Character)
local Humanoid = Character:WaitForChild("Humanoid", 5)
if Humanoid then
createPlayer2DBox(LocalPlayer)
end
end
function onPlayerCharacterAdded3D(LocalPlayer, Character)
if LocalPlayer == LocalPlayer then return end
Character:WaitForChild("HumanoidRootPart")
clearPlayer3DBox(Character)
createPlayer3DBox(LocalPlayer, Character)
if activeConnections[LocalPlayer] then
if activeConnections[LocalPlayer].teamChanged then
activeConnections[LocalPlayer].teamChanged:Disconnect()
end
if activeConnections[LocalPlayer].sizeChanged then
activeConnections[LocalPlayer].sizeChanged:Disconnect()
end
end
local teamChangedConnection = LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function()
updatePlayer3DBoxColors(LocalPlayer, Character)
end)
local sizeChangedConnection = Character.ChildAdded:Connect(function()
clearPlayer3DBox(Character)
createPlayer3DBox(LocalPlayer, Character)
end)
activeConnections[LocalPlayer] = activeConnections[LocalPlayer] or {}
activeConnections[LocalPlayer].teamChanged = teamChangedConnection
activeConnections[LocalPlayer].sizeChanged = sizeChangedConnection
end
function onFruitAdded(fruitPart)
if fruitPart and fruitPart.Parent then
if currentFruitBoxType == "2D" then
createFruit2DBox(fruitPart)
else
clearFruit3DBox(fruitPart)
createFruit3DBox(fruitPart)
end
end
end
function updatePlayerESP()
if not PlayerESP.names and not PlayerESP.distance then
cleanupPlayerESP()
return
end
currentPlayerTargets = {}
players = getCachedPlayers()
for _, otherPlayer in ipairs(players) do
if otherPlayer ~= LocalPlayer then
local Character = otherPlayer.Character
if Character then
local hrp = Character:FindFirstChild("HumanoidRootPart")
local Humanoid = Character:FindFirstChild("Humanoid")
if hrp and Humanoid and Humanoid.Health > 0 then
currentPlayerTargets[Character] = true
if not playerEspElements[Character] then
playerEspElements[Character] = {}
local billboard = Instance.new("BillboardGui")
billboard.Name = "PlayerEspBillboard"
billboard.Adornee = Character
billboard.AlwaysOnTop = true
billboard.Size = UDim2.new(0, 200, 0, 40)
billboard.StudsOffset = Vector3.new(0, 3.5, 0)
billboard.MaxDistance = 100
billboard.ClipsDescendants = false
billboard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
billboard.Active = true
local infoLabel = Instance.new("TextLabel")
infoLabel.Name = "Info"
infoLabel.Size = UDim2.new(1, 0, 1, 0)
infoLabel.Position = UDim2.new(0, 0, 0, 0)
infoLabel.BackgroundTransparency = 1
infoLabel.TextSize = 12
infoLabel.Font = Enum.Font.GothamSemibold
infoLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
infoLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
infoLabel.TextStrokeTransparency = 0.5
infoLabel.TextXAlignment = Enum.TextXAlignment.Center
infoLabel.TextYAlignment = Enum.TextYAlignment.Center
infoLabel.TextWrapped = true
infoLabel.Visible = false
infoLabel.Parent = billboard
billboard.Parent = Character
playerEspElements[Character].billboardData = {
billboard = billboard,
infoLabel = infoLabel
}
end
local esp = playerEspElements[Character]
local distance = getDistanceFromPlayer(hrp.Position)
local playerColor = getTeamColor(otherPlayer)
if esp.billboardData then
local billboard = esp.billboardData.billboard
local infoLabel = esp.billboardData.infoLabel
billboard.Enabled = true
billboard.MaxDistance = math.min(100, distance * 2)
infoLabel.Visible = PlayerESP.names or PlayerESP.distance
if infoLabel.Visible then
local infoText = ""
if PlayerESP.names then
infoText = otherPlayer.Name
end
if PlayerESP.distance then
if infoText ~= "" then
infoText = infoText .. "\n"
end
infoText = infoText .. string.format("Dist: %.1f", distance)
end
infoLabel.Text = infoText
infoLabel.TextColor3 = playerColor
end
end
end
end
end
end
for target, esp in pairs(playerEspElements) do
if not currentPlayerTargets[target] then
if esp.billboardData then
esp.billboardData.billboard:Destroy()
end
playerEspElements[target] = nil
end
end
end
function updateFruitESP()
if tick() - lastFruitUpdate < 0.2 then
return
end
lastFruitUpdate = tick()
if not FruitESP.names and not FruitESP.distance and
not FruitESP.weight and not FruitESP.mutations and
not FruitESP.value and not FruitESP.variant then
cleanupFruitESP()
return
end
currentFruitTargets = {}
fruits = findCollectibleFruits()
for _, fruitData in ipairs(fruits) do
local fruitPart = fruitData.part
local position = fruitData.position
local fruitObj = fruitData.fruitObj
if fruitPart and fruitPart.Parent then
currentFruitTargets[fruitPart] = true
if not fruitEspElements[fruitPart] then
fruitEspElements[fruitPart] = {}
fruitEspElements[fruitPart].billboardData = createBillboard(fruitPart, fruitObj)
end
local esp = fruitEspElements[fruitPart]
local distance = getDistanceFromPlayer(position)
local fruitColor = getFruitColor(fruitPart)
local mutation = checkFruitMutation(fruitObj)
local variant = checkFruitVariant(fruitObj)
if mutation then
local mutationColor = getMutationColor(mutation)
fruitColor = Color3.new(
(fruitColor.R * 0.7 + mutationColor.R * 0.3),
(fruitColor.G * 0.7 + mutationColor.G * 0.3),
(fruitColor.B * 0.7 + mutationColor.B * 0.3)
)
end
if variant and FruitESP.variant then
local variantColor = getVariantColor(variant)
fruitColor = Color3.new(
(fruitColor.R * 0.6 + variantColor.R * 0.4),
(fruitColor.G * 0.6 + variantColor.G * 0.4),
(fruitColor.B * 0.6 + variantColor.B * 0.4)
)
end
if esp.billboardData then
local billboard = esp.billboardData.billboard
local infoLabel = esp.billboardData.infoLabel
billboard.Enabled = true
billboard.MaxDistance = math.min(100, distance * 2)
local weight = getFruitWeight(fruitObj)
local value = getFruitValue(fruitObj)
local states = FruitESP
infoLabel.Visible = states.names or states.distance or states.weight or (states.mutations and mutation ~= nil) or (states.value and value > 0) or (states.variant and variant ~= nil)
if infoLabel.Visible then
local infoText = ""
if states.names then
infoText = getFruitDisplayName(fruitObj.Name)
end
if states.mutations and mutation then
if infoText ~= "" then
infoText = infoText .. "\n"
end
infoText = infoText .. "Mut: " .. mutation
end
if states.variant and variant then
if infoText ~= "" then
infoText = infoText .. "\n"
end
infoText = infoText .. "Var: " .. variant
end
if states.value and value > 0 then
if infoText ~= "" then
infoText = infoText .. "\n"
end
infoText = infoText .. string.format("Value: $%.2f", value)
end
if states.weight and weight > 0 then
if infoText ~= "" then
infoText = infoText .. "\n"
end
infoText = infoText .. string.format("Weight: %.1f", weight)
end
if states.distance then
if infoText ~= "" then
infoText = infoText .. "\n"
end
infoText = infoText .. string.format("Dist: %.1f", distance)
end
infoLabel.Text = infoText
infoLabel.TextColor3 = fruitColor
infoLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
end
end
end
end
for target, esp in pairs(fruitEspElements) do
if not currentFruitTargets[target] then
if esp.billboardData then
esp.billboardData.billboard:Destroy()
end
fruitEspElements[target] = nil
fruitColorCache[target] = nil
end
end
end
function removeAllPlayerESP()
for LocalPlayer, billboard in pairs(playerEspBoxes) do
billboard:Destroy()
end
playerEspBoxes = {}
for LocalPlayer, connections in pairs(activeConnections) do
if connections.teamChanged then
connections.teamChanged:Disconnect()
end
if connections.sizeChanged then
connections.sizeChanged:Disconnect()
end
if LocalPlayer.Character then
clearPlayer3DBox(LocalPlayer.Character)
end
end
activeConnections = {}
end
function removeAllFruitESP()
for fruitPart, billboard in pairs(fruitEspBoxes) do
billboard:Destroy()
end
fruitEspBoxes = {}
local fruits = findCollectibleFruits()
for _, fruitData in ipairs(fruits) do
if fruitData.part then
clearFruit3DBox(fruitData.part)
end
end
end
function refreshPlayerESP()
removeAllPlayerESP()
for _, LocalPlayer in ipairs(Players:GetPlayers()) do
if LocalPlayer ~= LocalPlayer then
if currentPlayerBoxType == "2D" then
local function onCharacterAdded(Character)
onPlayerCharacterAdded2D(LocalPlayer, Character)
end
if not activeConnections[LocalPlayer] then
activeConnections[LocalPlayer] = {}
end
if activeConnections[LocalPlayer].charAdded then
activeConnections[LocalPlayer].charAdded:Disconnect()
end
local charAddedConnection = LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
activeConnections[LocalPlayer].charAdded = charAddedConnection
if LocalPlayer.Character then
onCharacterAdded(LocalPlayer.Character)
end
else
local function onCharacterAdded(Character)
onPlayerCharacterAdded3D(LocalPlayer, Character)
end
if not activeConnections[LocalPlayer] then
activeConnections[LocalPlayer] = {}
end
if activeConnections[LocalPlayer].charAdded then
activeConnections[LocalPlayer].charAdded:Disconnect()
end
local charAddedConnection = LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
activeConnections[LocalPlayer].charAdded = charAddedConnection
if LocalPlayer.Character then
onCharacterAdded(LocalPlayer.Character)
end
end
end
end
end
function refreshFruitESP()
removeAllFruitESP()
local fruits = findCollectibleFruits()
for _, fruitData in ipairs(fruits) do
if fruitData.part then
onFruitAdded(fruitData.part)
end
end
end
function playerBoxESP(enabled)
playerEspEnabled = enabled
if playerEspEnabled then
refreshPlayerESP()
if currentPlayerBoxType == "2D" then
if not renderConnection then
renderConnection = RunService.RenderStepped:Connect(function()
updatePlayer2DBoxes()
if fruitEspEnabled and currentFruitBoxType == "2D" then
updateFruit2DBoxes()
end
updatePlayerESP()
updateFruitESP()
end)
end
end
else
removeAllPlayerESP()
if renderConnection and not fruitEspEnabled then
renderConnection:Disconnect()
renderConnection = nil
elseif renderConnection and fruitEspEnabled then
end
end
end
function playerBoxESPtype(boxType)
if boxType == "2D" or boxType == "3D" then
currentPlayerBoxType = boxType
if playerEspEnabled then
refreshPlayerESP()
end
end
end
function fruitBoxESP(enabled)
fruitEspEnabled = enabled
if fruitEspEnabled then
refreshFruitESP()
if currentFruitBoxType == "2D" then
if not renderConnection then
renderConnection = RunService.RenderStepped:Connect(function()
updateFruit2DBoxes()
if playerEspEnabled and currentPlayerBoxType == "2D" then
updatePlayer2DBoxes()
end
updatePlayerESP()
updateFruitESP()
end)
end
end
else
removeAllFruitESP()
if renderConnection and not playerEspEnabled then
renderConnection:Disconnect()
renderConnection = nil
elseif renderConnection and playerEspEnabled then
end
end
end
function fruitBoxESPtype(boxType)
if boxType == "2D" or boxType == "3D" then
currentFruitBoxType = boxType
if fruitEspEnabled then
refreshFruitESP()
end
end
end
function managePlayerESPConnection()
local playerActive = PlayerESP.names or PlayerESP.distance
if playerActive then
if not renderConnection then
renderConnection = RunService.RenderStepped:Connect(function()
updatePlayerESP()
if fruitEspEnabled then
updateFruitESP()
end
if playerEspEnabled and currentPlayerBoxType == "2D" then
updatePlayer2DBoxes()
end
if fruitEspEnabled and currentFruitBoxType == "2D" then
updateFruit2DBoxes()
end
end)
end
else
cleanupPlayerESP()
if not fruitEspEnabled and not playerEspEnabled and renderConnection then
renderConnection:Disconnect()
renderConnection = nil
end
end
end
function manageFruitESPConnection()
local fruitActive = FruitESP.names or FruitESP.distance or
FruitESP.weight or FruitESP.mutations or
FruitESP.value or FruitESP.variant
if fruitActive then
if not renderConnection then
renderConnection = RunService.RenderStepped:Connect(function()
updateFruitESP()
if playerEspEnabled and currentPlayerBoxType == "2D" then
updatePlayer2DBoxes()
end
if fruitEspEnabled and currentFruitBoxType == "2D" then
updateFruit2DBoxes()
end
updatePlayerESP()
end)
end
else
cleanupFruitESP()
if not fruitEspEnabled and not playerEspEnabled and renderConnection then
renderConnection:Disconnect()
renderConnection = nil
end
end
end
function getOutlineColor(fillColor)
return Color3.new(
math.clamp(fillColor.R * 0.7, 0, 1),
math.clamp(fillColor.G * 0.7, 0, 1),
math.clamp(fillColor.B * 0.7, 0, 1)
)
end
function createFruitHighlight(fruitPart, fruitObj)
local highlight = Instance.new("Highlight")
highlight.Name = "FruitHighlight"
highlight.Adornee = getFruitVisualPart(fruitPart)
highlight.FillTransparency = 0.7
highlight.OutlineTransparency = 0
highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
local fruitColor = getFruitColor(fruitPart)
local mutation = checkFruitMutation(fruitObj)
local variant = checkFruitVariant(fruitObj)
if mutation then
local mutationColor = getMutationColor(mutation)
fruitColor = Color3.new(
(fruitColor.R * 0.7 + mutationColor.R * 0.3),
(fruitColor.G * 0.7 + mutationColor.G * 0.3),
(fruitColor.B * 0.7 + mutationColor.B * 0.3)
)
end
if variant then
local variantColor = getVariantColor(variant)
fruitColor = Color3.new(
(fruitColor.R * 0.6 + variantColor.R * 0.4),
(fruitColor.G * 0.6 + variantColor.G * 0.4),
(fruitColor.B * 0.6 + variantColor.B * 0.4)
)
end
local outlineColor = getOutlineColor(fruitColor)
highlight.FillColor = fruitColor
highlight.OutlineColor = outlineColor
highlight.Parent = fruitPart
return highlight
end
PlayerHighlightsConnection = nil
function startPlayerHighlights()
if not PlayerHighlights then
if PlayerHighlightsConnection then
PlayerHighlightsConnection:Disconnect()
PlayerHighlightsConnection = nil
end
return
end
if PlayerHighlightsConnection then return end
PlayerHighlightsConnection = RunService.Heartbeat:Connect(function()
if not PlayerHighlights then
if PlayerHighlightsConnection then
PlayerHighlightsConnection:Disconnect()
PlayerHighlightsConnection = nil
end
return
end
local players = getCachedPlayers()
for _, plr in ipairs(players) do
if plr ~= LocalPlayer and plr.Character then
local model = plr.Character
local highlight = model:FindFirstChild("PlayerHighlight")
if PlayerHighlights then
local Humanoid = model:FindFirstChildOfClass("Humanoid")
local color = (Humanoid and Humanoid.Health > 0) and getTeamColor(plr) or Color3.fromRGB(150, 150, 150)
local outlineColor = getOutlineColor(color)
if not highlight then
highlight = Instance.new("Highlight")
highlight.Name = "PlayerHighlight"
highlight.Adornee = model
highlight.FillTransparency = 0.5
highlight.OutlineTransparency = 0
highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
highlight.Parent = model
end
highlight.FillColor = color
highlight.OutlineColor = outlineColor
highlight.Enabled = true
else
if highlight then
highlight:Destroy()
end
end
end
end
end)
end
function stopPlayerHighlights()
if PlayerHighlightsConnection then
PlayerHighlightsConnection:Disconnect()
PlayerHighlightsConnection = nil
end
for _, plr in pairs(getCachedPlayers()) do
if plr and plr.Character then
local highlight = plr.Character:FindFirstChild("PlayerHighlight")
if highlight then
highlight:Destroy()
end
end
end
end
FruitHighlightsConnection = nil
function startFruitHighlights()
if not FruitHighlights then
if FruitHighlightsConnection then
FruitHighlightsConnection:Disconnect()
FruitHighlightsConnection = nil
end
return
end
if FruitHighlightsConnection then return end
FruitHighlightsConnection = RunService.Heartbeat:Connect(function()
if not FruitHighlights then
if FruitHighlightsConnection then
FruitHighlightsConnection:Disconnect()
FruitHighlightsConnection = nil
end
return
end
local fruits = findCollectibleFruits()
local currentFruits = {}
for _, fruitData in ipairs(fruits) do
local fruitPart = fruitData.part
local fruitObj = fruitData.fruitObj
if fruitPart and fruitPart.Parent then
currentFruits[fruitPart] = true
if not highlightedFruits[fruitPart] then
local highlight = createFruitHighlight(fruitPart, fruitObj)
highlightedFruits[fruitPart] = highlight
else
local highlight = highlightedFruits[fruitPart]
if highlight then
local fruitColor = getFruitColor(fruitPart)
local mutation = checkFruitMutation(fruitObj)
local variant = checkFruitVariant(fruitObj)
if mutation then
local mutationColor = getMutationColor(mutation)
fruitColor = Color3.new(
(fruitColor.R * 0.7 + mutationColor.R * 0.3),
(fruitColor.G * 0.7 + mutationColor.G * 0.3),
(fruitColor.B * 0.7 + mutationColor.B * 0.3)
)
end
if variant then
local variantColor = getVariantColor(variant)
fruitColor = Color3.new(
(fruitColor.R * 0.6 + variantColor.R * 0.4),
(fruitColor.G * 0.6 + variantColor.G * 0.4),
(fruitColor.B * 0.6 + variantColor.B * 0.4)
)
end
local outlineColor = getOutlineColor(fruitColor)
highlight.FillColor = fruitColor
highlight.OutlineColor = outlineColor
highlight.Enabled = true
end
end
end
end
for fruitPart, highlight in pairs(highlightedFruits) do
if not currentFruits[fruitPart] then
if highlight and highlight.Parent then
highlight:Destroy()
end
highlightedFruits[fruitPart] = nil
fruitColorCache[fruitPart] = nil
elseif not fruitPart or not fruitPart.Parent then
if highlight and highlight.Parent then
highlight:Destroy()
end
highlightedFruits[fruitPart] = nil
fruitColorCache[fruitPart] = nil
end
end
end)
end
function stopFruitHighlights()
if FruitHighlightsConnection then
FruitHighlightsConnection:Disconnect()
FruitHighlightsConnection = nil
end
for fruitPart, highlight in pairs(highlightedFruits) do
if highlight and highlight.Parent then
highlight:Destroy()
end
end
highlightedFruits = {}
fruitColorCache = {}
end
function cleanupFruit(fruitPart)
if fruitEspBoxes[fruitPart] then
fruitEspBoxes[fruitPart]:Destroy()
fruitEspBoxes[fruitPart] = nil
end
clearFruit3DBox(fruitPart)
if fruitEspElements[fruitPart] and fruitEspElements[fruitPart].billboardData then
if fruitEspElements[fruitPart].billboardData.billboard then
fruitEspElements[fruitPart].billboardData.billboard:Destroy()
end
fruitEspElements[fruitPart] = nil
end
end
Players.PlayerRemoving:Connect(function(LocalPlayer)
if playerEspBoxes[LocalPlayer] then
playerEspBoxes[LocalPlayer]:Destroy()
playerEspBoxes[LocalPlayer] = nil
end
if activeConnections[LocalPlayer] then
if activeConnections[LocalPlayer].teamChanged then
activeConnections[LocalPlayer].teamChanged:Disconnect()
end
if activeConnections[LocalPlayer].sizeChanged then
activeConnections[LocalPlayer].sizeChanged:Disconnect()
end
if activeConnections[LocalPlayer].charAdded then
activeConnections[LocalPlayer].charAdded:Disconnect()
end
activeConnections[LocalPlayer] = nil
end
if LocalPlayer.Character then
clearPlayer3DBox(LocalPlayer.Character)
end
end)
Workspace.DescendantAdded:Connect(function(descendant)
if fruitEspEnabled then
local fruits = findCollectibleFruits()
for _, fruitData in ipairs(fruits) do
if fruitData.part == descendant and not fruitEspBoxes[descendant] then
onFruitAdded(descendant)
end
end
end
end)
Workspace.DescendantRemoving:Connect(function(descendant)
cleanupFruit(descendant)
if fruitEspElements[descendant] then
if fruitEspElements[descendant].billboardData then
fruitEspElements[descendant].billboardData.billboard:Destroy()
end
fruitEspElements[descendant] = nil
end
end)
Tabs.Esp:Divider()
Tabs.Esp:Section({ Title = "Player ESP", TextSize = 20 })
Tabs.Esp:Divider()
Tabs.Esp:Toggle({
Title = "Player Names",
Flag = "PlayerNames",
Value = PlayerESP.names,
Callback = function(state)
PlayerESP.names = state
managePlayerESPConnection()
end
})
Tabs.Esp:Toggle({
Title = "Player Distance",
Flag = "PlayerDistance",
Value = PlayerESP.distance,
Callback = function(state)
PlayerESP.distance = state
managePlayerESPConnection()
end
})
Tabs.Esp:Toggle({
Title = "Player Highlights",
Flag = "PlayerHighlights",
Value = PlayerHighlights,
Callback = function(state)
PlayerHighlights = state
if state then
startPlayerHighlights()
else
stopPlayerHighlights()
end
end
})
Tabs.Esp:Toggle({
Title = "Player Boxes",
Flag = "PlayerBoxes",
Value = false,
Callback = function(value)
playerBoxESP(value)
end
})
Tabs.Esp:Dropdown({
Title = "Player Box Type",
Flag = "PlayerBoxType",
Values = {
{Title = "2D Box", Value = "2D"},
{Title = "3D Box", Value = "3D"}
},
Value = "2D",
Callback = function(option)
playerBoxESPtype(option.Value)
end
})
Tabs.Esp:Divider()
Tabs.Esp:Section({ Title = "Fruit ESP", TextSize = 20 })
Tabs.Esp:Divider()
Tabs.Esp:Toggle({
Title = "Fruit Names",
Flag = "FruitNames",
Value = FruitESP.names,
Callback = function(state)
FruitESP.names = state
manageFruitESPConnection()
end
})
Tabs.Esp:Toggle({
Title = "Fruit Distance",
Flag = "FruitDistance",
Value = FruitESP.distance,
Callback = function(state)
FruitESP.distance = state
manageFruitESPConnection()
end
})
Tabs.Esp:Toggle({
Title = "Show Weight",
Flag = "FruitWeight",
Value = FruitESP.weight,
Callback = function(state)
FruitESP.weight = state
manageFruitESPConnection()
end
})
Tabs.Esp:Toggle({
Title = "Show Mutations",
Flag = "FruitMutations",
Value = FruitESP.mutations,
Callback = function(state)
FruitESP.mutations = state
manageFruitESPConnection()
end
})
Tabs.Esp:Toggle({
Title = "Show Value",
Flag = "FruitValue",
Value = FruitESP.value,
Callback = function(state)
FruitESP.value = state
manageFruitESPConnection()
end
})
Tabs.Esp:Toggle({
Title = "Show Variant",
Flag = "FruitVariant",
Value = FruitESP.variant or false,
Callback = function(state)
FruitESP.variant = state
manageFruitESPConnection()
end
})
Tabs.Esp:Toggle({
Title = "Fruit Highlights",
Flag = "FruitHighlights",
Value = FruitHighlights,
Callback = function(state)
FruitHighlights = state
if state then
startFruitHighlights()
else
stopFruitHighlights()
end
end
})
Tabs.Esp:Toggle({
Title = "Fruit Boxes",
Flag = "FruitBoxes",
Value = false,
Callback = function(value)
fruitBoxESP(value)
end
})
Tabs.Esp:Dropdown({
Title = "Fruit Box Type",
Flag = "FruitBoxType",
Values = {
{Title = "2D Box", Value = "2D"},
{Title = "3D Box", Value = "3D"}
},
Value = "2D",
Callback = function(option)
fruitBoxESPtype(option.Value)
end
})
fruitEspFruitDropdown = Tabs.Esp:Dropdown({
Title = "Fruit Whitelist",
Flag = "FruitWhitelist",
Values = {"Click refresh to load fruits"},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
SearchPlaceholder = "Search fruits...",
Callback = function(selected)
fruitWhitelist = selected
updateFruitWhitelistNormalized()
end
})
Tabs.Esp:Button({
Title = "Refresh Fruits",
Flag = "RefreshFruits",
Callback = function()
crops = GetcropsData()
if #crops > 0 then
fruitEspFruitDropdown:Refresh(crops)
end
end
})
fruitEspMutationDropdown = Tabs.Esp:Dropdown({
Title = "Mutation Whitelist",
Flag = "MutationWhitelist",
Values = {"Click refresh to load mutations"},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
SearchPlaceholder = "Search mutations...",
Callback = function(selected)
mutationWhitelist = selected
updateFruitWhitelistNormalized()
end
})
Tabs.Esp:Button({
Title = "Refresh Mutations",
Flag = "RefreshMutations",
Callback = function()
mutations = GetmutationsData()
if #mutations > 0 then
fruitEspMutationDropdown:Refresh(mutations)
end
end
})
Tabs.Esp:Toggle({
Title = "Enable Variant Filter",
Flag = "EspVariantFilterToggle",
Value = variantFilterEnabled,
Callback = function(state)
variantFilterEnabled = state
end
})
fruitEspVariantDropdown = Tabs.Esp:Dropdown({
Title = "Variant Whitelist",
Flag = "VariantWhitelist",
Values = {"Click refresh to load variants"},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
SearchPlaceholder = "Search variants...",
Callback = function(selected)
variantWhitelist = selected
updateFruitWhitelistNormalized()
end
})
Tabs.Esp:Button({
Title = "Refresh Variants",
Flag = "RefreshVariants",
Callback = function()
variants = GetvariantData()
if #variants > 0 then
fruitEspVariantDropdown:Refresh(variants)
end
end
})
weightWhitelistToggle = Tabs.Esp:Toggle({
Title = "Enable Weight Filter",
Flag = "EnableWeightFilter",
Value = false,
Callback = function(state)
weightWhitelistEnabled = state
end
})
weightMinInput = Tabs.Esp:Input({
Title = "Minimum Weight",
Flag = "MinWeight",
Desc = "Only show fruits with weight ≥ this value",
Value = "0",
Placeholder = "Enter minimum weight...",
Callback = function(value)
local num = tonumber(value)
if num then
weightMin = num
end
end
})
weightMaxInput = Tabs.Esp:Input({
Title = "Maximum Weight",
Flag = "MaxWeight",
Desc = "Only show fruits with weight ≤ this value",
Value = "100",
Placeholder = "Enter maximum weight...",
Callback = function(value)
local num = tonumber(value)
if num then
weightMax = num
end
end
})
Tabs.Esp:Divider()
valueFilterToggle = Tabs.Esp:Toggle({
Title = "Enable Value Filter",
Flag = "EnableValueFilter",
Value = false,
Callback = function(state)
valueFilterEnabled = state
end
})
valueMinInput = Tabs.Esp:Input({
Title = "Minimum Value",
Flag = "MinValue",
Desc = "Only show fruits with value ≥ this amount",
Value = "0",
Placeholder = "Enter minimum value...",
Callback = function(value)
local num = tonumber(value)
if num then
valueMin = num
end
end
})
valueMaxInput = Tabs.Esp:Input({
Title = "Maximum Value",
Flag = "MaxValue",
Desc = "Only show fruits with value ≤ this amount",
Value = "999999999",
Placeholder = "Enter maximum value...",
Callback = function(value)
local num = tonumber(value)
if num then
valueMax = num
end
end
})
EventLoader = loadstring(game:HttpGet("https://darahub.pages.dev/Module/GrowAGarden/Events/loader.lua"))()
EventLoader(Tabs)
Tabs.Teleport:Section({ Title = "Teleport", TextSize = 20 })
Tabs.Teleport:Divider()
function GetPlayerList()
local playerList = {}
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer then
local success, content = pcall(function()
return Players:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
end)
local iconUrl = success and content or "user"
table.insert(playerList, {
Title = plr.DisplayName,
Desc = "@" .. plr.Name,
Icon = iconUrl,
UserId = plr.UserId
})
end
end
return playerList
end
TeleportPlayerDropdown = Tabs.Teleport:Dropdown({
Title = "Select Player",
Flag = "TeleportPlayerDropdown",
Values = #GetPlayerList() > 0 and GetPlayerList() or {{Title = "No players found", Desc = "", Icon = "user"}},
Value = "Select a LocalPlayer",
Callback = function(value)
selectedPlayer = value
end
})
function UpdatePlayerList()
local newList = GetPlayerList()
if #newList > 0 then
TeleportPlayerDropdown:Refresh(newList, "Select a LocalPlayer")
else
TeleportPlayerDropdown:Refresh({{Title = "No players found", Desc = "", Icon = "user"}}, "Select a LocalPlayer")
end
end
Tabs.Teleport:Button({
Title = "Teleport to Player",
Desc = "Teleport to the selected LocalPlayer",
Icon = "user",
Callback = function()
if selectedPlayer and selectedPlayer.Title ~= "No players found" then
local targetPlayer = nil
for _, plr in ipairs(Players:GetPlayers()) do
if plr.DisplayName == selectedPlayer.Title or plr.Name == selectedPlayer.Desc:sub(2) then
targetPlayer = plr
break
end
end
if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
end
end
end
end
})
Tabs.Teleport:Button({
Title = "Teleport to Random Player",
Desc = "Teleport to a random LocalPlayer in the server",
Icon = "users",
Callback = function()
local otherPlayers = {}
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
table.insert(otherPlayers, plr)
end
end
if #otherPlayers > 0 then
local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
LocalPlayer.Character.HumanoidRootPart.CFrame = randomPlayer.Character.HumanoidRootPart.CFrame
end
end
end
})
Players.PlayerAdded:Connect(function()
UpdatePlayerList()
end)
Players.PlayerRemoving:Connect(function()
UpdatePlayerList()
end)
LocalPlayer.CharacterAdded:Connect(function(newCharacter)
Character = newCharacter
rootPart = Character:WaitForChild("HumanoidRootPart", 5)
end)
local Troll = loadstring(game:HttpGet("https://darahub.pages.dev/Module/Troll-Stuffs.lua"))()
Troll(Tabs)
Tabs.Misc:Section({ Title = "Misc", TextSize = 40 })
Tabs.Misc:Divider()
AntiAFKConnection = nil
startAntiAFK = function()
AntiAFKConnection = LocalPlayer.Idled:Connect(function()
VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
task.wait(1)
VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)
end
stopAntiAFK = function()
if AntiAFKConnection then
AntiAFKConnection:Disconnect()
AntiAFKConnection = nil
end
end
AntiAFKToggle = Tabs.Misc:Toggle({
Title = "Anti AFK",
Flag = "AntiAFKToggle",
Value = AntiAFK,
Callback = function(state)
if state then
startAntiAFK()
else
stopAntiAFK()
end
end
})
Tabs.Misc:Space()
Tabs.Misc:Section({Title = "Auto Sell", TextSize = 20})
local autoSellEnabled = false
local autoSellThread = nil
local autoSellMode = "Current Position"
local sellDelay = 0.5
local sellWhenFullEnabled = false
local savedPosition = nil
local SellItemEvent = ReplicatedStorage.GameEvents:FindFirstChild("Sell_Item") or ReplicatedStorage.GameEvents:FindFirstChild("SellItem")
local SellInventoryEvent = ReplicatedStorage.GameEvents:FindFirstChild("Sell_Inventory") or ReplicatedStorage.GameEvents:FindFirstChild("SellInventory")
function getMyFarm()
local myUsername = LocalPlayer.Name
local farmFolder = Workspace:FindFirstChild("Farm")
if not farmFolder then return nil end
for _, plot in pairs(farmFolder:GetChildren()) do
local sign = plot:FindFirstChild("Sign")
if sign then
local owner = sign:GetAttribute("_owner")
if owner and owner == myUsername then
return plot
end
end
end
return nil
end
function teleportToPosition(position)
if not Character then return false end
local humanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
if not humanoidRootPart then return false end
humanoidRootPart.CFrame = CFrame.new(position)
task.wait(0.1)
return true
end
function getCurrentPosition()
if not Character then return nil end
local humanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
if not humanoidRootPart then return nil end
return humanoidRootPart.Position
end
function saveCurrentPosition()
savedPosition = getCurrentPosition()
return savedPosition ~= nil
end
function teleportToSellNPC()
for _, connection in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Teleport_UI.Frame.Sell.Activated)) do
connection:Fire()
end
end
function teleportToFarmCenter()
local myFarm = getMyFarm()
if not myFarm then return false end
local centerPoint = myFarm:FindFirstChild("Center_Point")
if centerPoint then
return teleportToPosition(centerPoint.Position + Vector3.new(0, 2, 0))
end
local boundingBox = myFarm:GetBoundingBox()
local center = (boundingBox[1] + boundingBox[2]) / 2
return teleportToPosition(Vector3.new(center.X, center.Y + 5, center.Z))
end
function sellHandItem()
if not SellItemEvent then return false end
local success = pcall(function()
SellItemEvent:FireServer()
end)
return success
end
function sellInventory()
if not SellInventoryEvent then return false end
local success = pcall(function()
SellInventoryEvent:FireServer()
end)
return success
end
function getBackpackCount()
local count = 0
if Character then
for _, item in pairs(Character:GetChildren()) do
if item:IsA("Tool") then
count = count + 1
end
end
end
if Backpack then
for _, item in pairs(Backpack:GetChildren()) do
if item:IsA("Tool") then
count = count + 1
end
end
end
return count
end
function isBackpackFull()
return getBackpackCount() >= maxBackpackCapacity
end
function startAutoSell()
if autoSellThread then
task.cancel(autoSellThread)
autoSellThread = nil
end
autoSellThread = task.spawn(function()
while autoSellEnabled do
local shouldSell = false
if sellWhenFullEnabled then
shouldSell = isBackpackFull()
else
shouldSell = true
end
if shouldSell then
if autoSellMode == "Current Position" then
saveCurrentPosition()
end
teleportToSellNPC()
task.wait(sellDelay)
sellInventory()
task.wait(sellDelay)
if autoSellMode == "Current Position" and savedPosition then
teleportToPosition(savedPosition)
savedPosition = nil
else
teleportToFarmCenter()
end
end
task.wait(sellDelay)
end
end)
end
function stopAutoSell()
if autoSellThread then
task.cancel(autoSellThread)
autoSellThread = nil
end
savedPosition = nil
end
Tabs.Misc:Divider()
Tabs.Misc:Dropdown({
Title = "Sell Mode",
Desc = "Choose how to return after selling",
Values = {
{Title = "Current Position", Icon = "map-pin", Value = "Current Position"},
{Title = "Center", Icon = "target", Value = "Center"}
},
Value = {Title = "Current Position", Icon = "map-pin", Value = "Current Position"},
Callback = function(option)
autoSellMode = option.Value
end
})
Tabs.Misc:Input({
Title = "Sell Delay (seconds)",
Desc = "Delay between actions",
Flag = "SellDelayInput",
Placeholder = "0.5",
Value = tostring(sellDelay),
Callback = function(value)
local num = tonumber(value)
if num and num > 0 then
sellDelay = num
end
end
})
Tabs.Misc:Toggle({
Title = "Auto Sell When Full",
Desc = "Only sell when Backpack reaches capacity",
Flag = "SellWhenFullToggle",
Value = sellWhenFullEnabled,
Callback = function(state)
sellWhenFullEnabled = state
end
})
Tabs.Misc:Toggle({
Title = "Auto Sell",
Desc = "Automatically sell items based on mode",
Flag = "AutoSellToggle",
Value = autoSellEnabled,
Callback = function(state)
autoSellEnabled = state
if autoSellEnabled then
startAutoSell()
else
stopAutoSell()
end
end
})
Tabs.Misc:Space()
Tabs.Misc:Section({Title = "Manual Sell", TextSize = 15})
Tabs.Misc:Divider()
Tabs.Misc:Button({
Title = "Sell Inventory",
Desc = "Sell entire inventory and return to current position",
Icon = "package",
Callback = function()
local pos = getCurrentPosition()
if not pos then 
WindUI:Notify({
Title = "Error",
Content = "Could not get current position",
Duration = 2
})
return 
end
teleportToSellNPC()
task.wait(sellDelay)
sellInventory()
task.wait(sellDelay)
teleportToPosition(pos)
end
})
Tabs.Misc:Button({
Title = "Sell Hand Item",
Desc = "Sell current held item and return to current position",
Icon = "hand",
Callback = function()
local pos = getCurrentPosition()
if not pos then 
WindUI:Notify({
Title = "Error",
Content = "Could not get current position",
Duration = 2
})
return 
end
teleportToSellNPC()
task.wait(sellDelay)
sellHandItem()
task.wait(sellDelay)
teleportToPosition(pos)
end
})
Tabs.Misc:Section({ Title = "Water Tree", TextSize = 20 })
WaterTree_Enabled = false
WaterTree_Task = nil
WaterTree_Distance = 20
WaterTree_Speed = 0.1
WaterTree_DistanceSlider = Tabs.Misc:Slider({
Title = "Water Distance",
Step = 1,
Value = { Min = 1, Max = 100, Default = 20 },
Callback = function(value)
WaterTree_Distance = value
end
})
WaterTree_SpeedSlider = Tabs.Misc:Slider({
Title = "Water Speed",
Step = 0.01,
Value = { Min = 0.01, Max = 2, Default = 0.1 },
Callback = function(value)
WaterTree_Speed = value
end
})
function WaterTree_GetMyFarmPlots()
WaterTree_MyUsername = Players.LocalPlayer.Name
WaterTree_FarmFolder = workspace:FindFirstChild("Farm")
WaterTree_MyPlots = {}
if WaterTree_FarmFolder then
for _, WaterTree_Plot in pairs(WaterTree_FarmFolder:GetChildren()) do
WaterTree_Sign = WaterTree_Plot:FindFirstChild("Sign")
if WaterTree_Sign then
WaterTree_Owner = WaterTree_Sign:GetAttribute("_owner")
if WaterTree_Owner and WaterTree_Owner == WaterTree_MyUsername then
table.insert(WaterTree_MyPlots, WaterTree_Plot)
end
end
end
end
return WaterTree_MyPlots
end
function WaterTree_WaterTrees()
WaterTree_MyPlots = WaterTree_GetMyFarmPlots()
WaterTree_WaterEvent = ReplicatedStorage.GameEvents.Water_RE
WaterTree_Character = Players.LocalPlayer.Character
if not WaterTree_Character then return end
WaterTree_RootPart = WaterTree_Character:FindFirstChild("HumanoidRootPart")
if not WaterTree_RootPart then return end
WaterTree_PlayerPos = WaterTree_RootPart.Position
for _, WaterTree_Plot in pairs(WaterTree_MyPlots) do
WaterTree_Important = WaterTree_Plot:FindFirstChild("Important")
if WaterTree_Important then
WaterTree_PlantsPhysical = WaterTree_Important:FindFirstChild("Plants_Physical")
if WaterTree_PlantsPhysical then
for _, WaterTree_Plant in pairs(WaterTree_PlantsPhysical:GetChildren()) do
if WaterTree_Plant:IsA("Model") and WaterTree_Plant:FindFirstChild("Grow") then
WaterTree_PlantPos = WaterTree_Plant:GetPivot().Position
WaterTree_Dist = (WaterTree_PlayerPos - WaterTree_PlantPos).Magnitude
if WaterTree_Dist <= WaterTree_Distance then
pcall(function()
WaterTree_WaterEvent:FireServer(WaterTree_PlantPos)
end)
end
end
end
end
end
end
end
function WaterTree_Start()
WaterTree_Task = task.spawn(function()
while WaterTree_Enabled do
WaterTree_WaterTrees()
task.wait(WaterTree_Speed)
for WaterTree_i = 1, 5 do
if not WaterTree_Enabled then break end
WaterTree_WaterTrees()
end
task.wait(0.05)
end
end)
end
function WaterTree_Stop()
if WaterTree_Task then
task.cancel(WaterTree_Task)
WaterTree_Task = nil
end
end
WaterTree_Toggle = Tabs.Misc:Toggle({
Title = "Auto Water",
Value = false,
Callback = function(state)
WaterTree_Enabled = state
if state then
WaterTree_Start()
else
WaterTree_Stop()
end
end
})
local originalGravity = workspace.Gravity
local isCustomGravity = false
local customGravityValue = originalGravity
GravityToggle = Tabs.Utility:Toggle({
Title = "Custom Gravity",
Flag = "GravityToggle",
Value = isCustomGravity,
Callback = function(state)
isCustomGravity = state
workspace.Gravity = state and customGravityValue or originalGravity
end
})
GravityInput = Tabs.Utility:Input({
Title = "Gravity Value",
Flag = "GravityInput",
Placeholder = tostring(originalGravity),
Value = tostring(customGravityValue),
Callback = function(text)
local num = tonumber(text)
if num then
customGravityValue = num
if isCustomGravity then
workspace.Gravity = num
end
end
end
})
TimeChangerInput = Tabs.Utility:Input({
Title = "Set Time (HH:MM)",
Flag = "TimeChangerInput",
Placeholder = "12:00",
Callback = function(value)
value = value:gsub("^%s*(.-)%s*$", "%1")
local h_str, m_str = value:match("(%d+):(%d+)")
if h_str and m_str then
local h = tonumber(h_str)
local m = tonumber(m_str)
if h and m and h >= 0 and h <= 23 and m >= 0 and m <= 59 and #h_str <= 2 and #m_str <= 2 then
local totalHours = h + (m / 60)
Lighting.ClockTime = totalHours
end
end
end
})
NoRender = false
NoRenderColor = Color3.fromRGB(0, 0, 0)
NoRenderToggle = Tabs.Utility:Toggle({
Title = "No Render",
Flag = "NoRenderToggle",
Desc = "Disable 3D rendering for performance",
Value = false,
Callback = function(state)
NoRender = state
RunService:Set3dRenderingEnabled(not state)
if state then
local gui = Instance.new("ScreenGui")
gui.Name = "NoRenderBackground"
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.ResetOnSpawn = false
local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = NoRenderColor
frame.BorderSizePixel = 0
frame.Parent = gui
gui.Parent = LocalPlayer.PlayerGui
else
local gui = LocalPlayer.PlayerGui:FindFirstChild("NoRenderBackground")
if gui then
gui:Destroy()
end
end
end
})
NoRenderColorPicker = Tabs.Utility:Colorpicker({
Title = "No Render Color",
Flag = "NoRenderColorPicker",
Desc = "Choose background color when No Render is enabled",
Default = Color3.fromRGB(0, 0, 0),
Transparency = 0,
Callback = function(color)
NoRenderColor = color
if NoRender then
local gui = LocalPlayer.PlayerGui:FindFirstChild("NoRenderBackground")
if gui then
local frame = gui:FindFirstChildOfClass("Frame")
if frame then
frame.BackgroundColor3 = color
end
end
end
end
})
RemoveTextures = false
RemoveTexturesButton = Tabs.Utility:Button({
Title = "Remove Textures",
Callback = function()
for _, part in ipairs(workspace:GetDescendants()) do
if part:IsA("Part") or part:IsA("MeshPart") or part:IsA("UnionOperation") or part:IsA("WedgePart") or part:IsA("CornerWedgePart") then
if part:IsA("Part") then
part.Material = Enum.Material.SmoothPlastic
end
if part:FindFirstChildWhichIsA("Texture") then
local texture = part:FindFirstChildWhichIsA("Texture")
texture.Texture = "rbxassetid://0"
end
if part:FindFirstChildWhichIsA("Decal") then
local decal = part:FindFirstChildWhichIsA("Decal")
decal.Texture = "rbxassetid://0"
end
end
end
end
})
Players.PlayerRemoving:Connect(function(leavingPlayer)
if leavingPlayer == LocalPlayer then
RunService:Set3dRenderingEnabled(true)
end
end)
LowQualityButton = Tabs.Utility:Button({
Title = "Low Quality",
Desc = "Disable textures, effects, and optimize graphics",
Callback = function()
local ToDisable = {
Textures = true,
VisualEffects = true,
Parts = true,
Particles = true,
Sky = true
}
local ToEnable = {
FullBright = false
}
local Stuff = {}
for _, v in next, game:GetDescendants() do
if ToDisable.Parts then
if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("BasePart") then
v.Material = Enum.Material.SmoothPlastic
table.insert(Stuff, 1, v)
end
end
if ToDisable.Particles then
if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Explosion") or v:IsA("Sparkles") or v:IsA("Fire") then
v.Enabled = false
table.insert(Stuff, 1, v)
end
end
if ToDisable.VisualEffects then
if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then
v.Enabled = false
table.insert(Stuff, 1, v)
end
end
if ToDisable.Textures then
if v:IsA("Decal") or v:IsA("Texture") then
v.Texture = ""
table.insert(Stuff, 1, v)
end
end
if ToDisable.Sky then
if v:IsA("Sky") then
v.Parent = nil
table.insert(Stuff, 1, v)
end
end
end
if ToEnable.FullBright then
Lighting.FogColor = Color3.fromRGB(255, 255, 255)
Lighting.FogEnd = math.huge
Lighting.FogStart = math.huge
Lighting.Ambient = Color3.fromRGB(255, 255, 255)
Lighting.Brightness = 5
Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
Lighting.Outlines = true
end
end
})
if _G.a then
local v1, v2, v3 = pairs(_G.a)
while true do
local v4
v3, v4 = v1(v2, v3)
if v3 == nil then
break
end
v4:Disconnect()
end
_G.a = nil
end
repeat
task.wait()
until game.Players.LocalPlayer
vu5 = game.Players.LocalPlayer
vu6 = nil
vu7 = nil
vu8 = nil
vu9 = false
vu10 = {}
function vu16()
vu6 = vu5.Character or vu5.CharacterAdded:Wait()
vu7 = vu6:WaitForChild("Humanoid")
vu8 = vu6:WaitForChild("HumanoidRootPart")
vu10 = {}
v11 = vu6
v12, v13, v14 = pairs(v11:GetDescendants())
while true do
v15 = nil
v14, v15 = v12(v13, v14)
if v14 == nil then
break
end
if v15:IsA("BasePart") and v15.Transparency == 0 then
vu10[#vu10 + 1] = v15
end
end
end
function vu30()
toggleElement = ButtonLib.Create:Toggle({
Text = "INVISIBLE",
Flag = "InvisibleToggle",
Default = false,
Visible = false,
Callback = function(state)
vu9 = state
if vu9 then
v26, v27, v28 = pairs(vu10)
while true do
v29 = nil
v28, v29 = v26(v27, v28)
if v28 == nil then
break
end
v29.Transparency = v29.Transparency == 0 and 0.5 or 0
end
else
v26, v27, v28 = pairs(vu10)
while true do
v29 = nil
v28, v29 = v26(v27, v28)
if v28 == nil then
break
end
v29.Transparency = 0
end
end
end
})
toggleElement.Position = UDim2.new(0.5, -125, 0.12, 0)
_G.InvisibleToggleElement = toggleElement
end
vu16()
vu30()
v31 = {
nil,
nil
}
v32 = vu5
v31[1] = vu5:GetMouse().KeyDown:Connect(function(p33)
if p33 == "i" then
vu9 = not vu9
if ButtonLib and ButtonLib.InvisibleToggle then
ButtonLib.InvisibleToggle:Set(vu9)
end
v34, v35, v36 = pairs(vu10)
while true do
v37 = nil
v36, v37 = v34(v35, v36)
if v36 == nil then
break
end
if vu9 then
v37.Transparency = v37.Transparency == 0 and 0.5 or 0
else
v37.Transparency = 0
end
end
end
end)
v31[2] = RunService.Heartbeat:Connect(function()
if vu9 then
v38 = vu8.CFrame
v39 = vu7.CameraOffset
v40 = v38 * CFrame.new(0, -200000, 0)
v41 = vu7
v42 = vu8
v43 = v40:ToObjectSpace(CFrame.new(v38.Position)).Position
v42.CFrame = v40
v41.CameraOffset = v43
RunService.RenderStepped:Wait()
v44 = vu7
vu8.CFrame = v38
v44.CameraOffset = v39
end
end)
vu5.CharacterAdded:Connect(function()
vu9 = false
if ButtonLib and ButtonLib.InvisibleToggle then
ButtonLib.InvisibleToggle:Set(false)
end
vu16()
end)
InvisibleGuiToggle = Tabs.Utility:Toggle({
Title = "Invisible GUI",
Flag = "InvisibleGuiToggle",
Value = false,
Callback = function(state)
if ButtonLib and ButtonLib.InvisibleToggle then
ButtonLib.InvisibleToggle:SetVisible(state)
end
end
})
Tabs.Utility:Space()
Tabs.Utility:Button({
Title = "Insta Proximity Prompt",
Callback = function()
RblxCallDialog({
Title = "Warning",
Desc = [[ Using this you may accidentally click gift someone and you may lose your fruit or pet. So be careful when pressing something.
Are you sure wanted to run this?]],
Button1 = {
Title = "Cancel",
Type = "GreyOutline",
},
Button2 = {
Title = "Execute Anyway",
Type = "White",
WaitTimeClick = 5,
Callback = function()
for _,b in ipairs(game:GetDescendants()) do if b:IsA("ProximityPrompt") then b.HoldDuration=0 end end game.DescendantAdded:Connect(function(c) if c:IsA("ProximityPrompt") then c.HoldDuration=0 end end)
end
}
})
end
})
local DataService = require(ReplicatedStorage.Modules.DataService)
local function getPlayerCurrencyValue(currencyType)
if not currencyType or currencyType == "" then
return DataService:GetData().Sheckles or 0
end
local PlayerGui = Players.LocalPlayer.PlayerGui
local cleanCurrencyType = currencyType:gsub("s$", "")
local possibleNames = {
currencyType,
cleanCurrencyType,
currencyType .. "Currency_UI",
cleanCurrencyType .. "Currency_UI",
currencyType:lower(),
cleanCurrencyType:lower(),
currencyType:upper(),
cleanCurrencyType:upper(),
currencyType:gsub("^%l", string.upper),
cleanCurrencyType:gsub("^%l", string.upper)
}
for _, name in ipairs(possibleNames) do
local currencyGui = PlayerGui:FindFirstChild(name)
if currencyGui then
local frame = currencyGui:FindFirstChild("Frame")
if frame then
local textLabel1 = frame:FindFirstChild("TextLabel1")
if textLabel1 then
local valObject = textLabel1:FindFirstChild("val")
if valObject and typeof(valObject.Value) == "number" then
return valObject.Value
end
end
end
end
end
for _, name in ipairs(possibleNames) do
local currencyGui = PlayerGui:FindFirstChild(name .. "_UI")
if currencyGui then
local frame = currencyGui:FindFirstChild("Frame")
if frame then
local textLabel1 = frame:FindFirstChild("TextLabel1")
if textLabel1 then
local valObject = textLabel1:FindFirstChild("val")
if valObject and typeof(valObject.Value) == "number" then
return valObject.Value
end
end
end
end
end
return 0
end
local function hasEnoughMoneyForItem(itemData)
local price = itemData.Price or 0
if itemData.SpecialCurrencyType and itemData.SpecialCurrencyType ~= "" then
local currencyAmount = getPlayerCurrencyValue(itemData.SpecialCurrencyType)
return currencyAmount >= price
else
local sheckles = DataService:GetData().Sheckles or 0
return sheckles >= price
end
end
Tabs.Shop:Section({ Title = "Auto Buy", TextSize = 40 })
Tabs.Shop:Section({ Title = "Seed Shop", TextSize = 20 })
Tabs.Shop:Divider()
local seedShopDataModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("SeedShopData")
local seedDataModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("SeedData")
local BuySeedStock = ReplicatedStorage.GameEvents.BuySeedStock
local autoBuyEnabled = false
local autoBuyTask = nil
local selectedSeeds = {}
local autoBuyAllEnabled = false
local autoBuyAllTask = nil
seedDropdown = Tabs.Shop:Dropdown({
Title = "Select Auto Seed",
Desc = "Choose seeds to auto buy (Press Refresh to load items)",
Values = {{Title = "Press Refresh to load items", Icon = "refresh-cw", Desc = "Click the refresh button above"}},
Value = {},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(options) 
selectedSeeds = {}
for _, option in ipairs(options) do
if option.Data and option.Data.Name then table.insert(selectedSeeds, option.Data) end
end
end
})
Tabs.Shop:Button({
Title = "Refresh Seed Items",
Icon = "refresh-cw",
Callback = function()
task.spawn(function()
local success, seedShopData = pcall(require, seedShopDataModule)
local success2, seedData = pcall(require, seedDataModule)
if success and success2 then
local dropdownItems = {}
for seedName, shopInfo in pairs(seedShopData) do
local seedInfo = seedData[seedName]
if seedInfo and shopInfo.DisplayInShop ~= false then
table.insert(dropdownItems, {
Title = seedInfo.SeedName or seedName,
Icon = seedInfo.FruitIcon or seedInfo.Asset or "",
Desc = string.format("$%s | %s", shopInfo.Price or 0, seedInfo.SeedRarity or "Unknown"),
Value = seedName,
Data = {Name = seedName, DisplayName = seedInfo.SeedName or seedName, Price = shopInfo.Price or 0, Rarity = seedInfo.SeedRarity or "Unknown", SpecialCurrencyType = shopInfo.SpecialCurrencyType}
})
end
end
table.sort(dropdownItems, function(a, b) return a.Data.Price < b.Data.Price end)
seedDropdown:Refresh(dropdownItems, {})
else
seedDropdown:Refresh({{Title = "Failed to load", Icon = "x-circle", Desc = "Seed data modules not found"}})
end
end)
end
})
autoBuyToggle = Tabs.Shop:Toggle({
Title = "Auto Buy Seed",
Value = false,
Callback = function(state)
autoBuyEnabled = state
if state then
autoBuyTask = task.spawn(function()
while autoBuyEnabled do
if #selectedSeeds > 0 then
for _, seedData in ipairs(selectedSeeds) do
if hasEnoughMoneyForItem(seedData) then
BuySeedStock:FireServer("Shop", seedData.Name)
end
task.wait(0.01)
end
for i = 1, 5 do
if not autoBuyEnabled then break end
for _, seedData in ipairs(selectedSeeds) do
if hasEnoughMoneyForItem(seedData) then
BuySeedStock:FireServer("Shop", seedData.Name)
end
end
task.wait(0.05)
end
else
task.wait(0.5)
end
task.wait(0.1)
end
end)
else
if autoBuyTask then task.cancel(autoBuyTask) autoBuyTask = nil end
end
end
})
autoBuyAllToggle = Tabs.Shop:Toggle({
Title = "Auto Buy All Seed",
Value = false,
Callback = function(state)
autoBuyAllEnabled = state
if state then
autoBuyAllTask = task.spawn(function()
while autoBuyAllEnabled do
local success, seedShopData = pcall(require, seedShopDataModule)
if success then
for seedName, shopInfo in pairs(seedShopData) do
if shopInfo.DisplayInShop ~= false then
local itemData = {Price = shopInfo.Price or 0, SpecialCurrencyType = shopInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(itemData) then
BuySeedStock:FireServer("Shop", seedName)
end
end
task.wait(0.01)
end
for i = 1, 10 do
if not autoBuyAllEnabled then break end
for seedName, shopInfo in pairs(seedShopData) do
if shopInfo.DisplayInShop ~= false then
local itemData = {Price = shopInfo.Price or 0, SpecialCurrencyType = shopInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(itemData) then
BuySeedStock:FireServer("Shop", seedName)
end
end
end
task.wait(0.03)
end
else
task.wait(0.5)
end
task.wait(0.2)
end
end)
else
if autoBuyAllTask then task.cancel(autoBuyAllTask) autoBuyAllTask = nil end
end
end
})
Tabs.Shop:Section({ Title = "Daily Seed Shop", TextSize = 20 })
Tabs.Shop:Divider()
local dailySeedShopDataModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("DailySeedShopData")
local BuyDailySeedShopStock = ReplicatedStorage.GameEvents.BuyDailySeedShopStock
local dailyAutoBuyEnabled = false
local dailyAutoBuyTask = nil
local dailySelectedSeeds = {}
local dailyBuyAllEnabled = false
local dailyBuyAllTask = nil
function loadDailySeedData()
local success, dailyData = pcall(require, dailySeedShopDataModule)
local success2, seedData = pcall(require, seedDataModule)
if success and success2 then return dailyData, seedData end
return nil, nil
end
function getDailySeeds()
local dailyData, seedData = loadDailySeedData()
if not dailyData or not seedData then return {} end
local dailySeeds = {}
for seedName, shopInfo in pairs(dailyData) do
local seedInfo = seedData[seedName]
if seedInfo then
local currencyDisplay = ""
if shopInfo.SpecialCurrencyType and shopInfo.SpecialCurrencyType ~= "" then
currencyDisplay = string.format("%s %s", shopInfo.Price or 0, shopInfo.SpecialCurrencyType)
else
currencyDisplay = string.format("$%s", shopInfo.Price or 0)
end
table.insert(dailySeeds, {
Title = seedInfo.SeedName or seedName,
Icon = seedInfo.FruitIcon or seedInfo.Asset or "",
Desc = string.format("%s | Stock: %d", currencyDisplay, shopInfo.MaxStock or 1),
Value = seedName,
Data = {Name = seedName, DisplayName = seedInfo.SeedName or seedName, Price = shopInfo.Price or 0, MaxStock = shopInfo.MaxStock or 1, SpecialCurrencyType = shopInfo.SpecialCurrencyType}
})
end
end
table.sort(dailySeeds, function(a, b) return a.Data.Price < b.Data.Price end)
return dailySeeds
end
dailySeedDropdown = Tabs.Shop:Dropdown({
Title = "Select Daily Seed",
Desc = "Choose daily seeds to auto buy (Press Refresh to load items)",
Values = {{Title = "Press Refresh to load items", Icon = "refresh-cw", Desc = "Click the refresh button above"}},
Value = {},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(options) 
dailySelectedSeeds = {}
for _, option in ipairs(options) do if option.Data and option.Data.Name then table.insert(dailySelectedSeeds, option.Data) end end
end
})
Tabs.Shop:Button({
Title = "Refresh Daily Seed Items",
Icon = "refresh-cw",
Callback = function()
local dailySeeds = getDailySeeds()
if #dailySeeds > 0 then 
dailySeedDropdown:Refresh(dailySeeds, {}) 
else 
dailySeedDropdown:Refresh({{Title = "No Daily Seeds", Icon = "x-circle", Desc = "Daily shop data not found"}}) 
end
end
})
autoBuyDailyToggle = Tabs.Shop:Toggle({
Title = "Auto Buy Daily Seed",
Value = false,
Callback = function(state)
dailyAutoBuyEnabled = state
if state then
dailyAutoBuyTask = task.spawn(function()
while dailyAutoBuyEnabled do
if #dailySelectedSeeds > 0 then
for _, seedData in ipairs(dailySelectedSeeds) do
if hasEnoughMoneyForItem(seedData) then
BuyDailySeedShopStock:FireServer(seedData.Name)
end
task.wait(0.01)
end
for i = 1, 5 do
if not dailyAutoBuyEnabled then break end
for _, seedData in ipairs(dailySelectedSeeds) do
if hasEnoughMoneyForItem(seedData) then
BuyDailySeedShopStock:FireServer(seedData.Name)
end
end
task.wait(0.05)
end
else
task.wait(0.5)
end
task.wait(0.1)
end
end)
else
if dailyAutoBuyTask then task.cancel(dailyAutoBuyTask) dailyAutoBuyTask = nil end
end
end
})
autoBuyAllDailyToggle = Tabs.Shop:Toggle({
Title = "Auto Buy All Daily Seed",
Value = false,
Callback = function(state)
dailyBuyAllEnabled = state
if state then
dailyBuyAllTask = task.spawn(function()
while dailyBuyAllEnabled do
local dailyData, _ = loadDailySeedData()
if dailyData then
for seedName, shopInfo in pairs(dailyData) do
local itemData = {Price = shopInfo.Price or 0, SpecialCurrencyType = shopInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(itemData) then
BuyDailySeedShopStock:FireServer(seedName)
end
task.wait(0.01)
end
for i = 1, 8 do
if not dailyBuyAllEnabled then break end
for seedName, shopInfo in pairs(dailyData) do
local itemData = {Price = shopInfo.Price or 0, SpecialCurrencyType = shopInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(itemData) then
BuyDailySeedShopStock:FireServer(seedName)
end
end
task.wait(0.04)
end
else
task.wait(0.5)
end
task.wait(0.15)
end
end)
else
if dailyBuyAllTask then task.cancel(dailyBuyAllTask) dailyBuyAllTask = nil end
end
end
})
Tabs.Shop:Section({ Title = "Pet Egg Autobuy", TextSize = 20 })
Tabs.Shop:Divider()
local petEggDataModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("PetEggData")
local petEggsModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("PetRegistry"):WaitForChild("PetEggs")
local BuyPetEgg = ReplicatedStorage.GameEvents.BuyPetEgg
local eggAutoBuyEnabled = false
local eggAutoBuyTask = nil
local selectedEggs = {}
local eggAutoBuyAllEnabled = false
local eggAutoBuyAllTask = nil
function loadEggData()
local success, eggData = pcall(require, petEggDataModule)
local success2, eggsInfo = pcall(require, petEggsModule)
if success and success2 then return eggData, eggsInfo end
return nil, nil
end
eggDropdown = Tabs.Shop:Dropdown({
Title = "Select Egg",
Desc = "Choose eggs to auto buy (Press Refresh to load items)",
Values = {{Title = "Press Refresh to load items", Icon = "refresh-cw", Desc = "Click the refresh button above"}},
Value = {},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(options) 
selectedEggs = {}
for _, option in ipairs(options) do if option.Data and option.Data.Name then table.insert(selectedEggs, option.Data) end end
end
})
Tabs.Shop:Button({
Title = "Refresh Egg Items",
Icon = "refresh-cw",
Callback = function()
task.spawn(function()
local eggData, eggsInfo = loadEggData()
if eggData and eggsInfo then
local dropdownItems = {}
for eggName, eggInfo in pairs(eggData) do
local eggDetails = eggsInfo[eggName]
if eggDetails then
table.insert(dropdownItems, {
Title = eggInfo.EggName or eggName,
Icon = eggDetails.Icon or "",
Desc = string.format("$%s | %s", eggInfo.Price or 0, eggInfo.EggRarity or "Unknown"),
Value = eggName,
Data = {Name = eggName, DisplayName = eggInfo.EggName or eggName, Price = eggInfo.Price or 0, Rarity = eggInfo.EggRarity or "Unknown", SpecialCurrencyType = eggInfo.SpecialCurrencyType}
})
end
end
table.sort(dropdownItems, function(a, b) return a.Data.Price < b.Data.Price end)
eggDropdown:Refresh(dropdownItems, {})
else
eggDropdown:Refresh({{Title = "Failed to load", Icon = "x-circle", Desc = "Egg data modules not found"}})
end
end)
end
})
autoBuyEggToggle = Tabs.Shop:Toggle({
Title = "Auto Buy Egg",
Value = false,
Callback = function(state)
eggAutoBuyEnabled = state
if state then
eggAutoBuyTask = task.spawn(function()
while eggAutoBuyEnabled do
if #selectedEggs > 0 then
for _, eggData in ipairs(selectedEggs) do
if hasEnoughMoneyForItem(eggData) then
BuyPetEgg:FireServer(eggData.Name)
end
task.wait(0.01)
end
for i = 1, 5 do
if not eggAutoBuyEnabled then break end
for _, eggData in ipairs(selectedEggs) do
if hasEnoughMoneyForItem(eggData) then
BuyPetEgg:FireServer(eggData.Name)
end
end
task.wait(0.05)
end
else
task.wait(0.5)
end
task.wait(0.1)
end
end)
else
if eggAutoBuyTask then task.cancel(eggAutoBuyTask) eggAutoBuyTask = nil end
end
end
})
autoBuyAllEggToggle = Tabs.Shop:Toggle({
Title = "Auto Buy All Egg",
Value = false,
Callback = function(state)
eggAutoBuyAllEnabled = state
if state then
eggAutoBuyAllTask = task.spawn(function()
while eggAutoBuyAllEnabled do
local eggData, _ = loadEggData()
if eggData then
for eggName, eggInfo in pairs(eggData) do
local itemData = {Price = eggInfo.Price or 0, SpecialCurrencyType = eggInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(itemData) then
BuyPetEgg:FireServer(eggName)
end
task.wait(0.01)
end
for i = 1, 8 do
if not eggAutoBuyAllEnabled then break end
for eggName, eggInfo in pairs(eggData) do
local itemData = {Price = eggInfo.Price or 0, SpecialCurrencyType = eggInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(itemData) then
BuyPetEgg:FireServer(eggName)
end
end
task.wait(0.04)
end
else
task.wait(0.5)
end
task.wait(0.15)
end
end)
else
if eggAutoBuyAllTask then task.cancel(eggAutoBuyAllTask) eggAutoBuyAllTask = nil end
end
end
})
Tabs.Shop:Section({ Title = "Gear Shop Autobuy", TextSize = 20 })
Tabs.Shop:Divider()
local gearShopDataModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("GearShopData")
local gearDataModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("GearData")
local BuyGearStock = ReplicatedStorage.GameEvents.BuyGearStock
local gearAutoBuyEnabled = false
local gearAutoBuyTask = nil
local selectedGears = {}
local gearAutoBuyAllEnabled = false
local gearAutoBuyAllTask = nil
function loadGearData()
local success, gearShopData = pcall(require, gearShopDataModule)
local success2, gearInfo = pcall(require, gearDataModule)
if success and success2 then return gearShopData, gearInfo end
return nil, nil
end
gearDropdown = Tabs.Shop:Dropdown({
Title = "Select Gear",
Desc = "Choose gear to auto buy (Press Refresh to load items)",
Values = {{Title = "Press Refresh to load items", Icon = "refresh-cw", Desc = "Click the refresh button above"}},
Value = {},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(options) 
selectedGears = {}
for _, option in ipairs(options) do if option.Data and option.Data.Name then table.insert(selectedGears, option.Data) end end
end
})
Tabs.Shop:Button({
Title = "Refresh Gear Items",
Icon = "refresh-cw",
Callback = function()
task.spawn(function()
local gearShopData, gearInfo = loadGearData()
if gearShopData and gearInfo and gearShopData.Gear then
local dropdownItems = {}
for gearName, shopInfo in pairs(gearShopData.Gear) do
local gearDetails = gearInfo[gearName]
if gearDetails and shopInfo.DisplayInShop ~= false then
table.insert(dropdownItems, {
Title = gearDetails.GearName or gearName,
Icon = gearDetails.Asset or "",
Desc = string.format("$%s | %s", shopInfo.Price or 0, gearDetails.GearRarity or "Unknown"),
Value = gearName,
Data = {Name = gearName, DisplayName = gearDetails.GearName or gearName, Price = shopInfo.Price or 0, Rarity = gearDetails.GearRarity or "Unknown", SpecialCurrencyType = shopInfo.SpecialCurrencyType}
})
end
end
table.sort(dropdownItems, function(a, b) return a.Data.Price < b.Data.Price end)
gearDropdown:Refresh(dropdownItems, {})
else
gearDropdown:Refresh({{Title = "Failed to load", Icon = "x-circle", Desc = "Gear data modules not found"}})
end
end)
end
})
autoBuyGearToggle = Tabs.Shop:Toggle({
Title = "Auto Buy Gear",
Value = false,
Callback = function(state)
gearAutoBuyEnabled = state
if state then
gearAutoBuyTask = task.spawn(function()
while gearAutoBuyEnabled do
if #selectedGears > 0 then
for _, gearData in ipairs(selectedGears) do
if hasEnoughMoneyForItem(gearData) then
BuyGearStock:FireServer(gearData.Name)
end
task.wait(0.01)
end
for i = 1, 5 do
if not gearAutoBuyEnabled then break end
for _, gearData in ipairs(selectedGears) do
if hasEnoughMoneyForItem(gearData) then
BuyGearStock:FireServer(gearData.Name)
end
end
task.wait(0.05)
end
else
task.wait(0.5)
end
task.wait(0.1)
end
end)
else
if gearAutoBuyTask then task.cancel(gearAutoBuyTask) gearAutoBuyTask = nil end
end
end
})
autoBuyAllGearToggle = Tabs.Shop:Toggle({
Title = "Auto Buy All Gear",
Value = false,
Callback = function(state)
gearAutoBuyAllEnabled = state
if state then
gearAutoBuyAllTask = task.spawn(function()
while gearAutoBuyAllEnabled do
local gearShopData, _ = loadGearData()
if gearShopData and gearShopData.Gear then
for gearName, shopInfo in pairs(gearShopData.Gear) do
if shopInfo.DisplayInShop ~= false then
local itemData = {Price = shopInfo.Price or 0, SpecialCurrencyType = shopInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(itemData) then
BuyGearStock:FireServer(gearName)
end
end
task.wait(0.01)
end
for i = 1, 8 do
if not gearAutoBuyAllEnabled then break end
for gearName, shopInfo in pairs(gearShopData.Gear) do
if shopInfo.DisplayInShop ~= false then
local itemData = {Price = shopInfo.Price or 0, SpecialCurrencyType = shopInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(itemData) then
BuyGearStock:FireServer(gearName)
end
end
end
task.wait(0.04)
end
else
task.wait(0.5)
end
task.wait(0.15)
end
end)
else
if gearAutoBuyAllTask then task.cancel(gearAutoBuyAllTask) gearAutoBuyAllTask = nil end
end
end
})
Tabs.Shop:Section({ Title = "Cosmetic Autobuy", TextSize = 20 })
Tabs.Shop:Divider()
local crateShopModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("CosmeticCrateShopData")
local itemShopModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("CosmeticItemShopData")
local cosmeticRegistryModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("CosmeticRegistry"):WaitForChild("CosmeticList")
local cosmeticCratesModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("CosmeticCrateRegistry"):WaitForChild("CosmeticCrates")
local BuyCosmeticCrate = ReplicatedStorage.GameEvents.BuyCosmeticCrate
local BuyCosmeticItem = ReplicatedStorage.GameEvents.BuyCosmeticItem
local BuyCosmeticShopFence = ReplicatedStorage.GameEvents.BuyCosmeticShopFence
local cosmeticAutoBuyEnabled = false
local cosmeticAutoBuyTask = nil
local selectedCosmetics = {}
local cosmeticAutoBuyAllEnabled = false
local cosmeticAutoBuyAllTask = nil
function loadCosmeticData()
local success, crateData = pcall(require, crateShopModule)
local success2, itemData = pcall(require, itemShopModule)
local success3, registryData = pcall(require, cosmeticRegistryModule)
local success4, cosmeticCrates = pcall(require, cosmeticCratesModule)
if success and success2 and success3 and success4 then return crateData, itemData, registryData, cosmeticCrates end
return nil, nil, nil, nil
end
cosmeticDropdown = Tabs.Shop:Dropdown({
Title = "Select Cosmetic",
Desc = "Choose cosmetics to auto buy (Press Refresh to load items)",
Values = {{Title = "Press Refresh to load items", Icon = "refresh-cw", Desc = "Click the refresh button above"}},
Value = {},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(options) 
selectedCosmetics = {}
for _, option in ipairs(options) do
if option.Data and option.Data.Name and option.Data.Type then table.insert(selectedCosmetics, option.Data) end
end
end
})
Tabs.Shop:Button({
Title = "Refresh Cosmetic Items",
Icon = "refresh-cw",
Callback = function()
task.spawn(function()
local crateData, itemData, registryData, cosmeticCrates = loadCosmeticData()
if crateData and itemData and registryData then
local dropdownItems = {}
for crateName, crateInfo in pairs(crateData) do
local regInfo = registryData[crateInfo.CrateName or crateName]
local crateReg = cosmeticCrates and (cosmeticCrates[crateInfo.CrateName or crateName] or cosmeticCrates[crateName])
local icon = crateReg and crateReg.Icon or (regInfo and regInfo.Icon or "")
local currencyDisplay = ""
if crateInfo.SpecialCurrencyType and crateInfo.SpecialCurrencyType ~= "" then
currencyDisplay = string.format("%s %s", crateInfo.Price or 0, crateInfo.SpecialCurrencyType)
else
currencyDisplay = string.format("$%s", crateInfo.Price or 0)
end
table.insert(dropdownItems, {
Title = crateInfo.CrateName or crateName,
Icon = icon,
Desc = string.format("Crate | %s | %s", currencyDisplay, crateInfo.CrateRarity or "Unknown"),
Value = crateName,
Data = {Name = crateName, DisplayName = crateInfo.CrateName or crateName, Price = crateInfo.Price or 0, Rarity = crateInfo.CrateRarity or "Unknown", Type = "CRATE", SpecialCurrencyType = crateInfo.SpecialCurrencyType}
})
end
for itemName, itemInfo in pairs(itemData) do
local regInfo = registryData[itemInfo.CosmeticName or itemName]
local currencyDisplay = ""
if itemInfo.SpecialCurrencyType and itemInfo.SpecialCurrencyType ~= "" then
currencyDisplay = string.format("%s %s", itemInfo.Price or 0, itemInfo.SpecialCurrencyType)
else
currencyDisplay = string.format("$%s", itemInfo.Price or 0)
end
table.insert(dropdownItems, {
Title = itemInfo.CosmeticName or itemName,
Icon = regInfo and regInfo.Icon or "",
Desc = string.format("Item | %s", currencyDisplay),
Value = itemName,
Data = {Name = itemName, DisplayName = itemInfo.CosmeticName or itemName, Price = itemInfo.Price or 0, Type = "ITEM", SpecialCurrencyType = itemInfo.SpecialCurrencyType}
})
end
local fences = {{Name = "FLOWER", DisplayName = "Flower Fence", Type = "FENCE", Price = 0},{Name = "WOOD", DisplayName = "Wood Fence", Type = "FENCE", Price = 0},{Name = "STONE", DisplayName = "Stone Fence", Type = "FENCE", Price = 0}}
for _, fence in ipairs(fences) do
table.insert(dropdownItems, {Title = fence.DisplayName, Icon = "grid", Desc = "Fence", Value = fence.Name, Data = {Name = fence.Name, DisplayName = fence.DisplayName, Price = fence.Price, Type = "FENCE"}})
end
table.sort(dropdownItems, function(a, b) if a.Data.Type == b.Data.Type then return a.Title < b.Title end return a.Data.Type < b.Data.Type end)
cosmeticDropdown:Refresh(dropdownItems, {})
else
cosmeticDropdown:Refresh({{Title = "Failed to load", Icon = "x-circle", Desc = "Cosmetic data not found"}})
end
end)
end
})
autoBuyCosmeticToggle = Tabs.Shop:Toggle({
Title = "Auto Buy Cosmetic",
Value = false,
Callback = function(state)
cosmeticAutoBuyEnabled = state
if state then
cosmeticAutoBuyTask = task.spawn(function()
while cosmeticAutoBuyEnabled do
if #selectedCosmetics > 0 then
for _, cosmeticData in ipairs(selectedCosmetics) do
if hasEnoughMoneyForItem(cosmeticData) then
if cosmeticData.Type == "CRATE" then BuyCosmeticCrate:FireServer(cosmeticData.Name, "Cosmetics")
elseif cosmeticData.Type == "ITEM" then BuyCosmeticItem:FireServer(cosmeticData.Name, "Cosmetics")
elseif cosmeticData.Type == "FENCE" then BuyCosmeticShopFence:FireServer(cosmeticData.Name, "Fences") end
end
task.wait(0.01)
end
for i = 1, 5 do
if not cosmeticAutoBuyEnabled then break end
for _, cosmeticData in ipairs(selectedCosmetics) do
if hasEnoughMoneyForItem(cosmeticData) then
if cosmeticData.Type == "CRATE" then BuyCosmeticCrate:FireServer(cosmeticData.Name, "Cosmetics")
elseif cosmeticData.Type == "ITEM" then BuyCosmeticItem:FireServer(cosmeticData.Name, "Cosmetics")
elseif cosmeticData.Type == "FENCE" then BuyCosmeticShopFence:FireServer(cosmeticData.Name, "Fences") end
end
end
task.wait(0.05)
end
else
task.wait(0.5)
end
task.wait(0.1)
end
end)
else
if cosmeticAutoBuyTask then task.cancel(cosmeticAutoBuyTask) cosmeticAutoBuyTask = nil end
end
end
})
autoBuyAllCosmeticToggle = Tabs.Shop:Toggle({
Title = "Auto Buy All Cosmetic",
Value = false,
Callback = function(state)
cosmeticAutoBuyAllEnabled = state
if state then
cosmeticAutoBuyAllTask = task.spawn(function()
while cosmeticAutoBuyAllEnabled do
local crateData, itemData, _ = loadCosmeticData()
if crateData then
for crateName, crateInfo in pairs(crateData) do
local itemData = {Price = crateInfo.Price or 0, SpecialCurrencyType = crateInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(itemData) then
BuyCosmeticCrate:FireServer(crateName, "Cosmetics")
end
task.wait(0.01)
end
end
if itemData then
for itemName, itemInfo in pairs(itemData) do
local checkData = {Price = itemInfo.Price or 0, SpecialCurrencyType = itemInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(checkData) then
BuyCosmeticItem:FireServer(itemName, "Cosmetics")
end
task.wait(0.01)
end
end
local fences = {"FLOWER", "WOOD", "STONE"}
for _, fenceName in ipairs(fences) do
BuyCosmeticShopFence:FireServer(fenceName, "Fences")
task.wait(0.01)
end
for i = 1, 8 do
if not cosmeticAutoBuyAllEnabled then break end
if crateData then
for crateName, crateInfo in pairs(crateData) do
local checkData = {Price = crateInfo.Price or 0, SpecialCurrencyType = crateInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(checkData) then
BuyCosmeticCrate:FireServer(crateName, "Cosmetics")
end
end
end
if itemData then
for itemName, itemInfo in pairs(itemData) do
local checkData = {Price = itemInfo.Price or 0, SpecialCurrencyType = itemInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(checkData) then
BuyCosmeticItem:FireServer(itemName, "Cosmetics")
end
end
end
for _, fenceName in ipairs(fences) do
BuyCosmeticShopFence:FireServer(fenceName, "Fences")
end
task.wait(0.04)
end
task.wait(0.15)
end
end)
else
if cosmeticAutoBuyAllTask then task.cancel(cosmeticAutoBuyAllTask) cosmeticAutoBuyAllTask = nil end
end
end
})
Tabs.Shop:Section({ Title = "Traveling Merchant Autobuy", TextSize = 20 })
Tabs.Shop:Divider()
local seedPackDataModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("SeedPackData")
local petListModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("PetRegistry"):WaitForChild("PetList")
local cosmeticListModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("CosmeticRegistry"):WaitForChild("CosmeticList")
local gearDataModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("GearData")
local petEggsModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("PetRegistry"):WaitForChild("PetEggs")
local cosmeticCratesModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("CosmeticCrateRegistry"):WaitForChild("CosmeticCrates")
local travelingMerchantFolder = ReplicatedStorage:WaitForChild("Data"):WaitForChild("TravelingMerchant"):WaitForChild("TravelingMerchantData")
local BuyTravelingMerchantShopStock = ReplicatedStorage.GameEvents.BuyTravelingMerchantShopStock
local travelingAutoBuyEnabled = false
local travelingAutoBuyTask = nil
local selectedTraveling = {}
local travelingAutoBuyAllEnabled = false
local travelingAutoBuyAllTask = nil
function loadTravelingMerchantData()
local seedData = {} pcall(function() seedData = require(seedDataModule) end)
local seedPackPacks = {} pcall(function() seedPackPacks = require(seedPackDataModule).Packs or {} end)
local petList = {} pcall(function() petList = require(petListModule) end)
local cosmeticList = {} pcall(function() cosmeticList = require(cosmeticListModule) end)
local gearData = {} pcall(function() gearData = require(gearDataModule) end)
local petEggs = {} pcall(function() petEggs = require(petEggsModule) end)
local cosmeticCrates = {} pcall(function() cosmeticCrates = require(cosmeticCratesModule) end)
local dropdownItems = {}
for _, child in ipairs(travelingMerchantFolder:GetChildren()) do
if child:IsA("ModuleScript") then
local success, merchantData = pcall(require, child)
if success then
for itemName, itemInfo in pairs(merchantData) do
if itemInfo.Price and itemInfo.DisplayInShop ~= false then
local displayName = itemInfo.SeedName or itemInfo.DisplayName or itemName
local rarity = itemInfo.SeedRarity or itemInfo.Rarity or "Unknown"
local icon = itemInfo.Icon or ""
local itype = itemInfo.ItemType or "Seed"
local currencyDisplay = ""
if itemInfo.SpecialCurrencyType and itemInfo.SpecialCurrencyType ~= "" then
currencyDisplay = string.format("%s %s", itemInfo.Price, itemInfo.SpecialCurrencyType)
else
currencyDisplay = string.format("$%s", itemInfo.Price)
end
if icon == "" then
if itype == "Seed" then
local s = seedData[itemName] or seedData[displayName]
icon = s and (s.FruitIcon or s.Asset or "") or ""
elseif itype == "Pack" or string.find(itype, "Pack") then
local p = seedPackPacks[itemName] or seedPackPacks[displayName]
icon = p and p.Icon or ""
elseif itype == "Pet" then
local p = petList[itemName] or petList[displayName]
icon = p and p.Icon or ""
elseif itype == "Cosmetic" then
local c = cosmeticList[itemName] or cosmeticList[displayName]
icon = c and c.Icon or ""
elseif itype == "Gear" then
local g = gearData[itemName] or gearData[displayName]
icon = g and (g.Asset or "") or ""
elseif itype == "Egg" or string.find(itype, "Egg") then
local e = petEggs[itemName] or petEggs[displayName]
icon = e and e.Icon or ""
elseif itype == "Crate" or string.find(itype, "Crate") or itype == "CosmeticCrate" then
local cr = cosmeticCrates[itemName] or cosmeticCrates[displayName]
icon = cr and cr.Icon or ""
end
end
table.insert(dropdownItems, {
Title = displayName,
Icon = icon,
Desc = string.format("%s | %s", currencyDisplay, rarity),
Value = itemName,
Data = {Name = itemName, DisplayName = displayName, Price = itemInfo.Price, Rarity = rarity, SpecialCurrencyType = itemInfo.SpecialCurrencyType}
})
end
end
end
end
end
table.sort(dropdownItems, function(a, b) return a.Data.Price < b.Data.Price end)
return dropdownItems
end
travelingDropdown = Tabs.Shop:Dropdown({
Title = "Select Traveling Merchant Item",
Desc = "Choose items to auto buy (Press Refresh to load items)",
Values = {{Title = "Press Refresh to load items", Icon = "refresh-cw", Desc = "Click the refresh button above"}},
Value = {},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(options)
selectedTraveling = {}
for _, option in ipairs(options) do if option.Data and option.Data.Name then table.insert(selectedTraveling, option.Data) end end
end
})
Tabs.Shop:Button({
Title = "Refresh Traveling Items",
Icon = "refresh-cw",
Callback = function()
local items = loadTravelingMerchantData()
if #items > 0 then 
travelingDropdown:Refresh(items, {}) 
else 
travelingDropdown:Refresh({{Title = "Failed to load", Icon = "x-circle", Desc = "Traveling merchant data not found"}}) 
end
end
})
travelingAutoBuyToggle = Tabs.Shop:Toggle({
Title = "Auto Buy Traveling Merchant",
Value = false,
Callback = function(state)
travelingAutoBuyEnabled = state
if state then
travelingAutoBuyTask = task.spawn(function()
while travelingAutoBuyEnabled do
if #selectedTraveling > 0 then
for _, itemData in ipairs(selectedTraveling) do
if hasEnoughMoneyForItem(itemData) then
BuyTravelingMerchantShopStock:FireServer(itemData.Name)
end
task.wait(0.01)
end
for i = 1, 5 do
if not travelingAutoBuyEnabled then break end
for _, itemData in ipairs(selectedTraveling) do
if hasEnoughMoneyForItem(itemData) then
BuyTravelingMerchantShopStock:FireServer(itemData.Name)
end
end
task.wait(0.05)
end
else
task.wait(0.5)
end
task.wait(0.1)
end
end)
else
if travelingAutoBuyTask then task.cancel(travelingAutoBuyTask) travelingAutoBuyTask = nil end
end
end
})
travelingAutoBuyAllToggle = Tabs.Shop:Toggle({
Title = "Auto Buy All Traveling Merchant",
Value = false,
Callback = function(state)
travelingAutoBuyAllEnabled = state
if state then
travelingAutoBuyAllTask = task.spawn(function()
while travelingAutoBuyAllEnabled do
for _, child in ipairs(travelingMerchantFolder:GetChildren()) do
if child:IsA("ModuleScript") then
local success, merchantData = pcall(require, child)
if success then
for itemName, itemInfo in pairs(merchantData) do
if itemInfo.DisplayInShop ~= false then
local itemData = {Price = itemInfo.Price or 0, SpecialCurrencyType = itemInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(itemData) then
BuyTravelingMerchantShopStock:FireServer(itemName)
end
end
task.wait(0.01)
end
end
end
end
for i = 1, 8 do
if not travelingAutoBuyAllEnabled then break end
for _, child in ipairs(travelingMerchantFolder:GetChildren()) do
if child:IsA("ModuleScript") then
local success, merchantData = pcall(require, child)
if success then
for itemName, itemInfo in pairs(merchantData) do
if itemInfo.DisplayInShop ~= false then
local itemData = {Price = itemInfo.Price or 0, SpecialCurrencyType = itemInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(itemData) then
BuyTravelingMerchantShopStock:FireServer(itemName)
end
end
end
end
end
end
task.wait(0.04)
end
task.wait(0.15)
end
end)
else
if travelingAutoBuyAllTask then task.cancel(travelingAutoBuyAllTask) travelingAutoBuyAllTask = nil end
end
end
})
Tabs.Shop:Section({ Title = "Event Shop Autobuy", TextSize = 20 })
Tabs.Shop:Divider()
local eventShopDataModule = ReplicatedStorage:WaitForChild("Data"):WaitForChild("EventShopData")
local BuyEventShopStock = ReplicatedStorage.GameEvents.BuyEventShopStock
local eventAutoBuyEnabled = false
local eventAutoBuyTask = nil
local selectedEventItems = {}
local eventAutoBuyAllEnabled = false
local eventAutoBuyAllTask = nil
function loadEventShopData()
local success, eventData = pcall(require, eventShopDataModule)
if success then return eventData end
return nil
end
function getAllEventItems()
local eventData = loadEventShopData()
if not eventData then return {} end
local allItems = {}
for eventName, itemsTable in pairs(eventData) do
for itemName, itemInfo in pairs(itemsTable) do
if itemInfo.Price then
local displayName = itemInfo.SeedName or itemInfo.DisplayName or itemName
local rarity = itemInfo.SeedRarity or itemInfo.Rarity or "Unknown"
local icon = itemInfo.Icon or ""
local itype = itemInfo.ItemType or "Item"
local seedData = pcall(require, seedDataModule) and require(seedDataModule) or {}
local currencyDisplay = ""
if itemInfo.SpecialCurrencyType and itemInfo.SpecialCurrencyType ~= "" then
currencyDisplay = string.format("%s %s", itemInfo.Price, itemInfo.SpecialCurrencyType)
else
currencyDisplay = string.format("$%s", itemInfo.Price)
end
if icon == "" and itype == "Seed" then
local s = seedData[itemName] or seedData[displayName]
icon = s and (s.FruitIcon or s.Asset or "") or ""
end
table.insert(allItems, {
Title = displayName,
Icon = icon,
Desc = string.format("[%s] %s | %s", eventName, currencyDisplay, rarity),
Value = itemName,
Data = {
Name = itemName,
DisplayName = displayName,
Price = itemInfo.Price,
Rarity = rarity,
EventName = eventName,
SpecialCurrencyType = itemInfo.SpecialCurrencyType
}
})
end
end
end
table.sort(allItems, function(a, b) return a.Data.Price < b.Data.Price end)
return allItems
end
eventDropdown = Tabs.Shop:Dropdown({
Title = "Select Event Item",
Desc = "Choose event items to auto buy (Press Refresh to load items)",
Values = {{Title = "Press Refresh to load items", Icon = "refresh-cw", Desc = "Click the refresh button above"}},
Value = {},
Multi = true,
AllowNone = true,
SearchBarEnabled = true,
Callback = function(options)
selectedEventItems = {}
for _, option in ipairs(options) do
if option.Data and option.Data.Name then
table.insert(selectedEventItems, option.Data)
end
end
end
})
Tabs.Shop:Button({
Title = "Refresh Event Items",
Icon = "refresh-cw",
Callback = function()
local allItems = getAllEventItems()
if #allItems > 0 then
eventDropdown:Refresh(allItems, {})
else
eventDropdown:Refresh({{Title = "No event items", Icon = "x-circle", Desc = "Event shop data not found"}})
end
end
})
autoBuyEventToggle = Tabs.Shop:Toggle({
Title = "Auto Buy Event Item",
Value = false,
Callback = function(state)
eventAutoBuyEnabled = state
if state then
eventAutoBuyTask = task.spawn(function()
while eventAutoBuyEnabled do
if #selectedEventItems > 0 then
for _, itemData in ipairs(selectedEventItems) do
if hasEnoughMoneyForItem(itemData) then
BuyEventShopStock:FireServer(itemData.Name, itemData.EventName)
end
task.wait(0.01)
end
for i = 1, 5 do
if not eventAutoBuyEnabled then break end
for _, itemData in ipairs(selectedEventItems) do
if hasEnoughMoneyForItem(itemData) then
BuyEventShopStock:FireServer(itemData.Name, itemData.EventName)
end
end
task.wait(0.05)
end
else
task.wait(0.5)
end
task.wait(0.1)
end
end)
else
if eventAutoBuyTask then task.cancel(eventAutoBuyTask) eventAutoBuyTask = nil end
end
end
})
autoBuyAllEventToggle = Tabs.Shop:Toggle({
Title = "Auto Buy All Event Items",
Value = false,
Callback = function(state)
eventAutoBuyAllEnabled = state
if state then
eventAutoBuyAllTask = task.spawn(function()
while eventAutoBuyAllEnabled do
local eventData = loadEventShopData()
if eventData then
for eventName, itemsTable in pairs(eventData) do
for itemName, itemInfo in pairs(itemsTable) do
if itemInfo.Price then
local itemData = {Price = itemInfo.Price, SpecialCurrencyType = itemInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(itemData) then
BuyEventShopStock:FireServer(itemName, eventName)
end
end
task.wait(0.01)
end
end
for i = 1, 8 do
if not eventAutoBuyAllEnabled then break end
for eventName, itemsTable in pairs(eventData) do
for itemName, itemInfo in pairs(itemsTable) do
if itemInfo.Price then
local itemData = {Price = itemInfo.Price, SpecialCurrencyType = itemInfo.SpecialCurrencyType}
if hasEnoughMoneyForItem(itemData) then
BuyEventShopStock:FireServer(itemName, eventName)
end
end
end
end
task.wait(0.04)
end
else
task.wait(0.5)
end
task.wait(0.15)
end
end)
else
if eventAutoBuyAllTask then task.cancel(eventAutoBuyAllTask) eventAutoBuyAllTask = nil end
end
end
})
autoBuyRebirth = false
Tabs.Shop:Space()
Tabs.Shop:Toggle({
Title = "Auto Buy Rebirth",
Default = false,
Callback = function(state)
autoBuyRebirth = state
if autoBuyRebirth then
while autoBuyRebirth do
local sheckles = DataService:GetData().Sheckles or 0
if sheckles >= 0 then
ReplicatedStorage.GameEvents.BuyRebirth:FireServer()
end
task.wait(300)
end
end
end
})
Tabs.Settings:Section({ Title = "Config Manager", TextSize = 20 })
Tabs.Settings:Divider()
local ConfigManager = Window.ConfigManager
local CurrentConfigName = "default"
local AutoLoadConfig = "default"
local AutoLoadEnabled = false
local AutoSaveEnabled = false
local ConfigListDropdown = nil
local AutoSaveConnection = nil
function FileExists(path)
if isfile then
return pcall(readfile, path)
end
return false
end
function WriteFile(path, content)
if writefile then
return pcall(writefile, path, content)
end
return false
end
function ReadFile(path)
if readfile then
local success, content = pcall(readfile, path)
if success then
return content
end
end
return ""
end
function loadAutoLoadSettings()
local autoLoadFile = "Darahub/AutoLoad/Game/Grow-A-Garden/AutoLoad.json"
if FileExists(autoLoadFile) then
local content = ReadFile(autoLoadFile)
if content ~= "" then
local success, data = pcall(function()
return HttpService:JSONDecode(content)
end)
if success and data then
AutoLoadConfig = data.configName or "default"
AutoLoadEnabled = data.enabled or false
return true
end
end
end
AutoLoadConfig = "default"
AutoLoadEnabled = false
return false
end
function saveAutoLoadSettings()
local autoLoadFile = "Darahub/AutoLoad/Game/Grow-A-Garden/AutoLoad.json"
local success = WriteFile(autoLoadFile, "")
if not success then
if makefolder then
pcall(function() makefolder("Darahub") end)
pcall(function() makefolder("Darahub/AutoLoad") end)
pcall(function() makefolder("Darahub/AutoLoad/Game") end)
pcall(function() makefolder("Darahub/AutoLoad/Game/Grow-A-Garden") end)
end
end
local data = {
enabled = AutoLoadEnabled,
configName = AutoLoadConfig
}
local success, json = pcall(function()
return HttpService:JSONEncode(data)
end)
if success then
WriteFile(autoLoadFile, json)
end
end
loadAutoLoadSettings()
ConfigNameInput = Tabs.Settings:Input({
Title = "Config Name",
Flag = "ConfigNameInput",
Flag = "ConfigNameInput",
Desc = "Name for your config file",
Icon = "file-cog",
Placeholder = "default",
Value = CurrentConfigName,
Callback = function(value)
if value ~= "" then
CurrentConfigName = value
end
end
})
Tabs.Settings:Space()
AutoLoadToggle = Tabs.Settings:Toggle({
Title = "Auto Load",
Flag = "AutoLoadToggle",
Flag = "AutoLoadToggle",
Desc = "Automatically load this config when script starts",
Value = AutoLoadEnabled,
Callback = function(state)
AutoLoadEnabled = state
if state then
AutoLoadConfig = CurrentConfigName
WindUI:Notify({
Title = "Auto-Load",
Content = "Config '" .. CurrentConfigName .. "' will load automatically on startup",
Duration = 3
})
end
saveAutoLoadSettings()
end
})
AutoSaveToggle = Tabs.Settings:Toggle({
Title = "Auto Save",
Flag = "AutoSaveToggle",
Flag = "AutoSaveToggle",
Desc = "Automatically save changes to config every second",
Value = AutoSaveEnabled,
Callback = function(state)
AutoSaveEnabled = state
if AutoSaveConnection then
AutoSaveConnection:Disconnect()
AutoSaveConnection = nil
end
if state then
WindUI:Notify({
Title = "Auto-Save",
Content = "Config will save automatically every second",
Duration = 2
})
AutoSaveConnection = RunService.Heartbeat:Connect(function()
if AutoSaveEnabled and CurrentConfigName ~= "" then
task.spawn(function()
Window.CurrentConfig = ConfigManager:Config(CurrentConfigName)
Window.CurrentConfig:Save()
end)
end
task.wait(1) 
end)
else
WindUI:Notify({
Title = "Auto-Save",
Content = "Auto-save disabled",
Duration = 2
})
end
end
})
Tabs.Settings:Space()
function refreshConfigList()
local allConfigs = ConfigManager:AllConfigs() or {}
if not table.find(allConfigs, "default") then
local defaultConfig = ConfigManager:Config("default")
if defaultConfig and defaultConfig.Save then
defaultConfig:Save()
end
table.insert(allConfigs, 1, "default")
end
table.sort(allConfigs, function(a, b)
return a:lower() < b:lower()
end)
local defaultValue = table.find(allConfigs, CurrentConfigName) and CurrentConfigName or "default"
if ConfigListDropdown and ConfigListDropdown.Refresh then
ConfigListDropdown:Refresh(allConfigs, defaultValue)
end
end
ConfigListDropdown = Tabs.Settings:Dropdown({
Title = "Existing Configs",
Flag = "ConfigListDropdown",
Flag = "ConfigListDropdown",
Desc = "Select from saved configs",
Values = {"default"},
Value = "default",
Callback = function(value)
CurrentConfigName = value
ConfigNameInput:Set(value)
if AutoLoadEnabled then
AutoLoadConfig = value
saveAutoLoadSettings()
end
local config = ConfigManager:GetConfig(value)
if config then
WindUI:Notify({
Title = "Config Selected",
Content = "Config '" .. value .. "' selected",
Duration = 2
})
end
end
})
Tabs.Settings:Space()
SaveConfigButton = Tabs.Settings:Button({
Title = "Save Config",
Desc = "Save current settings to config",
Icon = "save",
Callback = function()
if CurrentConfigName == "" then
WindUI:Notify({
Title = "Error",
Content = "Please enter a config name",
Duration = 3
})
return
end
Window.CurrentConfig = ConfigManager:Config(CurrentConfigName)
local success = Window.CurrentConfig:Save()
if success then
WindUI:Notify({
Title = "Config Saved",
Content = "Config '" .. CurrentConfigName .. "' saved successfully",
Duration = 3
})
if AutoLoadEnabled then
AutoLoadConfig = CurrentConfigName
saveAutoLoadSettings()
end
task.wait(0.5)
refreshConfigList()
else
WindUI:Notify({
Title = "Error",
Content = "Failed to save config",
Duration = 3
})
end
end
})
Tabs.Settings:Space()
LoadConfigButton = Tabs.Settings:Button({
Title = "Load Config",
Desc = "Load settings from selected config",
Icon = "folder-open",
Callback = function()
if CurrentConfigName == "" then
WindUI:Notify({
Title = "Error",
Content = "Please enter a config name",
Duration = 3
})
return
end
Window.CurrentConfig = ConfigManager:CreateConfig(CurrentConfigName)
local success = Window.CurrentConfig:Load()
if success then
WindUI:Notify({
Title = "Config Loaded",
Content = "Config '" .. CurrentConfigName .. "' loaded successfully",
Duration = 3
})
if AutoLoadEnabled then
AutoLoadConfig = CurrentConfigName
saveAutoLoadSettings()
end
else
WindUI:Notify({
Title = "Error",
Content = "Config '" .. CurrentConfigName .. "' not found or empty",
Duration = 3
})
end
end
})
Tabs.Settings:Space()
DeleteConfigButton = Tabs.Settings:Button({
Title = "Delete Config",
Desc = "Delete selected config",
Icon = "trash-2",
Color = Color3.fromHex("#ff4830"),
Callback = function()
if CurrentConfigName == "default" then
WindUI:Notify({
Title = "Error",
Content = "Cannot delete default config",
Duration = 3
})
return
end
local success = ConfigManager:DeleteConfig(CurrentConfigName)
if success then
WindUI:Notify({
Title = "Config Deleted",
Content = "Config '" .. CurrentConfigName .. "' deleted",
Duration = 3
})
CurrentConfigName = "default"
ConfigNameInput:Set("default")
if AutoLoadEnabled then
AutoLoadConfig = "default"
saveAutoLoadSettings()
end
task.wait(0.5)
refreshConfigList()
else
WindUI:Notify({
Title = "Error",
Content = "Failed to delete config or config doesn't exist",
Duration = 3
})
end
end
})
Tabs.Settings:Space()
RefreshConfigButton = Tabs.Settings:Button({
Title = "Refresh Config List",
Desc = "Update the list of available configs",
Icon = "refresh-cw",
Callback = function()
refreshConfigList()
WindUI:Notify({
Title = "Config List Refreshed",
Content = "Config list updated",
Duration = 2
})
end
})
task.spawn(function()
task.wait(0.5) 
refreshConfigList()
ConfigNameInput:Set("default")
if AutoLoadEnabled then
CurrentConfigName = AutoLoadConfig
ConfigNameInput:Set(CurrentConfigName)
task.wait(1)
Window.CurrentConfig = ConfigManager:Config(CurrentConfigName)
if Window.CurrentConfig:Load() then
WindUI:Notify({
Title = "Auto-Loaded",
Content = "Config '" .. CurrentConfigName .. "' loaded automatically",
Duration = 3
})
end
end
end)
if AutoSaveEnabled then
task.spawn(function()
task.wait(1)
if AutoSaveEnabled then
AutoSaveConnection = RunService.Heartbeat:Connect(function()
if AutoSaveEnabled and CurrentConfigName ~= "" then
task.spawn(function()
Window.CurrentConfig = ConfigManager:Config(CurrentConfigName)
Window.CurrentConfig:Save()
end)
end
task.wait(1)
end)
end
end)
end
Tabs.Settings:Section({ Title = "Personalize", TextSize = 20 })
Tabs.Settings:Divider()
themes = {}
availableThemes = WindUI:GetThemes()
for themeName, _ in pairs(availableThemes) do
table.insert(themes, themeName)
end
table.sort(themes)
ThemeDropdown = Tabs.Settings:Dropdown({
Title = "Select Theme",
Flag = "ThemeDropdown",
Values = themes,
SearchBarEnabled = true,
MenuWidth = 280,
Value = themes[1],
Callback = function(theme)
WindUI:SetTheme(theme)
end
})
TransparencySlider = Tabs.Settings:Slider({
Title = "Window Transparency",
Step = 0.01,
Flag = "TransparencySlider",
Value = { Min = 0, Max = 1, Default = WindUI.TransparencyValue },
Callback = function(value)
WindUI.TransparencyValue = tonumber(value)
Window:ToggleTransparency(tonumber(value) > 0)
end
})
Tabs.Settings:Section({ Title = "Keybinds" })
Tabs.Settings:Keybind({
Flag = "Keybind",
Title = "Keybind",
Desc = "Keybind to open ui",
Value = "RightControl",
Callback = function(RightControl)
Window:SetToggleKey(Enum.KeyCode[RightControl])
end
})
Tabs.Settings:Space()
FlyTogglekeybind = Tabs.Settings:Keybind({
Title = "Fly Toggle",
Desc = "Keybind to toggle Fly",
Value = "",
Flag = "FlyTogglekeybind",
Callback = function(v)
FlyToggle:Set(not FlyToggle.Value)
end
})
Tabs.Settings:Space()
Tabs.Settings:Keybind({
Title = "Invisible Toggle",
Desc = "Keybind to toggle invisible mode",
Value = "I",
Callback = function(v)
vu9 = not vu9
if ButtonLib and ButtonLib.InvisibleToggle then
ButtonLib.InvisibleToggle:Set(vu9)
end
for _, part in pairs(vu10) do
part.Transparency = vu9 and 0.5 or 0
end
end
})
do
local DarahubFolder = CoreGui:FindFirstChild("Darahub")
if DarahubFolder and Tabs and Tabs.Settings then
Tabs.Settings:Section({
Title = "GUI Size"
})
local defaultScales = {}
for _, Element in pairs(DarahubFolder:GetChildren()) do
if Element:IsA("Frame") and Element:FindFirstChild("UIScale") then
defaultScales[Element.Name] = Element.UIScale.Scale
end
end
Tabs.Settings:Button({
Title = "Reset All Scales",
Description = "Reverts all buttons to their startup scale values",
Callback = function()
for _, Element in pairs(DarahubFolder:GetChildren()) do
if Element:IsA("Frame") and Element:FindFirstChild("UIScale") then
local original = defaultScales[Element.Name] or 1
Element.UIScale.Scale = original
end
end
end
})
for _, Element in pairs(DarahubFolder:GetChildren()) do
if Element:IsA("Frame") and Element:FindFirstChild("UIScale") then
local currentScale = tonumber(Element.UIScale.Scale) or 1
Tabs.Settings:Slider({
Title = Element.Name .. " Scale",
Desc = "Adjust GUI scale",
Flag = "Scale_Slider_" .. Element.Name,
Step = 0.01,
Value = {
Min = 0.01,
Max = 4,
Default = currentScale
},
Callback = function(val)
if Element and Element:FindFirstChild("UIScale") then
Element.UIScale.Scale = tonumber(val)
end
end
})
end
end
end
end
Tabs.Settings:Space()

local FPSCounter = CoreGui:FindFirstChild("FPSCounter")

if FPSCounter then
    FPSCounterToggle = Tabs.Settings:Toggle({
        Title = "Show FPS Counter",
        Flag = "FPSCounterToggle",
        Value = true,
        Callback = function(state)
            local currentCounter = CoreGui:FindFirstChild("FPSCounter")
            if currentCounter and currentCounter:IsA("ScreenGui") then
                currentCounter.Enabled = state
            end
        end
    })

    local currentCounter = CoreGui:FindFirstChild("FPSCounter")
    if currentCounter and currentCounter:IsA("ScreenGui") then
        FPSCounterToggle:Set(currentCounter.Enabled)
    end
end
Tabs.Settings:Section({ Title = "Sensitivity Controls", TextSize = 20 })
Tabs.Settings:Divider()
MouseSensitivityEnabled = false
MouseSensitivityValue = 1.0
MIN_SENSITIVITY = 0.1
MAX_SENSITIVITY = 20.0
DEFAULT_SENSITIVITY = 1.0
cameraInputModule = nil
mouseHookActive = false
touchHookActive = false
function setupSensitivityHook()
if cameraInputModule then return true end
LocalPlayer = Players.LocalPlayer
success = false
pcall(function()
playerScripts = LocalPlayer:FindFirstChild("PlayerScripts")
if not playerScripts then return end
playerModule = playerScripts:FindFirstChild("PlayerModule")
if not playerModule then return end
cameraModule = playerModule:FindFirstChild("CameraModule")
if cameraModule then
cameraInput = cameraModule:FindFirstChild("CameraInput")
if cameraInput then
cameraInputModule = require(cameraInput)
if cameraInputModule and cameraInputModule.getRotation then
originalGetRotation = cameraInputModule.getRotation
cameraInputModule.getRotation = function(disableRotation)
rotation = originalGetRotation(disableRotation)
if MouseSensitivityEnabled and UserInputService.MouseEnabled then
return rotation * MouseSensitivityValue
elseif TouchSensitivityEnabled and UserInputService.TouchEnabled then
return rotation * TouchSensitivityValue
end
return rotation
end
success = true
end
end
end
end)
return success
end
MouseSensitivityToggle = Tabs.Settings:Toggle({
Title = "Mouse Sensitivity",
Flag = "MouseSensitivityToggle",
Desc = "Adjust mouse sensitivity",
Value = false,
Callback = function(state)
MouseSensitivityEnabled = state
if state then
if not setupSensitivityHook() then
WindUI:Notify({
Title = "Mouse Sensitivity",
Content = "Failed to hook system. Try rejoining.",
Duration = 3
})
MouseSensitivityToggle:Set(false)
MouseSensitivityEnabled = false
end
end
end
})
MouseSensitivitySlider = Tabs.Settings:Slider({
Title = "Mouse Sensitivity Value",
Flag = "MouseSensitivitySlider",
Desc = "Lower = slower, Higher = faster (Max: 20)",
Value = { Min = 0.1, Max = 20, Default = 1.0 },
Step = 0.1,
Callback = function(value)
MouseSensitivityValue = value
end
})
Tabs.Settings:Space()
TouchSensitivityToggle = Tabs.Settings:Toggle({
Title = "Touch Sensitivity",
Flag = "TouchSensitivityToggle",
Desc = "Adjust touch/mobile sensitivity",
Value = false,
Callback = function(state)
TouchSensitivityEnabled = state
if state then
if not setupSensitivityHook() then
WindUI:Notify({
Title = "Touch Sensitivity",
Content = "Failed to hook system. Try rejoining.",
Duration = 3
})
TouchSensitivityToggle:Set(false)
TouchSensitivityEnabled = false
end
end
end
})
TouchSensitivitySlider = Tabs.Settings:Slider({
Title = "Touch Sensitivity Value",
Flag = "TouchSensitivitySlider",
Desc = "Lower = slower, Higher = faster (Max: 20)",
Value = { Min = 0.1, Max = 20, Default = 1.0 },
Step = 0.1,
Callback = function(value)
TouchSensitivityValue = value
end
})
Tabs.Settings:Space()
Tabs.Settings:Section({ Title = "Reset Controls", TextSize = 20 })
Tabs.Settings:Divider()
Tabs.Settings:Button({
Title = "Reset Sensitivity Settings",
Desc = "Reset both mouse and touch sensitivity to defaults",
Icon = "refresh-cw",
Color = Color3.fromHex("#FF3030"),
Callback = function()
MouseSensitivityEnabled = false
MouseSensitivityValue = DEFAULT_SENSITIVITY
TouchSensitivityEnabled = false
TouchSensitivityValue = DEFAULT_SENSITIVITY
cameraInputModule = nil
mouseHookActive = false
touchHookActive = false
if MouseSensitivityToggle then 
MouseSensitivityToggle:Set(false) 
end
if MouseSensitivitySlider then 
MouseSensitivitySlider:Set(1.0) 
end
if TouchSensitivityToggle then 
TouchSensitivityToggle:Set(false) 
end
if TouchSensitivitySlider then 
TouchSensitivitySlider:Set(1.0) 
end
WindUI:Notify({
Title = "Sensitivity Reset",
Content = "All sensitivity settings reset to default",
Duration = 3
})
end
})
local UniverseScriptsStuff = loadstring(game:HttpGet("https://darahub.pages.dev/Module/More-Scripts.Lua"))()
UniverseScriptsStuff(Tabs)