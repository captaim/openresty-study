local function print_table(t)
	local function parse_array(key,tab)
		local str = ''

		for _,v in pairs(tab) do
			str = str .. key .. ' ' .. v .. '\r\n'
		end
		return str
	end

	local str = ''
	for k,v in pairs(t) do
		if type(v) == "table" then
			str = str .. parse_array(k,v)
		else
			str = str .. k .. ' ' .. (v) .. '\r\n'
		end
	end
	return str
end

ngx.header.Foo = 'Bar'

--无关大小写,当然，在nginx的location中使用lua_transform_underscores_in_response_headers命令可以不区分大小写
ngx.header['Foo2'] = 'Bar2'
ngx.header['foo2'] = 'bar2'

--下划线会被转换成破折号
ngx.header['Foo2_Bar'] = 'Foo2_Bar';	--output:Foo2-Bar: Foo2_Bar

ngx.header['Foo_bar'] = {"a=32; path","b=25"}	--一次设置多次返回

ngx.header['Content-Type'] = {"a=32;path","text"}	--一些内置的变量，如content,只能接受table的最后一个值，例如本例子中的text

ngx.say(type(ngx.header))	--从本例子可以看出，ngx.header实际是一个table返回，ngx.header无法使用遍历的方式查看里面的元素


ngx.header.Foo = "Bar"

local resp = ngx.resp.get_headers(0,true)	--使用get_headers来达到遍历的效果

ngx.say(print_table(resp))

