-- name: Example Name
-- description: Example description.

-- register the level here
LEVEL_ARENA_EXAMPLE = level_register('level_arena_example_entry', COURSE_NONE, 'Example', 'example', 28000, 0x28, 0x28, 0x28)

-- make sure we don't add the level twice
local addedLevels = false

local function on_level_init()
    -- make sure we don't add the level twice
    if addedLevels then return end
    addedLevels = true

    -- make sure Arena was loaded
    if not _G.Arena then
        djui_popup_create("Error: the Arena gamemode wasn't loaded!", 2)
        return
    end

    -- add the level to arena
    _G.Arena.add_level(LEVEL_ARENA_EXAMPLE, 'Example')
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)
