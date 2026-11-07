toggle_key = vk_f12;
default_visible = true;
panel_id = "default";
panel_name = "unnamed";

panel_index = 0;

overlay = false;
focused = false;
is_focused = function()
{
    if (self.overlay)
        return visible;
    return !global.panel_overlay_open && self.focused
}

x_offset = x + PANEL_PADDING;
y_offset = y + PANEL_PADDING + PANEL_GRID_SIZE * !use_whole_panel;

width = sprite_width - PANEL_PADDING * 2;
height = sprite_height - PANEL_PADDING * 2 - PANEL_GRID_SIZE * !use_whole_panel;

grid_width = width div PANEL_GRID_SIZE;
grid_height = height div PANEL_GRID_SIZE;

surface = noone;
surf_x = x_offset;
surf_y = y_offset;

show = function()
{
    visible = true;
    if (overlay)
    {
        global.panel_overlay_open = true;
        return;
    }
    
    ini_open(PANELS_INI_FILE);
    ini_write_real(panel_id, "visible", visible);
    ini_close();
}

hide = function()
{
    visible = false;
    focused = false;
    
    ini_open(PANELS_INI_FILE);
    
    if (overlay)
    {
        global.panel_overlay_open = false;
        ini_write_real(panel_id, "seen", true);
    }
    else
        ini_write_real(panel_id, "visible", visible);
    
    ini_close();
}

toggle_visibility = function()
{
    if (visible)
        hide();
    else
        show();
}