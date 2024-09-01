for _, inserter in pairs(data.raw["inserter"]) do
  if inserter.extension_speed then
    inserter.extension_speed = inserter.extension_speed * 10 -- Reduce extension speed to 10%
  end
  if inserter.rotation_speed then
    inserter.rotation_speed = inserter.rotation_speed * 10 -- Reduce rotation speed to 10%
  end
end
