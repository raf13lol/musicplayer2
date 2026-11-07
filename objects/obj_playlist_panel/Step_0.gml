event_inherited();
if (!is_focused())
    exit;

var playlists_length = array_length(global.playlist_names);
vertical_selection_update(playlists_length, grid_height);

var select_pressed = ia_check_select_pressed();
if (select_pressed && playlists_length > 0)
{
    var shift_pressed = keyboard_check(vk_shift);
    var playlist_name = global.playlist_names[vertical_selected];
    var playlist = global.playlists[$ playlist_name];
    
    with (obj_song_player)
    {
        if (shift_pressed)
        {
            var len = array_length(playlist);
            var changed = false;
            for (var i = 0; i < len; i++)
            {
                var sound = playlist[i];
                if (array_contains(current_queue, sound))
                    continue;
                
                array_push(current_queue, sound);
                changed = true;
            }
                
            if (changed)
                event_user(9); // update queue order
            break;
        }
            
        current_queue = variable_clone(playlist);
        event_user(4); // create queue order
        
        current_queue_index = 0;
        event_user(0); // play sound
    }
}

if (keyboard_check_pressed(vk_backspace) && playlists_length > 0)
    playlist_remove(global.playlist_names[vertical_selected]);