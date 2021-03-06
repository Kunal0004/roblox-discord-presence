local util = {};
local DRPC = script:FindFirstAncestor("DRPC");

local Data = require(DRPC.src.dataHandler);

-- Get place (Used for name later)
local success, place = pcall(function()
	return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId);
end);

-- If offline, above fetch will have failed, remedy that by just getting the game.
util.place = success and place or game;

function util.getPlaceName()
	return util.place.Name;
end;

local lastEdit = tick();
local lastScript = game:GetService("StudioService").ActiveScript;
local lastLen = 0;
function util.hasChanges()
	local s = game:GetService("StudioService").ActiveScript;
	local changes = false;

	if s then
		local len = #s.Source:split("\n");
		
		if s ~= lastScript or lastLen ~= len then
			lastLen = len;
			lastScript = s;
			lastEdit = tick();
		end;
		
		changes = tick() - lastEdit > 180:

	end;
	
	return changes;
end;

return util;
