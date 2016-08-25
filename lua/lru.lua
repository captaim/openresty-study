local shared = ngx.shared['ngx_cache']

local suc,err,forc

for index = 1 , 10000, 1 do
	suc,err,forc = shared:set(tostring(index),string.rep('a',1))
end

local keys = shared:get_keys(0)	--此处可以选择设置 『0』，选择读取最大的设置

ngx.say(#keys)	--总长度为8095

local value, flag = shared:get('1')	--此处我们会发现，当key=10000的时候，是存在值的，但是当key=1的时候，是没有值的，后进来的key(10000)会把之前的key剔除出去（因为总长度是8095）

ngx.say(value)