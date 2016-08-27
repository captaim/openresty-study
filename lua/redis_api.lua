local new_redis = require "user.new_redis"

local red = new_redis:new({timeout = 3000, port = 6379})

red:set("cur_time", ngx.time())
local res = red:get("cur_time")

ngx.say(res)