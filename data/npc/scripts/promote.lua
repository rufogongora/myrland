local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
-- OTServ event handling functions end
   
	if(npcHandler.focus ~= cid) then
		return false
	end

        player_gold = getPlayerItemCount(cid,2148) 
        player_plat = getPlayerItemCount(cid,2152)*100 
        player_crys = getPlayerItemCount(cid,2160)*10000 
        player_money = player_gold + player_plat + player_crys 

		if msgcontains(msg, 'promotion') or msgcontains(msg, 'promote') then
 			if getPlayerVocation(cid) > 4 then
 				selfSay('Sorry, you are already promoted.')
 				talk_state = 0
			elseif not isPremium(cid) then
				selfSay('Sorry, you must be premium to buy promotion.')
				talk_state = 0
			else
				selfSay('Do you want to buy promotion for 20k?')
				talk_state = 1
			end

		elseif talk_state == 1 then
			if msgcontains(msg, 'yes') then
			if player_money >= 20000 then 
				if doPlayerRemoveMoney(cid,20000) then
					doPlayerSetVocation(cid, getPlayerVocation(cid)+4)
					selfSay('You are now promoted!')
				else
					selfSay('Sorry, you do not have enough money.')
				end
 			end
			talk_state = 0

	if msgcontains(msg, 'premium') then
		selfSay('Do you want to buy 70 days of premium for 10k?')
		talk_state = 2
		
	elseif talk_state == 2 then
		if msgcontains(msg, 'yes') then
			if player_money >= 10000 then
				if doPlayerRemoveMoney(cid,10000) then
				doPlayerAddPremiumDays(cid, 70)
				selfSay('You have 70 days of premium more!')
			else
				selfSay('Sorry, you do not have enough money.')
			end
 		end
		talk_state = 0
	end
	return true
	
end	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())