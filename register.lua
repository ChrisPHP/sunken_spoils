local S = core.get_translator(core.get_current_modname())


mcl_tools.register_set("abyssil", {
    craftable = true,
    material = "sunken_spoils:abyssil_ingot",
    uses = 1750,
    level = 5,
    speed = 9,
    max_drop_level = 5,
    groups = { dig_speed_class = 6, enchantability = 10 }
}, {
    ["pick"] = {
        description = S("Abyssil Pickaxe"),
        inventory_image = "sunken_spoils_tool_abyssilpick.png",
        tool_capabilities = {
            full_punch_interval = 0.83333333,
            damage_groups = { fleshy = 6 }
        },
    },
    ["shovel"] = {
        description = S("Abyssil Shovel"),
        inventory_image = "sunken_spoils_tool_abyssilshovel.png",
        tool_capabilities = {
            full_punch_interval = 1,
            damage_groups = { fleshy = 6 }
        },
    },
    ["sword"] = {
        description = S("Abyssil Sword"),
        inventory_image = "sunken_spoils_tool_abyssilsword.png",
        tool_capabilities = {
            full_punch_interval = 0.625,
            damage_groups = { fleshy = 8 }
        },
    },
    ["axe"] = {
        description = S("Abyssil Axe"),
        inventory_image = "sunken_spoils_tool_abyssilaxe.png",
        tool_capabilities = {
            full_punch_interval = 1,
            damage_groups = { fleshy = 9 }
        },
    }
})


mcl_armor.register_set({
    name = "abyssil",
    descriptions = {
        head = S("Abyssil Helmet"),
        torso = S("Abyssil Chestplate"),
        legs = S("Abyssil Leggings"),
        feet = S("Abyssil Boots"),
    },
    durability = 500,
    enchantability = 10,
    points = {
        head = 3,
        torso = 8,
        legs = 6,
        feet = 3,
    },
    groups = { fire_immune = 1 },
    toughness = 2,
    repair_material = "sunken_spoils:abyssil_ingot",
    sound_equip = "mcl_armor_equip_diamond",
    sound_unequip = "mcl_armor_unequip_diamond",
})
