local modn = minetest.get_current_modname()
seagrasses = {1,2,3,4}--4
bryozoans = {1}
ascidians = {1}
minetest.register_node(modn..":water_source", {
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
	drowning = 0.5,
	liquidtype = "source",
	liquid_alternative_flowing = modn..":water_flowing",
	liquid_alternative_source = modn..":water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 65, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, cools_lava = 1},
})

minetest.register_node(modn..":water_flowing", {
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

for n = 1, #seagrasses do
	local name = "seagrass"..n
minetest.register_node(modn..":"..name, {
    description = "Seagrass "..n,
	drawtype = "plantlike_rooted",
	paramtype = "light",
	paramtype2 = "leveled",
	tiles = {"sand.png"},
	waving = 1,
	--param2 = 64,
	special_tiles = {{name = "seagrass"..n..".png", tileable_vertical = true}},
	groups = {cracky = 1, seagrass = 1},
	
})
end

for n = 1, #bryozoans do
	local name = "bryo"..n
minetest.register_node(modn..":"..name, {
    description = "Bryozoan "..n,
	drawtype = "mesh",
	mesh = "bryo"..n..".obj",
	paramtype = "light",
	tiles = {"[combine:16x32:0,0=bryo"..n..".png:0,16=sand.png"},
	--waving = 1,
	--param2 = 64,
	groups = {cracky = 1},
	
})
end

for n = 1, #ascidians do
	local name = "asci"..n
minetest.register_node(modn..":"..name, {
    description = "Ascidian "..n,
	drawtype = "mesh",
	mesh = "asci"..n..".obj",
	paramtype = "light",
	tiles = {"[combine:16x32:0,0=asci"..n..".png:0,16=sand.png"},
	--waving = 1,
	--param2 = 64,
	groups = {cracky = 1},
	
})
end

minetest.register_abm({
	label = "Lava cooling",
	nodenames = {"group:seagrass"},
	neighbors = {},
	interval = 1.0,
	chance = 1,
	catch_up = true,
	action = function(pos, node)
		local node = minetest.get_node(pos)
		if(node.name == "mapgen:seagrass2" and node.param2 < 32)then
			minetest.set_node(pos, {name = node.name, param2 = 16*math.random(8)})
		elseif(node.name and node.param2 < 16)then
			minetest.set_node(pos, {name = node.name, param2 = 16})
		end
	end
})