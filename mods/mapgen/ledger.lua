local add_biota = littoral.add_biota
local modn = minetest.get_current_modname()

local pool = {
    {name = "1",
    form = "seagrass",
    abundance = 2,
	drawtype = "plantlike_rooted",
	tiles = {},
	height = 1,
	param2 = nil,
	paramtypes = {[2] = "meshoptions"}},
    {name = "2",
	form = "seagrass",
	drawtype = "plantlike_rooted",
	tiles = {},
	height = 8,
	param2 = nil,
	paramtypes = {[2] = "leveled"}},
    {name = "3",
    form = "seagrass",
    abundance = 7,
	drawtype = "plantlike_rooted",
	tiles = {},
	height = 1,
	param2 = nil,
	paramtypes = {[2] = "meshoptions"}},
    {name = "4",
    form = "seagrass",
    abundance = 6,
	drawtype = "plantlike_rooted",
	tiles = {},
	height = 1,
	param2 = nil,
	paramtypes = {[2] = "meshoptions"}},
    {name = "5",
	form = "seagrass",
	drawtype = "plantlike_rooted",
	tiles = {},
	height = 4,
	param2 = nil,
	paramtypes = {}},
    {name = "6",
	form = "seagrass",
	drawtype = "plantlike_rooted",
	tiles = {},
	height = 6,
	param2 = nil,
	paramtypes = {[2] = "leveled"}},
    {name = "7",
	form = "seagrass",
	drawtype = "plantlike_rooted",
	tiles = {},
	height = 12,
	param2 = nil,
	paramtypes = {}},
    {name = "OrangeCrust",
    order = 1,
	form = "bryozoan",
	drawtype = "mesh",
	tiles = {"[combine:16x32:0,0=bryo$.png:0,16=sand.png"},
	height = 1,
	param2 = nil,
	paramtypes = {}},
    {name = "Glassy",
    order = 1,
	form = "ascidian",
	drawtype = "plantlike_rooted",
	tiles = {},
	height = 1,
	param2 = nil,
    paramtypes = {[2] = "meshoptions"}},
    {name = "WhiteCrust",
    order = 2,
	form = "ascidian",
	drawtype = "mesh",
	tiles = {"[combine:16x32:0,0=asci$.png:0,16=sand.png"},
	height = 1,
	param2 = nil,
	paramtypes = {nil,"meshoptions"}},
    {name = "Siphonax",
    order = 1,
	form = "poriferan",
	drawtype = "plantlike_rooted",
	tiles = {},
	height = 1,
	param2 = nil,
	paramtypes = {[2] = "meshoptions"}},
}
for n = 1, #pool do
    local org = pool[n]
    local order = org.order or org.name
    org.special_tiles = org.drawtype == "plantlike_rooted" and {{name = org.form..order..".png", tileable_vertical = true}}
    org.tiles[1] = (org.drawtype == "mesh" and "[combine:16x32:0,0="..org.form..org.order..".png:0,16=sand"..".png") or "sand.png"
end
for n = 1, #pool do
    add_biota(pool[n])
end

littoral.add_biota(
	{
		name = "macro",
		order = 8,
		form = "seagrass",
		abundance = 6,
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
		name = "ferf",
		order = 3,
		form = "ascidian",
		abundance = 3,
		depth_index = 4,
		tiles = {"sand.png^rootcover.png"},
		height = 1,
		special_tiles = {{name ="ascidian3.png"}},
		drawtype = "plantlike_rooted",
		paramtypes = {[2] = "meshoptions"},
		groups = {ascidian = 1}
	}
)