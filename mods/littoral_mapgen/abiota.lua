local modn = minetest.get_current_modname()
local register_node = minetest.register_node
------------------------------
-- ABIOTA
------------------------------
littoral.add_abiota = function(data)
	local abiota = littoral.abiota
	local n = #abiota[data.form]+1
	abiota[data.form][n] = data
	abiota[data.form][data.name] = n
end

local function meshtex(tex1,tex2)
	return "[combine:16x32:0,0="..tex1..":0,16="..(tex2 or "sand.png")
end

littoral.add_abiota({
	name = "stone1",
	form = "stone",
	drawtype = "mesh",
	abundance = 6,
	mesh = "stone1.obj",
	tiles = {meshtex("stone2.png")},
	deco = {{
		name = "stone1",
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
--[[
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
			name = "ordenador",
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
			name = "vent1",
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
]]
--
-- NODE REGISTRATION
--

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
			mesh = "untitled.b3d",--org.mesh,
			waving = org.waving,
			special_tiles = org.special_tiles,
			groups = {cracky = 1, [org.form] = 1},
			on_punch = org.on_punch
		})
	end
end