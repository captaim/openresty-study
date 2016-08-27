local tab = require "table_logic"

local function format_table(t)
	local str = ''
	for k, _ in pairs(t) do
		str = str .. k .. '\r\n'
	end
	return str
end

ngx.say(format_table(tab))

