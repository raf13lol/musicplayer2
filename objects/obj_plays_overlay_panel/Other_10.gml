///@desc Draw event

var list_type_text = "";
var time_period_text = "";

switch (list_type)
{
    case plays_list_type.month:
        list_type_text = "month";
        time_period_text = $"{month_to_string(month_selected)} {year_selected}";
        break;
    case plays_list_type.year:
        list_type_text = "year";
        time_period_text = string(year_selected);
        break;
    case plays_list_type.all_time:
        list_type_text = "all-time";
        time_period_text = "all-time";
        break;
}

draw_text_selected(0, 0, list_type_text, vertical_selected == 0);
draw_text_selected(0, 16, time_period_text, vertical_selected == 1);

var y_offset = 32 + 4;

if (plays_length == 0)
{
    draw_text(0, y_offset, "no plays yet!");
    exit;
}

var plays_selected = vertical_selected - 2;
var index = vertical_selection_get_index(plays_selected, plays_height, plays_length);
var repeats = vertical_selection_get_draw_repeats(index, plays_height, plays_length);

var character_width = string_width("M");
var max_song_length = (width div character_width) - 8; // -7 because 100.00% percentage would have 7 chars, -1 for spacing
for (var i = 0; i < repeats; i++)
{
    var position = index + i;
    var play = plays[position];
    
    var y_pos = y_offset + 32 * i; 
    
    if (plays_selected == position)
        draw_set_colour(SELECTED_COLOUR);
    
    draw_text(0, y_pos, string_shorten(filename_name_without_ext(play.song), max_song_length));
    draw_text(0, y_pos + 16, string_shorten(play.song, max_song_length));
    
    draw_set_halign(fa_right);
    
    draw_text(width, y_pos, play.play_count);
    draw_text(width, y_pos + 16, $"{string_format(play.play_percentage * 100, 1, 2)}%");
    
    draw_set_halign(fa_left)
    draw_set_colour(c_white);
}

if (plays_length > 0)
    draw_text(0, height - 16, $"total plays: {total_plays}");