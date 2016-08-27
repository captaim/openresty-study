local delay = 5
local handler
handler = function (premature)
	if premature then
		return
	end
	ngx.log(ngx.ERR,"init worker runing ... pid:", ngx.worker.pid())

	local ok, err = ngx.timer.at(delay,handler)
	if not ok then
		ngx.log(ngx.ERR, "failed to create the timer:", err)
		return
	end
end

if 0 == ngx.worker.id() then
	local ok, err = ngx.timer.at(delay, handler)
	if not ok then
		ngx.log(ngx.ERR, "failed to create the timer:", err)
		return
	end
end
