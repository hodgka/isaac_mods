local mod = RegisterMod("Mysterious Coin", 2);

local itemMysteryCoin = Isaac.GetItemIdByName("Mysterious Coin");
local itemTestButton = Isaac.GetItemIdByName("Testing Button");

local debuggingItem = itemMysteryCoin;

function use_test_item()
	local player = Isaac.GetPlayer(0);
	local pos = Isaac.GetFreeNearPosition(player.Position, 1);

	Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, debuggingItem, pos, pos, player);
end

function use_coin()
	local player = Isaac.GetPlayer(0);
	local num = Random()

	local num_coins = player:GetNumCoins()

	if num_coins == 0 then
		player:AddCoins(2)
	elseif num % 31 == 0 then
		player:AddCoins(99)
	elseif num % 4 == 0 then
		if num_coins < 5 then
			player:AddCoins(num_coins*4)
		else
			player:AddCoins(num_coins*2)
		end
	else
		player:AddCoins(-num_coins//2)
	end
end

mod:AddCallback(ModCallbacks.MC_USE_ITEM, use_test_item, itemTestButton);
mod:AddCallback(ModCallbacks.MC_USE_ITEM, use_coin, itemMysteryCoin);
