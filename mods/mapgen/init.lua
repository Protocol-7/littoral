local minetest = minetest
local modn = minetest.get_current_modname()
local modp = minetest.get_modpath(modn)
mapgen_params = {water_level = 89}
minetest.set_mapgen_params(mapgen_params)
minetest.set_mapgen_setting("mapgen_limit", 300, true)
littoral = {mapgen = {}}
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

dofile(modp.."/schematic.lua")
dofile(modp.."/biome.lua")
dofile(modp.."/ledger.lua")
dofile(modp.."/node.lua")
dofile(modp.."/decoration.lua")
dofile(modp.."/particle.lua")