mrg.tree("maple", {
	description = "Maple Log",
	trunk_description = "Maple Trunk",
	leaf_description = "Maple Leaves",
	groups = {choppable = 1},
	leaf_groups = {sliceable = 1}
})

minetest.register_decoration({
	deco_type = "schematic",
	schematic = "schematics/maple_tree.mts",
	place_on = "ks_terrain:grass_silt_soil",
	fill_ratio = 0.005
})