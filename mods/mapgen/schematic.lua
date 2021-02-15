littoral.schematic = {}

local n1 = { name = "mapgen:water_source" }
local n2 = { name = "littoral_tech:hal1" }
local n3 = { name = "littoral_tech:ramp", param2 = 2 }
local n4 = { name = "littoral_tech:ramp_corner", param2 = 2 }
local n5 = { name = "littoral_tech:ramp_corner", param2 = 1 }
local n6 = { name = "littoral_tech:ramp", param2 = 3 }
local n7 = { name = "littoral_tech:ramp", param2 = 25 }
local n8 = { name = "littoral_tech:spiker", param2 = 3 }
local n9 = { name = "littoral_tech:ramp_corner", param2 = 3 }
local n10 = { name = "littoral_tech:ramp_corner", param2 = 24 }
local n11 = { name = "littoral_tech:ramp", param2 = 24 }

littoral.schematic.ikaite1 = {
	yslice_prob = {
		
	},
	size = {
		y = 8,
		x = 5,
		z = 5
	}
,
	data = {
n1, n1, n2, n1, n1, n1, n1, n2, n1, n1, n1, n1, n3, n1, n1, n1, n1, 
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
n1, n1, n1, n1, n1, n1, n1, n2, n2, n2, n1, n1, n2, n2, n2, n1, n1, 
n2, n2, n2, n1, n1, n4, n2, n5, n1, n1, n1, n2, n1, n1, n1, n1, n2, 
n1, n1, n1, n1, n3, n1, n1, n1, n1, n1, n1, n1, n2, n2, n2, n2, n2, 
n2, n2, n2, n2, n2, n6, n2, n2, n2, n7, n1, n2, n2, n2, n1, n1, n2, 
n2, n2, n1, n1, n2, n2, n2, n1, n1, n6, n2, n7, n1, n1, n1, n8, n1, 
n1, n1, n2, n2, n2, n1, n1, n2, n2, n2, n1, n1, n2, n2, n2, n1, n1, 
n9, n2, n10, n1, n1, n1, n2, n1, n1, n1, n1, n2, n1, n1, n1, n1, n11, 
n1, n1, n1, n1, n1, n1, n1, n1, n1, n2, n1, n1, n1, n1, n2, n1, n1, 
n1, n1, n11, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 
n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, 

}
}