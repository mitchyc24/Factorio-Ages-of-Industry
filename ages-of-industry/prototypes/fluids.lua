-- file: prototypes/fluids.lua
-- Fresh Water: the sole representative of the readme's water-mechanics
-- system this pass (Salt Water / Waste Water are deferred to a later pass).
local util = require("util")

local base = data.raw.fluid.water
local fresh_water = util.table.deepcopy(base)
fresh_water.name = "aoi-fresh-water"
fresh_water.icons = { { icon = base.icon, icon_size = base.icon_size, tint = { r = 0.55, g = 0.75, b = 0.95, a = 1 } } }
fresh_water.icon = nil
fresh_water.icon_size = nil
fresh_water.base_color = { r = 0.55, g = 0.75, b = 0.95 }
fresh_water.flow_color = { r = 0.65, g = 0.85, b = 1, a = 1 }
fresh_water.order = "b-z"

data:extend({ fresh_water })
