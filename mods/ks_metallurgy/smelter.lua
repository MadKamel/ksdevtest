smelting_recipes = {}
smelting_results = {}
smelting_recipes[1] = "ks_minerals:alumina_powder"
smelting_results[1] = {
	"ks_metallurgy:aluminium_"
}
smelting_recipes[2] = "ks_minerals:chalcocite_powder"
smelting_results[2] = {
	"ks_metallurgy:copper_"
}
smelting_recipes[3] = "ks_minerals:uranium_powder"
smelting_results[3] = {
	"ks_metallurgy:uranium_"
}
		
smelt_by_list = function(inv, item)
    	recipe_number = utils.get_index_from_list(smelting_recipes, item)
	if recipe_number == nil then
		return false
	end

	-- Get type of mold being used, ingot or diabolo. Should change this later
	-- 	to be more easily expandable.
	if inv:get_stack('mold', 1):get_name() == "ks_metallurgy:ingot_mold" then
		moldtype = "ingot"

	elseif inv:get_stack('mold', 1):get_name() == "ks_metallurgy:diabolo_mold" then
		moldtype = "diabolo"

	else	
		return false
	end



	inv:remove_item('input', ItemStack(smelting_recipes[recipe_number]))
	inv:remove_item('mold', ItemStack(inv:get_stack('mold', 1):get_name()))
	minetest.log(moldtype)
	--minetest.log(smelting_results[recipe_number][1])
	inv:add_item('output', ItemStack(smelting_results[recipe_number][1]..moldtype))
end

smelt = function(pos)
	local inv = minetest.get_meta(pos):get_inventory()
	if inv:is_empty('input') then
		return false
	elseif inv:is_empty('mold') then
		return false
	else
		local item = inv:get_stack('input', 1)
		
		smelt_by_list(inv, item:get_name())
	end
end

minetest.register_node("ks_metallurgy:smelter", {
	description = "Metal Caster",
	tiles = {"caster.png"},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local name = ""
		local inv = meta:get_inventory()
		inv:set_size("input", 1*1)
		inv:set_size("output", 1*1)
		inv:set_size("mold", 1*1)
		meta:set_string("infotext", "Metal Caster")
		local formspec = "formspec_version[4]size[11,8.5]label[5.3,0.3;Output]list[current_name;input;0.6,0.6;1,1;0]list[current_name;output;5.3,0.6;1,1;0]button[1.9,0.3;3,1.5;upgrade;Cast]list[current_player;main;0.6,3.5;8,4;0]label[0.7,0.3;Input]list[current_name;mold;6.8,0.6;1,1;0]label[6.9,0.3;Mold]"

		meta:set_string("formspec", formspec)
	end,
	on_receive_fields = function(pos, formname, fields, player)
		if fields.upgrade then
			smelt(pos)
			minetest.log("Cast done.")
		end
	end,
	groups = {chippable = 1}
})
