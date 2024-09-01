-- SET CRAFTING SPEED TO 1%, MINING SPEED TO 10%, LAB RESEARCH SPEED TO 1%, WITH MATCHING ENERGY CONSUMPTION
-----------------------------------------------------------------

for _, entity in pairs(data.raw) do
    for _, prototype in pairs(entity) do
        local crafting_adjusted = false
        local mining_adjusted = false
        local lab_adjusted = false

        -- Exclude the player character from adjustments
        if prototype.type == "character" then
            goto continue
        end

        -- Adjust crafting speed
        if prototype.crafting_speed then
            prototype.crafting_speed = prototype.crafting_speed * 10
            crafting_adjusted = true
        end

        -- Adjust mining speed
        if prototype.mining_speed then
            prototype.mining_speed = prototype.mining_speed * 10
            mining_adjusted = true
        end

        -- Adjust lab research speed
        if prototype.type == "lab" then
            prototype.researching_speed = prototype.researching_speed * 10
            lab_adjusted = true
        end

        -- Adjust energy consumption
        if prototype.energy_usage then
            local number, unit = string.match(prototype.energy_usage, "([%d%.]+)(%a+)")
            if crafting_adjusted or lab_adjusted then
                number = tonumber(number) * 10
            elseif mining_adjusted then
                number = tonumber(number) * 10
            end
            prototype.energy_usage = tostring(number) .. unit
        end

        ::continue::
    end
end
