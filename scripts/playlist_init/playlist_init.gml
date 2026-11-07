function playlist_init()
{
    ini_open(PLAYLISTS_INI_FILE);
    
    global.playlist_names = ini_read_string_array("", []);
    global.playlists = {};
    
    array_foreach(global.playlist_names, function(playlist)
    {
        global.playlists[$ playlist] = ini_read_string_array(playlist, []);
    });
    
    ini_close();
}