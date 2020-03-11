MeleeOverhaul.MenuOptions = MeleeOverhaul.MenuOptions or {}
MeleeOverhaul.MenuOptions.Menu = {

	[ "MeleeOverhaulMenuMainOptions" ] = {
		"more_options_main_options_menu_title",
		"more_options_main_options_menu_desc",
		1
	},
	
	[ "MeleeOverhaulMenuGoreOptions" ] = {
		"more_options_gore_options_menu_title",
		"more_options_gore_options_menu_desc"
	},
	
	[ "MeleeOverhaulMenuEffectsOptions" ] = {
		"more_options_effects_options_menu_title",
		"more_options_effects_options_menu_desc"
	},
	
	[ "MeleeOverhaulMenuMiscellaneousOptions" ] = {
		"more_options_miscellaneous_options_menu_title",
		"more_options_miscellaneous_options_menu_desc"
	},
	
	[ "MeleeOverhaulMenuExtrasOptions" ] = {
		"more_options_extras_options_menu_title",
		"more_options_extras_options_menu_desc"
	},
	
	[ "MeleeOverhaulMenuStatistics" ] = {
		"more_options_statistics_menu_title",
		"more_options_statistics_menu_desc",
		3,
		{ focus_changed_callback = "MeleeOverhaulMenuStatisticsFocus" }
	}

}
MeleeOverhaul.MenuOptions.Toggle = {

	[ "MeleeHold" ] = {
		"MeleeOverhaulMenuMainOptions",
		"more_options_toggle_melee_hold_title",
		"more_options_toggle_melee_hold_desc",
		true
	},
	
	[ "MeleeHoldTime" ] = {
		"MeleeOverhaulMenuMainOptions",
		"more_options_toggle_melee_hold_timer_title",
		"more_options_toggle_melee_hold_timer_desc",
		false
	},
	
	[ "TaseEffect" ] = {
		"MeleeOverhaulMenuEffectsOptions",
		"more_options_toggle_tase_visual_title",
		"more_options_toggle_tase_visual_desc",
		false
	},
	
	[ "MessageOfTheDay" ] = {
		"MeleeOverhaulMenuMiscellaneousOptions",
		"more_options_toggle_motd_title",
		"more_options_toggle_motd_desc",
		true
	},
	
	[ "Decapitation" ] = {
		"MeleeOverhaulMenuGoreOptions",
		"more_options_toggle_decapitation_title",
		"more_options_toggle_decapitation_desc",
		false
	},
	
	[ "TrueDecapitation" ] = {
		"MeleeOverhaulMenuGoreOptions",
		"more_options_toggle_true_decapitation_title",
		"more_options_toggle_true_decapitation_desc",
		false
	},
	
	[ "RealisticGore" ] = {
		"MeleeOverhaulMenuGoreOptions",
		"more_options_toggle_realistic_gore_title",
		"more_options_toggle_realistic_gore_desc",
		false
	},
	
	[ "BluntForceTrauma" ] = {
		"MeleeOverhaulMenuGoreOptions",
		"more_options_toggle_blunt_force_trauma_title",
		"more_options_toggle_blunt_force_trauma_desc",
		false
	},
	
	[ "Decals" ] = {
		"MeleeOverhaulMenuEffectsOptions",
		"more_options_toggle_decal_title",
		"more_options_toggle_decal_desc",
		false
	},
	
	[ "MeleeSprinting" ] = {
		"MeleeOverhaulMenuExtrasOptions",
		"more_options_toggle_melee_sprinting_title",
		"more_options_toggle_melee_sprinting_desc",
		false
	},
	
	[ "MeleeHeadshots" ] = {
		"MeleeOverhaulMenuExtrasOptions",
		"more_options_toggle_melee_headshots_title",
		"more_options_toggle_melee_headshots_desc",
		false
	},
	
	[ "MeleeBreaching" ] = {
		"MeleeOverhaulMenuExtrasOptions",
		"more_options_toggle_melee_breaching_title",
		"more_options_toggle_melee_breaching_desc",
		false
	},
	
	[ "MeleeEnhancers" ] = {
		"MeleeOverhaulMenuExtrasOptions",
		"more_options_toggle_melee_enhancer_title",
		"more_options_toggle_melee_enhancer_desc",
		false
	},
	
	[ "PagerSnatch" ] = {
		"MeleeOverhaulMenuExtrasOptions",
		"more_options_toggle_pager_snatch_title",
		"more_options_toggle_pager_snatch_desc",
		false
	},

	[ "MeleeTweak" ] = {
		"MeleeOverhaulMenuExtrasOptions",
		"more_options_toggle_melee_tweak_title",
		"more_options_toggle_melee_tweak_desc",
		false
	}

}
MeleeOverhaul.MenuOptions.Slider = {

	[ "MeleeHoldTimer" ] = {
		"MeleeOverhaulMenuMainOptions",
		"more_options_slider_melee_hold_time_title",
		"more_options_slider_melee_hold_time_desc",
		0,
		5,
		0.5,
		1
	},
	
	[ "BluntForceMultiplier" ] = {
		"MeleeOverhaulMenuGoreOptions",
		"more_options_slider_blunt_force_multiplier_title",
		"more_options_slider_blunt_force_multiplier_desc",
		1,
		10,
		0.5,
		1
	},
	
	[ "ShakeIntensity" ] = {
		"MeleeOverhaulMenuEffectsOptions",
		"more_options_slider_shake_intensity_title",
		"more_options_slider_shake_intensity_desc",
		0,
		1,
		0.25,
		1
	}

}
MeleeOverhaul.MenuOptions.MultipleChoice = {

	[ "HandEffect" ] = {
		"MeleeOverhaulMenuEffectsOptions",
		"more_options_choice_hand_effect_title",
		"more_options_choice_hand_effect_desc",
		{
			{ "more_options_choice_hand_effect_a" },
			{ "more_options_choice_hand_effect_b" , "effects/particles/fire/small_light_fire" },
			{ "more_options_choice_hand_effect_c" , "effects/payday2/particles/character/taser_hittarget" },
			{ "more_options_choice_hand_effect_d" , "effects/payday2/particles/character/taser_stop" },
			{ "more_options_choice_hand_effect_e" , "effects/payday2/particles/character/taser_thread" },
			{ "more_options_choice_hand_effect_f" , "effects/payday2/particles/weapons/saw/sawing" },
			{ "more_options_choice_hand_effect_g" , "effects/payday2/environment/drill" },
			{ "more_options_choice_hand_effect_h" , "effects/payday2/environment/drill_jammed" },
			{ "more_options_choice_hand_effect_i" , "effects/payday2/particles/character/flyes_plague" },
			{ "more_options_choice_hand_effect_j" , "effects/payday2/particles/character/overkillpack/hoxton_eyes" },
			{ "more_options_choice_hand_effect_k" , "effects/payday2/particles/character/overkillpack/chains_eyes" },
			{ "more_options_choice_hand_effect_l" , "effects/payday2/particles/character/overkillpack/mega_alien_eyes" },
			{ "more_options_choice_hand_effect_m" , "effects/payday2/particles/character/hurt_poison" },
			{ "more_options_choice_hand_effect_n" , "effects/payday2/particles/character/smoking_head" }
		},
		1
	},
	
	[ "ImpactEffect" ] = {
		"MeleeOverhaulMenuEffectsOptions",
		"more_options_choice_impact_effect_title",
		"more_options_choice_impact_effect_desc",
		{
			{ "more_options_choice_impact_effect_a" },
			{ "more_options_choice_impact_effect_b" , "effects/payday2/particles/impacts/blood/blood_impact_a" },
			{ "more_options_choice_impact_effect_c" , "effects/payday2/particles/impacts/shotgun_explosive_round" },
			{ "more_options_choice_impact_effect_d" , "effects/particles/dest/security_camera_dest" },
			{ "more_options_choice_impact_effect_e" , {
				"effects/payday2/economy/particles/explosions/safe_eco_explosion_01",
				"effects/payday2/economy/particles/explosions/safe_eco_explosion_02",
				"effects/payday2/economy/particles/explosions/safe_eco_explosion_03",
				"effects/payday2/economy/particles/explosions/safe_eco_explosion_04",
				"effects/payday2/economy/particles/explosions/safe_eco_explosion_05"
			}}
		},
		1
	},
	
	[ "SpurtEffect" ] = {
		"MeleeOverhaulMenuGoreOptions",
		"more_options_choice_spurt_effect_title",
		"more_options_choice_spurt_effect_desc",
		{
			{ "more_options_choice_spurt_effect_a" },
			{ "more_options_choice_spurt_effect_b" , "effects/payday2/particles/impacts/blood/blood_tendrils" , 1 },
			{ "more_options_choice_spurt_effect_c" , "effects/particles/bullet_hit/flesh/bullet_hit_blood" , 2 }
		},
		1
	}

}

