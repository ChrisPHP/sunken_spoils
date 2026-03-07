sunken_spoils = {}

local S = core.get_translator(core.get_current_modname())

sunken_spoils.loot_crates = {
    { itemstring = "sunken_spoils:wooden_crate",  weight = 60 },
    { itemstring = "sunken_spoils:copper_crate",  weight = 25 },
    { itemstring = "sunken_spoils:iron_crate",    weight = 2 },
    { itemstring = "sunken_spoils:abyssil_crate", weight = 13 }
}

-- Crate logic

local forest_crate_contents = {
    "mcl_trees:sapling_oak",
    "mcl_trees:sapling_spruce",
    "mcl_trees:sapling_birch",
    "mcl_trees:sapling_acacia",
    "mcl_trees:sapling_dark_oak",
    "mcl_trees:sapling_jungle",
    "mcl_farming:pumpkin_seeds",
    "mcl_farming:beetroot_seeds",
    "mcl_farming:carrot_item",
    "mcl_farming:potato_item",
    "mcl_farming:melon_seeds",
}

local wooden_crate_contents = {
    "mcl_core:coal_lump",
    "mcl_mobitems:leather",
    "mcl_raw_ores:raw_iron",
    "mcl_copper:raw_copper",
    "mcl_raw_ores:raw_gold",
    "mcl_trees:tree_oak",
    "mcl_core:sand",
}

local copper_crate_contents = {
    "mcl_core:iron_ingot",
    "mcl_copper:copper_ingot",
    "mcl_copper:copper_nugget",
    "mcl_copper:block",
}

local iron_crate_contents = {
    "mcl_core:iron_ingot",
    "mcl_core:gold_ingot",
    "mcl_core:lapis",
    "mcl_redstone:redstone",
}

local abyssil_crate_contents = {
    "sunken_spoils:abyssil_ingot",
    "mcl_core:diamond",
    "mcl_core:emerald",
}

