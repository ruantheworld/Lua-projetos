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

--Tabela creeper
    local monster = {
        name = "Creeper",
        description = "De um extremo temperamento explosivo.",
        emoji = "🧨",
        attributes = {
            attack = 3,
            defense = 1,
            health = 10,
            speed = 4,
            int = 2
        }
    }
    
    -- Tabela atributos player
    local player = {
        name = "Player",
        description = "Gotta catch 'em all",
        emoji = "🧑",
        attributes = {
            attack = 3,
            defense = 1,
            health = 10,
            speed = 6,
            int = 4
        }
    }
    
    -- Barra
    local function getProgressBar(value, max)
        local fullChar = "▓"
        local emptyChar = "░"
        local totalBars = 10
        local progress = math.ceil((value/max)*totalBars)
    
        local result = ""
        for i = 1, totalBars do
            if i <= progress then
                result = result .. fullChar
            else
                result = result .. emptyChar
            end
        end
        return result
    end
    
    -- Cartão player, creeper
    local function displayBattle(player, monster)
        print("================================================================")
        print("| " .. player.name .. " " .. player.emoji .. string.rep(" ", 23 - #player.name - #player.emoji) .. "| " .. monster.name .. " " .. monster.emoji)
        print("| " .. player.description .. string.rep(" ", 22 - #player.description) .. "| " .. monster.description)
        print("|" .. string.rep(" ", 23).."|")
        print("| Health:  " .. " " .. getProgressBar(player.attributes.health, 10) .."  | Health: " .. "  " .. getProgressBar(monster.attributes.health, 10) .. "  ")
        print("| Attack:  " .. " " .. getProgressBar(player.attributes.attack, 10) .. "  | Attack: " .. "  " .. getProgressBar(monster.attributes.attack, 10) .. "  ")
        print("| Defense:  " .. "" .. getProgressBar(player.attributes.defense, 10) .. "  | Defense: " .. " " .. getProgressBar(monster.attributes.defense, 10) .. "  ")
        print("| Speed:  " .. "  " .. getProgressBar(player.attributes.speed, 10) .. "  | Speed:  " .. "  " .. getProgressBar(monster.attributes.speed, 10) .. "  ")
        print("| Int:  " .. "    " .. getProgressBar(player.attributes.int, 10) .. "  | Int:  " .. "    " .. getProgressBar(monster.attributes.int, 10) .. "  ")
        print("================================================================")
    end
    

    local function attack (attacker, defender)
        local damage = attacker.attributes.attack- defender.attributes.defense
        if damage <0 then
            damage = 0
        end
        defender.attributes.health = defender.attributes.health - damage
    end

    -- Inicio do combate
    while player.attributes.health > 0 and monster.attributes.health > 0 do
        displayBattle(player, monster)
        os.execute("timeout 1 >nul")

        attack(player, monster)
        if monster.attributes.health <= 0 then
            break
        end

        attack(monster, player)
        if player.attributes.health <= 0 then
            print(monster.name.. "venceu!")
            break
        end
    end

    displayBattle(player, monster)

    if player.attributes.health <= 0 then
        print("\nO jogador foi derrotado! Game Over.")
    elseif monster.attributes.health <= 0 then
        print("\nO Creeper foi derrotado! Vitória!")
    end