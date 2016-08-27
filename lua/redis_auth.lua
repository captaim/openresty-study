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

red:init_pipeline()
red:set("cat","Marry")
red:set("horse","Bob")
red:get("cat")
red:get("horse")
local results, err = red:commit_pipeline()
if not results then
	ngx.say("failed to commit the pipeline requests:", err)
	return
end

for i, res in pairs(results) do 
	if type(res) == "table" then
		if res[1] == false then
			ngx.say("failed to run command ", i, ":",res[2])
		else
			--process the table value
		end
	else
		-- process the scalar value
	end
end

--red:close()
local ok, err = red:set_keepalive(10000,100)	--连接池大小为100，释放连接的时间是10000毫秒