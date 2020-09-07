-- Initializin the brain fuction and stats
keyHolder.brain:addConnector('onThink', self.go.id, 'onThink')
keyHolder.brain:setSight(5) -- Preventing the monstor from seeing the player from a long distance

-- Bools for patrolling and seeing the player
toPatrol1 = true
toPatrol2 = false
toPatrol3 = false
toPatrol4 = false
partyVisible = false

-- When the monster thinks, do these things.
function onThink(self)
    canISeeParty(self) -- Checks to see if the monster can see the player
    if toPatrol1 == true and partyVisible == false then
        self.go.brain:goTo("patrolPoint1")
    end
    if toPatrol2 == true and partyVisible == false then
        self.go.brain:goTo("patrolPoint2")
    end
    if toPatrol3 == true and partyVisible == false then
        self.go.brain:goTo("patrolPoint3")
    end
    if toPatrol4 == true and partyVisible == false then
        self.go.brain:goTo("patrolPoint4")
    end
end

-- Once reaching Patrol Point 2, this will trigger and tell the monster to go to 
-- Patrol Point 1
function toPP1()
    toPatrol1 = true
    toPatrol2 = false
    toPatrol3 = false
    toPatrol4 = false
end

-- Once reaching Patrol Point 1, this will trigger and tell the monster to go to 
-- Patrol Point 2
function toPP2()
    toPatrol1 = false
    toPatrol2 = true
    toPatrol3 = false
    toPatrol4 = false
end

-- Once reaching Patrol Point 2, this will trigger and tell the monster to go to 
-- Patrol Point 3
function toPP3()
    toPatrol1 = false
    toPatrol2 = false
    toPatrol3 = true
    toPatrol4 = false
end

-- Once reaching Patrol Point 3, this will trigger and tell the monster to go to 
-- Patrol Point 4
function toPP4()
    toPatrol1 = false
    toPatrol2 = false
    toPatrol3 = false
    toPatrol4 = true
end

-- Checks to see if we can see the player. If we can, start chasing
-- If not, return to patrolling.
function canISeeParty(self)
    local distance = checkDistance(keyHolder.x, keyHolder.y, party.x, party.y)
    onSameMap()
    if distance < 5 and onSameMap() then
        -- Need check to see if there are walls in the way.
        partyVisible = true
    else
        partyVisible = false
    end
end

function checkDistance(x1, y1, x2, y2)
    local dx = x1 - x2
    local dy = y1 - y2
    return math.sqrt(dx * dx + dy * dy)
end

function onSameMap()
    return keyHolder.map:getName() == party.map:getName()
end