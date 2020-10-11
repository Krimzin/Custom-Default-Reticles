function MenuCallbackHandler:CustomDefaultReticles_set_default()
	local logic = managers.menu:active_menu().logic
	local node = logic:selected_node()
	local data = node:parameters().menu_component_data
	CustomDefaultReticles:set_data_string(data.name, node:item("reticle_color"):value(), node:item("reticle_type"):value())
	CustomDefaultReticles:save()
	logic:refresh_node(node, data)
end

Hooks:PostHook(MenuReticleSwitchInitiator, "setup_node", "CustomDefaultReticles_setup_node", function (self, node, data)
	local data_node = nil
	local name = "CustomDefaultReticles_set_default"
	local config = {
		name = name,
		text_id = name,
		align = "left",
		callback = name
	}
	local items = node:items()
	local index = #items
	for i, item in pairs(items) do
		if item:name() == "reticle_color" then
			index = i
		end
	end
	node:insert_item(node:create_item(data_node, config), index + 1)
	self:refresh_node(node, data)
end)

Hooks:PostHook(MenuReticleSwitchInitiator, "refresh_node", "CustomDefaultReticles_refresh_node", function (self, node, data)
	local enable = MenuCallbackHandler:is_reticle_applicable(node)
	local default = CustomDefaultReticles:get_data_string(node:parameters().menu_component_data.name)
	if enable and default then
		local data_string = node:item("reticle_color"):value() .. " " .. node:item("reticle_type"):value()
		enable = data_string ~= default
	end
	node:item("CustomDefaultReticles_set_default"):set_enabled(enable)
end)
