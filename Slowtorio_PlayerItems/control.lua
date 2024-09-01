-- fires on player created
script.on_event(defines.events.on_player_created, function(event)
	local player = game.players[event.player_index]
	if not player.character == nil then
		on_player_creation(player)
	end
end)

-- fires on the end of the cutscene (singleplayer)
script.on_event(defines.events.on_cutscene_cancelled, function(event)
	local player = game.players[event.player_index]
	on_player_creation(player)
end)

-- Custom items
local custom_items = {
    {"burner-mining-drill", 2},
    {"stone-furnace", 1},
    {"coal", 20},
    {"wood", 9},
}

function on_player_creation(player)
    give_player_items(player, custom_items)
end

function give_player_items(player, items)
	for i, v in pairs(items) do
		player.insert{name = v[1], count = v[2]}
	end
end
