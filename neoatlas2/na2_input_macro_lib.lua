-- ROM: Neo ATLAS 2 (J) [SLPS-02238]
-- Emulator: psxjin v2.0.2
--
-- This is a key inputs for speed run.
--
-- Usage
--   1. Call these functions
--

require "psx_lib"

------------------------------------------------------------
-- key macros
------------------------------------------------------------
TAS = {}

function TAS.start()
	fadv(1075)
	-- 1075f
	pressBtn({start=1}, 1)  -- skip artdink

	fadv(14)
	-- 1090f
	pressBtn({start=1}, 1)  -- skip flipflop

	fadv(68)
	-- 1158f
	pressBtn({x=1}, 1)  -- skip title logo
end

function TAS.changeOption()
	-- 1159f
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)  -- option

	fadv(36)
	-- 1197f
	pressBtn({up=1}, 2)
	pressBtn({up=1}, 1)
	pressBtn({circle=1}, 1)  -- change window as fast
	fadv(1)
	pressBtn({x=1}, 1)  -- cancel
	pressBtn({down=1}, 1)
end

function TAS.newGame()
	pressBtn({circle=1}, 1)  -- new game
end

function TAS.tradeWithTreasure()
	pressBtn({circle=1}, 1)  -- select city
	-- text skip here

	fadv(31)
	pressBtn({x=1}, 1)  -- cancel reward increasing
	fadv(5)
	pressBtn({circle=1}, 1)  -- select product
	fadv(5)
	pressBtn({circle=1}, 1)  -- new trade
	fadv(10+4)
	pressBtn({right=1}, 1)  -- 
	fadv(4)
	pressBtn({up=1}, 1)  -- 
	fadv(3)
	pressBtn({circle=1}, 1)  -- select ship
	fadv(7+2)
	pressBtn({circle=1}, 1)  -- decide

	fadv(29)  -- 0xFFBB in 0x0000E2D8
	-- move cursor
	--pressBtn({triangle=1, up=1, right=1}, 1)  -- move cursor

	pressBtn({circle=1}, 1)  -- select product
	--fadv(x)
	pressBtn({circle=1}, 1)  -- decide
	--fadv(x)
	pressBtn({circle=1}, 1)  -- yes
end

function TAS.clickTreasure()
	pressBtn({circle=1}, 1)  -- select treasure
	-- text skip here
	--fadv(53+2)
	fadv(31)
	pressBtn({x=1}, 1)  -- cancel reward increasing
	fadv(5)
	pressBtn({x=1}, 1)  -- close
	fadv(18)  -- 5f before circle shown
	-- accepting for pad input
end

function TAS.equipAndVoyage()
	pressBtn({r1=1}, 2)      -- show admiral window
	pressBtn({right=1}, 3)
	pressBtn({right=1}, 2)
	pressBtn({right=1}, 1)
	pressBtn({circle=1}, 1)  -- select item
	fadv(35)
	pressBtn({square=1}, 1)
	fadv(23)
	pressBtn({square=1}, 1)
	fadv(20)
	pressBtn({square=1}, 1)
	fadv(21)
	pressBtn({x=1}, 1)  -- close
	fadv(24)
	pressBtn({left=1}, 3)
	pressBtn({left=1}, 2)
	pressBtn({left=1}, 1)
	pressBtn({circle=1}, 1)  -- select voyage
	fadv(43)
	pressBtn({triangle=1, down=1}, 7)  -- move cursor
	fadv(2)
	pressBtn({circle=1}, 1)  -- point
	fadv(2)
	pressBtn({square=1}, 1)  -- show window
	fadv(1)
	pressBtn({circle=1}, 1)  -- finish course setting

	-- text
	fadv(38)
	pressBtn({circle=1}, 1)  -- confirm
end


function TAS.zoomOut()
	pressBtn({r2=1}, 1)  -- zoom out
	fadv(32+1)
	-- sometimes, 0x02E1 in 0x0000E2D8
	-- accepting for cursor movement
	fadv(2)
	-- accepting for zoom
end

function TAS.zoomIn()
	pressBtn({l2=1}, 1)  -- zoom in
	fadv(32+1)
	-- sometimes, 0x02E1 in 0x0000E2D8
	-- accepting for cursor movement
	fadv(2)
	-- accepting for zoom
end

