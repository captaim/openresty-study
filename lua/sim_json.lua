local json = require "cjson"

local function format_table(t)
	local str = ''
	for k,v in pairs(t) do
		str = str .. k .. '--' .. v .. '\r\n'
	end
	return str
end

--将json转换为字符串
local str_json = '{"key":"this is key","value":"this is value","num":1}'

local t = json.decode(str_json)

ngx.say(format_table(t))


--将lua table 转换为字符串

local t = {key='table key',value='table value',num=1}

local str_json = json.encode(t)

ngx.say(str_json)


-- 将lua talbe转换为json的数组

local t = {key={'list1','list2','list..'},num=1}

local str_json = json.encode(t)

ngx.say(str_json)


--json将lua的空talbe默认转换成json的空对象
local t = {}

local str_json = json.encode(t)

ngx.say(str_json)

--将空的lua talbe转换为一个空的数组
local t = {}

json.encode_empty_table_as_object(false)	--如果此选项为真的话，则将此转换为一个空的对象

local str_json = json.encode(t)

ngx.say(str_json)


--
local t = {1,2}

t[3] = 99	--此处t[1000]为会报错，lua对内存做了保护，可以通过 json.encode_sparse_array(true) 来解决

local str_json = json.encode(t)

ngx.say(str_json)











