--[[script desenvolvido por -> ! Zangad00#3864 <- 
    para mais scripts acesse meu discord: discord.gg/KqT5sB28nu
    
    
colocar as duas cordenadas aqui dentro, a primeira em x,y,z e a sengunda x2,y2,z2]]
Zangad00 = {
    [1] = { ['x'] = 1395.46, ['y'] = 1141.86, ['z'] = 114.65, ['x2'] = 1396.48, ['y2'] = 1141.84, ['z2'] = 114.34 },
    [2] = { ['x'] = 1390.26, ['y'] = 1132.54, ['z'] = 114.34, ['x2'] = 1406.91, ['y2'] = 1127.92, ['z2'] = 114.34 },
}

teleport = true

Citizen.CreateThread(function()
    while true do
        ped = PlayerPedId()
        pedcds = GetEntityCoords(ped)
        for k,v in pairs(Zangad00) do 
            if Vdist(v.x, v.y, v.z, pedcds) <= 0.7 then
                teleport = true
                if teleport == true then 
                    if IsControlJustPressed(0, 38) then 
                        DoScreenFadeOut(1000)
                        SetEntityCoords(ped, v.x2, v.y2, v.z2)
                        DoScreenFadeIn(1000)
                    end
                end
            end
            if Vdist(v.x2, v.y2, v.z2, pedcds)  <= 0.7 then 
                teleport = false 
                if teleport == false then
                    if IsControlJustPressed(0, 38) then 
                        DoScreenFadeOut(1000)
                        SetEntityCoords(ped, v.x, v.y, v.z)
                        DoScreenFadeIn(1000)
                    end
                end
            end
        end
        Citizen.Wait(4)
    end
end)