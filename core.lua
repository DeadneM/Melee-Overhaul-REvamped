-- Defines the Global Function
if not _G.MeleeOptions then
	_G.MeleeOptions = {}
end
-- ]

-- Mod file paths for future references [
MeleeOptions._path = ModPath
MeleeOptions._opts_path = SavePath .. "melee_opts.txt"
MeleeOptions._opts = {}
-- ]

-- Various melee option variables [
MeleeOptions._notif = {
	id = "mel_rev_notif",
	version = "5.37a",
	title = "Melee Overhaul REvamped [ALPHA]  v",
	priority = 1,
	message1 = "\nThank you for installing M.O.RE!\nBugs will be common in the alpha stage!",
	message2 = "\n\n[Click to View M.O.RE Steam Group]"
}

MeleeOptions.effects = {
	"effects/payday2/particles/impacts/fallback_impact_pd2",
	"effects/payday2/particles/impacts/blood/blood_impact_a",
	"effects/payday2/particles/impacts/shotgun_explosive_round",
	"effects/particles/dest/security_camera_dest"
}

MeleeOptions.decapitation_effects = {
	{"effects/payday2/particles/impacts/blood/blood_impact_a"},
	{"effects/payday2/particles/impacts/blood/blood_tendrils"},
	{"effects/payday2/particles/impacts/blood/blood_small_dust"},
	{"effects/payday2/particles/impacts/blood/blood_light_red"},
	{"effects/particles/bullet_hit/flesh/bullet_impact_flesh_04", 1}
}

MeleeOptions.hand_warmers = {
	[1] = {Idstring("effects/particles/fire/small_light_fire"), 0},
	[2] = {Idstring("effects/payday2/particles/character/taser_hittarget"), 9},
	[3] = {Idstring("effects/payday2/particles/character/taser_stop"), 1},
	[4] = {Idstring("effects/payday2/particles/character/taser_thread"), 9},
	[5] = {Idstring("effects/payday2/particles/weapons/saw/sawing"), 0},
	[6] = {Idstring("effects/payday2/environment/drill"), 0},
	[7] = {Idstring("effects/payday2/environment/drill_jammed"), 0},
	[8] = {Idstring("effects/payday2/particles/character/flyes_plague"), 0},
	[9] = {Idstring("effects/payday2/particles/character/overkillpack/chains_eyes"), 0},
	[10] = {Idstring("effects/payday2/particles/character/overkillpack/hoxton_eyes"), 0}
}

MeleeOptions.load_fx = {
	"effects/payday2/particles/character/flyes_plague",
	"effects/payday2/particles/character/overkillpack/chains_eyes",
	"effects/payday2/particles/character/overkillpack/hoxton_eyes"
}

MeleeOptions.can_breach = {
	-- Doors
	["@ID08a33537c9d0673a@"] = true,
	["@ID18a7caca12899b38@"] = true,
	["@ID851f3239dec9d210@"] = true,
	["@ID622b34ce3cd1d3bb@"] = true,
	["@ID1d283db01fc4a72b@"] = true,
	["@IDcffcea35596d6b53@"] = true,
	
	-- Barricades
	["@IDb55faf1195846400@"] = true,
	["@IDb524e472a247f6ff@"] = true,
	["@IDb71bf75755b6181b@"] = true,
	["@IDe86b68a126c540da@"] = true,
	["@ID945dcbc3586178cd@"] = true
}

MeleeOptions.breaching_tools = {
	["baseballbat"] = true,
	["barbedwire"] = true,
	["dingdong"] = true,
	["fireaxe"] = true,
	["alien_maul"] = true,
	["mining_pick"] = true,
	["branding_iron"] = true,
	["sandsteel"] = true,
	["great"] = true,
	["morning"] = true,
	["gator"] = true,
	["iceaxe"] = true
}

MeleeOptions.melee_penalty = {
	["alien_maul"] = 0.95,
	["branding_iron"] = 0.95,
	["briefcase"] = 0.95,
	["croupier_rake"] = 0.9,
	["ding_dong"] = 0.9,
	["fireaxe"] = 0.9,
	["freedom"] = 0.9,
	["micstand"] = 0.9,
	["mining_pick"] = 0.9,
	["shovel"] = 0.95,
	["slot_lever"] = 0.9,
	["tomahawk"] = 0.9,
	["hockey"] = 0.95,
	["great"] = 0.8,
	["morning"] = 0.9,
	["beardy"] = 0.9,
	["cutters"] = 0.95,
	["iceaxe"] = 0.9,
	["pitchfork"] = 0.9
}

MeleeOptions.is_blunt = {
	["weapon"] = true,
	["fists"] = true,
	["brass_knuckles"] = true,
	["moneybundle"] = true,
	["barbedwire"] = true,
	["boxing_gloves"] = true,
	["whiskey"] = true,
	["alien_maul"] = true,
	["shovel"] = true,
	["baton"] = true,
	["dingdong"] = true,
	["baseballbat"] = true,
	["briefcase"] = true,
	["model24"] = true,
	["shillelagh"] = true,
	["hammer"] = true,
	["spatula"] = true,
	["tenderizer"] = true,
	["branding_iron"] = true,
	["microphone"] = true,
	["oldbaton"] = true,
	["detector"] = true,
	["micstand"] = true,
	["hockey"] = true,
	["slot_lever"] = true,
	["croupier_rake"] = true,
	["taser"] = true,
	["fight"] = true,
	["buck"] = true,
	["morning"] = true,
	["cutters"] = true,
	["selfie"] = true,
	["stick"] = true,
	["zeus"] = true
}

MeleeOptions.is_small_blade = {
	["kabartanto"] = true,
	["toothbrush"] = true,
	["chef"] = true,
	["kabar"] = true,
	["rambo"] = true,
	["kampfmesser"] = true,
	["gerber"] = true,
	["becker"] = true,
	["x46"] = true,
	["bayonet"] = true,
	["bullseye"] = true,
	["cleaver"] = true,
	["fairbair"] = true,
	["meat_cleaver"] = true,
	["fork"] = true,
	["poker"] = true,
	["scalper"] = true,
	["bowie"] = true,
	["switchblade"] = true,
	["tiger"] = true,
	["cqc"] = true,
	["twins"] = true,
	["pugio"] = true,
	["boxcutter"] = true,
	["shawn"] = true,
	["scoutknife"] = true,
	["nin"] = true,
	["ballistic"] = true
}

-- ]

