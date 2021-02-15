local modn = minetest.get_current_modname()
local sl = 69 -- Sea-surface-level
mapgen_params = {water_level = sl}
minetest.set_mapgen_params(mapgen_params)
minetest.set_mapgen_setting("mapgen_limit", 300, true)
------------------------------------------
-- MAPGEN LAYER DEFAULTS
------------------------------------------
littoral.biome = {}
littoral.biome.limit = {}
local limit = littoral.biome.limit

limit.sea_level = sl
limit.littoral = {sl+6,sl-6}
limit.subtidal = {sl-7,sl-72}
limit.bathyal = {sl-73,sl-216}
limit.abyssal = {sl-217,sl-321}
limit.hadal = {sl-322,sl-666}
limit.vernal = {sl-667, -31000}

------------------------------------------
-- SINGLE BIOME REGISTER
------------------------------------------
minetest.register_biome({
    name = "unknown",
    node_top = modn .. ":sand",
    depth_top = 1,
    node_filler = modn .. ":stone",
    depth_filler = 1,
    node_riverbed = modn .. ":stone",
    depth_riverbed = 4,
    y_min = -31000,
    y_max = 31000,
    heat_point = 0,
    humidity_point = 0,
    node_water = modn..":water_source"
})

------------------------------------------
-- MAPGEN BORDER DEFAULTS
------------------------------------------
littoral.mapgen.origin = {}
littoral.mapgen.limit = 256

minetest.register_on_joinplayer(function(p)
    local pos = p:get_pos()
    littoral.set_origin(pos)
end)

littoral.set_origin = function(pos) -- Allows storing parameters related to mapgen origin point.
    for k,v in pairs(pos) do
    littoral.mapgen.origin[k] = v
    end
end
local function array_to_pos(n,pos,sl)
    n = n - 1
    local z = math.floor(n/sl^2)
    n = n - (z*sl^2)
    local y = math.floor(n/sl)
    n = n - (y*sl)
    local x = math.floor(n)
    return {x = x + pos.x, y = y + pos.y, z = z + pos.z}
end

minetest.register_on_generated(function() 
    local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
    local VA = VoxelArea:new{MinEdge = emin, MaxEdge = emax}
    --say(VA:getVolume())
    local data = vm:get_data()

    local volume = #data
    local sidelen = volume^(1/3)
    --[[for n = 1, volume do
    local pos = VA:position(n)
        if(vector.distance(littoral.mapgen.origin,pos) >= 50)then
            data[n] = minetest.get_content_id(modn..":stone")--minetest.CONTENT_AIR 
        end
    end
    vm:set_data(data)]]
    -- LIGHTING RECALCS (solves large dark patch bugs)
    vm:set_lighting({day=minetest.LIGHT_MAX,night=3},{x=emin.x,y=emin.y,z=emin.z},emax)
	vm:calc_lighting({x=emin.x,y=emin.y,z=emin.z},emax)
    
    vm:write_to_map(true)
    
end)
