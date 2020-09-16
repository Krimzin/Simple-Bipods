function WeaponLionGadget1:_shoot_bipod_rays()
	local camera = managers.player:player_unit():camera()
	local point_1 = camera:position()
	local point_2 = mvector3.copy(point_1)
	mvector3.add_scaled(point_2, camera:forward(), SimpleBipods:option("forward_ray_length"))
	local point_3 = mvector3.copy(point_2)
	mvector3.add_scaled(point_3, -camera:rotation():z(), 100)
	local obstacle = self._unit:raycast(point_1, point_2)
	local surface = self._unit:raycast(point_2, point_3)
	local success = not obstacle and surface and surface.ray:angle(surface.normal) > 135
	return point_1, point_2, point_3, obstacle, surface, success
end

function WeaponLionGadget1:_is_deployable(draw_rays)
	if self._is_npc or self:_is_in_blocked_deployable_state() then
		return false
	end

	local point_1, point_2, point_3, obstacle, surface, success = self:_shoot_bipod_rays()
	if success then
		self._from = point_2
		self._to = point_3
		return true
	end
	return false
end

function WeaponLionGadget1:is_usable()
	return self._unit:raycast(self._from, self._to) and true or false
end

Hooks:PostHook(WeaponLionGadget1, "update", "SimpleBipodsDrawRays", function (self)
	if managers.player:player_unit() and SimpleBipods:option("draw_rays") then
		local point_1, point_2, point_3, obstacle, surface, success = self:_shoot_bipod_rays()
		if obstacle then
			Application:draw_line(point_1, point_2, 1, 0, 0)
			Application:draw_line(point_2, point_3, 1, 0, 0)
		else
			Application:draw_line(point_1, point_2, 0, 1, 0)
			if surface then
				if success then
					Application:draw_line(point_2, point_3, 0, 1, 0)
				else
					Application:draw_line(point_2, point_3, 1, 1, 0)
				end
			else
				Application:draw_line(point_2, point_3, 1, 0, 0)
			end
		end
	end
end)

Hooks:PostHook(WeaponLionGadget1, "check_state", "SimpleBipodsEnableUpdate", function (self)
	self._unit:set_extension_update_enabled(Idstring("base"), true)
end)
