-- SET MAXIMUM OUTPUT OF ENGINES AND SOLAR PANELS TO 1% OF DEFAULT
-----------------------------------------------------

-- Function to adjust fluid usage for engines
local function adjust_engine_output(entity)
    if entity.fluid_usage_per_tick then
        entity.fluid_usage_per_tick = entity.fluid_usage_per_tick * 10
    end
end

-- Function to adjust production for solar panels
local function adjust_solar_output(entity)
    if entity.production then
        local number, unit = string.match(entity.production, "([%d%.]+)(%a+)")
        if number and unit then
            number = tonumber(number) * 10
            entity.production = tostring(number) .. unit
        end
    end
end

-- Adjust steam engines and other generators
for _, entity in pairs(data.raw["generator"] or {}) do
    adjust_engine_output(entity)
end

-- Adjust burner generators (if applicable)
for _, entity in pairs(data.raw["burner-generator"] or {}) do
    adjust_engine_output(entity)
end

-- Adjust solar panels
for _, entity in pairs(data.raw["solar-panel"] or {}) do
    adjust_solar_output(entity)
end
