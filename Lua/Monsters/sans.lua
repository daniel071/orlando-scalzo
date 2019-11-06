comments = {"You remember Scalzo teaches Italian \nIt fills you with dread", "Scalzo looks at you intensly", "Scalzo is making a dramatic play"}
commands = {"Discuss drama", "Insult drama", "Make a play"}
randomdialogue = {"[font:sans]I've been \nwatching you", "[font:sans]You shouldn't \nhave done this"}
impresseddialogue = {"[font:sans]Good", "[font:sans]Nice", "[font:sans]*happy scalzo noises*", "[font:sans]I am impressed"}

sprite = "empty" --Always PNG. Extension is added automatically.
name = "Scalzo"
hp = 10000
atk = 1
def = -5
check = "Glorius drama teacher, Orlando Scalzo"
dialogbubble = "rightwideminus" -- See documentation for what bubbles you have available.
cancheck = true
canspare = false
xp = 1000
gold = 40000

-- Happens after the slash animation but before the animation.
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
    else
        -- player did actually attack
    end
end
 
-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "Discuss drama" then
        currentdialogue = {"Selected\nAct 1."}
    elseif command == "Insult drama" then
        currentdialogue = {"Selected\nAct 2."}
    elseif command == "Make a play" then
        currentdialogue = {"Selected\nAct 3."}

    end
	
	if currentdialogue == {"Selected\nAct 1."} or currentdialogue == {"Selected\nAct 3."} then
		SetRealGlobal("scalzo-impressions", (GetRealGlobal("scalzo-impressions") + 1))
	elseif currentdialogue == {"Selected\nAct 2."} then
		SetRealGlobal("scalzo-impressions", (GetRealGlobal("scalzo-impressions") - 1))
	end
	
	if GetRealGlobal("scalzo-can-spare") == true then
		canspare = true
	end
    currentdialogue = {"[font:sans]" .. impresseddialogue[math.random(#impresseddialogue)] .. ""}
    BattleDialog({"You selected " .. command .. "."})
end