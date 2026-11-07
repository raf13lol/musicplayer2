function ini_read_real_array(section, default_value)
{
    var length = ini_read_real(section, "len", -1);
    if (length < 0)
        return default_value;
    
    var array = array_create(length);
    for (var i = 0; i < length; i++)
        array[i] = ini_read_real(section, string(i), 0);
    return array;
}

function ini_read_string_array(section, default_value)
{
    var length = ini_read_real(section, "len", -1);
    if (length < 0)
        return default_value;
    
    var array = array_create(length);
    for (var i = 0; i < length; i++)
        array[i] = ini_read_string(section, string(i), "");
    return array;
}

function ini_write_real_array(section, array)
{
    var length = array_length(array);
    ini_write_real(section, "len", length);
    
    for (var i = 0; i < length; i++)
        ini_write_real(section, string(i), array[i]);
}

function ini_write_string_array(section, array)
{
    var length = array_length(array);
    ini_write_real(section, "len", length);
    
    for (var i = 0; i < length; i++)
        ini_write_string(section, string(i), array[i]);
}