CustomDefaultReticles = {
	mod_path = ModPath,
	save_path = SavePath .. "CustomDefaultReticles.txt",
	localization_path = ModPath .. "localization/",
	data = {}
}

function CustomDefaultReticles:save()
	local file = io.open(self.save_path, "w+")
	if file then
		file:write(json.encode(self.data))
		file:close()
	end
end

function CustomDefaultReticles:load()
	local file = io.open(self.save_path, "r")
	if file then
		self.data = json.decode(file:read("*a"))
		file:close()
	end
end

function CustomDefaultReticles:set_data_string(part_id, color_index, type_index)
	self.data[part_id] = color_index .. " " .. type_index
end

function CustomDefaultReticles:get_data_string(part_id)
	return self.data[part_id]
end

CustomDefaultReticles:load()