Hooks:Add("LocalizationManagerPostInit", "SimpleBipodsLocalization", function (self)
	local lang_key = SystemInfo:language():key()
	local lang_file_name = "english.txt"
	for _, file_name in pairs(file.GetFiles(SimpleBipods.localization_path)) do
		if Idstring(file_name:match("^(.*).txt$")):key() == lang_key then
			lang_file_name = file_name
			break
		end
	end
	local lang_path = SimpleBipods.localization_path .. lang_file_name
	if io.file_is_readable(lang_path) then
		self:load_localization_file(lang_path)
	end
end)
