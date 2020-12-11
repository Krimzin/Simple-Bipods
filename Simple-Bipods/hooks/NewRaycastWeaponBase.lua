Hooks:PostHook(NewRaycastWeaponBase, "clbk_assembly_complete", "SimpleBipods_set_is_local_player", function (self)
	if self:is_npc() then
		return
	end

	local bipods = managers.weapon_factory:get_parts_from_weapon_by_perk("bipod", self._parts)
	for i = 1, #bipods do
		local bipod_base = bipods[i].unit:base()
		if bipod_base.set_is_local_player then
			bipod_base:set_is_local_player(true)
		end
	end
end)