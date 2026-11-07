var pressed = ia_check_pressed(switch_panel_key);
if (!pressed || global.panel_disable_switch)
    exit;
// >"keyboard_string only contains printable characters"
// >keyboard_string contains \t
// ???
keyboard_string = "";

var panel_count = instance_number(obj_panel);
var current_index = -1;

with (obj_panel)
{
    if (!is_focused())
        continue;
    
    current_index = panel_index;
    break;
}

var next_panel = true;
var loop_counter = 0;
while (next_panel)
{
    if (loop_counter++ > panel_count)
        exit;
    
    next_panel = false;
    
    current_index++;
    current_index %= panel_count;
    
    with (obj_panel)
    {
        if (panel_index != current_index)
            continue;
        
        if (overlay || !visible)
            next_panel = true;
        break;
        
    }
}
with (obj_panel)
    focused = panel_index == current_index;