-- M.O.RE's PlayerStandard.lua settings (best not to touch...) [
MeleeOptions.equip_weapon_wanted = MeleeOptions.equip_weapon_wanted
MeleeOptions.switch_wanted = MeleeOptions.switch_wanted
MeleeOptions.switch_wanted_data = MeleeOptions.switch_wanted_data
MeleeOptions.last_melee_t = MeleeOptions.last_melee_t
MeleeOptions.unequip_weapon_expire_t = MeleeOptions.unequip_weapon_expire_t
MeleeOptions.in_melee_mode = MeleeOptions.in_melee_mode
MeleeOptions.auto_melee = MeleeOptions.auto_melee
MeleeOptions.flame_lhand = MeleeOptions.flame_lhand
MeleeOptions.flame_rhand = MeleeOptions.flame_rhand
MeleeOptions.effect_t = MeleeOptions.effect_t
MeleeOptions.not_first_strike = MeleeOptions.not_first_strike
MeleeOptions.gadgets = MeleeOptions.gadgets or {}
MeleeOptions.cop_explode = {t = {}}
MeleeOptions.cop_pager = {units = {}}
MeleeOptions.cop_decapitation = {
	t = {},
	interval = {},
	vfx = {},
	ragdoll = {},
	attacker_unit = {},
	parts = {}
}
MeleeOptions.cop_taser = {}
MeleeOptions.grinder_t = MeleeOptions.grinder_t
MeleeOptions.sociopath_t = MeleeOptions.sociopath_t
MeleeOptions.timer = MeleeOptions.timer
MeleeOptions.hold_melee = MeleeOptions.hold_melee
MeleeOptions.voice_charged = MeleeOptions.voice_charged
MeleeOptions.can_decapitate = MeleeOptions.can_decapitate

MeleeOptions.page_number = MeleeOptions.page_number
-- ]

-- M.O.RE's Post-Required Script Locations [
MeleeOptions.HookFiles = {
	["lib/managers/menumanager"] = "lua/MenuManager.lua",
	["lib/managers/menu/blackmarketgui"] = "lua/BlackMarketGUI.lua",
	["lib/tweak_data/blackmarkettweakdata"] = "lua/BlackMarketTweakData.lua",
	["lib/units/enemies/cop/copdamage"] = "lua/CopDamage.lua",
	["lib/units/enemies/cop/copmovement"] = "lua/CopMovement.lua",
	["lib/units/beings/player/states/playerbleedout"] = "lua/PlayerBleedOut.lua",
	["lib/units/beings/player/playerdamage"] = "lua/PlayerDamage.lua",
	["lib/units/beings/player/states/playerstandard"] = "lua/PlayerStandard.lua",
	["lib/managers/statisticsmanager"] = "lua/StatisticsManager.lua",
}
-- ]

