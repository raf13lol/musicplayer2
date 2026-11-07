function plays_add(song_path)
{
    song_path = filename_handle_relative_path(song_path, global.sf_combined_directories);
    
    var month_struct = plays_create_song(current_year, current_month, song_path);
    month_struct[$ song_path]++;
    plays_save();
    
    with (obj_plays_overlay_panel)
        event_user(1); // update plays
}