function plays_add_second()
{
    var month_struct = plays_create_month(current_year, current_month);
    
    if (!struct_exists(month_struct, PLAYS_PLAYTIME_NAME))
        month_struct[$ PLAYS_PLAYTIME_NAME] = 0;
    else
        month_struct[$ PLAYS_PLAYTIME_NAME]++;

    if (!global.settings.accurate_total_playtime)
        exit;       
    
    plays_save();
    
    with (obj_plays_overlay_panel)
    {
        if (is_focused())
            event_user(1); // update plays
    }
}