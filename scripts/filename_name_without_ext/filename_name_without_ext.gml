function filename_name_without_ext(fname)
{
    var name = filename_name(fname);
    var last_dot_pos = string_last_pos(".", name);
    if (last_dot_pos == 0)
        return name;
    return string_copy(name, 1, last_dot_pos - 1);
}