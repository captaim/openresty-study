local _M = {_VERSION = '0.0.1'}

local mt = {__index = _M}

function _M.new(self, base)
	base = base or 0
	return setmetatable  ({base = base},mt)
end

function _M.income(self, amount)
	self.base = self.base + amount
	return self.base
end

function _M.outcome(self, amount)
	if self.base < amount then
		return nil, "your balance is not enough for this payment"
	end

	self.base = self.base - amount
	return self.base
end

function _M.balance(self)
	return self.base
end

return _M