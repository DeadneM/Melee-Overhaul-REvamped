function CopDamage:check_decapitations( damage_data )

	local body = damage_data.body
	local head = body:key() == Idstring( "head" ):key() or body:key() == Idstring( "hit_Head" ):key() or body:key() == Idstring( "rag_Head" ):key()
	
	local melee_entry = managers.blackmarket:equipped_melee_weapon() or "weapon"
	
	if not damage_data.attacker_unit then
		damage_data.attacker_unit = managers.player:player_unit()
	end
	if managers.network:session() and managers.network:session():peer_by_unit( damage_data.attacker_unit ) then
		melee_entry = managers.network:session():peer_by_unit( damage_data.attacker_unit ):melee_id()
	end
	
	local melee_type = tweak_data.blackmarket.melee_weapons[ melee_entry ].melee_type
	
	if self._dead then
		if MeleeOverhaul:HasSetting( "TrueDecapitation" ) and ( not MeleeOverhaul:HasSetting( "RealisticGore" ) or ( MeleeOverhaul:HasSetting( "RealisticGore" ) and melee_type == "LargeBladed" ) ) then
            if self._unit:base()._tweak_table == "spooc" then
                if head then
                    if self._unit:damage():has_sequence( "dismember_head" ) and not self._decapitated then    
                        self._unit:sound():play( "split_gen_head" )
                        self._unit:damage():run_sequence_simple( "dismember_head" )
                        self._decapitated = true    
                    end
                else
                    if self._unit:damage():has_sequence( "dismember_body_top" ) and not self._decapitated then    
                        self._unit:sound():play("split_gen_body")
                        self._unit:damage():run_sequence_simple("dismember_body_top")
                        self._decapitated = true
                    end
                end
            end
		end
		if MeleeOverhaul:HasSetting( "TrueDecapitation" ) and ( not MeleeOverhaul:HasSetting( "RealisticGore" ) or ( MeleeOverhaul:HasSetting( "RealisticGore" ) and melee_type == "Blunt" ) ) then
			if head then
				if self._unit:damage():has_sequence( "kill_tazer_headshot" ) and self._unit:base()._tweak_table == "taser" and not self._decapitated then
					self._unit:sound():play( "split_gen_head" )
					
					self:_spawn_head_gadget({
						position = self._unit:get_object( Idstring( "Head" ) ):position(),
						rotation = self._unit:get_object( Idstring( "Head" ) ):rotation(),
						dir = -self._unit:movement():m_head_rot():y()
					})
					
					self._unit:damage():run_sequence_simple( "kill_tazer_headshot" )
					self._decapitated = true
				end
			end
		end
		if head and not self._decapitated then
			self._unit:movement():enable_update()
			self._unit:movement()._frozen = nil
			
			if self._unit:movement()._active_actions[ 1 ] then
				self._unit:movement()._active_actions[ 1 ]:force_ragdoll(true)
			end
			
			self._unit:body( self._unit:get_object( Idstring( "Head" ) ) ):set_enabled( false )
			
			if not MeleeOverhaul:HasSetting( "RealisticGore" ) or ( MeleeOverhaul:HasSetting( "RealisticGore" ) and melee_type == "LargeBladed" ) then
				self._unit:sound():play( "split_gen_head" )
				
				self:_spawn_head_gadget({
					position = self._unit:get_object( Idstring( "Head" ) ):position(),
					rotation = self._unit:get_object( Idstring( "Head" ) ):rotation(),
					dir = -self._unit:movement():m_head_rot():y()
				})
				
				self._unit:get_object( Idstring( "Head" ) ):set_position( self._unit:get_object( Idstring( "Spine1" ) ):position() )
				self._unit:get_object( Idstring( "Head" ) ):set_rotation( self._unit:get_object( Idstring( "Spine1" ) ) )
				
				self._unit:movement():add_dismemberment( "Head" , MeleeOverhaul:HasSetting( "RealisticGore" ) and melee_type )
			end
			if MeleeOverhaul:HasSetting( "RealisticGore" ) and melee_type == "SmallBladed" then
				self._unit:sound():play( "split_gen_head" )
				self._unit:movement():add_dismemberment( "Head" , melee_type )
			end
			if MeleeOverhaul:HasSetting( "RealisticGore" ) and melee_type == "Blunt" then
				self._unit:get_object( Idstring( "Head" ) ):set_rotation( Rotation() )
			end
		end
	end

