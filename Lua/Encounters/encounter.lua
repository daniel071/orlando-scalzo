-- An animation demo with a rotating Sans head.

music = "stronger_than_you_8bit" --Always OGG. Extension is added automatically. Remove the first two lines for custom music.
encountertext = "Scalzo comfronts you about your poor peformance at drama" --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {"bullets"}
wavetimer = 10.0
arenasize = {155, 130}
autolinebreak = true

enemies = {
"sans"
}

enemypositions = {
{0, 0}
}

-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
possible_attacks = {"bullets"}

function EncounterStarting()
	Player.lv = 20
	Player.hp = 99
	Player.name = "CHARA"
	
	
	
    --Include the animation Lua file. It's important you do this in EncounterStarting, because you can't create sprites before the game's done loading.
    --Be careful that you use different variable names as you have here, because the encounter's will be overwritten otherwise!
    --You can also use that to your benefit if you want to share a bunch of variables with multiple encounters.
    require "Animations/sans_anim"
end

function Update()
    --By calling the AnimateSans() function on the animation Lua file, we can create some movement!
	AnimateSans()
end

function EnemyDialogueEnding()
    -- Good location to fill the 'nextwaves' table with the attacks you want to have simultaneously.
    -- This example line below takes a random attack from 'possible_attacks'.
	nextwaves = { possible_attacks[math.random(#possible_attacks)] }
end

function DefenseEnding() --This built-in function fires after the defense round ends.
    encountertext = RandomEncounterText() --This built-in function gets a random encounter text from a random enemy.
end

function HandleSpare()
	State("ENEMYDIALOGUE")
end

function HandleItem(ItemID)
    BattleDialog({"Selected item " .. ItemID .. "."})
end