MeleeOverhaul.DynamicResources = {
	{ "effect" , "effects/payday2/economy/particles/explosions/safe_eco_explosion_01" },
	{ "effect" , "effects/payday2/economy/particles/explosions/safe_eco_explosion_02" },
	{ "effect" , "effects/payday2/economy/particles/explosions/safe_eco_explosion_03" },
	{ "effect" , "effects/payday2/economy/particles/explosions/safe_eco_explosion_04" },
	{ "effect" , "effects/payday2/economy/particles/explosions/safe_eco_explosion_05" },
	{ "effect" , "effects/payday2/particles/character/flyes_plague" },
	{ "effect" , "effects/payday2/particles/character/overkillpack/chains_eyes" },
	{ "effect" , "effects/payday2/particles/character/overkillpack/hoxton_eyes" },
	{ "effect" , "effects/payday2/particles/character/overkillpack/mega_alien_eyes" },
	{ "effect" , "effects/payday2/particles/character/hurt_poison" },
	{ "effect" , "effects/payday2/particles/character/smoking_head" }
}

MeleeOverhaul.BluntWeapons = {
	"weapon",
	"fists",
	"brass_knuckles",
	"moneybundle",
	"barbedwire",
	"boxing_gloves",
	"whiskey",
	"alien_maul",
	"shovel",
	"baton",
	"dingdong",
	"baseballbat",
	"briefcase",
	"model24",
	"shillelagh",
	"hammer",
	"spatula",
	"tenderizer",
	"branding_iron",
	"microphone",
	"oldbaton",
	"detector",
	"micstand",
	"hockey",
	"slot_lever",
	"croupier_rake",
	"taser",
	"fight",
	"buck",
	"morning",
	"cutters",
	"selfie",
	"stick",
	"zeus",
	"road",
	"brick",
	"cs",
	"road"
}

