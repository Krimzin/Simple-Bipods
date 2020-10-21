Hooks:PostHook(PlayerTweakData, "_init_new_stances", "SimpleBipods_init_stances", function (self)
	local stances = self.stances
	stances.hk21.bipod.shoulders.translation = Vector3(-8.55, 20, -1.8)
	stances.m249.bipod.shoulders.translation = Vector3(-10.725, 20, -4)
	stances.rpk.bipod.shoulders.translation = Vector3(-10.7, 20, -0.5)
	stances.rpk.bipod.shakers = stances.rpk.bipod.shakers or {}
	stances.rpk.bipod.shakers.breathing = stances.rpk.bipod.shakers.breathing or {}
	stances.rpk.bipod.shakers.breathing.amplitude = 0
	stances.mg42.bipod.shoulders.translation = Vector3(-10.725, 20, -3.8)
	stances.mg42.bipod.shakers = stances.mg42.bipod.shakers or {}
	stances.mg42.bipod.shakers.breathing = stances.mg42.bipod.shakers.breathing or {}
	stances.mg42.bipod.shakers.breathing.amplitude = 0
	stances.par.bipod.shoulders.translation = Vector3(-10.22, 20, -1.1)
	stances.m60.bipod.shoulders.translation = Vector3(-10.75, 20, -5.5)
	stances.m60.bipod.shoulders.rotation = Rotation(-0.3, 0.086, -0.628)
end)