-- Function to adjust emissions_per_minute for all items with energy_source in data.raw
for _, entity_type in pairs(data.raw) do
    for entity_name, entity in pairs(entity_type) do
        if entity.energy_source and type(entity.energy_source.emissions_per_minute) == "number" then
            -- Multiply the current emissions_per_minute by 10
            entity.energy_source.emissions_per_minute = entity.energy_source.emissions_per_minute * 10
        end
    end
end
