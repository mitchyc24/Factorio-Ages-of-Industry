-- file: prototypes/technologies.lua
-- The 6 age-defining technologies, chained by prerequisites. Each unlocks
-- that age's recipes and monument. This builds a PARALLEL AoI progression
-- track -- it does not rewire vanilla's own unlocks (e.g. steel-plate is
-- not gated behind an AoI tech); that is a separate, riskier change.
local util = require("util")
local ages = require("prototypes.ages")

-- Icons are borrowed from vanilla "automation" purely so every AoI tech has
-- a valid icon without needing new art; re-tinted per age.
local icon_base = data.raw.technology.automation

local function new_tech(name, age_id, prerequisites, unit, effects)
	local age = ages.by_id[age_id]
	local tech = util.table.deepcopy(icon_base)
	tech.name = name
	tech.icons = { { icon = icon_base.icon, icon_size = icon_base.icon_size, tint = age.tint } }
	tech.icon = nil
	tech.icon_size = nil
	tech.prerequisites = prerequisites
	tech.unit = unit
	tech.effects = effects
	tech.research_trigger = nil
	return tech
end

local function unlock(recipe_name)
	return { type = "unlock-recipe", recipe = recipe_name }
end

data:extend({
	new_tech(
		"aoi-tech-stone-masonry",
		"stone",
		{},
		{ count = 10, time = 15, ingredients = { { "aoi-writings", 1 } } },
		{ unlock("aoi-flint-tools"), unlock("aoi-monument-stone") }
	),
	new_tech(
		"aoi-tech-agriculture",
		"agricultural",
		{ "aoi-tech-stone-masonry" },
		{ count = 15, time = 20, ingredients = { { "aoi-writings", 1 } } },
		{
			unlock("aoi-wheat"),
			unlock("aoi-thresh-wheat"),
			unlock("aoi-flour"),
			unlock("aoi-bread"),
			unlock("aoi-wool"),
			unlock("aoi-hide"),
			unlock("aoi-leather"),
			unlock("aoi-farm"),
			unlock("aoi-mill"),
			unlock("aoi-tannery"),
			unlock("aoi-monument-agricultural"),
		}
	),
	new_tech(
		"aoi-tech-bronze-metallurgy",
		"bronze",
		{ "aoi-tech-agriculture" },
		{ count = 20, time = 25, ingredients = { { "aoi-writings", 1 } } },
		{
			unlock("aoi-tin-ore"),
			unlock("aoi-tin-plate"),
			unlock("aoi-bronze-plate"),
			unlock("aoi-currency"),
			unlock("aoi-smithy"),
			unlock("aoi-monument-bronze"),
		}
	),
	new_tech(
		"aoi-tech-iron-age",
		"iron",
		{ "aoi-tech-bronze-metallurgy" },
		{ count = 25, time = 30, ingredients = { { "aoi-writings", 1 } } },
		{ unlock("aoi-monument-iron") }
	),
	new_tech(
		"aoi-tech-industrial-age",
		"industrial",
		{ "aoi-tech-iron-age" },
		{
			count = 50,
			time = 30,
			ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
		},
		{ unlock("aoi-monument-industrial") }
	),
	new_tech(
		"aoi-tech-information-age",
		"information",
		{ "aoi-tech-industrial-age" },
		{
			count = 100,
			time = 30,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
			},
		},
		{ unlock("aoi-monument-information") }
	),
})
