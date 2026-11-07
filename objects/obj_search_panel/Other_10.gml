var focus = is_focused();
textbox_draw(string_width(panel_name + "  "), 0, "search term here", focus && search_selected)

if (search_results_length == 0)
{
    draw_text(0, 16, "no results");
    exit;
}

var index = vertical_selection_get_index(vertical_selected, grid_height, search_results_length);
var repeats = vertical_selection_get_draw_repeats(index, grid_height, search_results_length);
for (var i = 0; i < repeats; i++)
{
    var position = index + i;
    draw_text_selected(
        0, (i + 1) * 16, search_results[position], 
        focus && vertical_selected == position
    );
}