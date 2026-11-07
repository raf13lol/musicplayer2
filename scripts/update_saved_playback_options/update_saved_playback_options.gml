function update_saved_playback_options(key_name, value)
{
    ini_open(SONGS_INI_FILE);
    
    var section = "";
    if (current_sound != noone && !keyboard_check(vk_shift))
        section = filename_handle_relative_path(current_sound_path, global.sf_combined_directories);
    
    if (keyboard_check(vk_control))
    {
        ini_key_delete(section, key_name);
        
        if (!ini_key_exists(section, key_name == "volume" ? "pitch" : "volume"))
            ini_section_delete(section);
    }
    else
        ini_write_real(section, key_name, value);
    
    ini_close();
}
