local minetest = minetest
local modn = minetest.get_current_modname()
local modp = minetest.get_modpath(modn)
littoral.abiota = {}
local abiota = littoral.abiota
abiota.tech = {} -- move to tech mod
abiota.stone = {}

dofile(modp.."/schematic.lua")
dofile(modp.."/biome.lua")
dofile(modp.."/abiota.lua")
dofile(modp.."/node.lua")
dofile(modp.."/decoration.lua")
dofile(modp.."/particle.lua")
dofile(modp.."/abm.lua")
