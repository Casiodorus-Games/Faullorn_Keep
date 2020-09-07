function surfacecontains(socket, item)
	for v, i in socket:contents() do
		if i.go.name == item then return true
		end
	end
end

function destroyObject(socket)
	for v, i in socket:contents() do
		i.go:destroy()
	end
end

function createSword()
    if surfacecontains(dungeon_alcove_1.surface, "long_sword") and surfacecontains(dungeon_alcove_1.surface, "scroll_fireburst") then
        destroyObject(dungeon_alcove_1.surface)
        destroyObject(dungeon_alcove_1.surface)
        dungeon_alcove_1.surface:addItem(spawn("fire_blade").item)
    end
end
