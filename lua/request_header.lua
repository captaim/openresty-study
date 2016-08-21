ngx.req.set_header('Foo',{'Bar1','Bar2'})

ngx.req.set_header('Foo1','Bar2')

ngx.req.set_header('user-agent',{})

local res = ngx.location.capture('/sub_request_header')

if res.status == ngx.HTTP_OK then
	ngx.say(res.body)
else
	ngx.exit(res.status) 
end


