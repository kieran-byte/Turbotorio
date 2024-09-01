-- Function to adjust animation speed for given entity and animation field
local function adjust_animation_speed(entity_name)
    local entity = data.raw["assembling-machine"][entity_name] or data.raw["chemical-plant"][entity_name]

    if entity and entity.animation then
        -- If the entity has multiple animation layers, handle each one
        if entity.animation.layers then
            for _, layer in ipairs(entity.animation.layers) do
                layer.animation_speed = 0.1
                if layer.hr_version then
                    layer.hr_version.animation_speed = 0.1
                end
            end
        else
            -- Single layer animation
            entity.animation.animation_speed = 0.1
            if entity.animation.hr_version then
                entity.animation.hr_version.animation_speed = 0.1
            end
        end
    end
end

-- List of all assembling machines and chemical plants
local entities_to_adjust = {
    "assembling-machine-1",
    "assembling-machine-2",
    "assembling-machine-3",
    "chemical-plant"
}

-- Apply the animation speed adjustment to each entity
for _, entity_name in pairs(entities_to_adjust) do
    adjust_animation_speed(entity_name)
end
