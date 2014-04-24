--[[
	StreetsMod: inDev Trafficlights
]]

dofile(streets.modpath .. "/../trafficlight/pole.lua")

streets.tlBox =	{
	--[[ Thank you, rubenwardy, for your awesome NodeboxEditor! Not perfect, but still great! ]]
	{-0.1875,-0.5,0.5,0.1875,0.5,0.75}, --nodebox1
	{-0.0625,0.375,0.3125,0.0625,0.4375,0.5}, --nodebox2
	{-0.0625,0.0625,0.3125,0.0625,0.125,0.5}, --nodebox3
	{-0.0625,-0.25,0.3125,0.0625,-0.1875,0.5}, --nodebox4
	{0.0625,0.3125,0.3125,0.125,0.38,0.5}, --nodebox5
	{-0.125,0.3125,0.3125,-0.0625,0.375,0.5}, --nodebox6
	{0.0625,0,0.3125,0.125,0.0625,0.5}, --nodebox7
	{-0.125,0,0.3125,-0.0625,0.0625,0.5}, --nodebox8
	{0.0625,-0.3125,0.3125,0.125,-0.25,0.5}, --nodebox9
	{-0.125,-0.3125,0.3125,-0.0625,-0.25,0.5}, --nodebox10
}

streets.rules_pole =
{
    {x= 0, y= 0, z=-1},
    {x= 1, y= 0, z= 0},
    {x=-1, y= 0, z= 0},
    {x= 0, y= 0, z= 1},
    {x= 1, y= 1, z= 0},
    {x= 1, y=-1, z= 0},
    {x=-1, y= 1, z= 0},
    {x=-1, y=-1, z= 0},
    {x= 0, y= 1, z= 1},
    {x= 0, y=-1, z= 1},
    {x= 0, y= 1, z=-1},
    {x= 0, y=-1, z=-1},
    {x= 0, y=-1, z= 0},
    {x= 0, y= 1, z= 0}
}

streets.on_digiline_receive = function(pos, node, channel, msg)
	local setchan = minetest.get_meta(pos):get_string("channel")
	if setchan ~= channel then
		return
	end
	-- Tl states
	if msg == "OFF" then
	
	elseif msg == "GREEN" then
	
	elseif msg == "RED" then
		local fd = minetest.get_node(pos).param2
		minetest.set_node(pos, {name = "streets:trafficlight_top_red", param2 = fd})
	elseif msg == "WARN" then
	
	end
end

minetest.register_node(":streets:digiline_distributor",{
	description = S("Digiline distributor"),
	tiles = {"streets_lampcontroller_top.png","streets_lampcontroller_bottom.png","streets_lampcontroller_sides.png"},
	groups = {cracky = 1},
	digiline = {
		receptor = {},
		effector = {},
		wire = {
			rules = streets.rules_pole
		}
	}
})

minetest.register_node(":streets:trafficlight_top_off",{
	description = S("Trafficlight"),
	drawtype="nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 1, level = 2},
	inventory_image = "streets_trafficlight_inv.png",
	light_source = 11,
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = streets.tlBox
	},
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_off.png"},
	digiline = {
		receptor = {},
		effector = {
			action = function(pos, node, channel, msg)
				streets.on_digiline_receive(pos, node, channel, msg)
			end
		}
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[channel;Channel;${channel}]")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		if (fields.channel) then
			minetest.get_meta(pos):set_string("channel", fields.channel)
		end
	end,
})

minetest.register_node(":streets:trafficlight_top_red",{
	description = S("U cheater U"),
	drop = "",
	groups = {cracky = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_red.png"},
	node_box = {
		type = "fixed",
		fixed = streets.tlBox
	},
	light_source = 6,
})

minetest.register_node(":streets:trafficlight_top_yellow",{
	description = S("U cheater U"),
	drop = "",
	groups = {cracky = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_yellow.png"},
	node_box = {
		type = "fixed",
		fixed = streets.tlBox
	},
	light_source = 6,
})

minetest.register_node(":streets:trafficlight_top_redyellow",{
	description = S("U cheater U"),
	drop = "",
	groups = {cracky = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_redyellow.png"},
	node_box = {
		type = "fixed",
		fixed = streets.tlBox
	},
	light_source = 6,
})

minetest.register_node(":streets:trafficlight_top_green",{
	description = S("U cheater U"),
	drop = "",
	groups = {cracky = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_green.png"},
	node_box = {
		type = "fixed",
		fixed = streets.tlBox
	},
	light_source = 6,
})

minetest.register_node(":streets:trafficlight_top_warn",{
	description = S("U cheater U"),
	drop = "",
	groups = {cracky = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png",{
		name="streets_tl_warn.png",
		animation={type="vertical_frames", aspect_w=64, aspect_h=64, length=1.5},
	}},
	node_box = {
		type = "fixed",
		fixed = streets.tlBox
	},
	light_source = 6,
})