-- file: prototypes/recipes.lua
-- All new recipes start `enabled = false` (gated behind an aoi-tech-* age
-- technology) unless noted, except the handful needed to bootstrap the
-- Stone Age before any research has happened.

local function item(name, amount)
	return { type = "item", name = name, amount = amount }
end

local function fluid(name, amount)
	return { type = "fluid", name = name, amount = amount }
end

data:extend({
	-- Stone Age (bootstrap recipes are enabled = true; the rest unlock via
	-- aoi-tech-stone-masonry)
	{
		type = "recipe",
		name = "aoi-flint",
		enabled = true,
		energy_required = 1,
		ingredients = { item("stone", 1) },
		results = { item("aoi-flint", 2) },
	},
	{
		type = "recipe",
		name = "aoi-flint-tools",
		enabled = false,
		energy_required = 2,
		ingredients = { item("aoi-flint", 2), item("wood", 1) },
		results = { item("aoi-flint-tools", 1) },
	},
	{
		type = "recipe",
		name = "aoi-writings",
		enabled = true,
		energy_required = 3,
		ingredients = { item("wood", 2) },
		results = { item("aoi-writings", 1) },
		-- TODO(deepen): replace with the readme's full chain --
		-- Wood -> Planks + Sawdust -> Pulp -> Paper -> Books -- once
		-- Forestry/Paper is built out. This stub keeps early research
		-- reachable without that dependency chain existing yet.
	},
	{
		type = "recipe",
		name = "aoi-school",
		enabled = true,
		energy_required = 5,
		ingredients = { item("stone", 20), item("wood", 10) },
		results = { item("aoi-school", 1) },
	},
	{
		type = "recipe",
		name = "aoi-housing-hut",
		enabled = true,
		energy_required = 5,
		ingredients = { item("wood", 20), item("stone", 10) },
		results = { item("aoi-housing-hut", 1) },
	},
	{
		type = "recipe",
		name = "aoi-monument-stone",
		enabled = false,
		energy_required = 10,
		ingredients = { item("stone", 50), item("wood", 20) },
		results = { item("aoi-monument-stone", 1) },
	},

	-- Agricultural Age (unlocked by aoi-tech-agriculture)
	{
		type = "recipe",
		name = "aoi-wheat",
		enabled = false,
		category = "aoi-farming",
		energy_required = 5,
		ingredients = { fluid("aoi-fresh-water", 10) },
		results = { item("aoi-wheat", 4) },
	},
	{
		type = "recipe",
		name = "aoi-thresh-wheat",
		enabled = false,
		category = "aoi-milling",
		energy_required = 2,
		ingredients = { item("aoi-wheat", 1) },
		results = { item("aoi-grain", 1), item("aoi-straw", 1) },
	},
	{
		type = "recipe",
		name = "aoi-flour",
		enabled = false,
		category = "aoi-milling",
		energy_required = 2,
		ingredients = { item("aoi-grain", 2) },
		results = { item("aoi-flour", 1) },
	},
	{
		type = "recipe",
		name = "aoi-bread",
		enabled = false,
		category = "aoi-milling",
		energy_required = 3,
		ingredients = { item("aoi-flour", 2), fluid("aoi-fresh-water", 5) },
		results = { item("aoi-bread", 1) },
	},
	{
		type = "recipe",
		name = "aoi-wool",
		enabled = false,
		energy_required = 3,
		ingredients = { item("aoi-straw", 5) },
		results = { item("aoi-wool", 1) },
		-- TODO(deepen): replace with real Livestock (sheep pasture) once
		-- Husbandry entities exist; this is a placeholder gather-recipe.
	},
	{
		type = "recipe",
		name = "aoi-hide",
		enabled = false,
		energy_required = 3,
		ingredients = { item("aoi-straw", 5) },
		results = { item("aoi-hide", 1) },
		-- TODO(deepen): replace with real Livestock (cattle pasture) once
		-- Husbandry entities exist; this is a placeholder gather-recipe.
	},
	{
		type = "recipe",
		name = "aoi-leather",
		enabled = false,
		category = "aoi-tanning",
		energy_required = 4,
		ingredients = { item("aoi-hide", 2) },
		results = { item("aoi-leather", 1) },
	},
	{
		type = "recipe",
		name = "aoi-farm",
		enabled = false,
		energy_required = 5,
		ingredients = { item("wood", 20), item("stone", 10) },
		results = { item("aoi-farm", 1) },
	},
	{
		type = "recipe",
		name = "aoi-mill",
		enabled = false,
		energy_required = 5,
		ingredients = { item("wood", 20), item("stone", 15) },
		results = { item("aoi-mill", 1) },
	},
	{
		type = "recipe",
		name = "aoi-tannery",
		enabled = false,
		energy_required = 5,
		ingredients = { item("wood", 20), item("stone", 15) },
		results = { item("aoi-tannery", 1) },
	},
	{
		type = "recipe",
		name = "aoi-monument-agricultural",
		enabled = false,
		energy_required = 10,
		ingredients = { item("stone", 80), item("wood", 40), item("aoi-bread", 10) },
		results = { item("aoi-monument-agricultural", 1) },
	},

	-- Bronze Age (unlocked by aoi-tech-bronze-metallurgy)
	{
		type = "recipe",
		name = "aoi-tin-ore",
		enabled = false,
		energy_required = 2,
		ingredients = { item("stone", 5) },
		results = { item("aoi-tin-ore", 1) },
		-- TODO(deepen): replace with a real mineable tin resource entity
		-- (autoplace) once one is defined; this is a placeholder recipe.
	},
	{
		type = "recipe",
		name = "aoi-tin-plate",
		enabled = false,
		category = "smelting",
		energy_required = 3.2,
		ingredients = { item("aoi-tin-ore", 1) },
		results = { item("aoi-tin-plate", 1) },
	},
	{
		type = "recipe",
		name = "aoi-bronze-plate",
		enabled = false,
		category = "aoi-smithing",
		energy_required = 4,
		ingredients = { item("copper-plate", 1), item("aoi-tin-plate", 1) },
		results = { item("aoi-bronze-plate", 2) },
	},
	{
		type = "recipe",
		name = "aoi-currency",
		enabled = false,
		category = "aoi-smithing",
		energy_required = 3,
		ingredients = { item("aoi-bronze-plate", 2) },
		results = { item("aoi-currency", 5) },
	},
	{
		type = "recipe",
		name = "aoi-smithy",
		enabled = false,
		energy_required = 5,
		ingredients = { item("wood", 10), item("stone", 30), item("copper-plate", 10) },
		results = { item("aoi-smithy", 1) },
	},
	{
		type = "recipe",
		name = "aoi-monument-bronze",
		enabled = false,
		energy_required = 10,
		ingredients = { item("stone", 100), item("aoi-bronze-plate", 50) },
		results = { item("aoi-monument-bronze", 1) },
	},

	-- Iron Age (unlocked by aoi-tech-iron-age) -- no new materials, monument only
	{
		type = "recipe",
		name = "aoi-monument-iron",
		enabled = false,
		energy_required = 10,
		ingredients = { item("stone", 150), item("steel-plate", 50) },
		results = { item("aoi-monument-iron", 1) },
	},

	-- Industrial Age (unlocked by aoi-tech-industrial-age) -- monument only
	{
		type = "recipe",
		name = "aoi-monument-industrial",
		enabled = false,
		energy_required = 15,
		ingredients = { item("steel-plate", 100), item("iron-plate", 100), item("stone", 100) },
		results = { item("aoi-monument-industrial", 1) },
	},

	-- Information Age (unlocked by aoi-tech-information-age) -- monument only
	{
		type = "recipe",
		name = "aoi-monument-information",
		enabled = false,
		energy_required = 20,
		ingredients = { item("electronic-circuit", 100), item("advanced-circuit", 50), item("steel-plate", 100) },
		results = { item("aoi-monument-information", 1) },
	},
})
