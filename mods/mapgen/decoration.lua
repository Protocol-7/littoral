local bio = littoral.biota

for k,v in pairs(bio) do
for n = 1, #v do
    local org = v[n]
    local name = "mapgen:"..org.name
minetest.register_decoration({
    deco_type = "simple",

    place_on = "mapgen:sand",
    -- Node (or list of nodes) that the decoration can be placed on

    sidelen = 8,
    -- Size of the square divisions of the mapchunk being generated.
    -- Determines the resolution of noise variation if used.
    -- If the chunk size is not evenly divisible by sidelen, sidelen is made
    -- equal to the chunk size.

    noise_params = {
        offset = -0.4,
        scale = (org.abundance and org.abundance/10) or (org.form == "seagrass" and 0.8) or 0.6,
        spread = {x = 16, y = 16, z = 16},
        seed = 354,
        octaves = 1,
        persist = 0.4,
        lacunarity = 2.0,
        flags = "absvalue"
    },
    biomes = {"unknown"},
    y_min = org.depth_index and org.depth_index*-100 or org.form == "seagrass" and 0 or -250,
    y_max = org.form == "bryozoan" and 52 or 73,


    spawn_by = "mapgen:water_source",
    num_spawn_by = 1,
    -- Number of spawn_by nodes that must be surrounding the decoration
    -- position to occur.
    -- If absent or -1, decorations occur next to any nodes.

    flags = "liquid_surface, force_placement, all_floors",
    decoration = name,
    height = 1,
    height_max = 0,
    param2 = org.paramtypes[2] == "leveled" and 16 or 0,
    param2_max = org.paramtypes[2] == "leveled" and 16*6 or 4,
    place_offset_y = -1,
})
  
     end
end

local abio = littoral.abiota
for k,v in pairs(abio) do
    for n = 1, #v do
        local org = v[n]
        local name = "mapgen:"..org.name
    minetest.register_decoration({
        deco_type = "simple",
    
        place_on = "mapgen:sand",
        -- Node (or list of nodes) that the decoration can be placed on
    
        sidelen = 8,
        -- Size of the square divisions of the mapchunk being generated.
        -- Determines the resolution of noise variation if used.
        -- If the chunk size is not evenly divisible by sidelen, sidelen is made
        -- equal to the chunk size.
    
        fill_ratio = 0.02,
        -- The value determines 'decorations per surface node'.
        -- Used only if noise_params is not specified.
        -- If >= 10.0 complete coverage is enabled and decoration placement uses
        -- a different and much faster method.
    
        noise_params = {
            offset = -0.8,
            scale = (org.abundance and org.abundance/10) or 0.04,
            spread = {x = 1, y = 1, z = 1},
            seed = 354,
            octaves = 2,
            persist = 0.9,
            lacunarity = 2.0,
            flags = "absvalue"
        },
        -- NoiseParams structure describing the perlin noise used for decoration
        -- distribution.
        -- A noise value is calculated for each square division and determines
        -- 'decorations per surface node' within each division.
        -- If the noise value >= 10.0 complete coverage is enabled and
        -- decoration placement uses a different and much faster method.
    
        biomes = {"unknown"},
        -- List of biomes in which this decoration occurs. Occurs in all biomes
        -- if this is omitted, and ignored if the Mapgen being used does not
        -- support biomes.
        -- Can be a list of (or a single) biome names, IDs, or definitions.
    
        y_min = -250,
        y_max = 120,
        -- Lower and upper limits for decoration.
        -- These parameters refer to the Y co-ordinate of the 'place_on' node.
    
        spawn_by = "mapgen:water_source",
        -- Node (or list of nodes) that the decoration only spawns next to.
        -- Checks two horizontal planes of 8 neighbouring nodes (including
        -- diagonal neighbours), one plane level with the 'place_on' node and a
        -- plane one node above that.
    
        num_spawn_by = 1,
        -- Number of spawn_by nodes that must be surrounding the decoration
        -- position to occur.
        -- If absent or -1, decorations occur next to any nodes.
    
        flags = "liquid_surface, force_placement, all_floors",
        -- Flags for all decoration types.
        -- "liquid_surface": Instead of placement on the highest solid surface
        --   in a mapchunk column, placement is on the highest liquid surface.
        --   Placement is disabled if solid nodes are found above the liquid
        --   surface.
        -- "force_placement": Nodes other than "air" and "ignore" are replaced
        --   by the decoration.
        -- "all_floors", "all_ceilings": Instead of placement on the highest
        --   surface in a mapchunk the decoration is placed on all floor and/or
        --   ceiling surfaces, for example in caves and dungeons.
        --   Ceiling decorations act as an inversion of floor decorations so the
        --   effect of 'place_offset_y' is inverted.
        --   Y-slice probabilities do not function correctly for ceiling
        --   schematic decorations as the behaviour is unchanged.
        --   If a single decoration registration has both flags the floor and
        --   ceiling decorations will be aligned vertically.
    
        ----- Simple-type parameters
    
        decoration = name,
        -- The node name used as the decoration.
        -- If instead a list of strings, a randomly selected node from the list
        -- is placed as the decoration.
    
        height = 1,
        -- Decoration height in nodes.
        -- If height_max is not 0, this is the lower limit of a randomly
        -- selected height.
    
        height_max = 0,
        -- Upper limit of the randomly selected height.
        -- If absent, the parameter 'height' is used as a constant.
    
        param2 = 0,
        -- Param2 value of decoration nodes.
        -- If param2_max is not 0, this is the lower limit of a randomly
        -- selected param2.
    
        param2_max = 0,
        -- Upper limit of the randomly selected param2.
        -- If absent, the parameter 'param2' is used as a constant.
    
        place_offset_y = -1,
        -- Y offset of the decoration base node relative to the standard base
        -- node position.
        -- Can be positive or negative. Default is 0.
        -- Effect is inverted for "all_ceilings" decorations.
        -- Ignored by 'y_min', 'y_max' and 'spawn_by' checks, which always refer
        -- to the 'place_on' node.
    })
      
         end
    end
    minetest.register_decoration({
        deco_type = "simple",
    
        place_on = "mapgen:sand",
        -- Node (or list of nodes) that the decoration can be placed on
    
        sidelen = 8,
        -- Size of the square divisions of the mapchunk being generated.
        -- Determines the resolution of noise variation if used.
        -- If the chunk size is not evenly divisible by sidelen, sidelen is made
        -- equal to the chunk size.
    
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
        biomes = {"unknown"},
        y_min = -250,
        y_max = 90,
    
    
        spawn_by = "mapgen:water_source",
        num_spawn_by = 1,
        -- Number of spawn_by nodes that must be surrounding the decoration
        -- position to occur.
        -- If absent or -1, decorations occur next to any nodes.
    
        flags = "liquid_surface, force_placement, all_floors",
        decoration = {"rocks:stone_glove","rocks:stone_large_flat","rocks:stone_pillar_90"},
        height = 1,
        height_max = 0,
        param2 = 0,
        param2_max = 0,
        place_offset_y = 0,
    })