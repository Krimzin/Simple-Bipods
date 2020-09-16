SimpleBipods = {
	mod_path = ModPath,
	save_path = SavePath .. "simple_bipods.txt",
	localization_path = ModPath .. "localization/",
	mod_options_path = ModPath .. "mod_options.txt",
	options = {
		forward_ray_length = 70,
		draw_rays = false
	}
}

function SimpleBipods:save()
	local file = io.open(self.save_path, "w+")
	if file then
		file:write(json.encode(self.options))
		file:close()
	end
end

function SimpleBipods:load()
	local file = io.open(self.save_path, "r")
	if file then
		self.options = json.decode(file:read("*a"))
		file:close()
	end
end

function SimpleBipods:set_option(name, value)
	self.options[name] = value
end

function SimpleBipods:option(name)
	return self.options[name]
end

SimpleBipods:load()
