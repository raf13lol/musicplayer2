///@desc Draw event
var length = array_length(global.playlist_names);
if (length == 0)
{
    draw_text(0, 0, "no playlists");
    exit;
}

var focus = is_focused();
var index = vertical_selection_get_index(vertical_selected, grid_height, length);
var draw_repeats = vertical_selection_get_draw_repeats(index, grid_height, length);
for (var i = 0; i < draw_repeats; i++)
{
    var position = i + index;
    draw_text_selected(
        0, i * 16, global.playlist_names[position], 
        focus && vertical_selected == position
    );
}