end

function CopDamage:check_blunt_force( damage_data )

	local body = damage_data.body
	local head = body:key() == Idstring( "head" ):key() or body:key() == Idstring( "hit_Head" ):key() or body:key() == Idstring( "rag_Head" ):key()
	
	local melee_entry = managers.blackmarket:equipped_melee_weapon()
	
	if not damage_data.attacker_unit then
		damage_data.attacker_unit = managers.player:player_unit()
	end
	if managers.network:session() and managers.network:session():peer_by_unit( damage_data.attacker_unit ) then
		melee_entry = managers.network:session():peer_by_unit( damage_data.attacker_unit ):melee_id()
	end
	
	local melee_type = tweak_data.blackmarket.melee_weapons[ melee_entry ].melee_type
	
	if damage_data.death and head and melee_type == "Blunt" and not managers.groupai:state():whisper_mode() then
		self._unit:movement():enable_update()
		self._unit:movement()._frozen = nil
		
		local hit_pos = mvector3.copy( self._unit:movement():m_pos() )
		local attack_dir = damage_data.attacker_unit:movement():m_head_rot():y()
		
		if self._unit:movement()._active_actions[ 1 ] then
			self._unit:movement()._active_actions[ 1 ]:force_ragdoll(true)
		end
		
		local height = mvector3.distance( hit_pos , self._unit:position() ) - 100
		local twist_dir = math.random( 2 ) == 1 and 1 or -1
		local rot_acc = ( attack_dir:cross( math.UP ) + math.UP * ( 0.5 * twist_dir ) ) * ( -1000 * math.sign( height ) )
		local rot_time = 1 + math.rand( 2 )
		local nr_u_bodies = self._unit:num_bodies()
		local i_u_body = 0
		
		while nr_u_bodies > i_u_body do
			local u_body = self._unit:body( i_u_body )
			if u_body:enabled() and u_body:dynamic() then
				World:play_physic_effect( Idstring( "physic_effects/shotgun_hit" ) , u_body , Vector3( attack_dir.x , attack_dir.y , attack_dir.z + 0.5 ) * 600 * MeleeOverhaul:HasSetting( "BluntForceMultiplier" ) , 4 * u_body:mass() / math.random( 2 ) , rot_acc , rot_time )
			end
			i_u_body = i_u_body + 1
		end
	end

end

Hooks:PreHook( CopDamage , "damage_melee" , "MeleeOverhaulExtrasCopDamagePreDamageMelee" , function( self , attack_data )

	if not attack_data then return end
	if self._invulnerable then return end

	if MeleeOverhaul:HasSetting( "MeleeHeadshots" ) then
		local body = attack_data.body_name or attack_data.col_ray.body:name()
		local head = body:key() == Idstring( "head" ):key() or body:key() == Idstring( "hit_Head" ):key() or body:key() == Idstring( "rag_Head" ):key()
		
		if head and attack_data.attacker_unit and attack_data.attacker_unit:key() == managers.player:player_unit():key() then
			attack_data.damage = attack_data.damage * 1.25
		end
	end
	
	if MeleeOverhaul:HasSetting( "MeleeEnhancers" ) then
		local melee_entry = managers.blackmarket:equipped_melee_weapon()
		
		if not self._dead and attack_data.attacker_unit and attack_data.attacker_unit:key() == managers.player:player_unit():key() and MeleeOverhaul.Options[ melee_entry ] and not PlayerDamage.is_friendly_fire( self , attack_data.attacker_unit ) and not CopDamage.is_civilian( self._unit:base()._tweak_table ) then
			if not managers.player:player_unit():movement():current_state()._state_data.melee_enhancement_expire_t then
			
				if MeleeOverhaul.Options[ melee_entry ] == "incinerated" then
					managers.player:player_unit():movement():current_state()._state_data.melee_enhancement_expire_t = managers.player:player_timer():time() + MeleeOverhaul.EnhancementCooldown[ "incinerated" ]
				
					managers.fire:add_doted_enemy( self._unit , managers.player:player_timer():time() , managers.player:player_unit() , 5 , attack_data.damage * 0.25 )
					
					managers.network:session():send_to_peers_synched( "sync_add_doted_enemy" , self._unit , managers.player:player_timer():time() , managers.player:player_unit() , 5 , attack_data.damage * 0.25 )
					managers.fire:start_burn_body_sound( { enemy_unit = self._unit } , 5 )
					
					World:effect_manager():spawn({
						effect = Idstring( "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_5s" ),
						parent = self._unit:get_object( Idstring( "Spine" ) )
					})
				elseif MeleeOverhaul.Options[ melee_entry ] == "blood_lust" then
					if 0.5 >= math.rand( 1 ) then
						managers.player:player_unit():movement():current_state()._state_data.melee_enhancement_expire_t = managers.player:player_timer():time() + MeleeOverhaul.EnhancementCooldown[ "blood_lust" ]
						
						managers.player:player_unit():character_damage():restore_health( math.rand( 3 , 5 ) , true )
					end
				elseif MeleeOverhaul.Options[ melee_entry ] == "kleptomaniac" then
					if 0.75 >= math.rand( 1 ) then
						managers.player:player_unit():movement():current_state()._state_data.melee_enhancement_expire_t = managers.player:player_timer():time() + MeleeOverhaul.EnhancementCooldown[ "kleptomaniac" ]
						
						for id , weapon in pairs( managers.player:player_unit():inventory():available_selections() ) do
							weapon.unit:base():add_ammo( 3 )
							managers.hud:set_ammo_amount( id , weapon.unit:base():ammo_info() )
						end
						managers.player:player_unit():sound():play( "pickup_ammo_health_boost" )
					end
				end
			
			end
		end
	end

end )

