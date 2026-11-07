function playlist_add(name, songs)
{
    array_push(global.playlist_names, name);
    global.playlists[$ name] = variable_clone(songs);
    
    ini_open(PLAYLISTS_INI_FILE);
    ini_write_string_array("", global.playlist_names);
    ini_write_string_array(name, songs);
    ini_close();
}