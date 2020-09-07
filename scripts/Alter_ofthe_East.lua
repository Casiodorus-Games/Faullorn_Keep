rotation = 0

function destroyObject(socket)
	for v, i in socket:contents() do
		i.go:destroy()
	end
end

function moveNonEssence(socket)
	for v, i in socket:contents() do
		dungeon_alcove_1.surface:addItem(spawn(tostring(i.go.name)).item)
		--hudPrint(tostring(i.go.item:getFullId()))
		hudPrint(i.go.name)
		i.go:destroy()
	end
end

function surfacecontains(socket, item)
	for v, i in socket:contents() do
		if i.go.name == item then return true
		end
	end
end

function rotateObject()
	rotation = rotation + 1
	East_Beacon:setPosition(16, 19, rotation, 0, 1)
	if surfacecontains(East_Beacon.socket, "orb_of_darkness") then
		destroyObject(East_Beacon.socket)
		East_Beacon.socket:addItem(spawn("orb_of_darkness").item)
	end
	if not surfacecontains(East_Beacon.socket, "orb_of_darkness") then
		moveNonEssence(East_Beacon.socket)
	end
	if rotation == 4 then
		rotation = 0
	end
end
