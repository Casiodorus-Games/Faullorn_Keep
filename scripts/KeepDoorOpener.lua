function surfacecontains(socket, item)
	for v, i in socket:contents() do
		if i.go.name == item then return true
		end
	end
end

function openKeepDoor()
	if surfacecontains(East_Beacon.socket, "orb_of_darkness") and
	East_Beacon.facing == 2 and
	surfacecontains(West_Beacon.socket, "orb_of_light") and
	West_Beacon.facing == 2 then
	castle_door_portcullis_1.door:open()
	castle_door_portcullis_3.door:open()
	else
	castle_door_portcullis_1.door:close()
	castle_door_portcullis_3.door:close()
	end
end