-- file: prototypes/entities.lua
-- All new entities are vanilla reskins (table.deepcopy + re-tint) -- no new art.
local util = require("util")
local ages = require("prototypes.ages")

-- Deepcopies a vanilla entity, renames it, re-tints its icon with the given
-- age's color, and fixes up `minable.result` so mining/placing it produces
-- the new item (not the vanilla one it was copied from). `overrides` is a
-- shallow table of fields to set/replace afterwards (e.g. crafting_categories).
local function reskin(base_type, base_name, new_name, age_id, overrides)
	local base = data.raw[base_type][base_name]
	local age = ages.by_id[age_id]
	local entity = util.table.deepcopy(base)

	entity.name = new_name

	if entity.icons then
		for _, layer in pairs(entity.icons) do
			layer.tint = age.tint
		end
	elseif entity.icon then
		entity.icons = { { icon = entity.icon, icon_size = entity.icon_size, tint = age.tint } }
		entity.icon = nil
		entity.icon_size = nil
	end

	if entity.minable then
		entity.minable = util.table.deepcopy(entity.minable)
		entity.minable.result = new_name
		entity.minable.results = nil
	end

	if overrides then
		for key, value in pairs(overrides) do
			entity[key] = value
		end
	end

	return entity
end

-- Stone Age: School (research building) and Housing Hut are introduced here
-- because every later age reuses them -- they are inert placeholders this
-- pass (no worker/labor logic; that is a future control-stage system).
local aoi_school = reskin("lab", "lab", "aoi-school", "stone", { inputs = { "aoi-writings" } })
local aoi_housing_hut = reskin("container", "iron-chest", "aoi-housing-hut", "stone")
local aoi_monument_stone = reskin("container", "iron-chest", "aoi-monument-stone", "stone")

-- Agricultural Age. Base is assembling-machine-2 (not -1) because these
-- buildings need fluid ingredient boxes for fresh-water-consuming recipes,
-- which assembling-machine-1 does not have.
local aoi_farm = reskin("assembling-machine", "assembling-machine-2", "aoi-farm", "agricultural", {
	crafting_categories = { "aoi-farming" },
})
local aoi_mill = reskin("assembling-machine", "assembling-machine-2", "aoi-mill", "agricultural", {
	crafting_categories = { "aoi-milling" },
})
local aoi_tannery = reskin("assembling-machine", "assembling-machine-2", "aoi-tannery", "agricultural", {
	crafting_categories = { "aoi-tanning" },
})
local aoi_monument_agricultural = reskin("container", "iron-chest", "aoi-monument-agricultural", "agricultural")

-- Bronze Age.
local aoi_smithy = reskin("assembling-machine", "assembling-machine-2", "aoi-smithy", "bronze", {
	crafting_categories = { "aoi-smithing" },
})
local aoi_monument_bronze = reskin("container", "iron-chest", "aoi-monument-bronze", "bronze")

-- Iron/Industrial/Information Ages intentionally add no new production
-- buildings -- vanilla furnaces/assemblers already cover that territory.
-- Only each age's capstone monument is new.
local aoi_monument_iron = reskin("container", "iron-chest", "aoi-monument-iron", "iron")
local aoi_monument_industrial = reskin("container", "iron-chest", "aoi-monument-industrial", "industrial")
local aoi_monument_information = reskin("container", "iron-chest", "aoi-monument-information", "information")

data:extend({
	aoi_school,
	aoi_housing_hut,
	aoi_monument_stone,
	aoi_farm,
	aoi_mill,
	aoi_tannery,
	aoi_monument_agricultural,
	aoi_smithy,
	aoi_monument_bronze,
	aoi_monument_iron,
	aoi_monument_industrial,
	aoi_monument_information,
})
