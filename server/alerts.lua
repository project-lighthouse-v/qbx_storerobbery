local config = require 'config.server'

AddEventHandler('qbx_storerobbery:server:dispatchAlert', function(src, camId)
    if config.useExternalDispatch and config.dispatch == 'ps-dispatch' then
        if GetResourceState('ps-dispatch') == 'started' then
            TriggerClientEvent('qbx_storerobbery:client:dispatchAlert', src, camId)
            return
        end

        lib.print.warn('ps-dispatch is configured for qbx_storerobbery but is not started; using the default police alert')
    elseif config.useExternalDispatch and config.dispatch ~= 'ps-dispatch' then
        lib.print.warn(('unsupported qbx_storerobbery dispatch "%s"; using the default police alert'):format(tostring(config.dispatch)))
    end

    TriggerEvent('qbx_storerobbery:server:defaultAlert', src, camId)
end)
