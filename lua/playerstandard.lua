function PlayerStandard:_is_melee_instant()
	return tweak_data.blackmarket.melee_weapons[ managers.blackmarket:equipped_melee_weapon() ].instant
end

function PlayerStandard:_check_action_melee( t , input )
	
	if self._state_data.melee_attack_wanted or ( self._state_data.meleeing and input.btn_primary_attack_state ) then
		if not self._state_data.melee_attack_allowed_t then
			self._state_data.melee_attack_wanted = nil
			self:_do_action_melee( t , input )
		end
		return
	end
	
	local action_wanted = input.btn_melee_press or ( input.btn_melee_release and not self._state_data.melee_hold ) or input.btn_primary_attack_press or self._state_data.melee_charge_wanted or ( MeleeOverhaul:HasSetting( "MeleeHold" ) and self._state_data.melee_hold )
	
	if not action_wanted then
		return
	end
	
	if input.btn_primary_attack_press or ( input.btn_melee_release and not self._state_data.melee_hold ) then
		if self._state_data.meleeing then
			if self._state_data.melee_attack_allowed_t then
				self._state_data.melee_attack_wanted = true
				return
			end
			self:_do_action_melee( t , input )
		end
		return
	end
	
	if input.btn_melee_press then
		if self._state_data.meleeing and MeleeOverhaul:HasSetting( "MeleeHold" ) then
			if not self._state_data.melee_attack_allowed_t then
				self:_interupt_action_melee( t )
				return
			end
		end
		if self._state_data.melee_expire_t and self._state_data.melee_hold then
			self._state_data.melee_hold = nil
			return
		end
	end
	
	local action_forbidden = not self:_melee_repeat_allowed() or self._use_item_expire_t or self:_changing_weapon() or self:_interacting() or self:_is_throwing_projectile() or self:_is_using_bipod()
	
	if action_forbidden then
		return
	end
	
	if not self._state_data.melee_hold then
		self._state_data.melee_hold = MeleeOverhaul:HasSetting( "MeleeHold" ) and not MeleeOverhaul:HasSetting( "MeleeHoldTime" ) and not self:_is_melee_instant() and true
	end
	
	self:_start_action_melee( t , input , self:_is_melee_instant() )
	return true
	
end

Hooks:PreHook( PlayerStandard , "_start_action_melee" , "MeleeOverhaulExtrasPlayerStandardPreStartActionMelee" , function( self , t , input , instant )

	self._state_data.melee_running_wanted = MeleeOverhaul:HasSetting( "MeleeSprinting" ) and self._running and not self._end_running_expire_t

end )

Hooks:PostHook( PlayerStandard , "_start_action_melee" , "MeleeOverhaulPlayerStandardPostStartActionMelee" , function( self , t , input , instant )

	if MeleeOverhaul:HasSetting( "MeleeHold" ) and MeleeOverhaul:HasSetting( "MeleeHoldTime" ) then
		self._state_data.melee_hold_t = t + MeleeOverhaul:HasSetting( "MeleeHoldTimer" )
	end
	
	if self._state_data.melee_running_wanted then
		self._running_wanted = true
	end
	self._state_data.melee_running_wanted = nil

end )

Hooks:PostHook( PlayerStandard , "_do_action_melee" , "MeleeOverhaulPlayerStandardPostDoActionMelee" , function( self , t , input , skip_damage )
	
	self._state_data.melee_hold_t = nil
	self._state_data.melee_voice_charged = nil

end )

