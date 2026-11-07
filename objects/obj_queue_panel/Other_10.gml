///@desc Draw event
var focus = is_focused();
var hs = !focus || vertical_selected > 0 ? -1 : horizontal_selected;
var pob_x_gap = 20;
var pob_y_pos = 0;
draw_sprite_colour(spr_pob_next_play_mode,  obj_song_player.next_play_mode, pob_x_gap * 0, pob_y_pos, hs == 0 ? SELECTED_COLOUR : c_white);
draw_sprite_colour(spr_pob_loop_mode,       obj_song_player.loop_mode,      pob_x_gap * 1, pob_y_pos, hs == 1 ? SELECTED_COLOUR : c_white);
draw_sprite_colour(spr_pob_shuffle_mode,    obj_song_player.shuffle_mode,   pob_x_gap * 2, pob_y_pos, hs == 2 ? SELECTED_COLOUR : c_white);
draw_sprite_colour(spr_pob_stop,            0,                              pob_x_gap * 3, pob_y_pos, hs == 3 ? SELECTED_COLOUR : c_white);
draw_sprite_colour(spr_pob_playlist,        0,                              pob_x_gap * 4, pob_y_pos, hs == 4 ? SELECTED_COLOUR : c_white);

var queue_len = array_length(obj_song_player.current_queue);
if (queue_len == 0)
{
    draw_text(16, queue_y_offset, "no songs");
    exit;
}

var queue_selected = vertical_selected - 1; 
var queue_index = vertical_selection_get_index(queue_selected, queue_grid_height, queue_len);
var queue_draw_repeats = vertical_selection_get_draw_repeats(queue_index, queue_grid_height, queue_len);
with (obj_song_player)
{
    for (var i = 0; i < queue_draw_repeats; i++)
    {
        var index = i + queue_index;
        var song = current_queue[current_queue_order[index]];
        
        var playing = current_queue_index == index;
        var selected = focus && queue_selected == index;
        
        var y_pos = i * other.queue_spacing + other.queue_y_offset;
        if (selected)
            draw_set_colour(SELECTED_COLOUR);
        if (playing)
            draw_text(0, y_pos, ">");
        
        draw_text(16, y_pos, filename_name_without_ext(song));
        draw_text(16, y_pos + 16, filename_handle_relative_path(song, global.sf_combined_directories));
        draw_set_colour(c_white);
    }
}
