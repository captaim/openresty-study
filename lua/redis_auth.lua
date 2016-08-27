local redis = require "resty.redis"
local red = redis:new()

local ok, err = red:connect("127.0.0.1",6379)
if not ok then
	ngx.say("failed to connect:", err)
	return 
end

local count
count, err = red:get_reused_times()		--获取链路的被调用的次数
ngx.say(count);
if 0 == count then
	-- ok, err = red:auth("password")
	-- if not ok then
	-- 	ngx.say("failed to auth:", err)
	-- 	return
	-- end
elseif err then
	ngx.say("failed to get reused times:", err)
end


ok, err = red:set("dog","an animal")
if not ok then
	ngx.say("failed to set dog:", err)
	return
end
ngx.say("set result:", ok)

local res, err = red:get("dog")
if not res then
	ngx.say("failed to get dog:", err)
	return
end

if res == ngx.null then
	ngx.say("dog not found")
	return
end

ngx.say("god:", res)

local ok, err = red:set_keepalive(10000,100)	--连接池大小为100，释放连接的时间是10000毫秒