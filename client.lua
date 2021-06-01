local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
src = Tunnel.getInterface("zangad00_teleport")

Zangad00 = {
    [1] = { ['x'] = 1395.46, ['y'] = 1141.86, ['z'] = 114.65, ['x2'] = 1396.48, ['y2'] = 1141.84, ['z2'] = 114.34 },
}

teleport = true

Citizen.CreateThread(function()
    while true do
        ped = PlayerPedId()
        pedcds = GetEntityCoords(ped)
        for k,v in pairs(Zangad00) do 
            if Vdist(v.x, v.y, v.z, pedcds) <= 3.1 then
                DrawMarker(23,v.x, v.y, v.z-0.99, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.5, 232, 180, 72, 150, 0, 0, 0, 0)
                if Vdist(v.x, v.y, v.z, pedcds) <= 0.7 then
                    teleport = true
                    if teleport == true then 
                        if IsControlJustPressed(0, 38) and src.checkPermissao() then 
                            DoScreenFadeOut(1000)
                            SetEntityCoords(ped, v.x2, v.y2, v.z2)
                            DoScreenFadeIn(1000)
                        end
                    end
                end
            end
            if Vdist(v.x2, v.y2, v.z2, pedcds)  <= 3.1 then
                DrawMarker(23,v.x2, v.y2, v.z2-0.99, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.5, 232, 180, 72, 150, 0, 0, 0, 0)
                if Vdist(v.x2, v.y2, v.z2, pedcds)  <= 0.7 then
                    teleport = false 
                    if teleport == false then
                        if IsControlJustPressed(0, 38) and src.checkPermissao() then 
                            DoScreenFadeOut(1000)
                            SetEntityCoords(ped, v.x, v.y, v.z)
                            DoScreenFadeIn(1000)
                        end
                    end
                end
            end
        end
        Citizen.Wait(4)
    end
end)