local add_biota = littoral.add_biota
local modn = minetest.get_current_modname()

function say(x)
	return minetest.chat_send_all(type(x) == "string" and x or minetest.serialize(x))
end

-----------------
--UTIL
-----------------

local function meshtex(tex1,tex2)
	return "[combine:16x32:0,0="..tex1..":0,16="..(tex2 or "sand.png")
end


littoral.add_biota = function(data)
	local biota = littoral.biota
	local n = #biota[data.form]+1
	biota[data.form][n] = data
	biota[data.form][data.name] = n
end

local pool = {
    {name = "seagrass1",
	lname = "ectocarpus siliculosus",
    form = "seagrass",
    abundance = 2,
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 1,
	param2 = nil,
	paramtypes = {[2] = "meshoptions"}},

    {name = "seagrass2",
	lname = "macrocystis pyrifera",
	form = "seagrass",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 8,
	deco ={
		{
			label = "Monopop seagrass2",
			deco_type = "simple",
			place_on = "mapgen:sand",
			sidelen = 8,
			noise_params = {
				offset = -0.4,
				scale = 0.7,
				spread = {x = 16, y = 16, z = 16},
				seed = 355,
				octaves = 1,
				persist = 0.7,
				lacunarity = 2.0,
				flags = "absvalue"
			},
			biomes = "unknown",
			y_min = -30,
			y_max = 88,
			spawn_by = "mapgen:water_source",
			num_spawn_by = 0,
			flags = "force_placement",
			decoration = modn..":seagrass2",
			--height = 1,
			--height_max = 1,
			param2 = 0,
			param2_max = 16*9,
			place_offset_y = -1,
			}
	},
	param2 = nil,
	paramtypes = {[2] = "leveled"}},

    {name = "seagrass3",
	lname = "zostera marina",
    form = "seagrass",
    abundance = 7,
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 1,
	param2 = nil,
	deco = {
		{
		label = "Monopop seagrass3",
		deco_type = "simple",
        place_on = "mapgen:sand",
        sidelen = 8,
        noise_params = {
			offset = -0.08,
				scale = 0.4,
				spread = {x = 50, y = 30, z = 20},
				seed = 354,
				octaves = 1,
				persist = 0.6,
				lacunarity = 2.0,
				flags = "absvalue"
		},
        biomes = "unknown",
        y_min = 0,
        y_max = 88,
        spawn_by = "mapgen:water_source",
        num_spawn_by = 0,
        flags = "force_placement",
        decoration = modn..":seagrass3",
        --height = 1,
        --height_max = 1,
        param2 = 0,
        param2_max = 4,
        place_offset_y = -1,
		}
	},
	paramtypes = {[2] = "meshoptions"}},

    {name = "seagrass4",
	lname = "saccharina latissima",
    form = "seagrass",
    abundance = 6,
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 1,
	param2 = nil,
	deco = {
		{
		label = "Monopop seagrass4",
		deco_type = "simple",
        place_on = "mapgen:sand",
        sidelen = 8,
        noise_params = {
			offset = -0.08,
				scale = 0.4,
				spread = {x = 5, y = 6, z = 2},
				seed = 354,
				octaves = 1,
				persist = 0.3,
				lacunarity = 2.0,
				flags = "absvalue"
		},
        biomes = "unknown",
        y_min = 0,
        y_max = 88,
        spawn_by = "mapgen:water_source",
        num_spawn_by = 0,
        flags = "force_placement",
        decoration = modn..":seagrass4",
        --height = 1,
        --height_max = 1,
        param2 = 0,
        param2_max = 4,
        place_offset_y = -1,
		}
	},
	paramtypes = {[2] = "meshoptions"}},

    {name = "seagrass5",
	lname = "laminaria japonica",
	form = "seagrass",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 4,
	param2 = nil,
	paramtypes = {[2] = "leveled"}},

    {name = "seagrass6",
	lname = "thalassia testudinum",
	form = "seagrass",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 1,
	param2 = nil,
	deco = {
		{
		label = "Monopop seagrass6",
		deco_type = "simple",
        place_on = "mapgen:sand",
        sidelen = 8,
        noise_params = {
			offset = -0.21,
				scale = 0.6,
				spread = {x = 32, y = 6, z = 12},
				seed = 354,
				octaves = 1,
				persist = 0.1,
				lacunarity = 0.5,
				flags = "absvalue"
		},
        biomes = "unknown",
        y_min = 0,
        y_max = 88,
        spawn_by = "mapgen:water_source",
        num_spawn_by = 0,
        flags = "force_placement",
        decoration = modn..":seagrass6",
        --height = 1,
        --height_max = 1,
        param2 = 0,
        param2_max = 4,
        place_offset_y = -1,
		}
	},
	paramtypes = {[2] = "meshoptions"}},

    {name = "seagrass7",
	lname = "sargassum muticum",
	form = "seagrass",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 12,
	param2 = nil,
	deco ={
		{
			label = "Monopop seagrass7",
			deco_type = "simple",
			place_on = "mapgen:sand",
			sidelen = 8,
			noise_params = {
				offset = -0.4,
				scale = 0.7,
				spread = {x = 16, y = 16, z = 16},
				seed = 355,
				octaves = 1,
				persist = 0.7,
				lacunarity = 2.0,
				flags = "absvalue"
			},
			biomes = "unknown",
			y_min = -30,
			y_max = 88,
			spawn_by = "mapgen:water_source",
			num_spawn_by = 0,
			flags = "force_placement",
			decoration = modn..":seagrass7",
			--height = 1,
			--height_max = 1,
			param2 = 0,
			param2_max = 16*9,
			place_offset_y = -1,
			}
	},
	paramtypes = {[2] = "leveled"}},

    {lname = "schizoporella unicornis",
	name = "bryozoan1",
    order = 1,
	abundance = 8,
	form = "bryozoan",
	drawtype = "mesh",
	tiles = {"[combine:16x32:0,0=bryozoan1.png:0,16=sand.png"},
	height = 1,
	param2 = nil,
	paramtypes = {}},

    {lname = "ascidia paratropa",
	name = "ascidian1",
    order = 1,
	form = "ascidian",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 1,
	param2 = nil,
    paramtypes = {[2] = "meshoptions"}},

    {lname = "didemnum carnulentum",
	name = "ascidian2",
    order = 2,
	form = "ascidian",
	drawtype = "mesh",
	tiles = {"[combine:16x32:0,0=ascidian2.png:0,16=sand.png"},
	height = 1,
	param2 = nil,
	paramtypes = {nil,"meshoptions"}},

    {lname = "spongia officinalis",
	name = "poriferan1",
    order = 1,
	form = "poriferan",
	drawtype = "plantlike_rooted",
	tiles = {},
	waving = 1,
	height = 1,
	param2 = nil,
	paramtypes = {[2] = "meshoptions"}},
	{
		name = "poriferan3",
		form = "poriferan",
		abundance = 8,
		waving = 1,
		--depth_index = 4,
		tiles = {"sand.png^rootcover.png"},
		height = 1,
		special_tiles = {{name ="poriferan3.png", tileable_vertical = false}},
		drawtype = "plantlike_rooted",
		paramtypes = {"light","meshoptions"},
		groups = {poriferan = 1}
	},
	{
		name = "poriferan2",
		lname = "euplectella aspergillum",
		form = "poriferan",
		abundance = 8,
		waving = 1,
		--depth_index = 4,
		tiles = {"sand.png^rootcover.png"},
		height = 1,
		special_tiles = {{name ="poriferan2.png", tileable_vertical = false}},
		drawtype = "plantlike_rooted",
		paramtypes = {"light","meshoptions"},
		groups = {poriferan = 1}
	},
	{
		name = "seagrass8",
		--order = 8,
		form = "seagrass",
		abundance = 8,
		waving = 1,
		--depth_index = 4,
		tiles = {"sand.png^rootcover.png"},
		height = 1,
		special_tiles = {{name ="seagrass8.png"}},
		drawtype = "plantlike_rooted",
		paramtypes = {[2] = "meshoptions"},
		groups = {seagrass = 1}
	},
	{
		name = "bryozoan2",
		--order = 8,
		form = "bryozoan",
		abundance = 8,
		--waving = 1,
		--depth_index = 4,
		tiles = {"stone_crustose2.png"},
		height = 1,
		drawtype = "normal",
		paramtypes = {},
		groups = {bryozoan = 1}
	},
	{
		name = "bryozoan3",
		--order = 8,
		form = "bryozoan",
		abundance = 8,
		--waving = 1,
		--depth_index = 4,
		tiles = {"stone_crustose1.png"},
		height = 1,
		drawtype = "normal",
		deco = {
			{
			label = "Monopop bryozoan33",
			deco_type = "simple",
			place_on = "mapgen:sand",
			sidelen = 8,
			noise_params = {
				offset = -0.08,
					scale = 0.06,
					spread = {x = 50, y = 30, z = 20},
					seed = 354,
					octaves = 2,
					persist = 0.6,
					lacunarity = 2.0,
					flags = "absvalue"
			},
			biomes = "unknown",
			y_min = 0,
			y_max = 88,
			spawn_by = "mapgen:water_source",
			num_spawn_by = 0,
			flags = "force_placement",
			decoration = modn..":bryozoan3",
			--height = 1,
			--height_max = 1,
			param2 = 0,
			param2_max = 4,
			place_offset_y = -1,
			}
		},
		paramtypes = {},
		groups = {bryozoan = 1}
	}
}
local default_deco = {
	deco_type = "simple",
    --noise_params = tab.noise_params,
        y_min = -30000,
        y_max = 89,
        --spawn_by = tab.spawn_by or "mapgen:water_source",
        --num_spawn_by = tab.num_spawn_by,
        --flags = tab.flags,
        --decoration = tab.decoration,
        height = 1,
        height_max = 1,
        --param2 = tab.param2,
        --param2_max = tab.param2_max,
        place_offset_y = -1,
}
for n = 1, #pool do
    local org = pool[n]
    org.special_tiles = org.special_tiles or org.drawtype == "plantlike_rooted" and {{name = org.name..".png", tileable_vertical = true}}
    org.tiles[1] = org.tiles[1] or --[[(org.drawtype == "mesh" and "[combine:16x32:0,0="..org.name..".png:0,16=sand"..".png") or]] "sand.png"
	org.mesh = org.drawtype == "mesh" and org.name..".obj"
	local deco = {}
	for k,v in pairs(default_deco)do
		deco[k] = v
	end
	deco.decoration = modn..":"..org.name
	deco.label = "Mapgen placement for "..org.name
	deco.param2_max = org.drawtype == "plantlike_rooted" and 16*6 or 4
	deco.y_min = org.depth_index and org.depth_index*-100 or org.form == "seagrass" and 0 or -250
    deco.y_max = (org.form == "bryozoan") and 52 or 73
	deco.noise_params = {
	offset = -0.1,
	scale = 0.2,
	spread = {x = 3, y = 16, z = 8},
	seed = 352,
	octaves = 1,
	persist = 0.95,
	lacunarity = 2.0,
	flags = "absvalue"
	}
	org.deco = org.deco or {}
	org.deco[#org.deco+1] = deco
end
for n = 1, #pool do
    littoral.add_biota(pool[n])
end
------------------------------
-- ABIOTA
------------------------------
littoral.add_abiota = function(data)
	local abiota = littoral.abiota
	local n = #abiota[data.form]+1
	abiota[data.form][n] = data
	abiota[data.form][data.name] = n
end

littoral.add_abiota({
	name = "stone1",
	form = "stone",
	drawtype = "mesh",
	abundance = 6,
	mesh = "stone1.obj",
	tiles = {meshtex("stone2.png")},
	deco = {{
		label = "soft Rock placement",
        deco_type = "simple",
        place_on = "mapgen:sand",
        sidelen = 8,
        noise_params = {
            offset = -0.016,
            scale = 0.032,
            spread = {x = 20, y = 200, z = 20},
            seed = 39,
            octaves = 3,
            persist = 0.1,
            lacunarity = 2,
            flags = "absvalue"
        },
        biomes = {"unknown"},
        y_min = -250,
        y_max = 90,
        spawn_by = "mapgen:water_source",
        num_spawn_by = 1,
        flags = "liquid_surface, force_placement, all_floors",
        decoration = modn..":stone1",
        place_offset_y = -1,
	}},
	groups = {cracky = 1}
})

--[[littoral.add_abiota({
	name = "mdc",
	form = "tech",
	abundance = 0.001,
	drawtype = "mesh",
	mesh = "massdecomp.obj",
	tiles = {"metal.png"},
	groups = {cracky = 1},
	
	paramtypes = {"light","facedir"}
})]]

littoral.add_abiota({
	name = "phial",
	form = "tech",
	abundance = 0.001,
	drawtype = "mesh",
	mesh = "phial.obj",
	use_texture_alpha = true,
	tiles = {"metal.png^[lowpart:50:glass.png"},
	groups = {cracky = 1},
	ore = {
		{
			ore_type = "blob",
			ore = modn..":brine_source",
			wherein = "mapgen:stone",
			-- A list of nodenames is supported too
		
			clust_scarcity = 9 * 12 * 11,
			-- Ore has a 1 out of clust_scarcity chance of spawning in a node.
			-- If the desired average distance between ores is 'd', set this to
			-- d * d * d.
		
			clust_num_ores = 8,
			-- Number of ores in a cluster
		
			clust_size = 4,
			-- Size of the bounding box of the cluster.
			-- In this example, there is a 3 * 3 * 3 cluster where 8 out of the 27
			-- nodes are coal ore.
		
			y_min = -31000,
			y_max = 64,

			flags = "",

			noise_threshold = 0.5,

			noise_params = {
				offset = -0.2,
				scale = 1,
				spread = {x = 100, y = 100, z = 100},
				seed = 23,
				octaves = 3,
				persist = 0.7
			},
			-- puff
		}
	},
	paramtypes = {"light","facedir"}
})

littoral.add_abiota({
	name = "ordenador",
	form = "tech",
	abundance = 0.001,
	drawtype = "mesh",
	mesh = "ordenador.obj",
	use_texture_alpha = true,
	tiles = {"metal.png^[lowpart:50:glass.png"},
	groups = {cracky = 1},
	deco ={
		{
			label = "Monopop ordenador",
			deco_type = "simple",
			place_on = "mapgen:sand",
			sidelen = 8,
			noise_params = {
				offset = -0.008,
				scale = 0.00001,
				spread = {x = 120, y = 120, z = 120},
				seed = 2,
				octaves = 3,
				persist = 0.1
			},
			biomes = "unknown",
			y_min = -100,
			y_max = 88,
			spawn_by = "mapgen:water_source",
			num_spawn_by = 0,
			flags = "force_placement",
			decoration = modn..":ordenador",
			--height = 1,
			--height_max = 1,
			param2 = 0,
			param2_max = 16*9,
			place_offset_y = 1,
			}
	},
	paramtypes = {"light","facedir"}
})
littoral.add_abiota({
	name = "vent1",
	form = "tech",
	abundance = 0.001,
	drawtype = "mesh",
	mesh = "vent1.obj",
	use_texture_alpha = true,
	tiles = {"sand.png"},
	groups = {cracky = 1},
	deco ={
		{
			label = "Monopop vent1",
			deco_type = "simple",
			place_on = "mapgen:sand",
			sidelen = 8,
			noise_params = {
				offset = -0.008,
				scale = 0.016,
				spread = {x = 120, y = 120, z = 120},
				seed = 2,
				octaves = 3,
				persist = 0.1
			},
			biomes = "unknown",
			y_min = -100,
			y_max = 88,
			spawn_by = "mapgen:stone",
			num_spawn_by = 5,
			flags = "force_placement, all_floors",
			decoration = modn..":vent1",
			--height = 1,
			--height_max = 1,
			param2 = 0,
			param2_max = 0,
			place_offset_y = -1,
			}
	},
	paramtypes = {"light","facedir"},
	on_punch = function(pos)
		littoral.bubble(pos, "smote1.png")
	end
})