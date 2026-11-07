function ia_cps_struct_clear(struct, new_key = -1)
{
    struct.current_key = new_key;   
    struct.hold_timer = 0;   
    struct.step_counter = 0;   
    struct.frame_time = current_time;   
    struct.previous_result = true;   
}