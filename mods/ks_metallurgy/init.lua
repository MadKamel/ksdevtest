grinding_recipes = {}
grinding_results = {}
grinding_recipes[1] = "ks_minerals:bauxite_powder"
grinding_results[1] = {
	"ks_minerals:alumina_powder",
	"ks_minerals:red_mud"
}
grinding_recipes[2] = "ks_minerals:bauxite"
grinding_results[2] = {
	"",
	"ks_minerals:bauxite_powder"
}
		
grind_by_list = function(inv, item)
    	recipe_number = utils.get_index_from_list(grinding_recipes, item)
	if recipe_number == nil then
		return false
	end
	inv:set_stack('input', 1, {})
	minetest.log(recipe_number)
	--minetest.log(grinding_results[recipe_number][1])
	inv:set_stack('output', 1, {name=grinding_results[recipe_number][1]})
	inv:set_stack('output', 2, {name=grinding_results[recipe_number][2]})
end

grind = function(pos)
	local inv = minetest.get_meta(pos):get_inventory()
	if inv:is_empty('input') then
		return false
	else
		local item = inv:get_stack('input', 1)
		minetest.log(item:get_name())
		
		grind_by_list(inv, item:get_name())
	end
end

minetest.register_node("ks_metallurgy:grinder", {
	description = "Grinder",
	tiles = {"grinder.png"},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local name = ""
		local inv = meta:get_inventory()
		inv:set_size("input", 1*1)
		inv:set_size("output", 2*1)
		meta:set_string("infotext", "Grinder")
		local formspec = "formspec_version[4]size[11,8.5]label[5.9,0.3;Output]list[current_name;input;0.6,0.6;1,1;0]list[current_name;output;5.3,0.6;2,1;0]button[1.9,0.3;3,1.5;upgrade;Grind]list[current_player;main;0.6,3.5;8,4;0]label[0.7,0.3;Input]"
		meta:set_string("formspec", formspec)
	end,
	on_receive_fields = function(pos, formname, fields, player)
		minetest.log(dump(fields))
		if fields.upgrade then
			grind(pos)
		end
	end,
	groups = {oddly_breakable_by_hand=3}
})