function filename_handle_relative_path(fname, possible_relative_paths)
{
    var length = array_length(possible_relative_paths);
    var new_path = fname;
    var new_path_length = string_length(fname);
    
    for (var i = 0; i < length; i++)
    {
        var path = string_replace(fname, possible_relative_paths[i], "");
        var path_length = string_length(path);
        if (path_length >= new_path_length)
            continue;
        
        new_path = path;
        new_path_length = path_length;
    }
    
    return new_path;
}