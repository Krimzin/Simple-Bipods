Hooks:Add("MenuManagerInitialize", "SimpleBipods_menu", function ()
	function MenuCallbackHandler:SimpleBipods_forward_ray_length(item)
		local value = math.round(item:value())
		item:set_value(value)
		SimpleBipods:set_option("forward_ray_length", value)
	end

	function MenuCallbackHandler:SimpleBipods_draw_rays(item)
		SimpleBipods:set_option("draw_rays", item:value() == "on")
	end

	function MenuCallbackHandler:SimpleBipods_back()
		SimpleBipods:save()
	end

	MenuHelper:LoadFromJsonFile(SimpleBipods.mod_options_path, SimpleBipods, SimpleBipods.options)
end)