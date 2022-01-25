-- Stone
mrg.stone("dolomite", {
	description = "Dolomite Stone",
	itemdesc = "Dolomite Rock",
	groups = {stone = 1, chippable = 1}
})
mrg.stone("aragonite", {
	description = "Aragonite Stone",
	itemdesc = "Aragonite Rock",
	groups = {stone = 1, chippable = 1}
})



-- Topsoil
mrg.topsoil("grass", "silt_soil", {
	description = "Grassy Silt Soil",
	groups = {grass = 1, dirt = 1, diggable = 1}
})



-- Subsoil
mrg.subsoil("silt_soil", {
	description = "Silt Soil",
	groups = {dirt = 1, diggable = 1}
})



-- Mineral Ores
mrg.mineralore("dolomite", "bauxite", {
	description = "Dolomite Stone with Bauxite",
	groups = {stone = 1, chippable = 1}
})
mrg.mineralore("dolomite", "chalcocite", {
	description = "Dolomite Stone with Chalcocite",
	groups = {stone = 1, chippable = 1}
})
mrg.mineralore("dolomite", "uranium", {
	description = "Dolomite Stone with Uranium",
	groups = {stone = 1, chippable = 1}
})
mrg.mineralore("aragonite", "bauxite", {
	description = "Aragonite Stone with Bauxite",
	groups = {stone = 1, chippable = 1}
})
mrg.mineralore("aragonite", "chalcocite", {
	description = "Aragonite Stone with Chalcocite",
	groups = {stone = 1, chippable = 1}
})
mrg.mineralore("aragonite", "uranium", {
	description = "Aragonite Stone with Uranium",
	groups = {stone = 1, chippable = 1}
})



-- Fluids
minetest.register_node("ks_terrain:water_source", {
	description = "Source Water",
	drawtype = "liquid",
	tiles = {
		{
			name = "terrain.water.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 8,
			},
		},
		{
			name = "terrain.water.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 8,
			},
		},
	},
	paramtype = "light",
	use_texture_alpha = "blend",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	liquidtype = "source",
	liquid_alternative_flowing = "ks_terrain:water_flowing",
	liquid_alternative_source = "ks_terrain:water_source",
	liquid_viscosity = 1,
	liquid_range = 8,
	groups = {water = 1, liquid = 3}
})
minetest.register_node("ks_terrain:water_flowing", {
	description = "Flowing Water",
	drawtype = "flowingliquid",
	tiles = {"terrain.water.png"},
	special_tiles = {
		{
			name = "terrain.water.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 8,
			},
		},
		{
			name = "terrain.water.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 8,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	liquidtype = "flowing",
	liquid_alternative_flowing = "ks_terrain:water_flowing",
	liquid_alternative_source = "ks_terrain:water_source",
	liquid_viscosity = 1,
	liquid_range = 8,
	groups = {water = 1, liquid = 3}
})