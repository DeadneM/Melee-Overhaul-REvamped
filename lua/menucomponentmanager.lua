Hooks:PostHook( MenuComponentManager , "mouse_moved" , "MeleeOverhaulMenuComponentManagerPostMouseMoved" , function( self , o , x , y )
	
	if MeleeOverhaul._database_panel then
		self._melee_database_highlights = self._melee_database_highlights or {}
		
		if MeleeOverhaul._database_previous and MeleeOverhaul._database_next then
			if MeleeOverhaul._database_previous:inside( x , y ) then
				if not self._melee_database_highlights[ "previous" ] then
					self._melee_database_highlights[ "previous" ] = true
					managers.menu_component:post_event( "highlight" )
					MeleeOverhaul._database_previous:set_color( tweak_data.screen_colors.button_stage_2 )
				end
			elseif MeleeOverhaul._database_next:inside( x , y ) then
				if not self._melee_database_highlights[ "next" ] then
					self._melee_database_highlights[ "next" ] = true
					managers.menu_component:post_event( "highlight" )
					MeleeOverhaul._database_next:set_color( tweak_data.screen_colors.button_stage_2 )
				end
			else
				self._melee_database_highlights[ "previous" ] = nil
				self._melee_database_highlights[ "next" ] = nil
				MeleeOverhaul._database_previous:set_color( tweak_data.screen_colors.button_stage_3 )
				MeleeOverhaul._database_next:set_color( tweak_data.screen_colors.button_stage_3 )
			end
		end
		
		if MeleeOverhaul._database_options_panel then
			local data = MeleeOverhaul.Database.MeleeWeapons[ MeleeOverhaul.DatabaseIndex ][ 1 ]
			if MeleeOverhaul._database_options_equip_bg:inside( x , y ) then
				self._melee_database_highlights[ "preview" ] = nil
				if not tweak_data.blackmarket.melee_weapons[ data ].unit or tweak_data.blackmarket.melee_weapons[ data ].no_inventory_preview then
					MeleeOverhaul._database_options_preview:set_color( tweak_data.menu.upgrade_not_aquired_color )
				else
					MeleeOverhaul._database_options_preview:set_color( tweak_data.screen_colors.button_stage_3 )
				end
				MeleeOverhaul._database_options_preview_bg:set_alpha( 0 )
				if not self._melee_database_highlights[ "equip" ] then
					self._melee_database_highlights[ "equip" ] = true
					managers.menu_component:post_event( "highlight" )
					if not Global.blackmarket_manager.melee_weapons[ data ].unlocked or Global.blackmarket_manager.melee_weapons[ data ].equipped then
						MeleeOverhaul._database_options_equip:set_color( tweak_data.screen_colors.stats_negative )
					else
						MeleeOverhaul._database_options_equip:set_color( tweak_data.screen_colors.button_stage_2 )
					end
					MeleeOverhaul._database_options_equip_bg:set_alpha( 0.2 )
				end
			elseif MeleeOverhaul._database_options_preview_bg:inside( x , y ) then
				self._melee_database_highlights[ "equip" ] = nil
				if not Global.blackmarket_manager.melee_weapons[ data ].unlocked or Global.blackmarket_manager.melee_weapons[ data ].equipped then
					MeleeOverhaul._database_options_equip:set_color( tweak_data.menu.upgrade_not_aquired_color )
				else
					MeleeOverhaul._database_options_equip:set_color( tweak_data.screen_colors.button_stage_3 )
				end
				MeleeOverhaul._database_options_equip_bg:set_alpha( 0 )
				if not self._melee_database_highlights[ "preview" ] then
					self._melee_database_highlights[ "preview" ] = true
					managers.menu_component:post_event( "highlight" )
					if not tweak_data.blackmarket.melee_weapons[ data ].unit or tweak_data.blackmarket.melee_weapons[ data ].no_inventory_preview then
						MeleeOverhaul._database_options_preview:set_color( tweak_data.screen_colors.stats_negative )
					else
						MeleeOverhaul._database_options_preview:set_color( tweak_data.screen_colors.button_stage_2 )
					end
					MeleeOverhaul._database_options_preview_bg:set_alpha( 0.2 )
				end
			else
				self._melee_database_highlights[ "equip" ] = nil
				self._melee_database_highlights[ "preview" ] = nil
				if not Global.blackmarket_manager.melee_weapons[ data ].unlocked or Global.blackmarket_manager.melee_weapons[ data ].equipped then
					MeleeOverhaul._database_options_equip:set_color( tweak_data.menu.upgrade_not_aquired_color )
				else
					MeleeOverhaul._database_options_equip:set_color( tweak_data.screen_colors.button_stage_3 )
				end
				if not tweak_data.blackmarket.melee_weapons[ data ].unit or tweak_data.blackmarket.melee_weapons[ data ].no_inventory_preview then
					MeleeOverhaul._database_options_preview:set_color( tweak_data.menu.upgrade_not_aquired_color )
				else
					MeleeOverhaul._database_options_preview:set_color( tweak_data.screen_colors.button_stage_3 )
				end
				MeleeOverhaul._database_options_equip_bg:set_alpha( 0 )
				MeleeOverhaul._database_options_preview_bg:set_alpha( 0 )
			end
		end
	end

end )