function MeleeOptions:view_changelog()
	Steam:overlay_activate("url", "http://steamcommunity.com/groups/PD2_MORE")
end

function MeleeOptions:Save(no_check)
	if not no_check and not self._opts.is_member then
		self._opts = {}
		self:DisplayNonMember(tostring(Steam:username()))
		return
	end
	local data = io.open( self._opts_path, "w+" )
	if data then
		data:write( json.encode( self._opts ) )
		data:close()
	end
end

function MeleeOptions:Load()
	local data = io.open( self._opts_path, "r" )
	if data then
		self._opts = json.decode( data:read("*all") )
		data:close()
	end
	
	-- Loads to default value when needed to be true. [[
	if self._opts.push2hold_enabled == nil then
		self._opts.push2hold_enabled = true
	end
	if self._opts.notification_enabled == nil then
		self._opts.notification_enabled = true
	end
	-- ]]
end

Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_MeleeOptions", function(loc)
	loc:add_localized_strings({
		-- All Melee Descriptions
		["bm_melee_weapon_info"] = "In armed robberies, beating the victims with firearms is usually more common than to shoot or stab them. You usually either Buttstroke someone with a rifle or pistol-whip them with a handgun.\n\nThis is the quickest melee attack.",
		["bm_melee_fists_info"] = "You're no boxer, but you can still throw a pretty good punch. All it takes is some strength, speed and timing and you'll land a striking blow in no-time.",
		["bm_melee_kabar_info"] = "The URSA Knife is a hard wearing, indestructible fighting/utility knife dating back to 1942. Bowie blade, serrated edge, no nonsense. A Classic.",
		["bm_melee_rambo_info"] = "The Trautman Knife is a survival knife with a heavy bowie blade. The length, serrated spine and centered tip works just as well in the wilderness as it does in closed combat.",
		["bm_melee_gerber_info"] = "The Berger Combat Knife is a popular tactical knife with a folding clip point blade. Compact, light and high tech materials makes a fast and dangerous tool.",
		["bm_melee_kampfmesser_info"] = "The Krieger Blade is the standard knife of the Germany Army. Great grip, and the Tanto Blade makes it an excellent choice for combat.",
		["bm_melee_brass_knuckles_info"] = "Knuckle style weapons have been used all over the world for hundreds of years. Brass knuckles concentrate the punch's force by directing it toward a harder and smaller area, increasing the chances of tissue disruption. Hit hard enough and you'll even fracture some bones.",
		["bm_melee_tomahawk_info"] = "Historically used as a general purpose tool, for throwing at people and the occasional hand-to-hand melee. Only through proper heisting can one begin to realize the full potential of the tomahawk as both a tool and a weapon. But mostly a weapon.",
		["bm_melee_baton_info"] = "Every heisters and law enforcers favourite weapon for crowd control and dispersal of non-compliant people. Lightweight and effective, more versatile and looks more intimidating to any potential aggressor.",
		["bm_melee_shovel_info"] = "The K.L.A.S. shovel is used by military forces for a variety of purposes. It can also be used as a weapon - sharpen the edges and you'll be cutting through flesh and bone. If you use it correctly, that is.",
		["bm_melee_becker_info"] = "The machete is a large cleaver-like knife frequently used in tropical countries. It is common to see people using machetes for other jobs as well, such as splitting open coconuts, skulls, yard work, and robbing banks.",
		["bm_melee_moneybundle_info"] = "L-O-D-S of E-M-O-N-E\n\nWhat does that spell?\nLOADSA MONEY! (Probably...)\n\nSing a song of six pence, a pocket full of dosh...",
		["bm_melee_baseballbat_info"] = "A baseball bat you can hit homeruns with. Who knows? This could end up saving your life in an apocalypse or something.",
		["bm_melee_x46_info"] = "The X-46 starts as a bar of A2 tool steel which is turned on a CNC lathe and then hogged flat by step milling. The multi-purpose field design of this knife makes it as useful on the battlefield as it is in the bush.",
		["bm_melee_dingdong_info"] = "A sledgehammer. A battering ram. A pry bar. All three are essential breaching tools for operators or heisters who need to get through doors quickly.",
		["bm_melee_bayonet_info"] = "Bayonets are usually attached to rifles - whilst they can be used as a simple knife, some are specifically-designed to be used in conjunction with the rifle. However, they both serve the same purpose nonetheless...",
		["bm_melee_bullseye_info"] = "The Compact Hatchet features a comfortable rubber handle that makes field dressing (or bank robbing) games in wet environments manageable.",
		["bm_melee_bat_info"] = "Mainly used in a classic traditional sport, others use it to smash the heads and helmets of law enforcement and mobsters.\n\nDo you like hurting people?",
		["bm_melee_cleaver_info"] = "Who knew bikers were such great chefs? They could chop up anything they see!\n\n\"Secret Within - Sweden\"",
		["bm_melee_fireaxe_info"] = "While this is mainly used to break away structures with ease, it is also effective against law enforcement or people in general. Oh, goody!",
		["bm_melee_machete_info"] = "Don't mind its rather primitive design. It has been hacking up and dicing people ever since the '80s!\n\nDo you like hurting people?",
		["bm_melee_briefcase_info"] = "We are the 50 Blessings. We are the legion.\nWe do not forgive. We do not forget.\n\nWe also do not like it when you don't respond to our hotlines...",
		["bm_melee_kabar_tanto_info"] = "The URSA Tanto knife is an exclusive, indestructible fighting/utility knife. It has a tanto blade, shaped like the tip of a Katana; polymer grip; stealth black design. A modern take on the classic URSA knife.",
		["bm_melee_toothbrush_info"] = "Shanks and shivs are commonly crafted by prisoners, looks like Hoxton gave us a delightful present. Just don't leave these toothbrushes in a panic room as they might \"change\".",
		["bm_melee_chef_info"] = "The chef knife was made infamous by a motel owner from a while back. Be on a look out for these knives when you take a shower.",
		["bm_melee_fairbair_info"] = "The Fairbairn Sykes trench knife was typically used for trench warfare, jabbing and thrusting the blade inside the enemy. It works just the same outside of trenches.",
		["bm_melee_freedom_info"] = "Does the sweet smell of liberty empower you to commit a heist? Well then, give those cops the freedom they deserve with this all time classic.",
		["bm_melee_model24_info"] = "Not sure if this is still cooking, might as well keep on bashing skulls with it before the unexpected happens.",
		["bm_melee_swagger_info"] = "A Swagger Stick is a short stick, cane or riding crop usually carried by an official or otherwise important figure in the military as a symbol of authority. It was commonly used to beat subordinates as punishment for various mistakes.",
		["bm_melee_alien_maul_info"] = "01010111 01100101 00100000 01100011 01101111 01101101 01100101 00100000 01101001 01101110 00100000 01110000 01100101 01100001 01100011 01100101 00100001",
		["bm_melee_shillelagh_info"] = "It's hard to determine the true origins of the shillelagh. How can you pinpoint the first time someone picked up a stout stick and brained someone else with it? But, at the end of the day, it really is just a bloody heavy stick that cracks skulls.",
		["bm_melee_boxing_gloves_info"] = "\"Why do you wanna fight?\"\n- \"Because I can't sing or dance.\"\n\n\"You're gonna eat lightnin' and you're gonna crap thunder!\"",
		["bm_melee_meat_cleaver_info"] = "The cleaver is a kind of knife primarily used for cutting through meat and bone, delivering powerful hammer-like blows that rend even the most durable flesh. Easily concealable, inexpensive, and a marked effect on both the target's psyche and body.",
		["bm_melee_hammer_info"] = "The Carpenter's Delight is Jacket's favourite hammer. The hammer is the perfect tool to deliver blunt blows to people you don't like. The most common uses for hammers are to drive nails and break apart objects, none of which Jacket cares for particularly much.",
		["bm_melee_whiskey_info"] = "Don't waste a perfectly good bottle, go swing it around at someone and make good use of it.\n\nPlease drink responsibly.",
		["bm_melee_fork_info"] = "What's the difference between a truckload of bowling balls and a truckload of dead dozers? You can't unload a truckload of bowling balls with the Motherforker. Enjoy with pepper seasoning.",
		["bm_melee_poker_info"] = "A long piece of iron with a pointy end is a fine implement for tending to smoldering embers, but it is also the perfect implement for causing havoc and extreme discomfort. If you don't believe us, ask your server for an \"Edward II\".",
		["bm_melee_spatula_info"] = "A melee weapon with a dual purpose - use it to smear a cop all across the road, and then let others use it to scoop up their remains. Take an extra napkin for this one.",
		["bm_melee_tenderizer_info"] = "While it was mainly designed for softening and flattening tough strips of steak, it has also proven useful for softening and flattening tough strips of cop. Goes great with a light hollandaise.",
		["bm_melee_scalper_info"] = "For the victor, it is the symbol of war, of power and of dominance. For the loser, it is the symbol of a really bad haircut.",
		["bm_melee_mining_pick_info"] = "There's gold in 'dem 'der hills! And by hills we mean teeth. But, hills or teeth, nothing digs the gold out faster than a swinging spike of pig iron.",
		["bm_melee_branding_iron_info"] = "It may have been designed to mark the thick hides of cattle for identification, but fire-heated iron is even more effective against the soft flesh of a deputy or marshall.",
		["bm_melee_bowie_info"] = "Nine inches of clip-point fighting steel. It's origins lie in the age of the classic pirate, but it was the famous Brawl of Carroll County (and a dozen bloodied men) that brought it wide-spread fame.",
		["bm_melee_microphone_info"] = "Don't think the microphone is working properly, try hitting it a few times with your hand to check the sound. Actually, just bash it in on someone's head just to make sure.",
		["bm_melee_detector_info"] = "Metal detectors are useful for finding metal inclusions hidden within objects, or metal objects buried underground. They are also useful for smashing and bashing nevertheless.",
		["bm_melee_micstand_info"] = "Having trouble with fans always getting in the way during concerts? Just knock them back down with this beautifully crafted stand.",
		["bm_melee_oldbaton_info"] = "WOLOLOLOLOLOLOLO-\n\n\"I'm gonna beat the cellulites out of you!\"\n\"I've got your DLC right fucking here!\"",
		["bm_melee_hockey_info"] = "A beautifully fashioned length of wood. Perfectly suited for smashing a puck into the net, and smashing the fuck out of teeth.",
		["bm_melee_switchblade_info"] = "Commonly used for settling the score between two New York teenage street gangs in the fifties. You can even sing along.",
		["bm_melee_taser_info"] = "This is the one you have been waiting for. Exact sweet, electrifying revenge against those smug tasers. Eat it, lightning bolt!",
		["bm_melee_slot_lever_info"] = "A sad (and hilarious) remnant of a week-long Vegas binge gone too far. Bludgeon cops with the power of poor luck and poor life decisions.",
		["bm_melee_croupier_rake_info"] = "An item for the sole use of pulling currency in? Perfect for you heisters! Show those pesky cops exactly why the house always wins.",
		["bm_melee_fight_info"] = "No student questioning the Empty Palm Kata technique survived, as Master Hito offered them a chance to block it, without mercy.",
		["bm_melee_tiger_info"] = "Originally used to scale walls and trees, these sharp claws swiftly turned into weapons when whoever wielded them was discovered.",
		["bm_melee_cqc_info"] = "Even the mightiest of opponents will fall when touched a single time by the poison dipped Kunai Knife.",
		["bm_melee_twins_info"] = "Once in a while, a victim of the Okinawan Style Sai realize a little too late that it doesn't matter how blunt the weapons are. In a matter of seconds they have disarmed you of your sharp ones.",
		["bm_melee_sandsteel_info"] = "The Shinsakuto-Katana is a masterpiece, but also freshly forged. It has not tasted blood, and has no real heritage or history. It is simply waiting for a wielder with which to create that.",
		["bm_melee_great_info"] = "The sword made famous by William Wallace. Six feet of razor-sharp steel, it was carried in a scabbard made from the skin of a tax-man. How's that for sticking it to the authorities?",
		["bm_melee_beardy_info"] = "The Vikings emerged from the dark forests of the pagan North, and left a bloody trail of destruction from Iceland to Istanbul. Their weapon was the two-handed bearded axe.",
		["bm_melee_buck_info"] = "In the right hands, the Buckler Shield was as much a weapon as a means of defense. Worn on the forearm, it could be slammed into an enemy with enough force to knock them out of their breeches.",
		["bm_melee_morning_info"] = "If the deep punctures from the spikes don't kill you, the catastrophic trauma from the blunt head certainly will. This weapon left a swathe of mangled bodies on the medieval battlefield.",
		["bm_melee_boltcutter_info"] = "Your favorite serial killers need more than just an axe, a knife or a glove with razor fingers. They need Bolt Cutters to quietly get into those places you thought were locked. Where you thought you were safe...",
		["bm_melee_topaz_info"] = "When you're scaling the slick cliff beneath Angel Falls, you need something that can gouge into the hard rock. When you're robbing banks in D.C., you need something that can gouge into the helmets of cops.",
		["bm_melee_selfie_info"] = "As Hoxton said, \"Look at that fucking berk with the selfie-stick. What a bellend. I bet it's strong, though. Y'know, I should take it off him and twat him with it. Back in a mo...\"",
		["bm_melee_gator_info"] = "They say you can last three weeks without food, and three days without water, but in a hostile environment you won't last three hours without a good blade at your side.",
		["bm_melee_pugio_info"] = "Simple and strong. Whether you're cutting throats, or cutting dolphins free of tangling nets, it gets the job done. And it looks badass on your hip when you come swaggering out of the surf.",
		["bm_melee_boxcutter_info"] = "It may seem like a utilitarian tool but if this blade can cut through the tough-bastard vacuum-sealed plastic of packaging crates, it can deal with anything the cops might wrap themselves in.",
		["bm_melee_shawn_info"] = "Did you know that Sheep shearing is considered a sport? Maybe we should invent a new sport: cop shearing? No? Why not? Whatever... use them however you see fit, I guess...",
		["bm_melee_pitchfork_info"] = "Bidents, tridents, who cares? They're basically pitch forks. If Poseidon and Lucifer can use them, so can we. When the cops show up to interrupt your heisting, show them that villager spirit and chase them away like they are Frankenstein's Monster.",
		["bm_melee_stick_info"] = "Tired after a long heist? Want to look old and wise? Maybe smash a cop's face in? The Shepherd's cane can do it all.",
		["bm_melee_scoutknife_info"] = "Don't let the rusty and worn appearance turn you off. A knife is always a knife - and some say an old knife ages just like a good wine (no one has probably ever said that). Try it out and you'll see things will bleed.",
		["bm_melee_nin_info"] = "Wolf's favorite nailgun. When people ask about the name Wolf is quick to correct it to \"The Punder\" and as they say that he screams: \"Nailed it!\"",
		["bm_melee_ballistic_info"] = "Knives with a detachable blade that can be ejected to a distance of several yards by pressing a trigger or operating a lever or switch on the handle. These ones are jammed to hell but they still serve the purpose of making things bleed.",
		["bm_melee_zeus_info"] = "This piece of melee equipment might look unstable. But relax, it was made by some kid on the internet, so it’s perfectly safe! Homebrewed and experimental electricity in a gloriously stunning way."
		--["bm_melee__info"] = ""
	})

	MeleeOptions:Load()
	
	if MeleeOptions._opts.language == 2 then
		loc:load_localization_file(MeleeOptions._path .. "loc/ru.txt")
	else
		loc:load_localization_file(MeleeOptions._path .. "loc/en.txt")
	end
