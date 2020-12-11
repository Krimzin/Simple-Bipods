Hooks:Add("LocalizationManagerPostInit", "SimpleBipods_localization", function (self)
	local path = SimpleBipods.localization_path
	local key = SystemInfo:language():key()
	local file_name = "english.txt"
	for _, name in ipairs(file.GetFiles(path)) do
		if Idstring(name:match("^(.*).txt$")):key() == key then
			file_name = name
			break
		end
	end
	local path = path .. file_name
	if io.file_is_readable(path) then
		self:load_localization_file(path)
	end
end)