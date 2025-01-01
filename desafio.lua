-- for x = 1, 1000, 0.1 do
--     for y= 1, 1000, 0.1 do
--         for z= 1, 1000, 0.1 do
--             for alpha= 1, 1000, 0.1 do
--                 print(x, y, z, alpha)
--             end
--         end
--     end
-- end

--Habilitar chcp no codigo para o terminal
os.execute("chcp 65001")

-- Criatura
local monsterName = "Creeper"
local description = "Um monstro furtivo, com temperamento explosivo."
local emoji = "🧨"

-- Atributos
local attackAttribute = 10
local defenseAttribute = 1
local healthAttribute = 5
local speedAttribute = 4
local intAttribute = 2

local  function getProgressBar(attributes)
    local fullChar = "▓"
    local emptyChar = "░"

    local result = ""
    for i = 1, 10 do
        if i <= attributes then
            result = result .. fullChar
        else
            result = result .. emptyChar
        end
    end
    return result
end

--Cartao
print("================================================================")
print("|                                                               ")
print("|                                                               ")
print("|" .. monsterName .. " " .. emoji.. "                           ")
print("|" .. description.. "                                           ")
print("|                                                               ")
print("| Attributes:                                                   ")
print("|    Heath: ".. "  "..getProgressBar(healthAttribute).."        ")
print("|    Attack: ".. " "..getProgressBar(attackAttribute).."        ")
print("|    Defense: " ..""..getProgressBar(defenseAttribute).."       ")
print("|    Speed: ".. "  "..getProgressBar(speedAttribute).."         ")
print("|    Int: ".."    ".. getProgressBar(intAttribute).."           ")
print("|                                                               ")
print("|                                                               ")
print("================================================================")