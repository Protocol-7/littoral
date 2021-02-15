local modn = minetest.get_current_modname()
local register_node = minetest.register_node
local register_alias = minetest.register_alias

local bio = littoral.biota

register_node(modn .. ':stone', {
    description = 'Essential node for mapgen alias “mapgen_stone”',
    tiles = { 'sand3.png' },
    groups = { oddly_breakable_by_hand = 3 },
    is_ground_content = true
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
    is_ground_content = true
})
--- TECH

register_alias('mapgen_stone', modn .. ':stone')
register_alias('mapgen_water_source', modn..":water_source")
register_alias('mapgen_river_water_source', modn .. ':river_water_source')

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

for _,v in pairs(bio) do
	for n = 1, #v do
		local org = v[n]
	local name = org.name
	org.order = org.order or org.name -- temporary, seagrasses dont have orders yet

register_node(modn..":"..org.name, {
    description = org.name.."("..org.form..")",
	drawtype = org.drawtype or "plantlike_rooted",
	paramtype = org.paramtypes[1] or "light",
	paramtype2 = org.paramtypes[2] or (org.drawtype == "plantlike_rooted" and org.height > 1) and "leveled",
	tiles = org.tiles,
	mesh = org.mesh,
	waving = org.waving,
	special_tiles = org.special_tiles,
	groups = {cracky = 1, [org.form] = 1},
	on_punch = function(pos, node, puncher)
	minetest.chat_send_all(node.param2)
	littoral.bubble(pos, node.name == modn..":seagrass6" and "smote1.png" or "bubble2.png")
	end
	
})
end
end

for _,v in pairs(littoral.abiota) do
	for n = 1, #v do
		local org = v[n]
		register_node(modn..":"..org.name, {
			description = org.name.."("..org.form..")",
			drawtype = org.drawtype,
			paramtype = org.paramtypes and org.paramtypes[1],
			paramtype2 =  org.paramtypes and org.paramtypes[2],
			tiles = org.tiles,
			use_texture_alpha = org.use_texture_alpha,
			mesh = org.mesh,
			waving = org.waving,
			special_tiles = org.special_tiles,
			groups = {cracky = 1, [org.form] = 1},
			on_punch = org.on_punch
		})
	end
end


minetest.register_abm({
	label = "Sand Drying",
	nodenames = {"group:sandy"},
	interval = 5,
	chance = 0.1,
	action = function(pos, node, aoc, aoc2)
		local node = minetest.get_node(pos)
		local wet = minetest.find_node_near(pos, 1, modn..":water_source")
		if(node.name == modn..":sand2" and wet)then
			minetest.set_node(pos, {name = modn..":sand"})
			littoral.bubble(pos,"bubble2.png")
		elseif(node.name == modn..":sand" and not wet)then
			minetest.set_node(pos, {name = modn..":sand2"})
		end
	end
})
minetest.register_abm({
	label = "po",
	nodenames = {"group:poriferan"},
	interval = 2,
	chance = 100,
	action = function(pos, node, aoc, aoc2)
		littoral.bubble(pos, "bubble2.png")
	end
})
minetest.register_lbm({
	label = "fd",
	nodenames = {"group:poriferan","group:ascidian","mapgen:seagrass4","mapgen:seagrass3"},
	name = modn..":meshoptionsfix",
	run_at_every_load = true,
	action = function(pos, node)
		local node = minetest.get_node(pos)
		if(node.param2 == 0)then
			minetest.set_node(pos, {name = node.name, param2 = math.random(1,4)})
		end
	end
})

--[[minetest.register_lbm({
	label = "edgetest",
	nodenames = {"group:water", "air"},
	name = modn..":bordertest",
	run_at_every_load = true,
	action = function(pos, node)
		local dist = vector.distance(littoral.mapgen.origin,pos)
		if( dist >= 300 and dist <= 301)then
			minetest.set_node(pos, {name = modn..":stone"})
		end
	end
})]]

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