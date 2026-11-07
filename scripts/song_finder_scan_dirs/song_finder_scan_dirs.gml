function song_finder_scan_dirs(array, recursive)
{
    var length = array_length(array);
    for (var i = 0; i < length; i++)
    {
        var dir = array[i];
        var len = string_length(dir);
        var sep = string_char_at(dir, len);
        
        song_finder_scan_dir(dir, "", recursive, sep);
    }
}