local function open_crate(pos, node, player)
    if not player or not player:is_player() then return end
    local name = player:get_player_name()
    if core.is_protected(pos, name) then
        core.record_protection_violation(pos, name)
        return
    end

    local crate_type = core.get_item_group(node.name, "crates")
    local total_types
    local items

    if crate_type == 1 then
        total_types = math.random(1, #wooden_crate_contents)
    elseif crate_type == 2 then
        total_types = math.random(1, #copper_crate_contents)
    elseif crate_type == 3 then
        total_types = math.random(1, #iron_crate_contents)
    elseif crate_type == 4 then
        total_types = math.random(1, #abyssil_crate_contents)
    end

    local given = {}

    -- Drop items slightly above the crate position
    local drop_pos = { x = pos.x, y = pos.y + 0.5, z = pos.z }

    for i = 1, total_types do
        if crate_type == 1 then
            items = wooden_crate_contents[math.random(1, 3)]
        elseif crate_type == 2 then
            items = copper_crate_contents[math.random(1, 3)]
        elseif crate_type == 3 then
            items = iron_crate_contents[math.random(1, 3)]
        elseif crate_type == 4 then
            items = abyssil_crate_contents[math.random(1, 3)]
        end
        local count = math.random(1, 4)
        local stack = ItemStack(items .. " " .. count)
        core.add_item(drop_pos, stack)

        local desc = core.registered_items[items].description
        table.insert(given, count .. "x " .. desc)
    end

    -- Remove the crate
    core.remove_node(pos)
    core.check_for_falling(pos)
    -- core.chat_send_player(name, S("You opened a rusted crate and found: ") .. table.concat(given, ", "))
end

core.register_node("sunken_spoils:wooden_crate", {
    description = S("Wooden Crate"),
    _tt_help = S("Right-click to open and receive loot"),
    _doc_items_longdesc = S("An old crate filled with loot. Right-click to crack it open and claim its contents."),
    tiles = {
        "wooden_crate.png",
        "wooden_crate.png",
        "wooden_crate.png",
    },
    paramtype2 = "facedir",
    groups = { handy = 1, axey = 1, deco_block = 1, crates = 1 },
    is_ground_content = false,
    sounds = mcl_sounds.node_sound_wood_defaults(),
    _mcl_hardness = 2,
    on_rightclick = open_crate
})

core.register_node("sunken_spoils:copper_crate", {
    description = S("Copper Crate"),
    _tt_help = S("Right-click to open and receive loot"),
    _doc_items_longdesc = S("An old copper crate filled with loot. Right-click to crack it open and claim its contents."),
    tiles = {
        "copper_crate.png",
        "copper_crate.png",
        "copper_crate.png",
    },
    paramtype2 = "facedir",
    groups = { handy = 1, axey = 1, deco_block = 1, crates = 2 },
    is_ground_content = false,
    sounds = mcl_sounds.node_sound_metal_defaults(),
    _mcl_hardness = 2,
    on_rightclick = open_crate
})

core.register_node("sunken_spoils:iron_crate", {
    description = S("Iron Crate"),
    _tt_help = S("Right-click to open and receive loot"),
    _doc_items_longdesc = S("An old Iiron crate filled with loot. Right-click to crack it open and claim its contents."),
    tiles = {
        "iron_crate.png",
        "iron_crate.png",
        "iron_crate.png",
    },
    paramtype2 = "facedir",
    groups = { handy = 1, axey = 1, deco_block = 1, crates = 3 },
    is_ground_content = false,
    sounds = mcl_sounds.node_sound_metal_defaults(),
    _mcl_hardness = 2,
    on_rightclick = open_crate
})

core.register_node("sunken_spoils:abyssil_crate", {
    description = S("Abyssil Crate"),
    _tt_help = S("Right-click to open and receive loot"),
    _doc_items_longdesc = S(
        "An old abyssil crate filled with loot. Right-click to crack it open and claim its contents."),
    tiles = {
        "abyssil_crate.png",
        "abyssil_crate.png",
        "abyssil_crate.png",
    },
    paramtype2 = "facedir",
    groups = { handy = 1, axey = 1, deco_block = 1, crates = 4 },
    is_ground_content = false,
    sounds = mcl_sounds.node_sound_metal_defaults(),
    _mcl_hardness = 2,
    on_rightclick = open_crate
})

-- Fishing rod logic

local fish = minetest.registered_items["mcl_fishing:fishing_rod"].on_place
local def = minetest.registered_items["mcl_fishing:fishing_rod"]

if def then
    local groups = table.copy(def.groups)
    groups.rod_hardiness = 1
    minetest.override_item("mcl_fishing:fishing_rod", { groups = groups })
end

mcl_fishing.register_on_catch(function(rod, player, pos, item)
    local item_name = item:get_name()
    local player_name = player:get_player_name()
    local rod_name = rod:get_name()

    local pr = PcgRandom(os.time() * math.random(1, 100))
    local r = pr:next(1, 100)
    local crate_values = { 85, 84.8, 84.7, 84.5 }
    local treasure_hunter_value = math.min(mcl_enchanting.get_enchantment(rod, "trasure_hunter"), 3)
    local index = treasure_hunter_value + 1
    local crate_value = crate_values[index]

    if r >= crate_value then
        local items
        local item
        local hardiness = core.get_item_group(rod_name, "rod_hardiness")
        items = mcl_loot.get_loot({ items = sunken_spoils.loot_crates, stacks_min = 1, stacks_max = 1 }, pr)
        if #items >= 1 then
            item = ItemStack(items[1])
        else
            item = ItemStack()
        end

        local inv = player:get_inventory()
        if inv:room_for_item("main", item) then
            inv:add_item("main", item)
        else
            core.add_item(pos, item)
        end
    end

    -- your custom logic here
    -- minetest.chat_send_player(player_name, "You caught: " .. val)
end)

local function crate_fish(itemstack, player, pointed_thing)
    local result = fish(itemstack, player, pointed_thing)
    return result
end


core.register_tool("sunken_spoils:copper_fishing_rod", {
    description = S("Copper Fishing Rod"),
    _tt_help = S("Catches fish in water"),
    _doc_items_longdesc = S("Fishing rods can be used to catch fish."),
    _doc_items_usagehelp = S(
        "Rightclick to launch the bobber. When it sinks right-click again to reel in an item. Who knows what you're going to catch?"),
    groups = { tool = 2, fishing_rod = 1, rod_hardiness = 2, enchantability = 1, offhand_item = 1 },
    inventory_image = "copper_fishing_rod.png",
    wield_image = "copper_fishing_rod.png^[transformFY^[transformR90",
    wield_scale = { x = 1.5, y = 1.5, z = 1 },
    stack_max = 1,
    on_place = crate_fish,
    on_secondary_use = crate_fish,
    sound = { breaks = "default_tool_breaks" },
    _mcl_uses = 120,
    _mcl_toollike_wield = true,
})

core.register_tool("sunken_spoils:iron_fishing_rod", {
    description = S("Iron Fishing Rod"),
    _tt_help = S("Catches fish in water"),
    _doc_items_longdesc = S("Fishing rods can be used to catch fish."),
    _doc_items_usagehelp = S(
        "Rightclick to launch the bobber. When it sinks right-click again to reel in an item. Who knows what you're going to catch?"),
    groups = { tool = 2, fishing_rod = 1, rod_hardiness = 3, enchantability = 1, offhand_item = 1 },
    inventory_image = "iron_fishing_rod.png",
    wield_image = "iron_fishing_rod.png^[transformFY^[transformR90",
    wield_scale = { x = 1.5, y = 1.5, z = 1 },
    stack_max = 1,
    on_place = crate_fish,
    on_secondary_use = crate_fish,
    sound = { breaks = "default_tool_breaks" },
    _mcl_uses = 250,
    _mcl_toollike_wield = true,
})

core.register_tool("sunken_spoils:diamond_fishing_rod", {
    description = S("Diamond Fishing Rod"),
    _tt_help = S("Catches fish in water"),
    _doc_items_longdesc = S("Fishing rods can be used to catch fish."),
    _doc_items_usagehelp = S(
        "Rightclick to launch the bobber. When it sinks right-click again to reel in an item. Who knows what you're going to catch?"),
    groups = { tool = 2, fishing_rod = 1, rod_hardiness = 4, enchantability = 1, offhand_item = 1 },
    inventory_image = "diamond_fishing_rod.png",
    wield_image = "diamond_fishing_rod.png^[transformFY^[transformR90",
    wield_scale = { x = 1.5, y = 1.5, z = 1 },
    stack_max = 1,
    on_place = crate_fish,
    on_secondary_use = crate_fish,
    sound = { breaks = "default_tool_breaks" },
    _mcl_uses = 500,
    _mcl_toollike_wield = true,
})

core.register_tool("sunken_spoils:abyssil_fishing_rod", {
    description = S("Iron Fishing Rod"),
    _tt_help = S("Catches fish in water"),
    _doc_items_longdesc = S("Fishing rods can be used to catch fish."),
    _doc_items_usagehelp = S(
        "Rightclick to launch the bobber. When it sinks right-click again to reel in an item. Who knows what you're going to catch?"),
    groups = { tool = 2, fishing_rod = 1, rod_hardiness = 5, enchantability = 1, offhand_item = 1 },
    inventory_image = "abyssil_fishing_rod.png",
    wield_image = "abyssil_fishing_rod.png^[transformFY^[transformR90",
    wield_scale = { x = 1.5, y = 1.5, z = 1 },
    stack_max = 1,
    on_place = crate_fish,
    on_secondary_use = crate_fish,
    sound = { breaks = "default_tool_breaks" },
    _mcl_uses = 1000,
    _mcl_toollike_wield = true,
})

dofile(core.get_modpath(core.get_current_modname()) .. "/items.lua")
