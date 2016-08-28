local pub_sum_module = require "user.pub_sum_module"

ngx.say("1 + 3 = ",pub_sum_module.sum(1, 3))
ngx.say("22 + 3 = ",pub_sum_module.sum(22, 3))
ngx.say("18 + 3 = ",pub_sum_module.sum(18, 3))

local pub_salary_module = require "user.pub_salary_module"

local account_a = pub_salary_module:new(10)
local account_b = pub_salary_module:new(10)

account_a:income(25)
account_a:outcome(20)
ngx.say("account [a] balance amount:", account_a:balance())

account_b:income(188)
account_b:outcome(3)
ngx.say("account [b] balance amount:", account_b:balance())