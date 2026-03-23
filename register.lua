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

-- Add achievements

awards.register_achievement("sunken_spoils:CopperRod", {
    title = S("Hooked on Copper"),
    description = S("Craft an Copper fishing rod using a stick, two copper ingots and two pieces of string."),
    icon = "copper_fishing_rod.png",
    trigger = {
		type = "craft",
		item= "sunken_spoils:copper_fishing_rod",
		target = 1,
	},
    type = "Advancement",
    group = "Sunken Spoils",
})

awards.register_achievement("sunken_spoils:IronRod", {
    title = S("The Iron Angler"),
    description = S("Craft an iron fishing rod using a stick, two iron ingots and two pieces of string."),
    icon = "iron_fishing_rod.png",
    trigger = {
		type = "craft",
		item= "sunken_spoils:iron_fishing_rod",
		target = 1,
	},
    type = "Advancement",
    group = "Sunken Spoils",
})

awards.register_achievement("sunken_spoils:DiamondRod", {
    title = S("Diamond Depths"),
    description = S("Craft a diamond fishing rod using a stick, two diamond ingots and two pieces of string."),
    icon = "diamond_fishing_rod.png",
    trigger = {
		type = "craft",
		item= "sunken_spoils:diamond_fishing_rod",
		target = 1,
	},
    type = "Advancement",
    group = "Sunken Spoils",
})

awards.register_achievement("sunken_spoils:ToughestRod", {
    title = S("Toughest Rod Out There"),
    description = S("Craft a diamond fishing rod using a stick, two abyssil ingots and two pieces of string."),
    icon = "abyssil_fishing_rod.png",
    trigger = {
		type = "craft",
		item= "sunken_spoils:abyssil_fishing_rod",
		target = 1,
	},
    type = "Advancement",
    group = "Sunken Spoils",
})

awards.register_achievement("sunken_spoils:FromTheDepths", {
    title = S("From the Depths"),
    description = S("Acquire an Abyssil Ingot from an Abyssil crate."),
    icon = "abyssil_ingot.png",
    type = "Advancement",
    group = "Sunken Spoils",
})

awards.register_achievement("sunken_spoils:LootCrates", {
    title = S("Loot Crates"),
    description = S("Get a crate from fishing."),
    icon = "wooden_crate.png",
    type = "Advancement",
    group = "Sunken Spoils",
})
