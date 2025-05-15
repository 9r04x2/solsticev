showPrint = true   --Debug


--CITY
DefaultEntitySet1 = "n_church"   --You can define here which Church is loaded when the server start
sceneControl1 = { x = -1685.45, y = -298.48, z = 46.25, h = 236.41}
interiorID1 = 0

--PALETO
DefaultEntitySet2 = "f_church" --You can define here which Church is loaded when the server start
sceneControl2 = {x=-312.18, y=6172.36, z=26.62, h=44.65}
interiorID2 = 0

--SANDY
DefaultEntitySet3 = "d_church" --You can define here which Church is loaded when the server start
sceneControl3 = {x=-299.42, y=2805.51, z=53.74, h=326.14}
interiorID3 = 0


entitySet = {
	["n_church"] = {name = "Classic"},
	["m_church"] = {name = "Wedding"},
	["f_church"] = {name = "Funeral"},
	["d_church"] = {name = "Decrepit"}
}

if not IsDuplicityVersion() then --(Client Side)
	interiorID1 =  GetInteriorAtCoords(-1680.37, -281.44, 51.93) --CITY
	interiorID2 =  GetInteriorAtCoords(-321.3, 6155.66, 32.31)   --PALETO
	interiorID3 =  GetInteriorAtCoords(-317.91, 2808.72, 59.43)  --SANDY
	if showPrint then
		print("interiorID1 : "..tostring(interiorID1))
		print("interiorID2 : "..tostring(interiorID2))
		print("interiorID3 : "..tostring(interiorID3))
	end
end



