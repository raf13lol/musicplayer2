function settings_init_keybinds(settings, struct)
{
    var names = struct_get_names(settings);
    var name_count = struct_names_count(settings);
    
    for (var i = 0; i < name_count; i++)
    {
        var name = names[i];
        var value = settings_get_value(struct, name, settings[$ name]);
        if (typeof(value) == "struct")
        {
            settings_init_keybinds(settings[$ name], value);
            continue;
        }
        
        var key = settings_string_to_key(value);
        if (key == vk_nokey)
            continue;
        settings[$ name] = key; 
    }
}