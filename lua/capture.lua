

local res = ngx.location.capture('/sub_capture')

ngx.say(res.body)


