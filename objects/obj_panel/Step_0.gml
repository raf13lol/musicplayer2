if (toggle_key == vk_nokey)
    exit;

var pressed = ia_check_pressed(toggle_key); 
if (!pressed || (global.panel_overlay_open && (!overlay || !visible)) || global.panel_disable_switch)
    exit;

if (visible && (!keyboard_check(vk_shift) && !overlay))
{
    if (focused)
    {
        focused = false;
        exit;
    }
    
    with (obj_panel)
        focused = false;
    focused = true;
    exit;
}

toggle_visibility();