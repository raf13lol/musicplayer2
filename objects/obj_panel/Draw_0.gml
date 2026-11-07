if (!surface_exists(surface))
    surface = surface_create(width, height);

surface_set_target(surface);
draw_clear_alpha(c_white, 0);

if (use_whole_panel)
    draw_text(0, 0, panel_name);
event_user(0);

surface_reset_target();

if (overlay && is_focused())
{
    draw_set_colour(c_black);
    draw_set_alpha(0.5);
    
    draw_rectangle(0, 0, room_width, room_height, false);

    draw_set_colour(c_white);
    draw_set_alpha(1);
}

draw_sprite_ext(
    spr_panel, 0, 
    x, y, 
    image_xscale, image_yscale, 
    image_angle, 
    is_focused() ? SELECTED_COLOUR : c_white,
    image_alpha
);

if (!use_whole_panel)
    draw_text(surf_x, surf_y - PANEL_GRID_SIZE, panel_name);
draw_surface(surface, surf_x, surf_y);