local S = core.get_translator(core.get_current_modname())

-- Fishing rods

core.register_craft({
	output = "sunken_spoils:copper_fishing_rod",
	recipe = {
		{"","","mcl_core:copper_ingot"},
		{"","mcl_core:copper_ingot","mcl_mobitems:string"},
		{"mcl_core:stick","","mcl_mobitems:string"},
	}
})

core.register_craft({
	output = "sunken_spoils:iron_fishing_rod",
	recipe = {
		{"","","mcl_core:iron_ingot"},
		{"","mcl_core:iron_ingot","mcl_mobitems:string"},
		{"mcl_core:stick","","mcl_mobitems:string"},
	}
})
core.register_craft({
	output = "sunken_spoils:diamond_fishing_rod",
	recipe = {
		{"","","mcl_core:diamond"},
		{"","mcl_core:diamond","mcl_mobitems:string"},
		{"mcl_core:stick","","mcl_mobitems:string"},
	}
})

core.register_craft({
	output = "sunken_spoils:abyssil_fishing_rod",
	recipe = {
		{"","","sunken_spoils:abyssil_ingot"},
		{"","sunken_spoils:abyssil_ingot","mcl_mobitems:string"},
		{"mcl_core:stick","","mcl_mobitems:string"},
	}
})

-- New Ingot

core.register_craftitem("sunken_spoils:abyssil_ingot", {
	description = S("Abyssil Ingot"),
	_doc_items_longdesc = S("A rare hardy underwater ingot that can only be found in rare Abyssil crates."),
	inventory_image = "abyssil_ingot.png",
	groups = { craftitem = 1 },
})


-- Enchantment

mcl_enchanting.register_enchantment("treasure_hunter", {
	name = S("Treasure Hunter"),
	max_level = 3,
	primary = {fishing_rod = true},
	weight = 2,
	description = S("Increases rate of getting crates from fishing."),
	power_range_table = {{15, 61}, {24, 71}, {33, 81}},
	treasure = true,
	inv_tool_tab = true,
	anvil_item_factor = 4,
	anvil_book_factor = 2,
})
