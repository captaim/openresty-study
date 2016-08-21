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

--http请求头不区分大小写
--local headers = ngx.req.get_headers()

--http请求头区分大小写
local headers = ngx.req.get_headers(0，true)

ngx.say(print_table(headers))