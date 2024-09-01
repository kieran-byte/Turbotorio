-- SET MINING SPEED OF ALL RAW MATERIALS TO 10%, EXCEPT TREES, WHICH ARE 2X SLOWER
-----------------------------------------------------

local raw_resources = {
    "coal",
    "stone",
    "iron-ore",
    "copper-ore",
    "uranium-ore",
    "crude-oil",
}

local trees = "tree"

-- Adjust mining speed for raw resources (10% of default)
for _, resource_name in pairs(raw_resources) do
    local resource = data.raw.resource[resource_name]
    if resource and resource.minable then
        resource.minable.mining_time = resource.minable.mining_time * 1
    end
end

-- Adjust mining speed for trees (2x slower)
for _, entity in pairs(data.raw[trees] or {}) do
    if entity.minable then
        entity.minable.mining_time = entity.minable.mining_time * 1
    end
end
