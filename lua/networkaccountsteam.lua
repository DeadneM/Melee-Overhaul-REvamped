Hooks:PostHook( NetworkAccountSTEAM , "init" , "MeleeOverhaulNetworkAccountSTEAMPostInit" , function( self )

	MeleeOverhaul.Stats = MeleeOverhaul.Stats or {
		killed = {
			type = nil,
			gui = "guis/textures/pd2/blackmarket/icons/melee_weapons/weapon",
			value = 0
		},
		used = {
			type = nil,
			gui = "guis/textures/pd2/blackmarket/icons/melee_weapons/weapon",
			value = 0
		},
		kpu = {
			type = nil,
			gui = "guis/textures/pd2/blackmarket/icons/melee_weapons/weapon",
			value = 0
		}
	}
	
	MeleeOverhaul.Database = MeleeOverhaul.Database or {}
	MeleeOverhaul.Database.MeleeWeapons = MeleeOverhaul.Database.MeleeWeapons or {}
	
	for k , v in pairs( tweak_data.blackmarket.melee_weapons ) do
		local kstat = self:get_stat( "melee_kills_" .. k )
		local ustat = self:get_stat( "melee_used_" .. k )
		local pstat = kstat / ( ustat > 0 and ustat or 1 )
		
		table.insert( MeleeOverhaul.Database.MeleeWeapons , { k , kstat , ustat , pstat , "" } )
		
		if MeleeOverhaul.Stats.killed.value < kstat then
			MeleeOverhaul.Stats.killed.type = k
			MeleeOverhaul.Stats.killed.value = kstat
		end
		
		if MeleeOverhaul.Stats.used.value < ustat then
			MeleeOverhaul.Stats.used.type = k
			MeleeOverhaul.Stats.used.value = ustat
		end
		
		if MeleeOverhaul.Stats.kpu.value < pstat then
			MeleeOverhaul.Stats.kpu.type = k
			MeleeOverhaul.Stats.kpu.value = pstat
		end
	end
	
	local sort_alphabet = function( a , b )
		return managers.localization:text( tweak_data.blackmarket.melee_weapons[ a[ 1 ] ].name_id ) < managers.localization:text( tweak_data.blackmarket.melee_weapons[ b[ 1 ] ].name_id )
	end
	table.sort( MeleeOverhaul.Database.MeleeWeapons , sort_alphabet )
	
	for k , v in pairs( MeleeOverhaul.Stats ) do
		if v.type then
			local guis_catalog = "guis/"
			local bundle = tweak_data.blackmarket.melee_weapons[ v.type ].texture_bundle_folder
			
			if bundle then
				guis_catalog = guis_catalog .. "dlcs/" .. tostring( bundle ) .. "/"
			end
			
			v.gui = guis_catalog .. "textures/pd2/blackmarket/icons/melee_weapons/" .. v.type
		end
	end
	
	for k , v in pairs( MeleeOverhaul.Database.MeleeWeapons ) do
		if v[ 1 ] then
			local guis_catalog = "guis/"
			local bundle = tweak_data.blackmarket.melee_weapons[ v[ 1 ] ].texture_bundle_folder
			
			if bundle then
				guis_catalog = guis_catalog .. "dlcs/" .. tostring( bundle ) .. "/"
			end
			
			v[ 5 ] = guis_catalog .. "textures/pd2/blackmarket/icons/melee_weapons/" .. v[ 1 ]
		end
	end

end )