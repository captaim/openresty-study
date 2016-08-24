local shared = ngx.shared['ngx_cache']

local suc,err,forc

for index = 1 , 10000, 1 do
	suc,err,forc = shared:set(tostring(index),'value' .. tostring(index))
end

local keys = shared:get_keys()

ngx.say(#keys)