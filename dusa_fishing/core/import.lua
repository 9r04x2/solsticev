if config.framework ~= 'auto' then return end 

if GetResourceState('qb-core'):find('start') then
    config.framework = 'qb'
elseif GetResourceState('es_extended'):find('start') then
    config.framework = 'esx'
end