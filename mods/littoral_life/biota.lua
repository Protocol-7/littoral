local modn = minetest.get_current_modname()
local register_node = minetest.register_node
------------------------------
-- BIOTA
------------------------------
local pool = {
    {
		name = "seagrass1",
		lname = "ectocarpus siliculosus",
    	form = "seagrass",
    	abundance = 2,
		drawtype = "plantlike_rooted",
		waving = 1,
		tiles = {},
		height = 1,
		param2 = nil,
		paramtypes = {[2] = "meshoptions"}
	},
    {
		name = "seagrass2",
		lname = "macrocystis pyrifera",
		form = "seagrass",
		drawtype = "plantlike_rooted",
		depth_zone = "subtidal",
		waving = 1,
		tiles = {},
		height = 8 * 16,
		param2 = nil,
		paramtypes = {[2] = "leveled"}
	},
	{
		name = "seagrass3",
		lname = "zostera marina",
    	form = "seagrass",
    	abundance = 7,
		drawtype = "plantlike_rooted",
		waving = 1,
		tiles = {},
		depth_zone = "subtidal",
		height = 1,
		param2 = nil,
		paramtypes = {[2] = "meshoptions"}
	},
    {
		name = "seagrass4",
		lname = "saccharina latissima",
    	form = "seagrass",
    	abundance = 6,
		drawtype = "plantlike_rooted",
		waving = 1,
		depth_zone = "littoral",
		tiles = {},
		height = 1,
		param2 = nil,
		paramtypes = {[2] = "meshoptions"}
	},
    {
		name = "seagrass5",
		lname = "laminaria japonica",
		form = "seagrass",
		drawtype = "plantlike_rooted",
		waving = 1,
		depth_zone = "bathyal",
		tiles = {},
		height = 4 * 16,
		param2 = nil,
		paramtypes = {[2] = "leveled"}
	},
    {
		name = "seagrass6",
		lname = "thalassia testudinum",
		form = "seagrass",
		drawtype = "plantlike_rooted",
		waving = 1,
		tiles = {},
		depth_zone = "subtidal",
		height = 1,
		param2 = nil,
		paramtypes = {[2] = "meshoptions"}
	},
    {
		name = "seagrass7",
		lname = "sargassum muticum",
		form = "seagrass",
		drawtype = "plantlike_rooted",
		depth_zone = "bathyal",
		waving = 1,
		tiles = {},
		height = 12*16,
		param2 = nil,
		paramtypes = {[2] = "leveled"}
	},
    {
		lname = "schizoporella unicornis",
		name = "bryozoan1",
    	order = 1,
		abundance = 8,
		form = "bryozoan",
		drawtype = "mesh",
		tiles = {"[combine:16x32:0,0=bryozoan1.png:0,16=sand.png"},
		height = 1,
		param2 = nil,
		paramtypes = {}
	},
    {
		lname = "ascidia paratropa",
		name = "ascidian1",
    	order = 1,
		form = "ascidian",
		drawtype = "plantlike_rooted",
		waving = 1,
		tiles = {},
		height = 1,
		param2 = nil,
    	paramtypes = {[2] = "meshoptions"}
	},
    {
		lname = "didemnum carnulentum",
		name = "ascidian2",
    	order = 2,
		form = "ascidian",
		drawtype = "mesh",
		tiles = {"[combine:16x32:0,0=ascidian2.png:0,16=sand.png"},
		height = 1,
		param2 = nil,
		paramtypes = {nil,"meshoptions"}
	},
    {
		lname = "spongia officinalis",
		name = "poriferan1",
    	order = 1,
		form = "poriferan",
		drawtype = "plantlike_rooted",
		tiles = {},
		waving = 1,
		height = 1,
		param2 = nil,
		paramtypes = {[2] = "meshoptions"}
	},
	{
		name = "poriferan3",
		form = "poriferan",
		abundance = 8,
		waving = 1,
		tiles = {"sand.png^rootcover.png"},
		height = 1,
		special_tiles = {{name ="poriferan3.png", tileable_vertical = false}},
		drawtype = "plantlike_rooted",
		paramtypes = {"light","meshoptions"},
		groups = {poriferan = 1}
	},
	{
		name = "poriferan2",
		lname = "euplectella aspergillum",
		form = "poriferan",
		abundance = 8,
		waving = 1,
		tiles = {"sand.png^rootcover.png"},
		height = 1,
		special_tiles = {{name ="poriferan2.png", tileable_vertical = false}},
		drawtype = "plantlike_rooted",
		paramtypes = {"light","meshoptions"},
		groups = {poriferan = 1}
	},
	{
		name = "seagrass8",
		form = "seagrass",
		abundance = 8,
		waving = 1,
		tiles = {"sand.png^rootcover.png"},
		height = 1,
		special_tiles = {{name ="seagrass8.png"}},
		drawtype = "plantlike_rooted",
		paramtypes = {[2] = "meshoptions"},
		groups = {seagrass = 1}
	},
	{
		name = "bryozoan2",
		form = "bryozoan",
		abundance = 8,
		tiles = {"stone_crustose2.png"},
		height = 1,
		drawtype = "normal",
		paramtypes = {},
		groups = {bryozoan = 1}
	},
	{
		name = "bryozoan3",
		form = "bryozoan",
		abundance = 8,
		tiles = {"stone3.png^(crustose1.png^[mask:molten.png)"},
		height = 1,
		drawtype = "normal",
		paramtypes = {},
		groups = {bryozoan = 1}
	}
}


littoral.add_biota = function(data)
	local biota = littoral.biota
	local n = #biota[data.form]+1
	biota[data.form][n] = data
	biota[data.form][data.name] = n
	biota.names_all[data.name] = {form = data.form, id = n}
end

for n = 1, #pool do
    local org = pool[n]
    org.special_tiles = org.special_tiles or org.drawtype == "plantlike_rooted" and {{name = org.name..".png", tileable_vertical = true}}
    
    org.tiles[1] = org.tiles[1] or --[[(org.drawtype == "mesh" and "[combine:16x32:0,0="..org.name..".png:0,16=sand"..".png") or]] "sand.png"
	
    org.mesh = org.drawtype == "mesh" and org.name..".obj"
	org.place_offset_y = -1
end
for n = 1, #pool do
    littoral.add_biota(pool[n])
end

--
-- NODE REGISTRATION
--
local bio = littoral.biota
for _,v in pairs(bio) do
	for n = 1, #v do
		local org = v[n]
	local name = org.name
	org.order = org.order or org.name -- temporary, seagrasses dont have orders yet

register_node(modn..":"..org.name, {
    description = org.name.."("..org.form..")",
	drawtype = org.drawtype or "plantlike_rooted",
	paramtype = org.paramtypes[1] or "light",
	paramtype2 = org.paramtypes[2] or (org.drawtype == "plantlike_rooted" and org.height > 1) and "leveled",
	tiles = org.tiles,
	mesh = org.mesh,
	waving = org.waving,
	special_tiles = org.special_tiles,
	groups = {cracky = 1, [org.form] = 1},
	on_punch = function(pos, node, puncher)
	minetest.chat_send_all(node.param2)
	littoral.bubble(pos, node.name == modn..":seagrass6" and "smote1.png" or "bubble2.png")
	end
	
})
end
end

