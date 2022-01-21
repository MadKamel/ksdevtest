mrg = {}

mrg.stone = function(nodename, nodedata)
	minetest.register_node(":ks_terrain:"..nodename, {
		description = nodedata.description,
		tiles = {"terrain."..nodename..".png"},
		groups = nodedata.groups,
		drops = "ks_minerals:"..nodename
	})
	minetest.register_craftitem(":ks_minerals:"..nodename, {
		description = nodedata.itemdesc,
		inventory_image = "minerals."..nodename..".png",
		wield_image = "minerals."..nodename..".png",
	})
end

mrg.mineralore = function(basenode, mineralname, nodedata)
	minetest.register_node(":ks_terrain:"..basenode.."_"..mineralname, {
		description = nodedata.description,
		tiles = {"terrain."..basenode..".png^terrain."..mineralname.."_overlay.png"},
		groups = nodedata.groups,
		drops = "ks_minerals:"..mineralname
	})
end

mrg.mineral = function(mineralname, nodedata)
	minetest.register_craftitem(":ks_minerals:"..mineralname, {
		description = nodedata.itemdesc,
		inventory_image = "minerals."..mineralname..".png",
		wield_image = "minerals."..mineralname..".png",
	})
	minetest.register_node(":ks_minerals:"..mineralname.."_node", {
		description = nodedata.description,
		tiles = {"minerals."..mineralname.."_node.png"},
		groups = nodedata.groups
	})
end

mrg.topsoil = function(grasstype, dirttype, nodedata)
	minetest.register_node(":ks_terrain:"..grasstype.."_"..dirttype, {
		description = nodedata.description,
		tiles = {"terrain."..grasstype..".png", "terrain."..dirttype..".png", "terrain."..dirttype..".png^terrain."..grasstype.."_side.png"},
		groups = nodedata.groups
	})
end

mrg.subsoil = function(dirttype, nodedata)
	minetest.register_node(":ks_terrain:"..dirttype, {
		description = nodedata.description,
		tiles = {"terrain."..dirttype..".png"},
		groups = nodedata.groups
	})
end

mrg.basetool = function(toolhead, toolbase, tooldata)
	-- pass
end