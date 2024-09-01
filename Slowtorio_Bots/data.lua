--hysterica bots are now 10x
-- Adjust logistics robots to 10% speed, 10% energy per move, and 10% energy per tick
for _, robot in pairs(data.raw["logistic-robot"]) do
    -- Set the robot's speed to 10% of its usual value
    robot.speed = (robot.speed or 0.05) * 10

    -- Set the robot's energy consumption per move to 10% of its usual value
    if robot.energy_per_move then
        local number, unit = string.match(robot.energy_per_move, "([%d%.]+)(%a+)")
        number = tonumber(number) * 1
        robot.energy_per_move = tostring(number) .. unit
    end

    -- Set the robot's energy consumption per tick to 10% of its usual value
    if robot.energy_per_tick then
        local number, unit = string.match(robot.energy_per_tick, "([%d%.]+)(%a+)")
        number = tonumber(number) * 1
        robot.energy_per_tick = tostring(number) .. unit
    end
end

--added construction robots
for _, robot in pairs(data.raw["construction-robot"]) do
    -- Set the robot's speed to 10% of its usual value
    robot.speed = (robot.speed or 0.05) * 10

    -- Set the robot's energy consumption per move to 10% of its usual value
    if robot.energy_per_move then
        local number, unit = string.match(robot.energy_per_move, "([%d%.]+)(%a+)")
        number = tonumber(number) * 1
        robot.energy_per_move = tostring(number) .. unit
    end

    -- Set the robot's energy consumption per tick to 10% of its usual value
    if robot.energy_per_tick then
        local number, unit = string.match(robot.energy_per_tick, "([%d%.]+)(%a+)")
        number = tonumber(number) * 1
        robot.energy_per_tick = tostring(number) .. unit
    end
end

--roboport
  for i, v in pairs(data.raw["roboport"]) do

    v.energy_source.buffer_capacity = "20MJ"
    v.energy_source.input_flow_limit = "20MW"
    v.charging_energy = "5MW"
end


