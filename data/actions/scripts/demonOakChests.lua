function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 50090) > 0) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
	return true
	else
	if(item.uid == 12901) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found demon legs.")
		doPlayerAddItem(cid, 2495, 1)
	elseif(item.uid == 12902) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a rainbow shield.")
		doPlayerAddItem(cid, 8905, 1)
	elseif(item.uid == 12903) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a royal crossbow.")
		doPlayerAddItem(cid, 8851, 1)
	elseif(item.uid == 12904) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a spellbook of dark mysteries.")
		doPlayerAddItem(cid, 8918, 1)
	end
		setPlayerStorageValue(cid, 50090, 1)
	end
return true
end