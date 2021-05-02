local minetest = minetest
local modn = minetest.get_current_modname()
local modp = minetest.get_modpath(modn)
local register_node = minetest.register_node
local register_alias = minetest.register_alias
littoral.biota = {}
local biota = littoral.biota
biota.names_all = {}
biota.seagrass = {}
biota.bryozoan = {}
biota.ascidian = {}
biota.poriferan = {}


dofile(modp.."/biota.lua")

register_node(modn .. ':fishie', {
    description = 'Essential node for mapgen alias “mapgen_stone”',
    tiles = { 'molten.png' },
    drawtype = "mesh",
    mesh = "threespinetail.obj",
    groups = { oddly_breakable_by_hand = 3 },
    is_ground_content = true
})