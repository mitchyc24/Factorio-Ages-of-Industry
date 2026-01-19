-- file: data-final-fixes.lua
for type_name, prototypes in pairs(data.raw) do
    for name, prototype in pairs(prototypes) do
        log(type_name .. " - " .. name)
    end
end
