local bio = littoral.biota
local modn = "littoral_life"

littoral.mapgen.deco = {}

littoral.add_deco = function(tab)
    local tall_kelp_offset = tab.paramtypes and tab.paramtypes[2] == "leveled" and -9 or 0
    littoral.mapgen.deco[tab.name] = littoral.mapgen.deco[tab.name] or {}
    if(tall_kelp_offset < 0)then return end
    table.insert(littoral.mapgen.deco[tab.name],
    minetest.register_decoration({
        name = tab.name or "Metropolitan "..tab.name.." placement",
        deco_type = tab.deco_type or "simple",
        place_on = tab.place_on or "littoral_mapgen:sand_wet",
        sidelen = tab.sidelen or 7,
        fill_ratio = tab.fill_ratio or 0.002,
        noise_params = tab.noise_params,
        biomes = tab.biomes or "unknown",
        y_min = tab.y_min or -30000,
        y_max = tab.y_max or littoral.biome.limit.sea_level + tall_kelp_offset,
        spawn_by = tab.spawn_by or "littoral_mapgen:water_source",
        num_spawn_by = tab.num_spawn_by or 0,
        flags = tab.flags or "all_floors, force_placement",
        decoration = tab.decoration or modn..":"..tab.name,
        height = 1,
        height_max = 1,
        param2 = tab.param2 or 1,
        param2_max = tab.param2_max or tab.height or  1,
        place_offset_y = tab.place_offset_y or 1,
    }))
end

littoral.add_ore = function(tab)
    return minetest.register_ore(tab)
end

for k,v in pairs(bio) do
for n = 1, #v do
    local org = v[n]
    littoral.add_deco(org)
    end
end

local abio = littoral.abiota
for k,v in pairs(abio) do
    for n = 1, #v do
        local org = v[n]
        local name = "littoral_mapgen:"..org.name
        local gentype = org.deco or org.ore
        for nn = 1, #gentype do
            if(org.deco)then
            littoral.add_deco(org.deco[nn])
            elseif(org.ore)then
            littoral.add_ore(org.ore[nn])
            end
         end
    end
end
------------------------
-- SAND / SUBSTRATE ADJUSTMENTS
    littoral.add_deco({
        name = "Rocks Rock placement",
        deco_type = "simple",
        place_on = "littoral_mapgen:sand_wet",
        sidelen = 8,
        noise_params = {
            offset = -0.016,
            scale = 0.032,
            spread = {x = 200, y = 200, z = 200},
            seed = 34,
            octaves = 3,
            persist = 0.1,
            lacunarity = 2,
            flags = "absvalue"
        },
        biomes = {"unknown"},
        y_min = -250,
        y_max = 90,
        spawn_by = "littoral_mapgen:water_source",
        num_spawn_by = 1,
        flags = "liquid_surface, force_placement, all_floors",
        decoration = {"rocks:stone_glove","rocks:stone_round"},
        height = 1,
        height_max = 1,
        param2 = 0,
        param2_max = 0,
        place_offset_y = 0,
    })

    minetest.register_decoration({
        deco_type = "schematic",
        place_on = {"littoral_mapgen:stone"},
        sidelen = 8,
        noise_params = {
            offset = 0.8,
            scale = 0.02,
            spread = {x = 2, y = 2, z = 2},
            seed = 390,
            octaves = 1,
            persist = 0.5,
            lacunarity = 2,
            flags = "absvalue"
        },
        biomes = {"unknown"},
        y_min = -112,
        y_max = 112,
        spawn_by = "littoral_mapgen:sand_wet",
        num_spawn_by = 7,
        flags = "force_placement",
        schematic = littoral.schematic.ikaite1,
        place_offset_y = -1,
    })
    minetest.register_decoration({
        name = "stone mix into surface sand",
        deco_type = "simple",
        place_on = {"littoral_mapgen:sand_wet"},
        sidelen = 8,
        noise_params = {
            offset = -0.47,
            scale = 0.62,
            spread = {x = 160, y = 160, z = 160},
            seed = 354,
            octaves = 3,
            persist = 0.98,
            lacunarity = 2.0,
            flags = "absvalue"
        },
        biomes = {"unknown"},
        y_min = -25000,
        y_max = 112,
        spawn_by = {"littoral_mapgen:sand_wet","littoral_mapgen:stone"},
        num_spawn_by = -1,
        flags = "force_placement",
        decoration = {"littoral_mapgen:stone"},
        height = 1,
        height_max = 1,
        param2 = 0,
        param2_max = 0,
        place_offset_y = -1,
    })
    minetest.register_decoration({ -- coarser sand underneath mapgen fine sand
        name = "underlay coarse sand to sand",
        deco_type = "simple",
        place_on = {"littoral_mapgen:sand_wet"},
        sidelen = 8,
        fill_ratio = 10,
        biomes = {"unknown"},
        y_min = -25000,
        y_max = 25000,
        spawn_by = {"littoral_mapgen:sand_wet"},
        num_spawn_by = -1,
        flags = "force_placement",
        decoration = {"littoral_mapgen:sand_coarse"},
        height = 1,
        height_max = 1,
        param2 = 0,
        param2_max = 0,
        place_offset_y = -2,
    })
    minetest.register_decoration({ -- coarser sand underneath mapgen fine sand
        name = "underlay gravel to coarse sand",
        deco_type = "simple",
        place_on = {"littoral_mapgen:sand_wet"},
        sidelen = 8,
        fill_ratio = 10,
        biomes = {"unknown"},
        y_min = -25000,
        y_max = 25000,
        spawn_by = {"littoral_mapgen:sand_wet"},
        flags = "force_placement",
        decoration = {"littoral_mapgen:gravel"},
        height = 1,
        height_max = 1,
        param2 = 0,
        param2_max = 0,
        place_offset_y = -3,
    })

