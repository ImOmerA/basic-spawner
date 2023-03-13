local isfirstspawn = true
local spawnpoint = vector3(x, y,  z) -- config your spawnpoint here, use a vector3 point --
    exports.spawnmanager:setAutoSpawnCallback(function ()
        if isfirstspawn then
            exports.spawnmanager:spawnPlayer({
                x = spawnpoint.x,
                y = spawnpoint.y,
                z = spawnpoint.z
            })
            TriggerEvent('chat:addMessage', { -- you can remove this if you dont want / need it
                color = {math.random(0,255),math.random(0,255),math.random(0,255)},
                multiline = true,
                args = {"Hello user, its your first spawn!"}
            })
            isfirstspawn = false
        else
            local theped = GetEntityModel(PlayerPedId())
            exports.spawnmanager:spawnPlayer({
                x = spawnpoint.x,
                y = spawnpoint.y,
                z = spawnpoint.z,
                model = theped
            }, function()
                TriggerEvent('chat:addMessage', { -- you can remove this if you dont want / need it
                    color = {math.random(0,255),math.random(0,255),math.random(0,255)},
                    multiline = true,
                    args = {"Respawned"}
                })
            end)
        end
    end)
