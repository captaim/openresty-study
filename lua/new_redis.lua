local redis = require "resty.redis"

local _M = {}
_M._VERSION = '0.10'

local mt = { __index = _M}

function _M.new(self,opt )
	local ip		= opt.ip		or "127.0.0.1"
	local port		= opt.port		or 6379
	local timeout	= opt.timeout	or 1000
	local idletime  = opt.idletime	or 10000
	local poolsize	= opt.poolsize	or 100

	return setmetatable({
		ip			= ip,
		port		= port,
		timeout 	= timeout,
		idletime 	= idletime,
		poolsize	= poolsize
		},mt)
end

local function _connect( self )
	local red = redis:new()
	red:set_timeout(self.timeout)

	local ok, err = red:connect(self.ip, self.port)
	if not ok then
		return nil, err
	end

	return red, nil
end

local function _set_keepalive(self, red)
	red:set_keepalive(self.idletime, self.poolsize)
end

function _M.get(self, key)
	local red, err = _connect(self)
	if err then
		return nil, err
	end

	local res,err = red:get(key)
	if nil == err then
		_set_keepalive(self, red)
	end

	return res, err
end

function _M.set(self, key, value)
	local red, err = _connect(self)
	if err then
		return nil, err
	end

	local res,err = red:set(key, value)
	if nil == err then
		_set_keepalive(self, red)
	end

	return res, err
end

function _M.cmd(self, command, ...)
	local red, err = _connect(self)
	if err then
		return nil, err
	end

	local cmd_fun = red[command]
	local res, err = cmd_fun(red, ...)
	if nil == err then
		_set_keepalive(self, red)
	end
	return res, err
end


return _M












