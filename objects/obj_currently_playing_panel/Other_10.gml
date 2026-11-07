var focused = is_focused();
var vs = focused ? vertical_selected : -1;

var path = "";
var pos = 0;
var length = 0;
var ab_start = noone;
var ab_end = noone;
with (obj_song_player)
{
    if (current_sound == noone)
        break;
    
    path = current_sound_path;
    pos = get_position();
    length = current_sound_length;
    ab_start = ab_start_pos;
    ab_end = ab_end_pos;
}

var audio_file_name = "no song";
var relative_audio_file_path = "";

if (path != "")
{
    audio_file_name = filename_name_without_ext(path);
    relative_audio_file_path = filename_handle_relative_path(path, global.sf_combined_directories);
}

draw_text(0, 0, audio_file_name);
draw_text(0, 16, relative_audio_file_path);
draw_text(0, 32, $"{string_format_time(pos)}/{string_format_time(length)}");

var percentage = length == 0 ? 0 : pos / length;
var playhead_selected = vs == 0;
var playhead_colour = playhead_selected ? SELECTED_COLOUR : c_white;

draw_healthbar(
    8, 54, width - 8, 58, percentage * 100, 
    c_dkgrey, playhead_colour, playhead_colour, 
    0, true, true
);

draw_set_colour(playhead_colour);
draw_circle(percentage * (width - 16) + 8, 56, 8, false);
draw_set_colour(c_white);

draw_text_selected(
    0, 64, $"volume: {string_format(obj_song_player.volume * 100, 2, 0)}%", 
    vs == 1
);

draw_text_selected(
    0, 80, $"speed/pitch: {string_format(obj_song_player.pitch, 1, 2)}x",
    vs == 2
);

var playback_options_selected = vs == 3;
var hs = playback_options_selected ? horizontal_selected : -1;

var pob_x_gap = 20;
var pob_y_pos = 96;
draw_sprite_colour(spr_pob_previous_track,  0,                                      pob_x_gap * 0, pob_y_pos, hs == 0 ? SELECTED_COLOUR : c_white);
draw_sprite_colour(spr_pob_play_pause,      obj_song_player.paused || path == "",   pob_x_gap * 1, pob_y_pos, hs == 1 ? SELECTED_COLOUR : c_white);
draw_sprite_colour(spr_pob_next_track,      0,                                      pob_x_gap * 2, pob_y_pos, hs == 2 ? SELECTED_COLOUR : c_white);
draw_sprite_colour(spr_pob_ab_repeat_clear, 0,                                      pob_x_gap * 4, pob_y_pos, hs == 3 ? SELECTED_COLOUR : c_white);

var a_colour = ab_start != noone ? c_white : PLACEHOLDER_COLOUR;
var b_colour = ab_end != noone ? c_white : PLACEHOLDER_COLOUR;
var ab_text_width = 80;

a_colour = hs == 4 ? SELECTED_COLOUR : a_colour;
b_colour = hs == 5 ? SELECTED_COLOUR : b_colour;

draw_set_halign(fa_center);

draw_text_colour_simple(
    pob_x_gap * 5 + (ab_text_width div 2), pob_y_pos, 
    ab_start != noone ? string_format_time(ab_start) : "A",
    a_colour
);

draw_text(pob_x_gap * 5 + (ab_text_width + 16), pob_y_pos, "-");

draw_text_colour_simple(
    pob_x_gap * 5 + (ab_text_width + 32) + ab_text_width div 2, pob_y_pos, 
    ab_end != noone ? string_format_time(ab_end) : "B",
    b_colour
);

draw_set_halign(fa_left);