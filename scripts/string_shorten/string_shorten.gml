function string_shorten(str, max_length, shortened_marker = "...")
{
    var str_length = string_length(str);
    var shortened_marker_length = string_length(shortened_marker);
    max_length -= shortened_marker_length;
    
    if (str_length <= max_length)
        return str;
    return string_copy(str, 1, max_length) + shortened_marker;
}