function onStepOut(moveitem, tileitem, position, cid)

local piedrapos = {x=682, y=1122, z=13, stackpos=1}
local piedraid = 1355
local piedra = getThingfromPos(piedrapos)

		if piedra.itemid == 0 then
				doCreateItem(piedraid,1,piedrapos)
				doSendMagicEffect(piedrapos,12)
			end
	return TRUE
end