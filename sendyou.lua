_addon.name = 'sendyou'
_addon.version = '1.0'
_addon.author = 'yyoshisaur'
_addon.command = 'sy'

config = require('config')
logger = require('logger')

function sy_load()
    defaults = {
        you = {
            ['src_name'] = 'dst_name',
        },
    }
    settings = config.load(defaults)
end

function sy_command(...)
    local args = {...}
    local my_name = windower.ffxi.get_player().name:lower()
    local your_name = settings.you[my_name]
    
    if args[1] == 'set' then
        if args[2] then
            your_name = args[2]:lower()
        else
            error('Not found destination name.')
            return
        end
        settings.you[my_name] = your_name
        settings:save('all')
        log('set src name: '..my_name..' dst name: '..your_name)
        return
    end

    if your_name == nil then
        error('Not found destination name.')
        return
    elseif #args == 0 then
        error('Not found command for sending.') 
        return
    end

    local command = nil
    for i, v in ipairs(args) do
        if command then
            command = command..v..' '
        else
            command = v..' '
        end
    end
    windower.add_to_chat(123, command)

    local send = 'input //send '..your_name..' '..command
    -- windower.add_to_chat(123, send)
    windower.send_command(send)
end

windower.register_event('load', sy_load)
windower.register_event('addon command', sy_command)