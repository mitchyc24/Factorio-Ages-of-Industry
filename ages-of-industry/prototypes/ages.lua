-- prototypes/ages.lua
-- Shared age/tier metadata. NOT a prototype file -- does not call data:extend.
-- Other prototypes/*.lua files do: local ages = require("prototypes.ages")

local ages = {
	{ id = "stone", order = "a", name = "Stone Age", tint = { r = 0.62, g = 0.55, b = 0.47, a = 1 } },
	{ id = "agricultural", order = "b", name = "Agricultural Age", tint = { r = 0.74, g = 0.80, b = 0.36, a = 1 } },
	{ id = "bronze", order = "c", name = "Bronze Age", tint = { r = 0.80, g = 0.55, b = 0.25, a = 1 } },
	{ id = "iron", order = "d", name = "Iron Age", tint = { r = 0.55, g = 0.55, b = 0.60, a = 1 } },
	{ id = "industrial", order = "e", name = "Industrial Age", tint = { r = 0.35, g = 0.35, b = 0.38, a = 1 } },
	{ id = "information", order = "f", name = "Information Age", tint = { r = 0.25, g = 0.55, b = 0.85, a = 1 } },
}

ages.by_id = {}
for _, age in ipairs(ages) do
	ages.by_id[age.id] = age
end

return ages
