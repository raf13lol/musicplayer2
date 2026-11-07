function vertical_selection_update(length, height, condition = true)
{
    var vertical_selected_dir = ia_get_vertical_dir();
    if (!condition || vertical_selected_dir == 0 || length == 0)
        return 0;
    
    var previous_vs = vertical_selected;
    
    if (keyboard_check(vk_control))
        vertical_selected_dir *= height div 2;
    vertical_selected += vertical_selected_dir; 
    
    vertical_selected_dir = sign(vertical_selected_dir);
    if (previous_vs == 0 && vertical_selected_dir == -1)
        vertical_selected = length - 1;
    if (previous_vs == length - 1 && vertical_selected_dir == 1)
        vertical_selected = 0;

    vertical_selected = clamp(vertical_selected, 0, length - 1); 
    
    return vertical_selected_dir;
}