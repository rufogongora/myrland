function onUse(cid, item, fromPosition, itemEx, toPosition)
local blockingTreePosition = {x=xxxx, y=xxxx, z=xxxx, stackpos=1}
local firstMonsterSpawn = {x=xxxx, y=xxxx, z=xxxx}
local secondMonsterSpawn = {x=xxxx, y=xxxx, z=xxxx}
local thirdMonsterSpawn = {x=xxxx, y=xxxx, z=xxxx}
local fourthMonsterSpawn = {x=xxxx, y=xxxx, z=xxxx}
local blockingTree = getThingfromPos(blockingTreePosition).uid
local randomizer = math.random(1,6)
local firstQuestStatus = getPlayerStorageValue(cid, 8181)
local secondQuestStatus = getPlayerStorageValue(cid, 8282)
local thirdQuestStatus = getPlayerStorageValue(cid, 8383)
local fourthQuestStatus = getPlayerStorageValue(cid, 8484)
	if(itemEx.itemid == 2709 and itemEx.actionid == 7787 and getPlayerLevel(cid) >= 120) then
		doRemoveItem(blockingTree)
		doTeleportThing(cid, toPosition, TRUE)
		setPlayerStorageValue(cid, 8181, 1)
	else
	doSendMagicEffect(toPosition, CONST_ME_POFF)
	return true
end
	if(itemEx.itemid == 2709 and itemEx.actionid == 7788) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Another player is already doing this quest.")
	return true
end
	if(itemEx.itemid == 8289 and itemEx.actionid == 8181 and randomizer == 1 and firstQuestStatus == 1) then
		doSummonCreature("Crypt Shambler", firstMonsterSpawn)
		doSummonCreature("Crypt Shambler", secondMonsterSpawn)
		doSummonCreature("Crypt Shambler", thirdMonsterSpawn)
		doSummonCreature("Crypt Shambler", fourthMonsterSpawn)
	elseif(itemEx.itemid == 8289 and itemEx.actionid == 8181 and randomizer == 2 and firstQuestStatus == 1) then
		doSummonCreature("Bone Beast", firstMonsterSpawn)
		doSummonCreature("Bone Beast", secondMonsterSpawn)
		doSummonCreature("Bone Beast", thirdMonsterSpawn)
		doSummonCreature("Bone Beast", fourthMonsterSpawn)
	elseif(itemEx.itemid == 8289 and itemEx.actionid == 8181 and randomizer == 3 and firstQuestStatus == 1) then
		doSummonCreature("Betrayed Wraith", firstMonsterSpawn)
		doSummonCreature("Lost Soul", secondMonsterSpawn)
		setPlayerStorageValue(cid, 8181, -1)
		setPlayerStorageValue(cid, 8282, 1)
	elseif(itemEx.itemid == 8289 and itemEx.actionid == 8181 and randomizer >= 4 and firstQuestStatus == 1) then
		doSendMagicEffect(fromPosition, 45)
		doCreatureAddHealth(cid, -300)
		doSendAnimatedText(fromPosition, '300', TEXTCOLOR_LIGHTGREEN)
	end
	if(itemEx.itemid == 8289 and itemEx.actionid == 8181 and firstQuestStatus < 1) then
		doSendMagicEffect(toPosition, CONST_ME_POFF)
	return true
end
	if(itemEx.itemid == 8288 and itemEx.actionid == 8282 and randomizer == 1 and secondQuestStatus == 1) then
		doSummonCreature("Crypt Shambler", firstMonsterSpawn)
		doSummonCreature("Mummy", secondMonsterSpawn)
		doSummonCreature("Mummy", thirdMonsterSpawn)
		doSummonCreature("Crypt Shambler", fourthMonsterSpawn)
	elseif(itemEx.itemid == 8288 and itemEx.actionid == 8282 and randomizer == 2 and secondQuestStatus == 1) then
		doSummonCreature("Giant Spider", firstMonsterSpawn)
		doSummonCreature("Giant Spider", fourthMonsterSpawn)
	elseif(itemEx.itemid == 8288 and itemEx.actionid == 8282 and randomizer == 3 and secondQuestStatus == 1) then
		doSummonCreature("Blightwalker", firstMonsterSpawn)
		doSummonCreature("Lost Soul", secondMonsterSpawn)
		setPlayerStorageValue(cid, 8282, -1)
		setPlayerStorageValue(cid, 8383, 1)
	elseif(itemEx.itemid == 8288 and itemEx.actionid == 8282 and randomizer >= 4 and secondQuestStatus == 1) then
		doSendMagicEffect(fromPosition, 45)
		doCreatureAddHealth(cid, -300)
		doSendAnimatedText(fromPosition, '300', TEXTCOLOR_LIGHTGREEN)
	end
	if(itemEx.itemid == 8288 and itemEx.actionid == 8282 and secondQuestStatus < 1) then
		doSendMagicEffect(toPosition, CONST_ME_POFF)
	return true
