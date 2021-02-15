local bio = littoral.biota
littoral.mapgen.deco = {}

littoral.add_deco = function(tab)
    littoral.mapgen.deco[tab.label] =
    minetest.register_decoration({
        deco_type = tab.deco_type or "simple",
        place_on = tab.place_on or "mapgen:sand",
        sidelen = tab.sidelen or 8,
        fill_ratio = tab.fill_ratio,
        noise_params = tab.noise_params,
        biomes = tab.biomes or "unknown",
        y_min = tab.y_min or -30000,
        y_max = tab.y_max or 112,
        spawn_by = tab.spawn_by or "mapgen:water_source",
        num_spawn_by = tab.num_spawn_by or 0,
        flags = tab.flags or "force_placement",
        decoration = tab.decoration,
        height = tab.height,
        height_max = tab.height_max,
        param2 = tab.param2,
        param2_max = tab.param2_max,
        place_offset_y = tab.place_offset_y,
        schematic = tab.schematic,
        replacements = tab.replacements,
        rotation = tab.rotation
    })
end
littoral.add_ore = function(tab)
    return minetest.register_ore(tab)
end

for k,v in pairs(bio) do
for n = 1, #v do
    local org = v[n]
    local name = "mapgen:"..org.name
    for nn = 1, #org.deco do
    littoral.add_deco(org.deco[nn])
    end
    end
end

local abio = littoral.abiota
for k,v in pairs(abio) do
    for n = 1, #v do
        local org = v[n]
        local name = "mapgen:"..org.name
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
        label = "Rocks Rock placement",
        deco_type = "simple",
        place_on = "mapgen:sand",
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
        spawn_by = "mapgen:water_source",
        num_spawn_by = 1,
        flags = "liquid_surface, force_placement, all_floors",
        decoration = {"rocks:stone_glove","rocks:stone_round"},
        height = 1,
        height_max = 0,
        param2 = 0,
        param2_max = 0,
        place_offset_y = 0,
    })

    minetest.register_decoration({
        deco_type = "schematic",
        place_on = {"mapgen:stone"},
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
        spawn_by = "mapgen:sand",
        num_spawn_by = 7,
        flags = "force_placement",
        schematic = littoral.schematic.ikaite1,
        place_offset_y = -1,
    })
    minetest.register_decoration({
        deco_type = "simple",
        place_on = {"mapgen:sand"},
        sidelen = 8,
        noise_params = {
            offset = -0.47,
            scale = 0.92,
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
        spawn_by = {"mapgen:sand","mapgen:stone"},
        num_spawn_by = -1,
        flags = "force_placement",
        decoration = {"mapgen:stone"},
        height = 1,
        height_max = 0,
        param2 = 0,
        param2_max = 0,
        place_offset_y = -1,
    })