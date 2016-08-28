local pub_sum_module = require "user.pub_sum_module"

ngx.say("1 + 3 = ",pub_sum_module.sum(1, 3))
ngx.say("22 + 3 = ",pub_sum_module.sum(22, 3))
ngx.say("18 + 3 = ",pub_sum_module.sum(18, 3))

