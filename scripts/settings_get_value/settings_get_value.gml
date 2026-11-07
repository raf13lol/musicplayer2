function settings_get_value(struct, key_name, default_value)
{
    if (!struct_exists(struct, key_name))
        return default_value;
    
    var val = struct[$ key_name];
    if (typeof(val) != typeof(default_value))
        return default_value;
    
    return val;
    
}