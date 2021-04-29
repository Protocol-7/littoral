local modn = minetest.get_current_modname()
local register_node = minetest.register_node
local register_alias = minetest.register_alias

local bio = littoral.biota

-- SUBSTRATUM
register_node(modn .. ':stone', {
    description = 'Essential node for mapgen alias “mapgen_stone”',
    tiles = { 'sand3.png' },
    groups = { oddly_breakable_by_hand = 3 },
    is_ground_content = true,
})

register_node(modn .. ':sand', {
    description = 'Wet Sand',
    tiles = { 'sand.png' },
	paramtype = "light",
	light_source = 0,
    groups = { oddly_breakable_by_hand = 3 , sandy = 1},
    is_ground_content = true
})
register_node(modn .. ':sand2', { -- dry
    description = 'Dry Sand',
    tiles = { 'sand2.png' },
    groups = { oddly_breakable_by_hand = 3, sandy = 1 },
    is_ground_content = true
})
register_node(modn .. ':sand4', { -- dry
    description = 'Sand Blend Stone',
    tiles = { 'sand3.png^wolm.png' },
    groups = { oddly_breakable_by_hand = 3, sandy = 1 },
    is_ground_content = true
})
register_node(modn .. ':river_water_source', {
    description = 'Essential node for mapgen alias “mapgen_river_water_source”',
    tiles = {'lake1.png' },
    groups = { oddly_breakable_by_hand = 3, wet = 1 },
    is_ground_content = true
})

register_node(modn .. ':river_water_flowing', {
    description = 'Essential node for mapgen alias “mapgen_river_water_source”',
    tiles = {'lake2.png' },
    groups = { oddly_breakable_by_hand = 3 },
    is_ground_content = true
})
register_node(modn .. ':block1', {
    description = 'Essential node for mapgen alias “mapgen_river_water_source”',
    tiles = {'stone2.png^[mask:mplate.png' },
    groups = { oddly_breakable_by_hand = 3 },
    is_ground_content = true
})
register_node(modn .. ':hal1', {
    description = 'HAL-58”',
    tiles = {'haltex.png^[colorize:#2f4f4f:200' },
    groups = { oddly_breakable_by_hand = 3, wet = 1 },
    is_ground_content = true,
	on_punch = function()
		local n = math.random(10)
	minetest.override_item(modn..":hal1",{light_source = n})
	say(n)
	end
})

-- LIQUIDS
register_node(modn..":water_source", {
	description = "Lake Source",
	drawtype = "liquid",
	waving = 3,
	tiles = {
		{
			name = "water1.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "water1.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
    alpha = 191,
    sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	light_source = 0,
	drowning = 0.5,
	liquidtype = "source",
	liquid_alternative_flowing = modn..":water_flowing",
	liquid_alternative_source = modn..":water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 77, r = 30, g = 110, b = 190},
	groups = {water = 3, liquid = 3, cools_lava = 1},
})

register_node(modn..":water_flowing", {
	description = "Lake Flowing",
	drawtype = "flowingliquid",
	waving = 3,
	tiles = {"water2.png"},
	special_tiles = {
		{
			name = "water2.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
		{
			name = "water2.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
	},
	alpha = 191,
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = modn..":water_flowing",
	liquid_alternative_source = modn..":water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 12, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, not_in_creative_inventory = 1, cools_lava = 1},
})

register_alias('mapgen_stone', modn .. ':stone')
register_alias('mapgen_water_source', modn..":water_source")
register_alias('mapgen_river_water_source', modn .. ':river_water_source')


register_node(modn..":brine_source", {
	description = "Lake Source",
	drawtype = "liquid",
	waving = 3,
	tiles = {
		{
			name = "water1.png^[colorize:#000034:180",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "water1.png^[colorize:#000034:180",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
    alpha = 250,
    sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	pointable = true,
	diggable = true,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	light_source = 0,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = modn..":brine_flowing",
	liquid_alternative_source = modn..":brine_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 77, r = 30, g = 110, b = 190},
	groups = {water = 3, liquid = 3, cools_lava = 1, oddly_breakable_by_hand = 1},
})
register_node(modn..":brine_flowing", {
	description = "Lake Source",
	drawtype = "flowingliquid",
	waving = 3,
	tiles = {"water1.png^[colorize:#000034:180"},
	special_tiles = {
		{
			name = "water1.png^[colorize:#000034:180",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "water1.png^[colorize:#000034:180",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
    alpha = 250,
    sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	pointable = true,
	diggable = true,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	light_source = 0,
	drowning = 1,
	range = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = modn..":brine_flowing",
	liquid_alternative_source = modn..":brine_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 77, r = 30, g = 110, b = 190},
	groups = {water = 3, liquid = 3, cools_lava = 1, oddly_breakable_by_hand = 1},
})