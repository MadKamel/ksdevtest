foundry_recipes = {}
foundry_results = {}
foundry_recipes[1] = {
	"ks_minerals:chalcocite_powder",
	"ks_minerals:alumina_powder"
}
foundry_results[1] = "ks_metallurgy:alclad_"
foundry_recipes[2] = {
	"ks_minerals:chalcocite_powder",
	"ks_minerals:uranium_powder"
}
foundry_results[2] = "ks_metallurgy:uranium_bronze_"


		
cast_by_list = function(inv, item, item2)
	items = {item, item2}
	--minetest.log(dump(items))
    	recipe_number = utils.get_index_from_list_with_list(foundry_recipes, items)
	if recipe_number == nil then
		return false
	end
	--minetest.log(recipe_number)

	-- Get type of mold being used, ingot or diabolo. Should change this later
	-- 	to be more easily expandable.
	if inv:get_stack('mold', 1):get_name() == "ks_metallurgy:ingot_mold" then
		moldtype = "ingot"

	elseif inv:get_stack('mold', 1):get_name() == "ks_metallurgy:diabolo_mold" then
		moldtype = "diabolo"

	else
		return false
	end



	inv:remove_item('input', ItemStack(foundry_recipes[recipe_number][1]))
	inv:remove_item('input', ItemStack(foundry_recipes[recipe_number][2]))
	inv:remove_item('mold', ItemStack(inv:get_stack('mold', 1):get_name()))
	--minetest.log(recipe_number)
	--minetest.log(foundry_results[recipe_number])
	inv:add_item('output', ItemStack(foundry_results[recipe_number]..moldtype))
end

cast = function(pos)
	local inv = minetest.get_meta(pos):get_inventory()
	if inv:is_empty('input') then
		return false
	elseif inv:is_empty('mold') then
		return false
	else
		local item = inv:get_stack('input', 1)
		local item2 = inv:get_stack('input', 2)
		minetest.log(item:get_name())
		
		cast_by_list(inv, item:get_name(), item2:get_name())
	end
end

minetest.register_node("ks_metallurgy:foundry", {
	description = "Metal Foundry",
	tiles = {"foundry.png"},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local name = ""
		local inv = meta:get_inventory()
		inv:set_size("input", 1*2)
		inv:set_size("output", 1*1)
		inv:set_size("mold", 1*1)
		meta:set_string("infotext", "Metal Foundry")
		local formspec = "formspec_version[4]size[11,8.5]label[6.4,0.3;Output]list[current_name;input;0.6,0.6;2,1;0]list[current_name;output;6.5,0.6;1,1;0]button[3.1,0.3;3,1.5;upgrade;Cast]list[current_player;main;0.6,3.5;8,4;0]label[0.7,0.3;Input]list[current_name;mold;7.8,0.6;1,1;0]label[7.9,0.3;Mold]"

		meta:set_string("formspec", formspec)
	end,
	on_receive_fields = function(pos, formname, fields, player)
		minetest.log(dump(fields))
		if fields.upgrade then
			cast(pos)
		end
	end,
	groups = {chippable = 1}
})