local decos = {
    {   
        species = "seagrass2",
        deco_type = "simple",
        place_on = "littoral_mapgen:sand_wet",
        sidelen = 32,
        noise_params = {
            offset = -0.0435,
			scale = 0.06891,
			spread = {x = 2, y = 2, z = 2},
			seed = 52,
			octaves = 2,
			persist = 0.8,
			lacunarity = 2,
			--flags = "absvalue"
        },
        biomes = "unknown",
        y_min = -300,
        y_max = 88,
        spawn_by = "littoral_mapgen:water_source",
        num_spawn_by = 0,
        
        decoration = modn..":seagrass2",
        --height = 1,
        --height_max = 1,
        param2 = 64,
        param2_max = 16*9,
        place_offset_y = -1,
    },
    
    {
    species = "seagrass3",
    deco_type = "simple",
    place_on = "littoral_mapgen:sand_wet",
    sidelen = 16,
    noise_params = {
        offset = -0.0135,
			scale = 0.08891,
			spread = {x = 26, y = 9, z = 19},
			seed = 11,
			octaves = 3,
			persist = 2.5,
			lacunarity = 2,
    },
    biomes = "unknown",
    y_min = -90,
    y_max = 88,
    spawn_by = "littoral_mapgen:water_source",
    num_spawn_by = 0,
    
    decoration = modn..":seagrass3",
    --height = 1,
    --height_max = 1,
    param2 = 1,
    param2_max = 4,
    place_offset_y = -1,
    },
{
	species = "seagrass4",
	deco_type = "simple",
    place_on = "littoral_mapgen:sand_wet",
    sidelen = 8,
    noise_params = {
		offset = 0.1,
			scale = 0.7,
			spread = {x = 9, y = 9, z = 9},
			seed = 36,
			octaves = 1,
			persist = 0.5,
			lacunarity = 2,
			--flags = "absvalue"
	},
    biomes = "unknown",
    y_min = -90,
    y_max = 88,
    spawn_by = "littoral_mapgen:water_source",
    num_spawn_by = 0,
    
    decoration = modn..":seagrass4",
    --height = 1,
    --height_max = 1,
    param2 = 0,
    param2_max = 4,
    place_offset_y = -1,
	},
    {   
        species = "seagrass5",
        deco_type = "simple",
        place_on = "littoral_mapgen:sand_wet",
        sidelen = 32,
        noise_params = {
            offset = -0.0435,
			scale = 0.06891,
			spread = {x = 2, y = 2, z = 2},
			seed = 2,
			octaves = 3,
			persist = 0.8,
			lacunarity = 2,
			--flags = "absvalue"
        },
        biomes = "unknown",
        y_min = -300,
        y_max = 88,
        spawn_by = "littoral_mapgen:water_source",
        num_spawn_by = 0,
        
        decoration = modn..":seagrass5",
        --height = 1,
        --height_max = 1,
        param2 = 128,
        param2_max = 16*9,
        place_offset_y = -1,
    },
{
	species = "seagrass6",
	deco_type = "simple",
    place_on = {"littoral_mapgen:sand_wet", "group:seagrass"},
    sidelen = 8,
    fill_ratio = 0.1,
    biomes = "unknown",
    y_min = -990,
    y_max = 67,
    spawn_by = "littoral_mapgen:water_source",
    num_spawn_by = 0,
    flags = "force_placement",
    decoration = "littoral_life:seagrass6",
    --height = 1,
    --height_max = 1,
    param2 = 0,
    param2_max = 4,
    place_offset_y = -1,
	},
{
		species = "seagrass7",
		deco_type = "simple",
		place_on = "littoral_mapgen:sand_wet",
		sidelen = 32,
		noise_params = {
			offset = -0.0435,
			scale = 0.06891,
			spread = {x = 2, y = 2, z = 2},
			seed = 2,
			octaves = 3,
			persist = 0.8,
			lacunarity = 2,
			--flags = "absvalue"
		},
		biomes = "unknown",
		y_min = -300,
		y_max = 88,
		spawn_by = "littoral_mapgen:water_source",
		num_spawn_by = 0,
		
		decoration = modn..":seagrass7",
		--height = 1,
		--height_max = 1,
		param2 = 64,
		param2_max = 16*9,
		place_offset_y = -1,
	},
{
    species = "bryozoan3",
    deco_type = "simple",
    place_on = "littoral_mapgen:sand_wet",
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
    spawn_by = "littoral_mapgen:water_source",
    num_spawn_by = 0,
    
    decoration = modn..":bryozoan3",
    --height = 1,
    --height_max = 1,
    param2 = 0,
    param2_max = 4,
    place_offset_y = -1,
    }
}
local function deco_zonation()
    local biota = littoral.biota
    for n = 1, #decos do
        local v = decos[n]
        local name = v.species
        if(biota.names_all[name])then
            local ref = biota.names_all[name]
            local def = biota[ref.form][ref.id]
            local zone = def.depth_zone or "bathyal"
            local lims = littoral.biome.limit[zone]
            v.name = "Monopop "..v.species
            v.y_max = lims[1]
            v.y_min = lims[2]
            local yym = v.y_min
            local x = littoral.add_deco(v)
            minetest.after(7, function() say("second regset: "..#decos)end)
        end
        
    end
end
deco_zonation()
local ct = 0
for k,v in pairs(minetest.registered_decorations)do
    minetest.after(9, function() say(k) end)
    ct = ct + 1
end
minetest.after(7, function() say("total regset: "..ct) end)