Hooks:PostHook( MenuComponentManager , "mouse_pressed" , "MeleeOverhaulMenuComponentManagerPostMousePressed" , function( self , o , button , x , y )

	if MeleeOverhaul._database_panel then
		if button == Idstring( "0" ) then
			if MeleeOverhaul._database_previous and MeleeOverhaul._database_next then
				if MeleeOverhaul._database_previous:inside( x , y ) then
					managers.menu_component:post_event( "menu_enter" )
					MeleeOverhaul:SetDatabaseIndex( -1 )
				elseif MeleeOverhaul._database_next:inside( x , y ) then
					managers.menu_component:post_event( "menu_enter" )
					MeleeOverhaul:SetDatabaseIndex( 1 )
				end
			end
			if MeleeOverhaul._database_options_panel then
				local data = MeleeOverhaul.Database.MeleeWeapons[ MeleeOverhaul.DatabaseIndex ][ 1 ]
				if MeleeOverhaul._database_options_equip_bg:inside( x , y ) then
					managers.menu_component:post_event( "menu_enter" )
					
					if Global.blackmarket_manager.melee_weapons[ data ].unlocked and not Global.blackmarket_manager.melee_weapons[ data ].equipped then
						managers.blackmarket:equip_melee_weapon( data )
					end
				elseif MeleeOverhaul._database_options_preview_bg:inside( x , y ) then
					managers.menu_component:post_event( "menu_enter" )
					
					if tweak_data.blackmarket.melee_weapons[ data ].unit and not tweak_data.blackmarket.melee_weapons[ data ].no_inventory_preview then
						managers.menu:open_node( "blackmarket_preview_node" , {} )
						managers.blackmarket:preview_melee_weapon( data )
					end
				end
			end
			MeleeOverhaul:DestroyDatabaseOptions()
		elseif button == Idstring( "1" ) then
			if MeleeOverhaul._database_bg:inside( x , y ) and not MeleeOverhaul._database_bg2:inside( x , y ) and not MeleeOverhaul._database_options_panel then
				MeleeOverhaul:ShowDatabaseOptions( x , y )
			elseif MeleeOverhaul._database_options_panel then
				MeleeOverhaul:DestroyDatabaseOptions()
			end
		elseif button == Idstring( "mouse wheel down" ) then
			if MeleeOverhaul._database_bg then
				if MeleeOverhaul._database_bg:inside( x , y ) then
					MeleeOverhaul:SetDatabaseIndex( 1 )
				end
			end
		elseif button == Idstring( "mouse wheel up" ) then
			if MeleeOverhaul._database_bg then
				if MeleeOverhaul._database_bg:inside( x , y ) then
					MeleeOverhaul:SetDatabaseIndex( -1 )
				end
			end
		end
	end

end )