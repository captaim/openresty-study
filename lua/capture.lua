ngx.req.read_body()

local data = ngx.req.get_body_data()

local res = ngx.location.capture('/sub_capture')

ngx.say(res.body)

ngx.say(data)

