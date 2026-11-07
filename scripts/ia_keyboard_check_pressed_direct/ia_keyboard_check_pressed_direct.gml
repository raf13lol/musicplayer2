function ia_keyboard_check_pressed_direct(key, alt_key_pressed)
{
    var hash = variable_get_hash(key);
    var previous_key = false;
    
    if (!struct_exists_from_hash(global.__ia_pks, hash))
        struct_set_from_hash(global.__ia_pks, hash, previous_key);
    else
        previous_key = struct_get_from_hash(global.__ia_pks, hash);
    
    var direct = keyboard_check_direct(key);
    var return_value = !previous_key && direct;
    
    struct_set_from_hash(global.__ia_pks, hash, direct);
    return return_value || keyboard_check_pressed(alt_key_pressed);
}