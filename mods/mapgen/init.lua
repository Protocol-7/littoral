local minetest = minetest
local modn = minetest.get_current_modname()
local modp = minetest.get_modpath(modn)
dofile(modp.."/node.lua")



mapgen_params = {water_level = 89}
minetest.set_mapgen_params(mapgen_params)

local register_node = minetest.register_node
local register_alias = minetest.register_alias


register_node(modn .. ':stone', {
    description = 'Essential node for mapgen alias “mapgen_stone”',
    tiles = { 'tile1.png' },
    groups = { oddly_breakable_by_hand = 3 },
    is_ground_content = true
})

register_node(modn .. ':river_water_source', {
    description = 'Essential node for mapgen alias “mapgen_river_water_source”',
    tiles = { modn .. '_river_water_source.png' },
    groups = { oddly_breakable_by_hand = 3 },
    is_ground_content = true
})


register_alias('mapgen_stone', modn .. ':stone')
register_alias('mapgen_water_source', modn..":water_source")
register_alias('mapgen_river_water_source', modn .. ':river_water_source')


-- BIOMES

minetest.register_biome({
		name = "unknown",
		node_top = modn .. ":stone",
		depth_top = 1,
		node_filler = modn .. ":stone",
		depth_filler = 1,
		node_riverbed = modn .. ":stone",
		depth_riverbed = 2,
		y_min = -31000,
		y_max = 31000,
		heat_point = 0,
		humidity_point = 0,
		node_water = modn.."water_source"
})

dofile(modp.."/decoration.lua")
