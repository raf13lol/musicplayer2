function song_finder_scan_dir(full_dir, dir, recursively, separator)
{
    var file = file_find_first(full_dir + "*", fa_directory);
    var files_found = [];
    var next_dirs = [];
    
    while (file != "")
    {
        if (recursively && directory_exists(full_dir + file))
        {
            array_push(next_dirs, file);
            file = file_find_next();
            continue;
        }
        
        var ext_with_dot = filename_ext(file);
        var ext = string_length(ext_with_dot) > 0 ? string_delete(ext_with_dot, 1, 1) : ext_with_dot;
        if (array_contains(global.sf_allowed_formats, string_lower(ext)))
            array_push(files_found, file);
        
        file = file_find_next();
    }
    
    file_find_close(); 
    
    array_sort(files_found, array_sort_strings_case_insensitive);
    array_sort(next_dirs, array_sort_strings_case_insensitive);
    
    var length = array_length(files_found);
    for (var i = 0; i < length; i++)
    {
        var f = files_found[i];
        if (array_contains(global.sf_songs_found, full_dir + f))
            continue;
        
        array_push(global.sf_songs_found, full_dir + f);
        array_push(global.sf_relative_songs_found, dir + f);
    }
    
    length = array_length(next_dirs);
    for (var i = 0; i < length; i++)
    {
        var folder = next_dirs[i] + separator;
        song_finder_scan_dir(full_dir + folder, dir + folder, recursively, separator);
    }
}