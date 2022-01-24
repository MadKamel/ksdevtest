-- I am registering the three strictly needed mapgen aliases
minetest.register_alias("mapgen_stone", "ks_terrain:dolomite")
minetest.register_alias("mapgen_water_source", "ks_terrain:water_source")
minetest.register_alias("mapgen_river_water_source", "ks_terrain:water_source")

minetest.register_biome({
	name = "wet_plains",
	node_top = "ks_terrain:grass_silt_soil",
	depth_top = 1,
	node_filler = "ks_terrain:silt_soil",
	depth_filler = 7,
	y_min = 1,
	y_max = 64,
	heat_point = 25,
	humidity_point = 25
})