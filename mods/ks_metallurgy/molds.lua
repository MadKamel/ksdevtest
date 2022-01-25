mrg.basemold("ingot", {
	description = "Ingot Mold"
})

mrg.basemold("diabolo", {
	description = "Diabolo Mold"
})



mrg.basemold("wet_ingot", {
	description = "Wet Ingot Mold"
})



minetest.register_craft({
	output = "ks_metallurgy:wet_ingot_mold 4",
	type = "shapeless",
	recipe = {"ks_minerals:red_mud"}
})



minetest.register_craft({
	output = "ks_metallurgy:diabolo_mold",
	type = "shapeless",
	recipe = {"ks_metallurgy:wet_ingot_mold", "ks_metallurgy:wet_ingot_mold"}
})

minetest.register_craft({
	output = "ks_metallurgy:ingot_mold",
	type = "shapeless",
	recipe = {"ks_metallurgy:wet_ingot_mold"}
})