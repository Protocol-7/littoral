local minetest = minetest
local modn = minetest.get_current_modname()
local modp = minetest.get_modpath(modn)
mapgen_params = {water_level = 89}
minetest.set_mapgen_params(mapgen_params)
littoral = {}

littoral.biota = {}
local biota = littoral.biota
biota.seagrass = {}
biota.bryozoan = {}
biota.ascidian = {}
biota.poriferan = {}

function say(x)
return minetest.chat_send_all(type(x) == "string" and x or minetest.serialize(x))
end
littoral.add_biota = function(data)
	return table.insert(biota[data.form], data)
end



dofile(modp.."/ledger.lua")
dofile(modp.."/node.lua")
dofile(modp.."/biome.lua")
dofile(modp.."/decoration.lua")
