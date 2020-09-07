rotation = 0

function destroyObject(socket)
	for v, i in socket:contents() do
		i.go:destroy()
	end
end

--Working Code
function moveNonEssence(socket)
	for v, i in socket:contents() do
		dungeon_alcove_1.surface:addItem(spawn(tostring(i.go.name)).item)
		i.go:destroy()
	end
end

--Broken Code
function moveNonEssence(socket)
	for v, i in socket:contents() do
		dungeon_alcove_1.surface:addItem(spawn(tostring(i.go:getFullId():sub(16,-3))).item)
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
	West_Beacon:setPosition(12, 19, rotation, 0, 1)
	if surfacecontains(West_Beacon.socket, "orb_of_light") then
		destroyObject(West_Beacon.socket)
		West_Beacon.socket:addItem(spawn("orb_of_light").item)
	end
	if not surfacecontains(West_Beacon.socket, "orb_of_light") then
		moveNonEssence(West_Beacon.socket)
	end
	if rotation == 4 then
		rotation = 0
	end
end
