local minetest = minetest
local modn = minetest.get_current_modname()
local modp = minetest.get_modpath(modn)
littoral = {mapgen = {}}


function say(x)
	return minetest.chat_send_all(type(x) == "string" and x or minetest.serialize(x))
end
