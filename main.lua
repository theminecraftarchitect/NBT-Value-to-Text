NBT_Value_to_Text = {
    styler = {
        type = EXTENSION_TYPE.NBT_EDITOR_STYLE,
        recursive = true
    }
}

NBT_Value_to_Text.valueMappings = {
    rain = {
        [0] = "no rain",
        [1] = "rain"
    },
    hardcore = {
        [0] = "false",
        [1] = "true"
    },
    initialized = {
        [0] = "false",
        [1] = "true"
    },
    allowCommands = {
        [0] = "false",
        [1] = "true"
    },
    DifficultyLocked = {
        [0] = "false",
        [1] = "true"
    },
    raining = {
        [0] = "false",
        [1] = "true"
    },
    thundering = {
        [0] = "false",
        [1] = "true"
    },
    wasModded = {
        [0] = "false",
        [1] = "true"
    }
}

function NBT_Value_to_Text:convertValue(key, value)
    local mappings = self.valueMappings[key]
    return mappings and mappings[value] or value
end

function NBT_Value_to_Text:convertNBTValues(root, context)
    self:traverseNBT(root, context)
end

function NBT_Value_to_Text:traverseNBT(node, context)
    if type(node) == "table" then
        for key, value in pairs(node) do
            if type(value) == "table" then
                self:traverseNBT(value, context)
            else
                node[key] = self:convertValue(key, value)
            end
        end
    end
end

return NBT_Value_to_Text