end
	if(itemEx.itemid == 8290 and itemEx.actionid == 8383 and randomizer == 1 and thirdQuestStatus == 1) then
		doSummonCreature("Crypt Shambler", firstMonsterSpawn)
		doSummonCreature("Crypt Shambler", secondMonsterSpawn)
		doSummonCreature("Crypt Shambler", thirdMonsterSpawn)
		doSummonCreature("Crypt Shambler", fourthMonsterSpawn)
	elseif(itemEx.itemid == 8290 and itemEx.actionid == 8383 and randomizer == 2 and thirdQuestStatus == 1) then
		doSummonCreature("Lich", firstMonsterSpawn)
		doSummonCreature("Lich", secondMonsterSpawn)
		doSummonCreature("Lich", thirdMonsterSpawn)
		doSummonCreature("Lich", fourthMonsterSpawn)
	elseif(itemEx.itemid == 8290 and itemEx.actionid == 8383 and randomizer == 3 and thirdQuestStatus == 1) then
		doSummonCreature("Plaguesmith", firstMonsterSpawn)
		doSummonCreature("Plaguesmith", secondMonsterSpawn)
		setPlayerStorageValue(cid, 8383, -1)
		setPlayerStorageValue(cid, 8484, 1)
	elseif(itemEx.itemid == 8290 and itemEx.actionid == 8383 and randomizer >= 4 and thirdQuestStatus == 1) then
		doSendMagicEffect(fromPosition, 45)
		doCreatureAddHealth(cid, -300)
		doSendAnimatedText(fromPosition, '300', TEXTCOLOR_LIGHTGREEN)
	end
	if(itemEx.itemid == 8290 and itemEx.actionid == 8383 and thirdQuestStatus < 1) then
		doSendMagicEffect(toPosition, CONST_ME_POFF)
	return true
end
	if(itemEx.itemid == 8291 and itemEx.actionid == 8484 and randomizer == 1 and fourthQuestStatus == 1) then
		doSummonCreature("Nightmare", firstMonsterSpawn)
		doSummonCreature("Mummy", secondMonsterSpawn)
		doSummonCreature("Mummy", thirdMonsterSpawn)
		doSummonCreature("Nightmare", fourthMonsterSpawn)
	elseif(itemEx.itemid == 8291 and itemEx.actionid == 8484 and randomizer == 2 and fourthQuestStatus == 1) then
		doSummonCreature("Giant spider", firstMonsterSpawn)
		doSummonCreature("Undead Dragon", secondMonsterSpawn)
		doSummonCreature("Giant Spider", secondMonsterSpawn)
		doSummonCreature("Giant Spider", thirdMonsterSpawn)
	elseif(itemEx.itemid == 8291 and itemEx.actionid == 8484 and randomizer == 3 and fourthQuestStatus == 1) then
		doSummonCreature("Demon", firstMonsterSpawn)
		doSummonCreature("Juggernaut", secondMonsterSpawn)
		setPlayerStorageValue(cid, 8484, -1)
		setPlayerStorageValue(cid, 8585, 1)
	elseif(itemEx.itemid == 8291 and itemEx.actionid == 8484 and randomizer >= 4 and fourthQuestStatus == 1) then
		doSendMagicEffect(fromPosition, 45)
		doCreatureAddHealth(cid, -300)
		doSendAnimatedText(fromPosition, '300', TEXTCOLOR_LIGHTGREEN)
	end
	if(itemEx.itemid == 8291 and itemEx.actionid == 8484 and fourthQuestStatus < 1) then
		doSendMagicEffect(toPosition, CONST_ME_POFF)
	return true
	end
return true
end 