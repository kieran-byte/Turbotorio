local function adjust_belt_speed(entity)
  if entity.speed then
    entity.speed = entity.speed * 10
  end
end

for _, entity in pairs(data.raw["transport-belt"]) do
  adjust_belt_speed(entity)
end

for _, entity in pairs(data.raw["underground-belt"]) do
  adjust_belt_speed(entity)
end

for _, entity in pairs(data.raw["splitter"]) do
  adjust_belt_speed(entity)
end
