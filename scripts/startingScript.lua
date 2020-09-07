function startingItems()
    -- Removing Items
    local x = 1
    repeat
        if party.party:getChampion(1):getEnabled() then
            party.party:getChampion(1):removeItemFromSlot(x)
        end
        if party.party:getChampion(2):getEnabled() then
            party.party:getChampion(2):removeItemFromSlot(x)
        end
        if party.party:getChampion(3):getEnabled() then
            party.party:getChampion(3):removeItemFromSlot(x)
        end
        if party.party:getChampion(4):getEnabled() then
            party.party:getChampion(4):removeItemFromSlot(x)
        end
        x = x + 1
    until x == 33

    -- Adding Items
    local i = 1
    repeat
        if party.party:getChampion(i):getEnabled() then
            -- Basic Information --
            local champ_race = party.party:getChampion(i):getRace()
            local champ_class = party.party:getChampion(i):getClass()
            -- Basics for all characters--
            party.party:getChampion(i):insertItem(4,spawn("peasant_tunic").item)
            party.party:getChampion(i):insertItem(5,spawn("peasant_breeches").item)
            party.party:getChampion(i):insertItem(6,spawn("sandals").item)

            if champ_class == "alchemist" then
                local rangedWeapon = spawn("dart")
                rangedWeapon.item:setStackSize(5)
                party.party:getChampion(i):insertItem(1,rangedWeapon.item)
            end

            if champ_class == "barbarian" then
                party.party:getChampion(i):insertItem(1,spawn("dagger").item)
            end

            if champ_class == "battle_mage" then
            end

            if champ_class == "farmer" then
            end

            if champ_class == "fighter" then
                party.party:getChampion(i):insertItem(1,spawn("dagger").item)
            end

            if champ_class == "knight" then
            end

            if champ_class == "rogue" then
                party.party:getChampion(i):insertItem(1,spawn("longbow").item)
            end

            if champ_class == "wizard" then
                party.party:getChampion(i):insertItem(1,spawn("acolyte_staff").item)
            end
        end
        i = i + 1
    until i > 4
end