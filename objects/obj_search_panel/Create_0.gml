use_whole_panel = true;
event_inherited();

default_visible = true;
panel_id = "search";
panel_name = "search songs";

textbox_init(
// on update
function (text, control_pressed)
{
    search_term = text;
    event_user(1); // update search
},
// on enter
function (text, control_pressed)
{
    if (search_results_length == 0)
        return;
        
    var songs_to_add;
    
    var song_pos = array_get_index(global.sf_relative_songs_found, search_results[vertical_selected]);
    var selected_song = global.sf_songs_found[song_pos];
    if (!control_pressed)
        songs_to_add = [selected_song];
    else 
        songs_to_add = array_filter(global.sf_songs_found, function(_, i)
        {
            return array_contains(search_results, global.sf_relative_songs_found[i]);
        });
    
    
    var len = array_length(songs_to_add);
    var added_song = false;
    with (obj_song_player)
    {
        for (var i = 0; i < len; i++)
        {
            var song = songs_to_add[i];
            if (array_contains(current_queue, song))
                continue;
            
            array_push(current_queue, song);
            added_song = true;
        }
        
        var shift_pressed = keyboard_check(vk_shift);
        
        var shuffle_enabled = shuffle_mode != shuffle_type.none;
        var song_index = array_get_index(current_queue, selected_song);
        if (added_song)
        {
            if (shuffle_enabled)
            {
                if (!shift_pressed)
                    queue_order_start = song_index;
                else
                    queue_order_start = current_sound != noone ? current_queue_order[current_queue_index] : noone;
            }
            
            event_user(4); // create queue order
        }
        
        if (shift_pressed)
            continue;
        current_queue_index = array_get_index(current_queue_order, song_index);
        event_user(0); // play sound
    }
}
    
);

search_term = "";
previous_search_term = undefined;
search_results = global.sf_relative_songs_found;
search_results_length = array_length(search_results);
event_user(1);

search_selected = global.settings.default_search_open;
search_key = global.settings.keybinds.toggle_search;

vertical_selected = 0;

frame_counter = 0;