MeleeOverhaul.SmallBladedWeapons = {
	"kabartanto",
	"toothbrush",
	"chef",
	"kabar",
	"rambo",
	"kampfmesser",
	"gerber",
	"becker",
	"x46",
	"bayonet",
	"bullseye",
	"cleaver",
	"fairbair",
	"meat_cleaver",
	"fork",
	"poker",
	"scalper",
	"bowie",
	"switchblade",
	"tiger",
	"cqc",
	"twins",
	"pugio",
	"boxcutter",
	"shawn",
	"scoutknife",
	"nin",
	"ballistic",
	"wing",
	"catch",
	"sword",
	"agave",
	"ostry",
	"grip"
}

MeleeOverhaul.Enhancements = {
	"electric",
	"poison",
	"incinerated",
	"blood_lust",
	"kleptomaniac",
	"aftershock",
	"swiftness"
}
table.sort( MeleeOverhaul.Enhancements )

MeleeOverhaul.RestrictedEnhancements = {
	[ "taser" ] = true,
	[ "cqc" ] 	= true,
	[ "zeus" ] 	= true
}

MeleeOverhaul.EnhancementCooldown = {
	[ "incinerated" ] 	= 10,
	[ "blood_lust" ] 	= 0.5,
	[ "kleptomaniac" ] 	= 3,
	[ "aftershock" ] 	= 10,
	[ "swiftness" ] 	= 3.5
}

MeleeOverhaul.BreachUnits = {
	-- Doors
	"@ID08a33537c9d0673a@",
	"@ID18a7caca12899b38@",
	"@ID851f3239dec9d210@",
	"@ID622b34ce3cd1d3bb@",
	"@ID1d283db01fc4a72b@",
	"@IDcffcea35596d6b53@",
	
	-- Barricades
	"@IDb55faf1195846400@",
	"@IDb524e472a247f6ff@",
	"@IDb71bf75755b6181b@",
	"@IDe86b68a126c540da@",
	"@ID945dcbc3586178cd@"
}