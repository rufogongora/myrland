function onStepIn(cid, item, position, fromPosition)
local blockingTreePosition = {x=xxxx, y=xxxx, z=xxxx}
local firstTree = doCreateItem(2709, 1, blockingTreePosition)
local secondTree = doCreateItem(2709, 1, blockingTreePosition)
	if(item.itemid == 103) then
		doSetItemActionId(firstTree, 7788)
		doSetItemActionId(secondTree, 7787)
	end
return true
end