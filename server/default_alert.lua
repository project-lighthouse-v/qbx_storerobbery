AddEventHandler('qbx_storerobbery:server:defaultAlert', function(src, camId)
    TriggerEvent('police:server:policeAlert', locale('alert.register'), camId, src)
end)
