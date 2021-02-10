local modn = minetest.get_current_modname()

minetest.register_biome({
    name = "unknown",
    node_top = modn .. ":sand",
    depth_top = 1,
    node_filler = modn .. ":sand4",
    depth_filler = 1,
    node_riverbed = modn .. ":stone",
    depth_riverbed = 2,
    y_min = -31000,
    y_max = 31000,
    heat_point = 0,
    humidity_point = 0,
    node_water = modn.."water_source"
})



minetest.register_on_generated(function() 
    local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
    local VA = VoxelArea:new{MinEdge = emin, MaxEdge = emax}
    --say(VA:getVolume())
    local data = vm:get_data()
    --say("["..#data.."]")
    --vm:write_to_map()
    
end)
