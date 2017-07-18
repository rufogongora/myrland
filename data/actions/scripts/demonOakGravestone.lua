function onUse(cid, item, fromPosition, itemEx, toPosition)
local newPosition = {x=xxxx, y=xxxx, z=xxxx}
	if(item.itemid == 1406 and getPlayerStorageValue(cid, 8585) > 0) then
		doTeleportThing(cid, newPosition, TRUE)
		doSendMagicEffect(newPosition, CONST_ME_TELEPORT)
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		setPlayerStorageValue(cid, 8585, -1)
	end
return true
end