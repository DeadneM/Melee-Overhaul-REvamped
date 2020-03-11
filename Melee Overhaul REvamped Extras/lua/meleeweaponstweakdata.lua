Hooks:PostHook( BlackMarketTweakData , "_init_melee_weapons" , "MeleeOverhaulExtrasBlackMarketTweakDataPostInitMeleeWeapons" , function( self , tweak_data )

	if MeleeOverhaul:HasSetting( "MeleeTweak" ) then
		for k , v in pairs( self.melee_weapons ) do
			local charge = v.stats.charge_time and ( v.stats.charge_time / 2 ) or 0
			local delay = v.melee_damage_delay and ( v.melee_damage_delay + 1 ) or 1

			v.stats.min_damage = ( v.stats.min_damage + charge ) * delay
			v.stats.max_damage = ( v.stats.max_damage + charge ) * delay
			v.stats.min_damage_effect = ( v.stats.min_damage_effect + ( charge / 2 ) ) * delay
			v.stats.max_damage_effect = ( v.stats.max_damage_effect + ( charge / 2 ) ) * delay
		end
	end

	if MeleeOverhaul:HasSetting( "MeleeEnhancers" ) then
		for k , v in pairs( self.melee_weapons ) do
			if MeleeOverhaul.RestrictedEnhancements[ k ] then
				v.no_enhance = true
				MeleeOverhaul.Options[ k ] = nil
			end
			if MeleeOverhaul.Options[ k ] then
				if MeleeOverhaul.Options[ k ] == "electric" then
					v.special_weapon = "taser"
					v.stats.min_damage = v.stats.min_damage * 0.5
					v.stats.max_damage = v.stats.min_damage
				elseif MeleeOverhaul.Options[ k ] == "poison" then
					v.dot_data = {
						type = "poison",
						custom_data = { dot_length = 1 , hurt_animation_chance = 0.7 }
					}
					v.stats.min_damage = v.stats.min_damage * 0.75
					v.stats.max_damage = v.stats.max_damage * 0.75
				end
			end
		end
	end

end )