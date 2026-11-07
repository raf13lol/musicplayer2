if (ia_keyboard_check_pressed_direct(win_system_keys.media_play_pause, alt_play_pause_key))
    event_user(3); // toggle pause
if (ia_keyboard_check_pressed_direct(win_system_keys.media_stop, alt_stop_key))
    event_user(8); // clear queue
if (ia_keyboard_check_pressed_direct(win_system_keys.media_previous_track, alt_previous_track_key))
    event_user(6); // previous track / start
if (ia_keyboard_check_pressed_direct(win_system_keys.media_next_track, alt_next_track_key))
    event_user(5); // next track

if (current_sound != noone && !paused && !current_sound_added_play)
{
    current_sound_played += (delta_time / 1_000) * pitch;
    if (current_sound_played >= current_sound_length * global.settings.percentage_played_needed)
    {
        current_sound_added_play = true;
        plays_add(current_sound_path);
    }
}

if (ab_start_pos == noone || ab_end_pos == noone)
    exit;

var pos = get_position();
if (pos >= ab_end_pos || pos < ab_start_pos)
    set_position(ab_start_pos);