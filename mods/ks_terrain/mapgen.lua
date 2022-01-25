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



-- Ore generation

minetest.register_ore({
	ore_type = "stratum",
	ore = "ks_terrain:feldspar",
	wherein = "ks_terrain:dolomite",
	y_min = -31000,
	y_max = 16,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "ks_terrain:dolomite",
	wherein = "ks_terrain:feldspar",
	clust_scarcity = 4*4*4,
	clust_num_ores = 16,
	clust_size = 5,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "ks_terrain:dolomite_bauxite",
	wherein = "ks_terrain:dolomite",
	clust_scarcity = 8*8*8,
	clust_num_ores = 8,
	clust_size = 4,
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "ks_terrain:dolomite_chalcocite",
	wherein = "ks_terrain:dolomite",
	clust_scarcity = 16*16*16,
	clust_num_ores = 18,
	clust_size = 5,
})