Hooks:PostHook( CopDamage , "damage_melee" , "MeleeOverhaulCopDamagePostDamageMelee" , function( self , attack_data )

	if not attack_data then return end
	if self._invulnerable then return end

	if MeleeOverhaul:HasSetting( "TaseEffect" ) then
		if attack_data.result and attack_data.result.type == "taser_tased" then
			if self._tase_effect then
				World:effect_manager():fade_kill( self._tase_effect )
				self._tase_effect = nil
			end
			
			self._tase_effect = World:effect_manager():spawn({
				effect = Idstring( "effects/payday2/particles/character/taser_hittarget" ),
				parent = self._unit:get_object( Idstring( "Spine1" ) )
			})
		end
	end
	
	if MeleeOverhaul:HasSetting( "Decapitation" ) then
		self:check_decapitations({
			body = attack_data.body_name or attack_data.col_ray.body:name(),
			attacker_unit = attack_data.attacker_unit
		})
	end
	
	if MeleeOverhaul:HasSetting( "BluntForceTrauma" ) then
		self:check_blunt_force({
			body = attack_data.body_name or attack_data.col_ray.body:name(),
			attacker_unit = attack_data.attacker_unit,
			death = attack_data.result and attack_data.result.type == "death"
		})
	end

	if MeleeOverhaul:HasSetting( "PagerSnatch" ) then
		if attack_data.attacker_unit and attack_data.attacker_unit:key() == managers.player:player_unit():key() and attack_data.result and attack_data.result.type == "death" then
			if self._unit:unit_data().has_alarm_pager and 0.3 >= math.rand( 1 ) then
				self._unit:brain()._pager_snatched = true
			end
		end
	end
	
	if MeleeOverhaul:HasSetting( "MeleeEnhancers" ) then
		local melee_entry = managers.blackmarket:equipped_melee_weapon()
		
		if attack_data.result and attack_data.result.type == "death" and attack_data.attacker_unit and attack_data.attacker_unit:key() == managers.player:player_unit():key() and MeleeOverhaul.Options[ melee_entry ] and not PlayerDamage.is_friendly_fire( self , attack_data.attacker_unit ) and not CopDamage.is_civilian( self._unit:base()._tweak_table ) then
			if not managers.player:player_unit():movement():current_state()._state_data.melee_enhancement_expire_t then
			
				if MeleeOverhaul.Options[ melee_entry ] == "swiftness" then
					managers.player:player_unit():movement():current_state()._state_data.melee_enhancement_expire_t = managers.player:player_timer():time() + MeleeOverhaul.EnhancementCooldown[ "swiftness" ]
					
					managers.player:player_unit():movement():on_morale_boost()
				end
				
			end
		end
	end

end )