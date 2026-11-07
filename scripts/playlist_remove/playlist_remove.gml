function playlist_remove(name)
{
    var index = array_get_index(global.playlist_names, name);
    if (index == -1)
        return;
    
    array_delete(global.playlist_names, index, 1);
    variable_struct_remove(global.playlists, name);
    
    ini_open(PLAYLISTS_INI_FILE);
    ini_write_string_array("", global.playlist_names);
    ini_section_delete(name);
    ini_close();
}