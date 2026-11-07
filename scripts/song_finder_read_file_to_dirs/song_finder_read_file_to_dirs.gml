function song_finder_read_file_to_dirs(fname, array)
{
    if (!file_exists(fname))
        return;
    
    var file = file_text_open_read(fname);
    while (!file_text_eof(file))
    {
        var dir = string_trim(file_text_readln(file), [" ", "\r", "\n"]);
        if (!directory_exists(dir) || dir == "")
            continue;
        
        // if the drive colon is before any slashes
        var first_backslash = string_pos("\\", dir);
        if (first_backslash == 0)
            first_backslash = 9999;
        
        var first_slash = string_pos("/", dir);
        if (first_slash == 0)
            first_slash = 9999;
        
        var is_windows_dir = string_pos(":", dir) < min(first_backslash, first_slash);
        if ((!is_windows_dir || !string_ends_with(dir, "\\")) && !string_ends_with(dir, "/"))
            dir += is_windows_dir ? "\\" : "/"; 
        
        array_push(array, dir);
    }
    
    file_text_close(file);
}