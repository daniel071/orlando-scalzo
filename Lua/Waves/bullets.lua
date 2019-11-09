-- The bouncing bullets attack from the documentation example.
spawntimery = 0
spawntimerx = 0
bulletsx = {}
bulletsy = {}
colors = {"regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "regular", "green"}

function Update()
    spawntimery = spawntimery + 1
	spawntimerx = spawntimerx + 1
    if spawntimery%15 == 0 then
        local posx = math.random(-60, 60)
        local posy = Arena.height/2
		if (GetRealGlobal("scalzo-impressions") > 2) then
			local bulletType = colors[math.random(#colors)]
		else
			local bulletType = colors[1]
			DEBUG(colors[1])
		end
        local bullet = CreateProjectile('bullet', posx, posy)
		if bulletType == "green" then
            bullet.sprite.color = {64/255, 252/255, 64/255}
        end
		
		bullet.SetVar('color', bulletType)
		table.insert(bulletsx, bullet)
    end
	
	if spawntimerx%15 == 0 then
		local posy = math.random(-60, 60)
        local posx = Arena.width/2
		if (GetRealGlobal("scalzo-impressions") > 2) then
			local bulletType = colors[math.random(#colors)]
		else
			local bulletType = colors[1]
		end
		local bullet = CreateProjectile('bullet', posx, posy)
		if bulletType == "green" then
            bullet.sprite.color = {64/255, 252/255, 64/255}
        end
		
		bullet.SetVar('color', bulletType)
		table.insert(bulletsy, bullet)
	end
	
	
	for i=1,#bulletsy do
		local bullet = bulletsx[i]
		if bullet.isactive then
			bullet.move(0, -2.5)
		end
	end
	
	for i=1,#bulletsx do
		local bullet = bulletsy[i]
		if bullet.isactive then
			bullet.move(-2.5, 0)
		end
	end
	
end

function OnHit(bullet)
	local color = bullet.GetVar("color")
	if color == "regular" then
		DEBUG("Hurt")
		Player.Hurt(1, 0.025)
	elseif color == "green" then
		DEBUG("Heal")
		Player.Heal(math.random(1, 2))
        bullet.Remove()
	end
end