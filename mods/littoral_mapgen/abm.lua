local modn = minetest.get_current_modname()

minetest.register_abm({
	label = "Sand Drying",
	nodenames = {"group:sandy"},
	interval = 5,
	chance = 0.1,
	action = function(pos, node, aoc, aoc2)
		local node = minetest.get_node(pos)
		local wet = minetest.find_node_near(pos, 1, modn..":water_source")
		if(node.name == modn..":sand_dry" and wet)then
			minetest.set_node(pos, {name = modn..":sand_wet"})
			littoral.bubble(pos,"bubble2.png")
		elseif(node.name == modn..":sand_wet" and not wet)then
			minetest.set_node(pos, {name = modn..":sand_dry"})
		end
	end
})
minetest.register_abm({
	label = "po",
	nodenames = {"group:poriferan"},
	interval = 2,
	chance = 100,
	action = function(pos, node, aoc, aoc2)
		littoral.bubble(pos, "bubble2.png")
	end
})
minetest.register_lbm({
	label = "fd",
	nodenames = {"group:poriferan","group:ascidian","mapgen:seagrass4","mapgen:seagrass3"},
	name = modn..":meshoptionsfix",
	run_at_every_load = true,
	action = function(pos, node)
		local node = minetest.get_node(pos)
		if(node.param2 == 0)then
			minetest.set_node(pos, {name = node.name, param2 = math.random(1,4)})
		end
	end
})
