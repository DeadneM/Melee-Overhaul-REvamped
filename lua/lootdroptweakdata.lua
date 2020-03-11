Hooks:PostHook( LootDropTweakData , "init" , "MeleeOverhaulLootDropTweakDataPostInit" , function( self , tweak_data )

	-- Fixes the 50 Blessings Brief Case localization error
	self.global_values.hlm_game.desc_id = self.global_values.hl_miami.desc_id

end )