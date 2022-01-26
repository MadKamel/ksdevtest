minetest.register_tool("ks_tools:devtool", {
	description = "Developer Tool",
	inventory_image = "devtool.png",
	tool_capabilities = {
		full_punch_interval = 0.1,
		max_drop_level=3,
		groupcaps={
			chippable={times={[1]=0.0, [2]=0.0, [3]=0.0}, maxlevel=255},
			diggable={times={[1]=0.0, [2]=0.0, [3]=0.0}, maxlevel=255},
			choppable={times={[1]=0.0, [2]=0.0, [3]=0.0}, maxlevel=255},
			sliceable={times={[1]=0.0, [2]=0.0, [3]=0.0}, maxlevel=255},
			dig_immediate={times={[1]=0.0, [2]=0.0, [3]=0.0}, maxlevel=255},
			grabbable={times={[1]=0.0}}
		},
		damage_groups = {fleshy=100},
	},
})

mrg.basetool("aluminium", "maple", "pick", {
	chippable={times={[1]=3.0, [2]=6.0, [3]=9.0}, maxlevel=1}
}, {
	description = "Aluminium Pickaxe"
})