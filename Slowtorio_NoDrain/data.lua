-- REMOVE POWER DRAIN
-----------------------------------------------------
-----------------------------------------------------

-- ASSEMBLING MACHINES
for _, assembler in pairs(data.raw["assembling-machine"]) do
    assembler.energy_source.drain = "0kW"
end

-- INSERTERS
for _, inserter in pairs(data.raw["inserter"]) do
    inserter.energy_source.drain = "0kW"
end

-- MINING DRILLS
for _, drill in pairs(data.raw["mining-drill"]) do
    drill.energy_source.drain = "0kW"
end

-- FURNACES
for _, furnace in pairs(data.raw["furnace"]) do
    furnace.energy_source.drain = "0kW"
end

-- LABS
for _, lab in pairs(data.raw["lab"]) do
    lab.energy_source.drain = "0kW"
end

-- ACCUMULATORS
for _, accumulator in pairs(data.raw["accumulator"]) do
    accumulator.energy_source.drain = "0kW"
end

-- ROBOPORTS
for _, roboport in pairs(data.raw["roboport"]) do
    if roboport.energy_source and roboport.energy_source.drain then
        roboport.energy_source.drain = "0kW"
    end
    if roboport.energy_usage then
        roboport.energy_usage = "0kW"
    end
end


-- REMOVE POWER CONSUMPTION 
-----------------------------------------------------
-----------------------------------------------------

-- RADAR
for _, radar in pairs(data.raw["radar"]) do
    -- Disable sector scanning by setting the distance to 0
    radar.max_distance_of_sector_revealed = 0  -- Disables sector scanning
    
    -- Keep the nearby sector reveal functionality
    radar.max_distance_of_nearby_sector_revealed = 3  -- Default nearby reveal distance
    
    -- Scale energy-related values to 0.1% of their default values
    radar.energy_usage = tostring(tonumber(radar.energy_usage:match("%d+")) * 0.001) .. "W"
    
    if radar.energy_per_nearby_scan then
        radar.energy_per_nearby_scan = tostring(tonumber(radar.energy_per_nearby_scan:match("%d+")) * 0.001) .. "J"
    end
    
    if radar.energy_source and radar.energy_source.drain then
        radar.energy_source.drain = tostring(tonumber(radar.energy_source.drain:match("%d+")) * 0.001) .. "W"
    end
    
    -- Ensure normal scanning speed for nearby visibility
    radar.scanning_speed = 0.02  -- Default scanning speed
    radar.rotation_speed = 0.01  -- Default rotation speed
end



-- LAMPS
for _, lamp in pairs(data.raw["lamp"]) do
    if lamp.energy_usage_per_tick then
        lamp.energy_usage_per_tick = "1W"
    elseif lamp.energy_usage then
        lamp.energy_usage = "1W"
    elseif lamp.power_usage then
        lamp.power_usage = "1W"
    end
end

-- COMBINATORS
for _, combinator in pairs(data.raw["arithmetic-combinator"]) do
    combinator.energy_usage = "1W"
end

for _, combinator in pairs(data.raw["decider-combinator"]) do
    combinator.energy_usage = "1W"
end

for _, combinator in pairs(data.raw["constant-combinator"]) do
    combinator.energy_usage = "1W"
end

-- PROGRAMMABLE SPEAKER
for _, speaker in pairs(data.raw["programmable-speaker"]) do
    speaker.energy_usage = "1W"
end
