-- Annihilator script by Nicaw
-- [complete rewrite based on GriZzm0/Tworn script]

-- Configuration
local required_level = 100
local quest_id = 100
local switch_uid = 5200
local switch_id1 = 1946
local switch_id2 = 1945
local allow_reentry = true

local player1_source = {x=761, y=950, z=11}
local player2_source = {x=760, y=950, z=11}
local player3_source = {x=759, y=950, z=11}
local player4_source = {x=758, y=950, z=11}

local player1_destination = {x=761, y=950, z=12}
local player2_destination = {x=760, y=950, z=12}
local player3_destination = {x=759, y=950, z=12}
local player4_destination = {x=758, y=950, z=12}

local demon1_position = {x=760, y=948, z=12}
local demon2_position = {x=758, y=948, z=12}
local demon3_position = {x=762, y=950, z=12}
local demon4_position = {x=763, y=950, z=12}
local demon5_position = {x=761, y=952, z=12}
local demon6_position = {x=759, y=952, z=12}

local chamber_start = {x=757, y=947, z=12}
local chamber_end = {x=764, y=953, z=12}
-- Don't look any further; you are done
function onUse(cid, item, frompos, item2, topos)
    if item.uid == switch_uid then
        if item.itemid == switch_id1 then
            local player1 = getTopCreature(player1_source)
            local player2 = getTopCreature(player2_source)
            local player3 = getTopCreature(player3_source)
            local player4 = getTopCreature(player4_source)
            
            if isPlayer(player1.uid) == TRUE and isPlayer(player2.uid) == TRUE and isPlayer(player3.uid) == TRUE and isPlayer(player4.uid) == TRUE then
            
                if getPlayerLevel(player1.uid) >= required_level and getPlayerLevel(player2.uid) >= required_level and
                   getPlayerLevel(player3.uid) >= required_level and getPlayerLevel(player4.uid) >= required_level then
                   
                    if allow_reentry or 
                       getPlayerStorageValue(player1.uid,quest_id) <= 0 and getPlayerStorageValue(player2.uid,quest_id) <= 0 and
                       getPlayerStorageValue(player3.uid,quest_id) <= 0 and getPlayerStorageValue(player4.uid,quest_id) <= 0 then
                       
                        doSummonCreature("Demon", demon1_position)
                        doSummonCreature("Demon", demon2_position)
                        doSummonCreature("Demon", demon3_position)
                        doSummonCreature("Demon", demon4_position)
                        doSummonCreature("Demon", demon5_position)
                        doSummonCreature("Demon", demon6_position)
                        
                        doSendMagicEffect(player1_source,2)
                        doSendMagicEffect(player2_source,2)
                        doSendMagicEffect(player3_source,2)
                        doSendMagicEffect(player4_source,2)
                        
                        doTeleportThing(player1.uid,player1_destination)
                        doTeleportThing(player2.uid,player2_destination)
                        doTeleportThing(player3.uid,player3_destination)
                        doTeleportThing(player4.uid,player4_destination)
                        
                        doSendMagicEffect(player1_destination,10)
                        doSendMagicEffect(player2_destination,10)
                        doSendMagicEffect(player3_destination,10)
                        doSendMagicEffect(player4_destination,10)
                        
                        doTransformItem(item.uid,switch_id2)
                    else
                        doPlayerSendCancel(cid,"Someone has already done this quest.")
                    end
                else
                    doPlayerSendCancel(cid,"Someone's level is too low.")
                end
            else
                doPlayerSendCancel(cid,"You need 4 players in your team.")
            end
        elseif item.itemid == switch_id2 then
            local monsters = {}
            local monsters_total = 0
            local pos = {x = chamber_start.x, y = chamber_start.y, z=chamber_start.z}
            local player_exists = false
            while pos.y <= chamber_end.y and not player_exists do
                pos.x = chamber_start.x
                while pos.x <= chamber_end.x and not player_exists do
                    local creature = getTopCreature(pos)
                    if isPlayer(creature.uid) == TRUE then
                        player_exists = true
                    elseif isCreature(creature.uid) == TRUE then
                        monsters[monsters_total] = creature.uid
                        monsters_total = monsters_total + 1
                    end
                    pos.x = pos.x + 1
                end
                pos.y = pos.y + 1
            end
            if player_exists then
                doPlayerSendCancel(cid,"Please wait until the room is clear.")
            else
                local i = 0
                while i < monsters_total do
                    doRemoveCreature(monsters[i])
                    i = i + 1
                end
                doTransformItem(item.uid,switch_id1)
            end
        end
    else
        local status = getPlayerStorageValue(cid, quest_id)
        if status <= 0 then
            if item.uid == 5001 then
                doPlayerSendTextMessage(cid,22,"You have found a demon armor.")
                doPlayerAddItem(cid,2494,1)
                setPlayerStorageValue(cid,quest_id,1)
            elseif item.uid == 5002 then
                doPlayerSendTextMessage(cid,22,"You have found a magic sword.")
                doPlayerAddItem(cid,2400,1)
                setPlayerStorageValue(cid,quest_id,1)
            elseif item.uid == 5003 then
                doPlayerSendTextMessage(cid,22,"You have found a stonecutter axe.")
                doPlayerAddItem(cid,2431,1)
                setPlayerStorageValue(cid,quest_id,1)
            elseif item.uid == 5004 then
                doPlayerSendTextMessage(cid,22,"You have found a present.")
                doPlayerAddItem(cid,2326,1)
                setPlayerStorageValue(cid,quest_id,1)
            end
        else
            doPlayerSendTextMessage(cid,22,"It is empty.")
        end
    end
return TRUE
end