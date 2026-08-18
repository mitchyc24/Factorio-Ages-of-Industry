-- file: prototypes/items.lua
local util = require("util")
local ages = require("prototypes.ages")

-- A new raw/intermediate material: deepcopies a vanilla item purely to
-- borrow its icon (visual fidelity isn't the goal -- see plan decision on
-- reusing vanilla graphics), re-tints it, and sets it up as its own item.
local function new_item(name, base_name, tint, age_id, order_suffix, stack_size)
	local base = data.raw.item[base_name]
	local item = util.table.deepcopy(base)
	item.name = name
	item.icons = { { icon = base.icon or base.icons[1].icon, icon_size = base.icon_size or base.icons[1].icon_size, tint = tint } }
	item.icon = nil
	item.icon_size = nil
	item.subgroup = "aoi-subgroup-" .. age_id
	item.order = order_suffix
	item.stack_size = stack_size
	item.weight = nil -- let Factorio auto-calculate from the (new) recipe
	item.place_result = nil
	item.rocket_launch_products = nil
	item.fuel_category = nil
	item.fuel_value = nil
	return item
end

-- The placeable item for a reskinned building defined in entities.lua.
-- Mirrors that entity's (already re-tinted) icon so item and entity match.
local function building_item(name, entity_type, age_id, order_suffix, stack_size)
	local entity = data.raw[entity_type][name]
	return {
		type = "item",
		name = name,
		icons = entity.icons,
		icon_size = entity.icons[1].icon_size,
		subgroup = "aoi-subgroup-" .. age_id,
		order = order_suffix,
		place_result = name,
		stack_size = stack_size,
	}
end

data:extend({
	-- Stone Age
	new_item("aoi-flint", "stone", { r = 0.65, g = 0.65, b = 0.68, a = 1 }, "stone", "a-a", 100),
	new_item("aoi-flint-tools", "iron-gear-wheel", { r = 0.55, g = 0.40, b = 0.25, a = 1 }, "stone", "a-b", 50),
	new_item("aoi-writings", "automation-science-pack", { r = 0.85, g = 0.75, b = 0.55, a = 1 }, "stone", "a-c", 50),
	building_item("aoi-school", "lab", "stone", "a-d", 10),
	building_item("aoi-housing-hut", "container", "stone", "a-e", 10),
	building_item("aoi-monument-stone", "container", "stone", "a-f", 1),

	-- Agricultural Age
	new_item("aoi-wheat", "wood", { r = 0.85, g = 0.75, b = 0.25, a = 1 }, "agricultural", "b-a", 100),
	new_item("aoi-grain", "iron-ore", { r = 0.80, g = 0.70, b = 0.30, a = 1 }, "agricultural", "b-b", 100),
	new_item("aoi-straw", "wood", { r = 0.90, g = 0.85, b = 0.60, a = 1 }, "agricultural", "b-c", 100),
	new_item("aoi-flour", "stone", { r = 0.95, g = 0.93, b = 0.88, a = 1 }, "agricultural", "b-d", 100),
	new_item("aoi-bread", "iron-gear-wheel", { r = 0.70, g = 0.50, b = 0.30, a = 1 }, "agricultural", "b-e", 50),
	new_item("aoi-wool", "stone", { r = 0.92, g = 0.92, b = 0.85, a = 1 }, "agricultural", "b-f", 100),
	new_item("aoi-hide", "iron-plate", { r = 0.55, g = 0.40, b = 0.30, a = 1 }, "agricultural", "b-g", 50),
	new_item("aoi-leather", "iron-plate", { r = 0.40, g = 0.25, b = 0.15, a = 1 }, "agricultural", "b-h", 50),
	building_item("aoi-farm", "assembling-machine", "agricultural", "b-i", 10),
	building_item("aoi-mill", "assembling-machine", "agricultural", "b-j", 10),
	building_item("aoi-tannery", "assembling-machine", "agricultural", "b-k", 10),
	building_item("aoi-monument-agricultural", "container", "agricultural", "b-l", 1),

	-- Bronze Age
	new_item("aoi-tin-ore", "copper-ore", { r = 0.75, g = 0.75, b = 0.78, a = 1 }, "bronze", "c-a", 50),
	new_item("aoi-tin-plate", "copper-plate", { r = 0.80, g = 0.80, b = 0.82, a = 1 }, "bronze", "c-b", 100),
	new_item("aoi-bronze-plate", "iron-plate", { r = 0.72, g = 0.55, b = 0.30, a = 1 }, "bronze", "c-c", 100),
	new_item("aoi-currency", "iron-gear-wheel", { r = 0.85, g = 0.68, b = 0.20, a = 1 }, "bronze", "c-d", 100),
	building_item("aoi-smithy", "assembling-machine", "bronze", "c-e", 10),
	building_item("aoi-monument-bronze", "container", "bronze", "c-f", 1),

	-- Iron / Industrial / Information Ages: monuments only, no new materials.
	building_item("aoi-monument-iron", "container", "iron", "d-a", 1),
	building_item("aoi-monument-industrial", "container", "industrial", "e-a", 1),
	building_item("aoi-monument-information", "container", "information", "f-a", 1),
})
