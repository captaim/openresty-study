local account = require("lua024")

local a = account:new()
a:deposit(100)

local b = account:new()
b:deposit(50)

print(a.balance)
print(b.balance)
