local modn = minetest.get_current_modname()
local register_node = minetest.register_node
local colors = {"#f2f2f2","#ff6f5e","#228b22","#2c3d63","#ac67ef","#0e7fa7","#fdd66d","#8b8378","#addcca","#ff721a","#662f6d","#905f3b","#b62828"}
local patterns = {"","brick"}
local models = {"ramp","ramp_corner","spiker"}
register_node(modn .. ':block1', {
    description = 'block1”',
    tiles = {'stone2.png^[mask:mplate.png' },
    groups = { oddly_breakable_by_hand = 3 },
    is_ground_content = true
})
register_node(modn .. ':amber1', {
    description = 'Elk”',
    tiles = {'bricks_elek.png'},
    groups = { oddly_breakable_by_hand = 3 },
    is_ground_content = true
})
--- IKAITE SPIKE TEST
for n = 1, #models do
register_node(modn .. ':'..models[n], {
    description = 'block1”',
    drawtype = "mesh",
    mesh = models[n]..".obj",
    tiles = {"(haltex.png^[colorize:"..colors[1]..":78)"},
    groups = { oddly_breakable_by_hand = 3 },
    is_ground_content = true,
    paramtype2 = "facedir",
    on_punch = function(pos,node)
    minetest.set_node(pos,{name = node.name, param2 = node.param2 + 1})
    end

})
end
-- COLOURED NODES
for n = 1, #colors do
    for nn = 1, #patterns do
    register_node(modn .. ':hal'..n..patterns[nn], {
        description = 'HAL-58”',
        drawtype = "glasslike",
        --use_texture_alpha = true,
        tiles = {"(haltex.png^[colorize:"..colors[n]..":78)"..((nn > 1) and "^"..patterns[nn].."tex.png" or "")},
        groups = { oddly_breakable_by_hand = 3, wet = 1, synthetic = 1, salt = 1},
        is_ground_content = true
    })

    register_node(modn .. ':hal'..n..patterns[nn].."_trans", {
        description = 'HAL-58”',
        drawtype = "glasslike",
        use_texture_alpha = true,
        tiles = {"(haltex.png^[colorize:"..colors[n]..":78)"..((nn > 1) and "^"..patterns[nn].."tex.png" or "")},
        groups = { oddly_breakable_by_hand = 3, wet = 1, synthetic = 1, salt = 1},
        is_ground_content = true
    })
    end
end