Hooks:PreHook( PlayerStandard , "_do_melee_damage" , "MeleeOverhaulPlayerStandardPreDoMeleeDamage" , function( self , t , bayonet_melee , melee_hit_ray )

	if MeleeOverhaul:HasSetting( "Decapitation" ) then
		local LeftArm = {
			[ Idstring( "hit_LeftArm" ):key() ] = true,
			[ Idstring( "hit_LeftForeArm" ):key() ] = true,
			[ Idstring( "rag_LeftArm" ):key() ] = true,
			[ Idstring( "rag_LeftForeArm" ):key() ] = true
		}
		local RightArm = {
			[ Idstring( "hit_RightArm" ):key() ] = true,
			[ Idstring( "hit_RightForeArm" ):key() ] = true,
			[ Idstring( "rag_RightArm" ):key() ] = true,
			[ Idstring( "rag_RightForeArm" ):key() ] = true
		}
		local LeftLeg = {
			[ Idstring( "LeftUpLeg" ):key() ] = true,
			[ Idstring( "LeftLeg" ):key() ] = true,
			[ Idstring( "rag_LeftUpLeg" ):key() ] = true,
			[ Idstring( "rag_LeftLeg" ):key() ] = true
		}
		local RightLeg = {
			[ Idstring( "RightUpLeg" ):key() ] = true,
			[ Idstring( "RightLeg" ):key() ] = true,
			[ Idstring( "rag_RightUpLeg" ):key() ] = true,
			[ Idstring( "rag_RightLeg" ):key() ] = true
		}
		
		local BodyParts = {
			iLeftArm = {
				"LeftArm",
				"LeftForeArm",
				"LeftHand"
			},
			iRightArm = {
				"RightArm",
				"RightForeArm",
				"RightHand"
			},
			iLeftLeg = {
				"LeftLeg",
				"LeftFoot"
			},
			iRightLeg = {
				"RightLeg",
				"RightFoot"
			}
		}
		
		local function get_limb( i )
			if LeftArm[ i ] then
				return "LeftArm"
			elseif RightArm[ i ] then
				return "RightArm"
			elseif LeftLeg[ i ] then
				return "LeftLeg"
			elseif RightLeg[ i ] then
				return "RightLeg"
			else
				return nil
			end
		end
		
		local melee_entry = managers.blackmarket:equipped_melee_weapon()
		local sphere_cast_radius = 20
		local col_ray
		
		if melee_hit_ray then
			col_ray = melee_hit_ray ~= true and melee_hit_ray or nil
		else
			col_ray = self:_calc_melee_hit_ray( t , sphere_cast_radius )
		end
		
		local melee_type = tweak_data.blackmarket.melee_weapons[ melee_entry ].melee_type
		
		if col_ray and alive( col_ray.unit ) then
			if col_ray.unit and col_ray.unit:character_damage() and col_ray.unit:character_damage():dead() and col_ray.body and col_ray.body:name() then
				if not MeleeOverhaul:HasSetting( "RealisticGore" ) or ( MeleeOverhaul:HasSetting( "RealisticGore" ) and melee_type == "LargeBladed" ) then
					if get_limb( col_ray.body:name():key() ) then
						for k , v in ipairs( BodyParts[ "i" .. get_limb( col_ray.body:name():key() ) ] ) do
							col_ray.unit:body( col_ray.unit:get_object( Idstring( v ) ) ):set_enabled( false )
						end
						col_ray.unit:movement():add_dismemberment( get_limb( col_ray.body:name():key() ) )
						col_ray.unit:sound():play("split_gen_body")
					end
				end
			end
		end
	end
	
	if MeleeOverhaul:HasSetting( "ImpactEffect" ) then
		if MeleeOverhaul.MenuOptions.MultipleChoice[ "ImpactEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "ImpactEffect" ) ] and MeleeOverhaul.MenuOptions.MultipleChoice[ "ImpactEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "ImpactEffect" ) ][ 2 ] then
			local sphere_cast_radius = 20
			local col_ray
			
			if melee_hit_ray then
				col_ray = melee_hit_ray ~= true and melee_hit_ray or nil
			else
				col_ray = self:_calc_melee_hit_ray( t , sphere_cast_radius )
			end
			
			local r = MeleeOverhaul.MenuOptions.MultipleChoice[ "ImpactEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "ImpactEffect" ) ][ 2 ]
			if type( r ) == "table" then
				r = MeleeOverhaul.MenuOptions.MultipleChoice[ "ImpactEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "ImpactEffect" ) ][ 2 ][ math.random( #MeleeOverhaul.MenuOptions.MultipleChoice[ "ImpactEffect" ][ 4 ][ MeleeOverhaul:HasSetting( "ImpactEffect" ) ][ 2 ] ) ]
			end
			
			if col_ray then
				managers.game_play_central:play_impact_sound_and_effects({
					col_ray 	= col_ray,
					effect 		= Idstring( r ),
					no_decal 	= true,
					no_sound 	= true
				})
			end
		end
	end

	if MeleeOverhaul:HasSetting( "Decals" ) then
		local melee_entry = managers.blackmarket:equipped_melee_weapon()
		local sphere_cast_radius = 20
		local col_ray
		
		if melee_hit_ray then
			col_ray = melee_hit_ray ~= true and melee_hit_ray or nil
		else
			col_ray = self:_calc_melee_hit_ray( t , sphere_cast_radius )
		end
		
		if col_ray and alive( col_ray.unit ) then
			local melee_type = MeleeOverhaul:MeleeType( melee_entry )

			managers.game_play_central:play_impact_sound_and_effects({
				col_ray 	= col_ray,
				no_sound 	= true,
				decal 		= ( melee_type == "SmallBladed" or melee_type == "LargeBladed" ) and "saw" or "bullet_hit"
			})
		end
	end

end )

Hooks:PostHook( PlayerStandard , "_do_melee_damage" , "MeleeOverhaulExtrasPlayerStandardPostDoMeleeDamage" , function( self , t , bayonet_melee , melee_hit_ray )

	local melee_entry = managers.blackmarket:equipped_melee_weapon()
	local instant_hit = tweak_data.blackmarket.melee_weapons[ melee_entry ].instant
	local melee_damage_delay = tweak_data.blackmarket.melee_weapons[melee_entry].melee_damage_delay or 0
	local charge_lerp_value = instant_hit and 0 or self:_get_melee_charge_lerp_value( t , melee_damage_delay )
	
	if MeleeOverhaul:HasSetting( "MeleeBreaching" ) then
		local melee_entry = managers.blackmarket:equipped_melee_weapon()
		local sphere_cast_radius = 20
		local col_ray
		
		if melee_hit_ray then
			col_ray = melee_hit_ray ~= true and melee_hit_ray or nil
		else
			col_ray = self:_calc_melee_hit_ray( t , sphere_cast_radius )
		end
		
		if col_ray and alive( col_ray.unit ) then
			if col_ray.unit:damage() and col_ray.body:extension() and col_ray.body:extension().damage then
				local _ , damage = managers.blackmarket:equipped_melee_weapon_damage_info( charge_lerp_value )
				damage = damage * math.max( managers.player:upgrade_value( "player" , "melee_knockdown_mul" , 1 ), managers.player:upgrade_value( self._equipped_unit:base():weapon_tweak_data().category , "melee_knockdown_mul" , 1 ) )
				
				if damage >= 8 then
					local hit , _ = col_ray.body:extension().damage:damage_lock( managers.player:player_unit() , col_ray.normal , col_ray.position , col_ray.ray , damage / 5 )
					
					if hit then
						managers.hud:on_crit_confirmed()

						if col_ray.unit:id() ~= -1 then
							managers.network:session():send_to_peers_synched( "sync_body_damage_lock" , col_ray.body , damage / 5 )
						end
						
						managers.game_play_central:play_impact_sound_and_effects({
							col_ray 	= col_ray,
							decal 		= "saw"
						})
					end
				end
			end
		end
		
		if managers.interaction:active_unit() and melee_entry == "cutters" then
			if managers.interaction:active_unit():interaction().tweak_data == "cut_fence" then
				managers.interaction:active_unit():interaction():interact( managers.player:player_unit() )
			end
		end
	end
	
	if MeleeOverhaul:HasSetting( "MeleeEnhancers" ) then
		local melee_entry = managers.blackmarket:equipped_melee_weapon()
		
		if not self._state_data.melee_enhancement_expire_t then
			if MeleeOverhaul.Options[ melee_entry ] == "aftershock" and not managers.groupai:state():whisper_mode() then
				local sphere_cast_radius = 20
				local col_ray
				
				if melee_hit_ray then
					col_ray = melee_hit_ray ~= true and melee_hit_ray or nil
				else
					col_ray = self:_calc_melee_hit_ray( t , sphere_cast_radius )
				end
				
				if col_ray and alive( col_ray.unit ) then
					self._state_data.melee_enhancement_expire_t = t + MeleeOverhaul.EnhancementCooldown[ "aftershock" ]
					
					local targets = World:find_units_quick( "sphere" , self._unit:movement():m_pos() , 1500 , managers.slot:get_mask( "trip_mine_targets" ) )
					for _ , unit in ipairs( targets ) do
						if alive( unit ) and not managers.enemy:is_civilian( self._unit ) and not unit:character_damage()._invulnerable then
							local action_data = {
								variant 		= "counter_spooc",
								damage 			= 0,
								damage_effect 	= 1,
								attacker_unit 	= self._unit,
								col_ray 		= {
													body 		= unit:body( "body" ),
													position 	= unit:position() + math.UP * 100
												},
								attack_dir 		= self._unit:movement():m_head_rot():y()
							}
							unit:character_damage():damage_melee( action_data )
						end
					end
					managers.game_play_central:play_impact_sound_and_effects({
						col_ray 	= col_ray,
						decal 		= "explosion_round",
						event 		= "round_explode"
					})
					self._ext_camera:play_shaker( "player_fall_damage" , 5 )
				end
			end
		end
	end
		
end )

Hooks:PreHook( PlayerStandard , "_update_melee_timers" , "MeleeOverhaulExtrasPlayerStandardPreUpdateMeleeTimers" , function( self , t , input )

	local melee_entry = managers.blackmarket:equipped_melee_weapon()
	
	if self._state_data.melee_expire_t and t >= self._state_data.melee_expire_t then
		if self._running and not self._end_running_expire_t then
			if not self:_is_reloading() or not self.RUN_AND_RELOAD then
				if not managers.player.RUN_AND_SHOOT and not self._state_data.meleeing then
					self._ext_camera:play_redirect( self:get_animation( "start_running" ) )
				else
					if not self._state_data.meleeing then
						self._ext_camera:play_redirect( self:get_animation( "idle" ) )
					end
				end
			end
		end
	end

end )

Hooks:PostHook( PlayerStandard , "_update_melee_timers" , "MeleeOverhaulPlayerStandardPostUpdateMeleeTimers" , function( self , t , input )

	if MeleeOverhaul:HasSetting( "ShakeIntensity" ) then
		if self._state_data.meleeing then
			local lerp_value = self:_get_melee_charge_lerp_value( t )
			
			if self._state_data.melee_charge_shake then
				self._ext_camera:shaker():set_parameter( self._state_data.melee_charge_shake , "amplitude" , math.bezier({
					0,
					0,
					MeleeOverhaul:HasSetting( "ShakeIntensity" ) or 1,
					MeleeOverhaul:HasSetting( "ShakeIntensity" ) or 1
				}, lerp_value ) )
			end
		end
	end
		
	if self._state_data.melee_enhancement_expire_t and t >= self._state_data.melee_enhancement_expire_t then
		self._state_data.melee_enhancement_expire_t = nil
	end
	
	if self._state_data.melee_hold_t and t >= self._state_data.melee_hold_t then
		self._state_data.melee_hold_t = nil
		
		if self._state_data.meleeing and input.btn_meleet_state then
			self._state_data.melee_hold = true
		end
	end

end )

Hooks:PostHook( PlayerStandard , "_interupt_action_melee" , "MeleeOverhaulPlayerStandardPostInteruptActionMelee" , function( self , t )
	
	local instant_hit = tweak_data.blackmarket.melee_weapons[ managers.blackmarket:equipped_melee_weapon() ].instant

	t = t or managers.player:player_timer():time()
	
	if self._state_data.melee_hold then
		self._equip_weapon_expire_t = t + ( self._equipped_unit:base():weapon_tweak_data().timers.equip or 0.7 ) / self:_get_swap_speed_multiplier()
	end

	if not instant_hit then
		self._ext_network:send( "sync_melee_discharge" )
	end
	
	self._state_data.melee_hold = nil
	self._state_data.melee_hold_t = nil
	self._state_data.melee_voice_charged = nil
	
	if MeleeOverhaul:HasSetting( "MeleeSprinting" ) then
		local running = self._running and not self._end_running_expire_t
		
		self:_interupt_action_running( t )
		
		if running then
			self._running_wanted = true
		end
	end

end )

Hooks:PreHook( PlayerStandard , "_check_action_primary_attack" , "MeleeOverhaulPlayerStandardPreCheckActionPrimaryAttack" , function( self , t , input )

	if self._state_data.melee_hold or self._state_data.melee_charge_wanted then
		input.btn_primary_attack_state = nil
		input.btn_primary_attack_release = nil
	end

end )

Hooks:PostHook( PlayerStandard , "_check_action_interact" , "MeleeOverhaulPlayerStandardPostCheckActionInteract" , function( self , t , input )

	local new_action , timer , interact_object
	local action_forbidden = self:chk_action_forbidden( "interact" ) or self._unit:base():stats_screen_visible() or self:_interacting() or self._ext_movement:has_carry_restriction() or self:is_deploying() or self:_changing_weapon() or self:_is_throwing_projectile() or self:_on_zipline()
	
	if not self._state_data.meleeing or self._state_data.melee_repeat_expire_t or self:_is_melee_instant() then
		return
	end
	
	if input.btn_interact_press and not action_forbidden then
		new_action, timer, interact_object = self._interaction:interact( self._unit , input.data )
		
		local melee_hold = self._state_data.melee_hold
		
		if new_action then
			self:_play_interact_redirect( t , input )
		end
		
		if timer then
			new_action = true
			self:_interupt_action_melee( t )
			self._ext_camera:camera_unit():base():set_limits( 80 , 50 )
			self:_start_action_interact( t , input , timer , interact_object )
		end
		
		new_action = new_action or self:_start_action_intimidate( t )
		
		if not MeleeOverhaul:HasSetting( "MeleeHoldTime" ) or melee_hold then
			self._state_data.melee_hold = true
		end
	end

end )

Hooks:PostHook( PlayerStandard , "_check_use_item" , "MeleeOverhaulPlayerStandardPostCheckUseItem" , function( self , t , input )

	local action_wanted = input.btn_use_item_press
	
	if not self._state_data.meleeing or self._state_data.melee_expire_t or self:_is_melee_instant() then
		return
	end
	
	if action_wanted then
		local action_forbidden = self._use_item_expire_t or self:_interacting() or self:_changing_weapon() or self:_is_throwing_projectile()
		local melee_hold = self._state_data.melee_hold
		
		if not action_forbidden and managers.player:can_use_selected_equipment( self._unit ) then
			self:_interupt_action_melee( t )
			self:_start_action_use_item(t)
			
			if not MeleeOverhaul:HasSetting( "MeleeHoldTime" ) or melee_hold then
				self._state_data.melee_hold = true
			end
		end
	end

end )

Hooks:PostHook( PlayerStandard , "_check_action_equip" , "MeleeOverhaulPlayerStandardPostCheckActionEquip" , function( self , t , input )

	local new_action
	local selection_wanted = input.btn_primary_choice
	
	if not self._state_data.meleeing or self._state_data.melee_expire_t or self:_is_melee_instant() then
		return
	end
	
	if selection_wanted then
		local action_forbidden = self:chk_action_forbidden( "equip" )
		action_forbidden = action_forbidden or not self._ext_inventory:is_selection_available( selection_wanted ) or self._use_item_expire_t or self:_changing_weapon() or self:_interacting() or self:_is_throwing_projectile()
		
		if not action_forbidden then
			local new_action = not self._ext_inventory:is_equipped( selection_wanted )
			if new_action then
				self:_interupt_action_melee( t )
				self:_start_action_unequip_weapon( t , { selection_wanted = selection_wanted } )
			else
				self:_interupt_action_melee( t )
			end
		end
	end
	return new_action

end )

Hooks:PostHook( PlayerStandard , "_check_change_weapon" , "MeleeOverhaulPlayerStandardPostCheckChangeWeapon" , function( self , t , input )

	local new_action
	local action_wanted = input.btn_switch_weapon_press
	
	if not self._state_data.meleeing or self._state_data.melee_expire_t or self:_is_melee_instant() then
		return
	end
	
	if action_wanted then
		local action_forbidden = self:_changing_weapon()
		action_forbidden = action_forbidden or self._use_item_expire_t or self._change_item_expire_t
		action_forbidden = action_forbidden or self._unit:inventory():num_selections() == 1 or self:_interacting() or self:_is_throwing_projectile()
		
		if not action_forbidden then
			local data = {}
			data.next = true
			self:_interupt_action_melee( t )
			self._change_weapon_pressed_expire_t = t + 0.33
			self:_start_action_unequip_weapon( t , data )
			new_action = true
			managers.player:send_message( Message.OnSwitchWeapon )
		end
	end
	
	return new_action

end )

Hooks:PostHook( PlayerStandard , "_check_action_throw_grenade" , "MeleeOverhaulPlayerStandardPostCheckActionThrowGrenade" , function( self , t , input )

	if not self._state_data.meleeing or self._state_data.melee_expire_t or self:_is_melee_instant() then
		return
	end
	
	local action_wanted = input.btn_throw_grenade_press
	if not action_wanted then
		return
	end
	
	if not managers.player:can_throw_grenade() then
		return
	end
	
	local action_forbidden = not PlayerBase.USE_GRENADES or self:chk_action_forbidden( "interact" ) or self._unit:base():stats_screen_visible() or self:_is_throwing_grenade() or self:_interacting() or self:is_deploying() or self:_changing_weapon() or self:_is_using_bipod()
	if action_forbidden then
		return
	end
	
	local melee_hold = self._state_data.melee_hold
	
	self:_interupt_action_melee( t )
	self:_start_action_throw_grenade( t , input )
	
	if not MeleeOverhaul:HasSetting( "MeleeHoldTime" ) or melee_hold then
		self._state_data.melee_hold = true
	end
	
	return action_wanted

end )

Hooks:PostHook( PlayerStandard , "_check_action_throw_projectile" , "MeleeOverhaulPlayerStandardPostCheckActionThrowProjectile" , function( self , t , input )

	if not self._state_data.meleeing or self._state_data.melee_expire_t or self:_is_melee_instant() then
		return
	end

	local projectile_entry = managers.blackmarket:equipped_projectile()

	if tweak_data.blackmarket.projectiles[ projectile_entry ].is_a_grenade then
		return self:_check_action_throw_grenade( t, input )
	elseif tweak_data.blackmarket.projectiles[ projectile_entry ].ability then
		return self:_check_action_use_ability( t , input )
	end

	if not managers.player:can_throw_grenade() then
		self._state_data.projectile_throw_wanted = nil
		self._state_data.projectile_idle_wanted = nil
		return
	end

	if self._state_data.projectile_throw_wanted then
		if not self._state_data.projectile_throw_allowed_t then
			self._state_data.projectile_throw_wanted = nil
			self:_do_action_throw_projectile( t , input )
		end
		return
	end

	local action_wanted = input.btn_projectile_press or input.btn_projectile_release or self._state_data.projectile_idle_wanted

	if not action_wanted then
		return
	end

	if input.btn_projectile_release then
		if self._state_data.throwing_projectile then
			if self._state_data.projectile_throw_allowed_t then
				self._state_data.projectile_throw_wanted = true
				return
			end
			self:_do_action_throw_projectile( t , input )
		end
		return
	end

	local action_forbidden = not PlayerBase.USE_GRENADES or not self:_projectile_repeat_allowed() or self:chk_action_forbidden("interact") or self:_interacting() or self:is_deploying() or self:_changing_weapon() or self:_is_using_bipod()
	
	if action_forbidden then
		return
	end

	local melee_hold = self._state_data.melee_hold
	
	self:_interupt_action_melee( t )
	self:_start_action_throw_projectile( t , input )

	if not MeleeOverhaul:HasSetting( "MeleeHoldTime" ) or melee_hold then
		self._state_data.melee_hold = true
	end

	return true

end )

Hooks:PostHook( PlayerStandard , "_start_action_running" , "MeleeOverhaulExtrasPlayerStandardPostStartActionRunning" , function( self , t )

	if MeleeOverhaul:HasSetting( "MeleeSprinting" ) then
		if not self._move_dir then
			self._running_wanted = true
			return
		end
		
		if self:on_ladder() or self:_on_zipline() then
			return
		end
		
		if self._shooting and not managers.player.RUN_AND_SHOOT or self:_changing_weapon() or self._use_item_expire_t or self._state_data.in_air or self:_is_throwing_projectile() or self:_is_charging_weapon() then
			self._running_wanted = true
			return
		end
		
		if self._state_data.ducking and not self:_can_stand() then
			self._running_wanted = true
			return
		end
		
		if not self:_can_run_directional() then
			return
		end
		
		if not self:_is_meleeing() and self._camera_unit:base()._melee_item_units then
			self._running_wanted = true
			return
		end
		
		self._running_wanted = false
		
		if managers.player:get_player_rule( "no_run" ) then
			return
		end
		
		if not self._unit:movement():is_above_stamina_threshold() then
			return
		end
		
		if ( not self._state_data.shake_player_start_running or not self._ext_camera:shaker():is_playing( self._state_data.shake_player_start_running ) ) and managers.user:get_setting( "use_headbob" ) then
			self._state_data.shake_player_start_running = self._ext_camera:play_shaker( "player_start_running" , 0.75 )
		end
		
		self:set_running( true )
		
		self._end_running_expire_t = nil
		self._start_running_t = t
		
		if not self.RUN_AND_RELOAD then
			self:_interupt_action_reload( t )
		end
		
		self:_interupt_action_steelsight( t )
		self:_interupt_action_ducking( t )
	end

end )

local _end_action_running = PlayerStandard._end_action_running

function PlayerStandard:_end_action_running( t )

	if not MeleeOverhaul:HasSetting( "MeleeSprinting" ) or MeleeOverhaul:HasSetting( "MeleeSprinting" ) and not self:_is_meleeing() then
		_end_action_running( self , t )
		return
	end

	if not self._end_running_expire_t then
		local speed_multiplier = self._equipped_unit:base():exit_run_speed_multiplier()
		
		self._end_running_expire_t = t + 0.4 / speed_multiplier
		if not self:_is_meleeing() then
			if not managers.player.RUN_AND_SHOOT and ( not managers.player.RUN_AND_RELOAD or not self:_is_reloading() ) then
				self._ext_camera:play_redirect( self:get_animation("stop_running") , speed_multiplier )
			end
		end
	end
end

local _start_action_jump = PlayerStandard._start_action_jump

function PlayerStandard:_start_action_jump( t , action_start_data )

	--[[
	if not MeleeOverhaul:HasSetting( "MeleeSprinting" ) or MeleeOverhaul:HasSetting( "MeleeSprinting" ) and not self:_is_meleeing() then
		_start_action_jump( self , t , action_start_data )
		return
	end
	--]]

	if not self:_is_meleeing() then
		if self._running and not self.RUN_AND_RELOAD and not managers.player.RUN_AND_SHOOT then
			self:_interupt_action_reload( t )
			self._ext_camera:play_redirect( self:get_animation( "stop_running" ) , self._equipped_unit:base():exit_run_speed_multiplier() )
		end
	end

	self:_interupt_action_running( t )
	self._jump_t = t

	local jump_vec = action_start_data.jump_vel_z * math.UP

	self._unit:mover():jump()

	if self._move_dir then
		local move_dir_clamp = self._move_dir:normalized() * math.min( 1 , self._move_dir:length() )
		self._last_velocity_xy = move_dir_clamp * action_start_data.jump_vel_xy
		self._jump_vel_xy = mvector3.copy( self._last_velocity_xy )
	else
		self._last_velocity_xy = Vector3()
	end

	self:_perform_jump( jump_vec )
end