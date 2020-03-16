function MeleeOverhaul:ShowStatistics()

	if not managers.menu_component then
		return
	end
	
	self._panel = managers.menu_component._ws:panel():panel()
	
	self._stat1_t = self._panel:text({
		name 		= "stat1_t",
		text 		= managers.localization:text( "more_options_stats_most_used" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 30,
		color 		= Color.white,
		vertical 	= "top",
		align 		= "center",
		wrap 		= true,
		word_wrap 	= true,
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._stat1_d1 = self._panel:text({
		name 		= "stat1_d1",
		text 		= managers.localization:text( self.Stats.used.type and tweak_data.blackmarket.melee_weapons[ self.Stats.used.type ].name_id or "more_options_stats_unavailable" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 28,
		color 		= Color.white,
		alpha 		= 0.8,
		vertical 	= "top",
		align 		= "left",
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._stat1_d2 = self._panel:text({
		name 		= "stat1_d2",
		text 		= ( self.Stats.used.value and tostring( self.Stats.used.value ) or "0" ) .. " " .. managers.localization:text( "more_options_stats_times_used" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= tweak_data.menu.pd2_medium_font,
		alpha 		= 0.8,
		font_size 	= 22,
		color 		= Color.white,
		vertical 	= "top",
		align 		= "right",
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._stat1_g = self._panel:bitmap({
		name 		= "stat1_g",
		texture 	= self.Stats.used.gui,
		layer 		= tweak_data.gui.MOUSE_LAYER - 50,
		blend_mode 	= "normal",
		w 			= 192,
		h 			= 96
	})
	
	self._stat1_bg = self._panel:bitmap({
		name 			= "stat1_bg",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 51,
		color 			= Color.white / 2,
		w 				= self._panel:w() * 0.35,
		h 				= self._panel:h()
	})
	
	self._stat1_bg2 = self._panel:bitmap({
		name 			= "stat1_bg2",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 51,
		color 			= Color.white / 2,
		w 				= self._panel:w() * 0.35,
		h 				= self._panel:h()
	})
	
	self._stat2_t = self._panel:text({
		name 		= "stat2_t",
		text 		= managers.localization:text( "more_options_stats_most_killed" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 30,
		color 		= Color.white,
		vertical 	= "top",
		align 		= "center",
		wrap 		= true,
		word_wrap 	= true,
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._stat2_d1 = self._panel:text({
		name 		= "stat2_d1",
		text 		= managers.localization:text( self.Stats.killed.type and tweak_data.blackmarket.melee_weapons[ self.Stats.killed.type ].name_id or "more_options_stats_unavailable" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 28,
		color 		= Color.white,
		alpha 		= 0.8,
		vertical 	= "top",
		align 		= "left",
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._stat2_d2 = self._panel:text({
		name 		= "stat2_d2",
		text 		= ( self.Stats.killed.value and tostring( self.Stats.killed.value ) or "0" ) .. " " .. managers.localization:text( "more_options_stats_killed" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 22,
		color 		= Color.white,
		alpha 		= 0.8,
		vertical 	= "top",
		align 		= "right",
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._stat2_g = self._panel:bitmap({
		name 		= "stat2_g",
		texture 	= self.Stats.killed.gui,
		layer 		= tweak_data.gui.MOUSE_LAYER - 50,
		blend_mode 	= "normal",
		w 			= 192,
		h 			= 96
	})
	
	self._stat2_bg = self._panel:bitmap({
		name 			= "stat2_bg",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 51,
		color 			= Color.white / 2,
		w 				= self._panel:w() * 0.35,
		h 				= self._panel:h()
	})
	
	self._stat2_bg2 = self._panel:bitmap({
		name 			= "stat2_bg2",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 51,
		color 			= Color.white / 2,
		w 				= self._panel:w() * 0.35,
		h 				= self._panel:h()
	})
	
	self._stat3_t = self._panel:text({
		name 		= "stat3_t",
		text 		= managers.localization:text( "more_options_stats_kills_per_use" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 30,
		color 		= Color.white,
		vertical 	= "top",
		align 		= "center",
		wrap 		= true,
		word_wrap 	= true,
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._stat3_d1 = self._panel:text({
		name 		= "stat3_d1",
		text 		= managers.localization:text( self.Stats.kpu.type and tweak_data.blackmarket.melee_weapons[ self.Stats.kpu.type ].name_id or "more_options_stats_unavailable" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 28,
		color 		= Color.white,
		alpha 		= 0.8,
		vertical 	= "top",
		align 		= "left",
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._stat3_d2 = self._panel:text({
		name 		= "stat3_d2",
		text 		= ( self.Stats.kpu.value and string.format( "%.2f" , self.Stats.kpu.value ) or "0" ):gsub( "%.?0+$" , "" ) .. " " .. managers.localization:text( "more_options_stats_kpu_average" ),
		blend_mode 	= "add",
		w 			= self._panel:w() * 0.35,
		h 			= self._panel:h(),
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 22,
		color 		= Color.white,
		alpha 		= 0.8,
		vertical 	= "top",
		align 		= "right",
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._stat3_g = self._panel:bitmap({
		name 		= "stat3_g",
		texture 	= self.Stats.kpu.gui,
		layer 		= tweak_data.gui.MOUSE_LAYER - 50,
		blend_mode 	= "normal",
		w 			= 192,
		h 			= 96
	})
	
	self._stat3_bg = self._panel:bitmap({
		name 			= "stat3_bg",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 51,
		color 			= Color.white / 2,
		w 				= self._panel:w() * 0.35,
		h 				= self._panel:h()
	})
	
	self._stat3_bg2 = self._panel:bitmap({
		name 			= "stat3_bg2",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 51,
		color 			= Color.white / 2,
		w 				= self._panel:w() * 0.35,
		h 				= self._panel:h()
	})
	
	local _ , _ , _ , h1 = self._stat1_t:text_rect()
	local _ , _ , _ , h1d1 = self._stat1_d1:text_rect()
	local _ , _ , _ , h1d2 = self._stat1_d2:text_rect()
	local _ , _ , _ , h2 = self._stat2_t:text_rect()
	local _ , _ , _ , h2d1 = self._stat2_d1:text_rect()
	local _ , _ , _ , h2d2 = self._stat2_d2:text_rect()
	local _ , _ , _ , h3 = self._stat3_t:text_rect()
	local _ , _ , _ , h3d1 = self._stat3_d1:text_rect()
	local _ , _ , _ , h3d2 = self._stat3_d2:text_rect()
	local tab = 0.125
	
	self._stat1_t:set_h( h1 )
	self._stat1_t:set_right( self._panel:right() )
	self._stat1_t:set_top( self._panel:h() * tab )
	self._stat1_d1:set_h( h1d1 )
	self._stat1_d2:set_h( h1d2 )
	
	self._stat1_bg:set_h( h1 + 128 )
	self._stat1_bg:set_right( self._panel:right() )
	self._stat1_bg:set_top( self._panel:h() * tab )
	self._stat1_bg2:set_h( h1 )
	self._stat1_bg2:set_right( self._panel:right() )
	self._stat1_bg2:set_top( self._panel:h() * tab )
	
	self._stat1_g:set_center( self._stat1_bg:center_x() , self._stat1_bg:center_y() * 1.01 )
	
	self._stat1_d1:set_leftbottom( self._stat1_bg:left() + 4 , self._stat1_bg:bottom() - 1 )
	self._stat1_d2:set_rightbottom( self._stat1_bg:right() - 4 , self._stat1_bg:bottom() - 1 )
	
	self._stat2_t:set_h( h2 )
	self._stat2_t:set_right( self._panel:right() )
	self._stat2_t:set_top( self._stat1_bg:bottom() + 4 )
	self._stat2_d1:set_h( h2d1 )
	self._stat2_d2:set_h( h2d2 )
	
	self._stat2_bg:set_h( h2 + 128 )
	self._stat2_bg:set_right( self._panel:right() )
	self._stat2_bg:set_top( self._stat1_bg:bottom() + 4 )
	self._stat2_bg2:set_h( h2 )
	self._stat2_bg2:set_right( self._panel:right() )
	self._stat2_bg2:set_top( self._stat1_bg:bottom() + 4 )
	
	self._stat2_g:set_center( self._stat2_bg:center_x() , self._stat2_bg:center_y() * 1.01 )
	
	self._stat2_d1:set_leftbottom( self._stat2_bg:left() + 4 , self._stat2_bg:bottom() - 1 )
	self._stat2_d2:set_rightbottom( self._stat2_bg:right() - 4 , self._stat2_bg:bottom() - 1 )
	
	self._stat3_t:set_h( h3 )
	self._stat3_t:set_right( self._panel:right() )
	self._stat3_t:set_top( self._stat2_bg:bottom() + 4 )
	self._stat3_d1:set_h( h3d1 )
	self._stat3_d2:set_h( h3d2 )
	
	self._stat3_bg:set_h( h3 + 128 )
	self._stat3_bg:set_right( self._panel:right() )
	self._stat3_bg:set_top( self._stat2_bg:bottom() + 4 )
	self._stat3_bg2:set_h( h3 )
	self._stat3_bg2:set_right( self._panel:right() )
	self._stat3_bg2:set_top( self._stat2_bg:bottom() + 4 )
	
	self._stat3_g:set_center( self._stat3_bg:center_x() , self._stat3_bg:center_y() * 1.01 )
	
	self._stat3_d1:set_leftbottom( self._stat3_bg:left() + 4 , self._stat3_bg:bottom() - 1 )
	self._stat3_d2:set_rightbottom( self._stat3_bg:right() - 4 , self._stat3_bg:bottom() - 1 )

end

function MeleeOverhaul:DestroyStatistics()

	if alive( self._panel ) then

		self._panel:remove( self._stat1_t )
		self._panel:remove( self._stat1_bg )
		self._panel:remove( self._stat1_bg2 )
		self._panel:remove( self._stat1_g )
		self._panel:remove( self._stat1_d1 )
		self._panel:remove( self._stat1_d2 )
		self._panel:remove( self._stat2_t )
		self._panel:remove( self._stat2_bg )
		self._panel:remove( self._stat2_bg2 )
		self._panel:remove( self._stat2_g )
		self._panel:remove( self._stat2_d1 )
		self._panel:remove( self._stat2_d2 )
		self._panel:remove( self._stat3_t )
		self._panel:remove( self._stat3_bg )
		self._panel:remove( self._stat3_bg2 )
		self._panel:remove( self._stat3_g )
		self._panel:remove( self._stat3_d1 )
		self._panel:remove( self._stat3_d2 )
		self._panel:remove( self._panel )

		self._stat1_t = nil
		self._stat1_bg = nil
		self._stat1_bg2 = nil
		self._stat1_g = nil
		self._stat1_d1 = nil
		self._stat1_d2 = nil
		self._stat2_t = nil
		self._stat2_bg = nil
		self._stat2_bg2 = nil
		self._stat2_g = nil
		self._stat2_d1 = nil
		self._stat2_d2 = nil
		self._stat3_t = nil
		self._stat3_bg = nil
		self._stat3_bg2 = nil
		self._stat3_g = nil
		self._stat3_d1 = nil
		self._stat3_d2 = nil
		self._panel = nil

	end

end

function MeleeOverhaul:ShowDatabase()

	if not managers.menu_component then
		return
	end
	
	self._database_panel = managers.menu_component._ws:panel():panel()
	
	self.DatabaseIndex = self.DatabaseIndex or 1
	
	self._database_t = self._database_panel:text({
		name 		= "database_t",
		text 		= managers.localization:text( "more_options_stats_database" ) .. " (" .. tostring( self.DatabaseIndex ) .. "/" .. tostring( #self.Database.MeleeWeapons ) .. ")",
		blend_mode 	= "add",
		w 			= self._database_panel:w() * 0.35,
		h 			= self._database_panel:h(),
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 30,
		color 		= Color.white,
		vertical 	= "top",
		align 		= "center",
		wrap 		= true,
		word_wrap 	= true,
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._database_previous = self._database_panel:text({
		name 		= "database_previous",
		text 		= utf8.char( 57348 ),
		blend_mode 	= "add",
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 30,
		color 		= tweak_data.screen_colors.button_stage_3,
		alpha 		= 1,
		vertical 	= "top",
		align 		= "left",
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._database_next = self._database_panel:text({
		name 		= "database_next",
		text 		= utf8.char( 57349 ),
		blend_mode 	= "add",
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 30,
		color 		= tweak_data.screen_colors.button_stage_3,
		alpha 		= 1,
		vertical 	= "top",
		align 		= "right",
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._database_name = self._database_panel:text({
		name 		= "database_name",
		text 		= managers.localization:text( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] and tweak_data.blackmarket.melee_weapons[ self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] ].name_id or "more_options_stats_unavailable" ),
		blend_mode 	= "add",
		w 			= self._database_panel:w() * 0.35,
		h 			= self._database_panel:h(),
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 28,
		color 		= Color.white,
		alpha 		= 0.8,
		vertical 	= "top",
		align 		= "left",
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._database_stat1 = self._database_panel:text({
		name 		= "database_stat1",
		text 		= ( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 2 ] and tostring( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 2 ] ) or "0" ) .. " " .. managers.localization:text( "more_options_stats_killed" ),
		blend_mode 	= "add",
		w 			= self._database_panel:w() * 0.35,
		h 			= self._database_panel:h(),
		font 		= tweak_data.menu.pd2_medium_font,
		alpha 		= 0.8,
		font_size 	= 22,
		color 		= Color.white,
		vertical 	= "top",
		align 		= "right",
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._database_stat2 = self._database_panel:text({
		name 		= "database_stat2",
		text 		= ( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 2 ] and tostring( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 3 ] ) or "0" ) .. " " .. managers.localization:text( "more_options_stats_times_used" ),
		blend_mode 	= "add",
		w 			= self._database_panel:w() * 0.35,
		h 			= self._database_panel:h(),
		font 		= tweak_data.menu.pd2_medium_font,
		alpha 		= 0.8,
		font_size 	= 22,
		color 		= Color.white,
		vertical 	= "top",
		align 		= "right",
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._database_dlc = self._database_panel:text({
		name 		= "database_dlc",
		text 		= utf8.to_upper( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] and tweak_data.blackmarket.melee_weapons[ self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] ].dlc and managers.localization:text( tweak_data.lootdrop.global_values[ tweak_data.blackmarket.melee_weapons[ self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] ].dlc ].desc_id ) or "" ),
		blend_mode 	= "add",
		w 			= self._database_panel:w() * 0.35,
		h 			= self._database_panel:h(),
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 22,
		color 		= self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] and tweak_data.blackmarket.melee_weapons[ self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] ].dlc and tweak_data.lootdrop.global_values[ tweak_data.blackmarket.melee_weapons[ self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] ].dlc ].color or Color.white,
		vertical 	= "top",
		align 		= "center",
		wrap 		= true,
		word_wrap 	= true,
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._database_desc = self._database_panel:text({
		name 		= "database_desc",
		text 		= managers.localization:text( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] and ( tweak_data.blackmarket.melee_weapons[ self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] ].name_id .. "_info" ) ),
		blend_mode 	= "add",
		w 			= self._database_panel:w() * 0.35 - 20,
		h 			= self._database_panel:h(),
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 22,
		color 		= Color.white,
		vertical 	= "top",
		align 		= "left",
		wrap 		= true,
		word_wrap 	= true,
		layer 		= tweak_data.gui.MOUSE_LAYER - 50
	})
	
	self._database_g = self._database_panel:bitmap({
		name 		= "database_g",
		texture 	= self.Database.MeleeWeapons[ self.DatabaseIndex ][ 5 ],
		layer 		= tweak_data.gui.MOUSE_LAYER - 50,
		blend_mode 	= "normal",
		w 			= 192,
		h 			= 96
	})
	
	self._database_bg = self._database_panel:bitmap({
		name 			= "database_bg",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 51,
		color 			= Color.white / 2,
		w 				= self._database_panel:w() * 0.35,
		h 				= self._database_panel:h()
	})
	
	self._database_bg2 = self._database_panel:bitmap({
		name 			= "database_bg2",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 51,
		color 			= Color.white / 2,
		w 				= self._database_panel:w() * 0.35,
		h 				= self._database_panel:h()
	})
	
	self._database_bg3 = self._database_panel:bitmap({
		name 			= "database_bg2",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 51,
		color 			= Color.white / 2,
		w 				= self._database_panel:w() * 0.35,
		h 				= self._database_panel:h()
	})
	
	local _ , _ , _ , h1 = self._database_t:text_rect()
	local _ , _ , wp , hp = self._database_previous:text_rect()
	local _ , _ , wn , hn = self._database_next:text_rect()
	local _ , _ , _ , h1d1 = self._database_name:text_rect()
	local _ , _ , _ , h1d2 = self._database_stat1:text_rect()
	local _ , _ , _ , h2d1 = self._database_stat2:text_rect()
	local _ , _ , _ , h3d1 = self._database_desc:text_rect()
	local _ , _ , _ , h4d1 = self._database_dlc:text_rect()
	local tab = 0.125
	
	self._database_t:set_h( h1 )
	self._database_t:set_right( self._database_panel:right() )
	self._database_t:set_top( self._database_panel:h() * tab )
	
	self._database_previous:set_size( wp , hp )
	self._database_next:set_size( wn , hn )
	
	self._database_name:set_h( h1d1 )
	self._database_stat1:set_h( h1d2 )
	self._database_stat2:set_h( h2d1 )
	
	self._database_desc:set_h( h3d1 )
	self._database_dlc:set_h( h4d1 )
	
	self._database_bg:set_h( h1 + 150 )
	self._database_bg:set_right( self._database_panel:right() )
	self._database_bg:set_top( self._database_panel:h() * tab )
	self._database_bg2:set_h( h1 )
	self._database_bg2:set_right( self._database_panel:right() )
	self._database_bg2:set_top( self._database_panel:h() * tab )
	self._database_bg3:set_h( h3d1 + ( self._database_dlc:text() ~= "" and h4d1 or 0 ) + 10 )
	self._database_bg3:set_right( self._database_panel:right() )
	self._database_bg3:set_top( self._database_bg:bottom() + 8 )
	
	self._database_g:set_center( self._database_bg:center_x() , self._database_bg:center_y() * 1.01 )
	
	self._database_previous:set_lefttop( self._database_bg:left() + 4 , self._database_bg:top() + 1 )
	self._database_next:set_righttop( self._database_bg:right() - 4 , self._database_bg:top() + 1 )
	
	self._database_name:set_leftbottom( self._database_bg:left() + 4 , self._database_bg:bottom() - 1 )
	
	self._database_stat2:set_rightbottom( self._database_bg:right() - 4 , self._database_bg:bottom() - 1 )
	self._database_stat1:set_rightbottom( self._database_stat2:right() , self._database_stat2:top() )
	
	self._database_dlc:set_right( self._database_panel:right() )
	self._database_dlc:set_top( self._database_bg3:top() + 4 )
	
	self._database_desc:set_left( self._database_bg3:left() + 10 )
	self._database_desc:set_top( ( self._database_dlc:text() ~= "" and self._database_dlc:bottom() or self._database_bg3:top() ) + ( self._database_dlc:text() ~= "" and 2 or 4 ) )

end

function MeleeOverhaul:DestroyDatabase()

	self:DestroyDatabaseOptions()
	
	if alive( self._database_panel ) then

		self._database_panel:remove( self._database_t )
		self._database_panel:remove( self._database_previous )
		self._database_panel:remove( self._database_next )
		self._database_panel:remove( self._database_bg )
		self._database_panel:remove( self._database_bg2 )
		self._database_panel:remove( self._database_bg3 )
		self._database_panel:remove( self._database_g )
		self._database_panel:remove( self._database_stat1 )
		self._database_panel:remove( self._database_stat2 )
		self._database_panel:remove( self._database_desc )
		self._database_panel:remove( self._database_dlc )
		self._database_panel:remove( self._database_name )
		self._database_panel:remove( self._database_panel )

		self._database_t = nil
		self._database_previous = nil
		self._database_next = nil
		self._database_bg = nil
		self._database_bg2 = nil
		self._database_bg3 = nil
		self._database_g = nil
		self._database_name = nil
		self._database_stat1 = nil
		self._database_stat2 = nil
		self._database_desc = nil
		self._database_dlc = nil
		self._database_panel = nil

	end

end

function MeleeOverhaul:ShowDatabaseOptions( dx , dy )

	if not managers.menu_component then
		return
	end
	
	if not managers.menu_scene then
		return
	end
	
	if not self._database_panel then
		return
	end
	
	self:DestroyDatabaseOptions()
	
	self._database_options_panel = managers.menu_component._ws:panel():panel()
	
	self._database_options_bg = self._database_options_panel:bitmap({
		name 			= "database_options_bg",
		texture 		= "guis/textures/pd2/hud_tabs",
		texture_rect 	= {
							84,
							0,
							44,
							32
						},
		visible 		= true,
		layer 			= tweak_data.gui.MOUSE_LAYER - 49,
		color 			= Color.white
	})
	
	self._database_options_equip = self._database_options_panel:text({
		name 		= "database_options_equip",
		text 		= utf8.to_upper( managers.localization:text( "bm_menu_btn_equip_melee_weapon" ) ),
		blend_mode 	= "normal",
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 22,
		color 		= tweak_data.screen_colors.button_stage_3,
		vertical 	= "top",
		align 		= "left",
		layer 		= tweak_data.gui.MOUSE_LAYER - 48
	})
	
	self._database_options_preview = self._database_options_panel:text({
		name 		= "database_options_preview",
		text 		= utf8.to_upper( managers.localization:text( "bm_menu_btn_preview_melee_weapon" ) ),
		blend_mode 	= "normal",
		font 		= tweak_data.menu.pd2_medium_font,
		font_size 	= 22,
		color 		= tweak_data.screen_colors.button_stage_3,
		vertical 	= "top",
		align 		= "left",
		layer 		= tweak_data.gui.MOUSE_LAYER - 48
	})
	
	self._database_options_equip_bg = self._database_options_panel:rect({
		name 		= "database_options_equip_bg",
		color 		= tweak_data.screen_colors.button_stage_2,
		blend_mode 	= "normal",
		alpha 		= 0,
		layer 		= tweak_data.gui.MOUSE_LAYER - 47
	})
	
	self._database_options_preview_bg = self._database_options_panel:rect({
		name 		= "database_options_preview_bg",
		color 		= tweak_data.screen_colors.button_stage_2,
		blend_mode 	= "normal",
		alpha 		= 0,
		layer 		= tweak_data.gui.MOUSE_LAYER - 47
	})
	
	local _ , _ , w , h = self._database_options_equip:text_rect()
	local _ , _ , w1 , h1 = self._database_options_preview:text_rect()
	
	local data = self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ]
	
	if not Global.blackmarket_manager.melee_weapons[ data ].unlocked or Global.blackmarket_manager.melee_weapons[ data ].equipped then
		self._database_options_equip:set_color( tweak_data.menu.upgrade_not_aquired_color )
		self._database_options_equip_bg:set_color( tweak_data.menu.default_disabled_text_color )
	end
	if not tweak_data.blackmarket.melee_weapons[ data ].unit or tweak_data.blackmarket.melee_weapons[ data ].no_inventory_preview then
		self._database_options_preview:set_color( tweak_data.menu.upgrade_not_aquired_color )
		self._database_options_preview_bg:set_color( tweak_data.menu.default_disabled_text_color )
	end
	
	self._database_options_equip:set_h( h )
	self._database_options_preview:set_h( h1 )
	
	self._database_options_equip_bg:set_size( w , h )
	self._database_options_preview_bg:set_size( w1 , h1 )
	
	self._database_options_bg:set_lefttop( dx + 4 , dy - 2 )
	
	if self._database_options_bg:w() < w + 8 then
		self._database_options_bg:set_w( w + 8 )
	end
	if self._database_options_bg:w() < w1 + 8 then
		self._database_options_bg:set_w( w1 + 8 )
	end
	
	self._database_options_equip_bg:set_w( self._database_options_bg:w() )
	self._database_options_preview_bg:set_w( self._database_options_bg:w() )
	
	self._database_options_bg:set_h( h + h1 )
	
	self._database_options_equip:set_lefttop( self._database_options_bg:left() + 4 , self._database_options_bg:top() )
	self._database_options_preview:set_lefttop( self._database_options_equip:left() , self._database_options_equip:bottom() )
	self._database_options_equip_bg:set_lefttop( self._database_options_bg:left() , self._database_options_equip:top() )
	self._database_options_preview_bg:set_lefttop( self._database_options_bg:left() , self._database_options_preview:top() )

end

function MeleeOverhaul:DestroyDatabaseOptions()

	if alive( self._database_options_panel ) then

		self._database_options_panel:remove( self._database_options_bg )
		self._database_options_panel:remove( self._database_options_equip )
		self._database_options_panel:remove( self._database_options_preview )
		self._database_options_panel:remove( self._database_options_equip_bg )
		self._database_options_panel:remove( self._database_options_preview_bg )
		self._database_options_panel:remove( self._database_options_panel )

		self._database_options_bg = nil
		self._database_options_equip = nil
		self._database_options_preview = nil
		self._database_options_equip_bg = nil
		self._database_options_preview_bg = nil
		self._database_options_panel = nil

	end

end

function MeleeOverhaul:SetDatabaseIndex( n )

	self.DatabaseIndex = self.DatabaseIndex or 1
	self.DatabaseIndex = math.clamp( self.DatabaseIndex + n , 1 , #self.Database.MeleeWeapons )
	
	self:UpdateDatabase()

end

function MeleeOverhaul:UpdateDatabase()

	if self._database_panel then
		MeleeOverhaul:DestroyDatabaseOptions()
		if self._database_t then
			self._database_t:set_text( managers.localization:text( "more_options_stats_database" ) .. " (" .. tostring( self.DatabaseIndex ) .. "/" .. tostring( #self.Database.MeleeWeapons ) .. ")" )
		end
		if self._database_name then
			log( managers.localization:text( self.Database.MeleeWeapons[ 64 ][ 1 ] and tweak_data.blackmarket.melee_weapons[ self.Database.MeleeWeapons[ 64 ][ 1 ] ].name_id or "more_options_stats_unavailable" ) )
			self._database_name:set_text( managers.localization:text( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] and tweak_data.blackmarket.melee_weapons[ self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] ].name_id or "more_options_stats_unavailable" ) )
		end
		if self._database_stat1 then
			self._database_stat1:set_text( ( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 2 ] and tostring( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 2 ] ) or "0" ) .. " " .. managers.localization:text( "more_options_stats_killed" ) )
		end
		if self._database_stat2 then
			self._database_stat2:set_text( ( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 2 ] and tostring( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 3 ] ) or "0" ) .. " " .. managers.localization:text( "more_options_stats_times_used" ) )
		end
		if self._database_dlc and self._database_desc and self._database_bg3 then
			self._database_dlc:set_text( utf8.to_upper( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] and tweak_data.blackmarket.melee_weapons[ self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] ].dlc and managers.localization:text( tweak_data.lootdrop.global_values[ tweak_data.blackmarket.melee_weapons[ self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] ].dlc ].desc_id ) or "" ) )
			self._database_dlc:set_color( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] and tweak_data.blackmarket.melee_weapons[ self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] ].dlc and tweak_data.lootdrop.global_values[ tweak_data.blackmarket.melee_weapons[ self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] ].dlc ].color or Color.white )
			
			self._database_desc:set_text( managers.localization:text( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] and ( tweak_data.blackmarket.melee_weapons[ self.Database.MeleeWeapons[ self.DatabaseIndex ][ 1 ] ].name_id .. "_info" ) ) )
			
			local _ , _ , _ , h = self._database_desc:text_rect()
			local _ , _ , _ , h1 = self._database_dlc:text_rect()
			
			self._database_desc:set_h( h )
			self._database_dlc:set_h( h1 )
			
			self._database_desc:set_top( ( self._database_dlc:text() ~= "" and self._database_dlc:bottom() or self._database_bg3:top() + 4 ) + ( self._database_dlc:text() ~= "" and 2 or 0 ) )
			self._database_bg3:set_h( h + ( self._database_dlc:text() ~= "" and h1 or 0 ) + ( self._database_dlc:text() ~= "" and 12 or 10 ) )
		end
		if self._database_g then
			self._database_g:set_image( self.Database.MeleeWeapons[ self.DatabaseIndex ][ 5 ] )
		end
	end

end