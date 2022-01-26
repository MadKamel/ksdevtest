mrg = {}
utils = {}

mrg.stone = function(nodename, nodedata)
	minetest.register_node(":ks_terrain:"..nodename, {
		description = nodedata.description,
		tiles = {"terrain."..nodename..".png"},
		groups = nodedata.groups,
		drop = "ks_minerals:"..nodename.." 2"
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
		drop = "ks_minerals:"..mineralname
	})
end

mrg.mineral = function(mineralname, nodedata)
	minetest.register_craftitem(":ks_minerals:"..mineralname, {
		description = nodedata.itemdesc,
		inventory_image = "minerals."..mineralname..".png",
		wield_image = "minerals."..mineralname..".png",
	})
	minetest.register_craftitem(":ks_minerals:"..mineralname.."_powder", {
		description = nodedata.itemdesc.." Powder",
		inventory_image = "minerals."..mineralname.."_powder.png",
		wield_image = "minerals."..mineralname.."_powder.png",
	})
end

mrg.basemineral = function(mineralname, nodedata)
	minetest.register_craftitem(":ks_minerals:"..mineralname, {
		description = nodedata.itemdesc,
		inventory_image = "minerals."..mineralname..".png",
		wield_image = "minerals."..mineralname..".png",
	})
end

mrg.mineralnode = function(mineralname, nodedata)
	minetest.register_node(":ks_minerals:"..mineralname, {
		description = nodedata.description,
		tiles = {"minerals."..mineralname..".png"},
	})
end

mrg.mineralsheet = function(mineralname, nodedata)
	minetest.register_node(":ks_minerals:"..mineralname, {
		description = nodedata.description,
		tiles = {"minerals."..mineralname.."_sheet.png"},
		wield_image = "minerals."..mineralname..".png",
		inventory_image = "minerals."..mineralname..".png",
		drawtype = "nodebox",
		paramtype = "light",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -6 / 16, 0.5},
			},
		},
		buildable_to = true,
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

mrg.basegrass = function(grassname, nodedata)
	minetest.register_node(":ks_flora:"..grassname.."_0", {
		description = nodedata.seeddesc,
		drawtype = "plantlike",
		paramtype = "light",
		tiles = {"flora."..grassname.."_0.png"},
		wield_image = "flora."..grassname.."_seeds.png",
		inventory_image = "flora."..grassname.."_seeds.png",
		groups = nodedata.groups
	})
end

mrg.tree = function(nodename, nodedata)
	minetest.register_node(":ks_flora:"..nodename.."_trunk", {
		description = nodedata.trunk_description,
		tiles = {"flora."..nodename.."_log.png"},
		groups = nodedata.groups,
		drop = "ks_flora:"..nodename.."_log"
	})
	minetest.register_node(":ks_flora:"..nodename.."_log", {
		description = nodedata.description,
		tiles = {"flora."..nodename.."_log.png"},
		groups = nodedata.groups
	})
	minetest.register_node(":ks_flora:"..nodename.."_leaves", {
		description = nodedata.leaf_description,
		tiles = {"flora."..nodename.."_leaves.png"},
		paramtype = "light",
		drawtype = "allfaces_optional",
		groups = nodedata.leaf_groups,
		drop = {
			max_items = 2,
			items = {
				{items = {"ks_flora:"..nodename.."_stick"}, rarity = 3},
				{items = {"ks_flora:"..nodename.."_stick"}, rarity = 6},
				{items = {"ks_flora:"..nodename.."_stick"}, rarity = 9}
			}
		}
	})
	minetest.register_craftitem(":ks_flora:"..nodename.."_stick", {
		description = nodedata.stick_description,
		inventory_image = "flora."..nodename.."_stick.png"
	})
end

mrg.basetool = function(toolhead, toolbase, tooltype, tooldata, tooldefs)
	minetest.register_tool("ks_tools:"..toolhead.."_"..toolbase.."_"..tooltype, {
		description = tooldefs.description,
		inventory_image = "tools."..toolhead.."_"..toolbase.."_"..tooltype..".png",
		tool_capabilities = {
			full_punch_interval = 1,
			max_drop_level=10,
			groupcaps = tooldata,
			damage_groups = {fleshy=1},
		},
	})
end



-- Register metallurgy-related craftitems and nodes.

mrg.basemold = function(moldname, nodedata)
	minetest.register_craftitem(":ks_metallurgy:"..moldname.."_mold", {
		description = nodedata.description,
		wield_image = "metallurgy."..moldname.."_mold.png",
		inventory_image = "metallurgy."..moldname.."_mold.png"
	})
end

mrg.basemetal = function(metalname, metaltype, nodedata)
	minetest.register_craftitem(":ks_metallurgy:"..metalname.."_"..metaltype, {
		description = nodedata.description,
		wield_image = "metallurgy."..metalname.."_"..metaltype..".png",
		inventory_image = "metallurgy."..metalname.."_"..metaltype..".png"
	})
end


-- Now for utils library. Hooray, me.

utils.list_has_item = function(list, item) -- This loops through an array to find if there is an item in it that matches the request.
    for index, value in ipairs(list) do
        if value == item then
            return true
        end
    end
    return false
end

utils.get_index_from_list = function(list, item) -- This returns the first item in a list with a value of 'item'
    local index={}
    for k,v in pairs(list) do
        index[v]=k
    end
    return index[item]
end

utils.get_index_from_list_with_list = function(list, item) -- This returns the first item in a list with a value of 'item'
	for key, value in pairs(list) do
		if value[1] == item[1] and value[2] == item[2] then
			return key
		elseif value[1] == item[2] and value[2] == item[1] then
			return key
		end
	end
end




-- Register the hand.

minetest.register_item(':', {
	type = 'none',
	wield_image = 'hand.png',
	wield_scale = {x = 0.5, y = 1, z = 4},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			diggable = {
				times = {[1] = 4.00},
				uses = 0,
				maxlevel = 1,
			},
			sliceable = {
				times = {[1] = 1.00},
				uses = 0,
				maxlevel = 1,
			}
		},
		damage_groups = {fleshy = 1},
	}
})