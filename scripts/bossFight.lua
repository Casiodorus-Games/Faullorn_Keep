function startFight()
    hudPrint("The boss fight starts now!")
    SkeletonBossboss.bossfight:addMonster(commander_lorn.monster)
    SkeletonBossboss.bossfight:activate()
    castle_door_portcullis_3.door:close()
end

function endFight()
    castle_door_portcullis_3.door:open()
    castle_entrance_door_1.door:open()
end