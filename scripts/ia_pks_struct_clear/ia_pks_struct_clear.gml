function ia_pks_struct_clear(struct, exclude_hash)
{
    var names = struct_get_names(struct);
    var name_count = struct_names_count(struct);
    
    var exclusion_defined = !is_undefined(exclude_hash);
    for (var i = 0; i < name_count; i++)
    {
        var hash = variable_get_hash(names[i]);
        if (exclusion_defined && hash == exclude_hash)
            continue;
        struct_set_from_hash(struct, hash, 0);
    }   
}