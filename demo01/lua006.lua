s = "hello world from lua"
for w in string.gmatch(s,"%a+") do
	print(w)
end

t = {}
s = "from=world,to=lua"
for k, v in string.gmatch(s, "(%a+)=(%a+)") do  --匹配两个最长连续且只含字母的
    t[k] = v                                    --字符串，它们之间用等号连接
end
for k, v in pairs(t) do
print (k,v)
end



