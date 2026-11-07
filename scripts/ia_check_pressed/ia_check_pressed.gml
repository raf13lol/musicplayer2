function ia_check_pressed(key)
{
    if (global.__ia_cps.current_key == key && global.__ia_cps.frame_time == global.frame_count)
        return global.__ia_cps.previous_result;
    
    var is_cur_key = global.__ia_cps.current_key == key;
    var pressed = is_cur_key ? keyboard_check(key) : keyboard_check_pressed(key);
    
    if (!pressed)
    {
        if (is_cur_key)
            ia_cps_struct_clear(global.__ia_cps);
        return false;
    }
    
    if (!is_cur_key)
    {
        ia_cps_struct_clear(global.__ia_cps, key);
        return true;
    }
    
    global.__ia_cps.hold_timer += delta_time / 1_000_000;
    var hold_timer = global.__ia_cps.hold_timer;
    
    if (hold_timer < IA_HOLD_START)
        return false;
    
    var intervals_past = floor((hold_timer - IA_HOLD_START) / IA_HOLD_INTERVAL);
    var step_interval = IA_BASE_STEP_INTERVAL - intervals_past;
    if (step_interval <= 1)
        return true;
    
    var res = global.__ia_cps.step_counter++ % step_interval == 0;
    global.__ia_cps.frame_time = global.frame_count;
    global.__ia_cps.previous_result = res;
    return res;
}