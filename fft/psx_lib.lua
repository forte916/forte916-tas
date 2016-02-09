-- Common libraries of PSX BIOS and emulator.
-- Emulater: psxjin v2.0.2
--
-- Usage
--   + require "psx_lib"
--

require "bit"

------------------------------------------------------------
-- BIOS functions
------------------------------------------------------------

adr_rng = 0x9010 -- RNG seed, 4byte

-- pure 32-bit multiplier
function mul32(a, b)
        -- separate the value into two 8-bit values to prevent type casting
        local x, y, z = {}, {}, {}
        x[1] = bit.band(a, 0xff)
        x[2] = bit.band(bit.rshift(a, 8), 0xff)
        x[3] = bit.band(bit.rshift(a, 16), 0xff)
        x[4] = bit.band(bit.rshift(a, 24), 0xff)
        y[1] = bit.band(b, 0xff)
        y[2] = bit.band(bit.rshift(b, 8), 0xff)
        y[3] = bit.band(bit.rshift(b, 16), 0xff)
        y[4] = bit.band(bit.rshift(b, 24), 0xff)
        -- calculate for each bytes
        local v, c
        v = x[1] * y[1]
        z[1], c = bit.band(v, 0xff), bit.rshift(v, 8)
        v = c + x[2] * y[1] + x[1] * y[2]
        z[2], c = bit.band(v, 0xff), bit.rshift(v, 8)
        v = c + x[3] * y[1] + x[2] * y[2] + x[1] * y[3]
        z[3], c = bit.band(v, 0xff), bit.rshift(v, 8)
        v = c + x[4] * y[1] + x[3] * y[2] + x[2] * y[3] + x[1] * y[4]
        z[4], c = bit.band(v, 0xff), bit.rshift(v, 8)
        v = c + x[4] * y[2] + x[3] * y[3] + x[2] * y[4]
        z[5], c = bit.band(v, 0xff), bit.rshift(v, 8)
        v = c + x[4] * y[3] + x[3] * y[4]
        z[6], c = bit.band(v, 0xff), bit.rshift(v, 8)
        v = c + x[4] * y[4]
        z[7], z[8] = bit.band(v, 0xff), bit.rshift(v, 8)
        -- compose them and return it
        return bit.bor(z[1], bit.lshift(z[2], 8), bit.lshift(z[3], 16), bit.lshift(z[4], 24)),
               bit.bor(z[5], bit.lshift(z[6], 8), bit.lshift(z[7], 16), bit.lshift(z[8], 24))
end

-- A(2Fh) - rand()
--   Advances the random generator as "x=x*41C64E6Dh+3039h" (aka plus 12345 decimal), 
--   and returns a 15bit random value "R2=(x/10000h) AND 7FFFh".
--
--   1103515245 == 0x41C64E6D
--   12345 == 0x3039
function rand(seed)
	seed = seed or memory.readdword(adr_rng)
	local random

	local next_seed = mul32(seed, 1103515245) + 12345
	random = bit.rshift(next_seed, 16)   -- same as x >>= 16
	random = bit.band(random, 0x7FFF)  -- same as x & 0x7FFF
	return random
end

function next_rng(seed)
	local next_seed = mul32(seed, 1103515245) + 12345
	return next_seed
end


------------------------------------------------------------
-- Joypad utility
------------------------------------------------------------

function fadv(n)
	n = n or 1
	for i=1, n do
		emu.frameadvance()
	end
end

function pressBtnPort(port, buttons, fcount)
	joypad.set(port, buttons)
	fadv(fcount)
end

function pressBtn(buttons, fcount)
	pressBtnPort(1, buttons, fcount)
end

function holdBtnPort(port, buttons, fcount)
	local n = fcount or 1
	for i=1, n do
		joypad.set(port, buttons)
		emu.frameadvance()
	end
end

function holdBtn(buttons, fcount)
	holdBtnPort(1, buttons, fcount)
end


------------------------------------------------------------
-- Common functions
------------------------------------------------------------

function debugPrint(str)
	if f == nil then
		print(str)
	else
		f:write(str.."\n")
	end
end

function shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

