Hooks:PostHook(PlayerBipod, "set_camera_positions", "SimpleBipods_unset_camera_positions", function (self)
	self._shoulder_pos = nil
	self._camera_pos = nil
end)