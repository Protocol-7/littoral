local modn = minetest.get_current_modname()
local modp = minetest.get_modpath(modn)

for n = 1, 12 do
minetest.register_node(modn..":tile"..n,{
    description = "Tile "..n,
    tiles = {"tile"..n..".png"},
    groups = {oddly_breakable_by_hand = 1}
})
end
minetest.register_node(modn..":fp",{
    description = "Fencepost",
    drawtype = "mesh",
    mesh = "fencepost2.obj",
    tiles = "tile2.png",
    groups = {oddly_breakable_by_hand = 1}
})