end)

Hooks:Add("MenuManagerInitialize", "MenuManagerInitialize_MeleeOptions", function( menu_manager )
	
	MenuCallbackHandler.clbk_mel_tog_push2hold = function(self, item)
		MeleeOptions._opts.push2hold_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save(true)
	end
	
	MenuCallbackHandler.clbk_mel_tog_time_hold = function(self, item)
		MeleeOptions._opts.time_hold_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save(true)
	end
	
	MenuCallbackHandler.clbk_mel_time_hold = function(self, item)
		MeleeOptions._opts.timer = math.round_with_precision( item:value(), 2 )
		MeleeOptions:Save(true)
	end
	
	MenuCallbackHandler.clbk_mel_tog_notification = function(self, item)
		MeleeOptions._opts.notification_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save(true)
	end
	
	MenuCallbackHandler.clbk_mel_lang = function(self, item)
		MeleeOptions._opts.language = item:value()
		MeleeOptions:Save(true)
	end
	
	MenuCallbackHandler.clbk_mel_tog_effects = function(self, item)
		MeleeOptions._opts.effects_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_blunt_force = function(self, item)
		MeleeOptions._opts.blunt_force_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_blunt_force_opt = function(self, item)
		MeleeOptions._opts.blunt_force_opt = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_superman = function(self, item)
		MeleeOptions._opts.superman_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_blunt_force_hit_sound = function(self, item)
		MeleeOptions._opts.blunt_force_hit_sound = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_silly_weapon = function(self, item)
		MeleeOptions._opts.silly_weapon_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_heat = function(self, item)
		MeleeOptions._opts.heat_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_heat_opt = function(self, item)
		MeleeOptions._opts.heat_opt = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_heat_place_opt = function(self, item)
		MeleeOptions._opts.heat_place_opt = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_effect = function(self, item)
		MeleeOptions._opts.effect = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_force = function(self, item)
		MeleeOptions._opts.force_mul = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_flame_melee = function(self, item)
		MeleeOptions._opts.flame_melee_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_flame_melee_opt = function(self, item)
		MeleeOptions._opts.flame_melee_opt = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_cop_explode = function(self, item)
		MeleeOptions._opts.cop_explode_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_explode_force = function(self, item)
		MeleeOptions._opts.explode_force_mul = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_cop_explode_opt = function(self, item)
		MeleeOptions._opts.cop_explode_opt = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_cop_explode_effects = function(self, item)
		MeleeOptions._opts.cop_explode_effects_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_explode_contour = function(self, item)
		MeleeOptions._opts.explode_contour_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_decapitation = function(self, item)
		MeleeOptions._opts.decapitation_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_decapitation_melee_realistic = function(self, item)
		MeleeOptions._opts.realistic_gore = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_decapitation_opt = function(self, item)
		MeleeOptions._opts.decapitation_opt = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_decapitation_weapon = function(self, item)
		MeleeOptions._opts.decapitation_weapons = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_decapitation_time = function(self, item)
		MeleeOptions._opts.decapitation_time = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_decapitation_interval = function(self, item)
		MeleeOptions._opts.decapitation_interval = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_decapitation_twitch = function(self, item)
		MeleeOptions._opts.twitch_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_decapitation_spurt = function(self, item)
		MeleeOptions._opts.blood_spurt = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_decapitation_blood = function(self, item)
		MeleeOptions._opts.blood_fx = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_decapitation_threshold = function(self, item)
		MeleeOptions._opts.decapitation_threshold_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_decapitation_threshold = function(self, item)
		MeleeOptions._opts.decapitation_threshold = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_decapitation_scream = function(self, item)
		MeleeOptions._opts.scream_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_decapitation_cloaker = function(self, item)
		MeleeOptions._opts.dismember_cloaker = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_decapitation_push = function(self, item)
		MeleeOptions._opts.decap_push_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_flame_melee_fx = function(self, item)
		MeleeOptions._opts.handy_fx = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_silly_weapon_opt = function(self, item)
		MeleeOptions._opts.silly_weapon_opt = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_shake = function(self, item)
		MeleeOptions._opts.shaking_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_callout = function(self, item)
		MeleeOptions._opts.callout_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_callout_charge = function(self, item)
		MeleeOptions._opts.callout_charge_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_callout_block = function(self, item)
		MeleeOptions._opts.callout_block_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_callout_chance = function(self, item)
		MeleeOptions._opts.callout_chance = item:value()
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_buzzer = function(self, item)
		MeleeOptions._opts.buzzer_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_tog_buzzer_full = function(self, item)
		MeleeOptions._opts.buzzer_full_enabled = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_fix_loop = function(self, item)
		MeleeOptions._opts.loop_fix = (item:value() == "on" and true or false)
		MeleeOptions:Save(true)
	end
	
	MenuCallbackHandler.clbk_mel_fix_grinder = function(self, item)
		MeleeOptions._opts.grinder_fix = (item:value() == "on" and true or false)
		MeleeOptions:Save(true)
	end
	
	MenuCallbackHandler.clbk_mel_fix_sociopath = function(self, item)
		MeleeOptions._opts.sociopath_fix = (item:value() == "on" and true or false)
		MeleeOptions:Save(true)
	end
	
	MenuCallbackHandler.clbk_mel_fix_interact = function(self, item)
		MeleeOptions._opts.interact_fix = (item:value() == "on" and true or false)
		MeleeOptions:Save(true)
	end
	
	MenuCallbackHandler.clbk_mel_fix_gagehud = function(self, item)
		MeleeOptions._opts.gagehud_fix = (item:value() == "on" and true or false)
		MeleeOptions:Save(true)
	end
	
	MenuCallbackHandler.clbk_mel_fix_pocohud = function(self, item)
		MeleeOptions._opts.pocohud_fix = (item:value() == "on" and true or false)
		MeleeOptions:Save(true)
	end
	
	MenuCallbackHandler.clbk_mel_real_drain = function(self, item)
		MeleeOptions._opts.stamina_drain = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	MenuCallbackHandler.clbk_mel_real_weight = function(self, item)
		MeleeOptions._opts.melee_weight = (item:value() == "on" and true or false)
		MeleeOptions:Save()
	end
	
	Steam:http_request("http://steamcommunity.com/gid/8773421/memberslistxml/?xml=1&p=1", MeleeOptions._on_group_received)
	
	MeleeOptions:Load()
	
	MenuHelper:LoadFromJsonFile(MeleeOptions._path .. "opt/MeleeOptions.txt", MeleeOptions, MeleeOptions._opts)
	
	MenuHelper:LoadFromJsonFile(MeleeOptions._path .. "opt/MeleeBluntForceTrauma.txt", MeleeOptions, MeleeOptions._opts)
	MenuHelper:LoadFromJsonFile(MeleeOptions._path .. "opt/MeleeDecapitations.txt", MeleeOptions, MeleeOptions._opts)
	MenuHelper:LoadFromJsonFile(MeleeOptions._path .. "opt/MeleeEffects.txt", MeleeOptions, MeleeOptions._opts)
	MenuHelper:LoadFromJsonFile(MeleeOptions._path .. "opt/MeleeFixes.txt", MeleeOptions, MeleeOptions._opts)
	MenuHelper:LoadFromJsonFile(MeleeOptions._path .. "opt/MeleeHandyFX.txt", MeleeOptions, MeleeOptions._opts)
	MenuHelper:LoadFromJsonFile(MeleeOptions._path .. "opt/MeleeHeatOfTheMoment.txt", MeleeOptions, MeleeOptions._opts)
	MenuHelper:LoadFromJsonFile(MeleeOptions._path .. "opt/MeleeHumanTimeBombs.txt", MeleeOptions, MeleeOptions._opts)
	MenuHelper:LoadFromJsonFile(MeleeOptions._path .. "opt/MeleeRealism.txt", MeleeOptions, MeleeOptions._opts)
	MenuHelper:LoadFromJsonFile(MeleeOptions._path .. "opt/MeleeSilly.txt", MeleeOptions, MeleeOptions._opts)
	MenuHelper:LoadFromJsonFile(MeleeOptions._path .. "opt/MeleeCallouts.txt", MeleeOptions, MeleeOptions._opts)
	MenuHelper:LoadFromJsonFile(MeleeOptions._path .. "opt/MeleeMisc.txt", MeleeOptions, MeleeOptions._opts)
	
end)

