local S = core.get_translator(core.get_current_modname())

-- Fishing rods

core.register_craft({
    output = "sunken_spoils:copper_fishing_rod",
    recipe = {
        { "",               "",                        "mcl_copper:copper_ingot" },
        { "",               "mcl_copper:copper_ingot", "mcl_mobitems:string" },
        { "mcl_core:stick", "",                        "mcl_mobitems:string" },
    }
})

core.register_craft({
    output = "sunken_spoils:iron_fishing_rod",
    recipe = {
        { "",               "",                    "mcl_core:iron_ingot" },
        { "",               "mcl_core:iron_ingot", "mcl_mobitems:string" },
        { "mcl_core:stick", "",                    "mcl_mobitems:string" },
    }
})
core.register_craft({
    output = "sunken_spoils:diamond_fishing_rod",
    recipe = {
        { "",               "",                 "mcl_core:diamond" },
        { "",               "mcl_core:diamond", "mcl_mobitems:string" },
        { "mcl_core:stick", "",                 "mcl_mobitems:string" },
    }
})

core.register_craft({
    output = "sunken_spoils:abyssil_fishing_rod",
    recipe = {
        { "",               "",                            "sunken_spoils:abyssil_ingot" },
        { "",               "sunken_spoils:abyssil_ingot", "mcl_mobitems:string" },
        { "mcl_core:stick", "",                            "mcl_mobitems:string" },
    }
})

-- Abyssil Tools

core.register_craftitem("sunken_spoils:abyssil_ingot", {
    description = S("Abyssil Ingot"),
    _doc_items_longdesc = S("A rare hardy underwater ingot that can only be found in rare Abyssil crates."),
    inventory_image = "abyssil_ingot.png",
    groups = { craftitem = 1 },
})


core.register_node("sunken_spoils:abyssilblock", {
    description = S("Abyssil Block"),
    _doc_items_longdesc = S("Abyssil block a tough deep sea metal block and can be made of 9 abyssil ingots."),
    stack_max = 64,
    tiles = { "sunken_spoils_abyssilblock.png" },
    is_ground_content = true,
    groups = { pickaxey = 4, building_block = 1, material_stone = 1, xp = 0, fire_immune = 1 },
    drop = "sunken_spoils:abyssilblock",
    groups = { pickaxey = 4, building_block = 1 },
    sounds = mcl_sounds.node_sound_metal_defaults(),
    _mcl_blast_resistance = 6,
    _mcl_hardness = 5,
})

core.register_craft({
    output = "sunken_spoils:abyssilblock",
    recipe = {
        { "sunken_spoils:abyssil_ingot", "sunken_spoils:abyssil_ingot", "sunken_spoils:abyssil_ingot" },
        { "sunken_spoils:abyssil_ingot", "sunken_spoils:abyssil_ingot", "sunken_spoils:abyssil_ingot" },
        { "sunken_spoils:abyssil_ingot", "sunken_spoils:abyssil_ingot", "sunken_spoils:abyssil_ingot" },
    }
})

core.register_craft({
    output = "sunken_spoils:abyssil_ingot 9",
    recipe = { { "sunken_spoils:abyssilblock" } }
})

-- Enchantment

local thunter_def = {
    name = S("Treasure Hunter"),
    max_level = 3,
    primary = { fishing_rod = true },
    weight = 2,
    description = S("Increases rate of getting crates from fishing."),
    power_range_table = { { 15, 61 }, { 24, 71 }, { 33, 81 } },
    treasure = true,
    inv_tool_tab = true,
    anvil_item_factor = 4,
    anvil_book_factor = 2,
}
local enchantment_default = {
    max_level = 1,
    primary = {},
    secondary = {},
    disallow = {},
    incompatible = {},
    curse = false,
    on_enchant = function() end,
    requires_tool = false,
    treasure = false,
    inv_combat_tab = false,
    inv_tool_tab = false,
    tradable = true,
}
mcl_enchanting.enchantments["treasure_hunter"] = setmetatable(thunter_def, { __index = enchantment_default })
