local tab1 = os.date("*t") --返回一个i奥数当前日期和时间的表
local ans1 = "{"
for k, v in pairs(tab1) do --把tab1转换成一个字符串
	ans1 = string.format("%s %s = %s",ans1, k, tostring(v))
	-- print(k..'-'..tostring(v))

end

ans1 = ans1.."}"
print("tab1 = ",ans1)
--print(tab1)

local tab2 = os.date("*t",1471595266) --返回一个描述日期和时间差为1471595266秒的表
local ans2 = "{"
for k, v in pairs(tab2) do
	ans2 = string.format("%s %s = %s", ans2, k ,tostring(v))
end

ans2 = ans2 .."}"
print("tab2 = ",ans2)