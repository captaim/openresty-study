ngx.req.set_header('Foo','Bar')

local res = ngx.location.capture('/sub_request_header')

if res.status == ngx.HTTP_OK then
	ngx.say(res.body)
else
	ngx.exit(res.status)
end


