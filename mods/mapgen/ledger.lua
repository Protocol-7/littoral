local add_biota = littoral.add_biota
local modn = minetest.get_current_modname()

function say(x)
	return minetest.chat_send_all(type(x) == "string" and x or minetest.serialize(x))
end

-----------------
--UTIL
-----------------

local function meshtex(tex1,tex2)
	return "[combine:16x32:0,0="..tex1..":0,16="..(tex2 or "sand.png")
end


littoral.add_biota = function(data)
	local biota = littoral.biota
	local n = #biota[data.form]+1
	biota[data.form][n] = data
	biota[data.form][data.name] = n
end

local pool = {
    {name = "seagrass1",
    form = "seagrass",
    abundance = 2,
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 1,
	param2 = nil,
	paramtypes = {[2] = "meshoptions"}},

    {name = "seagrass2",
	form = "seagrass",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 8,
	param2 = nil,
	paramtypes = {[2] = "leveled"}},

    {name = "seagrass3",
    form = "seagrass",
    abundance = 7,
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 1,
	param2 = nil,
	paramtypes = {[2] = "meshoptions"}},

    {name = "seagrass4",
    form = "seagrass",
    abundance = 6,
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 1,
	param2 = nil,
	paramtypes = {[2] = "meshoptions"}},

    {name = "seagrass5",
	form = "seagrass",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 4,
	param2 = nil,
	paramtypes = {[2] = "leveled"}},

    {name = "seagrass6",
	form = "seagrass",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 1,
	param2 = nil,
	paramtypes = {[2] = "meshoptions"}},

    {name = "seagrass7",
	form = "seagrass",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 12,
	param2 = nil,
	paramtypes = {[2] = "leveled"}},

    {lname = "OrangeCrust",
	name = "bryozoan1",
    order = 1,
	abundance = 8,
	form = "bryozoan",
	drawtype = "mesh",
	tiles = {"[combine:16x32:0,0=bryozoan1.png:0,16=sand.png"},
	height = 1,
	param2 = nil,
	paramtypes = {}},

    {lname = "Glassy",
	name = "ascidian1",
    order = 1,
	form = "ascidian",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {},
	height = 1,
	param2 = nil,
    paramtypes = {[2] = "meshoptions"}},

    {lname = "WhiteCrust",
	name = "ascidian2",
    order = 2,
	form = "ascidian",
	drawtype = "mesh",
	tiles = {"[combine:16x32:0,0=ascidian2.png:0,16=sand.png"},
	height = 1,
	param2 = nil,
	paramtypes = {nil,"meshoptions"}},

    {lname = "Siphonax",
	name = "poriferan1",
    order = 1,
	form = "poriferan",
	drawtype = "plantlike_rooted",
	tiles = {},
	waving = 1,
	height = 1,
	param2 = nil,
	paramtypes = {[2] = "meshoptions"}},
	{
		name = "poriferan3",
		form = "poriferan",
		abundance = 8,
		waving = 1,
		depth_index = 4,
		tiles = {"sand.png^rootcover.png"},
		height = 1,
		special_tiles = {{name ="poriferan3.png", tileable_vertical = false}},
		drawtype = "plantlike_rooted",
		paramtypes = {"light","meshoptions"},
		groups = {poriferan = 1}
	},
	{
		name = "poriferan2",
		form = "poriferan",
		abundance = 8,
		waving = 1,
		depth_index = 4,
		tiles = {"sand.png^rootcover.png"},
		height = 1,
		special_tiles = {{name ="poriferan2.png", tileable_vertical = false}},
		drawtype = "plantlike_rooted",
		paramtypes = {"light","meshoptions"},
		groups = {poriferan = 1}
	},
	{
		name = "seagrass8",
		--order = 8,
		form = "seagrass",
		abundance = 1.6,
		--waving = 1,
		depth_index = 4,
		tiles = {"sand.png^rootcover.png"},
		height = 1,
		special_tiles = {{name ="seagrass8.png"}},
		drawtype = "plantlike_rooted",
		paramtypes = {[2] = "meshoptions"},
		groups = {seagrass = 1}
	}
}
local default_deco = {
	deco_type = "simple",
    --noise_params = tab.noise_params,
        y_min = -30000,
        y_max = 89,
        --spawn_by = tab.spawn_by or "mapgen:water_source",
        --num_spawn_by = tab.num_spawn_by,
        --flags = tab.flags,
        --decoration = tab.decoration,
        height = 1,
        height_max = 1,
        --param2 = tab.param2,
        --param2_max = tab.param2_max,
        place_offset_y = -1,
}
for n = 1, #pool do
    local org = pool[n]
    org.special_tiles = org.special_tiles or org.drawtype == "plantlike_rooted" and {{name = org.name..".png", tileable_vertical = true}}
    org.tiles[1] = (org.drawtype == "mesh" and "[combine:16x32:0,0="..org.name..".png:0,16=sand"..".png") or "sand.png"
	org.mesh = org.drawtype == "mesh" and org.name..".obj"
	local deco = {}
	for k,v in pairs(default_deco)do
		deco[k] = v
	end
	deco.decoration = modn..":"..org.name
	deco.label = "Mapgen placement for "..org.name
	deco.param2_max = org.drawtype == "plantlike_rooted" and 16*6 or 4
	deco.y_min = org.depth_index and org.depth_index*-100 or org.form == "seagrass" and 0 or -250
    deco.y_max = (org.form == "bryozoan") and 52 or 73
	deco.noise_params = {
	offset = -0.4,
	scale = (org.abundance and org.abundance/10) or (org.form == "seagrass" and 0.8) or 0.6,
	spread = {x = 16, y = 16, z = 16},
	seed = 354,
	octaves = 1,
	persist = 0.4,
	lacunarity = 2.0,
	flags = "absvalue"
	}
	org.deco = {}
	org.deco[#org.deco+1] = deco
end
for n = 1, #pool do
    littoral.add_biota(pool[n])
end
--[[
littoral.add_biota(
	{
		name = "seagrass8",
		--order = 8,
		form = "seagrass",
		abundance = 1.6,
		--waving = 1,
		depth_index = 4,
		tiles = {"sand.png^rootcover.png"},
		height = 1,
		special_tiles = {{name ="seagrass8.png"}},
		drawtype = "plantlike_rooted",
		paramtypes = {[2] = "meshoptions"},
		groups = {seagrass = 1}
	}
)
littoral.add_biota(
	{
		name = "poriferan2",
		form = "poriferan",
		abundance = 8,
		waving = 1,
		depth_index = 4,
		tiles = {"sand.png^rootcover.png"},
		height = 1,
		special_tiles = {{name ="poriferan2.png", tileable_vertical = false}},
		drawtype = "plantlike_rooted",
		paramtypes = {"light","meshoptions"},
		groups = {poriferan = 1}
	}
)
littoral.add_biota(
	{
		name = "poriferan3",
		form = "poriferan",
		abundance = 8,
		waving = 1,
		depth_index = 4,
		tiles = {"sand.png^rootcover.png"},
		height = 1,
		special_tiles = {{name ="poriferan3.png", tileable_vertical = false}},
		drawtype = "plantlike_rooted",
		paramtypes = {"light","meshoptions"},
		groups = {poriferan = 1}
	}
)]]
------------------------------
-- ABIOTA
------------------------------
littoral.add_abiota = function(data)
	local abiota = littoral.abiota
	local n = #abiota[data.form]+1
	abiota[data.form][n] = data
	abiota[data.form][data.name] = n
end

littoral.add_abiota({
	name = "stone1",
	form = "stone",
	drawtype = "mesh",
	abundance = 6,
	mesh = "stone1.obj",
	tiles = {meshtex("stone2.png")},
	groups = {cracky = 1}
})

littoral.add_abiota({
	name = "mdc",
	form = "tech",
	abundance = 0.001,
	drawtype = "mesh",
	mesh = "massdecomp_buried.obj",
	tiles = {"metal.png"},
	groups = {cracky = 1},
	paramtypes = {"light","facedir"}
})