Hooks:PostHook(BlackMarketGui, "_buy_mod_callback", "CustomDefaultReticles_apply_default", function (self, data)
    local default = CustomDefaultReticles:get_data_string(data.name)
    if default then
        managers.blackmarket:set_part_texture_switch(data.category, data.slot, data.name, default)
        self:reload()
    end
end)