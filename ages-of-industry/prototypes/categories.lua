-- file: prototypes/categories.lua
local ages = require("prototypes.ages")

data:extend({
	-- Recipe categories for AoI's reskinned production buildings.
	{ type = "recipe-category", name = "aoi-farming" }, -- aoi-farm
	{ type = "recipe-category", name = "aoi-milling" }, -- aoi-mill (threshing/milling/baking)
	{ type = "recipe-category", name = "aoi-tanning" }, -- aoi-tannery
	{ type = "recipe-category", name = "aoi-smithing" }, -- aoi-smithy (alloying/minting)
	-- Ore smelting (e.g. tin) intentionally uses vanilla "smelting" so plain
	-- stone/steel furnaces work with it -- no custom category needed there.
})

-- One item-subgroup per age, purely for crafting-menu organization.
for _, age in ipairs(ages) do
	data:extend({
		{ type = "item-subgroup", name = "aoi-subgroup-" .. age.id, group = "intermediate-products", order = age.order },
	})
end
