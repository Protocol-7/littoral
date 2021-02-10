local minetest = minetest
local modn = minetest.get_current_modname()
local modp = minetest.get_modpath(modn)
mapgen_params = {water_level = 89}
minetest.set_mapgen_params(mapgen_params)
littoral = {}
littoral.abiota = {}
local abiota = littoral.abiota
abiota.tech = {}
abiota.stone = {}
littoral.biota = {}
local biota = littoral.biota
biota.seagrass = {}
biota.bryozoan = {}
biota.ascidian = {}
biota.poriferan = {}


dofile(modp.."/ledger.lua")
dofile(modp.."/node.lua")
dofile(modp.."/biome.lua")
dofile(modp.."/decoration.lua")
