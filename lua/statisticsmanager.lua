function StatisticsManager:session_favourite_weapon()
	local weapon_id = nil
	local variant = nil
	local count = 0
	
	for id, data in pairs(self._global.session.killed_by_weapon) do
		if count < data.count then
			count = data.count
			weapon_id = id
			variant = "weapon"
		end
	end
	
	for id, data in pairs(self._global.session.killed_by_melee) do
		if count < data then
			count = data
			weapon_id = managers.blackmarket:equipped_melee_weapon()
			variant = "melee"
		end
	end
	
	local weapon_tweak_data = tweak_data.weapon[weapon_id]
	local melee_tweak_data = tweak_data.blackmarket.melee_weapons[weapon_id]
	
	if not weapon_tweak_data or melee_tweak_data then
		return managers.localization:text("debug_undecided")
	end
	
	return ((variant == "weapon" and managers.localization:text(weapon_tweak_data.name_id) or variant == "melee" and managers.localization:text(melee_tweak_data.name_id)) .. "(" .. count .. ")") or managers.localization:text("debug_undecided")
end