function MeleeOptions:DisplayNonMember(username)
	local menu_title = "[" .. utf8.char(57363) .. "]" .. " ERROR: You're not a M.O.RE Member yet! :("
	local menu_message = "Greetings " .. username .. ",\n\nIt seems that you're not a member of the Melee Overhaul REvamped Steam Group yet. Joining the group gives exclusives to the mod including these cosmetic options!\n\nIf you just recently joined, the member list may take time to update!\n\nWhen you decide to join, please restart your game after joining! Please be patient, the member list takes some time to update before it registers you as a member.\n\nWould you like to join?"
	local menu_options = {
		[1] = {
			text = "Sure, take me to the group page!",
			callback = MeleeOptions.display_group_page,
		},
		[2] = {
			text = "No thanks.",
			is_cancel_button = true,
		},
	}
	local menu = QuickMenu:new( menu_title, menu_message, menu_options )
	menu:Show()
end

function MeleeOptions._on_group_received(success, page)
	if not MeleeOptions.page_number then
		MeleeOptions.page_number = 1
	end

	if success and string.find(page, "<steamID64>" .. Steam:userid() .. "</steamID64>") then
		MeleeOptions._opts.is_member = true
		MeleeOptions:Save()
		MeleeOptions._notif.message1 = "\n[] Official M.O.RE Member (online)\n" .. MeleeOptions._notif.message1
		return
	else
		if not MeleeOptions._opts.is_member and success and string.find(page, "<nextPageLink>") then
			MeleeOptions.page_number = (MeleeOptions.page_number or 1) + 1
			Steam:http_request("http://steamcommunity.com/gid/8773421/memberslistxml/?xml=1&p=" .. tostring(MeleeOptions.page_number), MeleeOptions._on_group_received)
			return
		end
	end
	
	MeleeOptions:Load()
	if MeleeOptions._opts.is_member == true then
		MeleeOptions._notif.message1 = "\n[] Official M.O.RE Member (offline)\n" .. MeleeOptions._notif.message1
		return
	else
		MeleeOptions._opts = {}
	end
end

function MeleeOptions.display_group_page()
	Steam:overlay_activate("url", "http://steamcommunity.com/groups/PD2_MORE")
end

local open_url = open_url or function()
	MeleeOptions:view_changelog()
end

Hooks:Add("MenuManagerOnOpenMenu", "MenuManagerOnOpenMenu_MeleeOptions", function( menu_manager, menu, position )

	Steam:http_request("http://steamcommunity.com/gid/8773421/memberslistxml/?xml=1", MeleeOptions._on_group_received)

	if menu == "menu_main" and MeleeOptions._opts.notification_enabled then
		NotificationsManager:AddNotification( MeleeOptions._notif.id, MeleeOptions._notif.title .. MeleeOptions._notif.version, MeleeOptions._notif.message1 .. MeleeOptions._notif.message2, MeleeOptions._notif.priority, open_url )
	end

end)

-- Executes and calls such scripts [
if RequiredScript then
	local requiredScript = RequiredScript:lower()
	if MeleeOptions.HookFiles[requiredScript] then
		dofile( MeleeOptions._path .. MeleeOptions.HookFiles[requiredScript] )	
	end
end
-- ]