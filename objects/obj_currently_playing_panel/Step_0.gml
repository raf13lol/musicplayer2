event_inherited();
if (!is_focused())
    exit;

var horizontal_dir = ia_get_horizontal_dir();
var vertical_selected_dir = ia_get_vertical_dir();
vertical_selected = wrap_value(vertical_selected + vertical_selected_dir, 0, 3);

var ctrl_held = keyboard_check(vk_control);
var select_pressed = ia_check_select_pressed();
var has_sound_playing = obj_song_player.current_sound != noone;

switch (vertical_selected) 
{
    // playback bar
    case 0:
        if (!has_sound_playing || horizontal_dir == 0)
            break;
        
        var song_pos = obj_song_player.get_position();
        song_pos += (ctrl_held ? 1 : 10) * horizontal_dir * 1000;
        
        if (song_pos < obj_song_player.current_sound_length)
        { 
            obj_song_player.set_position(max(song_pos, 0));
            break;
        }
        
        with (obj_song_player)
        {
            if (!paused)
                event_user(7); // sound ended
        }
        break;
    
    // volume
    case 1:
        with (obj_song_player)
        {
            if (select_pressed)
            {
                update_saved_playback_options("volume", volume);
                break;
            }
            
            if (horizontal_dir == 0)
                break;

            volume += (ctrl_held ? 0.01 : 0.05) * horizontal_dir;
            volume = max(volume, 0.01);
            saved_volume = volume;
            event_user(1); // Update sound props
        }
        break;
    
    // speed/pitch
    case 2:
        with (obj_song_player)
        {
            if (select_pressed)
            {
                update_saved_playback_options("pitch", pitch);
                break;
            }
            
            if (horizontal_dir == 0)
                break;

            pitch += (ctrl_held ? 0.01 : 0.05) * horizontal_dir;
            pitch = max(pitch, 0.01);
            saved_pitch = pitch;
            event_user(1); // Update sound props
        }
        break;
    
    // playback options
    case 3:
        horizontal_selected = wrap_value(horizontal_selected + horizontal_dir, 0, 5);
        
        if (!select_pressed)
            break;
        
        with (obj_song_player)
        {
            switch (other.horizontal_selected) 
            {
                // previous track / restart track
                case 0:
                    // previous track
                    event_user(6); // previous track
                    break;
                // play/pause 
                case 1:
                    event_user(3); // toggle pause
                    break;
                // next track
                case 2: 
                    event_user(5); // play next track
                    break;
                case 3:
                    ab_start_pos = noone;
                    ab_end_pos = noone;
                    break;
                // AB repeat start
                case 4:
                    if (current_sound == noone)
                        break;
                    
                    ab_start_pos = get_position();
                    break;
                // AB repeat end
                case 5:
                    if (current_sound == noone)
                        break;
                    
                    if (ab_start_pos != noone)
                        ab_end_pos = get_position();
                    break;
            }
        }
        break;
}