event_inherited();

var queue_len = array_length(obj_song_player.current_queue);
vertical_selected = clamp(vertical_selected, 0, queue_len); 
if (!is_focused())
    exit;

var control_pressed = keyboard_check(vk_control);
var shift_pressed = keyboard_check(vk_shift);
var backspace_pressed = ia_check_pressed(vk_backspace);
var selected_pressed = ia_check_select_pressed();

var horizontal_selected_dir = ia_get_horizontal_dir();

var previous_vs = vertical_selected;
var vertical_selected_dir = vertical_selection_update(queue_len + 1, queue_grid_height);
if (vertical_selected_dir != 0 
    && shift_pressed 
    && previous_vs > 0 
    && vertical_selected > 0)
{
    previous_vs--;
    var vs = vertical_selected - 1;
    
    with (obj_song_player)
    {
        if (shuffle_mode != shuffle_type.none)
            array_swap(current_queue_order, previous_vs, vs);
        else
            array_swap(current_queue, previous_vs, vs);
        
        if (current_queue_index == previous_vs || current_queue_index == vs)
            current_queue_index ^= (previous_vs ^ vs);
    }   
}

var pob_options_selected = vertical_selected == 0;
if (!pob_options_selected)
{
    var queue_selected = vertical_selected - 1;
    with (obj_song_player)
    {
        if (selected_pressed)
        {
            current_queue_index = queue_selected;
            event_user(0); // play sound
        }
        else if (backspace_pressed)
        {
            if (!control_pressed)
            {
                remove_track_from_queue(queue_selected);
                continue;
            }
            
            var ever_deleted_sound = false;
            while (queue_selected-- >= 0)
                ever_deleted_sound |= remove_track_from_queue(0, false);
            
            shuffle_perserve_index = !ever_deleted_sound;
            event_user(9); // update queue order 
            
            other.vertical_selected = 1;
        }
    }
    exit;
}

if (horizontal_selected_dir != 0)
    horizontal_selected = wrap_value(horizontal_selected + horizontal_selected_dir, 0, 4);
    
if (!selected_pressed)
    exit;

var button_direction = shift_pressed ? -1 : 1;
with (obj_song_player)
{
    switch (other.horizontal_selected) 
    {
        // next play mode
        case 0:	
            next_play_mode = wrap_value(next_play_mode + button_direction, 0, next_play_type.__max - 1);
            break;
        // loop mode
        case 1:
            loop_mode = wrap_value(loop_mode + button_direction, 0, loop_type.__max - 1);
            break;
        // shuffle mode
        case 2:
            shuffle_mode = wrap_value(shuffle_mode + button_direction, 0, shuffle_type.__max - 1);
            
            shuffle_perserve_index = current_sound != noone;
            event_user(9); // update queue order
            break;
        // clear queue
        case 3:
            event_user(8); // clear queue
            break;
        // send to playlist
        case 4:
            if (queue_len == 0)
                break;
            
            obj_textbox_overlay_panel.open("playlist name", "playlist name here",
            method(self, function(name)
            {
                playlist_add(name, current_queue);
            }),
            method(self, function(name)
            {
                ini_open(PLAYLISTS_INI_FILE);
                
                if (ini_section_exists(name))
                    return [false, "playlist already exists"];
                
                ini_close();
                return [true];
            })
            );
            break;
    }
}