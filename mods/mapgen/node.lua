local modn = minetest.get_current_modname()
local seagrasses = {1,2,3,4,5,6,7,8,9}
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
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = modn..":water_flowing",
	liquid_alternative_source = modn..":water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 98, r = 30, g = 60, b = 90},
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
	tiles = {"tile1.png"},
	waving = 1,
	special_tiles = {{name = "seagrass"..n..".png", tileable_vertical = true}},
    groups = {cracky = 1},
})
end